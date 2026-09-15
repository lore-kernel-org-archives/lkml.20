Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010023.outbound.protection.outlook.com [52.103.32.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942704B0C95;
	Tue, 15 Sep 2026 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487979; cv=fail; b=kIg/d0Wq2R1hOFVf8cq390AYKjRmfk6+aUaBCg9HKCS/3UB89eQQ3sBmNSfoY0H03yc3kg4vd2UowakjSzHvM/UUq8ZpLtpiF+EEtKk/h6dW80aSUphKYpDCvYeWnO7DZYOlcdsWD0qw6NsZs3JvAhdYFFXnVzkwp+0NhMaHFxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487979; c=relaxed/simple;
	bh=hFXcCNUTbn8P1nCSrIOEHTC73bLhDNTz7N+JT7sR17M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ka5WD7yQbkkmzYUNqzlkAeIdM26Gs/OT8gXlZ6tTWp3kr8ijDhigibZHmo8Vmb9u/W4654ySus71q7Q2SfTqDWhA1Sffia35zAFNTSHmg6CeqGxK13bwH6QVwRT7o+7xGjH24PzG5uwhW6OW0qkm1MhJlH5bR0/neZx+IwV9r9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=sleMDDIA; arc=fail smtp.client-ip=52.103.32.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="sleMDDIA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXZbQORrLcJ9+edCBuXgbP2zUeWF/Dfi2AzFkoB08rCa+zTpeXDbL9hiFmBikLdwwrUIpC+EWO7B+ekDSIDhcDwzQLlZzOMukcusOFb5B3cNixUKPRJz6+bYNp2HYi9neR4RQjxpqC1t8LTbtzRCkrKfsGZscFGPwDhgMPtD5jgxc+TnyxvRWH6xJKnZzwC2m7EuF9H0huWt7AocoDWAf8NLunVCbf1+3tF1HKeItU7sglxY8WaauxbwsBYdBmg6Q12Wdd26j+Lho6B8jrQIozsz9n51MmE9wzsc/zHYEzvB7CCY2HOUnEXVXIVVZDswojnAwmx39ZHAV7sHIUoSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryFqaO+rQhraZR2ifp2jFuWx2aOrU6hXjEJ0DMH9o20=;
 b=OJpDvmfdiyjqHC4WuqNbAF31ysom1SAwnKiEw4/mfqXKeacJGWNhXqTRzlMJlynBGH/EsD0nVTaAbsMWKJSRXyxzCqMugTjFagAf4KhX0qZ/eH4mXEQGl3I52mu0QaVyK2pNQrHJC8ph+id6Qjnxt0oqMUW+hhq2xFzhwqWXYOM0hz/WAmWqfZX3hID8gNpKE38k3byBahKFLTp0qLPSc5VufmUHLmhAiHq0HgZqGRr7IXre0ORHVXqZb+JbHSAfziKbQtUpJJOVc9zes7vZfGhTK6bBIuE3z0Nrrad8jopvoVlz/hUKyag3CXfne8iNSUvd5jrOmzVafn7Ue+kpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryFqaO+rQhraZR2ifp2jFuWx2aOrU6hXjEJ0DMH9o20=;
 b=sleMDDIA9sEx88ls/aTFsZio5Bxvjst27IF2Z5f2h+M5uQlefN8+vIAar3AMfZKqYdPDuJVzub5+8y2l1n2M2WwHJKABLrqbpmEz4JZMvjy7yuc75CyOndTmoMJN0awzMbgITBKomdPeLsqtphEd921Le8F9adR/KnWSp0eKOEYjib13jgSTsSqrcWHKgg8OBcdaYOGfO+ZMFerf8RMyUSWPQmUDQJiDcYMc4HUvlTxNMdEkR36dVoIsL5H9Qsd9flXPi5SEFrF3qY7xykFoGe8YiPFVM9Mq0hjvpxn34mxq/k8ybzQf9atkFbbYmBUK3m6KEfcMSMRdP5iYbY4Yjg==
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6b0::11)
 by GV2P191MB2334.EURP191.PROD.OUTLOOK.COM (2603:10a6:150:d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:59:24 +0000
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883]) by AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:59:24 +0000
From: =?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
Subject: [RFC PATCH 4/8] ALSA: core: carry the untruncated form of the card names
Date: Tue, 15 Sep 2026 17:59:04 +0200
Message-ID:
 <AMBP191MB2886BF75AD878F97C3CC8D3FCEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
References: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <20260915155913.421839-5-otzelot2021@outlook.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|GV2P191MB2334:EE_
X-MS-Office365-Filtering-Correlation-Id: e73ae14a-5168-4256-096e-08df13424f9d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|55001999006|41001999006|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|25031999004|22091999003|24121999003|40105399003|12091999003|26121999007|2607281247196008|56899033|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2daa3lrbldVL2tTdm1DY21EOGhUNzVBUDB1eE4wRWE5cUJvcmRXdE5IL0ti?=
 =?utf-8?B?MDdnNWlxZUZZNmhYMHdyNHJFa1NaTHJUdHBKNk10M0VDeUFjL1AvRVdJRTRI?=
 =?utf-8?B?WG1yNWhHSWdESHowSUZwU2lCZkl6R0M5MDdNMXpTaFhTaHVrNDRMdFQvSmdr?=
 =?utf-8?B?L2RSY3FvWTBRaXJ3bzRGbmIzem9rNElWUDZBZnpqUUlqZkl0UWJzdHJtajBO?=
 =?utf-8?B?WUxlWlZlQ2R0VGc1a3NleU9sN2d4RUx0c2c0MUE1MHF0dzh6bjZYUTU0azU0?=
 =?utf-8?B?c3l3NEUvV1IvMmJ0MHFWT0RyQjhtYTd5RmVBeUFWTlpiZ2lyaENPSldqZHAw?=
 =?utf-8?B?WFpML09LdFRJL0pNTlkreFQyeCtiTHZ6MU5KTzg0STMvaytTSnJwWVpOVElk?=
 =?utf-8?B?NW1MS3Q3UFBxUUJ2eUExdFozRlM0TW42djl2eTJIQmtOSEFRazdGQjBKMmJZ?=
 =?utf-8?B?VVZ1dnFtZGFkZ1UxV2F3bnM4MnBBbDUyNnh0UDJrU2tlTzJiKzdiaHpJdTQr?=
 =?utf-8?B?YUFlZWZMWk9ZMXh2NW5aNmYyQ0hGNEFkZkxwZThWSklWMVJzbHBieXQzT0lo?=
 =?utf-8?B?ak5LQVJadEV6TUJlWU4valppWkNrOEpvTnZLcnpvcnA2NnlBQUh4R3kvNWxS?=
 =?utf-8?B?cnNIclM1bDN4MVY2d2VGMlJFcUlFeTVWL1R5M20wcU1OZU9MdjcxaURaMHpv?=
 =?utf-8?B?SzJIaGdiemY0QWg0cEkwOTlXNi9uZC9VbUI1eVpxM1dxaWx0RUM2NXh4akE4?=
 =?utf-8?B?UUcrWEg0TWNUTU5kdEhEMEVmWi9lR1ZhZU5HOWtnMkZSUVlZdUFyU2RiUmVq?=
 =?utf-8?B?VitRcFgxbXE5RnBzM3BDMC8wK0FMQUNaL1FPL3N6dmU0NWVrZG0vZ0s0UzUy?=
 =?utf-8?B?S1hCV3BjNjhJVlBPWGd1clkzTE15cGVSN3ZneWNSeUMxVWorR2QyTGxrWGgx?=
 =?utf-8?B?Q3pyYzFCRjJwOE90UmR0aDFaa0FWT0l4Vm5MZGFhTU5LeElpaEUrNEdFU0wx?=
 =?utf-8?B?emREc0Ixd0ZUWjFWbjlVWlpadlRCTFJUNHBOcVRSZGFSaXNlUC9ZTkZOUkxk?=
 =?utf-8?B?WnhtTkZDd2hReWNmaUVXZ0pDUGN2S0t6aHI4QW1ZRVJWK201VStNd2xMMFBN?=
 =?utf-8?B?RVprbHB3L2hUS3dpMzV6NlJyNVN0WXdsUEhLU1E5eExKYlNrVWFlM1hhSXNW?=
 =?utf-8?B?NEMrSEtRL2l4eUh3ZjlyU2FxVE1LNmI2dFAwc2pzL1E2RnVBbFl4MU43VEdO?=
 =?utf-8?B?aDVQK3pabGJWRmZucVNMNTVUTndkUXVXMllGWGEzaW5ITXRZck83OExXV1lP?=
 =?utf-8?B?SEhkOFNqY3BFeFNCSm03N0JrN3QyQUJhOFh2TEo2Qi9GNFFwT1FCQkxZYjFM?=
 =?utf-8?B?RjdUeVRDZUpnVm5JL2FXejVOc1Zyd2VpWmdScVpEWmFzeEJHeDFtSzNwSGlW?=
 =?utf-8?B?bDE2NEtOdkhaYnFFbkpIQmcwR2hsOFMxRUNwUklTMGQyKzB2SEtMV1A5aDJq?=
 =?utf-8?B?REVJb3U3WGtrU1pqaFlSNEJvVGdpaCtxTW1YSk5LcGlPdDc5K25UdHFjK1c1?=
 =?utf-8?B?Ykx2TmxuMGt1NC83M2ExSjc5N3BueEFsbWNLdmp1N1FNNmZHYUtNYXhsb1hN?=
 =?utf-8?B?QWVVb3RMblhKNGo1RHM2R1JIRFp5Q1E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzRWR0tFMEtVNGhqdmFNYmw1MmcrZnA4ZDlvYWRkTXkySCtqa2xhUFE4Uk9s?=
 =?utf-8?B?dzhXR0diOGhIekxsV1dhU2RsWjZwSDJMNEtOQ2tEaEJKR21nOHdDUStxcnJD?=
 =?utf-8?B?dUFXemhBSFhXbzZZZjlodzFjL2xRMG9RNTBnT2R2U3MxbnZqbFBmRUV0bTAv?=
 =?utf-8?B?Szk5VVVWMGtpdVJTT09ZM3Z0WFNVQTZLMFBycnVPQzUyb00vaEw2ME1jcXFu?=
 =?utf-8?B?dlZPOGhzbkpmUVVTUS9lWmRnbng4dHU3L1Fid3gxaThYS0duMENoZERyOHh5?=
 =?utf-8?B?b2l3M2ZxS1ZVMGJEbkNPUjBkeTBNRmh3WklabExzZVJJRVd5TUhLeVl3aXg2?=
 =?utf-8?B?T3l5ckNzVjhhQmxGTVRFZEcrYUJLbk1sZjZLWFlaWkxSajdXTjIrNko4S3Fu?=
 =?utf-8?B?ZmdJT1dwYktzYlNiYjRxczNtR0VZQWhOQ0d4SGl5MFpWQXVGYUVIK0pNdGVp?=
 =?utf-8?B?OVlJVmxhd3Q0R0c4SEFDT1VQWUtFT3A1Ym94dU0rS0M4VE9qTzN4b3J5VU0x?=
 =?utf-8?B?N3N1ejRYcElVNm9KSGZYTnJDb0R4RVN5MFQwcmhESWtxTzdFRHo4NXIvdW53?=
 =?utf-8?B?b3JDZ0srSjBQdU5tVDJhcWZoUG1jNjgrVVhJSzhKU0kvMmYwN21lK3Fhdkw5?=
 =?utf-8?B?ckVmaGpQcmxxZU9MYlBZeGpXK2dpN3VGMjdiT3J5OFJrQjhRN1ZWNGc2c2pH?=
 =?utf-8?B?Zi8wdTkwNEpVQXhIRVMvYVNLczkyKzgxaDdhbUR3TjdWcDFIaFdZcER5Ryt0?=
 =?utf-8?B?S3B0bThmQ0xOMTdiVlBhTHo4VW9obzgwQUlxd1I0emR5blFKdGY0MGlQNm5M?=
 =?utf-8?B?anVPbUxIbzdUOG55THRYWVdLZ05BcFNLZ0RZdngyUlo5bmpQWkJtbEh4VWdo?=
 =?utf-8?B?empNUmpTdU1Md203b1VlSmFMZjFsN2hIcjl3N1cxMWY4V1lBUGMyREt0Vjd3?=
 =?utf-8?B?a1g5Wk96Um9ZSG1QVXJWbjBCSVdOL2wrQVhvb2lHUVZvV0pQODZhY1RmKzFM?=
 =?utf-8?B?emsweEF5aEhBM1JKOVA0dkJLZndOaWhjamIvNjVxWk9NQnRoQ3V1UURhRHZH?=
 =?utf-8?B?VTl1ZkNJZkt4Mzl1WWEvNEt0WXJCN3FYUm9hc1lodmhMREpOd1UxQzYycU5n?=
 =?utf-8?B?WHg3dXgyUjkwb3BKQmI3UWw3bmJsVGl3VXJCRVJxaXZGQ09jalpBVXpIUldP?=
 =?utf-8?B?dDgySFpjN3RSbk5ObGpuWDAyK3V1eEVpYk5tQUJLbTF6WGs1emNIOHRvZDc5?=
 =?utf-8?B?UzM2Z05LTU5NRExuQUZFNXA1TGlGYkNJdnc2MTBxQmtkZ2hNTkRoa1VSakgz?=
 =?utf-8?B?Y3J3T21GUWF1NVpMSThCREU3VXZKd25STU1XZXJGek5WMklHQXpYQ0NIeXFG?=
 =?utf-8?B?QnRmWS9wWk1uTUY3VkZJSHJQYlN1bXYrT1k3WWlpTURoNGhLaGlQTEU4MEdZ?=
 =?utf-8?B?cUc2ZXZwQisrUy85TWsvbURFWUZRcCtyVkxGK0o2dWRkbHF3Y1FibW03QUox?=
 =?utf-8?B?bHdRWUU3WWpZWWQ3ZklFVkY1RC9SOFVITmFtanJUYnd2ak83dW04dGVEZmZE?=
 =?utf-8?B?MEJodzFmSHRxY050QWhUQkRjR2JwSHRsYTFZV3UrdTkvc29UdXVFNjZvSHVX?=
 =?utf-8?B?STFvM0hnZk9TMFUzMTdITHpUVjMxSStHeGM3OU5EK0ZrU21ibEpBVG1GeXRG?=
 =?utf-8?B?Z3hIbDgzM0g1eHczMGhhbFRUbTNXVTJRZ01pRFFIbzMyWkhnZlk2eUNkV3g5?=
 =?utf-8?B?N2d3Ykl1Ny9QdVpYeGZWVHlFdWhoSlBGckVZb2FaL3ZYUHhFbnBxRjNTNlVh?=
 =?utf-8?B?d21ORUt6ZG9HVWxVZHlpUHA2dS9GWVdoUngxQStRQ2RWYlpRTkxMblF1SDJT?=
 =?utf-8?B?blIxekpkQ3g5VnNMc1R2M3ppQ1VDenh1bXptMjhGdDdZcFdta1RaempIZy9p?=
 =?utf-8?Q?ZAACm1xdTnj6luxIGM2wZ1IXZRuE2mnM?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e73ae14a-5168-4256-096e-08df13424f9d
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:59:23.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P191MB2334

card->shortname, card->longname and card->mixername are fixed-size fields,
32 and 80 bytes, and a name that does not fit is cut.  The previous patch
stops that cut from landing inside a character, but it cannot make a name
fit: 32 bytes is eight CJK characters, so a cleanly cut name is still a cut
name, and user space has no way to recover what was dropped.

card->components already solves the same problem the other way round: the
card holds the whole string, and snd_ctl_card_info::components is a cut
copy of it, with the full one available through SNDRV_CTL_IOCTL_CARD_BYTES.
Do the same for the three names.

card->full_shortname and friends hold the whole name, allocated on demand,
and stay NULL when the name fit into its fixed field.  That is the point of
the design: "set" means "the fixed field is not the whole story", so there
is one name per card in two lengths, and never a pair that could disagree
or that a driver has to keep in sync.  Nothing user space sees today
changes, since the fixed fields keep exactly what they hold now.

Card names are UTF-8, which on USB they have been for decades, so the
kernel repairs what would break printing them: a malformed sequence becomes
U+FFFD, one per bad byte as recommended for a maximal subpart in Unicode
TR#36, and a code point that would break a line becomes a space.  The
second one matters because the kernel prints these names into
/proc/asound/cards, which is line based.  Rejecting a name instead would
achieve nothing: the fixed field would still hold it, and readers are told
to use that whenever the untruncated one is absent.

Nothing else is inspected.  Invisible and bidirectional format characters
are a real spoofing vector, but catching them needs the Unicode character
properties, which would mean a table in the sound core that goes stale with
every Unicode release - the same dependency avoided by leaving NFC to
drivers.  A partial range list is worse than none, because it invites user
space to skip its own filtering.

Assisted-by: LLM
Signed-off-by: Luca Rodenhäuser <otzelot2021@outlook.de>
---
 include/sound/core.h |  27 +++++
 sound/core/init.c    | 272 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 299 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index 36bb95044a..c00f091ea1 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -96,6 +96,16 @@ static inline void snd_refcount_get(struct snd_refcount *ref)
 void snd_refcount_put(struct snd_refcount *ref);
 void snd_refcount_sync(struct snd_refcount *ref);
 
+/*
+ * Maximum size in bytes, excluding the terminating NUL, of the untruncated
+ * card name fields.  Each limit is four times the size of the corresponding
+ * fixed field, so the same number of characters always fits, whatever they
+ * encode to: card names are UTF-8, and a character takes up to four bytes.
+ */
+#define SNDRV_CARD_FULL_SHORTNAME_MAX	128
+#define SNDRV_CARD_FULL_LONGNAME_MAX	320
+#define SNDRV_CARD_FULL_MIXERNAME_MAX	320
+
 /* main structure for soundcard */
 
 struct snd_card {
@@ -108,6 +118,20 @@ struct snd_card {
 	char longname[80];		/* name of this soundcard */
 	char irq_descr[32];		/* Interrupt description */
 	char mixername[80];		/* mixer name */
+	/*
+	 * The untruncated form of the three name fields above, like
+	 * card->components is the untruncated form of what
+	 * snd_ctl_card_info::components holds.  Each is NULL unless the name
+	 * did not fit into its fixed-size field, so a reader that finds NULL
+	 * already has the whole name in the field above.
+	 *
+	 * Set them only via snd_card_set_full_*(), and only before
+	 * snd_card_register().  After that they are read under
+	 * snd_ioctl_rwsem.
+	 */
+	char *full_shortname;		/* UTF-8 short name, may be NULL */
+	char *full_longname;		/* UTF-8 long name, may be NULL */
+	char *full_mixername;		/* UTF-8 mixer name, may be NULL */
 	char *components;		/* card components, space-delimited */
 	unsigned int components_alloc_size;	/* current allocation size of components */
 	struct module *module;		/* top-level module */
@@ -317,6 +341,9 @@ void snd_card_free_when_closed(struct snd_card *card);
 int snd_card_free_on_error(struct device *dev, int ret);
 void snd_card_set_id(struct snd_card *card, const char *id);
 size_t snd_utf8_strscpy(char *dst, const char *src, size_t size);
+int snd_card_set_full_shortname(struct snd_card *card, const char *name);
+int snd_card_set_full_longname(struct snd_card *card, const char *name);
+int snd_card_set_full_mixername(struct snd_card *card, const char *name);
 int snd_card_register(struct snd_card *card);
 int snd_card_info_init(void);
 int snd_card_add_dev_attr(struct snd_card *card,
diff --git a/sound/core/init.c b/sound/core/init.c
index 67b79b1826..cabe4da212 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -16,6 +16,7 @@
 #include <linux/debugfs.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
+#include <linux/err.h>
 
 #include <sound/core.h>
 #include <sound/control.h>
@@ -146,6 +147,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 			 int idx, const char *xid, struct module *module,
 			 size_t extra_size);
 static int snd_card_do_free(struct snd_card *card);
+static void snd_card_free_full_names(struct snd_card *card);
 static const struct attribute_group card_dev_attr_group;
 
 static void release_card_device(struct device *dev)
@@ -594,6 +596,7 @@ static int snd_card_do_free(struct snd_card *card)
 	kfree(card->components);
 	card->components = NULL;
 	card->components_alloc_size = 0;
+	snd_card_free_full_names(card);
 	if (card->private_free)
 		card->private_free(card);
 #ifdef CONFIG_SND_CTL_DEBUG
@@ -841,6 +844,275 @@ size_t snd_utf8_strscpy(char *dst, const char *src, size_t size)
 }
 EXPORT_SYMBOL_GPL(snd_utf8_strscpy);
 
+/*
+ * Untruncated card names
+ *
+ * card->shortname, card->longname and card->mixername are fixed-size fields,
+ * and a name that does not fit is cut.  card->full_shortname and friends hold
+ * the whole name in that case, exactly as card->components holds the whole
+ * components string of which snd_ctl_card_info::components is a cut copy.
+ * User space reads them through SNDRV_CTL_IOCTL_CARD_BYTES.
+ *
+ * A field stays NULL when the name fits, so "set" means "the fixed field is
+ * not the whole story".  Nothing has to be kept in sync: there is one name,
+ * in two lengths.
+ *
+ * Card names are UTF-8.  The kernel prints them into procfs and hands them to
+ * user space, so it repairs what would break that: a malformed sequence
+ * becomes U+FFFD, and a code point that would break a line becomes a space.
+ * Rejecting a name instead would achieve nothing, since the fixed field still
+ * holds it and readers are told to use that when the full one is absent.
+ *
+ * Beyond that the kernel does not inspect names.  NFC, homoglyphs and the
+ * invisible and bidirectional format characters need the Unicode character
+ * properties, which would go stale in the sound core; user space has them.
+ * A name is a display string and never an identifier: card->id stays the
+ * unique handle.
+ */
+
+/* ASCII whitespace only; isspace() also matches 0xa0, which would eat UTF-8
+ * continuation bytes
+ */
+static bool utf8_is_ascii_space(unsigned char c)
+{
+	return c == ' ' || (c >= '\t' && c <= '\r');
+}
+
+/* Decode the UTF-8 sequence at @s, which holds @len readable bytes.
+ * Stores the code point in @cp and returns its length in bytes, or 0 if @s
+ * doesn't start a well-formed sequence.
+ */
+static size_t utf8_decode(const unsigned char *s, size_t len, u32 *cp)
+{
+	static const u32 min_cp[5] = { 0, 0, 0x80, 0x800, 0x10000 };
+	size_t i, n;
+	u32 val;
+
+	if (s[0] < 0x80) {
+		*cp = s[0];
+		return 1;
+	} else if ((s[0] & 0xe0) == 0xc0) {
+		n = 2;
+		val = s[0] & 0x1f;
+	} else if ((s[0] & 0xf0) == 0xe0) {
+		n = 3;
+		val = s[0] & 0x0f;
+	} else if ((s[0] & 0xf8) == 0xf0) {
+		n = 4;
+		val = s[0] & 0x07;
+	} else {
+		return 0;	/* stray continuation byte or 5/6-byte form */
+	}
+
+	if (len < n)
+		return 0;
+	for (i = 1; i < n; i++) {
+		if ((s[i] & 0xc0) != 0x80)
+			return 0;
+		val = (val << 6) | (s[i] & 0x3f);
+	}
+
+	/* overlong encoding, surrogate half or beyond the Unicode range */
+	if (val < min_cp[n] || val > 0x10ffff || (val >= 0xd800 && val <= 0xdfff))
+		return 0;
+
+	*cp = val;
+	return n;
+}
+
+/* U+FFFD REPLACEMENT CHARACTER */
+#define UTF8_REPLACEMENT	"\xef\xbf\xbd"
+
+/* Code points that would break the structure the name is printed into: sysfs
+ * attributes and /proc/asound/cards are line based, and a terminal acts on
+ * control characters.  They are replaced by a space rather than rejected.
+ *
+ * Nothing else is inspected.  Invisible, bidirectional and deprecated format
+ * characters are a real spoofing vector, but catching them needs the Unicode
+ * character properties, which would mean a table in the sound core that goes
+ * stale with every Unicode release.  A short list of ranges only looks like a
+ * defence; user space has the tables and has to do that part.
+ */
+static bool utf8_needs_space(u32 cp)
+{
+	if (cp < 0x20 || cp == 0x7f)		/* C0 controls and DEL */
+		return true;
+	if (cp >= 0x80 && cp <= 0x9f)		/* C1 controls */
+		return true;
+	if (cp == 0x2028 || cp == 0x2029)	/* line/paragraph separator */
+		return true;
+	return false;
+}
+
+/* Sanitise @src into a UTF-8 string of at most @max bytes.
+ *
+ * A malformed sequence becomes U+FFFD, one per bad byte, as recommended for
+ * the maximal subpart of an ill-formed subsequence in Unicode TR#36.  Code
+ * points that would break a line become a space.  The result is therefore
+ * always well-formed and always printable on one line, which means a caller
+ * never has to fall back to the ASCII field because a name was hostile.
+ *
+ * Surrounding whitespace is dropped and the result is cut at a character
+ * boundary, never inside a sequence.  Returns NULL when nothing usable is
+ * left, which the caller treats as "unset".
+ */
+static char *snd_card_name_dup(const char *src, size_t max)
+{
+	const unsigned char *s = (const unsigned char *)src;
+	size_t avail = strlen(src);
+	size_t in = 0, out = 0, start = 0;
+	char *buf, *shrunk;
+	size_t n;
+	u32 cp;
+
+	buf = kmalloc(max + 1, GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	while (in < avail) {
+		n = utf8_decode(s + in, avail - in, &cp);
+		if (!n) {
+			if (out + sizeof(UTF8_REPLACEMENT) - 1 > max)
+				break;
+			memcpy(buf + out, UTF8_REPLACEMENT,
+			       sizeof(UTF8_REPLACEMENT) - 1);
+			out += sizeof(UTF8_REPLACEMENT) - 1;
+			in++;
+			continue;
+		}
+		if (utf8_needs_space(cp)) {
+			if (out + 1 > max)
+				break;
+			buf[out++] = ' ';
+			in += n;
+			continue;
+		}
+		if (out + n > max)
+			break;		/* cut at a character boundary */
+		memcpy(buf + out, s + in, n);
+		out += n;
+		in += n;
+	}
+
+	/* drop surrounding whitespace, including what the replacing above may
+	 * have produced at either end
+	 */
+	while (start < out && utf8_is_ascii_space(buf[start]))
+		start++;
+	while (out > start && utf8_is_ascii_space(buf[out - 1]))
+		out--;
+	if (out == start) {
+		kfree(buf);
+		return NULL;
+	}
+	out -= start;
+	memmove(buf, buf + start, out);
+	buf[out] = '\0';
+
+	shrunk = krealloc(buf, out + 1, GFP_KERNEL);
+	return shrunk ? : buf;	/* shrinking does not fail, but do not rely on it */
+}
+
+static int snd_card_set_full_name(struct snd_card *card, char **dst,
+				  const char *ascii, const char *name,
+				  size_t max)
+{
+	char *copy = NULL, *old;
+
+	if (name) {
+		copy = snd_card_name_dup(name, max);
+		if (IS_ERR(copy))
+			return PTR_ERR(copy);
+		/* Nothing gained over the ASCII field: leave the field unset so
+		 * the documented fallback does the same job without a second
+		 * allocation.  This keeps "set" meaning "carries more".
+		 */
+		if (copy && !strcmp(copy, ascii)) {
+			kfree(copy);
+			copy = NULL;
+		}
+	}
+
+	scoped_guard(rwsem_write, &snd_ioctl_rwsem) {
+		old = *dst;
+		*dst = copy;
+	}
+	kfree(old);
+	return 0;
+}
+
+static void snd_card_free_full_names(struct snd_card *card)
+{
+	kfree(card->full_shortname);
+	card->full_shortname = NULL;
+	kfree(card->full_longname);
+	card->full_longname = NULL;
+	kfree(card->full_mixername);
+	card->full_mixername = NULL;
+}
+
+/**
+ *  snd_card_set_full_shortname - set the UTF-8 short name of the card
+ *  @card: soundcard structure
+ *  @name: UTF-8 name, or NULL to clear the field
+ *
+ *  Offers the untruncated form of card->shortname.  Set card->shortname first,
+ *  with snd_utf8_strscpy(): if the sanitised name comes out identical to it,
+ *  the name fit and the field is left unset, so "set" always means "the fixed
+ *  field is cut".
+ *
+ *  @name is sanitised, never rejected: malformed sequences become U+FFFD and
+ *  line breaking code points become a space.  Surrounding whitespace is
+ *  stripped and a name longer than SNDRV_CARD_FULL_SHORTNAME_MAX bytes is cut
+ *  at a character boundary.  The caller should normalise @name to NFC
+ *  beforehand; the kernel cannot.  Call this before snd_card_register().
+ *
+ *  Return: Zero on success, -ENOMEM on allocation failure.
+ */
+int snd_card_set_full_shortname(struct snd_card *card, const char *name)
+{
+	return snd_card_set_full_name(card, &card->full_shortname,
+				      card->shortname, name,
+				      SNDRV_CARD_FULL_SHORTNAME_MAX);
+}
+EXPORT_SYMBOL_GPL(snd_card_set_full_shortname);
+
+/**
+ *  snd_card_set_full_longname - set the UTF-8 long name of the card
+ *  @card: soundcard structure
+ *  @name: UTF-8 name, or NULL to clear the field
+ *
+ *  Offers the untruncated form of card->longname; see
+ *  snd_card_set_full_shortname() for the rules that apply.
+ *
+ *  Return: Zero on success, -ENOMEM on allocation failure.
+ */
+int snd_card_set_full_longname(struct snd_card *card, const char *name)
+{
+	return snd_card_set_full_name(card, &card->full_longname,
+				      card->longname, name,
+				      SNDRV_CARD_FULL_LONGNAME_MAX);
+}
+EXPORT_SYMBOL_GPL(snd_card_set_full_longname);
+
+/**
+ *  snd_card_set_full_mixername - set the UTF-8 mixer name of the card
+ *  @card: soundcard structure
+ *  @name: UTF-8 name, or NULL to clear the field
+ *
+ *  Offers the untruncated form of card->mixername; see
+ *  snd_card_set_full_shortname() for the rules that apply.
+ *
+ *  Return: Zero on success, -ENOMEM on allocation failure.
+ */
+int snd_card_set_full_mixername(struct snd_card *card, const char *name)
+{
+	return snd_card_set_full_name(card, &card->full_mixername,
+				      card->mixername, name,
+				      SNDRV_CARD_FULL_MIXERNAME_MAX);
+}
+EXPORT_SYMBOL_GPL(snd_card_set_full_mixername);
+
 static ssize_t id_show(struct device *dev,
 		       struct device_attribute *attr, char *buf)
 {
-- 
2.43.0

