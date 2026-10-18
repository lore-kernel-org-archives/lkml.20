Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012010.outbound.protection.outlook.com [52.103.14.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07941411A1B;
	Sun, 18 Oct 2026 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345462; cv=fail; b=bi+6+F+afqhjcSlKxHNQR5c3kUv9PouNu7JshxuSc8bUc4sk697dfDwPiX/h5lYIKSo9v1H84tVkLnJyozS+hIruNtAUiKH+AErw9ApYKhl1CL543JfP5eOa+ilDOWvrs9Ts4NOCFyy8919rS7v1D5c4B/CakC1jaDJZz1WOQWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345462; c=relaxed/simple;
	bh=eRTm48Ioysu1T94VrevMey3T5P5+5gSALcH8AQvkiyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nFSeggBRh/xWfX/Q263H+0B8XFoeq/fX5XGqEudm6xzmN7JVvaEJklumUBUKB1ZDqpgu6Xmvn74p58e3x++BDIT5sN2Qk4HX73ah9HCzL/pXdKUeLiCn46yIrQ7oWq1mUTrBcPmPYWgBaarIpy1aoWvNheH/YoL/kdZ2UF8GKkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=qME6bXkM; arc=fail smtp.client-ip=52.103.14.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="qME6bXkM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+Pdkw5aqb7kwqm6GqifuT2FFMfAICjiqZ7nvcO6HWmrV1HvV3zQuMoGPyp8E0ksDbtlpj4jTxaB2OLa34E6zVgTo721AwVkw7XcV/s7ymMLcOP++1LJJS68Dn/fesLcb7Mg3YXDMrWwJjTm4MgJEO7CRtagIcuktymfpYOcZ9m3bIyoH4HYBdgMq+V17OAbhperNJkXRVm1iHLe8lLZmtCG2AnlwUIlh69fppXywDQV7EP9epokIfIXN4HQFI2aL8Ngs8z+OdgeNq3GNjBYHh+jO8n7nAeShGYmF7nFMHNokjZOG6jPuLOpaND+fLytJm1csRWUSuXpPrtc/h1ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqEgl8gR2tUbHYxMJBKHCaswf5Au+7pXRvhtcOG8Ck0=;
 b=TCf8GUEZ5kmdPFBlf7H4SJextxSn2HN8BFwXejDSFAbp+stLxqw6++rlncl1zfleLZRawgEkvrydfXCt5KS882awjp8mqdbqvqdvMKs7+XlwFGZOMPRxVI2CbpStDFfKcG86aWqFdWYtUMQIfiSvbAsDnIe3N19trNPhFrV7D/CqGaLmTilisqnEtl4rsal8vwq2bcb8DgzoL9AJdApi1q49gCGpyf/cHYcmbkbj/+Qx6XhaRaOhC9+QXpB+xrb4JZaXnnzKKePqyiaPxWkSeWT+J0aQrPzU8LD4iHbQ6lr3F3ffgeAE2lbw2W8vJk85xl7gC75u11n5H6HVaadHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqEgl8gR2tUbHYxMJBKHCaswf5Au+7pXRvhtcOG8Ck0=;
 b=qME6bXkML6zWZcev3XZvfKrM4U43ynwoAjvTWlLz1Qbk+vb586QtJnJmU/WJJ/yHWQ+Z9bnWUaRfb9Qrg5aaNtXSD+0eSQXURE7KAdTiSinrSWCITkXqP3UBDXkQ9E4E0abGLNLsOiJBRVxEoGXxDuzTJ+OV9FbL1pElnS6m1V23qOZaBXZrNLYb371IQYQzshiNlB1soslBMZpQisqinI1buKPvQFyTaxA1jvI49OclOmS46btqMUGuPZ1z+et5sav1Ay+wc2+wRneJvk2qAysIrcYcNDhMeEKcqY6OXFSROPbCMJr6qCb4LKXTlfApN0y3x+DzTznwWwW2zAkoDA==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by DS3PR19MB997166.namprd19.prod.outlook.com (2603:10b6:8:346::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Sun, 18 Oct
 2026 17:44:11 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%6]) with mapi id 15.21.0522.017; Sun, 18 Oct 2026
 17:44:11 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Wayne Sun <sunweiwen@awinic.com>,
	Jimmy Zhang <zhangjianming@awinic.com>,
	Ben Yi <yijiangtao@awinic.com>,
	Xia Yun'an <imitoy@imitoy.top>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: aw88399: pass firmware name as argument
Date: Sun, 18 Oct 2026 19:43:56 +0200
Message-ID:
 <SN6PR19MB2303DB0BF41797A38EB04CBFFC992@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SN6PR19MB230399720ECFE990FF92A7BFFC992@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB230399720ECFE990FF92A7BFFC992@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1PEPF000008D7.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::42e) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261018174358.11432-2-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|DS3PR19MB997166:EE_
X-MS-Office365-Filtering-Correlation-Id: e49c0b16-1f4b-46a2-8ce5-08df2d3f6b42
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxO21SXaWT2w5/1oMLu9+HosCExLpSpAFG+5eMM+fHM9yUSY2zpctBlb5mul4klLb8ZMkDwyv2g1e9rBU8XOnrTQ2sq83ctGxCgVcTWFcBvbWCPoTccxUomgtwIwre6Yvbz3ozb6Bi21gXZJ0xn7XhO1RnHsSlEBb9aGjHJ5L23z1rFqsFlQt0RpUNfWgRs9gq0RPWq3l5hYR2FZl+ekAOpMbW3yhYDRuCuv2J627AZoIZ4/l9kZRJk/YEUlXgXuOs7b2Sv1s9+ukFcJ4yTn4M1GNCuvMOTWKLmezwFAFY/ayfwqlYO97aKnnAA2OKAqDdZ36iQfuJ0yzVYlzleRoQIZA2N2YbjraiZkVrh4adZny89GP7D5TQ4q1jMCxaAHlE2waZFmJVJDQc6J/4nd3YSOMDgzLGKlMdIw8IMtLg0h12Qw59Js0lScY6kCLx5HHkHDTzdZdmHslLqeBb0OS2w2ZCYRYOGLYoDJz6T3R9XIyxAceSp1f5LcG8OVInS//hhCTF3PgvRM3LLsRQyWKFrox600A/U6bqHMDf5jCrUvhdpdnXL+CAhhxWR2/AJaxaaV/70oaxvXJK5mNuMaLlDAN30npA6iwPNFdCShRwsuzYeAuGaQw6GO6zuSzW3+Fuhrl5TS1KOHLliYWPvkY692Mg8HsFjHcf0G/LtVPIbyxPf/f4ReJDj9/1jE49sTW3+0E4CzCqxdruzcc1cKk4v2kanxojft5nlWwdJW4tu00Q=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|260925184616899003|12121999013|8060799015|19110799012|51005399006|24021099003|25010399006|5072599009|23021999003|15080799012|41001999006|40105399003|12091999003|19061999003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?50HMSl1Uj96vnDMLqwnXpWVnTHmWHL6xITTrEmFm31S+wQsoVqdQkQOxncdn?=
 =?us-ascii?Q?JOs5Ra8NvadhFtI1/0eY+V3QBFcW+gFit8/RjVYDjZl/ij91R/Yxb2qIZ8hn?=
 =?us-ascii?Q?f72AqZr/eWUdiJ6mhF4g7NhMUHd8hfWvkz5LGupdc3+RiRptbEjo27buUpRP?=
 =?us-ascii?Q?EV/EXydFrh/udAdFZvs8epARE/akPdGqKLN/x+dCmyMkqHIDT+iIL3bM/8Ij?=
 =?us-ascii?Q?kiV3o4W4toMP0V6U20VCyPtXvQgwD4dACYF1MCNZ7ez+Sp5amvNlCcg0d2ET?=
 =?us-ascii?Q?YAH7K0rYfip3AzDRZ3Tk5pQDz71mHX+zHDPefMr4lsY3CsYXXg8SQAswQv9+?=
 =?us-ascii?Q?umuTLcbOsIW65vuqqLmPDWmAW94mxoL04/kmGbU7ZXSJgDjHHVHP9FRihwLP?=
 =?us-ascii?Q?4PSKoV8ILcVmzCsYtYphePEqsxm9KT3g8exJECNvhhxUo/+mEPa3dYuiEeU7?=
 =?us-ascii?Q?ztY1Hc51eDmwQ5uEXaJoref1GpJVtmPvqr5DKTurTJjS1JSkJekZsoEHhwO5?=
 =?us-ascii?Q?a1LibaM/EwDcPLL0qHwAmhIEWgve9M79Af5r04nI79JMvAwkZ8WVsWctUnqj?=
 =?us-ascii?Q?scSMsAclaJRl3dJhsbic7MpOegQFu+bmR0OmIy3dr80LPs+ftSUHbidV0Fdl?=
 =?us-ascii?Q?/39A58n4bqJkFU95wf4IpnD2gNj6zBp8nXeGLwkSpPugakxblJ6kUuF0aeQz?=
 =?us-ascii?Q?GtODgjXcq1tMxY3tBdnTiIJdC8tQd428W36zHlhNHRkKUxsI5JKvXKxPgMWC?=
 =?us-ascii?Q?dW/l0YLVAA/3DAtX5GO7Mj8hYrAZoJh6LMLSC0zOFh965tdw92eWBZGS9L3n?=
 =?us-ascii?Q?d53m1UZk7Oyk1UiAJ5EzkOaL72xSzTmQoYPUhbyAji5QfmgkHVo+FJg5rD6M?=
 =?us-ascii?Q?U6+498rVLCdqQ5rAKBM4DOP8PsYXB2ZwpWfOeQQfmguUteKub4NjaRkaNC8+?=
 =?us-ascii?Q?VmhULBFIa8dvGjxcNLLtBTgGULYuCHGlykThi2cxTvHTN/rZ2WweqVwSO2cr?=
 =?us-ascii?Q?EFWNJd14sfhqGpfwWpmhJMv2Ud5/yq4ZcYy6mKwGa3S9njtBsc+rKg+/xWi2?=
 =?us-ascii?Q?NvkpVk7v3CVpEI6vWUGsUQWj0+QRcQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1gLNQwRZ3mwZoaS3Pp7wEMtfom2yvpQE35uc4bkl655bAiX5N+woTgu7NDFw?=
 =?us-ascii?Q?+sKIOhqA1wr7z1UXv2VWuO+DDD0n+3+TnrcphFQCAbionLarMEqADn5dGVIY?=
 =?us-ascii?Q?T1i5TTnj83n2JX1CDiX3cKLaztQ51JEKpaJqeA+CsDsexmKoDeMZ4iaXHaEq?=
 =?us-ascii?Q?qy75Glc0iegsXOxuGpNCqFYduItCe4lDpFIhpxN/YVEMjH6M6YV9DQiKte2S?=
 =?us-ascii?Q?WPGHbUVtTx8S8OymivERcfEoUUCCpuYLkKFk7nefaC/lbrphVIP/42bAXJC5?=
 =?us-ascii?Q?A2xqRkNcoRnsrq6Ikfhk35Ai3Q2/J0qBBGcmROkyXzN0JFcXOO1nr0Of4doB?=
 =?us-ascii?Q?oKCjkEyaMZBA+FKVPWjXPvPsWiHtvcqDbOeGm9aZfhwxHTlR7rQRw6W/BkBU?=
 =?us-ascii?Q?9hMCIKD3wM2XRqRYJMXipBELp13G0AzzT2+zZg8cuqm0jVz8+9yzLoDUunS3?=
 =?us-ascii?Q?YEw2Mf5Ya+2awcGSsddZJ/wNGdpY9P7xUKvUqwyz2uG/ieXSDJiz/tPtUFb7?=
 =?us-ascii?Q?uMxQCJ9wu9/CPIJ3Qfrd7md4EkTCzES7TSuVYeFGKe9Ybv38hLbdD5KPOYVG?=
 =?us-ascii?Q?HwOIBcB94ELmV+PTGOzTI8Q4KS3yWKzxJZQsQVcWLAVeevxnUoo36L/RranR?=
 =?us-ascii?Q?3daxLFvAJvuR/qagm8v02VmQ2igJ9rH1+NafAeGzooO9ehpatb+90uZLQGDI?=
 =?us-ascii?Q?JxT62zFoFX9UnFJKfdpVrSek+tvVBxmSBFkR9KKmqEFrr93OQ8gf9tFqbj0Y?=
 =?us-ascii?Q?sWbbnmBxWDBT0UkBYQDpRwsRUDOqIXQoh01MtYMd1tT7/EyL4+ZKY7HwlyH5?=
 =?us-ascii?Q?nF013qDiCgrJXkd/vXHweBdsVgoffhwr9Fam9UWwDO0FFE3Gc9sh/DDw7dKf?=
 =?us-ascii?Q?f/gk3C6U727l527oUhip04ZJcL11TqI55blDTshVPu/bWTQqZ8s7hBZkOqNa?=
 =?us-ascii?Q?2ogXiqLDkoXlOaS3U1CZyzuSrT0XrOu0rOoUsL91lR7fdGF/FwJMVhS+pcft?=
 =?us-ascii?Q?WQZDqBiispL8SSS539hkgybHvxNsmpZvQaT4sibdVhbtFakRW90Ezq2wA7ct?=
 =?us-ascii?Q?cINYs6tls2GL9v64OehkmjTrPSP3TVIwyBu19k6ZTI+ckmCd6pIxW9U74TCb?=
 =?us-ascii?Q?W27N+UTntE6Ryi7LDV3AL3zmmAeQKf30FBYLP3QWh7sEDRMvlspsOEZpuWIh?=
 =?us-ascii?Q?DONoIsI/tUolFd9oDOBnL8Ju2ws4dh7mILlhWLQ2QkShapuN1ae2BMjJ0OLw?=
 =?us-ascii?Q?nk+ClQmGUxaxGqYBoa224bkoLWqMAGJ8eJxUjnbmVZCYoRbDX+BExDLMMmhd?=
 =?us-ascii?Q?jTJxXwyWbabfHjWwjGFcUwanLhEEuVCdLSd9dnCmxNpdm2UBRVGOAlTCmBZF?=
 =?us-ascii?Q?O5s9oMox03eH2MktaNdLTQo9UvnP?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e49c0b16-1f4b-46a2-8ce5-08df2d3f6b42
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 17:44:11.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB997166

Pass the ACF firmware filename as an argument to
aw88399_request_firmware_file() instead of hardcoding AW88399_ACF_FILE.
Both existing callers (ASoC and HDA) pass AW88399_ACF_FILE to preserve
current behavior. Also add missing newlines to the log messages of the
modified lines.

This allows the HDA side codec driver to request per-model firmware files
in the next patch.

Tested-by: Xia Yun'an <imitoy@imitoy.top>
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 include/sound/aw88399.h                    |  2 +-
 sound/hda/codecs/side-codecs/aw88399_hda.c |  2 +-
 sound/soc/codecs/aw88399-lib.c             | 10 +++++-----
 sound/soc/codecs/aw88399.c                 |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sound/aw88399.h b/include/sound/aw88399.h
index 38d9bd6abd8b..d72c491ee866 100644
--- a/include/sound/aw88399.h
+++ b/include/sound/aw88399.h
@@ -617,7 +617,7 @@ void aw88399_dev_set_channel(struct aw88399 *aw88399, int channel);
 void aw88399_hw_reset(struct aw88399 *aw88399);
 int aw88399_init(struct aw88399 *aw88399, struct i2c_client *i2c, struct regmap *regmap);
 extern const struct regmap_config aw88399_remap_config;
-int aw88399_request_firmware_file(struct aw88399 *aw88399);
+int aw88399_request_firmware_file(struct aw88399 *aw88399, const char *fw_name);
 void aw88399_start(struct aw88399 *aw88399, bool sync_start);
 void aw88399_startup_work(struct work_struct *work);
 int aw88399_stop(struct aw_device *aw_dev);
diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.c b/sound/hda/codecs/side-codecs/aw88399_hda.c
index 9c6e01c29651..78bafe3c1b64 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.c
@@ -129,7 +129,7 @@ static int aw88399_hda_init(struct aw88399_hda *aw88399)
 	if (core->aw_pa)
 		aw88399_dev_set_channel(core, aw88399->channel);
 
-	ret = aw88399_request_firmware_file(core);
+	ret = aw88399_request_firmware_file(core, AW88399_ACF_FILE);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index 75a533c9b752..b4e8aae56805 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -1284,21 +1284,21 @@ static int aw88399_dev_init(struct aw88399 *aw88399, struct aw_container *aw_cfg
 	return 0;
 }
 
-int aw88399_request_firmware_file(struct aw88399 *aw88399)
+int aw88399_request_firmware_file(struct aw88399 *aw88399, const char *fw_name)
 {
 	const struct firmware *cont __free(firmware) = NULL;
 	int ret;
 
 	aw88399->aw_pa->fw_status = AW88399_DEV_FW_FAILED;
 
-	ret = request_firmware(&cont, AW88399_ACF_FILE, aw88399->aw_pa->dev);
+	ret = request_firmware(&cont, fw_name, aw88399->aw_pa->dev);
 	if (ret) {
-		dev_err(aw88399->aw_pa->dev, "request [%s] failed!", AW88399_ACF_FILE);
+		dev_err(aw88399->aw_pa->dev, "request [%s] failed!\n", fw_name);
 		return ret;
 	}
 
 	dev_dbg(aw88399->aw_pa->dev, "loaded %s - size: %zu\n",
-			AW88399_ACF_FILE, cont ? cont->size : 0);
+			fw_name, cont ? cont->size : 0);
 
 	aw88399->aw_cfg = devm_kzalloc(aw88399->aw_pa->dev,
 			struct_size(aw88399->aw_cfg, data, cont->size), GFP_KERNEL);
@@ -1310,7 +1310,7 @@ int aw88399_request_firmware_file(struct aw88399 *aw88399)
 
 	ret = aw88395_dev_load_acf_check(aw88399->aw_pa, aw88399->aw_cfg);
 	if (ret) {
-		dev_err(aw88399->aw_pa->dev, "load [%s] failed!", AW88399_ACF_FILE);
+		dev_err(aw88399->aw_pa->dev, "load [%s] failed!\n", fw_name);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index e9dab5e7bae3..320dc1b87841 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -727,7 +727,7 @@ static int aw88399_codec_probe(struct snd_soc_component *component)
 
 	INIT_DELAYED_WORK(&aw88399->start_work, aw88399_startup_work);
 
-	ret = aw88399_request_firmware_file(aw88399);
+	ret = aw88399_request_firmware_file(aw88399, AW88399_ACF_FILE);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "%s failed\n", __func__);
 
-- 
2.56.0

