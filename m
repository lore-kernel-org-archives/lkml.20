Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19010021.outbound.protection.outlook.com [52.103.23.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A443655C2;
	Fri,  9 Oct 2026 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561505; cv=fail; b=DdETPSbiSz7OmU1pc3K9+6w6pUChMpAkSWqAGQubqo98r/JUJiWjvcKL5vr8xlCiVDGCCInFSsAis8xmPngruBQ72dnTov8IBmGuipc3Pr+UxkiLC4rBU6GP89hxMgKKwjea+xlvq1LS+fJNgJEqzO47YxDN8Hn1b+2F7kT0vo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561505; c=relaxed/simple;
	bh=fF10l5DwhTmwxeGZ8icOG/5lHsBBhbvFBnbAGOpE8jA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LfoB6kipEOtsG7l88Hn6l+ZKRRQGisLZpqmxDfqegpmXe0hJfQgRMa51aQVXXZL8To80XUgoj1seYpWzfk7K/MEbaG/qyIAXjrbi1YQLp+Ko9B8TZyx2Tw7uz40NdnBf5/w9Hr7fPW1MIiCby7oyHOrlT7aiMTaLK9/QjBXAlo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=UhZ+G/EZ; arc=fail smtp.client-ip=52.103.23.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="UhZ+G/EZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0VozLNlGXfFvFHGC5Pc1BDiMjSRilMSz+hWRNQL8RZdR02vOkJ+bj8M/UezS4eoZkRGMvj4oQrDhbFMOITPH6vCA94aQ98YMELk/8hKf5KSZhQcm3D/FVsmpf64DVpohY0ouVAmcJ/F7rbHaQNRgVY2vTKyV/zrd7QO4GucaXuXzb0QNOMgh3Qc1JOVULBURgOBy75WDHGeSLBYrBAWMve+vlmP+F7OeJLXAb/C6OBbJzhVO/wAy8qfNLCvi+Fu/6XZL6Tjwwct4G3GJ0QBaBN6WCSkXfS2O876tuVyvEjC3NekXgEhITicGa9QGwElxSIDkyBLMiWhMhpitjQGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiSgbuXglW46q8J12br05gwj1J28o8eZwpbskdT6jio=;
 b=lSUvXvDFWuD1qzGeIzDzWGF3LwaLRYJp8mYAAkhI7f+/VFMLuWd9sq48gtRwYlvKl42Gvf3VzU6+0p1QxWl70XoOHRFLXO7v9TNFazGZd8tuCKz4ujw78IavP2OOdFa/D0ZxcayLbTpyroi7LWRxoGX7yH0bq9PRVVPZHYTcplu2Jcxnuq+2CgfzqF7vBqyTlbnzjzDWh9ay7W7VgDSvDzUZd98djTNSP7/3gGIEDM9g5Bp1ZKrlrgSLTNosjlk3r8k9wagMCNL68428wBag4npFiBqA+TwIk0FBFnmX9TXprMyQBszBAG5rZ98K9+qaEQB3vh1Pt7yL0ayxQkQQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiSgbuXglW46q8J12br05gwj1J28o8eZwpbskdT6jio=;
 b=UhZ+G/EZPZxxLHiOj3M6nq5HIFl6gHD9RMEAf2bqp2fCQ/DBLTzpUF4GXCT2gfwtxsGJV2L4Jk0BZsLdSG+gzzBCSkOX85N2Iplu3agJGI+RKX1XDPLhQo2qeentAnV8sIXTsrdmc0nrDCogG7b9C/RINnTh7gJJhFd0vBbpzqaIMSikMtzE5XUFHAXR0sYsDf5RI67FMKqBM9UQN0/ijYIvrOEz1Zm4O8lAg7sAcxzy+bSdPwS/o5YDvUsEaYX/hAQVcpS7pGyyBFybXgK6A/AkPak3AwBWlIsxN+EUaj2h76TwGBQI1f7OpDm84u/dv7isAPZi8V7qVXghJMXoEA==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by LV3PR19MB8777.namprd19.prod.outlook.com (2603:10b6:408:285::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 15:58:21 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 15:58:21 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Giunta <marco_giunta@outlook.it>
Subject: [PATCH] ALSA: hda/realtek: enable AW88399 on Lenovo Legion R9000P AFR10
Date: Fri,  9 Oct 2026 17:58:10 +0200
Message-ID:
 <SN6PR19MB2303D726352EEE508A70D6D4FC922@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0131.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::10) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261009155810.45279-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|LV3PR19MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: a415b427-a0c9-440b-9c29-08df261e2440
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|12121999013|19110799012|8060799015|15080799012|25010399006|5062599005|51005399006|260925184616899003|5072599009|23021999003|40105399003|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jLHfH+YTnyl2F8AdfKc0artIhOZJW5haS/PiCPTK1J47ZDTbPjcPgcny3zjO?=
 =?us-ascii?Q?RXrM02bQhYLymYoOOtAwehnGFiQzbOKGVkbuwIF3uitEyBkIlMHy5mH5Mt4/?=
 =?us-ascii?Q?yRVXkHF5LlhztwPHZGH8lEaW6j8ReUCB3I48U6d6zSJ2CBin6bTi37JxJXa7?=
 =?us-ascii?Q?lMlivuOvhZhJl1xsGwM+ao9WV3o0E6r2x2J60oj0eCw6/Ubr3yyvAOT02wxd?=
 =?us-ascii?Q?jRD3heyXbqQo7gGiVLbFaWo48TVoVdbk7c4+Rp+9hpolCtw/4yPMKc0PfgS7?=
 =?us-ascii?Q?JOxLwKXYEzeGN6/VtffTFl3cU9N/XrC34C6QpLR9DGdbPy0nimgWBuGn9OtH?=
 =?us-ascii?Q?m2UWQ0J8F6HEy4FPSBxvHoe9QUNr8oTSo6egV2nUfmxb5ABbUEtCSOv/Qvc7?=
 =?us-ascii?Q?sQWAaxSlC3bwmKQ2L6PuFZuhzZ59SSyzzSsPDENohr7yUYfEq7chWN1E/qwL?=
 =?us-ascii?Q?YrJV4x/6Dm5yMiIpMrfM8HKmteY0/xdbVKmcX2zZ6REyNT1qjMt6vIDu/iB8?=
 =?us-ascii?Q?3pgk5f+n2BVvw11ojfUq9tDwn5MUkxWTsQ5+b3VqrV/GcSxHPmjPWzeNzjO2?=
 =?us-ascii?Q?+Uv0GCIgcBxTWABnkQVCHp7BTOQN2WmRcVHwANKs03OB4SEhdXZO4+93+QDa?=
 =?us-ascii?Q?udT7H7cFUQ6ZuzgcWDGkRyGuHcJqx8EBJdR0TrefvLyD20o7taTUof6mCdJu?=
 =?us-ascii?Q?8ICTW+lpUdTXnUubimui3+zOdyYZ7Khkc5v3F88Lmg4mkwNKcoDjpDeJBJDN?=
 =?us-ascii?Q?77ybF7/mkPikCSq2v7vxPQFWxgj/T3NN9Osl62ngSYXHmyR3Zuy3OwLhwgVv?=
 =?us-ascii?Q?UvoeA8SAQatROdDGiM6OE8gYubteCPWx1/creJbJ57kbCc0t4Yhkx29kPAdU?=
 =?us-ascii?Q?3QHxGUrcJYopTEMq1DwB46ZNmumWixDQLFZCsrwSzCB0xuDonbph9EPr9JbT?=
 =?us-ascii?Q?Nivz4AqlSYRyqE54CcX0ktx93hQ3jvBZurnBav1BsbbidgHcUybdvmWqg4if?=
 =?us-ascii?Q?k0bHtdXfBlEg1Jupinoi4+kgtg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g2MkA20BKSPIEeIZvObONQiJeyiHhSelb/snNQoQSCxd6B7/04dxzO0G3tjG?=
 =?us-ascii?Q?FC+69t6WKcg6jrRZsjxaS2iyxKC2YICuknoPDAf7eg46sbtO9TSoKjLU5nYZ?=
 =?us-ascii?Q?EVOS9/uSfmS6yS7wGe0lefWI9p/x0MgN3xwb2WF8L8O0hXWLGAEc+kPRGctb?=
 =?us-ascii?Q?4aL0DcIqXrrKBRLAhNEtMMwzevpNKLi9JXriG1dDu8mZAnoKgoFbAIh/r6Dr?=
 =?us-ascii?Q?QFqtxLR47zGIlwagHoA//1SU9nA90uD33yEnt/9lA2PO49/l1wV77pmcTocs?=
 =?us-ascii?Q?Rzft1+/y57doV7lhDyfVaX8uomrHaR64X8gXN5iBjqgWnIquQ9dytKsm3XgZ?=
 =?us-ascii?Q?wXXXYOMxCDpr77qV741W6lub9Ru8Lpahdwzir4MjewqA6zhRpfiZ2f1PKSa2?=
 =?us-ascii?Q?yLr5+VQwXYIM7R5gPD+nWxUztEQp7738RvUYUl9qsbmyZx3Xfah1f54bq8HH?=
 =?us-ascii?Q?ocNzJwWmod4RyQ5XGTUGgnBGohIXHw5D4ht1HTLwbX2+tL+RZn4x+4Wwx5O5?=
 =?us-ascii?Q?0q5rZvtzkrIa9hNIvmOUzBNZ6nPMU8HR3fndqZlP/uHFtD44w0ns/2mhsti8?=
 =?us-ascii?Q?G2/4+omPKJqUnCG39uVsY8DqNST0szx7F/0s2njoU9UKTKCP4zahJFfI4KBi?=
 =?us-ascii?Q?9t+tSAPRfRNoJhy/M1vtMXDkCYQzE07MCo1wqGmip1CtyOmfSsmHTJsV3oL9?=
 =?us-ascii?Q?29hwyAm/r9LEuq0k4F4iwdJzvt9SABNAwqlTGgveeR248JZy0y1UI+RunlZO?=
 =?us-ascii?Q?JuJmmVxkRBpXRIlj0K+l759NtDWgG1FNrKZ8VN7rwH7LKpcGTwizjtxRCjfC?=
 =?us-ascii?Q?Y/brY82f4escCM9khdTzA0mkh7y+x8vXTjMjffWWf0ajHrlvHTBQg3PLvsOe?=
 =?us-ascii?Q?9vkmCQKHJYt4BvzCf5RfmQawqx7K6EDr0KodOd4zw0WxDzeomQ//TEFjQtql?=
 =?us-ascii?Q?KiCKISVp6QLX/E2NE9EKWZ8EIuKaZSFUzcGA4SBUcJA66hbq1JqbK5VkJzy7?=
 =?us-ascii?Q?448BCkcZwLe8K0dkCvbvXT6dkXD8ypxz7S3DlBRbWEwnmg0Dx0ON1x+jG4OT?=
 =?us-ascii?Q?6a7gbXZ4StZgc078VJPLLqaQQ04dlxNt0NN8AUVbvMzgod7eZSPiZro21ac7?=
 =?us-ascii?Q?D1TmCJ0AeAal1v66LbGd1oYkMxTGtBCcviFh1WIxahRgeJxqU3IB0uXAn4Xp?=
 =?us-ascii?Q?qVVK6WRPQOgXVPSC4iEttIg4kwnSXS1tUFDaw1IJjFRJfV0M9VVqPKj4xUiS?=
 =?us-ascii?Q?UrAUx++1eR6zgJG1GTQDnnjqILVnU4m4pr3D9tOTrtR7bptvcjCGm+kg6KiB?=
 =?us-ascii?Q?jEaSzwQoUu4k2VJZpv7FKYUrFn0jXJUWMaYo4xElyuXrtJiSXl5NqCvTsZgo?=
 =?us-ascii?Q?osbRSlmkKauN4Ts6DdQyIiNNuEnd?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a415b427-a0c9-440b-9c29-08df261e2440
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 15:58:21.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8777

Add codec SSID entries for the Lenovo Legion R9000P AFR10 (83F6),
which uses the same ALC287 + AW88399 smart amplifier configuration
as the existing supported Legion models.

DSDT inspection confirms identical AWDZ8399 ACPI device layout
with reversed I2C addresses. The channel swap quirk applies.

Codec SSIDs (Lenovo vendor ID 0x17aa):

* 0x3934: Legion R9000P AFR10 (AMD)
* 0x3935: Legion R9000P AFR10 (AMD)

Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
Note: this patch depends on the following commits, which are currently in
linux-next but not yet in tiwai/sound:

* commit 664824782df6 ("ASoC: aw88399: skip BSTS check when boost
  converter is bypassed")
* commit c5f615536405 ("ASoC: aw88399: remove bsts_unreliable
  workaround")
* commit 7df0f9ee9c5a ("ALSA: hda: aw88399: Switch to use
  acpi_bus_get_primary_device()")
  
The first two change the property table in aw88399_hda.c, simplifying
aw88399_apply_legion_quirks() to just aw88399_swap_channels(); the third
shifts by one the line count in aw88399_hda_acpi_probe().
Without these commits, this patch will not apply cleanly. Hence, for
simplicity, I based it on linux-next. I am happy to rebase on tiwai/sound
if preferred (after these changes are merged).

Best regards,
Marco

 sound/hda/codecs/realtek/alc269.c          | 2 ++
 sound/hda/codecs/side-codecs/aw88399_hda.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index fde109cf9163..3f3491ce7c5b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8483,6 +8483,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x17aa, 0x3929, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x392b, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	HDA_CODEC_QUIRK(0x17aa, 0x3934, "Legion R9000P AFR10", ALC287_FIXUP_LENOVO_LEGION_AW88399),
+	HDA_CODEC_QUIRK(0x17aa, 0x3935, "Legion R9000P AFR10", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	HDA_CODEC_QUIRK(0x17aa, 0x3936, "Legion R9000P ADR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	HDA_CODEC_QUIRK(0x17aa, 0x3937, "Legion R9000P ADR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	HDA_CODEC_QUIRK(0x17aa, 0x3938, "Legion Pro 7 16AFR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
diff --git a/sound/hda/codecs/side-codecs/aw88399_hda.c b/sound/hda/codecs/side-codecs/aw88399_hda.c
index 9c6e01c29651..9ada8dfd51ce 100644
--- a/sound/hda/codecs/side-codecs/aw88399_hda.c
+++ b/sound/hda/codecs/side-codecs/aw88399_hda.c
@@ -164,6 +164,8 @@ static const struct aw88399_prop_model aw88399_prop_model_table[] = {
 	{ "17AA3907", aw88399_swap_channels },
 	{ "17AA3927", aw88399_swap_channels },
 	{ "17AA3928", aw88399_swap_channels },
+	{ "17AA3934", aw88399_swap_channels },
+	{ "17AA3935", aw88399_swap_channels },
 	{ "17AA3936", aw88399_swap_channels },
 	{ "17AA3937", aw88399_swap_channels },
 	{ "17AA3938", aw88399_swap_channels },

base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.56.0

