Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012063.outbound.protection.outlook.com [52.103.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D8A258EF9;
	Mon, 14 Sep 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380096; cv=fail; b=EH0AjcbL1P7mZJbiHGWdgZFFFlH+f3tVrPshN5TvDtFUF+bb5P1E+W1noxvNCjKk9ANCjWtUm05GKc/a4JOHMKLwvJWhgEUbl2uhb8z2Mwg7HAfXSnIaaDeh22rFJr4jshjmnxET38d3KfgkPf2QDUmSmeXGKS7U4gJA+JW6Gw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380096; c=relaxed/simple;
	bh=OW3Igro7LpJokZqlUlVAWH+lFdrhK+razYttQwG9q4A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sJ7SCeWxF+C5nH8BzuZ8DxxNOp8Q5VkV7Co3vZmJ4E3bp4vKeZSFVVr/CSf+YbBcuCp0p7bXe6Yh/pYsxwutBchkyFJpQw2WQtdDnZwl+PFnSlQqMnVg/ROisNrVBoRgqAHDa6rt+EUc8eavtx71+3dNiF1N1NvH8//4P7MLNOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=OLREndsc; arc=fail smtp.client-ip=52.103.66.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="OLREndsc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6Wqdk9bpcNoRd/mfx+c3kvgc5U/51s8m0kzRWLPPooSS7XamkGEopXndALVo5lu3R/RQTmNWdPpB31p7zqSRye2WMtcP1YZwCPMYfSgTmxk/8/szoyZxSjXskNgIdww1OzX3L28iI5BIz791ahc2hZICNFfZ21d/4DzlX3lNPxRjYfltGvp1EEaKEOZ4yXA04RLfSxWbak8nqWCmA8Os0Oex8T53BRmvsCQXlTmDShSU98wl6XJs3lFEm1v86UZlLBhzHtjq3wVN4NOGKqouMtH0+URRARan7YVqroMIJzqefEPrMFIh6RgI4OiuzEb0foMLkv1sdVBLXwynw8+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efKej7+bnrMQRQDy0MD1EMyrhYIGaYVK0BK8SspTCFk=;
 b=Oh715mr+z9FmwICTmgK2Vr5O6mm9UUAY36CrhBP8uBeSUcgXRh6m0MtVhda5Hyk0hs8Au0SWedIGdzWLBq1JSuPmNWf3kS/TeVArPGt7hzZ+Hst7hIMjWXR7Z40hmr9CSADsjTgJ9GTfuvIec0xJ18I5p08GsXVHKfJeQZ3UNAd8xYhqyktAi0OYPeKMaAaoCRerKZPvCLMB12JR8m9ODIunT0GJUZaiXBvTWw3KWh/5tHQ1Kb4nTL100E/5OCeEJf0NutAndPUs+SlZJO5aw4YHtrO4rBE5Ft15MsUGzfUASvXlunQ+6huXCWEWS8tcqJWo31ZScULYtMAgq6MaSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efKej7+bnrMQRQDy0MD1EMyrhYIGaYVK0BK8SspTCFk=;
 b=OLREndsctOJfwedN95Cs5lK7FHl6Z/tLCs0z7xZ7Z8QjVnMj5Lsb8ZBZCEQa/g9WmOOCRDarpWH2zUAq9tFcbX7n3PG/ptqGqft7Ab9yQD4wubdoE+t+WUJbYDmXgXK+FaloNYA2AOco5HgCDz1ga8WZI8fT0iC0E5AtQMlXxOkyOJZgCa4d0y4Zh2GnPDibfcQnBlnH6X9E/3c3XYjasix1WC45xFcn0M841+u+B+zJvxSVB37gvTE12VelDmvGxtEFUfEbVfsuz6U2OB5W/mui5waj8m2L6ddYDZifE9tQ/3OzNm/bI6EV0GtQFJ++z69xSqW50O6ZDRw8nUxtSw==
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8) by OSNPR01MB7651.apcprd01.prod.exchangelabs.com
 (2603:1096:604:318::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:01:29 +0000
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83]) by PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:01:29 +0000
From: Shujath Mohd <shujath@outlook.in>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@somainline.org,
	martin.botka@somainline.org,
	linux-kernel@vger.kernel.org,
	Shujath Mohd <shujath@outlook.in>
Subject: [PATCH 0/1] arm64: dts: qcom: sdm845-sony-tama: Enable UFS host controller and PHY
Date: Mon, 14 Sep 2026 15:31:15 +0530
Message-ID:
 <PUZPR01MB5141BA498FEEA594E61CCFB1C3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::15) To PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8)
X-Microsoft-Original-Message-ID: <20260914100116.15283-1-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5141:EE_|OSNPR01MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fe9367-562f-4bfb-0013-08df1247257f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|15080799012|23021999003|4140399003|25010399006|5072599009|13031999006|8060799015|19110799012|24021099003|40105399003|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JW1chCzPZCE8+yQpJjzGoVKhC2gKDNGK/4AQLDHR9q7TRYZc47KU0wzCM/7/?=
 =?us-ascii?Q?PmNPVT45tmQgvo25dzYaDJj65s2bPjBINBxNJvDhnMsR8UMkmpK4vZ8xniBE?=
 =?us-ascii?Q?VTNsCREWrx0Nlhut9/qWfEydFZTkQQ2FZJKbtSMay6cpg1NYFNchsHTdFrMl?=
 =?us-ascii?Q?1blwu7LBjQNjyAlnEN08pcfXS2zfAVYp3Vx8UMEi6fHpN1YllcFHBomTlew3?=
 =?us-ascii?Q?aonLTjJI4f9Pxt1fLEeT0+tqxHzF+Z+1S2yDae2l5nYs1M0CMwuEqinCP3G2?=
 =?us-ascii?Q?8EB+ZYLpjwxEQH6yBaM7aP01yxw64BMRDzOWkQbgBGrSiyVAmq851cORrrZD?=
 =?us-ascii?Q?GPfehGy3V0OABPWBbM4neLkKH4122jhWIof9XH7/X9GpBp99P/RlIHc87STh?=
 =?us-ascii?Q?Stzsqchqddo39atTUPuervWxd4kJTdOSvkphgQ2GFxnqhGzrYSaycOof5QZj?=
 =?us-ascii?Q?3kK8WEbViWnQQp+GHtJc/5vHJdInKUWTlTl3nX6S9TojaX3wvNmif6vqAQYy?=
 =?us-ascii?Q?GWDoR4bRaSjTBgZoorjD5SH6zRFqcQ8eLupzpJAtDAymqYakfVJmETttLu/h?=
 =?us-ascii?Q?p0RlXWtZWZTOzo5aIRexd+CBp5nBokldcXr/DTCJYE60L/ajSaQE54iwKqZw?=
 =?us-ascii?Q?fGaPsHzo9nT0dNQ1mxD1vlLYimIudk+72QqP0c78ef0gf5lVElnB18ub0G6W?=
 =?us-ascii?Q?781t7hEkb8F1dxRQDmkPpjR95RWBnhA2S1+oIxO7F60Wjmg/DFIpc9aiGwsP?=
 =?us-ascii?Q?jI78htJWl5hhJKG0Hs5d24nOimU1FfqlZu9DdiTZq0AkM16jfoGBGkIG9jTL?=
 =?us-ascii?Q?Bs7PJPXWUBRa0FeuBphcuGsxGS5km7OLsMbGMYnwaAAFQzoghz4VObHakLdH?=
 =?us-ascii?Q?Z6sOKPswPrr0ycwYrEayYOQ4ICgTo3O0saqrNddXFLKV88AcHhevDcUF9G5j?=
 =?us-ascii?Q?dVnWHxQrO5sZKqRPi9/a5tbNw+Ups9bMkaTu0AJI/tYX6ZW9MuezzKAQHYVj?=
 =?us-ascii?Q?JDW2?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IQmgCDvRsb3FVrEWJkDckwrxuWcQ6c5U+KDrmxTZjff06i37m58hj/A4Huh5?=
 =?us-ascii?Q?/t6f4L+FgINegE+ocFFptmRJWUtXsHB4RqfEIcP6gsq2+7ftRv/shSs6MhW5?=
 =?us-ascii?Q?Myq2jzDWfTpQ8DRbmimdLyp5jumDGx7a7Vj1lxqcrIYkoUR+63os//2oA//7?=
 =?us-ascii?Q?EI0aCorKZWAqSv1MKWXMh7zS/ZZDSR8YbUCeeNRegcZxt64apgG16yatMSCJ?=
 =?us-ascii?Q?np3MQrCIuNHT7yvsrUFKfPPkfkcNYMqwlhUJu7gSpUh5HEuHELyqNGSqJeTf?=
 =?us-ascii?Q?dDYMxQxSF/7CIVIAbKsrYnzpYmmU48b/mX6Ctjec6wHR3Tkzjksk0eFnyOHi?=
 =?us-ascii?Q?Pqw3ZtGxQlKoxLk9ssviCRVNkA5zumaYtrjcT9P+Yop//DRBjc0hG0jqI1yq?=
 =?us-ascii?Q?g1a7gvidvEPcaaJe0WgJUtJDcFEWGO7GMWhvi7eGuamjzsfHCZvkgtdGeEN/?=
 =?us-ascii?Q?/pu7E+mm+vpaiwHnC8/gbddIKxSJovEoeMTvL2BbQE2tE1euq7z4bEPOT914?=
 =?us-ascii?Q?+86TqQ5/U35qOr+s88t1Gd14O5o+3j1/nj7ugIUvptxSg8az+7tURjmb6NN/?=
 =?us-ascii?Q?TGeNam+Xv4e9AP9LNXpBnkJuKhCgSsVluW/QqDFhuVordzlOVIw6zDToLbhb?=
 =?us-ascii?Q?dHEB7Vi69iSb1W1lmr9nD0FbqMpoCf0zWNIDd/YYe7xRz9X5rlL6N2G1W0eB?=
 =?us-ascii?Q?pIvVw+7+7Dsn5t0P6wsZWUbuq2Dxy5skj0fjcgQkNm2jWQI9bWPbfsAxrKan?=
 =?us-ascii?Q?Kk0MjXd1KX81YLucONysvBj/5BLrN8LzUBv4F818OMcdCNZKaGLpDOdJZ6hH?=
 =?us-ascii?Q?VvOuc909LoBHcdxy8VOGpSzuXaCgW+KeLMkHR04ks6UAmyMBvHvvk8N8basg?=
 =?us-ascii?Q?yFV1qgBH0OWsCmcHLuHvCJvmI8+gh0DC4D0K2Qkk19z0m61xrFV7TfWYqy7l?=
 =?us-ascii?Q?n3krfUIg1teKBFNNh4LE9L0GDfQ5Y9oQFq5/2v6y0w9viECdIDu3C+gLVm7K?=
 =?us-ascii?Q?cljhcDDouMDKH+gdh7CiZr9fM0PrGITbIA8e07RIaiTgc/fdapIVX7ScgqBb?=
 =?us-ascii?Q?kfAFdpMoaBwZJZcJvdvxvNmpYPL27Gp9wRdz232c53lgHWq3PxDdXQ5MPJTa?=
 =?us-ascii?Q?ljiPpgh3QfiJQ6MEXEc2rS5khg7avCrkzbIiMgnW5KeNWJmsr/nU0Nu12Bap?=
 =?us-ascii?Q?l4wpU64rFoSJFH6YLDZ4JwfjzSqHktM2PLKNA1SNlnot2MNAsRnFKYf8nzaN?=
 =?us-ascii?Q?hSjdNddic6jQssve34ZNfMgjUcoEbbnoad8ppaMNAf/+zgn/hKUnUsvNv1dY?=
 =?us-ascii?Q?50o+9bTCJnP3KKM2bYNUhvB6aYDCArSd9FmfqFJuDq+8wL1iWs1KAxwZJpN+?=
 =?us-ascii?Q?5YcxVw021Xpl1faFwfCF5KAMRzyY?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fe9367-562f-4bfb-0013-08df1247257f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5141.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:01:29.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR01MB7651

This patch enables the UFS host controller and PHY on Sony Xperia Tama
devices.

UFS is currently disabled in the Tama device tree with the following
warning:

    /* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */

This restriction was introduced because of a known UFS behaviour on
these devices. While investigating whether the historical restriction
is still required on production Tama devices, I tested the UFS
controller without the historical UFS quirks.

The UFS controller and PHY successfully initialize when the required
reset GPIO and regulator supplies are described in the device tree.

The required hardware configuration is:

- UFS reset GPIO: TLMM GPIO 150, active low
- UFS VCC: vreg_l20a_2p7, maximum 600 mA
- UFS PHY VDDA: vreg_l1a_0p9
- UFS PHY PLL: vreg_l26a_1p2

I tested this configuration on all three Sony Tama variants:

- Xperia XZ2 Compact (Akari)
- Xperia XZ2 (Akatsuki)
- Xperia XZ3 (Apollo)

Each device was rebooted repeatedly with UFS enabled. I did not observe
UFS data loss or corruption during testing.

As part of the investigation, I used EDL mode to access the UFS device
and dump LUN0, LUN1 and LUN2. This provided an independent way to inspect
the UFS storage while investigating the historical restriction.

The EDL/UFS access was based on work related to CVE-2021-30327 and its
SDM845 implementation in the katana project. This gave me enough
confidence to investigate the historical UFS restriction and test the
mainline kernel with UFS enabled.

The testing indicates that the historical UFS restriction is not
required for these production Tama devices when the required UFS
hardware configuration is provided.

This patch only enables the existing UFS controller and PHY nodes and
provides their required GPIO and regulator configuration. It does not
add or modify any UFS driver quirks.

Shujath Mohd (1):
  arm64: dts: qcom: sdm845-sony-tama: Enable UFS host controller and PHY

 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

-- 
2.55.0

