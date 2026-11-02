Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628237;
	b=4MqpdXbmVPie4KEG/5yyMq5r78JJzwqQfEa2CivsRV0hs1yzwYhxSnGYwy+XYK+2dOCh
	 JXnfw1kxqkrwiyER7qfUwAWIhM9gbSXvFp0c4ZQ41CbvollR/JcSQdRoc3K8xrVjtfhg3
	 nX5oTCp69mhTeD4rRIDZoEkw746+6n8yQCHS3+IHzfFCiINIiZx0UiYAwnIXycRTuYfT+
	 NM04ru7kn9dNAQzbwacnHhKlSc/c2ay9eYBdla6Eb43VugkaBHC/xO63RFjVNA4qy5maz
	 PsuJ/cYBWbtAND8E3NchPuNlWAuB80OqxEUYg/MGVkLIYJ9CzfYs/Kzn8CaNNAD/oZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628237;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XbMbilS6bNAvvKSk+qhwIIlcPmd8GMGEEJQMIlFjOB0=;
	b=nk6XwpfKJE5VFIG1C3+eMGCHdjLxQ0SlVn0KBjbUDqql8jQN0cKnWE3bbU3D8B46SV4A
	 bRnYJZMn4bXZMQm4G1pVbkl4zT6df6Jg+AlrKCZGqp9f4kTiESGsFAkL6jwnz0GUndVBL
	 mhs9IeIMPbuH9O1HbJeOqhqsTFhV5ry1CcDmE0joSvhbcxjb3zzlI4cP2baohhdnI8sAC
	 VTCQQBvpLtY16MPANO66nLkgbwkVqQx2txIcXL2GuAsRCG3IKHq8vt6J14760IZCy8i8H
	 fDe6h45zkwz7kT8iabpMnLrtMi7rz21RhYUBNNi90tJlOOtIZcdTqfgrmM4wpesY7sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fKSsyr9o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.59
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D22B606A324;
	Mon,  2 Nov 2026 14:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D22B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=fKSsyr9o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJ1sqHT8RNxOwU8l/n9VGe+79Q/D58qMRE0pQ/LU2O91Ugw28VS3uJ/ZEHBoMj3F4t9Apu8fzDpwMtg9tOZ7Un27DG4V5xYloEvpi6UUG1UvA19RZWWEJNaUO6zQb7aFOw0BV9kwloNxhFpUqt9uz/TqmFp31UKWxZozAj2r58mX5XPi+tGnipCXuS2QVV0SR3Vrt4PJlLUeIUPJj7ySh5p8qgRuJNOwQScHsipaRCVWf9f15hVhaVwsokuK4jQQkFVzorke7b/WAN6Y4J+Y3SD/Ko7YLRwX+EQERyTrSEXe9zHoJ6QxKC6eEfps47Po/1v11QFCPqW6KGL2mr3UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbMbilS6bNAvvKSk+qhwIIlcPmd8GMGEEJQMIlFjOB0=;
 b=mLHJVdiRER+Q7n8PgHosO55mq02VzMKKE7U54RlSeJHd+KgEQTkq8mafm+pdjJfi3NkzSafikzoU/xVwaWrI2l0d2y+qqrPWz0yzkQR+64LLkvPLQjrv8Gq05y/i9EUIg4qQxYXtjCUeq8vkMHkjBhdux83oE51KYS3ZCykzyyKGy9l7ms7Jyq3e6SzlWDmubig6+X+Tdk3CqeMluvuut0DGQFy6nOk8Z8ZcttVzOFUuM6tYkrXouoOG0aaBauxMB8HhrB/ajZK1xiWV8YIjVzUb/yQLVJGtc2R6mQHfbhaEGtsR+/jLrvZAUMTcxXm1PEJg30iEo6k6VlnXvIz36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbMbilS6bNAvvKSk+qhwIIlcPmd8GMGEEJQMIlFjOB0=;
 b=fKSsyr9oHERvut7Zi39ZSY3A8+Z53soDFWTxGCGRfvDGkuXi49o9Lu/RdOkd7/EBCUfM2yO39P8jT/QpT2RLomzUc4LtvG13nVQz1GDnwVkF0ih5A9ZWou6bNeQetpHeEmEULfcpNBO9zEV8zw7XCyQX1yZBp9UGfbFL+xmZQdrxO+rWr6xJg4LvoY3p4434CU3mdeZ6yzuv2ABDjLP+sqTO4dP2x2XB61HVTMEqd2qXzOib+/pDTwurQMQO1GE3L2viD4/H9k2tHelxc9V3pi6JeK1N0Tvv31O23SGnUX+EMyTljwKdAYKNfk9FVYjy6RUiad6/oISLK4SpuL3KDg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMBPR04MB12565.eurprd04.prod.outlook.com
 (2603:10a6:20b:778::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:03:54 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:03:54 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH 3/8] dt-bindings: timer: sifive,clint: add OpenHW Group CVA6 APU
Date: Mon,  2 Nov 2026 15:17:22 +0100
Message-Id: <20261102141727.640769-4-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0039.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::14) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|AMBPR04MB12565:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f58875-2744-453d-0b09-08df38ea2107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|261021121427099003|11063799006|56012099006|261009223027099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	6tmReiXGKE7FskvFmkzbvLYkhC9dbf1SB3gQMhj+NVGoQYXUpoYc+3jiDZ7r1tG06gJ/H1DwdXTStetO5bKAwMFCyM6zFSOleichYvP1qnIVQfWU52hDpGKTV4dyNfB+swTnRz9mIw0701lBrOaU11YiF9IVBhvuDzwJxAsy73cTddKkxzv+YmbKiNxVQrPr3yst3V0pZF0G85qXagNXdsX2AomMIU1h+MixsSukqQXqp3NlUpe6n53jeNiNKYnTs3HG8QCr4BGWWT/Oys6qerWVPZhKcp5W3lRsdI6wuQPc0zEnF64DNyZXExGQdc38Og8NQSBSJA65WlYsTT6nN7juR2eoIgFUiGtFtj84LK6O2lKg/xPqe+Hwrdtk3LAhtuFFBFhRCKPZnctJ7856yXOP+Lsk4eV/TbJNG6ZdhSxhTE3NZe4D/+ufpujk7sLpITO9dRO/kCa591X43kdhgiT5yqHdHNC38gVjcx9azaJAqgmgzrVgK3llxN6soopAm7NW3gcEx951/bLEjG0IgjFkfCZ5hWO+QD3LA07Eu5T0umKGS0XXr70pKsQuppAcRMFTBFprt3Bu+2O6vsrP38ef2KG7RYvZdG5SJlckHAqengycexb6ddfIYkkftdAu0hv1VXKFcHv/QCs/GfzuV1ATeW6fQ08cx/jxZvPggj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G2GeakhsjNLKQ81I2VsV+7MgSyMbaVqGPpRc5u3uyowPw/fBhiH4uu9K/RFR?=
 =?us-ascii?Q?SEMuEBnpSB3mwgUromoO5b+dny6R8VWTjOMV4HyNCdUpc0xizSoWc0Neq73D?=
 =?us-ascii?Q?972YSkXsKsKqwDxybr4r3u/0N6vG/ol5uwczqNxH2QeCL/VWYCZV8EgIc7cg?=
 =?us-ascii?Q?grnqbKI6IUJ0NLzGqIVo133cRAejVCVcA0YG0RCjfbse/aCVSj204c4c2beQ?=
 =?us-ascii?Q?BUa1a3jaNLoPp0CAGUFjoL0wcVvXYfKgpKHoYYZveG6DFiQy7+hYZb/cQo50?=
 =?us-ascii?Q?ZvuVcOd7btbWea9aZtE1njnlxAMaMw5MUB/WukhBbLr0q3XzbMJccoqYhoFc?=
 =?us-ascii?Q?Le4grnur3wYJkN2O7Zw/9X1oCU/hycMd1CoEq+euqlZWpeg6RFHFKQYNjfzv?=
 =?us-ascii?Q?yQravVYWhMnwwcnyBlO/kC8BZnXgbE2DReNREh1eX/SrxQZzsGs3y2k1b2MG?=
 =?us-ascii?Q?tOYWZvMdDNiufocQKwk+vZI6XbtadNO/bhGO5dyqBVLJROsqv5ayMVsWcHqv?=
 =?us-ascii?Q?bMQNlekusnXJycncZKgMz/SeskpEGd6Ln9EolMJ3kID7x1cihe18QEnytMNQ?=
 =?us-ascii?Q?MEia/31O7d8hFQATg9KcKZnllcxFrS0ySGf6ATQdtD5ykS9cj61XeAgTzSqU?=
 =?us-ascii?Q?XAlVRMn3ATuf+J/Bvyuw74EqfVCZta6ojN4KlH5flYlEqs8GmdzcH2j8zc1K?=
 =?us-ascii?Q?1hIAfiroVCa+Kl5xOVxkRjII88J9ZZpl+LwBnhJf6PvlyWHrJKb/w0TbYKkd?=
 =?us-ascii?Q?cGJecJBhK3cAmuuniELtA0wvs+jrZE6AJLTL/Ah0ka8TYp0sfmm3ayNMoKbp?=
 =?us-ascii?Q?ddsJuyWuYR66NnVQFZCiyyoX8lo/J9sq2XSegXtG0cao2poS7YASGnyi/x4g?=
 =?us-ascii?Q?9kA+7e0/Aztd/5Dv2iuG+SAXitWu15d6Ui3g4ictEYQNFxjNs9YKCox3pE33?=
 =?us-ascii?Q?UuYSQ0j40SsAIbzpw+iHHYzwyWrqpYJcvWpHijYB+Dk1ZF4wIxpHNU+bgHsv?=
 =?us-ascii?Q?u+KCCyy5tJvK+5uKPpDzCs8eax6lpmV36+XyT6+t7IdT6YrnLjGW4iK2zxEX?=
 =?us-ascii?Q?1FKxQ+EisJ6Pkyq1Jxv7TwcoauEYLD9GksyWcKMUFDxYpe5HhXYBtw5R/ydE?=
 =?us-ascii?Q?0F/Pix19w762zne+BDX9hzwDPR8bcanlXy93HW053ukNsM9QDyfbHDMqLao1?=
 =?us-ascii?Q?Y2l8qHdfezXm2VVWSrYpZhVqR94JuMWzOMwqCYVcBDn+lZDPj53O7F4B7Hx+?=
 =?us-ascii?Q?9/yzrG1D70uHasYEPQnMAskP2x9NLHWpmpxqflewIEbc24d1rnxRMYVi+/5D?=
 =?us-ascii?Q?kwb1U6Ol9MdgkJd6sQpT9AKSf1UuXIvRQGsj3+bfl4+pvtgz+RkB8UEzjbKk?=
 =?us-ascii?Q?+DrjzBQwU8Byh9dOIMBllCEMfIZoli0S1Ot0kFuJOfsHakAkagcgppvzFec+?=
 =?us-ascii?Q?b+27m9xT+89N98iMSzSbkqfDpjA5sOCyx9LjSueVPW2GwLjY3Az8tRS6PrPp?=
 =?us-ascii?Q?bDOf599xtfQseLkY+icfYw/JZoA9dSX2DvxsYSk0Ih2dwqlxZ1AP/BgEzPN/?=
 =?us-ascii?Q?h4ngDG1tUyCxmjPz+maBOBLKFGxtwDy1+X8qM6/aVuF0ieDiXonBaXw9Lqqs?=
 =?us-ascii?Q?3tm5+qiqEQEWIGMPcXuL8DnqGRatjGrWeiH6tCQjtBe3q8EINBABwc+BHDTF?=
 =?us-ascii?Q?qzDgLjXEw/PBZxp4HJANrPsnQEtnjcgfSPRQ/o14NlY6WeM9WTNlplE1Dhmd?=
 =?us-ascii?Q?Gg9hJEbxyvEb75cdR3bdQf/sloqRyfRiKRKH8FvOIB33LzsodHULLHOWAFRI?=
X-MS-Exchange-AntiSpam-MessageData-1: Reiu7JvFM+tozA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f58875-2744-453d-0b09-08df38ea2107
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:03:54.0183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEirfqSMWeQwXeKtu3xCfdUXorSmtlVYxkMgVkJChif3DF74Y7tp1ZPuWnBXp0AZ5cDtbJOdZ7MY0snz9uvqGx9cHHZGqvVRsqhqxw+Q/w6QxOrStHYJ7t6S73JXb4BKHzmFTuE0pJWjEal8t/r6vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12565

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The CVA6 APU FPGA platform integrates a CLINT compatible with the SiFive
CLINT v0. Add its compatible string.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14..467a1e26de 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -32,6 +32,7 @@ properties:
               - canaan,k210-clint       # Canaan Kendryte K210
               - eswin,eic7700-clint     # ESWIN EIC7700
               - microchip,pic64gx-clint # Microchip PIC64GX
+              - openhwgroup,cva6-clint  # OpenHW Group CVA6 APU
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
               - spacemit,k3-clint       # SpacemiT K3
-- 
2.43.0

