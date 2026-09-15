Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010023.outbound.protection.outlook.com [52.103.32.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D84B203E;
	Tue, 15 Sep 2026 15:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487983; cv=fail; b=emXqCTD86yUgvW9oePaIqsFhQVshZqSG2mvXr7gdr08YdmACXTndEiyb4uLNL4Yad6lAOJA9S/H35GJzsx9Mrlv0gJ+5ijiYmUW9cMSASP/gf3SyvWfUM6anCspHP0QjSIpEjMgZETuXNEgPECneaJqrExv9arG0DxxhmcHDqec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487983; c=relaxed/simple;
	bh=QhC/qwKUnTlnbUlYolDgaIokDEPmpdtHgJuCSSBkGIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kQ3rjHxyJjFaDj0V11UdCiZCXKomIqz3PGlnDb9Exinn/VwrFFGZKKsuOyu1CHIe7aYp8MKdU72QiGWWtngoTO0nPJ0JscMsRnao1EzmWmWPIOp3k5dCPD5psQKhSumge+aBp5QlOQ/uPh7Or4V9u9HIPyJbzLUkRbbWiN7nV1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=mynZNYKi; arc=fail smtp.client-ip=52.103.32.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="mynZNYKi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBS2JJRY3n98rykOm6qH7fsuphlhx/XesiGbis1TSEi0twgHRsSFzOFBOB0eWZedyf0AyLUqTdmaVOqCsYFLkz8q69+o0xXWUevikMfSS3eG+Wg7ZfMEzgtc1b4ZS6Ol02ItpHz0Ko/Wt3VrYRWJCScVdvsVfYcotVyGfDaOj7MMgujvblkIG+lHNOYTljJUK7XpL+OQHTpEPRUiUztlwQp62oBtzDNvzeaETYy0tWYwkQBb0NIlBKGJpz5LyhG68oXo5X/EGNXWdLCdLUqMxXessRiQPQsnXNaNG5aBqc40C8Dw4+87WcTFYGLECoYUP8qPwRAmsxuYTIRo7NHLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1Z4IEMhKr98cc8PiGrv7RDZgYnHgu7eXZi8oalTll0=;
 b=TdxigGVhRhRXVKA4qYsJ13xP/8I+Jg+L4mRsh6MKh5F3HrNV98eOgh4FFsOsfEDaBOTkgcnOQt2IpIPq2mz9w+9HBXdTvp9b1WzVSv4ZcbntKvpJQQ3nXdBBETyr53cFvgaQsrE+iOi6kRcYH0WWwvAlpzlBMhfbL2ZSAXHKAXvndeNv22WvXs3M2PbCuShXZesMD14hfsYtfFVboBeoLtakOAUTPo5rRawXuh4r98itVOnaXae7AF5L0rZbR5h/ffBlZPK08goVOBULorfHDuWtj/AGxXBqcQv09mDVimflX8ZpoMs8r38HDZfYXMs7FezZK0ICy2ZICwVkUhgClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1Z4IEMhKr98cc8PiGrv7RDZgYnHgu7eXZi8oalTll0=;
 b=mynZNYKijxuiRjJRn51KuozF0K6GEmhWPkNbI7aNH8WWu46zrofsNk/23RCDaYga0hl0UUwqOvVRp+fCBAGSbJ96Sk84IvhbfnwLK3NlvUI4vyhtlGob/7PjlHIUPe/RL9JwnppYA4XOwuSeJJh1qS1JIqwLe51rFJ+8bshVROQfS/0wY5wuLgbvvQfiFqqWnf0NfAfYIQ4ep+7NaP45Z0W871Siefl378UDyKTDYq69RCXO9xdSQ9qLxvKsFtO3n/Xn/iFOC97euJsKfmFRTefyNh4A6pBAfnoewSV7ZWaihHYLt3b/BpUp0HCbymoIF/mgiQYzE9xoPbIXiVScPw==
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6b0::11)
 by GV2P191MB2334.EURP191.PROD.OUTLOOK.COM (2603:10a6:150:d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:59:26 +0000
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883]) by AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:59:26 +0000
From: =?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
Subject: [RFC PATCH 7/8] ALSA: usb-audio: offer the untruncated card names
Date: Tue, 15 Sep 2026 17:59:07 +0200
Message-ID:
 <AMBP191MB2886BED730B4FB0422E1E8BFCEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
References: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <20260915155913.421839-8-otzelot2021@outlook.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|GV2P191MB2334:EE_
X-MS-Office365-Filtering-Correlation-Id: cebd02b8-6058-45b3-e7ec-08df13425043
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|55001999006|41001999006|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|25031999004|22091999003|24121999003|40105399003|11031999003|12091999003|26121999007|2607281247196008|56899033|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGhOakQySFc3cDhiTDduWmR0U3ZxZURnQVVOSHY4ODlOaWY0RUNVZkY1UThH?=
 =?utf-8?B?N05SYk5takxlc1c4VmdCZWphM2ZKdHQ2KzJJUytqczJNTTljTkx1NVUva3lL?=
 =?utf-8?B?b09Rd1NCRm9uTDQyb1ppOFcrY0RVTWRlWHl3ZXhGdVh6dVRTeElDV1l5MGtS?=
 =?utf-8?B?NVNWWm0zaWRLQUJQRlk1UnBZNzkwQlhSbUl4dFNWSmp4YjZEV21BR1d6VTM3?=
 =?utf-8?B?bkFJMUYrTUhlclN6R0tiZTIvR1loaEhQOWlTakZKTXFyeTY5U294VEZSa2VN?=
 =?utf-8?B?a0hHZzBBVHQvMVJXMldhTHVEem5lcEJNQWF1SjI4NzlCWUlPdG84SDAwOEtk?=
 =?utf-8?B?Z3JjdUkxSEtwWkFycFZiajhiOUJPb0ZSU3lRaHROeFp5YUFxV3NzUWYzVitD?=
 =?utf-8?B?Qk1pbkxNM0JWTk9pR2YzOFVSMWZUeFFkbUZOeHplcS9XeDRoVnBTQjN5WFFO?=
 =?utf-8?B?N1RDWlJEYnBYcCsrL09HRXJWVm9Sei9YZU9iVmIvaEtwUk1tU1JOc3JSZWdx?=
 =?utf-8?B?enhGRGhyV2JFRmhYVzF2TkVieFc3WWRWQVIwQkdITnRrWHRwMWlhV1NYV2lz?=
 =?utf-8?B?cGdpQXd2NUdIUExPRks1NlZjYW9qRHdFZWRtMzZXQmRESmVlSklnZ2pKV1Zk?=
 =?utf-8?B?Vzg4Y3pTb0wwT3ZCWDM5TWM1U2Rhek82bVkrVXd1ZWtEcGR6SjJXTG5ESkph?=
 =?utf-8?B?WTBRZE9reW9WRVdRMC9kNlplcWdUT0R3eitlREExSzFqMEtUdnZ3NzhrK0Fw?=
 =?utf-8?B?Z1dLM1U3RmR2dzVETFJlWVkrT2pZRk10RkpaZUFCeW96T0EwdWxQc1FZc2du?=
 =?utf-8?B?TlBvOVNnR3hPVHFRUGNqanRYWGFjcVdpN0JiOFh1Q2tiRGk0QmpaNWcrYTZ0?=
 =?utf-8?B?c0Q2Y3VxMjNRQ2NkMTQ3QVpIRkdVTE92VXdZci9HUnVCUnFRbmtuMVMzY2Yz?=
 =?utf-8?B?M3duRDJaNG8vRXFNVEdqcnBFcEhLNC9MN2JLVEdDY0tzV3dJYzZHeHFNTDYy?=
 =?utf-8?B?clJVK0RvU0pPSnhLeUdMMDNYaWJkNjM2UVJBb3VESi8zakxMYm9VYjZZcEU3?=
 =?utf-8?B?TkJlS3hOS2tweXQ0d09hKzJmN0xHKzlnRUVodzFDOU1Da3c0S1lkS1hFQjI3?=
 =?utf-8?B?akpEam5rcUNHbkx6QWl0b0tRVWNNak5SWms5VUM5eUcrd25MV0JiT2ZFK3Rp?=
 =?utf-8?B?M3J5Z01KZHJJMFVYUURtZndsS1B1OXRwQlM2VzJEeDYvSU5PN2dPVVBibmpZ?=
 =?utf-8?B?SmxVOGd4d2pwVXRmKzh5R3JHN2F0Vkd4bUNWZldueVpLUUdNaytFTUZvM3Ix?=
 =?utf-8?B?N0h5YlVqeW0wWEVRdWx3cFNCQkgzSXd6Mk5zSWRtZ2xQKzZxZndRMGdnWXRY?=
 =?utf-8?B?eEdzSVowNisvd0ZzVzVWUTVjUVhlL3IrdGcreXVleDF3RWdnRmRjQllKTDFM?=
 =?utf-8?B?d3pCUWs4ZWZmZzAyZ21wcjl6eGxNRlhpQkdvOXpvWjVoSEZIVXBJS21NRWJ6?=
 =?utf-8?B?RGw5TkJrcVcxVDc0OFdUQjQxM2FFSGRsYjZUM3MwUTgyaWdvcHcvYk1DMG5j?=
 =?utf-8?B?WU83TWV2NG1sUDM2SjVzQ2ZZcWkyUjlQNnhhcW1DRzJCNnJOU0UrSHVmd2pH?=
 =?utf-8?B?REtxTmUxQVhmdDlLZnlvNU0vYWZPbHRsQ3dxQjdMWWZXTzZ3K3BnbzZYZEk1?=
 =?utf-8?Q?YHqjhw7IP2o09NxPrLMp?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTRNZklmMm5NcnhVZnlLVWxuOTE1RjlmREgrT0plTDdsWVdPODRsZ0c3R1Ar?=
 =?utf-8?B?QUo5Uk1FZ09ySnF2dVFpRWVRMkhpMVFJNy9Ld0pCYlNHRnlnMEpEVzlUaVJX?=
 =?utf-8?B?bmcxaS9Kak9mdGVGOWN3cVJtL2d5US85d0VrWDNlMmxpTFU3akFVV1lhY1NR?=
 =?utf-8?B?V1pYWmhvUDN0RGdaWGdVbGtRKzFDSXhnbENYZXVMekQ1YWxtQ00vbHlkczlQ?=
 =?utf-8?B?UlVDKzd2ejdOUVh1QitneGJMSGpvMjBocko1L2o5NVIySFhLV0IzQ21JUkJP?=
 =?utf-8?B?VDN3eUJ5U2lkOGowV09VcVNHc01zcVg4TGY4LzkwZUtCZkFBRmdNUURtaWNI?=
 =?utf-8?B?SURJcVdVREJCZEFQb1BWQlphMHRMRENWTnNWOWVLTEF5NnVJa0U4b1NQaXNU?=
 =?utf-8?B?c0g4NFVMaDJJM3RQSGZLVWJMWkVzV1pCcHJ6cWJtemJIUDJhc1Fod05JZ0la?=
 =?utf-8?B?Y3ovZWdUcHVZeHhPczBLSFZMRURCL3FKTU01UmpmTThKN0FuTmMzU0h3Qzkr?=
 =?utf-8?B?a1QxWnZ3UExTejFudUVCeFpyeHFxVHpQb1U2dWYwdExLdVJ4d2E4aTRFUkhF?=
 =?utf-8?B?elBDZmJ5dXVuT2xGMEpQZUwrd2JNL1I4ZnVETWJqVVhwWnRiWHo4Nm56QlV0?=
 =?utf-8?B?eCtVYWgvT0xlbEQwdXdiZENTemRhRGpmZFNoV0E2eHJvYW9EN3JEV2VkQ2t5?=
 =?utf-8?B?NDc3SHhrVFFQakgwUFRqc0svNytIcHNTc2ZYdTduektDVXduQVl2R0VRbE96?=
 =?utf-8?B?QzhJWmVMSExCRE5ZU0JxTjFyRjVHZHBXOFhwRnA0WkhNOW56RFZnWjVndml6?=
 =?utf-8?B?aUQ4TUM0d0o0N3ZPeE9wR0s2R2p4YjhaZ2VMYlhmSzMvWWxQTWNGM2pLMjRD?=
 =?utf-8?B?WHN5aTFqZzJ4ZmFKY0t4b1pYSWRDS0dpb0FqcVJhaVNCL2NXYVEzcS82SUE4?=
 =?utf-8?B?aHNPVGVuUlBEVWpsTkE2NWJERGd6eEFtQWNRWTBhMmM4RGxkUUdMQXlBcGYy?=
 =?utf-8?B?QmZIZ0sxV2k3ZW83Q0wyTHAzLy80c01PQ3JHWERjbEtkZ1VvY0ZybmRIb0l4?=
 =?utf-8?B?dXo1UXpIMDRTbDE3TVpPZ0dLSXdLVmVUR3ZDdzB2TFAzL0tXSTZac3Exa3h2?=
 =?utf-8?B?NkJKWlBxd0dTa24vZmpaaE5vQUpIT1VWT1dpWkpzQzZmUXRZVGtsd3pUUGxX?=
 =?utf-8?B?dkt0b0hJd3ZzL0I3clljZEhqVnI1c09JMFZKVzNJTUZKNjVRVnZUeUJ2SVRW?=
 =?utf-8?B?WDFjTWVnUXdQUERzdWg5cDJ6TktDUktyMWZSSzdxUDF2U1M5S1g4Vk5Laisy?=
 =?utf-8?B?RG4zcjhYVUx3VzVpUGdtY3QrYUxGM0pBK0pBTUxzTTBYZElsaFVXRnJwemlB?=
 =?utf-8?B?cVRCTjBLOW04bHV4dHJJRXIrcnZvR25JZlNQUVVwUGRtek53SWNWemcvQVNV?=
 =?utf-8?B?b1lNMmhXTCtHd2x1L2lNZ2sySngrU2c0RWo5T3BEZzhiZHFod3pNSmdZbUdT?=
 =?utf-8?B?ZUFmSUFWN0hKYkF4ekk3N3pOMW1zc3U3YTlzS1NRMEhLWXNaRVVROFlzemtL?=
 =?utf-8?B?N0piZlI0RGlPQmJPL1ZxaFhQSjBMbjZOSkZBOG94NHViazlSMXg2R1hzUnZj?=
 =?utf-8?B?NGVsWlJMQlRYd0hjZTk1Qlp0U3ZPbkNpSmdXVjFRRmZlbURFWm1xd214WHhZ?=
 =?utf-8?B?dHJhcXRWL1ZNWUprOWZnUnI1bTRkMnVadkExOFhNRFdIQmp6d04xcGNtbEJT?=
 =?utf-8?B?Tmx0WFFETjFJd0FTVUpLd0VnbTZDVXROTnBvajRZVURyS01MbUVUQ2dhSUFY?=
 =?utf-8?B?SW5BTHlhQURoSTkybitoOUZyempxQUZCZkt2QXRPZmVrS3Jsdlc0MEVFSnF1?=
 =?utf-8?B?Ui9qUXJncUg0Sm94UEcwOU95ZkhPSmRka055MWFOWS9MeWFlRGREWHFWZWxR?=
 =?utf-8?Q?y7Ow7rur2h7Cq6yjhcPY3EYsvbaUZv76?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cebd02b8-6058-45b3-e7ec-08df13425043
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:59:24.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P191MB2334

usb_string() hands back UTF-8 converted from the UTF-16LE string
descriptors, so dev->product and dev->manufacturer are exactly the kind of
name that does not always fit into a 32- or 80-byte field.

Offer the untruncated form alongside.  The fixed fields keep their current
contents, so user space that reads them today sees no change; since the
core stores the untruncated form only when the name did not fit, a device
name that fits costs nothing here.

The long name is assembled from the same pieces as the fixed one, but from
the untruncated sources, so it does not inherit the 80-byte cut.  The speed
suffix moves into a helper shared by both, and a small trim helper takes
the place of strim(), which cannot be used on the const sources.

This is best-effort: it can only fail with -ENOMEM, and the fixed name is
already in place, which is what a reader falls back to.

Assisted-by: LLM
Signed-off-by: Luca Rodenhäuser <otzelot2021@outlook.de>
---
 sound/usb/card.c | 103 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 80 insertions(+), 23 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index a83c51a3d5..7397febed9 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -627,15 +627,23 @@ static void usb_audio_make_shortname(struct usb_device *dev,
 		s = quirk->product_name;
 	if (s && *s) {
 		strscpy(card->shortname, s, sizeof(card->shortname));
+		/* The UTF-8 field is optional and only stored when it carries
+		 * more than the ASCII one above, so this is a no-op for a plain
+		 * ASCII name that fits.  It can only fail with -ENOMEM, and the
+		 * ASCII name is already in place, so ignore the result.
+		 */
+		snd_card_set_full_shortname(card, s);
 		return;
 	}
 
-	/* retrieve the device string as shortname.  usb_string() hands back
-	 * UTF-8, so cut at a character boundary rather than at a byte one.
+	/* retrieve the device string as shortname; USB string descriptors are
+	 * converted to UTF-8 by usb_string(), so dev->product may well carry
+	 * characters that only fit into the UTF-8 field
 	 */
 	if (dev->product && *dev->product) {
 		snd_utf8_strscpy(card->shortname, dev->product,
 				 sizeof(card->shortname));
+		snd_card_set_full_shortname(card, dev->product);
 	} else {
 		/* no name available from anywhere, so use ID */
 		scnprintf(card->shortname, sizeof(card->shortname),
@@ -647,6 +655,69 @@ static void usb_audio_make_shortname(struct usb_device *dev,
 	strim(card->shortname);
 }
 
+static const char *usb_audio_speed_string(struct usb_device *dev)
+{
+	switch (snd_usb_get_speed(dev)) {
+	case USB_SPEED_LOW:
+		return ", low speed";
+	case USB_SPEED_FULL:
+		return ", full speed";
+	case USB_SPEED_HIGH:
+		return ", high speed";
+	case USB_SPEED_SUPER:
+		return ", super speed";
+	case USB_SPEED_SUPER_PLUS:
+		return ", super speed plus";
+	default:
+		return "";
+	}
+}
+
+/* Skip leading and trailing spaces of @s without touching it, storing the
+ * remaining length in @len.  strim() cannot be used here because the source
+ * strings are const and must stay untruncated.
+ */
+static const char *usb_audio_trim(const char *s, int *len)
+{
+	int n;
+
+	if (!s) {
+		*len = 0;
+		return "";
+	}
+	while (*s == ' ' || (*s >= '\t' && *s <= '\r'))
+		s++;
+	n = strlen(s);
+	while (n && (s[n - 1] == ' ' || (s[n - 1] >= '\t' && s[n - 1] <= '\r')))
+		n--;
+	*len = n;
+	return s;
+}
+
+/* Assemble the UTF-8 long name from the same pieces as the ASCII one, but from
+ * the untruncated sources.
+ */
+static void usb_audio_make_utf8_longname(struct usb_device *dev,
+					 struct snd_card *card,
+					 const char *vendor)
+{
+	char *longname __free(kfree) = NULL;
+	char path[64];
+	int vendor_len;
+
+	/* the short name has been built already, prefer its UTF-8 form */
+	const char *product = card->full_shortname ? : card->shortname;
+
+	vendor = usb_audio_trim(vendor, &vendor_len);
+	usb_make_path(dev, path, sizeof(path));
+
+	longname = kasprintf(GFP_KERNEL, "%.*s%s%s at %s%s",
+			     vendor_len, vendor, vendor_len ? " " : "",
+			     product, path, usb_audio_speed_string(dev));
+	if (longname)
+		snd_card_set_full_longname(card, longname);
+}
+
 static void usb_audio_make_longname(struct usb_device *dev,
 				    struct snd_usb_audio *chip,
 				    const struct snd_usb_audio_quirk *quirk)
@@ -663,6 +734,7 @@ static void usb_audio_make_longname(struct usb_device *dev,
 		s = preset->profile_name;
 	if (s && *s) {
 		strscpy(card->longname, s, sizeof(card->longname));
+		snd_card_set_full_longname(card, s);
 		return;
 	}
 
@@ -670,11 +742,12 @@ static void usb_audio_make_longname(struct usb_device *dev,
 		s = preset->vendor_name;
 	else if (quirk && quirk->vendor_name)
 		s = quirk->vendor_name;
+	if (!(s && *s) && dev->manufacturer && *dev->manufacturer)
+		s = dev->manufacturer;
+
 	*card->longname = 0;
 	if (s && *s)
 		strscpy(card->longname, s);
-	else if (dev->manufacturer && *dev->manufacturer)
-		strscpy(card->longname, dev->manufacturer);
 
 	if (*card->longname) {
 		strim(card->longname);
@@ -689,25 +762,9 @@ static void usb_audio_make_longname(struct usb_device *dev,
 	if (len < sizeof(card->longname))
 		usb_make_path(dev, card->longname + len, sizeof(card->longname) - len);
 
-	switch (snd_usb_get_speed(dev)) {
-	case USB_SPEED_LOW:
-		strlcat(card->longname, ", low speed", sizeof(card->longname));
-		break;
-	case USB_SPEED_FULL:
-		strlcat(card->longname, ", full speed", sizeof(card->longname));
-		break;
-	case USB_SPEED_HIGH:
-		strlcat(card->longname, ", high speed", sizeof(card->longname));
-		break;
-	case USB_SPEED_SUPER:
-		strlcat(card->longname, ", super speed", sizeof(card->longname));
-		break;
-	case USB_SPEED_SUPER_PLUS:
-		strlcat(card->longname, ", super speed plus", sizeof(card->longname));
-		break;
-	default:
-		break;
-	}
+	strlcat(card->longname, usb_audio_speed_string(dev), sizeof(card->longname));
+
+	usb_audio_make_utf8_longname(dev, card, s);
 }
 
 static void snd_usb_init_quirk_flags(int idx, struct snd_usb_audio *chip)
-- 
2.43.0

