Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC13E1CFD;
	Fri, 16 Oct 2026 20:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181538; cv=fail; b=o8d3xUxFtXi6p3OxK6xcfC+aLqpiEWL7nGf4SMKQBTekFvv1QlUCZePTJz8WA+kyrP5sa/xE59bm6dVPwMKc0/UgpWOa/NmJT3C9DDz4Nm/M7DNdk8nv755JzUUBz0WW2uR7GNZFZi8cPRsPBLa+3r4+3EDclBAwH1+S4bvDYR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181538; c=relaxed/simple;
	bh=bFYb8zUy6FgFYuk/9x3cdCVM1uG6idlLExl91Jc+/U8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oV5bWGcoMCHDaG8UorOzNyQDHl51r+Alpl9XxWS/m4jiR7KRdt9U5D8D1qKqYcThDnsS0jnDlADSJrE10MpJkP4GY6fgkNpUD6ZE1VWfSygRxnzcDYaf/yte7wPbPBYB8/hQOvX+qLa3FbCf2cSNkoYzYqr7RZE9HjT/hBjW/Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZJDW9Du8; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZJDW9Du8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNuZO9wYW3vUdoC5kRXA/fPJDOBEl1FuEAeKryDZcq1Lu7DRpZ4d2xnnpuRBgTLApWMk2EUjg4zj6qbcDzBIErByMaDT5PBVJzpE6JzHa7r9aM8xC9+Yi+aGAhOfq50moYzllejOeMe9CwdMzWjgAzvr/99whqGUoL+IckGxmvUKtWtFvx5Tx88Pg4M1ShX1mFX4yQFBBx/HwFP6FuxPFiIDkfoaP7pAOVZq4b4OZWUQq4mXGnCo+7usLTO1AV8/hl3ln6NCyYGgTKsEra7RuSR6wNbLFRxMQAYL0MZIW+i2pvLom7hP8X0PVx0nUpY51uNHwUAmKuL7GNUVx8/6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWCnmoznKXvgWUUVYHDjq7gl0ZqHa802Qe8uF03O5i0=;
 b=TF89aGRnv7NULZdnWyl7mfYL3zfwsOznXX5xEPwXtumJW0L5djd1CSKYeNwijJ60OVJa/P9aY3I3rbyrKgDOrvrHOtDGG0IJb59Pz+SdlmgBhGMogC9Nh1ePQp3vSbeeIgK9+na4XbjNftlnbmwrZuTrQvbe6r7Qp5FSFq5P/M+Ob6HUoiwR0ZM8JHj7VQ5zmXeLqR9dE0yh6RBtYgn55Oj5kaHUsaosOOjuw9nwpPhqquorjf9JIcuEojNZ8cA/TemeQaqd6hoh0TKbSLED67Z5+ZGlluC7ChGOkJ9V1QOc2Xp28zF4AU7V58Lo7l4yyNY7t4BTlAaCxIoEM0fRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWCnmoznKXvgWUUVYHDjq7gl0ZqHa802Qe8uF03O5i0=;
 b=ZJDW9Du8JwjimoQ4qb1cFKC06tpgQ9Ok68a1IJ0HT4bEF3V5bcemHA1xw55ibmD36wRTESgZTKGfeqxig5kjE3KXGxE0Wri/e5GwqW7Df2+tVnXpoYMxskIWuqa2OLT7veF+7VaHD4yIhPNJRtFgK91UktFm28qJ3bUzUOKJeeO/trrH/9eHd2oYxz7l4bVUThALAiKVeGfXHNmDvrrNqckr3F0j9K+IGo5K7INUbDfbzEUW0M2saOjLml9rRWn9hpW0yL73n9629h77uOqyMU5Tc7yxjdkrgxlsuDmgP+6rfoKaKA1NxKHBgUXWH3JlaYOg5/3AQEbuwPt7Pwta2g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:50 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:54 -0400
Subject: [PATCH 11/14] ARM: dts: imx6q-h100: rename port to port@0 for
 mipi_csi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-11-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181453; l=1028;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=EOck0q5j27977V5nGZtqVxUiY25l1In6ErzSktCp7CA=;
 b=H89IUPbkmp399YyuFRyRFpmQHBlX9k75BcbUszRryqUwbp8nSoaI/mDhL8R3owE81g7aVtcG7
 aYcvCOmvnuUBLNlfXt+rQnGN0A/Ur2zoQ8n/svRbPBhsVNin7BTB7/S
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:455::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 96740aa3-71be-4b7f-f3c3-08df2bc1b680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/IAL8LzgbodOHNVrWyj9KcvFxmTS3OrY4uKlx84pzOMYnJSFueYgvJhu93wezhlC/JngFKiDZSZ5OHEg2J//w6DNCIEejq46YqvNSo5DUPNtodULpbRszECe75Vw9eKPL8vWd9NtYwsFM3KYB9BCJ+xXCUdaDczzwNVrSAhkkENbF3/2KVEAHRwOGwHEemfoO3Lb2edvTRr8lWg82QU36uMlnZGcEDN+6JZKEXOsnLh+OJnWElaTcZaxu4C4XKHqkWc4gthzsT41s/mgDO2BekMkuPF+eKQI0qc8eDXBH0VyYsKgXKy3nhjGexDPsiLj1Ji+zfb6E5hx69N516F5MmqQKG1bJjs4wHLTCJQIXsNI2b9MVURaYzgGbqmmcMeI75P7ECHTe/tYmJpCSCSjdSI99lIaV27PLzyLPbqfn6xDaCR3GdyNSotfyQTliI8Ibg/tGx56qJTLx0xGs70buX51RSmXZjUOm5RGBzEEtKY9Z/qf6a0XHPQbDS63bDhAetbNd2wWZETnBm3z3iFrIS/h2QjCnnwUl5F0UM2NzwTXTGnLuJZHrcZ2iH1TWaEd76TefRhXDHgUpFFq90LTO3sNyaKJC/QEp40SUjIaijw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVBNUS94SDVrTmVnYTdnTWVUZGw0OUhPcDMyS2QvU1QrT0R0Q2JnUmYramlv?=
 =?utf-8?B?a1A1UERzNHhVWHBHL085anFJUzZJSWZBdUlEUkN5N1JDNjJSOXE5UlRKL2Qy?=
 =?utf-8?B?SmdTazBxNk1nMVY2UUxLcE5MWlZESW0vWGtUZjJwVlhTdGVBOTYrWEVsYUp6?=
 =?utf-8?B?bDFkaGVhYVJNejZ4bWdBUEd5Rmord3lqTC9tUHhEZml4dHdWT09aUlJmOVI1?=
 =?utf-8?B?Z3M4SC9NMGlSVkxVeE4xOEs0dTdvMzduS3hJR1dqTk45ekVrUGRueUZSQTd2?=
 =?utf-8?B?bmRSZDYya2piZUo3aGxWeXEyZGsyRmFXSVE3eVZ0VWNYclNaY1pXdDBjczMw?=
 =?utf-8?B?WDV4UUl3Qk9ObFZISG5mcTJsbldSNVBOejlwQW5WQkgwS3NVOGEwdzlQNTFi?=
 =?utf-8?B?NjdkaXR2TTZEaDZaQXZkSlhENHRjRXV5R0E0dGNJZlFqRzBva0ZIOXFObWE1?=
 =?utf-8?B?MTF4cks3a29uRVJFT0lXK2JRY3Erdk5vSU1oRWlncW5QYWd6Z0JJSlM2UlBx?=
 =?utf-8?B?NytoWk5CQ0FUNEtsVVRqQmpncHVRZFVXVVoyYTZZVWppUFgxRUdjNkhmalgw?=
 =?utf-8?B?d1I0MFl4MTFkWG1ERWhHUFZDakJyaFJFbUhZbVU0eDZqYkt5emNWMzZwK2py?=
 =?utf-8?B?aTU2Mll2YmNRL2YraDkrRmEwQzZ3YW1wLzRyNzhXNUkrUjkwU1V5clY5QVNJ?=
 =?utf-8?B?cFRwaEJwM2VXRFprajJuWGsraStBdXkxbElTVmVidStlK1V3Ny8zTlM0SFRR?=
 =?utf-8?B?Z1ZhdWRLMEpVUzZBaE5WcGlFZkl6eklxVk50ZlRGcUY3bkVEN2xGQVVHMDdy?=
 =?utf-8?B?QkRZcDZJRi9QWDZ0em9SMDh0YmpVV2dJT1F5SytNWHg5TnBYZU53cDA4SHdm?=
 =?utf-8?B?ZWtpYnVNU2ZRbWZWdjVuZ2VRVEtpWGllWFVNUkhVUURzek5jdk1wQWM2SFpN?=
 =?utf-8?B?ZldTOG1VQWJmb0FMSnQxa1RLaWFlNlF2SnNlZjJuNkxWNmljNk03SFFpQVpM?=
 =?utf-8?B?REJleitJZk13VHBENW45UlpqOEU1MzB1YTVzTTE4M3JudkVoTEZHRmxwcjRJ?=
 =?utf-8?B?ZkVnQ3RxcUFvTVMyb0haNmFXZDY2ZDdKbkE1N3NRMUl0UVBIQmIranlUM0dB?=
 =?utf-8?B?ODFlb2x6UTRsV2I4U1B3eVlIZmdOM2ZuU1hueUNIY21JOVo3dTNOQ3B1K0lJ?=
 =?utf-8?B?dFhEWEY2cUR0VU5xdXhhQUV6KytlblJ4Rjg4c0VLODNxd0FqeHNVUjM2SzhT?=
 =?utf-8?B?bUg4SXpYNXlKcVdwZGNpSjFQbFRCaDd0aE5YWktQSGRhWlNPbHRZa1JGb3d3?=
 =?utf-8?B?azNJWHBKRXdEdVRSKzVHbkkwTXlkUitrQmkxUWsvWTJDWmo1T2J1ZDhIMUph?=
 =?utf-8?B?aGNLQmhUMEtGMTZUYm1YSDhwUERhSTVDaHRVL0JUSHJDdWxxbkJNR0haWG5G?=
 =?utf-8?B?UDU4Z1lkaWNuNitkaGhFZFNjQnZERmlrMEdYN3pYK1poSDhiMC81THhhWHdE?=
 =?utf-8?B?cjQ2dWpIZ2ViSFBTSWpzbE9md3J6ZmxUeGVmWEJDRnNVSFVQMVVIbU1NRHY1?=
 =?utf-8?B?bkdlQWU1cXc5ZGVMWmNUcEtkNWVNTDFPdVVIWEgvcUJkekNQY2IxbGwrbVM3?=
 =?utf-8?B?WmF2S3cyaG44SDIwNlZ2TzR2cHY4cThKTE5paUpwTGkxMWYwclBMRkVHVXc5?=
 =?utf-8?B?L09wYmRCREpHRWw0U0YvM1REUWhJWEtnZjNiaWQyVU9mbjZwaUFFUDR2Q1Z5?=
 =?utf-8?B?WjA3WmxFWHhqVndHZU44VmpaQ2VpaUtsTk13RTkvaklPYTQxbTN6TUQ5ek1K?=
 =?utf-8?B?eDJjNWdqZi8wRmI4bThuU0lrRUJ1UzJqWkRwczdVOUE3Rmp2ZW91OFVuY0Jo?=
 =?utf-8?B?WXFMc0hEQnRqWHJXV0lYdC9weUhsTWFWVG4zTjFvek1Sdkl5RlpKMXAyZTNy?=
 =?utf-8?B?NVBCS1RMS0JGTUpORjZyUEJBRjR1eTZrTnhaZU5Ha3NneEVqTVlYTm5pbGU3?=
 =?utf-8?B?MFZKOGl6UmxEU0VMNGdTZmFhOFh2WkVuVGpqTHdpNkYrNmFvWGFnK2NoMmk2?=
 =?utf-8?B?MFNTK0dGbVFSMWxzWWpxQVhwR1NOM1BnUm9sTGl2OUJ3bnZmUnl4RXpGU0U5?=
 =?utf-8?B?SjNjNXBFbWIvQkc5Rm9rQy9UR0h4Tlg4OGlCVXJ0c1haRWljUDZQQ2FnMDlX?=
 =?utf-8?B?RDlMV3FpSHVJUVM5L2R4QytNSGpwbStHd01RSFRiTDB6dkhpa2pWQk5HallC?=
 =?utf-8?B?UGY1bGZGL0w3em5oUlFuY1lxeVdIaW1sbWRFdDgzTThWQ0l5NE82NHVNL3pp?=
 =?utf-8?B?alJDNTA3UWhRRG1XZUE3WUZRNjdJZHptR0JzS0cwbGNkaS9TUE94SUx2NUhU?=
 =?utf-8?Q?Z8dJTC9bzmgRa/iLCzoqFZ07KmZrafP6aAu8P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96740aa3-71be-4b7f-f3c3-08df2bc1b680
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:50.1920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytOlp8o+LKfq8qzpqqFZlCNbx2063atArKRkuw/t3PuxLlnt4XdXft36wzTpct/gX0t5TKAFi9BDZJsWSCM6Rgr/6o70PLHyImD5ufjMruicKTyfgrB0ZAYXL81U9Cc/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

mipi_csi port@0 is input port. There are not 'port' at binding doc. Rename
it to port@0 and add reg = <0> to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000 (fsl,imx6-mipi-csi2): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$', '^port@[1-4]$'
        from schema $id: http://devicetree.org/schemas/media/fsl,imx6-mipi-csi2.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
index 4c8ea43815597..a5180c655c9a6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
@@ -335,7 +335,9 @@ MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x1b0b0
 &mipi_csi {
 	status = "okay";
 
-	port {
+	port@0 {
+		reg = <0>;
+
 		mipi_csi2_in: endpoint {
 			remote-endpoint = <&tc358743_out>;
 			data-lanes = <1 2 3 4>;

-- 
2.43.0

