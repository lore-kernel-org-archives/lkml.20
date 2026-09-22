Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2126.outbound.protection.partner.outlook.cn [139.219.17.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDADE563FBD;
	Tue, 22 Sep 2026 16:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093571; cv=fail; b=JfslDFEN3yxMQz+lC60QbNYdKTgLtZE30+tnP0YWOxl5vXEIzqjbrZSzNo+v+U4TdEnHewVzMq6SgjgHGgOVLE4Z0ibE6n7nOPiy3crGr2jDg5vrWWJc1DjaO48QJa7yISD/0Fe097V4mFj9evHEj48dUCPNYo+thQwjxpXkGug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093571; c=relaxed/simple;
	bh=j19d8FP1aHTfUBasAOTNw8pgIkIVLBXeT0tjhUqGa6A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L/duDiayrI1Z8yTVGLv3UqvalzdHB1QAzTLqjjMKzdiNMrOKX/kTULt0DjFRZcRW3UXCY7y3Gd6Tc0LzzSoKBuykLn7gKaCZNEY+JpAyV4MfcXHxmEhKjdXxAwjQpFnMBUQWxazoPg3mvGVBqDi+wKQFGjXs9H47xsM835KLL5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8TV29Rv8XmD6P5TQM1nEZ49cOdvlLgDKOKLQqjokHSjBe06+W8IUoJhptj0oYQb07oASgU0kh+djUqbF2mNI7QVAQFryQ81Op4/JWg+dXIjH3i8W9gkfiyyqKmEn9ZBgJvdlvjTB6Z1mWEiL//L8yt1PPNip75vIgF9LS70NrVujSfqjjGkRm+fI0IJ2lJt+xCuW4FFOdRijXMxet5OWBX6W0VuFEMWkYR3eDp+VWi+Trn16DVmHRTtFiUn29wojjrlqbYWUTNmhz9x40XE5xT/8GomSr+jvUviNYx9K0wY5ghlju8DfdwhGNogewY+icbC/NRosV9Ft9b5wGqx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICWaBtZrcnh2ocxdfxw5p6TYUnHn4H2K9gb85TXefFQ=;
 b=C72Jl0Zb5UEMbdLxeOlPj98TfhNs3DMjIgJ1fXDSvYHtue2jJ0EuPYWFeuHpU1t7ECLvpIdf4JLkuLHoRt0UNXj5z70HIr2d/pvb50WYTNxFxpDEHwaNOqNdFz3IYS3UeP9LC1ph5+WJHidcllevyq3pBPrKokmwJUfL6GJIkbGM13mvcCYVOJGi/p6I0hFtxe9a1LqKjIWAuTjQ8GT/TmB5Gf6WQTkloLrAjrcaKRz/0FQmmD9Fl1nY2hHz/SyyRmr0w9OY1t4EGIfOYX3LPbYEd3nDWidJihcRPx+fXmMKBFq2JQ1BK121acozWrh+oUjvmPJ13ucRQm3fknXbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0492.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 16:12:32 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0428.015; Tue, 22 Sep 2026 16:12:32 +0000
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
Subject: [PATCH 0/3] Add RISC-V RPMI voltage service support
Date: Wed, 23 Sep 2026 00:11:51 +0800
Message-ID: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0066.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::33) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0492:EE_
X-MS-Office365-Filtering-Correlation-Id: abe9269c-90be-4820-d05b-08df18c44eac
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|10067099003|56012099006|3023799007|6133799003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	LfRwIjY83AjmASB56oOYJa2hsnQrkrX8zr6ysnxm85g7mRISizsjUmB/tcn6s5lrzIQ/CHYiXIcleGNdbtuVpBIGc023fWg9dnjv0MQaWTOUsLHidR+rqLoPbm+NULtGzvSibgAxcTSDRD7W8Xu4tNQ8P+rcbz5wlu7fqmtfRbtMLAoTeNWR8IcFftkKxi6inuFLGZqNTCrpBGfhkBHDJ5xRRGB/isCtr+2178N/7qdG0sA8mM+Q6zs9Cm6x/yB7/91Oae/6MHYtjlH/4fCOVXmiLZ+vIP2PGfgAoKPnBCShmGcZPysAwxoKfmbw45Y/ALLq8Ya/uTsQIJ25BhWcOpR7vmZ2ub8UJ5DiUESifebOKaSjDOpmkJCJNwAKOSnzKhy0A1KF7eY50XRxkuDj0UzZs3x/Mm3rnYIC0AE9HxRE1nOGMWBP6YNmeqKe8WeRGBT/cyURRBuXP9whp+64xvKYNcV+al/vOXhP6jZ5noqicbbQ3+l6qBLldOUMw/3VTjQfTVJrFCu2Of0Yv8t+syx7xW1z2j9PjXyeIwpLQCUadkleTSdGR8SSFUsZJyD7rnKbzQaB+xVA9R+21SG/ng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7FpsyvuF/2+3PbjUJB9WeeatU6cixgOPLb4hkFUy1uRRrr7h1LrkchtZg2Ry?=
 =?us-ascii?Q?MylXiVodwuaGZ9N7w2NG21fo6HYjnQtJbgLuBFUDytJhuGEkwBbLeDp/glDf?=
 =?us-ascii?Q?H4/EeRTPm/amiLzAb8ma8DyTnTL/vOO0Qj3oKbRX8Dlz8NIx+KGdp21mpC+1?=
 =?us-ascii?Q?HUHdRpYMbAa6iLds6hP0B7Miy1eQN6KqsqpXJMLbL+nYlZWmpOVmJGdPsqZQ?=
 =?us-ascii?Q?QkbtaOuypGf/F4/znW5rK6zWYEgAi2GA+xj5KhpTTSV0vtQM1cKB8/zbt+AE?=
 =?us-ascii?Q?EdWupq5Qn4WXL1WzAN4q92xDPLXiTMHKCQIcxbow3HFPHT8h0hPJGZ3So8oL?=
 =?us-ascii?Q?8pArOqflU7857X0BsEcF72tqBO/YUqjJ3lOuPfIV39TuapqGpH0ChkMYdRbw?=
 =?us-ascii?Q?rfp+4MXTZVtnmt85CXJFznCTicYpiXp1FswKTK1Yfs0mt+CEFX4qRqHGQLSA?=
 =?us-ascii?Q?XK1SRW27DVZJGYVZuTcyTK3Aq9C1jKSAJB2WPw8r7QWbAS1W5Vr2Y4y90BIx?=
 =?us-ascii?Q?Acr0jQH5D5gLeJf/Oe6sOazGIGc/wR7Eay+Z5L/5gZhW7UPzgVXjDLfratEd?=
 =?us-ascii?Q?KJ9/i1TSqlwn9855C7qbkSoythQgH2uQainFzdOmL9AN5Mz84/j761iTjWt/?=
 =?us-ascii?Q?bfWJfYvhhxeWPZ61DGw2Zl4NUu2+tt39RaOCBEfoxmdp29yTypmxkl+cK78Y?=
 =?us-ascii?Q?hhcZLeLmdQ0RYfyaHOYY+RllGEMxp2GOplWwTC3iB2kP/n4W7uGhkizOeRxN?=
 =?us-ascii?Q?gkfEdlrPLwlp9G9dXZwOF0XfCcqlFlDMoHBHeJCGNa+eaI3ldX8n7Mo7m1Wf?=
 =?us-ascii?Q?K0IfRrDO3fAVr1hwWu/0abyP2ie4TAm+Q0ROaAk0j6ZIxC0DlHnen5+elYab?=
 =?us-ascii?Q?7iBAgv1k7ht/ydxKCYTOb2czSV+NXUgF8VHdz9riZDJBFMxI/PBr0mKN3V7C?=
 =?us-ascii?Q?6tubG22DaLh1Gpirdt0PtHCIL8lgZP0r5k3cib780MwFxFd02K3tc8LNmDn1?=
 =?us-ascii?Q?qyUUDmmvazo5YMkBDJOZ5b5jqKqmklpPXh38wDUqDnE6A9vgWh5s23R4z1VK?=
 =?us-ascii?Q?YXDmDDYYmN9A2oBKVm+GCPgyNnxIkISo3ieFCnAM876I1z+QworOQx1WVOB8?=
 =?us-ascii?Q?WPcwNPY0+U2AcSlZELAsa3FpALSjQCr7UTuLBgJNMrJ4++MxmItQkhxGb10o?=
 =?us-ascii?Q?rPvEELCuWZODLHzvpNc83azcy92J7KcapzvUDkbr3yN/yhMK4f9LXSRRYLvh?=
 =?us-ascii?Q?pMXyGS5U5EewHkdxSj+EEy5TafFvOmIH6K0E0gKJYp7CO8kUqTNLz/XWqENv?=
 =?us-ascii?Q?RK53YXEwdjEP9UrvSwSWzpgG4aJRGTukVCSDNHH4e+Xt04lm9tBCs0FLMHHb?=
 =?us-ascii?Q?4bVsLtWyC3v8aKhzirDjwsWFFcoM5+/fFmOULkdlDRuEby8AmrbZMByjKCJV?=
 =?us-ascii?Q?ZpLQGFpn+F8E2nxmBvGvK0E4BZjz6lJ2zWFKlhhGuVWgnjULyRXRE0mb3zJT?=
 =?us-ascii?Q?n5MJjTRcvl2oUBZBz5DNLatLzHACC3HnVtpPvkVjG2l9+ktyee9e0isw8kCN?=
 =?us-ascii?Q?W5QACIZcc5QkLhXqbw2bPGZVlINU5DHYQPf/p6E1WyKWh7Gkd5NkVmACA3bd?=
 =?us-ascii?Q?nIaIUYNw1Lv61jPWvdr4RCoAuo8VrTTYh7oOsOLDxpFwT9oegHRcZKrCoJuc?=
 =?us-ascii?Q?zGrqZCy/XYeoQfYT7d/DPbmD6VDU9YD4O6JgV5V5OAT1SpzbmZv8fAKZKdzl?=
 =?us-ascii?Q?bzftecJzZedPdLAJcIm3DlW/uiXE/7Y=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe9269c-90be-4820-d05b-08df18c44eac
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:12:32.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zAIYFURnjSVLbvX7ANIRN2z9tZ0KDDJTZsOsMJsBG6A5qfsmVZceJOtSgUPKWGqCe4lvGPOQhRlXDU2Dk6rDJdlYN6SRro6K6I0yFOlubM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0492

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
 .../regulator/riscv,rpmi-voltage.yaml         |  150 +++
 MAINTAINERS                                   |    6 +-
 drivers/regulator/Kconfig                     |   13 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/riscv-rpmi-regulator.c      | 1077 +++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |   14 +
 .../linux/regulator/riscv-rpmi-regulator.h    |   41 +
 8 files changed, 1366 insertions(+), 1 deletion(-)
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
