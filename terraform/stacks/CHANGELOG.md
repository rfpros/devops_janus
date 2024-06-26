# Janus Stacks Changelog
<!--- @generated --->


## [0.1.1](https://github.com/rfpros/devops_janus/compare/tf-stacks-v0.1.0...tf-stacks-v0.1.1) (2024-06-26)


### Features

* Add admin Spacelift stack ([#294](https://github.com/rfpros/devops_janus/issues/294)) ([5d54b46](https://github.com/rfpros/devops_janus/commit/5d54b463c3cfd5733afd79fe2f56dfdac554f1c2)), closes [#292](https://github.com/rfpros/devops_janus/issues/292)
* Add auth and crypto stacks ([#317](https://github.com/rfpros/devops_janus/issues/317)) ([0ce4dda](https://github.com/rfpros/devops_janus/commit/0ce4ddac0f938ccf996468c3c564c6646fbbe4f4))
* Add CHANGELOG/README/Tests to github_oidc ([#308](https://github.com/rfpros/devops_janus/issues/308)) ([0d373c3](https://github.com/rfpros/devops_janus/commit/0d373c3d32339b491e8b4cbaca158bcfcd00f3ea)), closes [#300](https://github.com/rfpros/devops_janus/issues/300)
* Add network stack ([#291](https://github.com/rfpros/devops_janus/issues/291)) ([47eef0d](https://github.com/rfpros/devops_janus/commit/47eef0dad11ebb36fb2740dda4dc1dcc1d0b359d)), closes [#290](https://github.com/rfpros/devops_janus/issues/290)
* Add runners stack to Spacelift ([#333](https://github.com/rfpros/devops_janus/issues/333)) ([3ffcc9e](https://github.com/rfpros/devops_janus/commit/3ffcc9e2869812d36142d7adc4df96a357eeeedd)), closes [#278](https://github.com/rfpros/devops_janus/issues/278)
* Add stack for receiving webhooks ([#337](https://github.com/rfpros/devops_janus/issues/337)) ([87ae708](https://github.com/rfpros/devops_janus/commit/87ae708a68901faa6bdd4f5f3f4bea33b70f9818)), closes [#336](https://github.com/rfpros/devops_janus/issues/336)


### Bug Fixes

* Add TF_VAR_ prefix to spacelift dep refs ([#313](https://github.com/rfpros/devops_janus/issues/313)) ([6ebd3cb](https://github.com/rfpros/devops_janus/commit/6ebd3cb7239cc8580259226e6bdd96236e112f2e)), closes [#312](https://github.com/rfpros/devops_janus/issues/312)
* Allow passing apigateway and webhook roles ([#339](https://github.com/rfpros/devops_janus/issues/339)) ([b001444](https://github.com/rfpros/devops_janus/commit/b001444e1f03c8d2f90b6d08fd2f5cdb2fdaefe5)), closes [#338](https://github.com/rfpros/devops_janus/issues/338)
* Correct sid values for network resources ([#319](https://github.com/rfpros/devops_janus/issues/319)) ([6b2b380](https://github.com/rfpros/devops_janus/commit/6b2b3802feb9814ea8a946e1df9f62c076f182e9)), closes [#318](https://github.com/rfpros/devops_janus/issues/318)
* Network IAM configuration ([#327](https://github.com/rfpros/devops_janus/issues/327)) ([04180c5](https://github.com/rfpros/devops_janus/commit/04180c53c4576c7b197bb7219b7c38495231e5f1)), closes [#326](https://github.com/rfpros/devops_janus/issues/326)
* Pass KMS key to runners stack ([#335](https://github.com/rfpros/devops_janus/issues/335)) ([d46c0ea](https://github.com/rfpros/devops_janus/commit/d46c0ea0db64288dc97982caac238bb1322f593d)), closes [#334](https://github.com/rfpros/devops_janus/issues/334)
* Remove alias from AWS provider ([#295](https://github.com/rfpros/devops_janus/issues/295)) ([a88260c](https://github.com/rfpros/devops_janus/commit/a88260c38541b48d7f5c76dc28eabaac02a07dc0)), closes [#282](https://github.com/rfpros/devops_janus/issues/282)
* Remove apigateway caching ([#341](https://github.com/rfpros/devops_janus/issues/341)) ([787b742](https://github.com/rfpros/devops_janus/commit/787b742dd252d8f59d996f9932d46b40e9fe33b1)), closes [#340](https://github.com/rfpros/devops_janus/issues/340)
* Rename s3 access log logging resource ([#321](https://github.com/rfpros/devops_janus/issues/321)) ([159c888](https://github.com/rfpros/devops_janus/commit/159c88839e9d8803a81a1dde3ce693b838770ca9)), closes [#320](https://github.com/rfpros/devops_janus/issues/320)
* S3 access log versions expire after 30 days ([#297](https://github.com/rfpros/devops_janus/issues/297)) ([893c8eb](https://github.com/rfpros/devops_janus/commit/893c8eb0628b5b8b5dbfe18e0b61b1cd23999a9d)), closes [#296](https://github.com/rfpros/devops_janus/issues/296)
* Update network ACLs to use dynamic subnets ([#325](https://github.com/rfpros/devops_janus/issues/325)) ([b17688d](https://github.com/rfpros/devops_janus/commit/b17688d252812f2b8404361acce7b038eb4030a4)), closes [#324](https://github.com/rfpros/devops_janus/issues/324)


### Miscellaneous Chores

* **deps:** Bump hashicorp/aws in /terraform/stacks/admin ([#309](https://github.com/rfpros/devops_janus/issues/309)) ([9b520ed](https://github.com/rfpros/devops_janus/commit/9b520edd7bf2082857c95382ff7b1a89a67b1176))
* **deps:** Bump hashicorp/aws in /terraform/stacks/network ([#303](https://github.com/rfpros/devops_janus/issues/303)) ([e87406c](https://github.com/rfpros/devops_janus/commit/e87406ca079a9dedd39429d39483461fe19f50ea))
* **deps:** Update terraform spacelift to v1.14.0 ([#218](https://github.com/rfpros/devops_janus/issues/218)) ([e2a9c56](https://github.com/rfpros/devops_janus/commit/e2a9c5685f7a5389d7e74d86acd03deba53face4))

## 0.1.0 (2024-05-31)


### Features

* Add initial terraform/spacelift support ([#49](https://github.com/jhatler/janus/issues/49)) ([11370b7](https://github.com/jhatler/janus/commit/11370b74b8147df6496e3b807b1a78c7b3226164)), closes [#46](https://github.com/jhatler/janus/issues/46)
* Give terraform resources their own releases ([#192](https://github.com/jhatler/janus/issues/192)) ([714b460](https://github.com/jhatler/janus/commit/714b460ecab22fd131651d12462b29b3ef115614)), closes [#183](https://github.com/jhatler/janus/issues/183)


### Miscellaneous Chores

* **deps:** Update dependency @types/sinon to v10.0.20 ([#69](https://github.com/jhatler/janus/issues/69)) ([4754d30](https://github.com/jhatler/janus/commit/4754d304a80c7f2de2a5015fbcb74f6edfb69843))
* Initial empty commit ([0fd3265](https://github.com/jhatler/janus/commit/0fd32650d56b8bd4b5c12a74ab41f6da4b6ad26b))
