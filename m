Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4847F2D0;
	Thu,  3 Sep 2026 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457711; cv=fail; b=bfN14Vg7XY0SYPUW7eFFnQYlc9EBiKJQ+LsyirhBoyS9SqexwBuRdLH5fQ2QOwkTaLDZ6M/9Zlm8wMsNHcXymwX0YmOtdCTbz7X54pHJYcl3pnT4H9k6sJxB4pPvQuoklmQEmPuSVFuzB581Z1pHWmP7pPc4fNGZvCigcaiZtVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457711; c=relaxed/simple;
	bh=FvxPm2xOKGel1Ne+dtKHGaFqWOuFlXb281laRTuMoHk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XezjURu7x1p5TzV+sLXf9tDUCJuwUtLb6L8vjiX87Mvei1emH6Aiqz/9F18eQ5ORx3U+V6+Vu9BNxUjvYFV0HLC/TX2murCRBmn2oCvDEv4z7+kBpGDMo8JTCUGan1z8ngqdX13trwW5R+tswODeHS80yzUldhsEfnLzvCdda5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=k1xAIsYU; arc=fail smtp.client-ip=52.101.85.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="k1xAIsYU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6nl06to+sb3pyKP9I20OqRg2Iy0afG7c1iRqn08oq+ruoJbLrJOVCZRAahCaS2GKNf6Gg/YUBuBjF51xYV66eZiElCNnmc5wYGaxVAtG2lVrlaeu3/7VwijqhxGGaXkidgRyl3PLNQqf6RgZl6bDvSWBNZJc+ftUnuPZmFEpxa/zJl6K6Qd5BzYaX1JXrGISpw6YmBSXN9r1vAO6uxmbXgpl4110HpRUsFqJBKWWPHYn/kzVZHiWAMXdpgy5xr2pOQguWII2tSf1KtTPLX8PdNyUxlMTaaedbqq1gHqQfZ/2O3nJott85LdfJdxi9e7FGEELTTBgS228DT9+cyXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML7pBNEruECyKWxN+X6xEOW+DzjvuZOImqfKqLsgIaM=;
 b=kvWMzmS8G3C5/uA9qNYWhv/s4DAPbdJcQoNsj8OIjQ4oOLyb1UXERqF3G4aqfCPK1ANOKXU1X0z+XFPvUAJFg1Gl+otvcCKTlI/A64tLh09NYn1kmCpvyAOPTffvc5c6zKmrZSNPQPg35mDDLHGmfBREQhDWQjwuznHUbEKF2lvP8zZQWlYzdSn1E5P0dFKtV2pxg2UwWRkH8BYcDB901riXKZ6OteIJCtihJzBJoF7gAyBe9MCsC1KE6XNoLn2EZvBKk847K2AeE803sjc3qIjmEF+wk73EpA5YxBmrP+ILLbs7xw/8N34yoMxayQTWQfRaqP/W0yPIPpe+oW7+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML7pBNEruECyKWxN+X6xEOW+DzjvuZOImqfKqLsgIaM=;
 b=k1xAIsYUwMLvfH0qatJXVABGyPfVDxmieCCUqZVc2WVHX7fdE3jdSnqjKnofPJfytuTa0DRwaDnKOkIcno+RlU3HhzQ0EjHqx097sEbxZKqVREO3hGOBhNXnMxvEiH/upWhh41WF8VmzO42OFyh6ImA4X/AVgFamienpqsumW3v+DwO6qZOeVLjKZe2cE4VwjWvmC7z24WG8CIX8mq5fGzH56UEaNfTk4jSAexvNfMgd2Q2qFxY5LreT33OTkJRXG4IzrnhkXfZw3+qVTtS3UxNP5cfdQ5cOFk95iWJt8+BoDt5sFYsLvhuUk9laFspVr2M/XrMGq9OVfUFqJ4vxpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM6PR03MB4972.namprd03.prod.outlook.com (2603:10b6:5:1e4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 17:48:27 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 17:48:27 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 0/3] arm64: dts: intel: fix dw-apb-timer clock initialisation on Stratix10, Agilex and Agilex5
Date: Fri,  4 Sep 2026 01:41:04 +0800
Message-ID: <20260903174108.1962597-1-adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM6PR03MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e233e8-8aef-4b12-db40-08df09e38f1d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|18002099003|55112099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nYs0qVdDL3e7FJ/EHhu8zwbW07r5QTZM+galjptgi8pXePsEwZ2XY/RZVwmUKx3ovs6O1hLxEqO3g6XvdVV4Ud2D6zjAiVZlMAbqYqO/cOJuXZmiyhE08Z2qgCykhMWue27+F9sBNXinBJWtW7fybHcvXhlbHXlSCDHS/Rf5ctAgMI3QkYXX0DAvpyGnhmZE94px8py9hdFvdI5/wXRc9WnA5MxzUHUlaOZnlJ26lSAyR/+7z6HJIbSej1wshvknmSF82NMjYioPqgAF+cf/6uk0S7WOMGQCid8x1vTYFFIwuwqnA3JI7E82RJjVDqm5FsgnnJsdJfvNYxntgqFcqVsIb/5EvyAoERvojEnzPs0i4l/rbcRQCOkzSSVcpoBIO9UOs4RrkdepRSq8Im7xZdnhd/AwCHNKb/pBLXrtlpU6ijoH+lAGhZPVcxMxI+8swNCm+uq3RkHZZBNqJzWRTI24pPLYSMCXrpq4OTHr4KGrxWAJTE6d7IzmFtn23jJVN2rbDO2Nq5G4nTWqGfb0eIeOfg6/EXVaWNg1wD1ES8nea0EtxGozWpM1ha09ey2TxLjsNYs/HwPbFz64vVqY2FVnD6jg7Hi4rIJ/tJ7v9yRMYGMq3iJT/8aTqRCFNqRRJ+AhIqe9Rh1K5VA7PoTO+9fNvo2X+Y1UBLQGbp5LSZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(18002099003)(55112099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k/D/qDj2wa8cT5jOlccJ6psKVEFmu6LmayGtn/AylnVPXIogRnBFuIUJ3Vjs?=
 =?us-ascii?Q?0ye2nwLi10wpBUTvEE+YdZXfdpWz8PZ02ZCUpth69EuBzg2lkGajodfXmkfG?=
 =?us-ascii?Q?jiBsSidPGae9ZXqDFeVeIuUHQNPeyzb2Wgrz4elMcWR6NAPirge6CyWTIiBN?=
 =?us-ascii?Q?ylYsMudN0rTvQ4Wqx2qfLRtTV5+vbIfO5nEtc2CWRlN00izeFsPVlsi0SY0/?=
 =?us-ascii?Q?cSFiT9cWGzB/YTH5L83lZpoH/8QeWs3Mrx6dB1CmwDMUViLROnl02DnV9Qwd?=
 =?us-ascii?Q?97ZgYNuxcMNA32bS3PNuaBs2mKuygTIPWS36XfJOCBGo3puRfTERAvgstKzz?=
 =?us-ascii?Q?as/YLAte+ZDIkgJNj4FQ7ox9mP+rM41CXBgzjLxnlLSW1xjCsIL9m2XqLKtV?=
 =?us-ascii?Q?WwPqN0N4PM/ZiHeXO4iyn/m+XLOTcOcuAuGIMDw4LXBzOsxlQLlUGPVi7MSN?=
 =?us-ascii?Q?mmc1NIcDNvIIyssyP/oO1qbaVQW8JOwX9ivtDeDZsmWM2NFbzhg24SrSQfty?=
 =?us-ascii?Q?G/vfzrGOR4dVzMJhGKqkURHobs/GTyHPlCTMZBTQS3urcIetC+8kctBqFWnr?=
 =?us-ascii?Q?r1emW8AIMqOcDW+9F7rzsxid/48ZSk51YfsxQCXbnh6J7A65yWo6MsoAx/GP?=
 =?us-ascii?Q?hlbRckpXzw4Ybj06mXuaL5u6jtlQQrKTBgdubXAKnRxpXSD/qUzDi/qlGiHn?=
 =?us-ascii?Q?Mc3eFlf5wZP+HUPIguULI24D3GdxcrBdw8nbZcI7Z+xBcaQJ8mia7X5CxfzX?=
 =?us-ascii?Q?4zXM1J5lp1FQOy997mpLkJyd77MRuDKcwvsJFk//C6/hBf2XMExqhzEWAemo?=
 =?us-ascii?Q?uEeTMIMVYhhKvtDX1bN+Itr8gIxD7iSG1SGflFcIsa6iTo+H96WqvzHmOZ6h?=
 =?us-ascii?Q?IsDib3gUwOzh8z4bjkpKlaE+zWQSx+bT7PXeyBr7uOckaa0aSeQYU1PZE46c?=
 =?us-ascii?Q?ebTv3kzYNWd1aYChvui3r+IzSJeFkUSE/EiGaZnSxYVHbERquKtG3T2mLZoB?=
 =?us-ascii?Q?Pb8r1C2gzSbLgRxqfhE13oKTVEDp54XYLCsc2dbCvagetuakL6eePSlxqL9S?=
 =?us-ascii?Q?vbDKrjzHi3zT0Qbav3SOAGihWwcOAwggwdKmH6CG1tnLhVkzMd8E9B+thgap?=
 =?us-ascii?Q?9mVOT9vc0hybVxvM6HOK1N/7YJR4Rq84Gma+1xec0Lko2m4faVedyjEL09Lf?=
 =?us-ascii?Q?MIMdjsvqZB9bm20sJ2ee+hyznLRVliErPP/3W5tSAC1ZQMfbbVOi5z7CfPQi?=
 =?us-ascii?Q?rTAMZwn/qHm11qtuJ92R9kWBoX+h58QCKIlsi9aXYd9/RpDr6+zqUFyWKMM9?=
 =?us-ascii?Q?a3SuP56/8QrK2vdi/na56tMcGf7hmN0TGnJAcDN6RV3d3wJhAI8G3OK7jv1P?=
 =?us-ascii?Q?rFfGVqGztxQahuYCTB7XoblJdc6Q7vggOde2y+F7ty837vLKaAdotJdNHJqn?=
 =?us-ascii?Q?T62B1HTbeea3EHS5Ur7NYhF4lX+W7Mjp1mR5qMeJpl6DrMI14tXT4+H6uiNP?=
 =?us-ascii?Q?gJf1EVcbiu5kedHYUqcIP3SQ9F/1dreyriamQR9K34NboU9r+aDiAR0lhxoM?=
 =?us-ascii?Q?CABWWb/XRTXnuS7DxWemSn9VJZtt1mZOFC7/1fnFtcXeXbbkd1dBlE3UyRrC?=
 =?us-ascii?Q?Le9SXE99vkvL/lB4GRU0KCxxF+FBcCaNgddeo84/gLIkoMs5fvyh7FxvNbDG?=
 =?us-ascii?Q?XeC4Bs3RE9r0+Asr+ZKvK/Vx29pV5nVLabzIhAmwCdxZpWIe3YPJd/nVi9uO?=
 =?us-ascii?Q?BJhGNfkefX0JUWstd6jjHkGw1nU76Og=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e233e8-8aef-4b12-db40-08df09e38f1d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 17:48:27.6666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJ22xlk2dgYkl+v9vPuWTZkmBedlsi5gdUbk4q/LgsoCoFS0lHVlX9gmuWr2XuzpzI5/d9G3aqo6ySLOjOPPaEWAaTb0Mdzztze8RrPTFE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972

The DesignWare APB timers on Intel Stratix10, Agilex and Agilex5 SoCs
fail to initialise because their clock managers are platform drivers
registered at core_initcall, which runs after time_init() where
TIMER_OF_DECLARE callbacks fire.  With clocks/clock-names in the DTS,
the timer driver calls clk_get() at a point when the clock provider is
not yet registered, causing the timers to never come up.

Replace the clocks/clock-names reference in the affected DTSIs with a
static clock-frequency of 100 MHz, which is the L4_SP clock rate
configured by the bootloader.  The dw-apb-timer binding explicitly
supports this as an alternative when the clock framework is unavailable
at probe time.

Changelog:
v1 -> v2:
- Add Fixes tags and Cc: stable@vger.kernel.org to each patch for
  stable backporting.
- Extend the series to socfpga_stratix10.dtsi, which has the same
  TIMER_OF_DECLARE vs clock-manager core_initcall ordering problem.

Adrian Ng Ho Yin (3):
  arm64: dts: socfpga: agilex5: replace clocks reference with
    clock-frequency for dw-apb-timer
  arm64: dts: socfpga: agilex: replace clocks reference with
    clock-frequency for dw-apb-timer
  arm64: dts: socfpga: stratix10: replace clocks reference with
    clock-frequency for dw-apb-timer

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 12 ++++--------
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi     | 12 ++++--------
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi    | 12 ++++--------
 3 files changed, 12 insertions(+), 24 deletions(-)

-- 
2.49.GIT

