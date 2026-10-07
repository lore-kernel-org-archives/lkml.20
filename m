Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2092.outbound.protection.partner.outlook.cn [139.219.146.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ABE46D55C;
	Wed,  7 Oct 2026 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367287; cv=fail; b=kOU5rLFa3hPRK8cP/aCQdLr3TJMHx3J56TQJDxBzbBIP8ymVtkyRCdJoYH74aBOKH8sZbeokoH8WSRj0B6JYlPXvruHcFsb/BfuDpdff1IoadPOoijLUDit3sZTyXqbOvY7LPIZCO57mxKnStK25jg8VLNX9Hfu0zJXyHpgKLys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367287; c=relaxed/simple;
	bh=ywZojREeM0ZaYb5yqoQXJK2tphNyzmZK6tPAJ+GH9IY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Lw+mBW8/xAr2jgSuBniYOcYRm9KOvE6kKdwMAJs9cgVm/ib3ZL5epK4vbUuoYs0klkvzAq+JHqZ7kdF2MQb4JGe+NySBdFv6HoWo3kZnxfSOJmFfMmyJ1wB0yGfnBFwUdSTUxxyDhGF1X17aL3t2HVNqE+9oHobCBL7MueOug0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJhOdg/mWFJLDAP3kM0dJgqrsjTA82gFScB2As57B774lcpsPEP4zoB9fam62wH+tWbKoRDYhUqXJxAVcmzvz4WSKkhrJt0bH5735g3pmaNys4gUGZw15PNjKwx5T0UMYU/ATIbU+pnAkiHjCj4abUflstDBZ6M1dbsdbHYVrFgnLRx0npnPfCiiRKLhuO3gQNUQy/WRkVxB2mLTN9REgf6NogG1+7ZA2ATFnBN7IbNuVFzgpQZFEVdbo/bXnLBkzQJ2D/a3uiR90I26UWGMYkg5lAtnDZ1czItsXNgr0/JBdsSLnVAklQ3QT5a1aGwDMQ2B6boID2MfNBBuf1FLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBNz1fUdwV8cMeWsu0gMUIYKazQOVP6FmepA/ApCQUY=;
 b=nF4v+D4BUXCEOgG0zH/dSVk5s+P6Qr4hFE6/pFesVlN0T/vNQuwQmeZBHIosQIMNgtIvJmm2LFHXCxF+w+/xXVdxLSmdYnEd7Ef6GDAPkpIMUO/aZG6DcRhARMb8x5km8ghOp8enH4aWVNb9VU6P+7vzNffsBghgnxoTOWixzgn8IMOvoQkMWnywDTfe3rfSGEms71UCxjF6myp3wg6TiShN9vD1rQhm79PsdCQmOWRp1aNd0IYu1diND+teoW9/hWvyhhi1Ic905+ZBuV8xvP3MmnOM56pWq9nADHRgLj9zpkqtw7yv5ZxkG3TbgV9JVz9/bNGy7KgykLhzm8Pwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0796.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 7 Oct
 2026 10:01:05 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0472.016; Wed, 7 Oct 2026 10:01:05 +0000
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
Subject: [PATCH v4 0/3] Add RISC-V RPMI voltage service support
Date: Wed,  7 Oct 2026 18:00:17 +0800
Message-ID: <20261007100022.2512187-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0024.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::36) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0796:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4c4a82-9b53-439e-4e1f-08df2459e696
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|1800799024|7416014|376014|921020|38350700014|56012099006|3023799007|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6HLFwyCWoSDtixfDDdQ+SjLzmNgoUbT8jT8Vl1385+n9gLIiTrel27vxHYCLMe9MVxNYfoJFyqAkHOSqmqzFT4K+pziRdmNaSWN3XXo0BtOyMQGN6ixRRA8Ic6fhW7XkOrUlteW5IWycPMSUcI2NKlEyc76X4ekbIvuDbXCNJPM03v383AXyS9VNXXNl43a+U+88OQiK4YRCjLemP0JtVsorCBBRcpHS8nBr4ITuNnkR8glzF5vkyHFWF+0qciNjHfRQ2DolAxDa88lSMcNVFwfWt8Qyqds22UZYcTYFkrCAgcCROv06QG7pR8aiaAEfsll3+3Y4SIA88LcxuBqmY8WjoybOXPFDSrS/z7egk9PnkuGO+ioppGGkWaVlFxcIdWdc+ZR6XcXBc6VDB+bhZaqPegm6jffTokFFeJ25Uzr0EON9bCOB+QxO2/tZaO3VEIEQXuyJXCB9O5IYmJs0pj9xdlY5nm7wHMcI23O74L03+JeOUcAaLaG0CvDqjx2FtQ95y/AVQumEByOHrUGX5zixMmR/6u36mAJAO3DG8kpvHOBaI5QaRUEYkdlEXtXUCpJmXaT2AM48BMKM5/ptOQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(1800799024)(7416014)(376014)(921020)(38350700014)(56012099006)(3023799007)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PKof0a5Gd/G3EclgEwuDoAmL9LhLKFhK4fh4RJfjQtnh56j+yaf4/Kr2vv+q?=
 =?us-ascii?Q?FnqtECzpK9QQK3ymlCACRW4STsE33YjQjrlts2exT+e6mO7nN3DkkwCQe+Je?=
 =?us-ascii?Q?mhjcpy4DQ8LswLIXhsF3GAMgaGSQwl5Qa/GTcRhrcPO2sa0P27q2avReQrdk?=
 =?us-ascii?Q?A4gglBa9Jozfq2lx8gXfraOMCRcRPSWnvmpEfVxQ1Ou8/fqyS1kveFVGIBg7?=
 =?us-ascii?Q?7F4V+td2ivk35aJZOAi+/FKGpohu++v81y1C29NsYDHQ3H5fMCuLtDaJd39p?=
 =?us-ascii?Q?SQYR2nCi8e3cqhKHiqMAHEoWzxGZH9QxokoaE3a6ChxqTD8s8e1MjKfvHIc2?=
 =?us-ascii?Q?z5uvCzmm2c3uz6Frp0vhkHgir6tb4Pf+Yh9qQ7D6C8HIA/+PcdJENT/PMST9?=
 =?us-ascii?Q?ZivycnLV/02/2zJzv9siPZs34BAFpN8EUbTL4b3Sr526ARoiDMtsiFue/tkV?=
 =?us-ascii?Q?hg0G3ruqQiKfB9suMmud1S7v+g76R2wphPXdWZLWojww6tN+0pzrWMoGrPSS?=
 =?us-ascii?Q?EzeSutPw270Rg8xAWalzvmR0TtkUhbc74hUTdh+lv+ct+JRoUKLYHbnk5wgG?=
 =?us-ascii?Q?/eRddLPSp8GkPiAuXsZglDOpFel+ClEz9sdqvqi8QVmfGYuO8wAdHfJqJ4PI?=
 =?us-ascii?Q?TVlhsWwNyCjPqc9ZpFpdZvTzUoDd5FUkOI78wG07IvhRbukIBeTGhUkdlqH5?=
 =?us-ascii?Q?qRZu9T7aJuuz9jFoFcAQY3qHrPPi+hiqMNSsJ2AYhRs4os0+MRs6CZRv/Wnc?=
 =?us-ascii?Q?Gj4prU4Oidf6/rQcuockzvg+HpbB8Qi95b06RN1KBbzdkVJsDb1hJ/DsZDWa?=
 =?us-ascii?Q?FZrqjp0Irait4wpPgqCjNWSfgXq2S4HwT++nnPvMTvGNTDdVD8uG34hpvmWU?=
 =?us-ascii?Q?jJcdXoDuDb4l1h8R/JEn9VcugxhLYquMwd85TsPmKveuk60aOfiAV5ST0IQ8?=
 =?us-ascii?Q?cwPzD3ZXCo1evueAPqHnE0lqd3O1raNhw/XlAeRrOXTkxUMZ/QcyE7OixAAY?=
 =?us-ascii?Q?VguREjKpPBc5E1lGwHugviLvgoht0fBe4NT+I/UlotnrO+X4SnYrbk9vj2n1?=
 =?us-ascii?Q?nWA7nQT/cPJJwZF+2EKIAleMTX42P19oBVIN0raX2FvjQnT+mW6QuI/vxRV0?=
 =?us-ascii?Q?a8xWWe5E/lgidHymAmH7ZCOoeiDTLWkEoh+2NOols8F413oRGdJS2LAE8mLZ?=
 =?us-ascii?Q?N3ZmDyX1NKcsyUWg6OSTgLbk/lWu82YTUVPg9GoNjXPhLIxelH1zfWEmYR19?=
 =?us-ascii?Q?gOAQjLR9D3PhiqU/VjAyuLEODXYzRuqeBWoXIibCqzKPL6EdiRH7z2Z3bhps?=
 =?us-ascii?Q?uZxEtzJQ+ZXCpwZv7z8741c05Dtl1CaM2eKmHvZDqJfqgGCE3K/Vx7aH0Bl/?=
 =?us-ascii?Q?N+/buSxMkg1uXAmiuMXkNp+L2YL817NsDokjhtAkdvewVhlxFYu33KnAR4VJ?=
 =?us-ascii?Q?IoyfpYb1ezwOBDhrXrOIWByGP9/6n+0CXxWfgoMzQbwIuV/vGJUDC6KkGxxw?=
 =?us-ascii?Q?1FePSDy6cb90mydXDaVG9wMvW604kZna/JBH4+upfu/xyOP9Ziu7GqIETsIO?=
 =?us-ascii?Q?kPcaXvCMqBW4SqaBcnnKzQ4JHeIIzHsjdnXRmjzhLHmwVZ6eIpZCRzLNjvso?=
 =?us-ascii?Q?7sGjytmgVD4+WKpPeebTLDX3IXU97MAgW4efbPyfVFEw1xRFRPBWN1z4EE47?=
 =?us-ascii?Q?arXbaDnh97hjeN2zCZvvcR43HtKlUlAcNyZnWkY4yXsWqgbwfuz71xEdFgjL?=
 =?us-ascii?Q?GzWkLPocIXoDuBt0j0r9tyQ+osmHl5k=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4c4a82-9b53-439e-4e1f-08df2459e696
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:01:05.1259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KOHvQZk/pBB9uNcs4YjCNOFi2zwqCqDOUCt74ypoGFrg+0fkZkSI4xOBrl7JRuX0iffjrTBnqF994rIjcdcTfstGe3jWjYJRRnKdSJkw1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0796

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

Changes in v4:
 - Serialise the RPMI transactions on the mailbox channel with a mutex.
   All the regulators of one controller share the channel, and the
   client does not block on transmit, so two regulator operations
   running at once could queue the second message behind the first and
   return, freeing the on-stack message, before it was sent. Reported
   by the Sashiko review of v3.
 - The other point in that review, that mpxy_reg_set_voltage_sel()
   rejects a 0 uV level, is left as is: the regulator core reads 0 uV
   from list_voltage() as a selector that cannot be used, and rejects
   voltage constraints whose minimum is 0 uV.

   The bindings and the MAINTAINERS patch are unchanged from v3.

v1: https://lore.kernel.org/r/20260922161156.1088153-1-joshua.yeong@starfivetech.com
v2: https://lore.kernel.org/r/20260923070014.1340761-1-joshua.yeong@starfivetech.com
v3: https://lore.kernel.org/r/20261006083259.2206001-1-joshua.yeong@starfivetech.com

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
 drivers/regulator/riscv-rpmi-regulator.c      | 908 ++++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |  14 +
 7 files changed, 1136 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
 create mode 100644 drivers/regulator/riscv-rpmi-regulator.c


base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
prerequisite-patch-id: 907ffadca74a65c93ad38f428e002d2b34341067
prerequisite-patch-id: 5a4df94e66de2f63697891a0f1382fabd9df7b6f
prerequisite-patch-id: 0827a7050d08fea7deaab8e82f2dd16acdca507d
-- 
2.43.0

