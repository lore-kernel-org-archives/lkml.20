Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010006.outbound.protection.outlook.com [52.103.20.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFA6439F83;
	Sat, 26 Sep 2026 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790425583; cv=fail; b=ktYexAeqMxA3Wyllkpzywkb5tj1rMRP8OJ40Wfrr4oVe3pyJvY3nErTq0+33ZR0f4CRPURArmJj2basF4zg4dkFw5HdyWQgfaiUS8ueSpgnijlpXoRv/BNsSqTf/UeinDCFZLB4HQ7+NOhXHqdR5Btai6qchVJX9USZzPdwi00o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790425583; c=relaxed/simple;
	bh=05viHTut1JNsCjLkx06Z6e4ctMWWoRYG1cYvxU0nEgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UVEYPUoi9iG5V3TeNpgl2+I2JTOmE3gi2yKztl1wqrvl4CInHPbe+LjbCOcnF/rhWFCL8vmAK/BtgpesQ4KHe1c60Fg6qdwvxpkmckR3WdEEsyPeBPGtP25E1kgLrpADCJOjnm1af9u/2VYqEuhazvxpFusNEoLdhUmgXPJBpY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=VRJbkDRE; arc=fail smtp.client-ip=52.103.20.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="VRJbkDRE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5hY3Zb0oylFA8LHlqhGT3/YSqrk95HbM7zVkeHEa8sdmbNmhlKXAa0570GyP1jtlPIigbMY8Ya6ru8F+G3lsokko/zfzZDCcRz3DbhXAJhRXcHjyhKHDH320KTdKT14FktulO3uCZD87t2fxI6+H15/Co+ghLhV5u1yKjAVnp1VNH1MNteSAcE7GXDhNxDi5OxcLBuJ4SSExAu3oC2dumV0w8VGBCOeh8vYK42IaoZj4bfeS2/DG2agROIASpWkBMG/UPdVpU5cVGrM3qbDjZp6/5DOcgTm1OCqGVyfl5M59LelSHIGW8KSl3DgM4ONitDsBn32cIBSI4IpZx8zqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EoPO6DArVar1Ew8GfY87cW+RW4s31b1cUcjI6uq+8s=;
 b=BxrLE98JSottLAYaQuTp6/eLd12Wmga0XqcCPTgUG3U9U3lX78feS/KeJx6vV/i17KrPXtZ5nfm5k2CoIn+8nSTnuJDngfGpYOUYru8Vgq+TCvSBUV8O0/h00nzgNNeXmau65NqUCpUG14l7cM72H/hVfpL/tRgEIcsOYZRMuchEG6akxwaEslhTgyzu9CthQCzGwT6q+ZKIqnrMsByVEfFWcvjuWuqAok/+jkpdY05CcS0PaX40V1AN1VXEO/WJ0En5SEBZtok+boF/xDfHX7ZkgcQ5yKkoTcYVTDBn/zGFi+UW1PLuWn6/zre5WwgPQnpvlljg+SMxRU8m42cf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EoPO6DArVar1Ew8GfY87cW+RW4s31b1cUcjI6uq+8s=;
 b=VRJbkDREMTnfG2XEH4c0SFaD1Hcyhm0vOh2nyIsWXVRm4Bn6vMO0zR3GiWzO7yM4oTkTyLXXM3rqtpcGg5Y5YtX9nDXIJxEaSxQuvfNJc4hfJGmawo3Wi0AidGPx0oT5Rmf2MDJDFx62Njn7KwSSVjWz928L19aNRhLy8WMVJDc2sOr4F5a5dCsTuRUARKg6fPbDHMp1MtGhmRciGSvec+OJx4/vjfQ/IdcUqdENtb0SyA2ijt5fiPx/MJBNE3rxuvUx/70K5GaBDfAg+iERzmSev4WCHIVgKbByOtwtCTcQ0aahbFpqytFQXXnNNyekeH+oS6EQIqA/6dCOgtao3Q==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by PH9PR19MB278024.namprd19.prod.outlook.com (2603:10b6:510:3ed::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 12:26:19 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 12:26:19 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH 2/2] ASoC: aw88399: remove bsts_unreliable workaround
Date: Sat, 26 Sep 2026 14:25:59 +0200
Message-ID:
 <SN6PR19MB2303CC64AF7DEC3C5C98A512FC8F2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <SN6PR19MB230304C2E75499FE23B53885FC8F2@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB230304C2E75499FE23B53885FC8F2@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B79.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::40d) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260926122559.8062-3-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|PH9PR19MB278024:EE_
X-MS-Office365-Filtering-Correlation-Id: f35f15f7-42c6-4910-7db6-08df1bc95e28
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaDCPNyN8s5H2lPGskYOewpRASOkLBCXVCvXvsx/3PfVBzo4qo+b8Y1ef4C5y8LHi3Y5qeCvU3bzl6wpBiuvL1p/s02zb0VZhcRtjac7N2Vqj272yf7A45QRmCNnTqdCBNigYkpBWcwphRWv/poCGbNHLCWQ1QnZFYyMh6iuwb6LtoiSiIj4xR2C1vH7lreKUWdBrK74N+dSKEqoZsBxTjfNbaGcu8MfSXU/PoTn63je+f7YzNnDVwuUSpY5513HMRzVSifv2K3hAesOBvXAiV/Qqu9gTz9/f65EJGVg87iLfWJ8cjmjb6qywicwx2YbptP4S8XQlX0wm5/0rvAQPxUYr9modkLLXlzF/NC+udveHdYgc4Vn97VjTd0VWtUMqzGtzosAL/mkfEOOP9YgH+V00blpeW0muohNQdtiot1VP6g8BNLOH1ya0A1ekINJMzTuM4QfdQ09tmRkp5Lz3ea6biet24VTnRxyvKo+3lkjNqy+6BmDMMP2SIKmyu976xStbB3AHWUiief42Hu3Ku+rP4tOAKofZL9egXBARQMcNySCmmLU3QaibIoIA1nWDQKqMfghGjspb7dFeGrMquHUCE8RVv7CZSdMbnViFWTJEGRsSRRdzd5dbmRJHHh96hL4bIutTWYOyuPOWs4cQj62UvpCCPsKQPzRl4NUpTyZ1AeuGEtHQyiLDe2nYLPitOupFvEOgxGvgKjFr07TebI5wzvVmriV/sCRhx1lcLMsMzvnaQvLMzm6nzUgjvHbor
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|12121999013|260925184616899003|41001999006|5072599009|23021999003|25010399006|15080799012|55001999006|51005399006|8060799015|19110799012|40105399003|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q3Lq1uAYfoZHGObMznpetowqmnOgOiP3Tu4F4KZthy6L8M4RgnCRmRUf9iPM?=
 =?us-ascii?Q?tMFqJv8pWhq6sEFupHZGid3L8zUmJwx/+91OpPXBWwqBurYy8E8Wh+FC1bl1?=
 =?us-ascii?Q?9vhhoEpyoxZitGRX68Uwq/BeaaFc6VcyQURNAmmhoQgkTMfhNsIaUv5ErMR5?=
 =?us-ascii?Q?ZhHYypkzl3b9tzzb3YnXznxVeNdMV8DXKko/IPe0e82HqZm06zoN14W6qAUJ?=
 =?us-ascii?Q?yPSYl7ECCYM1NMD4MXja2Q/Tbr8ByPboc740TnIkSJMOtJc6q7P1EpRP5bbu?=
 =?us-ascii?Q?bSrfMjEqRfQkxvN4DaNMoIAImFyBxl4zPYbAen1b42LDwSlDMYvJSoiZiGEA?=
 =?us-ascii?Q?tp22aLhVDVMDjRFyqKefvya0ArmjZ7fWPiTLtS4np5XPFPj1kM3CVHvC9keK?=
 =?us-ascii?Q?hwsBclo1q3Jo9muoF7Js/J9la/mFA2ex4VBPmJNRYjdY2NFfrSOUSlUe6dgn?=
 =?us-ascii?Q?MXdZSnIHWOgqkOH7epdTJKHs61Q62M3dJpcAM3zXqnAleyCjV63T5CJ3ZE1j?=
 =?us-ascii?Q?lsQTwB/Qs3UnmCTU7f+m4S1uZkQ0RwQ0OUX9K+ooZ8VRaoDIo1piq/mAIpyh?=
 =?us-ascii?Q?VML4WTaAkYj1dXAMw7al6tZgEcCD4Z6H4Xj0cQntleVTH8BKIWic1V0zQl5W?=
 =?us-ascii?Q?2qjSXVlfiuAuchAwtxPq6w03CXvjpYSd+kJ+1QuAnqbjy5dvgC5L6gP/uaqu?=
 =?us-ascii?Q?4NUL/PCNzTRH97I/iunFY50EQresqX/yN4GWkd77t7GZeKBWJXjbu/SF6gz6?=
 =?us-ascii?Q?lPxgi2H/uDT3EE91x5oXTtYkf+MDCFQh8G4lRp4P3qTQl+E+9FVlQ/IHo+YQ?=
 =?us-ascii?Q?uYvb31GatlmhLxIXUVReJrkdQlA4nrzG1YdMLF5pRdPUonApvJPtP7yYLYJC?=
 =?us-ascii?Q?t68QRG9LH9V4ZMHXTtGknU8olmy5rpR4adDzq3Qj+ncNYMCy/ZK1ORbB/fEV?=
 =?us-ascii?Q?3ukpYOBR8Q0p104FTu+CotAN1V64mVOrUex1C5HuP7kSAuVjzWFr9m02CCf0?=
 =?us-ascii?Q?+OyQ06U1+Oh0ZoTbbvDINXkTZVZGmls/qc5lnQGH3NlSh0pxzzgIt0ocIruM?=
 =?us-ascii?Q?7BfTe/Yt?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KXSzNJ1s82fAdBan1dUuooJFCXP6MrsyDHyO5kfd6gCb24reN+v3mmxz0XU1?=
 =?us-ascii?Q?yVYNzu8XCw3Ea6PgfPhwWFxunMHuTP0nRxhzaoR6v9kwh+wobpiuVJfmxvui?=
 =?us-ascii?Q?tzxUOKjJX6w3nDM18nnAoG5aoVFDfAKSwC66x0gKMsOJH76pOHzcP/DBg5tT?=
 =?us-ascii?Q?tH2nP2OT1EmwJlQ2+Bh+Uq419++Odfy1eHg2fj96f8WmC50YqeQigQ9wKrnP?=
 =?us-ascii?Q?3T9cdzBt8rxPHY3Mr9NlE1Vul8Sv7ZcDYIlY4zrKe2nGicuJCoKGm7Z3+cd7?=
 =?us-ascii?Q?JLsJ/8PszKw+7N0kzxWdLFKXz+4Rv/6qWcEZoQtlCOH5hktsUNc9O1gGKUpM?=
 =?us-ascii?Q?do8nRXVX2Ns5T+e40sHKtd+7H0SdUzI41V9dwPsLVxcRCH1KFnyayvTX/Qnl?=
 =?us-ascii?Q?boVye6gbJ1t5l/I/IZi02m2efInHf8t5hclDO+xyUyr8UQzUx/7nVtR4W67o?=
 =?us-ascii?Q?aSmqsQor6TAb/NJKVU9ClPYTi2Tp6gks96VlTmYh3ZMs9+UAuFPKe7ElnVgx?=
 =?us-ascii?Q?J6bfqmlVx3r6sg6yRMoCLS+giWK+o5q0Xoq3owpPfFevxnVUrCG3cK6PwFU8?=
 =?us-ascii?Q?i/Y3U0S2Lh4u7G7Uov90vdLJWhxnSY9IJEYLt7G+O1b4TYGBK/vhnZ1jEmAl?=
 =?us-ascii?Q?Y/ePSxKBYb9Nb5Gv3fdneJsoaJD6f6SFI3rV9BaCEg/FhZ4vA1Rv0FQfBRIt?=
 =?us-ascii?Q?KWlUlFXY9eKc36mMBFNji11RwE05N3KMsXcHwnQazjL2IEztxX75qhMZRBCF?=
 =?us-ascii?Q?Ce4dAhu+8sjc/3Roz242mCIGDniY9IYNK3s9nHn7hHk2qChrJqi0rDEizS3E?=
 =?us-ascii?Q?ti/7HVXovqJRWFr4KP4au4pA2k1Xl9pzTB3NVzHUO3pHsn3AV1KDzBLQJawG?=
 =?us-ascii?Q?Udi7tMmcW1JWDFfysGWs+vwaobIis8mrK0qdrxpJyAej01RGQZIcysRc3XQE?=
 =?us-ascii?Q?3gYnQLw/LYMM6IoKV5m5OZ0r8HZ2KLN3BFEa0xqT26VPJUZSodWsgfLy6FSL?=
 =?us-ascii?Q?5GxYvwEzpVNDBP1Sa+T8IfeDLWd/HSGOX7+gbOvJNj4iZPGqfK3e6RQZ4ap2?=
 =?us-ascii?Q?EsZ29C/e5w4pN70tq4ymhfwUazNW29HHz6/LWkwo4rx+J18PICieVYQzSyqU?=
 =?us-ascii?Q?4nbpGm/hhCbXvkJFj4MMEzoaaXGX/y/bZTVDxwxVNWpxZCBd4wMYsLjoYzYO?=
 =?us-ascii?Q?8EhSLQhhYahxHhqqIdN16LxEKDXvq2RezFgJIdt0mRzoMG89/OnO3/zMMmhW?=
 =?us-ascii?Q?NcEKVGRLKHxU5rXqgKpxHSA5CEL3KVjQXX5MIKU5g+MVKhNAcSPZNr2D5MEO?=
 =?us-ascii?Q?LHHrvqQoLfTyXhA6PAz0qBz2znBVpvVRvQqoPTS7B73enJjlNQ9CBEp6/jqV?=
 =?us-ascii?Q?yg72qGsD39+wpv4XWH3Iwz02Dqct?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f35f15f7-42c6-4910-7db6-08df1bc95e28
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 12:26:19.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR19MB278024

Now that the shared library correctly skips the BSTS check when the boost
converter is bypassed, the per-instance bsts_unreliable flag added as a
workaround in the HDA side codec driver is unnecessary.
Remove it from the library, the HDA driver, and the shared header.

This also simplifies testing the HDA side codec driver on new devices,
as new models no longer need a quirk entry to bypass the BSTS check.
Users can test via the model= module parameter in alc269 without a custom
kernel.

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 include/sound/aw88399.h                    |  1 -
 sound/hda/codecs/side-codecs/aw88399_hda.c | 38 +++++-----------------
 sound/hda/codecs/side-codecs/aw88399_hda.h |  1 -
 sound/soc/codecs/aw88399-lib.c             | 13 ++------
 4 files changed, 10 insertions(+), 43 deletions(-)

diff --git a/include/sound/aw88399.h b/include/sound/aw88399.h
index 974b5774ac2b..38d9bd6abd8b 100644
--- a/include/sound/aw88399.h
+++ b/include/sound/aw88399.h
@@ -603,7 +603,6 @@ struct aw88399 {
 	unsigned int crc_init_val;
 	unsigned int vcalb_init_val;
 	unsigned int dither_st;
-	bool bsts_unreliable;
 	bool fw_needs_reload;
 };
 
diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.c b/sound/hda/codecs/side-codecs/aw88399_hda.c
index 11cef4923024..69d113af8ae3 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.c
@@ -118,7 +118,6 @@ static int aw88399_hda_init(struct aw88399_hda *aw88399)
 	mutex_init(&core->lock);
 	core->reset_gpio = aw88399->reset_gpio;
 	core->regmap = aw88399->regmap;
-	core->bsts_unreliable = aw88399->bsts_unreliable;
 
 	aw88399_hw_reset(core);
 
@@ -155,41 +154,20 @@ static int aw88399_swap_channels(struct aw88399_hda *aw88399)
 	return 0;
 }
 
-static int aw88399_skip_bsts_check(struct aw88399_hda *aw88399)
-{
-	/*
-	 * BSTS (boost-finished) status bit does not reliably report on
-	 * some hardware. On certain Lenovo Legion laptops, both amps
-	 * report BSTS=0 (boost not finished) during normal playback
-	 * despite clean audio output. Skip BSTS in the startup status
-	 * check to avoid false init failures.
-	 */
-	aw88399->bsts_unreliable = true;
-	dev_dbg(aw88399->dev, "BSTS status check disabled\n");
-	return 0;
-}
-
-static int aw88399_apply_legion_quirks(struct aw88399_hda *aw88399)
-{
-	aw88399_swap_channels(aw88399);
-	aw88399_skip_bsts_check(aw88399);
-	return 0;
-}
-
 struct aw88399_prop_model {
 	const char *ssid;
 	int (*apply_prop)(struct aw88399_hda *aw88399);
 };
 
 static const struct aw88399_prop_model aw88399_prop_model_table[] = {
-	{ "17AA3906", aw88399_apply_legion_quirks },
-	{ "17AA3907", aw88399_apply_legion_quirks },
-	{ "17AA3927", aw88399_apply_legion_quirks },
-	{ "17AA3928", aw88399_apply_legion_quirks },
-	{ "17AA3936", aw88399_apply_legion_quirks },
-	{ "17AA3937", aw88399_apply_legion_quirks },
-	{ "17AA3938", aw88399_apply_legion_quirks },
-	{ "17AA3939", aw88399_apply_legion_quirks },
+	{ "17AA3906", aw88399_swap_channels },
+	{ "17AA3907", aw88399_swap_channels },
+	{ "17AA3927", aw88399_swap_channels },
+	{ "17AA3928", aw88399_swap_channels },
+	{ "17AA3936", aw88399_swap_channels },
+	{ "17AA3937", aw88399_swap_channels },
+	{ "17AA3938", aw88399_swap_channels },
+	{ "17AA3939", aw88399_swap_channels },
 	{ }
 };
 
diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.h b/sound/hda/codecs/side-codecs/aw88399_hda.h
index ca0aa5279298..af71083124bd 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.h
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.h
@@ -19,7 +19,6 @@ struct aw88399_hda {
 	struct gpio_desc *reset_gpio;
 	struct aw_device *aw_dev;
 	struct aw88399 *core;
-	bool bsts_unreliable;
 
 	const char *acpi_subsystem_id;
 	int index;
diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index 1ba0147cf4df..75a533c9b752 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -167,9 +167,8 @@ int aw_dev_check_syspll(struct aw_device *aw_dev)
 }
 EXPORT_SYMBOL_GPL(aw_dev_check_syspll);
 
-static int aw_dev_check_sysst(struct aw88399 *aw88399)
+static int aw_dev_check_sysst(struct aw_device *aw_dev)
 {
-	struct aw_device *aw_dev = aw88399->aw_pa;
 	unsigned int check_val;
 	unsigned int reg_val;
 	int ret, i;
@@ -196,14 +195,6 @@ static int aw_dev_check_sysst(struct aw88399 *aw88399)
 	if (reg_val & (~AW88399_EPS_EN_MASK))
 		check_val &= ~AW88399_BSTS_FINISHED_VALUE;
 
-	/*
-	 * On some hardware the BSTS (boost-finished) status bit does not
-	 * reliably assert even when audio output is working normally.
-	 * Allow per-instance bypass when flagged by the side-codec driver.
-	 */
-	if (aw88399->bsts_unreliable)
-		check_val &= ~AW88399_BSTS_FINISHED_VALUE;
-
 	for (i = 0; i < AW88399_DEV_SYSST_CHECK_MAX; i++) {
 		ret = regmap_read(aw_dev->regmap, AW88399_SYSST_REG, &reg_val);
 		if (ret)
@@ -732,7 +723,7 @@ static int aw88399_dev_start(struct aw88399 *aw88399)
 	usleep_range(AW88399_1000_US, AW88399_1000_US + 50);
 
 	/* check i2s status */
-	ret = aw_dev_check_sysst(aw88399);
+	ret = aw_dev_check_sysst(aw_dev);
 	if (ret) {
 		dev_err(aw_dev->dev, "sysst check failed");
 		goto sysst_check_fail;
-- 
2.55.0

