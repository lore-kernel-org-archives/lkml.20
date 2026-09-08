Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013086.outbound.protection.outlook.com [52.103.43.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9BC1CDFCA;
	Tue,  8 Sep 2026 01:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830238; cv=fail; b=S76+aDVghAhdyRODn4Gg1/P/aGGW+WAkHQd96IbTVA0GhALB4Ho0yiZI+XE2srvNJ63br6AybPivYHW5ThiXoPKaKz+aqdaOByc0bZSkl7eAfaGVwVgfJbjbgri2veONIK6WO79je6u5XCZFgCDVSGvynALPchhd9K8DUO6eSxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830238; c=relaxed/simple;
	bh=lyQinspz2NjC4AkemQBxXw8hgnWZPfP06UGpWyKRDkk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L2o+X7Sxd89GXgfS13HOgR8PX+0CXH3q6LFEy+CpDpmsjzBv+1V5vYNstPM+glsgu36bUNIAwHRbi5RRElZvMq2dKXOBPPImiPtSsNM/HYSRtS5OOvR0BeluBP86TAmpzX9vHnqOYoUh9o6HHQyMRK9q8oh1aJqWGVz5mkU6OGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=ogde0UmG; arc=fail smtp.client-ip=52.103.43.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="ogde0UmG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmEVAUTIhta6iACAHo8+XMiaOkorriXMQxZrgIpepx8nD2DIT+aIMTLa3Pu3vLNAqmg74dhHqaTgUSZT0KSEyCtOKCMjZGOjwMpG2+NWkXhuSnlYfPSO+vhuvPhg8FB1uWMTfZFQ/KPO1VBp09hq2crIXXeo4NozerMmtBfvMo2IapXl29IcXd98RoYZdz1wrPaDtNEirucUoy4XJhxYub51uQx0ppVoCirlfWC5AxCPDMl117MCXI+Tg+J/R5lTurVPgMeoSRZbC+d7+J5i2EuL+Bx8/cgn6UqtvwwMYwNC6hLGDSNyeOdftH9rL5YjilmAhpgKSheZrkMu5CqvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMJxVEvVgZqFCVMAnlPveLIKGgT3Y469Zhs32vevkP4=;
 b=DqwzJTv45KmsaqPQeeWNjr0hetH5clVEdb5YxRHgRKu0tr0r1W8xqZzgmmbmCWrXOmZRC9kLE+kbDG0xwL2blm70347SNo8+5+XPDtHE6Omh2PfGU/STKyOYzy8OVWOR0wz9JWMXZ4RhAUJmmHy89+LpUY2AbU+F1f+jnqw5pBVv7Ggfg3zSfbPL1EvqfTRdg2dMeJRSu6GhWCXl+iGrMWE9B/2ahy7Opzrg2sxkUJi63aG1P5up7jxh75OocW9P3vRTpSFggBMMjs93sFZY50mE8ai5pbSaPDIRrYUxlhNfF91FiVumrTd6uQXrAdZSvp8OLP00yYZz7ht+bGclqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMJxVEvVgZqFCVMAnlPveLIKGgT3Y469Zhs32vevkP4=;
 b=ogde0UmG2I1Sj5m0yzWkGbN5H/je4drGfBZJ4JiUUKZ7SCrIm6BxkB4dXCEhu+HC4BR8IDl9rWopg9qiv8or890QA/21G7D0HpvtB/BIMYGmkwnmoFg0dCb6ID/Kng1/CvrkzMVrlzWz8/WwLbv23Un8OL/FF51yHq4Uhw36APsB6ngqkTJ+pTMD5TtKTu7o3o2sgMtua7vNEjPP0oNNITCJx1xSZanDsMuQfy5s1dxvkWGGirsox4T7Z2pR46eJR7Eo263B/9XO/FN2CyhnqbhXrcZNa4vz0fqxYQ/U/Ljmv8I3WTuCA+RO7tHAndBMBc2p9jHCT0+IHJTklaVvYQ==
Received: from TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 (2603:1096:400:334::10) by SEZPR01MB8328.apcprd01.prod.exchangelabs.com
 (2603:1096:101:339::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 01:17:11 +0000
Received: from TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 ([fe80::8085:27fc:798a:5fa0]) by TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 ([fe80::8085:27fc:798a:5fa0%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 01:17:11 +0000
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
Subject: [PATCH 1/2] arm64: dts: qcom: sdm845-sony-tama: enable SLPI and IPA
Date: Tue,  8 Sep 2026 06:46:38 +0530
Message-ID:
 <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2bb::8) To TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 (2603:1096:400:334::10)
X-Microsoft-Original-Message-ID: <20260908011639.94222-1-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5131:EE_|SEZPR01MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 0273d2e7-22cc-4002-eb21-08df0d46e837
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|19110799012|8060799015|51005399006|15080799012|24021099003|5062599005|25010399006|5072599009|40105399003|2607281247196008|26104999009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uRmQTVA2SBNFABJpTtvRSFWMsEkzEr3/cmTP6kdACPBopnHGVHY5272EMdzc?=
 =?us-ascii?Q?AXcFoNDHaFlIsdAvGMX2M/oCAWg53y1O8zNUHw4xodGqmBSVzDrHaLywTbL1?=
 =?us-ascii?Q?ik1jxY7FsC7/NmtMS+6ah4e2pe3SPGhIY6zEReH93+yET4CCsE+cASFHiGOo?=
 =?us-ascii?Q?0x1233YvYblttXpmLumG/7o7eFWRvhFTlab9grrWnUCov9sY1NTDA7yLJYiX?=
 =?us-ascii?Q?jOcdKSGP3fzc/La5mu1URQL9ivDeP3hEHVcYtB2FI8dnjrMOj3rxgN6b5fVy?=
 =?us-ascii?Q?QfE32dRirGAimQfCv2nuNRYKsWEDN7/8n0l40qb6eXot8CnlWOdsj5413tq/?=
 =?us-ascii?Q?c/CC2Z9YcjWNizcxi10KBlf7wFzoId6hDFaPc5K9V3dXMqJ8gdXI0NsORvH4?=
 =?us-ascii?Q?HbFRA5p1UwexhRyl0xLIQ5DSx36aYb+MSJwazW8LgOKlCDdg9hpqJxZhjRxl?=
 =?us-ascii?Q?gEtBhR6b+62asC3WULXphsQd2IUQ1Z0Rm+hd8H4o1mCfEm/+bqg1yY/uM9zi?=
 =?us-ascii?Q?V+BP4bHgsPTTaN1eEI7jEIGpflObKPRVyztY+sM1Umg+tTs0ZH58jkTPDfsP?=
 =?us-ascii?Q?2fWcYe9m66/QUIJPum6tQkCudI02F/2i3yo+xv+xfVhFCdE8FRZOvcxn6uD8?=
 =?us-ascii?Q?nCR+b70K9tAp24CM1lAgdBgl4R2Nrjds5uaFF2gAqIx5qEl76+UCpfyc3GPP?=
 =?us-ascii?Q?TAOOhjSOWg/ooOriHOgTSf5IpNKdNtibn4ADl0zZR9gR/IgjbhwfAv3wnNR2?=
 =?us-ascii?Q?MBT+ABbszLWJQ3TeJZK1cBJ954XLLKE7abu61+sq4zzLx7U9Dl7QVnnWZe81?=
 =?us-ascii?Q?MyQxQyvFIShID46s/CZevWYSYnN1p6BgCjbT+CCC7pYDIfX3SDm/lmo7LqaX?=
 =?us-ascii?Q?MQ/M0MgS4yDJV6AU3dma0eTCmhs+nYpujpRlpthkbzEyTwqr+1T3aYRZNZxC?=
 =?us-ascii?Q?KDPvN4dL1BCHteDPObL14H1yk9uiLIp9eICHG4YFJNLjIDdlaDoMdTKxXZhw?=
 =?us-ascii?Q?acLu?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nLOZbVSbJvySXwA765FkHmUgU9sASVmQMQJvZBb0TDvVfpN5G7bNTEFWpTUh?=
 =?us-ascii?Q?jJA9vU23VJPfer3Ma7Jpt18h8EaUFUVLQ+vQryA91C8rvL932SSLR1PYpVTs?=
 =?us-ascii?Q?v/qcNiQCBfMOkZb8lSNJO0ioYH4YN378dNFTefIiYAnDrLGJD8Iq7CbFNpWF?=
 =?us-ascii?Q?p3yqBDS/yLFHrcmSmA9s4BAcGYVIhk5Tic0O393ySoKLx3DkbRnaN471FX5F?=
 =?us-ascii?Q?p4OzYyx69L6u08TBnF3OA3Cgr0UQxLA0XCjJw1pmg4ggtkdn38OapdbDS9k+?=
 =?us-ascii?Q?Y14woV8YmdQP0b2CF35htNItHjsD4yJsipHBaCd8HrYVcK9OQ0g/kUeXIn6Y?=
 =?us-ascii?Q?8I8Fn49CDpWxQbPR3z4X5LIb90/PSFLHdUorvNXdvvXASeQo1ENNGOzL298w?=
 =?us-ascii?Q?E23fR/FYXLN1CTfvabneesVtM7LUh6xT6R+pskj+Mr/xJpiQvkEz0l6GAk5R?=
 =?us-ascii?Q?15BeQeDUHlGZeU1Kzwm5C3wkWiiFJwWPTVaBmVRRq2dKi70FeUzqGTQ+k/dS?=
 =?us-ascii?Q?zTRLM2LP2NqPYYL9KtfDcrP9W/OOf4Gvk+38n5+52K+Ubwu06EPqW3UZ4B5/?=
 =?us-ascii?Q?oWMPoQqJce6cAcqWEfpHFs1SHky/TuFabxXaxZFMzvbKEdJLk0HZyYCApwkQ?=
 =?us-ascii?Q?ZHRHmACE9AaldMMsUGqBch6nPaQM64ZQr32zsmQBgaODzQGtaXcVvUxmBXti?=
 =?us-ascii?Q?bGeTZuIwCFgNonW9xDGeLEISlikFgawnYB2bYuvjTG3tE7AXE1hrQQznBAUq?=
 =?us-ascii?Q?u+4pc72/nbZ15CQvTBvT9436AmiiQYiAAUs8AduJphNIR2XqJ39Ab1Q52Yc6?=
 =?us-ascii?Q?hFJ2t6BIpfbTtF3+mXh1aqDQnk3A6L8zPGoMjtll52McOSi8ESHNojcpaBbe?=
 =?us-ascii?Q?KbxVi/6SGhfNtAjyHtRE2mm74paZ/Muly2pIkjtLJYhRTfI1RexHmFLoU7xv?=
 =?us-ascii?Q?aA5VafhELzrocG2j8cFuvSqMLWeDSPonrzA8PaUADFI7faduEMKx1SA0ln7c?=
 =?us-ascii?Q?8ao59/6RQx2TUDQaZpKV0wVaMLvV3QgGFLsya45UuJD9/lAU6XQW4QKRp5Mp?=
 =?us-ascii?Q?CBAmuBJiQ5b4ZydfMreJQqUoTqZKXmpHDbMMm7d/dNB/8hObnHDyZ34ayJZ4?=
 =?us-ascii?Q?w+iXmP7dqXw3x5XA9EjS7qhAQeHQvqfnW9wBmsRaHq1xxbwRP4F9AlVU+bsp?=
 =?us-ascii?Q?QZW5BBobsbSSrLkbIXKC1WJLJ1N6rCwfDDn5mG9Mp6CvdEV9tKYVj3jUV/mV?=
 =?us-ascii?Q?fyxaEOzE/BxOt7x/iW7fWa5UKArCbwHfTzWeNGVAsDYpsduvr04Ed3MYWi57?=
 =?us-ascii?Q?oc1m9RTMd2cA4YWtcbGO+7ZQt9Vd+rmgzToAeiJixKL5yE5+MLTlXPEdnYat?=
 =?us-ascii?Q?4zT6Pf3g+qBi/BWRrQ0nhDotHYWY?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0273d2e7-22cc-4002-eb21-08df0d46e837
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5131.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 01:17:11.2299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB8328

Enable the SLPI and IPA subsystems on Sony Xperia TAMA devices and
provide their firmware paths.

Configure IPA to use the self GSI loader and the existing IPA firmware
reserved-memory region.

Signed-off-by: Shujath Mohd <shujath@outlook.in>
---
 .../arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index e34c1dc35a05..1c61a274604f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -403,6 +403,18 @@ vreg_s3c_0p6: smps3 {
 	};
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/Sony/tama/slpi.mbn";
+	status = "okay";
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm845/Sony/tama/ipa_fws.mbn";
+	status = "okay";
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/Sony/tama/cdsp.mbn";
 	status = "okay";
-- 
2.55.0

