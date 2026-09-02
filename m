Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA14AC164;
	Wed,  2 Sep 2026 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376417; cv=fail; b=EOvshO6XZFMS7WyGlwfjjIPH0QBmg95EIl2mNVk4RE3modPOA9Z3hj69LfL3IDPgaefv9tf+an8jYaHbk/EIy+2KBigjHITUlWvyijij31bl2swsI3ZniA7bU7i29h0hHnOL7uBME1Ygl71DCcJYZgSAq76WkW8Iws58ZXuXCaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376417; c=relaxed/simple;
	bh=wZvKAvpHuiiO2rG0Znn7ts+X+Gp+epdcuk/KIkhpvrw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MXbu942vmZqnlmr0jNBGCpfl8WWUcBLkMppk2yFxA2zJYVkAt5me9CnSVDlJopsLHPoikqOjUxreGJO/zUW6lKz+2S4bRdN3/cJKzAXNbvFHhUjpQZO4Do4b6KOWv1Rm5yXbKMnlLiEg4ZbAHb9b8txgCl4mSQMeMN1m6jpoWGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xYx+js1t; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xYx+js1t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeWNS3CkyXy9Ye5yRauF6E3ZQpjcftXSNoMkbhxUxQhx6338iM5MliG52unMZ9UlwAYZLUX5iLrJeoESnjxtLfnqwv7kzBseD+JJ0F/O9cgIYk3uCkwFxeRMjCgTPU/0me7pzFAlOb3+a2GFfQsCMWeGRj4R1/jAuyTzxZrFZ9WbutqVQ/iVAX9NFU1BcwRy7G/0cScuTH2ozzFNxwJ0sc4+hOWyaSUshE0AEdXg0PUkzmHbRXt46mCCAE+PiIKPwcfV57bG7kvb/LStbfWrvT5spGlmLkQyXszuEU+/WZ32WQArKfA+fSQRYEJpdPbFaOrTA1TTNlCDA09w41FJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSUKYQu4N3EO4hDc5YKygoFAwmLy2r+nEvS1YSH4AzI=;
 b=qJKu4X4Gn5AWkaXQjZxpDGIoPq9sfLqpQMIdk8MKKUCPk7PNBSU0IY1kaPM9wXTTX79KTBsPeBXWfzStSM2jT0PhkpKNyiprdIUV5NwOWaqSwNv4s6JF9sBcDZHtosMjuX7nWhQ9j6kZbfY3bVWSWKKe7lvRefwLJJ6VKRH09ycm27UXAAd2EexSyEvCxVt8n7QTRSCWh/8hIoIfP9Wf/puT3vMKbw0k4OF17zHu7olC/n2j49JkycgZSyPO3aHV1vjLDImJa23yUD6EdCdHBQ9WhStoKDnPS7Z5qZggnAlNcjVaxYdMbyjXuWSBo8F9uQq3+IH0C4TNIz8fbf/16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSUKYQu4N3EO4hDc5YKygoFAwmLy2r+nEvS1YSH4AzI=;
 b=xYx+js1t9zGYyVjThFt8gA3I1bVZhJrET1doKfDHs2Y19YMiu6gg2920YaZ6cDiwlLCy7SMLNPZSG2UFKaiB9wMPmgaVk8eZiJkc3mOYimbFN16EErwh867C72yhSoG6To51sKM4Kkwr3hf+Wo12CX0c6gj1YsH4MtfVIT8E5qa48gpD2v6FXmIOcQiRBh4z+ODKJ5Mkw8HxnQm1KpTDAEUE+xHzIshYZAi8frzzkdMDEQ631IjSOUzyrJfGLcCuDHm159qO5AqX6wQkEXCCpsCrp7EgdHlY89NeSIK/LwqrtP9+bpXq9ar0hly8F4mK4rk8yhPgP0nE4ZbnbDk8mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:13:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:13:32 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v2 1/1] ARM: dts: imx53: drop fallback compatible "dlg,da9052"
Date: Wed,  2 Sep 2026 15:13:20 -0400
Message-ID: <20260902191324.2084035-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0098.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e8786e-3861-4557-f4bb-08df0926472b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|366016|376014|7416014|921020|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Xcx9YcEkihD+oPTgN46qg80G/0c7DeswL7o0tOu8+1SCVyWYe5fs4pldLWG2Ujs7jGka8nDcidHZyStIfB4ALrtsD5HlgJI5hVSbrKBrFeLvcQD1A7XeXcbLBylFTq/VBUWrlrrh6dwk9vllON4z4SaMqmUdtYoVrVwDSi1OlJbdY44isk6je9naVeTPIBhpxOjrQzmAFzDs390Kfw9tBS07whEj5cgKPvYhHUAYUFrvK3mFIqwsgzDsg0v1tCGengP0pdPOLzGbI30Ia5k9F4BdVRDU7B4ydWt8CBuxu4tBbf4/LhGpi1GmZDtitcal9Kuh2xAyvggyhg1z4vlkibBV3Zc7n4/uKm9RPEmcfy8YXgEUSSF+JV921O+mMzq7Mvle2MGp7OY4jUvbSHNjfY1gQHrBE+LhQU3bYD8ABw/dhavk1W7W+gCp7/G6D62bB7fDFZeTE2P/yQenFFOVOPlOXpJCpFdZOrfjIArWItn5Z4ufVyOuzrGaOnq1jmYqBhOxhEvfxXBIDg77I+RWj6MEnLnD5zGWdEhGkRo81Ats88Z2zKEJXgvuYkzkqpj2e0WdnWYjGcANCSVDoLdC6QHHPCKZoheFtdXEiFJunZQuUaQ933Hq84V2wws0wZ7Tnylo8/GOrFcERV1CTReclFrLe6EdlggYHQraUTig89n+ZSFIsWD3mBRbS2rhVkC7DxC9AmhEHe80fS182UYJmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(366016)(376014)(7416014)(921020)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fXSuCgmzX9kFKune1RA5EDXR9EFG72Bizq+PAM2e9/1SSDka2QQVkfdxlTEa?=
 =?us-ascii?Q?owaIm0MY7bhc/OOUDIF0Fg9+6bz8SHd9lP+jdAoEnc/iweYy1VQjOUhsovbB?=
 =?us-ascii?Q?/vzFD4CKe+oCZRCcoX5nBG0Gznx3KK6Annj+Jw6RiOhr0gxKbViaaI5QkMcR?=
 =?us-ascii?Q?p4S4+Ia2BE8Y2hwtOeikBaK25FHffaSCMxz2t0jNrNht83FdMkZJyxNrZN7o?=
 =?us-ascii?Q?Fdj8TG09SewCUkIai30zFsZ3/UWoixcwu3vJ7C5paC0XI25uh98zgXkrTGVu?=
 =?us-ascii?Q?WuzTjV0HUAuCrOWY5evnrAp86RbfsgwDVPShH4xx4BMAXqaQecjxg+fc6si4?=
 =?us-ascii?Q?C/Fc8UEVREYe0UvjTEUMXJCtFb0fgDqfuSeJH3OHmM+msoh70+BlFFt+6ypg?=
 =?us-ascii?Q?FWJlktF+M0FUUGrGj3F9IDOiztYMKq+mg5YzokKE2NGgYWqo1iGAL73USoUL?=
 =?us-ascii?Q?QwGhizm3Em1QINW7rqlEkhyUKFV+3C/64noaVmyddb6Ke60TcpGePsla+ucn?=
 =?us-ascii?Q?McCa4bCP8BLlWFCl0+naz5KiuZpoisdaW4MC47u3w/E8i/MKUka2XP+t6xZ4?=
 =?us-ascii?Q?0wQCG1WHV4M0RLdEGvivfQhAdwcaiNJ30nuyD6B1YYI1ZrRxT3IWAs9UWKv7?=
 =?us-ascii?Q?xDBpAET4CmwRci7NUKAFxlMzFNU/D+Vx4OafYehy4zu6NVcV3QRCVvQXiEVU?=
 =?us-ascii?Q?PNNUh+Uw2PT43JU4p8EThxj1wRNMnFRUFF7VczEYAunLIT73iP4uJzvvJThT?=
 =?us-ascii?Q?IXYcdyoWpAdDcANWFhjbPGj8irHf6H2EmP6EMQ+Aj+43lczVsoZf/6N3i6ZR?=
 =?us-ascii?Q?ZkhZi4JHVIvfg7bG1F1PtkQuy5CgSUN9xAXtXq3AQ9yrephJkaMmmRRSSEg0?=
 =?us-ascii?Q?K6/J74iAy8R26KHG+5pZfOQYsYIhwFlw0jtoOQSExclUpMG3kAtRlJfTcb58?=
 =?us-ascii?Q?kLiqKpYl6ueBROR8D64o2rs+Ib7lJAcC3OgcrjdXgDfrf5FHJ69yhP0s/dx4?=
 =?us-ascii?Q?QO5uutDrBIn+k2t61TIr3lY4E6TR/AP5qTbjwrHl8K6L+pLc/8xAXU2v1S+8?=
 =?us-ascii?Q?943eMKgevSNLJfpnqsBjHQyJEyNUdmMit7bwrOurc/dpILTtizZT68tSsPqC?=
 =?us-ascii?Q?uZWDMucj9Pyr8ZQUGlfL6GKJOgam41/2z50xArGk1Ob/gEVScEKCZFXgMoEB?=
 =?us-ascii?Q?Af572RcmwbDAdIgxUZMbVQN+FH6/nd587mZr031K5dCbR9QQj6LHDr65Hbr0?=
 =?us-ascii?Q?MxZxhnwnNppq3zYjqfpO1k8jeAf4Jv8nZh3l9zqdDF9SuNiuAyNRCjNIPpTU?=
 =?us-ascii?Q?6RfHfJNX6VvG0Ye31SiEPebpFxyBh/ipTwycFrBW6AnvPHm/rMVUoCuSiqtw?=
 =?us-ascii?Q?hAxj5IEVEtwIxGXQNdciKSVGuIEi8+Te2TW63gukw9vQrWJsjSkNEnZZT88R?=
 =?us-ascii?Q?eH2SitKNNmsoWIlKNj3aL9cmT+nbC5/fSITKoZAfuFUUaQHxsCxYDpdgX66g?=
 =?us-ascii?Q?3YNd29YYLS1QFCKZaAU9HTsJMQfhoaX1O9VCUkh/BWLfSEt1QwaeuXZhWRD5?=
 =?us-ascii?Q?YmEB0Bkm/1QLRtkLLZMqSvjJT5UT7SrpcpeEtf8VmvPLJvWk5kU1jiL7e+pu?=
 =?us-ascii?Q?10JY6N6mJ7xQt1wWH0hBE67K+j3jUqZKdLFTVu4q19u0qVRX+2tdI42vaoeK?=
 =?us-ascii?Q?f/LMZODXNjUA5eNWij3PiZZqKxdzDia5BgNk9CkAf7Fr1JvP6nUXnZoDMdCx?=
 =?us-ascii?Q?HUpWAf4/Vzras12U+rbUY0KgaBVUDuq0c9o0In70JovLKUrL+W9B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e8786e-3861-4557-f4bb-08df0926472b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:13:31.9078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTWb3qzm/RTMlvWrlgYWQmwIjJofOpKw9iAS+4Jf4eWqZ8rfxh6xUdIx+Ofk3e95FwbZPCfl6tebxWdfCwKjYeH60NfbrYg75+z/0b9GUEYtLY98jpgTVqOeOM0CYjmL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

From: Frank Li <Frank.Li@nxp.com>

The "dlg,da9053-aa" compatible string is not compatible with "dlg,da9052".

DA9052 vs DA9053-AA Differences (from da9052-regulator.c)
1. BUCK4 Voltage Range (only regulator table difference)
		DA9052 BUCK4	DA9053-AA BUCK4
Min voltage	1800 mV		950 mV
Max voltage	3600 mV		2525 mV
Step size	50 mV		25 mV

DA9052 BUCK4 also has a non-linear voltage mapping above 3V (step increases
to 100 mV for selector >= 24). DA9053-AA BUCK4 has no such special mapping.

2. BUCK Current Limits
Level	DA9052 (all BUCKs)	DA9053-AA BUCK1		DA9053-AA BUCK2/3/4
0	700 mA			1600 mA			800 mA
1	800 mA			2000 mA			1000 mA
2	1000 mA			2400 mA			1200 mA
3	1200 mA			3000 mA			1500 mA

DA9053-AA BUCK1 supports up to 3A (vs 1.2A on DA9052).

Drop the fallback compatible to fix the following CHECK_DTBS warning:

  dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes at v2
- update commit message.

Cc: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>

at thread
https://lore.kernel.org/imx/20260902-varied-unsent-b99f9f007685@spud/
Conor Dooley DA9052-AA is NOT compatible with DA9052.

I missed check da9052-regulator.c.

prevous kyrz ask drop the same patch at
https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/

Add commit message show why not compatible.
---
 arch/arm/boot/dts/nxp/imx/imx53-qsb.dts             | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts b/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts
index 6831836bd726c..e7e15d2b82c44 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb.dts
@@ -13,7 +13,7 @@ / {
 
 &i2c1 {
 	pmic: dialog@48 {
-		compatible = "dlg,da9053-aa", "dlg,da9052";
+		compatible = "dlg,da9053-aa";
 		reg = <0x48>;
 		interrupt-parent = <&gpio7>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>; /* low-level active IRQ at GPIO7_11 */
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
index 6dc70a92d831b..6eed683d92a83 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
@@ -128,7 +128,7 @@ &i2c1 {
 	status = "okay";
 
 	pmic: dialog@48 {
-		compatible = "dlg,da9053-aa", "dlg,da9052";
+		compatible = "dlg,da9053-aa";
 		reg = <0x48>;
 		interrupt-parent = <&gpio7>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>; /* low-level active IRQ at GPIO7_11 */
-- 
2.43.0

