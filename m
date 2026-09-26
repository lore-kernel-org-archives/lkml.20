Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010006.outbound.protection.outlook.com [52.103.20.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10A430CE7;
	Sat, 26 Sep 2026 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790425581; cv=fail; b=ITp4haTY3FB5+XpdgZuRihx3/EmaaoLV6Qj1vzAA0RvuftvpiiE6QOQZzvRrQKtuU7XjNI0Ey5MG8SguMa0mTw6n7FwK2RlDndSrbdWx02C/uIaNr+TC9diPb/C7tpmzRCIoXfCsMKsnc6vqoNZ2JojxWpLRMayCJV6R4HkMa68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790425581; c=relaxed/simple;
	bh=PnFQTRdwOhGfoK+gUl5CeKcOyTtqLRTumU6AuHuvSQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VKInwCqxfIsj01Pto/YEnZxDPTOKBpLyfnNSPzaT4aCAyJKPqqYKjJrLCHEk9YnUOO1tMPWfFIutfF4svtZ2iISqjkhKUJC7gfPg8OJ27ZbLD/OXPgj6TwhyOwNJ6H7YlFfWanr5ktySF7neMRAPQ12RUCpPyXe2YlWUCeS11qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=jBpLQaUW; arc=fail smtp.client-ip=52.103.20.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="jBpLQaUW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM5dsV6FXFiixz8lt9gJIjl5iBIY+z/iOrja9/GGO13d8Q3xfpJFSWtXPXtNjpTiTTa2vCzB5PJw3H4zxnDB6rE+oSz277Q/3xND+on2d/hE+nVssazZbc4sBpWklWI24rb0k39GeQunMewGVmBMNdJMako+BpdGpj2HiptPwWEOuL4wkPOabt7m2rVGZaJ8tflLHuY7DPzzJ+8qpoUPtaXsgg3JzNnjzGfYd/UyVU6DKzVEHRBtomVjsFhbIhTnArGlRN0KDtNr1ylwQHEHPRK+Cqo6wU6Qg+gLo5UcFcfo5khUROp5YuHwrlEI5t9d7/ORfhat2tJCHdIj99afeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SNkUe3yf0j2yXboEnTp26NFC8zZ6RC14hSwq9fbNhc=;
 b=K8eg5K8K7frdIFQHwoPc12S7n1TTg/zGXdx9iDHliRgm5qvIFj58sfPAlO+PP5vrK47XcedIF3bihgOIp+UcSr9W1xJwRqFIsZkwOu+fAFNbTFrg+qhlnTE/XOoiqGT360x2m9ro79SkXUFCYHltRfccfHHhgp9RTFNQohepjhtJOK42bOszRuAZAhzW+hGnHicAJ3fWui/LwvLSe+9YRxksoT+zDGw2G1+YECqiISkX2H3D9eyJsDvEqCltCf97+FTb/BynXRoMzqQh9tnu7GnvioevYMtl30Qprm0TjDVXtVqrqb1Ol6OIC+KbXcPbTn0ogoCkHx2FzqQ91NtsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SNkUe3yf0j2yXboEnTp26NFC8zZ6RC14hSwq9fbNhc=;
 b=jBpLQaUW3yCpLY0iD2wFqllFQ2Y97Ll5V2CdHuaraVwkGcS5nQ3VU+sK9Q51st/oQQrqQDElkSGNSTMgE/DEKo5TWcvjjswCKvzmBzNR61R5BeuLgVF8kYzAPiGPqJjR5MzjeoIjYw9DKNKmCiEmIIiyZVrDGdD7/vIdp822RnVjPawkop7auENWT5twUhzyjGj4dEM7SEPL1TIhLzjhs/MLP4L4afkjkVl+F9AzsULRvK/a+Hdc0FAxYQ7iVjqsn+CBzrBT7boWYKVV5BzsffsoCnICjLujpu9g6jIveQeHK5Lqw2STAWxsnXu0HAQxcWED56D4+ZcuKmvV1k47Tg==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by PH9PR19MB278024.namprd19.prod.outlook.com (2603:10b6:510:3ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 12:26:17 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 12:26:17 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH 1/2] ASoC: aw88399: skip BSTS check when boost converter is bypassed
Date: Sat, 26 Sep 2026 14:25:58 +0200
Message-ID:
 <SN6PR19MB2303FF1922BF5F876378066FFC8F2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SN6PR19MB230304C2E75499FE23B53885FC8F2@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB230304C2E75499FE23B53885FC8F2@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B79.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::40d) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260926122559.8062-2-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|PH9PR19MB278024:EE_
X-MS-Office365-Filtering-Correlation-Id: 580af1f6-ced5-42a1-59c1-08df1bc95d12
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaX4k0U4lEj95z8x2OS32P0pRhB2fkYuaDy4n/Ip2n7UdfJPRjFQGWfCWsEQ6gNTwMDJ1m8tR2Nmflyu8H+f0qIzCOylAoJOsfHgEe9QT6yYsnXvZUNmoljy7yqQ3j/tAc8a253WskKRVkDNX7F1WJ80SxzHCeNL0/+fHgFzzLLIszlnPZBQOFfCw6O2x5MBuwTfwGz/o/szRo501UZeGYF2wIg9bfH0mavcK9JqsFpRDIJAHOlil8hpjNTg5o77FU1dwGciqaUJAswIkIVqoG0mqYBN/tNzcjprsi1xl2ySNi97huLGifqyxXhFwdkw+FCvIs8iG3FD9HWpdXIPp6BIrXNd1RWGWcDeV9nhRZSJ6GD9IeeHASjOLFxkuBIBeuCM6LalmPLLS383iEZBZajFKjpYdkRzji3m7j9yqluzMndJURHT7hHyeP9d5V739MPNci2oFKne9TAIiK0N7rvkvziRjY/W8NuLbpxrvhzETx1FM35y0yurmEyZTv1SYx79F+h1UNHc58bkS0g9ZjVoqRaLAyx8e/RjY7/sZzaQpKlIafUNFKdlj5FOXqVvlVhwl+FZ1JVyxqWHpkmwfYDPean6D5ekSrrNDLCIaj0cWoqoWkeQIE0WsoxkitK1sS2qySxge/wfmzqQ2SScEdv1xI9bO+U1VRrJnVYB9NJhaVkwBZ72yXXJAOgTBDdncm4p70TeJ8q74kl1L97jSteFcZgRYQmTmdkz5deWLnxlWnBtkct7NZYsrmQ7m8zkyT
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|12121999013|260925184616899003|41001999006|5072599009|23021999003|25010399006|15080799012|55001999006|51005399006|8060799015|19110799012|40105399003|2607281247196008|3412199025|440099028|19061999003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l1vXrRnNuZ/ogF2JTDMYrIW+E839Di1w38mJH6FymGyEYyspKLwKq4DYajfO?=
 =?us-ascii?Q?e3SauEft54XoT/cpqkIB05cimuGWT27PaUaIhwNV9d59yMY19Z7KOU75fcu5?=
 =?us-ascii?Q?nV6aBIcaAosBjtvNQEe+21SI/I0mxCNQeHMVk1475O8Lry4lGV3fnUBUAdte?=
 =?us-ascii?Q?5JvwdT8/y/YOc397DllOgcgBli7Yn9XeVWh57+WWeowf2yxK38BIKhKNt6do?=
 =?us-ascii?Q?g5sb6To93WJNKCz+TvQHj+K+RU3wW8L/8Jn0pAXJpVXcxwx8wBwho5jyw6sF?=
 =?us-ascii?Q?VF2SbvoOL3YBtDy4Z8Es5eSESmm2Qed79kRWDbo2xo9YQogqE39vEVRkU7wu?=
 =?us-ascii?Q?URYzpdX3gCo7h66cSPq4Do74soSD0Pleox8kaKXS9210ZJ5yb7XcP8kOfLWD?=
 =?us-ascii?Q?fXDZpIAtWmWHQS/JRXqk0mnzzbz9lCgnY9+ZZqhyHrLFMvQToHBcf0GBKCgy?=
 =?us-ascii?Q?YrO0oh+qxPdUOgoKYuHUBS/qgNzsBhs15XLzA0nMng+A/eemUrxWpPr7daXP?=
 =?us-ascii?Q?ZE1a2zv+5H3AySXJnfdKmcQyt/Qk0qOinT/q6TDuPG9yzpyl3JmIfA4XYF96?=
 =?us-ascii?Q?THChvgrU08F48vKepOUltPlLD0LekItN1knBq+FREPbweaDyl23EMncYAg3o?=
 =?us-ascii?Q?MkNIPiluP9x8T+INN7iazbgBJ3xa1PNaTPBDRiVTcqjgx5OAzvtvBzXgZ6Zk?=
 =?us-ascii?Q?cWkdWNJl/nyqR4lw8zdEO9L524797+twt166I36VXuWDD8ooIUyNkWITof1j?=
 =?us-ascii?Q?vshomAOKTuUc4P/xs2WugyJ3mcIxE2/SLOiN3zcTqtpfB7QdhSA6D3tj7g9Q?=
 =?us-ascii?Q?m5JXAorWiEJgpIbkr27Y6+yWFXw9BUTZ+6nT8mJtZ4yZ2AiWjzxrcTcaVHHz?=
 =?us-ascii?Q?laCrCl3yHVql2bFojRorTHr9xSHPd1geZBJE/9JM/G8kpvLs2hwte0qJ9Seb?=
 =?us-ascii?Q?9myY1cadWWmMVvs0ARZxJ6mQGBGpKqPLrRBI1bNNPGkw7ksjCOw9lQ3BBYbs?=
 =?us-ascii?Q?H3cyyNpOqcImU9GqJgJGfQ8Bqx2skKXFEcZqFsdQRoy2LReIZYJ/54wSxook?=
 =?us-ascii?Q?XVliquSrFIrtf68drMcDIFNCzhslMg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GMCP158n/Eb1b2d4aXO3FJbVaf4dltyGix63KccvNwr5kUt2eBLEP8Zzce+H?=
 =?us-ascii?Q?KCOZprdR4wc8fuLivmLrc5n10DtQQihHV+d77mOWXjRg6AneGMeoyOeEkhMg?=
 =?us-ascii?Q?jqMVLTYmr1ebjf+27a6V4+u1L5dtri+9FAwD3cD76ydjhvqbTESHg54cQ3He?=
 =?us-ascii?Q?I1dqrIDnmCiVFneG29LR9E9A9ITWmglLKEr1MWy5QB8IPHh+Wow4uE/1pyS5?=
 =?us-ascii?Q?buGQ9fE/sFjzaNpPPTr7+NEvpeYpKzAIuh6EpdhXaIgl79Kh6rzRsyZSBDVr?=
 =?us-ascii?Q?oU2nKYEdeunSt1Wxh1ATyYYfwzs00G7aw/jdBCdH1rqRn5mQvsuiW5AYB/d+?=
 =?us-ascii?Q?yA/mHE4uNuEXIl6iVc5IYJJSsPFSiqfB7PCbuAW05kSX19TXiXFssFtEXZKV?=
 =?us-ascii?Q?7g7h5NoioclNDl9Qag7SAaum9aXkjytP4TJiP1lnpIMamE7bZj3augLwOYxp?=
 =?us-ascii?Q?D874o6Q92Ubxd7Ilz8q8y3KKt1o3TCcJL7iMHoibNJym/syxyPev4rvcHf7j?=
 =?us-ascii?Q?MkqKwhT/xenOeEr9j5gI1NPdwm1LtqyFiaEpUgC0Pyce7dcTf293fBgYTTay?=
 =?us-ascii?Q?ynO6MsRbu6dfM7P8b3NU7cfRZ1xXubp0lgyHQihGGYa2+Gj+yK9hNQNzugrb?=
 =?us-ascii?Q?XQXWeRQXOIrAP5Wu6fVIdUjPW9d7TGv7mlbEEETLjqZ3BRPNF253uLcwAzq6?=
 =?us-ascii?Q?OVj2eTV2ulcg5mxAicFmmveG9n7nyY8GeZSe81qORzSLW9HOCwe8b+z5wusO?=
 =?us-ascii?Q?VGEZW9c+4nLc3grzH/aIepenrv9+w3vj7XIqsWVti2Xo0vqS4AL8ttg8IYuV?=
 =?us-ascii?Q?O3ivQejBGan5JhfjlPp4ve3efkPZ6kcGnaGazDoRwPq1dOu4KA1qQ1ZUdqFm?=
 =?us-ascii?Q?lNoiLQwTmtAxr8dxphfBwuP0vAR1qDmnYjWb0KKdCxlmfWD5lG5oKwnYtYYF?=
 =?us-ascii?Q?C5hnV1SuTM2LyrpMDuo21bvhzQe0nniLRpxRJrtUsKbMB4FgU4zlnOT1iE/7?=
 =?us-ascii?Q?qFodtcvL5D/ILwGpG3kETcG8dVSeecnOgmQJQhTBSHA0IfTUCf31MR8Q1iaL?=
 =?us-ascii?Q?jlTa/BUDLtgKIsuPFOO38M5/EGmIb2cD9OmeHPWEfCSZfIEKIOxP8sp5jlZJ?=
 =?us-ascii?Q?FwfejfwWkotLWQeuH9cunqfjBUStL5W9Y7MZzAj0JRKkCUDsTBtvjOk0g4m1?=
 =?us-ascii?Q?r7PS8cSS92bjvgG7j7Xe7toDLIhp0wdtfTgtV3hDYKXn7km/zgJ+JA+epFPJ?=
 =?us-ascii?Q?QRUNpCGxwrBt8MXLMdb/dDFv2o8kipEMJxhlshL+BEecjEJom/FN0+Y8GhKF?=
 =?us-ascii?Q?FFKFp7qIvwqtaVqBuMueXOAKQgQpHlCiDfCXNovhzajcsqbI2lZFfCbF86U+?=
 =?us-ascii?Q?spNMeN7ywzjWEvNQXbkTG4qcPsqJ?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 580af1f6-ced5-42a1-59c1-08df1bc95d12
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 12:26:17.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB278024

The sysst check in aw_dev_check_sysst() requires BSTS (boost finished)
to assert, but on hardware where the boost converter is bypassed via
external power supply (BSTCTRL10 register 0x69, EN_HVBAT bit 2 set),
BSTS (SYSST register 0x01, bit 9) will never assert.

The vendor's generic driver (aw883xx) handles this by reading EN_HVBAT and
conditionally masking out BSTS from the sysst check. The in-tree driver
missed this logic when the original code was ported upstream.

Add the same conditional check, matching the vendor driver's
aw_dev_sysst_check() implementation.

Fixes: 8ade6cc7e261 ("ASoC: codecs: Add aw88399 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 include/sound/aw88399.h        |  5 +++++
 sound/soc/codecs/aw88399-lib.c | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sound/aw88399.h b/include/sound/aw88399.h
index a1e0de6be8ea..974b5774ac2b 100644
--- a/include/sound/aw88399.h
+++ b/include/sound/aw88399.h
@@ -449,6 +449,11 @@
 #define AW88399_NOISE_GATE_EN_MASK	\
 	(~(((1<<AW88399_NOISE_GATE_EN_BITS_LEN)-1) << AW88399_NOISE_GATE_EN_START_BIT))
 
+#define AW88399_EPS_EN_START_BIT	(2)
+#define AW88399_EPS_EN_BITS_LEN		(1)
+#define AW88399_EPS_EN_MASK		\
+	(~(((1 << AW88399_EPS_EN_BITS_LEN) - 1) << AW88399_EPS_EN_START_BIT))
+
 #define AW88399_WDT_CNT_START_BIT	(0)
 #define AW88399_WDT_CNT_BITS_LEN	(8)
 #define AW88399_WDT_CNT_MASK		\
diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index 809c2faa0c0c..1ba0147cf4df 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -183,6 +183,19 @@ static int aw_dev_check_sysst(struct aw88399 *aw88399)
 	else
 		check_val = AW88399_BIT_SYSST_SWS_CHECK;
 
+	/*
+	 * When an external power supply (EPS) is used to feed the amplifier
+	 * (EN_HVBAT bit in BSTCTRL10 set), the boost converter is bypassed,
+	 * and BSTS (boost finished) will never assert. Skip the BSTS check in
+	 * this case, matching the vendor driver's behavior.
+	 */
+	ret = regmap_read(aw_dev->regmap, AW88399_BSTCTRL10_REG, &reg_val);
+	if (ret)
+		return ret;
+
+	if (reg_val & (~AW88399_EPS_EN_MASK))
+		check_val &= ~AW88399_BSTS_FINISHED_VALUE;
+
 	/*
 	 * On some hardware the BSTS (boost-finished) status bit does not
 	 * reliably assert even when audio output is working normally.
-- 
2.55.0

