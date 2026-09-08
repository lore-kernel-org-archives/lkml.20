Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010065.outbound.protection.outlook.com [52.101.193.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F855A5124;
	Tue,  8 Sep 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887547; cv=fail; b=QWkSrpyMf/f4DlX+fS1MPEysn0iq3tljCDArrp0tj+WU2buxLT2Nt7P9EH/rCHdTu/LBlg6+KHyKWcXvgMG52zJGuieSu+QhDP84J0+bFiINOZ2GK0fVX5Nj/FWY8Ng/LAJ7xXtrngNFjvm8HDGNwoIXC12MkZRvBsi4SHyAhOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887547; c=relaxed/simple;
	bh=CHCt+iYzkVf1KhpXgoSZOxL8E7VHdoDY1cgTsBu/nFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CYOGXZD9d/tFRrAMr1/IGbsI3VFf2l2IsfZjjsw047Kn8F0BUFe8iA7eCYj0mDrAphkHyHdCeDhdNb3NVNQBayijQTl0tKORPG47bP4DVceBHv32QPO3neGowQcHAn+e+3EE2JlIdlkSnnJLEXWkNR3aEVCVwUfW6OO/37hOksg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=CuGDYOMg; arc=fail smtp.client-ip=52.101.193.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="CuGDYOMg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHiveP1AB8YEieQl61QktEc1f/xtLA3Vji8YGsj1ZMr81QAL5rUUmIbmWp+503+sduZraGNO8EGNhG4FqgyBP13+b4n6Ijv5aAEXq+2IUD8gcNyn/deu0oyVgNAE8mI7nm9T+U9Sg03iGPxJJU8eBeuhgDxOCTEZa6YeViXMxsi8Qv/EZ8fFQng+cAJqqHqQNvOpDGJQ5EXWaGWuO9mvzIkSx6GsAUya3+iKDjaDPxwhs8IDcLTKKjV14LpnsI3JoSOyh6cMMmHmv1Fz8N+EuY/71pRQ8kbqBC45d367YU7viXkminbrzqOTIF/yMrjtkFxqk4R9rZyEOoAJV/T/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSLhflMVgYtReTPHxuDS9grUfACbKN2AOmrXslB3BWc=;
 b=WcBGSzBIOJfxozKWn1MnCRqdZJnyYv5Docw45sBoFmv01HTVzFTtJfc+TNmcof5ValxttF4Bx7o5jNxp+KM4y84UL0ckjnHIpUcy1VcFyCTiCUJmcUuapaKwwwkIN2q07q8nszrMUCFN1b8kuDHffGXvqe/NJJwPhiPtalYTXrX8uJA/PlckvFLncD+gN6e5ac+sTgyw0JdArWvSVFVWOnFqrhidFjmRwvOr6IpY02UFhntaBbcCUhjg0X8I6s4hzHfs4juPz/v+x/tw55RcJo8eahlxQM3VIaHUc6kAC5TcBoIdL71ojPUVE7Kfi79vq7jJhQyv4MfY/J2x7JfVDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSLhflMVgYtReTPHxuDS9grUfACbKN2AOmrXslB3BWc=;
 b=CuGDYOMgKUZGvNA/jXPgGQJQqJhefwVUvbKk72tf8veFhFnk550nfVrBs5ojWNSnOtWLOdKe7cqcybeyiiuMkb2/Z06Hq73yesKFQ7pOAFSWeyZe/nXN1cclBp8BoenV6aFTSf/1ph4qpJHn7kFbYbdDG6Sv0cTgow2iK7NW1eL63V+A0IBUPO/W97jE6Hkr36epa0DfeMrtDp3AmPZYh2GT3iCHs/kSKaD0U00lnyzzYDdBDJ+QpPr+G5v4IwhJk2/S3Vhc3R4+VnW9MRqGmUg4z3DvEbfsDBWiy1wlvfcif3oSf5UmczRecpJ9gz2s+vh9AlxOtiBQmzcpyGRqtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Tue, 8 Sep 2026 17:12:19 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 17:12:19 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v6 4/4] usb: dwc3: add Altera Agilex5 support to generic platform driver
Date: Wed,  9 Sep 2026 01:04:40 +0800
Message-ID: <0cf95883882100550ea91d750e8b47118197f7aa.1788886615.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5135e0-f317-4dac-56b8-08df0dcc570a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|56012099006|11063799006|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	uCNJ3fxNgF+fDTrvjnLdyoOac/nNbif9iaS88sUMQwB5Z487oguAX/0RCCoFfrhqku7QfUzf0ykfx1O3Tw43ue54vXV21PVegI/lL1h36yLxq1VCTx90TUSDm2RbCa2S8hr1kMkTe/0882tvsN+n0jeAbBVC3zRElt9/li5XwiGbO0N6Y0ism2A2Nbw92SrXisS+elLiqtMOM2qyg+p+lfgcz3Wk2980Lq/iBlQRM+V1nhixw095+OgGxOX74PgnqPUSE2VY86xtC5DKbK7sEt9FDSl4BWRbw4a9rjgdueJhzd1K1CW8yVOIzdyTNIRQKHLHdEKUE1ft/h7gs4TK4zHVTVJ7hU/kiJ536nc0RiR0pGLILslxqHDltj0h35m1RjpdLSSqpFOEmkRdDJl32fmi0V1y0aRIiFWjrEGyj6w9tZE1HgUeXc7yg33OMrqO/qvJGFx0KegeYFurPtWCQKfa5NEWjXjQDU+aklubfHEjK9WQ7y4swyHOWP1LWPeL6FZh0aaS8gwDVH+hDK9mBsVCoaYr2vMCTdRjttbb1oqAdsUXZjwwRD7W1XxoxwXEsSdHna0exiotrqGrFx1vSVApLMRYlMGKrjyz1r4ra8+CZ3BI1X40LwPYe5U7Zrf/OFqVX+KIhjq3H4Hh3dCcREjv3zPLmrrcPq9rOL2aSwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ztOyLHrxgbHkjijfJ+ad+jG1Am/py6zFWIykBexef1uOeBZ9C3fQH7s3OQsu?=
 =?us-ascii?Q?qhCLEaKi5iv0LrRyB7HtErGPg75yupE6sDzPdP4/leBpOdJoWAM+YD4SaC6R?=
 =?us-ascii?Q?4RpMDWZZK8a8q5m0U4Z4dmeK8Lb+cqnpj+/f4JQrnpcX16G0iD4ah/5/PbQK?=
 =?us-ascii?Q?PxA9yN0CDggH7Cbt7a1J9nNZA4gsFn1vOIz/xkd8yUagvyDI9D+F9g7Jy8ij?=
 =?us-ascii?Q?1nVXyMl9vmnpFNWi9j9d9Nko4OzfnoCs/5SHxOabEE5eV/dZYyN/P0hHThZb?=
 =?us-ascii?Q?8SQn65Yv1JsrWGIDQogFe4nJGch5z7xfpifYmosQmmojb4TALLDQcdxkrWH4?=
 =?us-ascii?Q?TdjsdDzSpkDyeoh1kgof0qNOFzXk4gGQR36SArb8UktlomJA7iZovYp2olwy?=
 =?us-ascii?Q?ZeasMxLRdFbMZYxFu1cUCMMi+AbqEgvLb8qbcXKV5aQBDbRD1WBVfZY2Z77h?=
 =?us-ascii?Q?phEs/8Z4mOSrxiB+fV+znUUBSAchRMMbBjpZAty/XBITHXjBXrV7Bd4HxuRA?=
 =?us-ascii?Q?bl4bSl7uF5Iv64vLdbfy90X45hATA9pp8daC0s5YmnycIDnW5BJxviftEhkF?=
 =?us-ascii?Q?nQjn31PuVMFNqoCt5WTFQVhizz/7sSL64+2ehz7OPwpVYkjaZkw/omm6H59P?=
 =?us-ascii?Q?Ait8AXsmcepimUH2aBA9FDFzJPyGpBp63Ntc+hPETOEEjAesMIp49z5A5C63?=
 =?us-ascii?Q?cjxM/Iq+w3VAmBgs48KBg8BRY1jIQrr3tuJfecoE1k0LPl/UjbuJpFMHOioI?=
 =?us-ascii?Q?LN4Y9pxxu94hLozzt+Z0mdE1+EKCR/3pF/ixw8Z6DJGfRrzO7dlohvhP/0FP?=
 =?us-ascii?Q?q5jsIipv7/Hv1JjhPObsxY/mt3yZOip/nFsdZw+QYuWPwt2D7j3NJmvXvOSA?=
 =?us-ascii?Q?D9sdunHWB2IB3wifanqQQo8EJJjxPwbk6fgh6AWYxLis7obwfnTGeiEs9lYC?=
 =?us-ascii?Q?+PH3Rv9od6Tx1agHYkt4U56g3+2nPeX9biMMf6x7TB7CVOs0U/lfdFv2TxZ8?=
 =?us-ascii?Q?A3f2FkTa2qHxNe+yYcJxKv6d5f7ceZPLNcWBUCQGpuhd74EgUc7L8jbu2Az5?=
 =?us-ascii?Q?y9px+7mwHgmAiRFodFvGT7ivD2PZx4DKqYSN34WIqdE/vUfOlCi1+Ehu7kbi?=
 =?us-ascii?Q?PdvvxbZPGOl6qZ++TXs8eDGott2Op1u78aa+bJsjUxaj3hUPpNCYt/GTbsMw?=
 =?us-ascii?Q?6BSfUjt0dw+Ocusl6aNeJTSerR5c/syQ9igNpBu4rKlsaQM7Fz3ltfqp+e4f?=
 =?us-ascii?Q?D8vnPNefCgu9nSzKcaUSBcfZqhH1AeNozfy+bBL5+cHzMkOf+LzkYjgZlm/s?=
 =?us-ascii?Q?VkhYqeoUEym2uitg0RKJwI3drb4+zev0ZQBZT9c1YbEhISY1MtGf7/PldYto?=
 =?us-ascii?Q?q6mVL680sYArmwXUfxd8jMCQqqzbO5vP8GhDPT8DT4O/wvcG/+Vys917Ul/N?=
 =?us-ascii?Q?eCGq8GdcjZDgqiujYtRzll0EE6qib6uCtVMbdHfFiKywmzHpB76UZAcPuZ6g?=
 =?us-ascii?Q?y0eWUHysSO8IZGVyF/s3J6hpF5BMGa4HrPFe1h4rM4E6E9q2KUk799807J5X?=
 =?us-ascii?Q?3Qy9rhn0GGK2uNf98Z59+CueZuJItTrC+RizB1TV880u55RVjW71QzCd39MA?=
 =?us-ascii?Q?E7eqalvmkMPu+6IgUlhTJd3ynC+cHrGAtP44Ht+sCYAXcw3+PdBiNLxJVorq?=
 =?us-ascii?Q?Xn9Xt1EOr08fsEy4MsMkRbI/61LLcN9BHUc1iqgQpoOZY3QXIUa8Ojq+et66?=
 =?us-ascii?Q?6kkkxc88/gxIZ18iRRR0SRRUx1Xyr7k=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5135e0-f317-4dac-56b8-08df0dcc570a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:12:19.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJ/dPoJKMby4Yff3foIkG+W6rDdv4snD2PHHhW5nw8o/VBwwhFqRibXq1jLi20YrtUIf9+btDhLGKV7RYNCViUf+CTFrXXVkfLl991E4tJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6560

Add the "altr,agilex5-dwc3" compatible string to dwc3-generic-plat so the
Agilex5 USB3.1 DWC3 controller can probe through the generic DWC3 platform
glue.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..8781d7ec6b9e 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -232,6 +232,7 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "altr,agilex5-dwc3", },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
-- 
2.49.GIT

