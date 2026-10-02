Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CD13EDE57;
	Fri,  2 Oct 2026 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790969085; cv=fail; b=G4EXhedQ3OBmv55LbRzwBJ99F1ktrZv3Hou/Bz3Ona04Vf/XYIe1IlFbOGI1Gezk8LO53+kgVAxW3OWA2UbJ6SwY8ZNZte7BmQLkjNCC9Y2dt1LJKgtGzrTTLJQDZwumzJfqLmtTt6ngRZjkoqd76du0bgbdVYKuKPfHFI6E1Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790969085; c=relaxed/simple;
	bh=W+dnmJwEEzfzj9EiENK1pkTjdbuNMNNj+7cK/jSDNwU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IHLdgznF6BI4+pxz4nmkgJqty89Rx6dZnabHq4lUmKxkJRON1qalW5KwxfEwCBzKKES2fdi37bUJ1ICROd0UwyHo832/eu7H8yotY4o+lXp4aTa73BrZutahFWmrVqjCZ6DnV5380HXjk0sO6JZnowr7889UYFDgckkseZ0F9as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mABYsSuD; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mABYsSuD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFM005JwA02zV2PGNjltsuMu7dsShoX8oAac5rxpRw1B5eadRi3nCkAVlPHpIG2W/2HvgqQmJttklWF4wysPTTXtTrUgmRk/5oej1WaxfxFYhh3gwvKMFzIEfNsQwWkuTzZfNMBG3PY+qrzpGpnwxHzKp1lu5GvJKgPYMX2GBOk1/jnK48ontLY8vxrhVi9vcwf6gWNBqBgehLS/N12uVYj1bzwGciyzSXQ5YN/p8OAk3WBIJ3FniaRl0gNUqhyDgQIOInMyctposwii2VTK1uhCs4iL2yeX7DtX7f2pAN9kwfPVSpz4c+UrgoVR7hy7Jid37M5UY6IveGca06hiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKAq6/BIKksdIYrNj8uFe3uzil1XegypDH6SLL7e+mM=;
 b=OasIEESg/FNQMmmMQqOVHY5bfTtSq3rlIm1R9mfURejPrmsk43c+e6lJPoaRJZluoG2lntDU0QvfR0NiIYGD/SSjuWw1ekDUt5q3UtzIflUtnLQqINc9LkTPnl7LIlss67iW2fe46Z2wwTHt+oXOANKo9VAbIQZJSCgviYfxPjs8ep5uuVfL+XSAvTL7dkQaiXaWMepVX4VI9x3ajI0sOCN5mSrC59eE3LIRiikxOci+8z42s2gopO+0CXcz5PmILYE9Zi6O3UvzcmtOCXZeiLrElxTFi6sTQ26YO+tlrwd0dBT2jBErTmN/0Zg2NOXF3z8De1JlofVb4s4s/hzu3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKAq6/BIKksdIYrNj8uFe3uzil1XegypDH6SLL7e+mM=;
 b=mABYsSuDA6OQqsJhr8fGq3e++fimUR/15LT7mm0J+1mqp52bMjBh6UEUm3kV4k8FH4whhYWyTU9T3GyWG2S+PSBGZow4Jv1tj//RCnN/SfBIF7HNl0p2Xh2LM8zri4/m5l+6R1J0VrwY2ss7ARL/L7GdY4bTeAbBI9MU3MFgVCAOaztaTeRvUqBrA6G2hEy3F82+YTjEjOnzt830HZWN1eiuYlH1twFEvv13/9JXkb87g/gJt1uSbWK1PI9XPHHtSsy/mTLv/oTsTRgu21NDc29jorBs05QLCqfzoRdKrF8M2vLRMXUnsmZDNaFQ8szI3Y5+fK/z7JTtSunvFYupkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB056237.eurprd04.prod.outlook.com (2603:10a6:290:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 19:24:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 19:24:39 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: vkoul@kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/1] media: omap3isp: hist: use dmaengine_submit() instead of ->tx_submit()
Date: Fri,  2 Oct 2026 15:24:25 -0400
Message-ID: <20261002192433.151510-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR12CA0048.namprd12.prod.outlook.com
 (2603:10b6:930:49::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB056237:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d1fad2-c258-478c-fac0-08df20bacd70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|23010399003|366016|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	z10oFDelwtPT77k3eNqQVWi8fCK29dggx5ETSGF1N4eYjfA3lt2V9oNjSwkasP8CIYsFZVAYz73VCZOXI11cuYU9mQESwTX+cbdvc46P6RgtpIQtfCOo0NdT71m2TKH6vmWzLsrr/fN+VzEZ6tqrABzrBE7SQ9FHVjKrBO3cKL1aIh9Y6oc9zXw5fuxvpgnF9+tmjii9NPg+iMN4gB7+gdY0nnF5tvjwQwbGi8/XfhQoBnKEczCpDQP/2GDya+A0NBshwIB/FsphZ0sz73tQVLDmgULnTIpcOnx66Bios/wSjce0fZaaddEEsvwyx2LUmhZfi45c0XGvG5zw5y6asYOH6Tx7pXgJghUgHXim7skXsXg2Cxi3yPWsQRuSlQ4Cvz3YvYjUiTtHhU6Nb1ASct7aYFJtPUqwKiyMLiG2k3DaXKOLpgdH37oCuUDEqfApKg3p4y8sJfFmbmdyFE42rFi61QkTTML5Z3KZb50x5pzD6Gqk2Xqds97lI3lZrw18ytWoXE5Smi1WEsdpP88ddvwu89TqAJiCRa/tWEgEyBTVV7aDcbX8RbLw1A9w/5i17KHksHiNPQdrCOibhiN8KU0cQycOzx7INJd26aG/2cONDqLhi0zIZurEIlgj05/yGTVDKupFvJCm9qYLBZpToIA5ULY4mWKxNn1zr5DF0lU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(23010399003)(366016)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1YwMiCkmuBnneI3VZ4Bhwh1gF6Txlb1/CmGKqysogyvMaiX9GTbTF0tzilLn?=
 =?us-ascii?Q?8lsf/RmbOUMWphYd9fqeUwDH1T6+3E96T0yjJmS8lBVu+D+YsGp6CnHgg7BQ?=
 =?us-ascii?Q?zNRq/I8kIYP7dmDYXU39bwJz9t4mA0IwDfVpKE7pWbCGpGi2Mjb6OaEKdF/F?=
 =?us-ascii?Q?+odqDgjxc7TWAIVtMe2Ol4DJjiiFHyImBWki2wS3mDAukIrosgnGW0aGnwXS?=
 =?us-ascii?Q?5fVJrHJSR6OD5KoVhNYtFTdiO3IcTDma3dNb7o9tyqDuX4Xq8EvYXj3DrQjE?=
 =?us-ascii?Q?rabMcFqJcob0jrGZyPnstD1d/tQmfpGCHPaeesREEkKPlF9OtcGjPY1jrYdM?=
 =?us-ascii?Q?iaRgdAQIfiADMvSi8nYjDq0xnZfWyel0k8UooHWXsU3vf3VB6tOIAPkgQV+j?=
 =?us-ascii?Q?6UDA6bU0UVWThksyWgbky9UUyBru5u1Hjucbw97VjHvVo3UMw3gqEibXqRKv?=
 =?us-ascii?Q?KsYzZfpBOwWpxBJWVg9ptJC2sb6anzZYikEWH3zupJi39IcZytWDqhS6P26z?=
 =?us-ascii?Q?zoBSB1IWkchAgIzKTm7+Z3fxTChLyuyWjSUhskpcXJzxIo8xXM++CBJrzEbo?=
 =?us-ascii?Q?LNb1G9wBvIpqUf/O6/b322tXU6OtOaUa3YhnbCqXdKMDxnAmbzToe4CuEqcj?=
 =?us-ascii?Q?xO2xTfXSwQ9FQcDDuXIuXOjQPYqcxWM++hldq4HuOUVXWwMriQWuYKR3J/qu?=
 =?us-ascii?Q?P3yQzzkdcB4GKkUl4BN2jIaH4dFCvAYjInt+eTE53TSYvrcWu9tgkHmEhwyN?=
 =?us-ascii?Q?nVeWJvudJ4AFKz4qRtEMyEyI+GqqqqdVtKPVRUMN3+qJwW/+kri9TuoqsEkT?=
 =?us-ascii?Q?nwLnX14BAOaqTAo2zCnR79Pm020OejMlkrxvt/sUvKcx0sb4YGfqq8cUKOA4?=
 =?us-ascii?Q?tymTFe9JGqhGIe+zAVVLbffh+qZmP51X6EoaKpgtdqMiGVZ+sVpxNsKbDZHI?=
 =?us-ascii?Q?JtnslC/JJhYhM7KqxtM3qrEMNXr5N2WXPYOLMMZZ+zsAsZCe6G2RtqsAKuqs?=
 =?us-ascii?Q?Fk1CIgmNdIaJnrA3ucC6i2wISxHgPtJrMfM6dvc5UEUL+2eowX+pFhf4NUD8?=
 =?us-ascii?Q?nrJNn/dlRJK70bSr+K5gsBE+JtF7sflQmYXFByIKbjZr9e6rWhul3Bc4BZLH?=
 =?us-ascii?Q?FkdH5oNc+Px2R6qmt3zF6RbSi9M3mDa/ZMq8uf0QqaGW5PV/1Y2slSXvU8k3?=
 =?us-ascii?Q?5AdWtM9+e257lBQQGVC8nG3bqo2nJAczU+Cu+wTZk7hyshwtF99uojoG+sTy?=
 =?us-ascii?Q?Aju2wGVyjRDypS5DbSz8tM0XvOb1HjXClfG9TJqzykIkPmMdXkYUZSqC0lTN?=
 =?us-ascii?Q?FzprlxOiVk/+ULBz/0qnNWEIRUfw3o8szsPYCKtJG6xYj2nteq0u/R8aJwK7?=
 =?us-ascii?Q?DboT8hmEbfVVCLDYf6D3NVPInfJzUJrlwvtpIHHxguTjHgLvdNaVAXAHyXQr?=
 =?us-ascii?Q?CMo6j5KGBjoC0116K5QOLE/8vJOdzG6f5CkLXPBA/1IUiXM7ZY1BIwAx2zbn?=
 =?us-ascii?Q?B1owvMHkr96QlCM02ASszv2/WRGhBz5KALvcjIr2Z8T6y+U9Mhf7dSMzxu4B?=
 =?us-ascii?Q?uHLefb9M4JINbZkCEN34D79X7svDUatlEbixeLRps0hAe0msJwb7C2lABA8g?=
 =?us-ascii?Q?MH0ecK7wsmJPm77xV48K413x34v2wCGxXfOdbxowkjhHw1u68xn6+NApAVHu?=
 =?us-ascii?Q?iQvWYLZA4XGz+q8Y2KREui42dVpTYEJyxS1UTkMyf5+WOa8tDFvv9pvl4RGB?=
 =?us-ascii?Q?Ow06RlsVuycdB5YYZ20WE3P6nNM0Oq+6wF9tRTkZDM8DsrDewGXL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d1fad2-c258-478c-fac0-08df20bacd70
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 19:24:39.3866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eF6KOQt1tDUQhgLJKAsP6QV7M6hp9CF9oMLrG3W0myEPYqYp9yZ8pjsDJ/TTjF037+bjQmaO2c4t8azO6u+1dYqYAN9+A2ISRHCu4AmKesJ7R1oWTWnd2usJINAYsGBO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB056237

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_async_tx_descriptor->tx_submit() call with the
proper dmaengine_submit() API wrapper.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/ti/omap3isp/isphist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/isphist.c b/drivers/media/platform/ti/omap3isp/isphist.c
index fbfdcbfdb050a..dc02f240ee89a 100644
--- a/drivers/media/platform/ti/omap3isp/isphist.c
+++ b/drivers/media/platform/ti/omap3isp/isphist.c
@@ -211,7 +211,7 @@ static int hist_buf_dma(struct ispstat *hist)
 
 	tx->callback = hist_dma_cb;
 	tx->callback_param = hist;
-	cookie = tx->tx_submit(tx);
+	cookie = dmaengine_submit(tx);
 	if (dma_submit_error(cookie)) {
 		dev_dbg(hist->isp->dev, "hist: DMA submission failed\n");
 		goto error;
-- 
2.43.0

