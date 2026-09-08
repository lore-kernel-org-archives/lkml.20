Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013086.outbound.protection.outlook.com [52.103.43.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E9E245005;
	Tue,  8 Sep 2026 01:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830240; cv=fail; b=O6j6ebpfYEtiQljhOf/qR10ZeDksYURzo2MZwGnX8en+S1UzyIMR/+bR+k/sBBOFzDWbyZ379eR0nGl7A26WybD/KX/O/Zf0g6BcPjzUZJ1nq1QVU0XmvabmKFiQoZl/bythaqqj69mNrbGE4af7CCiN1AICDEkJVdJq8dVu8h0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830240; c=relaxed/simple;
	bh=eUdWkq/LN5dAcynqldUt3RYU5t1Afnp+vuJculJiLnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UVKkUKacOvuYujYnZ6PyeT2usVERtv0QYJqC3w2ycgU5p98NsnBNgjOXq5APCd/9ewJzE6J8Bm0cXCkxv3PbqJuMC5Vgml3nKXKP/uuplzmG7ZlSPLNo1RrNjmoUZ3h8shLGdgzdu9nQ+3OZ9Olp3sktR+TYcyYnmCuEjlTnRC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in; spf=pass smtp.mailfrom=outlook.in; dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b=AxnibbKI; arc=fail smtp.client-ip=52.103.43.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IN header.i=@OUTLOOK.IN header.b="AxnibbKI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdkY+PjBlEMTDcaieog7EAMLZcFYufBIpaMWD8ntK7+yN/JHybTu2UCETBi1OzBnlCodEfrl3r0DHXXW9omIYzXsK+ng7FFmwS81+d8CtszP4LesjrcLyiiLG+32SSLgGpvbGu+aDR8Fw+mCDSDgIyNwoOKvtcI3ifoJTvyWyvfs9mSwhfFyqdAKsTyadV2lB0Y6UO+V32HMdOlaB34HVvvFmSSVAAa8i8BlEiiSlaQQXhwlzsoUvbrjGp0lZICHmTgVrgpAVkW4Kw6RvBts1q+LoXja8/HrOEdP0ZvVC908vbnwQ6kLotlUSh7e7MH2wX/P5ApwFBSvGOHP/tdtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaeC+d/hbJnTDmONQBd1FfkgoRzvRMCLW4CrUn5VG34=;
 b=zQRx8VebdM8AaoxJHZCQxxFRXo959AeT7GEU9pc8kxipUbr7ONnRPLHJp1H4IU6CIAcSX6VPWwDIj/z5InTGVD1Oompd6/aFMvP5+s173JsbHgZS4bSK2JS0inWMiQV1740+aWuTSu3LHMFw4B8rlGsriYN/TdViVGeuq0WfQ82H7acddgqwPEouBCRoFlXhNKRMhS1BIJwEcp7Us9g3EVM4PiDIvHPHDPW21/jIFdGePD4U8574+88+rzWvOCER0iSoaEhhEaFR5EqtzKufeVl0zl4yGzVqdeSFpvSuRT3QGJaT8+zkbUR6rx0gzCWL51sr6H9IopNG86cVuRGkQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IN;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaeC+d/hbJnTDmONQBd1FfkgoRzvRMCLW4CrUn5VG34=;
 b=AxnibbKIIRW4GF0xjG2v9++pT45YaHKyAx30uoyoI8TbR5M3yFotsCCwUEdwrQwCOY4Gm5QZghD0cSCPNrDE6nD0Z5wVhzjJd6tGLLwKWl0AY70guK99Wahg3pM2m7NwD34Z9bxno/K5PUtt5Qd1wqSVM9snlTaipPIy9O+MTOufZV/EuvoepKFCGFdh2DL6tPX8VwtpzqXZlrVuYx4qkq+mz5rJ2mdbss9vqVJnZVxaLbzWkvDihoKjroUPOMkH9+7P3l3NjXEehZ4R2PmfKpSIUwQXF+/C0jojMBzHzrGlzscjB24z6ifT3jsScY3g0E2Ccfu59Ie7zQUTxfl6Gw==
Received: from TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 (2603:1096:400:334::10) by SEZPR01MB8328.apcprd01.prod.exchangelabs.com
 (2603:1096:101:339::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 01:17:14 +0000
Received: from TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 ([fe80::8085:27fc:798a:5fa0]) by TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 ([fe80::8085:27fc:798a:5fa0%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 01:17:14 +0000
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
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-tama: enable modem
Date: Tue,  8 Sep 2026 06:46:39 +0530
Message-ID:
 <TYZPR01MB5131FC151BBDEDD2C6C615A3C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB51313D5E4F5EE3CAF57C0876C3B12@TYZPR01MB5131.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2bb::8) To TYZPR01MB5131.apcprd01.prod.exchangelabs.com
 (2603:1096:400:334::10)
X-Microsoft-Original-Message-ID: <20260908011639.94222-2-shujath@outlook.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5131:EE_|SEZPR01MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d71c4de-b91f-44a1-64b2-08df0d46ea23
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|19110799012|8060799015|51005399006|15080799012|24021099003|25010399006|5072599009|40105399003|2607281247196008|26104999009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sIdNFog+eDQ3AF4eoUuO1mC8eYk2hQHG6wFh1joFZQ4GC79KA27rg41VGbe8?=
 =?us-ascii?Q?s+oDGkNu7V+bYHNbwQLkjsIM9d96ygWlCPq+v6rWko5S8m+crpEz24cg1W5X?=
 =?us-ascii?Q?kWrdJJVKhzJ3QuAhNsTe/2MECoEnVFIMjXrOpz/WCtd0emQGTkpKdWO3HqBV?=
 =?us-ascii?Q?Gsm6FHAyYAWeTFlxF1PeHC2bI0z1cb5ZEwO3xdGaQedvO0RaJnSYl71vQ/az?=
 =?us-ascii?Q?W8tQh0aM6qkHMC8df2z9bNjEM32AOPd6ucsGhWVbaFXcQbIgohRwv6iPVl/K?=
 =?us-ascii?Q?AfcTU3zRF0z0zIBfGEO7TW2k5QXWOykmPCiBsn9a6yFc9ojb2nZC1A/zxs5c?=
 =?us-ascii?Q?32uhIQyMVD1oRSdO9SF9LhCw3805V7Pw+BdLBQvCVJOLZV8In5kk74auqSqn?=
 =?us-ascii?Q?bno+toXyraS/z5nWldvjSgjFTzk0sopDabDIaGRjuCKwu/RBwtwXmyS0Qryl?=
 =?us-ascii?Q?c29orZTcZbnkVW9br38arwi2MIFdgO75H5cg7+vClpoHp3MFl4bKUvcylYz5?=
 =?us-ascii?Q?F6RKV4ZoM/VfLJnll0SbHzrhxksQ4sA9fIvwy7rhwRPogXYTrSxkMdsX7WsN?=
 =?us-ascii?Q?4lGq6CAPn8nDql1wWnVpAEc4G8gOSubMXQWmJPt5vHs0eKo6hgby13SkYZsP?=
 =?us-ascii?Q?4TQT6DhayqT27P3oQVFIzLeI3SrrzIMfnlHk0ZNWpYsz78SnDZNBI/Yai3ZG?=
 =?us-ascii?Q?ZrVgSShAu3jujDsyegADYNa8jwQGpv7E7Q4GVyo4fC9Mc7IXV8Dq7YX1sv+2?=
 =?us-ascii?Q?qu06kOIfDsTe/zLo5ZGJjKr4wL1emhsaaqlKWNohsq7Me/5tTDDUQUuvAN16?=
 =?us-ascii?Q?jk97uZDpC51bZxCUMXrqxvyzAy0lDPJQleBYXRZMbb7/Jl+4zdvkHF+QeYiW?=
 =?us-ascii?Q?8FclUlA6+sSB5VaIZqP0pyJQXNIXjgs6wsNydr3LQMfgjDn8ZPnVFlSJ6ATM?=
 =?us-ascii?Q?lFUbfeHlxZmS5KqR3OIcVg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7lADPAiXQ7d0krsa56IyDSX6fkcDRb4RjwKCDEt/C/aqbQf0mCb/z324E3v6?=
 =?us-ascii?Q?8INRtH4fssQJfuDQEN1fwFpb6S+Jb9SAjnJdlx1s+ZEZbLBTz3wbPsJMkCSH?=
 =?us-ascii?Q?qoGNtd0Q0WBASAYihaMXTv8UWXkf9vuvO/nZfis4lcf9CwHjWtSXUPf5ack1?=
 =?us-ascii?Q?Ok5J58yJaldyadL8CtIpYckd2bw2ncFATB39SCMnsi42cFm3oRWFNJn2EyG6?=
 =?us-ascii?Q?JMO1w2rqTuiflyWsTZoo9DxiO2bmORKS3WbUjHV/MeDGfhEYMbzeNfbDiFBB?=
 =?us-ascii?Q?684ee0VCnQ99Oq608kvSi0Dcs2215yQ0pSdploZ/8gC99HbN/dM9U72EmHd4?=
 =?us-ascii?Q?tFbdf5jXH2t8Ik74TiUQP7nEa8wl0AJ7oMOCPlYYeB1Gl6uC5S9R6n++VHIy?=
 =?us-ascii?Q?Sskv8zwBRjgfEO3yIQ0CWd4B04mTvx9/u8DOO5ghvp0Wkk2TAyPsi17/2Xyl?=
 =?us-ascii?Q?clAl0QPLZfAkpPu5X0phCmInTvPOyflP2djXXb4Fdm0rI5BT+lyFkN+WE6oB?=
 =?us-ascii?Q?ZW0+U1/vsB+445Hc4XiYJH7VpHecgP0HX3/PZaLhyB4xnCQUDIK7ajcD/BYM?=
 =?us-ascii?Q?3meYT0FXfRo83GedPYes1eGit5GxO5okKWaoLTcV01O0DxYIuqGXJ0EXxskP?=
 =?us-ascii?Q?LL5eNoBqyQ/cacqaMwhp788n3i/aw7pgMgN8YMbzr6ggAwcN/JJxq9HnP89h?=
 =?us-ascii?Q?laZVZgvfDb8riSH9EqkNtjorx6uqqfSZDQfwUjarZb2UhcPgQi7d6ElOXxHn?=
 =?us-ascii?Q?Q6ZLVxvzlTwiqmTWwXlWRaxWuFJvFWLmrwnMG4eKv+JzzRvA4T3ebFWgYvyS?=
 =?us-ascii?Q?E6LB45Y+nnrMZK+dI8HwR3P7QtbUF65w3P8rWDvedOP9RvvjZvVYfdrM/idM?=
 =?us-ascii?Q?s2nIMOvX4dm06tlyRWSFGGfn0D3fhBi6U607FPk2euc1uOGrDk3GqeiVnCtk?=
 =?us-ascii?Q?Vjzrmk1/5PFNL4Ee15J/pLiJk9MWLq9rTzFVoKtEKKDQJ0Wdjj1di/V/X+zZ?=
 =?us-ascii?Q?yFY9c1wKzMPq0rVlmH4qbU3VnmayFcK62yYzOr7xHU3yoTZpKFYUorMPFyKk?=
 =?us-ascii?Q?z+0gTHgzHLKyETgCN1F5i3G45AR4k72ZRNJZ0tOe+6vvpl+W7rgfAlA9J77v?=
 =?us-ascii?Q?T3H1YTDUbCX8gHORwS3P64tmQ6jUYAO5/ZaB4F0t2BMjYSOsYrBHb/hwBGPh?=
 =?us-ascii?Q?eLZk3xIgVl5KNiShmG3KMn2wHc+pQFOJQN118MQ3Stka1gMPxhmktOEm8tqX?=
 =?us-ascii?Q?Pomoo3Bxu0eJNivi0elEvtOPZv8PhMR2lj7wa9C7LLA2ssr8yyhJnluI0hQo?=
 =?us-ascii?Q?zJhNNN4KbgAvsHNBzDq6/8/0MlbG/awlSUnzO1f+L1Mu1ow/YFMTPZP9KEzd?=
 =?us-ascii?Q?ZnqXSvAf5bmcqGCtdmZPd1M0AUL7?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-3e488.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d71c4de-b91f-44a1-64b2-08df0d46ea23
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5131.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 01:17:14.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB8328

Enable the modem remoteproc on Sony Xperia TAMA devices and provide
the corresponding MBA and modem firmware.

The modem requires ta-service to be running for proper initialization.

The remoteproc firmware configuration has been verified with the
following firmware running:

  remoteproc0: mba.mbn
  remoteproc1: adsp.mbn
  remoteproc2: cdsp.mbn
  remoteproc3: slpi.mbn

Signed-off-by: Shujath Mohd <shujath@outlook.in>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 1c61a274604f..f05cc5db9ae9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -415,6 +415,15 @@ &ipa {
 	status = "okay";
 };
 
+/*
+ * Modem requires ta-service for initialization.
+ */
+&mss_pil {
+	firmware-name = "qcom/sdm845/Sony/tama/mba.mbn",
+			"qcom/sdm845/Sony/tama/modem.mbn";
+	status = "okay";
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/Sony/tama/cdsp.mbn";
 	status = "okay";
-- 
2.55.0

