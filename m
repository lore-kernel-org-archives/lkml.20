Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D3E3C76A2;
	Wed,  9 Sep 2026 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937456; cv=fail; b=IcfELmqmacg2KUB1kMNUxSG7h+3Yq6Jn8mmEuPID0K3AVhgFL2Fus8daoq2oZVsX8EmagAAan9ETHqRnWvrdwIJmyJHfvqcXaxpEYvojQuclhoKbtWR6BZR+RKZj6ayYxjVPDYMh7qLPEeeML8km3j/EDBlhE8swC1k1Hj75GmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937456; c=relaxed/simple;
	bh=w8BjETEM2zX6cPZfyF6scvHopWHF8lz15+trerMmtdU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=vByn1oECxYUvUSaAuOeKIvKR9EKHVQvAYYHTpB7BeDDgMM+ZgDqoP31tMS6pg8EUwoqvX9O/gPcrDvElaQXTmB+fVNpi6PQEzTeexfAqjmFEe28t8+MaD0ArGHn+P+8JJP6+rE/x91No+Ih3MLl6ZiXReC7AFBKxNjRHGaGgqSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=TuSbKohx; arc=fail smtp.client-ip=52.101.62.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="TuSbKohx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJrzKEZBBUR7g+2kjKFYcamzujBu9ju6REtGDNBHQNLY19OPRquTzBVUfw/urQANckqdKO6Qom/6xWvIkmqkWktXCzuoVXcnipmaYNnZO4DhbyZSTnkzvGnO37yh1sm/SeVKIS1t7yyPQlyptSwMY6dwee8z/r39o1DpEvKWGop0GP17GEm0oBljR7xEuIXhTMcosfZkDr9i8vHwlpQvGANfjG4pbFRG2DzcIAVVu7jjiypQZ3htZeovnyciKU7gBpNyI9Dq2MMHenZvUmdb9fM1zSJSkJuBeKOTt4PmgWdvhQxgI+N94yYHcRyPIiuO5xp4rJRqc+8WR4FPGHQ+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBcNC2u845X5/xi65+Miu1ppBI9kGhiOGreMSsizbig=;
 b=bQbiNMk3yRyY0/xNqNx8UScD15ITDVbLiGijZuFY2YyCYzzkO9L465ugmK1yxw2GeA9BZn7b+UrU/CrXP9L53xxekfST+AADuyk1Vyw5hyg/oflXyVAfK2G7nJuUO/ExHgzvMJDcg7PDvDm8rXrn416swJIuukcd/9/vWoqMW3eZS7ykzZX2qVgdUmklVjCOHEvSdrgOHmz+kmgvM9vpGXSfOeL+xX6yDI5S6BoFjfQ9FzU7PKrK5QpEi0Xtj2RVu6JnMxA4f3vaGyWOVflATTNWwG0WzpjaNpqly+X8aOY/OHY8UIqMi3vzzOasC1k7hOclLCAPvSFou9tc9OP4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBcNC2u845X5/xi65+Miu1ppBI9kGhiOGreMSsizbig=;
 b=TuSbKohxIrOtCpGtcQWAv5h5OlrdGpA5SAztMNK93DJIkRCWrIeXCDYlE92SmmEEntATbGXjXKW/QZPbY/Cjh1ye+n+5TeW137Z6wFXs/gHGS2pUGAyJdvjNqGTMwlZqRpvEy1Cr5axCP9NPkOFPaj0itciGEOKW6bvx4KOxgkoDV1f3mKVtOqr5DouvggztNJPyn6xD10dTVK65rI5dTTojrwhvVurX6403Zdgux+x7zb4g2+EgGog7qtcE+SbkxaYzzjmDoL1OKMU9bsqHRzTlhI1j3fwflbkk91Ek4k+xtIiZb4CNAileo5beDgtCJHAqgKzK6VOUjclI4OkOiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SA1PR03MB8065.namprd03.prod.outlook.com (2603:10b6:806:45a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:04:09 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0382.012; Wed, 9 Sep 2026
 07:04:08 +0000
From: evon.chiam@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: altera: Move all SoCFPGA files to dts/altera
Date: Wed,  9 Sep 2026 15:02:45 +0800
Message-ID: <4b78273b85041f74b12245d0bf222f018afd2bd6.1788933630.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SA1PR03MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: bd79c247-a33b-4615-1f0f-08df0e408b06
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|10067099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v5CRzflRSy7vhLXvNC9nxAlYzMQ/OK5JLKFu3STyZI1HglYNB9Z/yg2wK2Ud9klPN/tevgAt4aK/BVQDCo+QQPbhF3g/RlSmpy/c2jdjHl6uzJfv2FnKkY2ShU6QS5s4e7DdQKPJyEeX0q7TGG1su6H+3whZq3dZyo5dfNoUy6Z1f84VtAwidMGP3Y+daWGIdIs3mf7qg2VV9G+w6SF7C4gC7LVXbas2yuVIAWeUD6OjRPmYzcJ9I/A6Sbj+x51R9mI5TlWk/Uvyfewv5Kke6umozWVl7PWZT5jsfQUNxsCWx3mHbV9jrvWtnOwO9DCZR3wm+Ypwfzm6ufl/oxeZbxV7tqRkfx56P+ImcjmXfbsn1+pCqV6HUhtjv2rKv34XCb9QxzWp90VeOfdxWvERmhoyMIC92FpKg7iD7Z4eiCFH7f4T4lSWqyuHFuu9EYMHE9GBOjNzN7F26u77Cyf9Bknc7Tgdt+m+a//lkoOYuuZZ5iYWk//+ZlPsz0suEQkU/u8VCRUM3jptZ4EkEUHCnzj0S1P9Nk4YxucSflER3N7D63IY4ZR68tfVI7wOLXi/Sq1s2zxU2I9ea+WPV+rXgorbr4qcuiHriA4lAartfXAbbUHv0YLyBNyIIDOg/3On8HlKOPG8pvhVaIcC1E5ANWL2jX5V4BWy3Y7Bt3RM2b4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6NSOt629BMoeB5iLIgEv2c07fUCkI95Z1ZwZneUy2J1oOSHfYINX+jiQL6rH?=
 =?us-ascii?Q?u4JWZnkvSLTrIlNLco3bPVzkQmzIl7gf3MIu7+/AdkjDMjfdSOOHpYXJhtib?=
 =?us-ascii?Q?q3knYc7De1XwMOK41TqBHGklXoSk7xW0aN1cZFcRILfuEEIV6CiZnHTzxNm9?=
 =?us-ascii?Q?dtZKjVWcaHg6nbY7EqW5lP9PzHsEhr8erJadSGrSs5ZgsMezidM9EEBRYvry?=
 =?us-ascii?Q?cmpf4WRjeb1Eqn55zLpsTObMHqKLn7XH0mwuyRWMohEnX1ZdVWmcMEM46zZN?=
 =?us-ascii?Q?IJvE7x/mggar4/HBwV2sT9H3zwbo67oTfz5seGy4KLASHTnYfo0Vzkc2XiPN?=
 =?us-ascii?Q?GS6mJlycH5sT32ecZltGzqba2r2gEvWMlu+D0i5DLAgP1I/mAOmZb40vUJAc?=
 =?us-ascii?Q?E5J7MavUOw1+57mFgD+Ow3LjwkG90VJDpC/jeEUX2dikFBAeNYzRapFzALuI?=
 =?us-ascii?Q?1OCYFK+pIn3dc1XgRkmINix7VIiZtvCZow8jjB7hkvNqT7xRSkp6usaCaKzV?=
 =?us-ascii?Q?dU5azxFkJZE9IDFR0SG1xkzQfIGafea9iwwYXis313srBKseIUHIZJl4q9j0?=
 =?us-ascii?Q?tB9TeRx/lP7/cd69Zi409nWswBKMIzhnhsH2bmSBomS9JFau/5lWvJwcUqhW?=
 =?us-ascii?Q?dRsDZL1po5pWSI4N/cGaAVjB4njkzXnQk7CJ9LPVcw9hndEky6aRWNcv1q+z?=
 =?us-ascii?Q?rEEVtIxCLaPixYZMdLX7Us339AMswEzx8n6KV9V3hDhVSNvPYvpkke0nsGUx?=
 =?us-ascii?Q?fIj14Z42cR30JOSx7qge6FrDy99b/AFCEdAt/Vbw+5uz3LFhW0l5oXzVpo4F?=
 =?us-ascii?Q?pZKL2jPMKs/Ofs8mWlfsw8fvAKD+agxwFhU4Ms3iMY7uNm4F6Q9uKwyD4JZD?=
 =?us-ascii?Q?lxd0321Gxdreyls8sco2SacraUqpMb4aday58sXn6eEggBW4+UPYAr8vclYr?=
 =?us-ascii?Q?uArt1vs3Hrz2nO3MsTnZQZ5y8TtR1f6HFq/U3andB5XKBSVqkenVG6dztc9I?=
 =?us-ascii?Q?rUVsDoLBZlrW/J/QNLrUFSTUIDoyZ55Sws0u2004TFd5ZagdBL3MQHcFNd7u?=
 =?us-ascii?Q?q2oqhG5q7wi5TKbnvr6HJgt0SZzSZnAbVWYEW5CDFyHVlv/pToHtQB6pMC6z?=
 =?us-ascii?Q?doIu/cPH+MqVKoKHLDG8tgWlwx0EvzOiINnv+blUa5qpxdcbwU/IfLlg/Wke?=
 =?us-ascii?Q?1ULxw0urpkqXzt9Qk/cH0EQrG0ekyZcfbG6r3VnK2phB7UqEp4Vd2iSJo8uA?=
 =?us-ascii?Q?c/FxNpblyoLhurGwymm8hSOVYbtUgTu9uv/w0YBekCIXY4kRMTcZSR7cc3da?=
 =?us-ascii?Q?MIeKb5Vl6WS9+gkZPz7xxzBIzxbSxUsLrZtL0zWcA72YSbVYVIqW6et+AvXZ?=
 =?us-ascii?Q?b2NkPunmGkOVp26NmvTUJn3D2Gz7rdTTrYwnwafcCpcSDBrcKDLtc2l7F7zf?=
 =?us-ascii?Q?6W5Obt3pEJxfyaeUcJ9H/OFgpEAkAEm8KAzf/qQunJ+KXcOBLWkn0KNV0utb?=
 =?us-ascii?Q?+fK2OWQ6IGssi0OJrEr1bPJer6muVeK+8Zu9Ty6udcUo61AFJrjkMt0jSmd7?=
 =?us-ascii?Q?hLPGaWbzIuku51tqc4PZE9W2mD3r8axkAZIsyYjiUcaAcLjREP7mbyCa7e0m?=
 =?us-ascii?Q?NPG1yStMtGpHwg2c3FyWqoSxaTuYoTecPDv/bT8IiouIRqwWkjEUntCJ/1tv?=
 =?us-ascii?Q?aus3pZTmABZbGQc99b9S+niosQoTc3gtyKejoTpXQJy1qmHudSBmVu0lFrJs?=
 =?us-ascii?Q?/5Kjq2ccSA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd79c247-a33b-4615-1f0f-08df0e408b06
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:04:08.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqAJXzwYR4ynXYQ//0b3mz7oiKP79P8Ph3S7CKKPrYdC1jcH+5xKbFH65GGsDNt7XC35on22mh5p0iZZzPOCYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB8065

From: "Chiam, Evon" <evon.chiam@altera.com>

The dts/intel/ directory contains two distinct families:
- Altera SoCFPGA platforms (Stratix 10, Agilex, Agilex5, Agilex72,
  Agilex7M, N5X)
- Intel Keembay

All Altera SoCFPGA device trees already have a home in dts/altera/
(Stratix 10 has been there since the directory was introduced). Move
the remaining SoCFPGA DTS/DTSI files from dts/intel/ to dts/altera/
to consolidate all Altera SoCFPGA device trees under a single
directory. Only the Keembay files remain in dts/intel/.

All inter-file includes are relative so no include paths need to
change. The set of DTBs produced by dtbs_install is unchanged; they
are simply built from dts/altera/ instead of dts/intel/.

No compatible strings or file contents are modified; this is a
rename-only change.

Link: https://lore.kernel.org/all/cd16fb78-551e-4630-83d6-a44a68e2e411@kernel.org/
Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
Changes in v2:
- Reworded commit subject to drop redundant "device trees" and phrase
  the move as "to dts/altera"

v1 patch link:
https://lore.kernel.org/all/802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com/

 arch/arm64/boot/dts/altera/Makefile                | 14 +++++++++++++-
 .../boot/dts/{intel => altera}/socfpga_agilex.dtsi |  0
 .../{intel => altera}/socfpga_agilex3_socdk.dts    |  0
 .../dts/{intel => altera}/socfpga_agilex5.dtsi     |  0
 .../{intel => altera}/socfpga_agilex5_socdk.dts    |  0
 .../socfpga_agilex5_socdk_013b.dts                 |  0
 .../socfpga_agilex5_socdk_modular.dts              |  0
 .../socfpga_agilex5_socdk_nand.dts                 |  0
 .../dts/{intel => altera}/socfpga_agilex72.dtsi    |  0
 .../{intel => altera}/socfpga_agilex72_socdk.dts   |  0
 .../{intel => altera}/socfpga_agilex7m_socdk.dts   |  0
 .../dts/{intel => altera}/socfpga_agilex_n6000.dts |  0
 .../dts/{intel => altera}/socfpga_agilex_socdk.dts |  0
 .../socfpga_agilex_socdk_emmc.dts                  |  0
 .../socfpga_agilex_socdk_nand.dts                  |  0
 .../dts/{intel => altera}/socfpga_n5x_socdk.dts    |  0
 arch/arm64/boot/dts/intel/Makefile                 | 12 ------------
 17 files changed, 13 insertions(+), 13 deletions(-)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex3_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_013b.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_modular.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex7m_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_n6000.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_emmc.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_n5x_socdk.dts (100%)

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 540bb5ae746b..8f41349103b8 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -1,5 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_stratix10_socdk.dtb \
+dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
+				socfpga_agilex_socdk.dtb \
+				socfpga_agilex_socdk_emmc.dtb \
+				socfpga_agilex_socdk_nand.dtb \
+				socfpga_agilex3_socdk.dtb \
+				socfpga_agilex5_socdk.dtb \
+				socfpga_agilex5_socdk_013b.dtb \
+				socfpga_agilex5_socdk_modular.dtb \
+				socfpga_agilex5_socdk_nand.dtb \
+				socfpga_agilex72_socdk.dtb \
+				socfpga_agilex7m_socdk.dtb \
+				socfpga_n5x_socdk.dtb \
+				socfpga_stratix10_socdk.dtb \
 				socfpga_stratix10_socdk_emmc.dtb \
 				socfpga_stratix10_socdk_nand.dtb \
 				socfpga_stratix10_swvp.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
rename to arch/arm64/boot/dts/altera/socfpga_agilex.dtsi
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex3_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex3_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
rename to arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex5_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_013b.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_013b.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_modular.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_modular.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
rename to arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex7m_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex7m_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts b/arch/arm64/boot/dts/altera/socfpga_agilex_n6000.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex_n6000.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.dts b/arch/arm64/boot/dts/altera/socfpga_agilex_socdk_emmc.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex_socdk_emmc.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_agilex_socdk_nand.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex_socdk_nand.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_n5x_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_n5x_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 270c70fdf084..5b030fb8d165 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -1,14 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
-				socfpga_agilex_socdk.dtb \
-				socfpga_agilex_socdk_emmc.dtb \
-				socfpga_agilex_socdk_nand.dtb \
-				socfpga_agilex3_socdk.dtb \
-				socfpga_agilex5_socdk.dtb \
-				socfpga_agilex5_socdk_013b.dtb \
-				socfpga_agilex5_socdk_modular.dtb \
-				socfpga_agilex5_socdk_nand.dtb \
-				socfpga_agilex72_socdk.dtb \
-				socfpga_agilex7m_socdk.dtb \
-				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
-- 
2.43.7
