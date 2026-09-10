Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012053.outbound.protection.outlook.com [52.103.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4A34EF03;
	Thu, 10 Sep 2026 04:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013153; cv=fail; b=I2sYq2kPmzEsoiAEvb96LYyDKOq7LWiBYIw1Fak3ahTxHEUUWUG1BY2UoKMbATi4xB3+5gtasTBadUtA5h8bXr1rTwxlIA9PbAl7Wkqb7dyrWWif3Ezk/GCb9bQWktAW8f78Ttu0PfYi42ACLtW14MNwxnczuUlm+qB/Ag9bfD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013153; c=relaxed/simple;
	bh=0F0VIk/jY79sMBLSQuDmUhIK9LPCi9F0EzR6LBp5OYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QLf2pO7AjdrT5WWLLDBtm0prqmX1vZITO/wgb4IlHe/3/zb8IPcUVZVSeTR+jYtBhtfiWKk/C/I92v8p/JOCyHdytWsF9L2nOXoEpIFGTcs/moaiSCm1hdlbV/gCoqynv+jDi0vR4cTP38rb5LFBCGP4m5e6DEHOErMGvOcejXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=INt/LX2b; arc=fail smtp.client-ip=52.103.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="INt/LX2b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPWKkr/CKWeZ6rg19Om/x6oYXoBF6NzMrrIHyYH8jUPeMzUJMk9lzHGSahRcwXsZAqU5bnxQLr5+qneYlrWT6G30eoxhEJicjyLADGhQLJI4gHeYZ/k6MCuy2L/REFdCHDn8o0W7ui8QlIHXyezox1O1qtQHE7iqi8+7zGyWTb07JVvQ4xgxpoOSpIFE896i8d5BNSwB+7dF7CEAP9evq6r0PpwEEZADS0EAOWMWesVQ/8cfdluwFInmGyUxUt+ApJd+O2hYpGvNQ4GWhbGo8MbFCv3bc5WQpkpCr6e7Fl9zYGk9K01PKj4F4ahJCDwP9wOTgcezha7ynbvyM40UMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgA/5K6AcdDd7slR+if/CcMusUt1WSQUKTaDqx/ytpw=;
 b=it34k9wllqKLLdZktYbgMxZ8dgO31Ox344gpsxvChrdANrM9wGtuzbAZ38VWYvdBBuwbXjnkkKi+ZMmPcVanQEu30uN7jJWFF9XXg/y9BmcLUh2yCdNEAc/MZrOeR5rPSTQbRKq2fde3p86LKsPMFYvgbBL9fjCJyUzUKJ68yVYxKwtthWireqREAG/puEsSZZ7bJRhDuEeSLMZ/COO920qIQuXOSN5/kD35rffrj6IZg996PKP0O2yOoVmq+/Xk/F2tr8h3y82Eig81tJt2queV1Zx8shr76OjH58LQhB7tU/zlcDcYfODWS6+gAimqbuDXerGms18iOz9do3A6ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgA/5K6AcdDd7slR+if/CcMusUt1WSQUKTaDqx/ytpw=;
 b=INt/LX2bt7utX7hl17IWbtDFfFoXLNcCk99bfKsNTz6+pARo4hCiwMXPn0sHvodrV1HZHGIj22LxdyUruT0L0vxvmGph0t/IM5R9IG1+C5Uttn2Y2XJSe1RFsH+eevW8roJejO+ov3rciGU5cd53h6bSB7zxPnKqS2B2lUB7sZODb/yBkrKrtxAVhIYzJ0HUwrI2v9L9Z52MP7TB2GoR5X+PhfhqO87Xo8ERgvORLL+MSD0y2RwYtyVOrzfrXRcRxo40yHjjTvQJL32rHLGV6w3/TNrtyc0nKCUewxrVnFcYxevBhE4QVJT7A/UPcwPPoUjJP+jcUzgsgQ6qyVJruA==
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8) by SG2PPF550F9CAE5.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::421) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 04:05:44 +0000
Received: from PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83]) by PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 ([fe80::3e9c:908e:6430:83%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 04:05:44 +0000
From: Shujath Mohd <shujath@outlook.in>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shujath Mohd <shujath@outlook.in>
Subject: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: enable modem, SLPI and IPA
Date: Thu, 10 Sep 2026 09:35:08 +0530
Message-ID:
 <PUZPR01MB51413DEFDD09B4661D9AED22C3BF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::11) To PUZPR01MB5141.apcprd01.prod.exchangelabs.com
 (2603:1096:301:118::8)
X-Microsoft-Original-Message-ID: <20260910040508.11180-1-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5141:EE_|SG2PPF550F9CAE5:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c298d1-3aff-4437-c25e-08df0ef0c8db
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRUeNrpfN1hxO2qvkRqnbOVvD5IpHEEjc+1Z0iP5af81Wel4+HlcOpB6UIQUu0Ovil6XALJyt+OsfS0Vne//o38mJx2Lrfo5qYWW2lWaAw5B53H75pEL0FjpZuqKuNSQOY3q++6rPD9X4f/cvI/v01J9fDa4Rxt+yahum5hIvpfWV4M6XTfXLw4/l+zENvEgqVS9qtMVsiFqeEnN00GtNG4/HWxg0O5nRLdrqGMtXG9d6k/3z+BDWxoYXcLlrYPoaSZdbe9j1Qcv3ob3FhgfaKtW0LiV6xFX4s8WX8W8U+2D7JMIHZ/qQto9r2KdLUmCbDWCeKYmNu1+19DMJSqPVSxNIUq4retVdC4Cc2CsbePE0q31HSJNkWvh0nnvBq6AyGo07WrMKEUo6K3hlHvmdQcNJJFuHQeCjsxZZNAIYUISuG2WlorqN1OaqtDUH7hwhcrC6puU8kr5UXJWC5gib2YSJDvLh9DQToZH4jvTqCZGuNPiDHfIUiuhsncF3kj+MaNsmTRFQTd01tIRvCg3Muj2zpRJiSTdhD30WqN3MZe5NV2dpL69J1VPZC3V9kHqShXk0vobImGO2Pr/AyRHkecD4JlZswFRxbfiMIp9NVy4mw9S6koWDKkqh4NNKDbQlGHXyrcpWDpV6J3LeLI2oGO5aESBMV2hNOrnT1AZ/zHPdZMSITcUQpCJNApcme3Ly6fUkyZ7uD9o5aFs4kPDL5YRKVYLOM9A7ndfUCMsDZTxI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|5072599009|25010399006|15080799012|51005399006|19110799012|8060799015|23021999003|24021099003|26104999009|440099028|3412199025|40105399003|2607281247196008|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C7oi0D+1qHZDD8PsnvVe1Ms1XyG3jJglKUcONFp5cnl8BIh9xD9Y+rMO9rL2?=
 =?us-ascii?Q?/IZ1Isn2xo6MWR5xZxKS8S5EfhunsAbAe2GD7iQ+BGJkStQqwKjxieDjMAle?=
 =?us-ascii?Q?fnY/knyPPf8DaCzCkSlhZIBLCXqvCJs3A3PSBPA/orePsfe9I9kcdnIkayQt?=
 =?us-ascii?Q?USFFCeofXNmwOm6zZP6ZuiY4nrRMfLBmQFSn6xNKSzaBepvEu/dGI9iLtrhC?=
 =?us-ascii?Q?yUyE/sHbUo/ALg+HEmDcAdcUA/JdOwHRIrpI8if9ccbfslm/woCnp46zOO+9?=
 =?us-ascii?Q?GCYT5jP8I2VtZ9IvH5xMiTGNnG4KQlAIGPzEzExsITf/8CIY234teXG1QGa3?=
 =?us-ascii?Q?K0eMD5l9R4PtWLJV9BVJ5SQ12JXtClgzRlLfb2fSMf/HYWu4xQTFysNdMfei?=
 =?us-ascii?Q?3Gpl29iZcxooE0ISlh56q3QluJlodqQyH6Oi+7DOziooSui+Oc+WkDJBmdLn?=
 =?us-ascii?Q?VWsysvTLWwj2U0izE8Y4wvH8y4eftnK1NUr8wdHY3Rfgsx0+LeldBzu47DuG?=
 =?us-ascii?Q?0vRLCACmmFj0DbFiJV/hZboA/gQ9p9d3em3f9B9K7g4SVqM4LgdwVsOT5Qxn?=
 =?us-ascii?Q?qZG9uReTKY/JAWGJwH7JTcSOWeqnWTNFapUwqrr+DRZ/8Kf8ogFgA8VwLpkV?=
 =?us-ascii?Q?zXi5/00TqkDOTvL86Itczittbe6Lo0e+4ZvMjSiJeehnLzvleZ2dAK3rj+LZ?=
 =?us-ascii?Q?nbo1CCf7gDR1JZ9wFP3iW6CxtHe6cFspCZPPnplw5YHqyx0YsxrhqYx8QmYP?=
 =?us-ascii?Q?+TRlQiiIQ1g5ROqCyI18TMgrAPdiyffe/ldhA0cYVn4nAT8KovQPt12LP1uC?=
 =?us-ascii?Q?4FYriCAeezYnoCKi4TJf1bexRf6jO5q+Fdk6WS1SkTYAlxahOTa++eLD4YmW?=
 =?us-ascii?Q?51TJG6uOQv0KQNrN8eZ7Kih2+dc3BloZtplDtiPfGQkNB/EqUHPeGtBKoa2V?=
 =?us-ascii?Q?C8GKlRim4JTLtWsxL7V3QXkO82YZVCdJuN2PcFfBFJI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KsIvNcDk4nePzyjpu5g6ISJB2vl4sCzVZP16ogvPCVcUbClFCf/6iWyCS/3/?=
 =?us-ascii?Q?KtzvvTxfj6TamfVmICs8wZu3gsTRSbR9P61WZ7eMmzsQiJgrsUyypYGMXecV?=
 =?us-ascii?Q?2HyNsF5GMeZX1LRSCvaUoEgK5LbVa8DLdgKXoZXn/Q+Hy5tjg0flSebBp4Go?=
 =?us-ascii?Q?ASOQKcBToa4/rGvKsmNx+ZbppqcgDlEQdA5jCY5ORFlUIvvZJvPPL4BHf9z0?=
 =?us-ascii?Q?QQB3V1a6jPYMMJeTPp1GFOESAluA4C3sg0wHki2lwzKlu3eSEL7N0BX1AVpH?=
 =?us-ascii?Q?wOKjhn8xrBlBm6/L6aLHAgWJFS1+SfATUlnHFffNgnITJSVRvzOYdR58zZEK?=
 =?us-ascii?Q?YfST5jH3UPZYyxMgqiKlWAMR1sZu+rA/1zKYtCzsnP+6pH6XCyWTTRcOr009?=
 =?us-ascii?Q?cLCgqVfwsHI7Zy3lg+VTUTlhMy6sYr1FlvZEVnHHzxh9wWyuWbVRndAvdVIZ?=
 =?us-ascii?Q?elaSjYoobZgTo7rOofswM2ewZf8m0K3HPvgKd6rgGrPe8GaIZiGHzhB5mW+g?=
 =?us-ascii?Q?SVGBSyG1SjqNNRWwiF7+TkPBlxmPdhVjv6lU7d4N4pMJHiU/4SnHdZwv4AxR?=
 =?us-ascii?Q?l5jbbpEiDk7Mn2vTWRJ01ZnUYIRsU++Wy6FyfoRBEDBQzCUB6V7bJMA/oiXc?=
 =?us-ascii?Q?GHxp/tDrQ1jvXoUf9wAmBrDkvjSQ0XIjA3jHlOaYSjGGhIVyYFZousganigq?=
 =?us-ascii?Q?B7d6QTaOzvD5JAYsyMj/t5qP7FKE1vmvGDXXmgYVuCPbGYkp1IrkuqeWKnVQ?=
 =?us-ascii?Q?rEXmuZGLePoFxwkYNeCsa7HraOkoEcTP7YkBvvRIvqWVRHoIlqpZ+5MrisOh?=
 =?us-ascii?Q?/pWRhzAwvxWXhR5+e7OkfZWKPv8A7RXqwzaS3VH2eygAeyHq5gPTWfhVx2t4?=
 =?us-ascii?Q?he9g7BkyYd/r8p7wDS4Ro+jNuNp5ZNPCrHBNYXq9Bjtyk+c+Fp8/uIOxKrqH?=
 =?us-ascii?Q?+NxBiwWcPMia68UDum6IjND2zvSYkVEDwJJVuP3Wp7csey0vxoI0MqSyo5ZO?=
 =?us-ascii?Q?O4Pfw/LUyOjgDtPyp59jyug9vYBNc0GTn0sQKZ91ohvPkYQCCpoIqEyJkO8t?=
 =?us-ascii?Q?xANBZduS9Z0vh22TkhnFEBkn4722Yhm/qYq1/nkmRpS3VPWZqTlyZAfid2hb?=
 =?us-ascii?Q?InnquAqzU4Oj2tb67JOFCtOBXo4ky/vRxlGqFR32HjCb2AKJwq2KMw2qEkEQ?=
 =?us-ascii?Q?77nERU8fpI3yQ8Bd6vq44cXu1DgUmlsT1AbSi6qoPAQDYiSA7mMuZSDMXU7J?=
 =?us-ascii?Q?EBh926KzGNxZOm1U3sSE84sdtDVg2+rvGhIJwlJhuGMQjQNWSMd0P164LeAO?=
 =?us-ascii?Q?viUrUzvr2BffGAVhxJ2tl4n2PqWn1Es0PdA9CdLMZaRFN+iqOHcZFA3DqXQK?=
 =?us-ascii?Q?SnAmERJaDwZXlYly5igsbeaqEgj2?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c298d1-3aff-4437-c25e-08df0ef0c8db
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5141.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 04:05:44.0180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PPF550F9CAE5

Enable the modem, SLPI and IPA subsystems on Sony Xperia TAMA
devices and provide the corresponding firmware paths.

The modem requires ta-service for initialization:
https://github.com/andersson/ta-service

Signed-off-by: Shujath Mohd <shujath@outlook.in>
---
Changes in v2:
- Squashed the series into a single patch.
- Removed redundant IPA properties already provided by sdm845.dtsi.
- Sorted the DTS label references alphabetically.
- Documented the ta-service dependency with a link.

 .../dts/qcom/sdm845-sony-xperia-tama.dtsi     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index e34c1dc35a05..d9e6dec79453 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -499,6 +499,11 @@ &ibb {
 	regulator-pull-down;
 };
 
+&ipa {
+	firmware-name = "qcom/sdm845/Sony/tama/ipa_fws.mbn";
+	status = "okay";
+};
+
 &lab {
 	regulator-min-microvolt = <5500000>;
 	regulator-max-microvolt = <5700000>;
@@ -550,6 +555,16 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
+/*
+ * Modem requires ta-service for initialization:
+ * https://github.com/andersson/ta-service
+ */
+&mss_pil {
+	firmware-name = "qcom/sdm845/Sony/tama/mba.mbn",
+			"qcom/sdm845/Sony/tama/modem.mbn";
+	status = "okay";
+};
+
 &pm8005_gpios {
 	gpio-line-names = "NC", /* GPIO_1 */
 			  "NC",
@@ -678,6 +693,11 @@ &sdhc_2 {
 	no-mmc;
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/Sony/tama/slpi.mbn";
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
-- 
2.55.0

