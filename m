Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011030.outbound.protection.outlook.com [52.103.33.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258284B203D;
	Tue, 15 Sep 2026 15:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487984; cv=fail; b=pAoLu/VNvWJZaA3Qp2ZD3KNptEeaJrKIXxWiQB6YdnvNIqlUPj4Bblgvl7esAJm7de23gHLO5XuVtjY+J32dfBhuDwS5cnbNcwM+MVUWemD6WoA7CoPxA5CETLqZjXtzYI0NEI61Mu9+cOdmsDt3DhYwqFJ+t/Ex9EzJrHXhrvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487984; c=relaxed/simple;
	bh=HKWINajdQwRN8p9zXR6D9p9eWErnx/MzGwjXpFgg934=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QQzuU+0BsPGdXZY5BkNE9OKIcJ6wPkIAsp7LQ3z1tgW/ayqr4iY092EV/W7K2BOgvH0nHnhCMJTvdSaPOoVZtzBC39WR3Op3GrZQJRfdhmtD9eVam/+wiW4aMMvOGHgcAafyHA2ILh8GZj9715VK41huGUO/vzSeGnwxY9U4m3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=ec9A4LXm; arc=fail smtp.client-ip=52.103.33.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="ec9A4LXm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJo1S3HJ8K+zcsicR2JTLzy8hY6xM7V2Vwew65BLg6HEzYjdRVqnQU0s7C7VSkbdzqw+1xMde3ppFZX+JwyHqPGx39u6VDp2acuj/Zi0IQMGbEZZrqVm0JqKo9o6iBl4e4zNycLUWdEIjb3Xv+YdwmXN3IxSrXKpJdR9MrJd1HTSN2b9SrLRblm/IXnzCO6N9h+OtCyNBSZB4uc3KG9k5HcAoggVrlaBpalgqDbrKpOuVOLaNHrvHe4eOaL7lekSWnxW9yFgSacXgnOIykl37UejBmcJNID3A8uszHl3Kzd+zVWm34WnJ/K+7W0IN/xPkcAQNXZ2LpgVCxRK7nupIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EA2HQ9XgNMTywE/BiYPUz1JgTu5WbedsXSa3MwUSBQ=;
 b=qdA1jRuLi7fN8+1uzjhOu37EBj33iWRwXtGktglEBJIJS+RlkhqjOAGuRjLs8bMje1v0TTkf06N6Mczxt9DrsuasEwUQtN48MCXLfBxdLeUuuBPs1tKFN22Kxc6Aw+cvIcOxLndLkVMFAAjQHbkhXV+8jMIH+X/ZEtRzBQSzW0auDG+zSsLU785XacdwslEWA6Aj2bquK9UdrTzgjdL57JWO2o+OXw0sGUIs3la4DTdAzrx8P0cqY29M/QwdMgApBhJ86R/ph5kdWX8QveRrT1ZwX1HZYf174NKH/v5E4EvHkEmlbxuvBcDH+ignksTuJ0E/SmKCxgOxJHyUTU+CRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EA2HQ9XgNMTywE/BiYPUz1JgTu5WbedsXSa3MwUSBQ=;
 b=ec9A4LXmCSwq03GQT6y9hWV8yYCvV/xENrP6gImGneXvm/vRK4D01S3JYE79GyLGNjMlB+C78vf3Mfj2iA7yy3H0UM8nJIjot1t8Z5iFABgeZh5KxReuz15ay1ydJh+B29DJbIZMbPgtVKPIx/RopVKrnJHS4cKQWn0qJbOM63qFM7kuMg5OJ7HKxJpWZtx/YJU6ugGRzwccgSuYPLUJVES9nONJpH6XimKr7opKHz6vG1FNIi7R3vxiPeLn/EYKxx9qywrYjp6jewV8JLer3yeeuHniwPBjuwtMU8VmawZbsRqKgVd53f7gHZhwNNhtQ64uHxIVFryIgeVucYLOBA==
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6b0::11)
 by GV2P191MB2334.EURP191.PROD.OUTLOOK.COM (2603:10a6:150:d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:59:25 +0000
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883]) by AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:59:25 +0000
From: =?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
Subject: [RFC PATCH 6/8] ALSA: core: add KUnit coverage for the card names
Date: Tue, 15 Sep 2026 17:59:06 +0200
Message-ID:
 <AMBP191MB28869A2386171A55DC8AEAACCEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
References: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <20260915155913.421839-7-otzelot2021@outlook.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|GV2P191MB2334:EE_
X-MS-Office365-Filtering-Correlation-Id: e74d8f39-3692-4407-8096-08df13425012
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|55001999006|41001999006|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|25031999004|22091999003|24121999003|40105399003|26121999007|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmFHd1lCS05FNGkycXVpNmVnZTkwQUJJNlBORWNUMktPOURKb281VkxsenR3?=
 =?utf-8?B?RlpYQk5RenlGdWxSc3V3Z012OTBEVmJ1SkdMTGtmYU81Yjh3VDBKNUlpOVF4?=
 =?utf-8?B?L1JSV1ZpYk1uRVNZY1JXVThralFpYTl2NHk0S3NpOEt1TSs0NW4xOTVDd2x5?=
 =?utf-8?B?ZTB2TTBTdTUzV2xDeUROMFM3VUhLbVBVSHdXNEdyWnJwZXpUc244WEpObmJW?=
 =?utf-8?B?Y2pBOENlTmU4Um1PbkdKUXZ2UThzdFpjbVlwZkMzRVhPbThuTDFJSWEyNmFo?=
 =?utf-8?B?ZmtSUjJ6QWM0OEpybVFBZWQxREJuOFYxSzhwWjl1YWxabmtNSTVTUml2VS9S?=
 =?utf-8?B?NGMvSWtOSEVKNUhHMUI1eUN0MHVZd1hwVGxXQ1VFZWNJTWR3c1plcjRERGtM?=
 =?utf-8?B?VHlyNkpSbjFkMUNLdUtXZDlTRlNZeXFiSUNQMEhDTTVNc1M1VzM5MEJWajk3?=
 =?utf-8?B?SmtTdkZpQ2p0bmdFK212MWxBZ2tteWVXaXdIWFJhUGZ3MmRyRnE1RW4xa2tn?=
 =?utf-8?B?N2RSN096aDJQK2pNdnI4bU04VlNlNEkxRXpUdUs0RFZEREZuZTFMUWRYRVkr?=
 =?utf-8?B?MkVHQ1U2dFJKYmNuTTIxNmhZSlNta3JLeDk0NDVSZEdsWjlLTkcwdWJEWW9N?=
 =?utf-8?B?UWxKUEZQUTBhMEdvdTgxdGUrRWNtbDZCeVQxV0dkdWhSVmdodm9zeUtqY1JE?=
 =?utf-8?B?bGFLalpDa0MyM25FNjRObUZQU3dTVlRWYnl0ZGhaRDN4bWZYenZOSUhqSzhP?=
 =?utf-8?B?dVVrRzQ0MmFZaFJQT1pidjN1WnQ0RjBBNzAveGt5VkRqSnlXaDNYNWIvSFE0?=
 =?utf-8?B?ZG9sQTQwOTh3Y3hsa1laL0U0NnIvd2FZWW5aT0ZWQTlFUkFzcEpucy81SmJB?=
 =?utf-8?B?Yk1Fd000UXM1RUxja2h2UzdUVXJWeW9EZVZ0VnlGR05kM0NKeVpmNkVzVWN4?=
 =?utf-8?B?QldBcloxeEJ5Ry8rdWlmUXVQM3FlcWd2ODVESS95cVlRZ2EvNVViMVhUSlNB?=
 =?utf-8?B?VFZrM0ZUR0hWWXk3MnRNZHNlWDhhd2QrWEJYUWVpODlKVmZab1hqOVdvUDlF?=
 =?utf-8?B?Q0VJR04xYyt0b1NjYlo3R05pV3FJUlFhNzYvNTd0R284VDZzWW82UEN6T09w?=
 =?utf-8?B?SHVWODVjZjFobzg2MElVdVh3cllaSGdWRksxVEYxK1Urc1o0NE5vSkU1NDg5?=
 =?utf-8?B?K25ZSGJjTzRHajFNZTIyMHRoclZUZldLakhtVUErOXhLR0g3NlVqVW5YSE5l?=
 =?utf-8?B?YXN5Q0Q5UERGbWpYNElWVERQMi9sSW9Ja0NJc3Y4dllKQk1Cbm12Z0w1MG9O?=
 =?utf-8?B?N3AyeGUrSHpXV1l5SmVNZWVqRFJUWHVDZVJYYXdVR0RUdk1ndm9odVVjKzA0?=
 =?utf-8?B?UlF1ZG5UTmU4ZFpFNWp4MXFlR3RhanFKVzFJVzRMd2UrK3dINS9sU2JaSWdY?=
 =?utf-8?B?R3M3MVo4Ui84c1dRLzVBOW5HR0txQjNOWjcvSEdSNHZqcnlXWVN6dm9VZEFi?=
 =?utf-8?B?bTB5Yzc2Um42SzZ0anZ2TnFzWk92YS80QjAvMjhDNkVYcXp3QlB1WFI1RnJn?=
 =?utf-8?Q?P/n9AKj4i1YCYFD6lLGznmVl5iWgrQNZV7ao+gShrvb44Q?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YndVb3RIanJTYWl3SHc5WTlKN3AxeTYvSFFHMG9uUy9rd1h4RTN5d29ZSFdj?=
 =?utf-8?B?ZE9MRWw5MWY2Y1pCSFZWblZkNldZM1kyYVBmdEI4SG9IUHR6alNTdmpaMm1C?=
 =?utf-8?B?ekJmVVdOVGFKYzYyWHBDbFdhSGhNMDdtMmU4NlFma2JtclFMdUdLSjFwYngv?=
 =?utf-8?B?STRRdVFKWHR2NHhPRVlidFJheS9OVlVvbTlMdE5nd3EvaWlPUTlvUXpOQzZ0?=
 =?utf-8?B?Y0RlK1lvZ0p1cDJrbjhwSGE3c3BSVnJUaXRSSE5yZlBRd0gvdU5kT2g0aWwz?=
 =?utf-8?B?MlZPbElpeVFRKzlrQUVOcXQ2SUxuQTlkMXlrYXdVbk92NFdvTXFqS1FYVGVK?=
 =?utf-8?B?OEx5UDAweWhibVI0a0xkOFdqVldQZVQwRnFkdFVLMWVuUVpFVmR2YU0wN09N?=
 =?utf-8?B?UTRQeUZXZ1Rwby9mV09aTjlGTEhVUVB6NkkwUE0xcnV6ZWp4K1BXWEw3bFZv?=
 =?utf-8?B?VW00aUZpODJaOEFjaUVSYXprUkdScTEzMDEyY3QwYWxMRnh1dEVPblkxU2lS?=
 =?utf-8?B?TFh5U1BWaktVNmRhMFdEN2NUU3oxZzZWa0tlY0crdDg2QmxEMG4rQWJwdmZW?=
 =?utf-8?B?ZGNUdTNXbVVQaktGdmUvcDR5b2hnaG9ydXdmZlpod0w2TklVSS96S0NHWkVQ?=
 =?utf-8?B?ZzA4RFVEMUFVOTdjZ0JDMlRWVnk4WXJaTHlJMzVyQ2hFQVI0M1NyNFl2Z1lO?=
 =?utf-8?B?RVFJc2oxVEFIWGZva0lMRm00QzhzSlhKODlmL0oza01LZUJsNnIzL2dhVFQ3?=
 =?utf-8?B?UjFnZXdkTlJUVlVwNWJwbVFMUGhqZ3Q1bjNQWnplN09BK0Zja2VNTmpKUFEy?=
 =?utf-8?B?bWovOHlCNnVXL3BISGIwM3FqL2NOY2pkMlVaNlRqcWpUWFBqK01taURiRHVV?=
 =?utf-8?B?bE5XaUhtaVVtUlRXN2lMak0yMUpoT0hQbFNmZm0xWjFGNnE3am5yZzhXTlNC?=
 =?utf-8?B?MFBEZzcvNVJpclhIUDQ3RGhMRVlKY0RGZS94ODNHMWtaNXNxUmV1Si96aGov?=
 =?utf-8?B?Wi8vZUtsMzdiaFdGVHB4VzhmVGg5Y1JTRDFlbGpQZVlWQWxrTEtiVEdGN21G?=
 =?utf-8?B?dDNYcEVRTnJ2R2Noclp1NC9ETi94N3FCOG0wd0krMmQzTnI3TVFpQjZuUUJn?=
 =?utf-8?B?NHZsdkNNMUd4dlY2T3FTellpSWltZnMvb25rbnpVVVNidUo4OHVIcGdsQ1Y1?=
 =?utf-8?B?V1FxNklkVEFCd2xxcGczMXRzRHdmc1dCcDBsNS9kL0tMdTBBOTl0SXlnZkk1?=
 =?utf-8?B?Nll2M0xQam9uNFg3ZlhoNk1mTUkrUFJQME12OWZwMWl4U0kyWm1sOUljWFc2?=
 =?utf-8?B?M2t0M05mTjN5VVN6Y2VEMmJ2SVdGSWdIZHEzVG1DRFl4WjNQNWJKTHpEeTlF?=
 =?utf-8?B?TUErT3BEcE1mV1laVDVOUDc5eVJPZU5IdkxTL1dLaXJWRXcveHFLVFBoK0Zu?=
 =?utf-8?B?NStsSjFXTXlDUGFjbjRwR1lHbENTWVJpNDBNenlxd2ticW5GbHVnMFlLR1dG?=
 =?utf-8?B?dFBNQzlNcnFJbFlTY0RsWlo5NDUyWmgxZTUxa0FLMzErMWdPN0I2aTUvbU1a?=
 =?utf-8?B?OGNNQS9HdlNuMjF4YmM0K0VoOUJvSmJTK1VYejFHM1JIWDN6MUJzM2czSzVk?=
 =?utf-8?B?dkk4dXFDVUFnZG54OGlhZlZWYk1iNjdSRDAweGFJaXNVbFYyN2F1NGtYSnpl?=
 =?utf-8?B?eDczdG04UHpnWkdqU2FvYlRBWXlFTW5JdW0vbENIaDVMcjN6ZDBTQklEVzVn?=
 =?utf-8?B?eUtjSnlMNFVUN0JmUkZvVlFEbkpPOVF6cGhpUE9TaVZpRjBTNnJNa3JCanhG?=
 =?utf-8?B?bmd4NE5VY2xBMzduRktud1NuM2IrY1BaZzRua2hxU0ZJOHZ0Y1lrQ2c3VzNK?=
 =?utf-8?B?azZoRmJidGJ0NUppOFcvSnJ6WlRIOXczUC9OSUFaNWowcTh4SS9kaGNOa2dK?=
 =?utf-8?Q?2YEHSLWfZMcoqST7s3XnpQrDMkJMJrO6?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e74d8f39-3692-4407-8096-08df13425012
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:59:24.3506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P191MB2334

Cover what the setters promise: plain ASCII and multi-byte names survive
byte for byte, a field starts out and can be cleared back to NULL,
whitespace is stripped, a whitespace-only name counts as unset, and a name
that fits into the fixed field next to it is not stored at all.

The sanitising cases carry the weight, since they are what keeps malformed
input from reaching user space: truncated sequences, stray continuation
bytes, overlong encodings, surrogate halves, code points past U+10FFFF, C0
and C1 controls and an ANSI escape, each with the exact output expected.

test_card_full_names_passthrough pins the opposite: bidi overrides,
zero-width and tag characters and a non-character come back unchanged.
That is deliberate, and a test is the only way to keep it from looking like
an oversight later.

Truncation is checked with a 2-byte and a 3-byte character, so the case
where the limit does not divide evenly is covered, and with input that is
all bad bytes, where each one grows from one byte to three and the limit
has to hold on the output rather than the input.

test_card_id_stays_ascii is a regression test for the card id fix earlier
in this series; without it, card->id[0] comes out as 0xc3.

Assisted-by: LLM
Signed-off-by: Luca Rodenhäuser <otzelot2021@outlook.de>
---
 sound/core/sound_kunit.c | 284 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 280 insertions(+), 4 deletions(-)

diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
index d462462543..26554da484 100644
--- a/sound/core/sound_kunit.c
+++ b/sound/core/sound_kunit.c
@@ -5,6 +5,7 @@
  */
 
 #include <kunit/test.h>
+#include <linux/ctype.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 
@@ -300,8 +301,7 @@ static void test_card_add_component(struct kunit *test)
 }
 
 /* snd_utf8_strscpy() has to behave exactly like strscpy() for ASCII and only
- * differ where a multi-byte sequence would be cut.  The escapes keep this file
- * plain ASCII; \x escapes are greedy, hence the split literals.
+ * differ where a multi-byte sequence would be cut.
  */
 #define STRSCPY_UMLAUT		"\xc3\xa4"	/* 2 bytes */
 #define STRSCPY_HIRAGANA	"\xe3\x81\x82"	/* 3 bytes */
@@ -327,8 +327,8 @@ static void test_utf8_strscpy(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, len, sizeof(dst) - 1);
 	KUNIT_EXPECT_STREQ(test, dst, ref);
 
-	/* 2-byte characters: 7 bytes of room hold three of them plus one ASCII
-	 * byte, so the fourth has to be dropped whole rather than halved
+	/* 2-byte characters: three fit in seven bytes, the fourth has to be
+	 * dropped whole rather than halved
 	 */
 	len = snd_utf8_strscpy(dst, STRSCPY_UMLAUT STRSCPY_UMLAUT
 				    STRSCPY_UMLAUT STRSCPY_UMLAUT,
@@ -356,6 +356,275 @@ static void test_utf8_strscpy(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, snd_utf8_strscpy(dst, "abc", 0), 0);
 }
 
+/* The UTF-8 test names are spelled out as escapes on purpose: the bytes are
+ * what is under test, and the file itself stays plain ASCII.  Literals are
+ * split where a hex escape is followed by a hex digit, since \x escapes are
+ * greedy: "\xe2\x80\xaedef" would parse as \xe2 \x80 \xaed.
+ */
+#define UTF8_LATIN_NAME		"M\xc3\xbcller Audio"		/* Mueller with umlaut */
+#define UTF8_CJK_NAME		"\xe3\x81\x82\xe9\x9f\xb3"	/* hiragana a + kanji */
+#define UTF8_ASTRAL_NAME	"\xf0\x9f\x8e\xb5 Audio"	/* musical note + text */
+#define UTF8_UNTRIMMED_NAME	" \t" UTF8_LATIN_NAME " \n"
+#define UTF8_ONLY_SPACES	"  \t\r\n "
+#define UTF8_REPLACEMENT	"\xef\xbf\xbd"			/* U+FFFD */
+
+#define UTF8_UMLAUT		"\xc3\xa4"			/* 2 bytes */
+#define UTF8_HIRAGANA		"\xe3\x81\x82"			/* 3 bytes */
+
+/* Malformed input.  None of it is rejected any more; each bad byte becomes one
+ * U+FFFD, so that a caller is never pushed back to the unfiltered ASCII field.
+ */
+static const struct {
+	const char *in;
+	const char *out;
+} sanitised_names[] = {
+	/* truncated 2-byte start */
+	{ "abc\xc3",			"abc" UTF8_REPLACEMENT },
+	/* stray continuation byte */
+	{ "abc\x80",			"abc" UTF8_REPLACEMENT },
+	/* overlong encoding of '/': both bytes are bad */
+	{ "abc\xc0\xaf",		"abc" UTF8_REPLACEMENT UTF8_REPLACEMENT },
+	/* U+D800, a surrogate half: three bad bytes */
+	{ "abc\xed\xa0\x80",		"abc" UTF8_REPLACEMENT UTF8_REPLACEMENT
+					UTF8_REPLACEMENT },
+	/* beyond U+10FFFF */
+	{ "abc\xf5\x80\x80\x80",	"abc" UTF8_REPLACEMENT UTF8_REPLACEMENT
+					UTF8_REPLACEMENT UTF8_REPLACEMENT },
+	/* broken continuation: the 'A' after it is valid and survives */
+	{ "abc\xe3\x81" "A",		"abc" UTF8_REPLACEMENT UTF8_REPLACEMENT "A" },
+	/* C0 control in the middle becomes a space */
+	{ "abc\ndef",			"abc def" },
+	/* U+0085 NEL, a C1 control */
+	{ "abc\xc2\x85" "def",		"abc def" },
+	/* ANSI escape: the ESC is what makes it dangerous */
+	{ "abc\x1b[31mdef",		"abc [31mdef" },
+	/* U+2028 LINE SEPARATOR */
+	{ "abc\xe2\x80\xa8" "def",	"abc def" },
+};
+
+/* Code points the kernel deliberately does NOT touch.  They are a real
+ * spoofing vector, but catching them needs the Unicode character properties,
+ * which live in user space.  This test pins the documented behaviour so that
+ * nobody mistakes it for an oversight.
+ */
+static const char * const passthrough_names[] = {
+	"Audio\xd8\x9c" "Device",	/* U+061C ARABIC LETTER MARK */
+	"Audio\xe2\x80\xae" "Device",	/* U+202E RIGHT-TO-LEFT OVERRIDE */
+	"Audio\xe2\x81\xaa" "Device",	/* U+206A INHIBIT SYMMETRIC SWAPPING */
+	"Au\xc2\xad" "dio",		/* U+00AD SOFT HYPHEN */
+	"Audio\xef\xb8\x8f",		/* U+FE0F VARIATION SELECTOR-16 */
+	"Audio\xf3\xa0\x80\x81",	/* U+E0001 LANGUAGE TAG */
+	"Audio\xef\xbf\xbf",		/* U+FFFF non-character */
+};
+
+/* Build @repeat copies of @seq, NUL terminated. */
+static char *utf8_repeat(struct kunit *test, const char *seq, size_t repeat)
+{
+	size_t seq_len = strlen(seq);
+	char *buf;
+	size_t i;
+
+	buf = kunit_kzalloc(test, seq_len * repeat + 1, GFP_KERNEL);
+	if (!buf)
+		return NULL;
+	for (i = 0; i < repeat; i++)
+		memcpy(buf + i * seq_len, seq, seq_len);
+	return buf;
+}
+
+static void test_card_full_names(struct kunit *test)
+{
+	struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
+
+	/* an unset field stays NULL, which means "fall back to ASCII" */
+	KUNIT_EXPECT_NULL(test, card->full_shortname);
+	KUNIT_EXPECT_NULL(test, card->full_longname);
+	KUNIT_EXPECT_NULL(test, card->full_mixername);
+
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, UTF8_LATIN_NAME));
+	KUNIT_EXPECT_STREQ(test, card->full_shortname, UTF8_LATIN_NAME);
+
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_longname(card, UTF8_CJK_NAME));
+	KUNIT_EXPECT_STREQ(test, card->full_longname, UTF8_CJK_NAME);
+
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_mixername(card, UTF8_ASTRAL_NAME));
+	KUNIT_EXPECT_STREQ(test, card->full_mixername, UTF8_ASTRAL_NAME);
+
+	/* setting it again replaces the previous value */
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, UTF8_CJK_NAME));
+	KUNIT_EXPECT_STREQ(test, card->full_shortname, UTF8_CJK_NAME);
+
+	/* NULL clears the field back to "unset" */
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, NULL));
+	KUNIT_EXPECT_NULL(test, card->full_shortname);
+
+	snd_card_set_full_longname(card, NULL);
+	snd_card_set_full_mixername(card, NULL);
+}
+
+/* A UTF-8 field is only worth an allocation when it carries more than the
+ * ASCII field next to it; otherwise the documented fallback says the same.
+ */
+static void test_card_utf8_names_same_as_ascii(struct kunit *test)
+{
+	struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
+
+	strscpy(card->shortname, VALID_NAME);
+
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, VALID_NAME));
+	KUNIT_EXPECT_NULL(test, card->full_shortname);
+
+	/* the same name with padding sanitises to the ASCII one, so still unset */
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, " " VALID_NAME "\t"));
+	KUNIT_EXPECT_NULL(test, card->full_shortname);
+
+	/* one that differs is kept */
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, UTF8_LATIN_NAME));
+	KUNIT_EXPECT_STREQ(test, card->full_shortname, UTF8_LATIN_NAME);
+
+	snd_card_set_full_shortname(card, NULL);
+}
+
+static void test_card_utf8_names_sanitised(struct kunit *test)
+{
+	struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
+	size_t i;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
+
+	for (i = 0; i < ARRAY_SIZE(sanitised_names); i++) {
+		KUNIT_EXPECT_EQ_MSG(test, 0,
+				    snd_card_set_full_shortname(card, sanitised_names[i].in),
+				    "name %zu was rejected", i);
+		KUNIT_EXPECT_STREQ_MSG(test, card->full_shortname,
+				       sanitised_names[i].out,
+				       "name %zu came out wrong", i);
+	}
+
+	snd_card_set_full_shortname(card, NULL);
+}
+
+static void test_card_utf8_names_passthrough(struct kunit *test)
+{
+	struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
+	size_t i;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
+
+	for (i = 0; i < ARRAY_SIZE(passthrough_names); i++) {
+		KUNIT_EXPECT_EQ(test, 0,
+				snd_card_set_full_shortname(card, passthrough_names[i]));
+		KUNIT_EXPECT_STREQ_MSG(test, card->full_shortname,
+				       passthrough_names[i],
+				       "name %zu was altered; the kernel does not filter these",
+				       i);
+	}
+
+	snd_card_set_full_shortname(card, NULL);
+}
+
+static void test_card_utf8_names_trimmed(struct kunit *test)
+{
+	struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
+
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, UTF8_UNTRIMMED_NAME));
+	KUNIT_EXPECT_STREQ(test, card->full_shortname, UTF8_LATIN_NAME);
+
+	/* a name that is only whitespace carries no information: treat it as
+	 * unset rather than storing an empty string
+	 */
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, UTF8_ONLY_SPACES));
+	KUNIT_EXPECT_NULL(test, card->full_shortname);
+
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, ""));
+	KUNIT_EXPECT_NULL(test, card->full_shortname);
+
+	/* control characters at the ends become spaces and are then trimmed */
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, "\x01" VALID_NAME "\x7f"));
+	KUNIT_EXPECT_STREQ(test, card->full_shortname, VALID_NAME);
+
+	snd_card_set_full_shortname(card, NULL);
+}
+
+static void test_card_utf8_names_truncated(struct kunit *test)
+{
+	struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
+	size_t len;
+	char *name;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
+
+	/* 2-byte characters divide the limit evenly */
+	name = utf8_repeat(test, UTF8_UMLAUT, SNDRV_CARD_FULL_SHORTNAME_MAX);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, name);
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, name));
+	KUNIT_ASSERT_NOT_NULL(test, card->full_shortname);
+	KUNIT_EXPECT_EQ(test, strlen(card->full_shortname),
+			SNDRV_CARD_FULL_SHORTNAME_MAX);
+
+	/* 3-byte characters do not: the last whole character has to win, so the
+	 * result stays below the limit instead of ending inside a sequence
+	 */
+	name = utf8_repeat(test, UTF8_HIRAGANA, SNDRV_CARD_FULL_SHORTNAME_MAX);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, name);
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, name));
+	KUNIT_ASSERT_NOT_NULL(test, card->full_shortname);
+	len = strlen(card->full_shortname);
+	KUNIT_EXPECT_LE(test, len, (size_t)SNDRV_CARD_FULL_SHORTNAME_MAX);
+	KUNIT_EXPECT_EQ(test, len % strlen(UTF8_HIRAGANA), 0);
+
+	/* replacing a bad byte grows it from one byte to three, so the limit
+	 * has to be enforced on the output, not on the input
+	 */
+	name = utf8_repeat(test, "\x80", SNDRV_CARD_FULL_SHORTNAME_MAX);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, name);
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_shortname(card, name));
+	KUNIT_ASSERT_NOT_NULL(test, card->full_shortname);
+	len = strlen(card->full_shortname);
+	KUNIT_EXPECT_LE(test, len, (size_t)SNDRV_CARD_FULL_SHORTNAME_MAX);
+	KUNIT_EXPECT_EQ(test, len % strlen(UTF8_REPLACEMENT), 0);
+
+	/* the longname field has its own, larger limit */
+	name = utf8_repeat(test, UTF8_UMLAUT, SNDRV_CARD_FULL_LONGNAME_MAX);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, name);
+	KUNIT_EXPECT_EQ(test, 0, snd_card_set_full_longname(card, name));
+	KUNIT_ASSERT_NOT_NULL(test, card->full_longname);
+	KUNIT_EXPECT_EQ(test, strlen(card->full_longname),
+			SNDRV_CARD_FULL_LONGNAME_MAX);
+
+	snd_card_set_full_shortname(card, NULL);
+	snd_card_set_full_longname(card, NULL);
+}
+
+/* card->id is an identifier, not a display name: it has to stay alphanumeric
+ * ASCII even when the name it is derived from is not.  isalpha() alone does
+ * not ensure that, since the ctype table treats the Latin-1 high bytes as
+ * letters.
+ */
+static void test_card_id_stays_ascii(struct kunit *test)
+{
+	struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
+	size_t i;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
+
+	/* the digit has to be the first ASCII-safe byte to reach the path that
+	 * copies the source byte unfiltered
+	 */
+	snd_card_set_id(card, "\xc3\x84" "3000");
+
+	for (i = 0; card->id[i]; i++)
+		KUNIT_EXPECT_TRUE_MSG(test, isascii(card->id[i]),
+				      "card->id[%zu] = 0x%02x is not ASCII",
+				      i, (unsigned char)card->id[i]);
+}
+
 static struct kunit_case sound_utils_cases[] = {
 	KUNIT_CASE(test_phys_format_size),
 	KUNIT_CASE(test_format_width),
@@ -368,6 +637,13 @@ static struct kunit_case sound_utils_cases[] = {
 	KUNIT_CASE(test_pcm_format_name),
 	KUNIT_CASE(test_card_add_component),
 	KUNIT_CASE(test_utf8_strscpy),
+	KUNIT_CASE(test_card_full_names),
+	KUNIT_CASE(test_card_utf8_names_same_as_ascii),
+	KUNIT_CASE(test_card_utf8_names_sanitised),
+	KUNIT_CASE(test_card_utf8_names_passthrough),
+	KUNIT_CASE(test_card_utf8_names_trimmed),
+	KUNIT_CASE(test_card_utf8_names_truncated),
+	KUNIT_CASE(test_card_id_stays_ascii),
 	{},
 };
 
-- 
2.43.0

