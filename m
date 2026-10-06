Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2122.outbound.protection.partner.outlook.cn [139.219.146.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A33C3BE0;
	Tue,  6 Oct 2026 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275649; cv=fail; b=jaEbay6g9vEFVxEJwghQQ2u5cdYredvm6PFGGIFF6+A1UMo4ZUS6V1cwMON2Gp7hfz5yRUFZYD454n62yP+HkK9Xc80CVOmi04OGz3B8vqsbD4WqT+tYAY8ZXPOfYHUQQ5GcR7y4LzQF5KruLUrt0r9nATCKRkEsSTvc0ZyHIn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275649; c=relaxed/simple;
	bh=51cRp3dC9Qrh+oRLClqfEPZN+mFx2ZvZ/Q7v2jE97WY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=M6HmPMJrpgHGJV2wMaoQstQM35+putrzzmEoOiEuHl/wx+eLqBUGNIVfMOAyBe7KrQs1n7H2rGoYDqnlO+fioAO5JkqshPe2oe5NETQzR56fmAzKC1v8yD9cnaYwO1xRk0Psc89dICTspi2z8ZOp083uiMB4wOxO67zY6BBkLwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/ozdqZGudldRlu+PYyhk62grTqcVkgZTh1zP+mNq9VoQQIDG6fUIFKlZlzyB1ThGBnE3fXcd3t9TvHOXfqx8OTu4moOi+6XzERzETIk6+P40lJwRTa9HCuf6Hl9H9o+nA0FCzWEoSNkd/aDXH4DnzeA80gG6IbREo0VWxGlo5zfrPdGgX+c+g1+g6cl5AgP5xK2H5QsbWtQRjx3yJWioZVpMpPdPeNeaxW3AIpYwk436i9djnI78e3EceOgEQ+hI4gNXEkLIBrAV9V/tF1OMMm5mmHUxok7zwVHaejg5JfYqTyRGev/f/9SrYhb6xOfScRVpXnVFurmDlhAx7U0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMPcPSL6G5oku3VTrja91cfgfcO7GsXJnURK/TBCChI=;
 b=ZYAq/d+KBUlEsnaesASWBysjAvAHazdYyiMz16r0hrfIrVkcpkvP2i/GdIp/rVeJesZC+Yv58TkoCXqSQgW35GyNPnIJXa8t+x0q3rI5g/XJFUt6jTUHOCBcbPj7SmdN8B+7QLtVlsHDYIaEEToJ+FxGqOO91GL8Cbl3cKBZQ4VsfvWmMtUpXDkJwoqRWRg4osA7mw5qzuAwoFtkQCCavgyF/Ha7EcG9O5tKi4vuWPI1QdYVrwcyvN0QhnBJEkI/YMsIrGeDEqZZGKwf/dcWGXUWly2Jc1USDbU4QMDLLgzxYpIlfCIiIw+1mf6W5YyFYhqQzYN/XQ5ccTAqRzk7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0556.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 08:33:53 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0472.016; Tue, 6 Oct 2026 08:33:53 +0000
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
Subject: [PATCH v3 0/3] Add RISC-V RPMI voltage service support
Date: Tue,  6 Oct 2026 16:32:56 +0800
Message-ID: <20261006083259.2206001-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::13) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0556:EE_
X-MS-Office365-Filtering-Correlation-Id: f73d298b-6802-4cf7-d501-08df23848d79
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|6133799003|18002099003|10067099003|3023799007|921020|56012099006|38350700014|5023799004;
X-Microsoft-Antispam-Message-Info:
	hox3JxMLATtw0wPG7Z/yVOXOwnkc/AyhO/mO0qvP7Rh5AL4CGPJCijgcYEdiX1grQf1D7tMAvMmlAf0yMb56/Vn3c/IjGN+J42qbyWhXyeF8Jl2XR4zx9U1bO8e/8yeSDzkkr8MzJUit9Ig/zneHnrZHl6V3XmTq+TJnVYUm32pr2czn3L8aroboY/wuvsPkpAyFi6vHguuBNHHiLPZSbv5gIkc8+1v1KxrYeynsTcEHbEXMsBFWOWYjD7AjhhG8uLwY4m/Vi7FjeOX5G9NMcEYg2zAEJDHryTeNie/FNLbFv91Mu+78emHnk4NUyBylpGA1t55abilZOCmFXM8qATWM6x44A+NHWf6Erg2fclZLlnVHYWhcJp5q6X1Q65EvJOKycGtqdRn4bjzT+rpvE6w3GdFHX1/yGrRyXc12LzHt4bHqxF47rtuxDCgAW0EtN+bIEzjiCM5eAM8qgdJco7RfNlbSt5ACP6OX4sDlJHuK+7Xq6CIJ5b7T9YJeG1hMvJhTiyhdjsHnYLRGcEDQctu+2V6tAmJPSsX5ocTLTWLdMLkPZugxAjvZ8Ab1Bafu2rpmFIpv2/OBsvDUhB5npQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(10067099003)(3023799007)(921020)(56012099006)(38350700014)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mOsgKsYTF6DxwnUoUMneu+2tgMxKqaQe9liQJlSXL+5JyqfOubceBCtf2TyO?=
 =?us-ascii?Q?BiUi+L0g/UqIcYIrn2Z5eBOPMeF9SDGTyEBC7lyYjKFd5zYvLu+h5k+8M4ea?=
 =?us-ascii?Q?Y4BAS2mqZ0IRAdm3Fbr9SfBWHGC7by33M3nk+PFFud4GAGrqPjk//iLcvpU/?=
 =?us-ascii?Q?XxCBi8t96osfR2yW0qu8eN5R1BPvt1gqFuPh0HmzUREN+D16Bsb5OXV94fox?=
 =?us-ascii?Q?4Hv+6O7kL/fLAIIVpHCoGraudld9ZshNQhDkBEKaPkcPGkSSadSTYXgzOA7Z?=
 =?us-ascii?Q?AO2nZNdRtvWFTcGePcRAWpmes6rMaLccK2qvdBdVPeL6x+5IljwLTLDqUSW0?=
 =?us-ascii?Q?ZBt1hPjs2znv9RGFaiGxcVorlpLEIvB49h5ZoqleVpBZr7Vpn9hinXOds7yK?=
 =?us-ascii?Q?7lrVpdPIvHar+2wQ/Ddhd085+FWfU42vdeKRAhHlhTx1CU9BdYvVrF1wYh26?=
 =?us-ascii?Q?mWkcMAEWldaqjuc1C1lOuPXLSBCrCpGsJAR5sR00QXM9z0eu/e1QabKHV58b?=
 =?us-ascii?Q?RmiMNTLR/fNMjoy1rYf/Rc7uZudY6BcF7xrA38CrzHCYFBZCv4dliIIn+Moa?=
 =?us-ascii?Q?d2wWfKXkljJuteLamKPYzi/2p88kqb8P5CacP49IOsoStuTePzzRjO98Ny9Z?=
 =?us-ascii?Q?x8zv9RhiOVaWjIpTNKgO57lAmlSmSbwenOhDG2hjrsMoiuyh+/wrDgyu+DYx?=
 =?us-ascii?Q?DBiIL8UmitAMexfa2ppNTAu1SagheMzBwJtn7xiffcfzSrNAvxNtwPv6Flmf?=
 =?us-ascii?Q?aAL3RzFm9l6HqwurYpPaxY2Dscl7+4hLuf7c64FtWn5nzz34hJ2127qMP5jq?=
 =?us-ascii?Q?qUS3NOiqRzGoWrgkwsKhO79chjJF607DQuT0r9lVisO6wLSSuTPP/N12sevk?=
 =?us-ascii?Q?LxcvxUxLr02ukslaOiUt4voJtdrcIdshA5z8mCI2tpIS5voCZ3tYS12zB7L1?=
 =?us-ascii?Q?8bJKm0uBNiIPhkcDTaRpS6d/NqEBAYtuwqjzOJ2h9vaV6pYxqodXfBS9N9vS?=
 =?us-ascii?Q?0UaT4cfViNNbyw5wYDfiwxBOBfdu8zZyPVqfGa0t0kHTd0vz+Qf+RQjrOtir?=
 =?us-ascii?Q?nOQVmT0pJSN4hMn+A4UqF/1fa9ohJtEn12n/8uI9fqWAaWrtdkyysx1hAsR/?=
 =?us-ascii?Q?+sy8AtZu4Bt47eXoNMLIFFJLNC8zCnt3l8DKJWWWiVEphS6IgSgXB10/nvXO?=
 =?us-ascii?Q?q1OpklwfyXFb5KtxBC/UlpsZbgQ6h8sdM+mtVQ7JE5r4BpN/IolVTrHiLkY0?=
 =?us-ascii?Q?yQssgfdnXomUFwA1Np8eocMQqRnf7SxgAaVCl1H6/51ZjBnpCq0RDXsz0yAE?=
 =?us-ascii?Q?bwq64Q1IbQRfBRvIjEMPvu/BrjuMmFKNq2jzucDFMN63zm4JzHoI+5DBa7Xp?=
 =?us-ascii?Q?u+70NU3m2UMDqWf+opaVBOpP+qxkGouoj4LELBPmkL7YuSuvROlcEJvTc7zC?=
 =?us-ascii?Q?vET6dEr4BUG5/rRUIfUxjWt7iD+ontBy3ajSVDCls1pZIqW+MCMM5RL+Hamx?=
 =?us-ascii?Q?qwxegJmAvoOZPD/llrHDEj8Kh/g67X7ZuHulTyDFwewl6P0TrLmF7cP7q9Dq?=
 =?us-ascii?Q?qm0uNKlqIKNDLXQNxWg/JRvC3Hx2RWFPFuZhOVqMA3D/lqXia0oigfL5HI45?=
 =?us-ascii?Q?VwMaX0BRHzGs/TA/y777vVaTzffb1xLKqkJ6PlrnlNYlFWHbeV/Pwgtqf0Ib?=
 =?us-ascii?Q?8RRZql4d5vEOs3PjB73d3WozhPZlHOfojvyhmUW0doQZ/r/noueB6/WutldC?=
 =?us-ascii?Q?19mRo9KUDBCY5QUeMW+6yYVhMdXym0k=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73d298b-6802-4cf7-d501-08df23848d79
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 08:33:53.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GWEPuhaZhLURChWQV+8ZxdIwGiNAdq9PKKjjGFgaqepwKPoJoVjKhI99ZxlzkrZOeAUahs/V5mSNTqUY1Sl+4ULbTRylq3p9k5PpAg1duA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0556

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
   domain through a "<name>-supply" phandle to a child of the optional
   "regulators" container, whose "reg" is the RPMI DOMAIN_ID. A child
   may also give the board's regulator-min-microvolt and
   regulator-max-microvolt, which the PuC has no way to express.

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

Changes in v3:
 - Drop "#voltage-domain-cells" and naming a domain by DOMAIN_ID through
   "voltage-domains". A consumer now names a domain only through a
   "<name>-supply" phandle to its child in the "regulators" container.
   The regulator core and fw_devlink already follow that phandle, so
   such a consumer is also ordered after the provider without any help
   from the driver. With it go devm_rpmi_voltage_supply_alias(), the
   provider list it searched, the per-domain supply name it aliased to,
   and include/linux/regulator/riscv-rpmi-regulator.h together with its
   MAINTAINERS entry.
 - Make the driver depend on "RISCV || COMPILE_TEST" and on MAILBOX
   separately, as the RPMI device power driver does, so a COMPILE_TEST
   build no longer selects it without MAILBOX.
 - Rebase onto v7.3-rc6.

v1: https://lore.kernel.org/r/20260922161156.1088153-1-joshua.yeong@starfivetech.com
v2: https://lore.kernel.org/r/20260923070014.1340761-1-joshua.yeong@starfivetech.com

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
ranges and requests from several consumers sharing a rail, each naming
it through "<name>-supply", including requests carried by an OPP table.
All checks passed.

Joshua Yeong (3):
  dt-bindings: regulator: Add RPMI voltage service bindings
  regulator: Add RPMI voltage service
  MAINTAINERS: Add RISC-V RPMI voltage driver

 .../regulator/riscv,rpmi-mpxy-voltage.yaml    |  65 ++
 .../regulator/riscv,rpmi-voltage.yaml         | 130 +++
 MAINTAINERS                                   |   5 +-
 drivers/regulator/Kconfig                     |  14 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/riscv-rpmi-regulator.c      | 893 ++++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |  14 +
 7 files changed, 1121 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
 create mode 100644 drivers/regulator/riscv-rpmi-regulator.c


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
prerequisite-patch-id: 907ffadca74a65c93ad38f428e002d2b34341067
prerequisite-patch-id: 5a4df94e66de2f63697891a0f1382fabd9df7b6f
prerequisite-patch-id: 0827a7050d08fea7deaab8e82f2dd16acdca507d
-- 
2.43.0

