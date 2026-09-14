Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012056.outbound.protection.outlook.com [52.103.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59C0258EF9;
	Mon, 14 Sep 2026 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380104; cv=fail; b=YFB7FG9L+0doZ4suWtSBiYfDXYSkU1I17wx1ff9SxX2h3Xl9/bXm0CdT1S3b1dZSnUOJGrRQEbZ71aAEIF4969QRubIzeuB0yN4FnY/+vodm/ixYw0/JKKds9boEZ//r/22ZpU5KMsH6I/NMSVNj6HDwZwSLuTdNGJQB2iomxNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380104; c=relaxed/simple;
	bh=Cfkdx3bebc908ZgkOnADxR9WrZQ4267AYB6x6H2oaJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tmoqLc1K7sz8VReNGFEK6CseU8L4YJrVbCk2xwGKuXlqeoGdXXj7dGT47tKRbkV/6cMn5iOpaf60+Cpc8OwVgWs9iZoMKgd8VuqCMkAofdkVfELhU9+UAjFz0+f0gU/C/cznZkCWWOUvRs5I4cK+KL63QKGBcZ/aJ41Fuk1m7LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=F1cVeyc3; arc=fail smtp.client-ip=52.103.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="F1cVeyc3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APtMABo+ydTj7XCm5Vo1sbkoLCQabDH00S+Dbv+FJI6+0LCuZf73R5JDpxkBUCAN/j4ywzm+Il0UKpvLz4W3ZMUveDC5RU0qcIk+wK2UaoeD58HvQUSIigcRnF0bNFwT9oWbRP6htzbUGFkRZbgZBp+k+b9x5RW+K7tS1fbOA6MC56oiMqZ8THOL2WaBSr4eUrs5JobzGaDGJzJXmclj7dvrqDkvGVIIovfkC/OzyjtSW98vLluUUMWuFdFhUCLzzRx2axz5WOrKzxo8PJROGOjsTNd4Jq793srOtKkwIAOiKJ2eDjNQtXnBk2+36Kr3XQg5C9CBiC0GkguY1zBRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/44f/eeH/O2at6ihpVUuxkCuYLRIpVzakwncO3UmWM0=;
 b=GBPU3JaEpoabxBA6AV0d9NuT3MOv8EuaNpkRU2fh9kvQYDQxUwJbYiJstGULB5Fd3mJNqK3kF0iC/D26SULvfjaPQ0fwk604CibGrghvmNKD/EX5CkUgEN0L3hfA4o0PB7rDazqZt4jh5vy9h1ATM3FIcHArJ7y0KR20DFT/UYTvpXIK7J7SvlCIWTrSFwUUZmVTrLFMy7UQvtt7F1plDGbcP5vVgBZfz3ESgCBUZn28XonWn2p+lQr0qK6hLg/Z5VdDxAxR2HtA8WImOyyNjvF8BhDjJKMUV3jpJO6DUgvYIgNA96oMhFcEHtx2tsrRHVzD+a26PUM9rvQA7bKdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/44f/eeH/O2at6ihpVUuxkCuYLRIpVzakwncO3UmWM0=;
 b=F1cVeyc3nED9gVvsslLWXwuH7OGsf92ARTGixcoudO1EmBivGDv4AQm4w71qTt1sZTrvk4/MKGWB6JB8VpAwYG6H+P4+YEA7pOWPP4DtNrfbQgu8158ZlHuARdP9HkeRae1sJYTri6NCU1zOUwXAcr6Aj/B8oGioJ022H9uc6xFeor4GL35P63qXzRy7fI2rLxUA/yglgOu/+AA21A0eJDUA/bFreIfL0H9AcT2krGrylU2GtDl19TH+XMipZajhqX6svjKVvPGo2Gj5iBPpJBy0UQgWO6vxTy8DZrTpADPi1Zk0gvr4N+Z6Epv00vgpaMNK+aYyRkrxdeAA+AvOiw==
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8) by OSNPR01MB7651.apcprd01.prod.exchangelabs.com
 (2603:1096:604:318::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:01:35 +0000
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83]) by PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:01:35 +0000
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
Subject: [PATCH 1/1] arm64: dts: qcom: sdm845-sony-tama: Enable UFS host controller and PHY
Date: Mon, 14 Sep 2026 15:31:16 +0530
Message-ID:
 <PUZPR01MB514158F5EDA660AC85FA8D5BC3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <PUZPR01MB5141BA498FEEA594E61CCFB1C3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
References: <PUZPR01MB5141BA498FEEA594E61CCFB1C3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::15) To PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8)
X-Microsoft-Original-Message-ID: <20260914100116.15283-2-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5141:EE_|OSNPR01MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e13b3c7-6cf9-43a5-37f8-08df12472932
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|15080799012|23021999003|25010399006|5072599009|13031999006|8060799015|19110799012|24021099003|40105399003|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5i0IaNHqrvz+SSW27JY8CxSYHh05N1lGulRr3AmylJIe2KU9JBryD4sUv8Oo?=
 =?us-ascii?Q?bKl98N/wEj1/AoLlRE/JSUyTx/h8O4k4D3RkaLAY+z1YawHNqFaxQp0HuuMm?=
 =?us-ascii?Q?HKgWVNzuo0ZZOEP5j8hIljD1qnGZe9HwpiAp8IbbU7qHdjtZa0AeT7cfBeHq?=
 =?us-ascii?Q?kakaoNzPc11Grdlc5mapOpJFo5yCix33Y22KVUbw2R0JuJ6Dqs7d2T5Nyz4I?=
 =?us-ascii?Q?IRGB9Uz55yCzUcQZt/Jvgh6og8YiWY4GPMcN6yhD4b4csp4yW2yP5h2vPeie?=
 =?us-ascii?Q?Od/yMP8FCDOobCzoaO+UM326NXzEj0CcuklQzROnE4er8v97prXz1JOGCN3x?=
 =?us-ascii?Q?jAhZUMgeVVXXbF57VvKpwnyM2ywLm9XX5bFowHW30Tm584nmHSbX+hMInSM5?=
 =?us-ascii?Q?M5lRPsFQs8Sste4OZjxdOyN3kgeNKCx8G+kAEfF6B+g5wWF9jLaiuDtFSI/b?=
 =?us-ascii?Q?vWlnaoUFeieO0SjJwnIGGb/HLw0Q7iaJ7rheuLNJWZFI0R1gWUpcZAaRJqZc?=
 =?us-ascii?Q?ko/uyDvl50Pd70iPjIkDQep5GRjweuCBQOgJlE537hTkypqjECCnlXXCVupX?=
 =?us-ascii?Q?V1dZ0ouqeD45pFYOX4Mm0E+CjKP3ALrX3e/kGvfTImnYrR7BvjsuqrUq+OgG?=
 =?us-ascii?Q?8RoYOynPx0aPJcg+ZkDoFsP8vcMhfwTdSsmxTShkbGfmUomCqQHbvcv3+2Dp?=
 =?us-ascii?Q?5wv8fSDQy8OXEOTbcwiWcze6RDpt993Pqpeoc19LzdO0ZKPV/qO1+qQK1eBS?=
 =?us-ascii?Q?DXff3UR74kQvkHIxbbKX1IJTrZc8BLjiK7ugmKbVuot8Y2og/4Y+eosmm8F4?=
 =?us-ascii?Q?pNOF65yEpIvSPNb6dAzEvOhhng6wCbje8OykXNR2mt4P3fH6BJgetKu+yocu?=
 =?us-ascii?Q?VN/OzgCBijbBCepv04tLOo2FG/HVS6Vme1lF0AzzzsDI6aR50f6TQ2IYL8zU?=
 =?us-ascii?Q?I6QnsiFdkH4QtLM60tx9cX8aIcX0W8CoKPnyymAoYUb7GFrla3fii8ozfrzN?=
 =?us-ascii?Q?2Iaa?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sAwztf20KCaXhfEELLc0lVfs7SMjcJPOJ2y9G0MD8kLnn0i+Pwp7uwzh1alr?=
 =?us-ascii?Q?8ITn267czYZ80IHj6pk1zLO8okgbCE9EXHQJOHyOiFXDtZuvVfOUQf0PYFOH?=
 =?us-ascii?Q?SXRRvQWVQz4bsZtdWFGjkHYvxBS2afuogpHljFnuEZw1LyNEZcFhHtf+FWD4?=
 =?us-ascii?Q?lnWTdN3KiZI3HzfIVVt14y63Ol8DLV8TDcGjcK0jqPe4b0f511MuZnRr5xgZ?=
 =?us-ascii?Q?Eww+IFJS+7iflu0eWgBCAVrEjkeFJaX7rHY158uYP0mVlienCquHqiPxxPFQ?=
 =?us-ascii?Q?gLLCGs8xSmdcMlp7dDUerh56ImtZxoeM1wXOuRo1QWbBGMIVZxUbG0Phuy6S?=
 =?us-ascii?Q?+VqgMg4y542/7WYf5FQ2rLqg9UIjMWcdSp5XGkJsCIOH7e99bzPN8qdS/sOU?=
 =?us-ascii?Q?u+7EAhZeg8FmwPrzs/vmRo7sMtBk9SdCO2pvhXOiihpmZh46f/cbDxnPH7xD?=
 =?us-ascii?Q?OlsVesgJv3vHRuTqYwVNaWOr1HVqsFHYp6p4vTMKELIue/xdxQL8xMrDTE5t?=
 =?us-ascii?Q?Uy6f5Mp5VXBYELy3MIErdCY4KHRK7XkYkzZ3wj8JsLhNWgXR3Yl4jTYlyD+s?=
 =?us-ascii?Q?wzaf2CrFJRO7DhC0Psfy2nwm9xzMErWMgMFkDLzqBEDfD4Xx8yTR8YjqhHBl?=
 =?us-ascii?Q?FJfyDiWE22P93eD8U97ZelXKaK2qd5NGJckqyeTHM2rdUt0T57dPrTN5uttv?=
 =?us-ascii?Q?iQxnABJdVJ2kIi9aSbY6tvNCiNzm2xMg2RJ+ytBSASnOuqJ6WfNtpjydxUF0?=
 =?us-ascii?Q?tu/9Hl92sgsGEb/lX/264mOfTVLmUs/DpPT4PT3RcFmiDIvTPd3vL367jq9C?=
 =?us-ascii?Q?L+BTe5yh9+0oLzrO1AFu4qLnbYl0odTJwOapXN49Y8+uSwrpcR2UYef+quWq?=
 =?us-ascii?Q?0dhlvoGC0ySERcl579qg2VEwTt1QXsM7fKpkScvely94zd82ZSDmZREZC3yN?=
 =?us-ascii?Q?dUerqyZTALopKBkNzeJ9nHUptVWCC+6jHN4o1lrfUrs69lTZnZln05ehq2vD?=
 =?us-ascii?Q?byuIkOREP5I+rdjDxhv5UIdTknarErVTtoTqeyAFv9iB6oXk1vI6lA7ctJEQ?=
 =?us-ascii?Q?piHpSqtBHDTSG2oobZ59fGoUXnY9K3aQmOdVN4ixjN1BgbJNJEOJTEDxoqqo?=
 =?us-ascii?Q?/wJPP9meldVBQk4eyDI9Xr9h+wzMSQSRUWBMXqkXyqC1BmD+YdCMb3fCS43T?=
 =?us-ascii?Q?WSc5kGqHXpk2Q4KGCWBpANAP8mZhaQtRkLUaZxB2KFu/pk2RD3Eva5vrLzLe?=
 =?us-ascii?Q?moii50x8md+GBNrjpcQAnhHOe2jeT9sZzr/tTaRPTP3TjJD8eRl3N9tfn9/0?=
 =?us-ascii?Q?103puE5ubZIbG85Ti6Xng3prC30eYTP2Zl2gTbA2kIDSCe9H8SPbCelpIX6I?=
 =?us-ascii?Q?SkKB3N5U1D5mUclnEuJKzDh7wGeW?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e13b3c7-6cf9-43a5-37f8-08df12472932
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5141.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:01:35.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR01MB7651

Enable the UFS host controller and PHY on Sony Xperia Tama devices.

Provide the UFS reset GPIO and required VCC, VDDA-PHY, and VDDA-PLL
regulators so that the UFS controller and PHY can initialize correctly.

The UFS host controller and PHY have been tested on the Akari, Apollo,
and Akatsuki devices across multiple reboots without observing UFS data
loss or corruption.

Fixes: 30a7f99befc6 ("arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)")

Signed-off-by: Shujath Mohd <shujath@outlook.in>
---
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 84842e5f77a0..9ee62abd9180 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -792,9 +792,21 @@ &uart9 {
 	status = "okay";
 };
 
-/* BIG WARNING! DO NOT TOUCH UFS, YOUR DEVICE WILL DIE! */
-&ufs_mem_hc { status = "disabled"; };
-&ufs_mem_phy { status = "disabled"; };
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p7>;
+	vcc-max-microamp = <600000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p9>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+};
 
 &usb_1 {
 	status = "okay";
-- 
2.55.0

