Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B812739D6E5;
	Wed, 23 Sep 2026 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152451; cv=fail; b=rIwxas5DeGyHu0XbsLoWLNwaF7e+PnXS+Xbziqf4M7x7dgdfuzqD1tfM9q/EyfvntxM37oo7Y0OEFWmroguewJrpo+5381Z6NRohQttZIkxRf+Z8mOrXrJk2hUt26JQGVClA/LdW2oNgwEPmBIzuOuVNRw6OIZZ5IeFAviPKWqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152451; c=relaxed/simple;
	bh=O8W92h+7bI+0muQRYzEX+thDD1FK9C8LDwN/pBoneR4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GX8bZv24M7C5/LAeX3a6r6I5pu4clUZKi79SGyD+OaI3/Fg1FXmuSCEgjaHAM0WQzgV1F981BtLsz9ef/d2/q0gA5laxVIo2SJcf5ozVs5wj/4tuvAKswCluFI1RPm9fItahyE7DWnXdXqqqk5dVebn2+FKAHic9emR0ngjMAww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBkZdAIF2lnm9887I/OSJjFmMULyEVQONjWJEdT9EeToDiEkuDntykzPjLeUTJlWovYPNU1mCsfTrN7d41LHAJJbd053M2Bi4/ivWxK8eAWx422GgOV37vEWUUzpmWwW3fypoNiqkbzmAqi75MDN2gaFGjXhYtMVr6AB+G4ueXNGc7oM2i4b9XwD41bzSQJc7Ft6ihk2gpAwqGImryenx3Z/Xhk2nMuhE42W+ztrez9UC5jPDn4r+THtZeeeMrNdvyTPQorktzt+7hVpf9UHNJIZteLa7QQIWd6dN7cN/Qtsfnn1KPV6klkyFHwWBvL6n/ljSvbBHSQ8nL58oBrXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irnVDWFttz1e//c8BfuslPvLUHHurWw+n7z2NsqSBtA=;
 b=evLzOvUhAB6nVwKUHTlF3YyCZg0pf843tb+PQ5epkMJFyoVXKNtkU4ZaSvO5j2G0a/MHWOyo2qQVFg5jp3lAOlvRCAa1FccbpFAqsYqULVFdg1sczF/KEekVBdqr3vncw5gadNlNZkPpyMFoIJA3odzsXJYOvZgIJMfh3f4MhXvzIMHGKFim+g7EUzWGxHobjINGBQ4q+z+qC5uqZvryezYuS6zbbO3ckgBO3kCtdHNZcXmo64DE4u38lC8VkhtITr/4RDsUsCjv7C3hsuqkPpJTE4CtAAXqgCOuw24fsnXrVw1ct45/Jbh7B3mUjFTcw2mvmG1CS65jfVkBWogB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23) by BJXPR01MB0517.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 07:01:14 +0000
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 ([fe80::e644:7bf5:5a3c:e548]) by
 BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn ([fe80::e644:7bf5:5a3c:e548%3])
 with mapi id 15.21.0451.014; Wed, 23 Sep 2026 07:01:14 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add RISC-V RPMI voltage service support
Date: Wed, 23 Sep 2026 15:00:11 +0800
Message-ID: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::32) To BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0838:EE_|BJXPR01MB0517:EE_
X-MS-Office365-Filtering-Correlation-Id: 1645cf11-36e5-4e59-d460-08df19407514
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|52116014|38350700014|921020|6133799003|10067099003|56012099006|5023799004|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WDp16nQzF1pEbTFwoiSV/oMoJ+YI/XB6btAzETtbOAFBcG/1Iqn0hAW7Q7zncj47h13wwNNvgEgPcySuxwY4Xvfhh/hMxnmK+bVxImSG35CLYad/wXm4zw1xqtNs/Y0fgMRKQzZTK6LS/bECEJjX0+c0ol1Tvh7yNgBShNrmidrnd0I0RmFQfYNXOCdORfUuF51GmtvfYDUZhgyDKRr4vKOW4P9exVRGpSkSOSqXcNMagxxeFtBBKEuKzyrA04o0jERCrHnyXSeQWPGNnd3AghzDzgKbF3Hs7xUBZP2jrw7h6HlsHv80xPvn93NtW06OeJgztxrx1KJ+nW/h9ALxza6DKyS9+K/xrpvm7kk5e/DHlUYT931wK2wj/ZVSUh4aQrRAEjPwMv+U6K5dqUPCQGn8Ex8MwSivrKyfray+RWZzSkca8S8/YFN5xKXjcYQf5Or7kE/SoME4U0A3OA6Ff7ObEf/wUJ/XL+VQIOGjH4KVYXXJdUHx9uk2k2LJ3QdLURxjobPsV3WOqDwbqcnWW/+jTGEIdCgYaDMrD497w0yAeK44hrEkFYhRpN99Gpg6qEDipymmnxSGP7sl31NaeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(52116014)(38350700014)(921020)(6133799003)(10067099003)(56012099006)(5023799004)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1fiW9I20bX0yXWKmbg8ZE+WPoBirMlUHqZU48iNDmFAFSgd2fEsRMQdQsVFU?=
 =?us-ascii?Q?ST5eepgq70OmZrK65s30NZW1XUVhIcDKHjeYHfcgLbCVPCel/yttPfKRFrrU?=
 =?us-ascii?Q?lu4UF2SJ1MJWoffjyPQzLtUjqkrIFq/+Ske4ryvdDuN1Xks10e3+TV4BaQ9t?=
 =?us-ascii?Q?y4wwUBZpv3J4aa3xoLeJ9Geaz3rTAKXxnBR8h/YTQYlQy2gJ7QbcrUVu8dIL?=
 =?us-ascii?Q?siOh9sYeWAI0vReo/qIc/6PR9EKk5bn1AeOM+Tnk6oPqujUym8YF4fbiq7AW?=
 =?us-ascii?Q?SK6FwXrQonUkos9hm12EhxXRkTs7XCRmbu5jQgM20wYjWWznB3KQ7ES7CHZf?=
 =?us-ascii?Q?1er5ocV2DuqENbDflfjoCn0MCzUX5CVoi4GM1Qo9hjYtF84+F1haAXpqsbOu?=
 =?us-ascii?Q?m+/5lknQoqcwJTPdZMobZ2rsfuVr/SyJfYHFKByueBsBV/V8uDk2YaPHcBwD?=
 =?us-ascii?Q?y0T8eL48tM3cKazPM2w0o5ZGJvh6/gcS++25X50GlCnh3iWobpTwP72uTKo6?=
 =?us-ascii?Q?FOqA9Yh7oZtQw81iFpe7T2ZMP1oTEH5Q5U7o9AZBSa2ogo2HezcE28O0yraz?=
 =?us-ascii?Q?M1lG/rkcrUWmz9X4HdNoUXHneXkmcGcd9upcPnIMuJ3CXejbnuVnWYLKrD7o?=
 =?us-ascii?Q?H0bvugCMsYbUKwqhQQi4CmhgA690IqFcBp0HR1sSxZtvu5yq4dO5oWMdSMwL?=
 =?us-ascii?Q?ttt0UdM25Fma5ntYIhWnGU/E0OG/q2VdWh/bCpwP8DxKKm1BAGnzMLjkQkVM?=
 =?us-ascii?Q?4A66kYazAwshgHWpYQxNl/lYP8EdxSqETR4T/0cj8KTDS9fYnOgUKl9+VvUH?=
 =?us-ascii?Q?gwbqOj2CmKLuD3z7ygUcoKq6ugGOliO5c/OwLfv0c57seV7QQRzilUsDpDDy?=
 =?us-ascii?Q?kZeFs0PR9W91cWMWTO0HILf7iaxIvu2ADsXPQFtHEh5eQ7KB0DcUdvLqhNLY?=
 =?us-ascii?Q?pGVZp22aXrgz/1n2A13rVS4al2aF++ZDtSE5xZeMFUXa8npHhcnsIQoeXtFA?=
 =?us-ascii?Q?e8eUYHi8z+3o+kYdo7w1Y55fsxmIi7hlFosDPCfNfNyGj59D5zm+pCSctShC?=
 =?us-ascii?Q?Doc8ZxLXdBBZhMTWuLdtHBIFwO/5erfZwflXXYqldLMvSW2Q6Y4fPPFlAlBa?=
 =?us-ascii?Q?VsrfuxF6M7gL7LFIughh5AqHOoMPb+AKKNXVrMqcvuvfjfgpRi8x6sjaIZtM?=
 =?us-ascii?Q?kpA//5c6zTt8mAK2Y3zrbhhEQ0L/ZlKa6HTDw4yELVVydZAOqCpMNUn7Xc3Y?=
 =?us-ascii?Q?/yuGs0qgMH658hdjBCB2dNIq3zRMmnPSXU2/U6iTMsLVTj7EFpR2vxs08MyK?=
 =?us-ascii?Q?q7XMT9LbVWK8QZOBdLwN/VogG3MSvVdASTwkYqjDg0PVnCVX202MgXEoiN7F?=
 =?us-ascii?Q?M5iUt5I/j2/IWHoca109YTn3w/nPm0Cs/eqOw5OqqGmpCKtID40r0w2KHRAn?=
 =?us-ascii?Q?1itzEuDLQZ9aww3kY12wOPPYYLsTIC5ErrMZ4ILVcpAzW7JH2E4UI9DzR6f2?=
 =?us-ascii?Q?K6k0r8XVbLSQ36vLmDEXp1ECmgbCF3Wedi6sWl3yrGa/jHjsi7EUHC3SLbUj?=
 =?us-ascii?Q?wYfS7u9h19taZ92Ucj/zUXUko6yhIHSaDkbaLhK79Kpp2i7xhrPPVI0ITBL2?=
 =?us-ascii?Q?md2gQBfGPy+cTJFXo33ILyDUto2h1rtNvOmRGykz00xQ9fLh+j6iJRnukVEV?=
 =?us-ascii?Q?3GWT7sYAdJaPWbkfwHATic8DvpwLYE0reOiXGpUH8NE8JnzRHemRGI/l1NIu?=
 =?us-ascii?Q?pbJtKjSiqXYM1hyL9z54Nbv3FVr8LyI=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1645cf11-36e5-4e59-d460-08df19407514
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:01:14.6213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kn/zMuIvmVG3vDbjR3CSayP7eZtfuhrK4yh5/ah8xsI+FzrRGRjm9ZtZ04cZVfLYdNLSxz4XMhout3Vqar3BemZb4HM/+dEgpJIAz5p0hi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0517

The RISC-V Platform Management Interface (RPMI) specification defines a
modular and extensible messaging protocol between the supervisor software
and a platform microcontroller (PuC). Among the service groups it defines
is the voltage service group (service group ID 0x00007), which allows the
supervisor to enumerate the voltage domains managed by the PuC, query
their attributes and supported levels, switch them on and off, and
get/set their voltage level.

This series adds supervisor-side support for that service group:

 - DT bindings for the regulator controller exposed to the supervisor
   ("riscv,rpmi-voltage") and for the SBI MPXY channel that the SBI
   implementation uses to expose the service group to the supervisor
   ("riscv,rpmi-mpxy-voltage"). The name, level format, supported
   levels and always-on capability of each domain are discovered at
   runtime, so none of them is described in DT. A consumer names a
   domain either through a "<name>-supply" phandle to a child of the
   optional "regulators" container, whose "reg" is the RPMI DOMAIN_ID,
   or by DOMAIN_ID alone through "voltage-domains" against the
   provider's "#voltage-domain-cells". A child may also give the
   board's regulator-min-microvolt and regulator-max-microvolt, which
   the PuC has no way to express.

 - A regulator driver, drivers/regulator/riscv-rpmi-regulator.c, which
   talks to the PuC over an SBI MPXY mailbox channel. At probe it
   checks the RPMI and service group versions, queries
   VOLT_GET_NUM_DOMAINS, then for each domain VOLT_GET_ATTRIBUTES and
   VOLT_GET_SUPPORTED_LEVELS and registers it as a regulator. Both
   level formats the specification defines are supported: discrete
   levels become a voltage table and linear (min, max, step) ranges
   become linear ranges. The constraints are built from the discovered
   levels and the always-on flag, with the transition latency as the
   settling time, and a DT child can only narrow them. Enable and
   disable go through VOLT_SET_CONFIG and voltage selection through
   VOLT_SET_LEVEL and VOLT_GET_LEVEL.

   The regulator core only follows "<name>-supply", so the driver
   exports devm_rpmi_voltage_supply_alias(), which resolves a
   "voltage-domains" entry and registers a supply alias for it. From
   then on the consumer and the OPP core on its behalf, uses the
   regulator API as for any other supply. fw_devlink does not know the
   property, so such a consumer is not ordered after the provider and
   defers until the provider has registered its domains.

 - A MAINTAINERS update adding the driver and its bindings to the RPMI
   device power entry, renamed "RISC-V RPMI DEVICE POWER AND VOLTAGE
   DRIVERS".

The series has a prerequisite: the RPMI device power series ("Add
RISC-V RPMI device power service support"), which has been applied for
next:

  https://lists.infradead.org/pipermail/linux-riscv/2026-September/099498.html

Patch 2 needs it for include/linux/mailbox/riscv-rpmi-message.h, where
the voltage service group definitions are added next to the device
power ones that series introduces. Patch 3 also extends the MAINTAINERS
entry it adds. The base-commit and prerequisite-patch-id lines below
identify the tree the series applies to.

Changes in v2:
 - Drop the three consumer nodes from the "riscv,rpmi-voltage" example.
   They carried made up "vendor,*" compatibles, which no schema matches
   and 'make dt_binding_check' therefore rejects, and the phy also
   carried "voltage-domains", which nothing gives a type. Both ways of
   naming a domain are now shown in the description instead, which is
   prose. A consumer of a domain named by DOMAIN_ID cannot appear in an
   example until a consumer binding describes the property itself.

   The driver and the MAINTAINERS patch are unchanged from v1.

v1: https://lore.kernel.org/r/20260922161156.1088153-1-joshua.yeong@starfivetech.com

Testing
=======

The series was tested under QEMU with the RPMI voltage service
implemented in firmware.

Components:

 - OpenSBI: v1.9
   https://github.com/riscv-software-src/opensbi

 - QEMU: the RPMI-enabled tree at
   https://github.com/yeongjoshua/qemu/tree/rpmi-v11.1.0

Kernel config: enable CONFIG_REGULATOR_RISCV_RPMI (default y on RISC-V
when MAILBOX is enabled) along with the SBI MPXY mailbox driver.

Run with:

  qemu-system-riscv64 \
      -M virt -m 2G -smp 4 \
      -bios fw_dynamic.bin \
      -kernel Image \
      -M rpmi=true \
      -nographic \
      -initrd rootfs-busybox.cpio \
      -append "root=/dev/ram rw console=ttyS0,115200 no_console_suspend mem=2048M earlycon=uart8250,mmio,0x10000000"

The emulated PuC advertises eight voltage domains, covering both level
formats, always-on and switchable domains, and domains the board
constrains in DT. They show up under /sys/class/regulator/ and in
/sys/kernel/debug/regulator/regulator_summary. Consumer test drivers,
kept out of this series, walked each domain to its highest and lowest
level, switched the switchable ones off and back on, and checked board
ranges and requests from several consumers sharing a rail, named both
through "<name>-supply" and through "voltage-domains", including
requests carried by an OPP table. All checks passed.

Joshua Yeong (3):
  dt-bindings: regulator: Add RPMI voltage service bindings
  regulator: Add RPMI voltage service
  MAINTAINERS: Add RISC-V RPMI voltage driver

 .../regulator/riscv,rpmi-mpxy-voltage.yaml    |   65 +
 .../regulator/riscv,rpmi-voltage.yaml         |  147 +++
 MAINTAINERS                                   |    6 +-
 drivers/regulator/Kconfig                     |   13 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/riscv-rpmi-regulator.c      | 1077 +++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |   14 +
 .../linux/regulator/riscv-rpmi-regulator.h    |   41 +
 8 files changed, 1363 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
 create mode 100644 drivers/regulator/riscv-rpmi-regulator.c
 create mode 100644 include/linux/regulator/riscv-rpmi-regulator.h


base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
prerequisite-patch-id: 907ffadca74a65c93ad38f428e002d2b34341067
prerequisite-patch-id: 5a4df94e66de2f63697891a0f1382fabd9df7b6f
prerequisite-patch-id: 0827a7050d08fea7deaab8e82f2dd16acdca507d
-- 
2.43.0

