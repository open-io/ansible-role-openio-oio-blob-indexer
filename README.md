[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-oio-blob-indexer.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-oio-blob-indexer)
# Ansible role `blob_indexer`

An Ansible role for OpenIO oio-blolb-indexer. Specifically, the responsibilities of this role are to:

- Install and configure

## Requirements

- Ansible 2.4+

## Role Variables


| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_blob_indexer_chunks_per_second` | `2` | ... |
| `openio_blob_indexer_gridinit_dir` | `"/etc/gridinit.d/{{ openio_blob_indexer_namespace }}"` | ... |
| `openio_blob_indexer_gridinit_file_prefix` | `""` | ... |
| `openio_blob_indexer_interval` | `300` | ... |
| `openio_blob_indexer_location` | `"{{ ansible_hostname }}.{{ openio_blob_indexer_serviceid }}"` | ... |
| `openio_blob_indexer_namespace` | `"OPENIO"` | ... |
| `openio_blob_indexer_provision_only` | `false` | ... |
| `openio_blob_indexer_report_interval` | `5` | ... |
| `openio_blob_indexer_serviceid` | `"0"` | ... |
| `openio_blob_indexer_volume` | `"/var/lib/oio/sds/{{ openio_blob_indexer_namespace }}/oio-blob-indexer-{{ openio_blob_indexer_serviceid }}"` | ... |
## Dependencies

No dependencies.

## Example Playbook

```yaml
- hosts: all
  become: true
  vars:
    NS: OPENIO
  roles:
    - role: repo
      openio_repository_no_log: false
      openio_repository_products:
        sds:
          release: "18.04"
    - role: namespace
      openio_namespace_name: "{{ NS }}"
    - role: gridinit
      openio_gridinit_namespace: "{{ NS }}"
      openio_gridinit_per_ns: true
    - role: oio-blolb-indexer
      openio_blob_indexer_namespace: "{{ NS }}"

```


```ini
[all]
node1 ansible_host=192.168.1.173
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License

GNU AFFERO GENERAL PUBLIC LICENSE, Version 3

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
