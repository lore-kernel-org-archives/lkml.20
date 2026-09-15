Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011030.outbound.protection.outlook.com [52.103.33.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED94AEBD4;
	Tue, 15 Sep 2026 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487975; cv=fail; b=nXMhqlX6G+HhTU4ptKZXChtpYshMEdr7jFrxttd2+/xMJh9vBUy8Yd+kHlpGB2RLRS16gpEZgs8Km7RC1IfDlYLh+R0gkH4GgRvsVD0/1ftrKi4BIacGdbBpncS4YyYqTbpaSxowAlV3MAB17N6eu7mTo7QCzsiPEScZC8Xa1No=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487975; c=relaxed/simple;
	bh=gbsZJobuwwtGGeFx2oLJqIQa1X0pnBnlKLDbiFZtfeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WIjMeW2soMgPm9pR+HurDrttRmwF0GDqLHNemvGmWE3kFzymaYLYCBqkEXhdfehMeO7MAsEIeQkzMudk5HVoph6YB9aHovkgcFLZ9HtRypkiHtGiEWMOouUxATVK+Z62sCmwKvAsSOKOrmikCtWRbeouRmkiA9AR7hF1K/i7oxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=sRfirAoH; arc=fail smtp.client-ip=52.103.33.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="sRfirAoH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9jx1XIkSFrOwJc/YR4gfCWS8ojtfbl3BOfcZmbuFC4M7QSJxyPp/zrzfTOeBs4mI74FPq4NQ7djEd868Vqie9Ti0q3gKwSvfM0to1sGLuulCZIpXTD+zBKdytDYwpzh5oNNW9zbVdAp/ZLS73Jjry6f//sUGRzgyYnT1LLMvOXmR2iJ1JWGVtYD1xu0JPWnSnZ8U4RofyNjaNZ43hQJ8AO5rX13LoCX/7ahV3SsoELCB4n8Rzwjtr0hS+JWSEo6qakFXaJTK/AVRoPd5f5IPjKM4Rmy+JNKjcHY2xBDuvkilT78J7jxX9/zQa2ZHRidMhsSgGlJjO4ykFydAf0BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWiN/rYj+yWpopeyvzkeZkAmKaMX69NiePw3rFiB7Yo=;
 b=XBVeXVc+lBiDqNyDxh22m6PzJxGBOxkM4UF+sE3vgvCItNgKxi2tN0SUNCn64SbvWYvElwAo/QrGDqnB8uOUsTahiBSb5ty32hs2ZUwVsYGLGWrrRaNROwTGG78lBqVDlzzRFc/EY7+f5JYTqi5LvjS7eV5oE189VewdJC9ZwAd/4+clnTF/BUMhGZtDxXCNF+Zfp0WSNNkD05RzchfsHdXqV3JsuhizN+NuYtW+gP7xqmOF+3ar6LAojAYW+QzkPvDUoHGG8yZ7CN0pGZHM4nKa7ZQvgkxgDPfa9ps5Q4EpzGCg20zc0sZhHWavBdUe/eSJgypOpH7O/pvMvmdhag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWiN/rYj+yWpopeyvzkeZkAmKaMX69NiePw3rFiB7Yo=;
 b=sRfirAoHmuXkPYWZXde6TfJt8fYma1TXxgVs5MBnJLtz1hTl9GrRmpZq3RI41qG+UUWKfrGGPNcTQe0JtWHHEFAEVCv8CRa7YjXxO9E3XesF5dHfeV17gagF3OTUq+DSj4gm2fcpDTDiSgfef1kF5huT1LQeR05NLx2z+Qas4KKLbHT1apDO7m+CIKaDoA4+bnOfwriafTl9QxMvWZ+SDP1rTCVFTCzB3JlPoSDp5PWZ/26Z7rjdZlxL5B+0JA/a5y15LOHIhLc55g2rJHAMqsSJSNZgx8WAK8RidbCmkSbjdUBVMimvek7GVL3dbgDU+P6UstGO713UEjm9XTcnYw==
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6b0::11)
 by GV2P191MB2334.EURP191.PROD.OUTLOOK.COM (2603:10a6:150:d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:59:23 +0000
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883]) by AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:59:23 +0000
From: =?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
Subject: [RFC PATCH 3/8] ALSA: usb-audio: don't cut the card name inside a UTF-8 character
Date: Tue, 15 Sep 2026 17:59:03 +0200
Message-ID:
 <AMBP191MB2886FE324872FC9C7674C507CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
References: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <20260915155913.421839-4-otzelot2021@outlook.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|GV2P191MB2334:EE_
X-MS-Office365-Filtering-Correlation-Id: d603dcb7-ed01-4721-3cf4-08df13424f68
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|55001999006|41001999006|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|25031999004|22091999003|24121999003|40105399003|12091999003|26121999007|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bElXajdxdUpvVkorLzgvWG4rWWZmbEZ4MWczNHozSDNlVUttcHhXa01nTVJN?=
 =?utf-8?B?dGdqeC9YNnMveU5NeUlCUGdrb0I3dmFkNTNBcnBFM005ZWxhVVJIOC9UZitV?=
 =?utf-8?B?U1dJd2E2YS92Vms1TW93U2hEVEJITVg0TmhsMTk0dE1VRGFxelE3YTF6U3hX?=
 =?utf-8?B?c29KekgvZEZVaC9zNTh3Q0tOc0svTkh6Y2tUR0k1ZlBiSnZad0IyN0I1bW4w?=
 =?utf-8?B?clk4TVJxelgxTnBuWHd2VW9RNnBKTHFJODZnUnlPMjFwbDdyQmhsY0dCRkVS?=
 =?utf-8?B?STJ6U0VySGNmTUhwc0VhV2ZEQXJDU2dnSXlWNEZyK2pUTHFYVlE5c0FTcGlw?=
 =?utf-8?B?TXdSWGJuL0NBUldNYlRPWkM1N01RWU1RUytSR2s3OHlmQkNGdzNUcUhoY0VO?=
 =?utf-8?B?Q2k2ZE5iYnJCQ1pPV3AxUDVkQmlGdDRBbGVUaGxEaG1meGNRZG01cXVxQ1Qw?=
 =?utf-8?B?Z28zMjlwd1JZcFlLUFEvdFNYMCtvWTVXU1g2Z0Yvem1LN0FYZStTOXdwN1JB?=
 =?utf-8?B?RGxORHNtVkVFQXMrcTdsYklWTGIwVzNJSHZIdGV5aC80WkpIV2N0ajBQeGh0?=
 =?utf-8?B?bjdQb2pLaDRxNExYZlBKUzRrbGNwbGtPQjlwZE1SNitsQUdpWGpqeHJNdzIv?=
 =?utf-8?B?dzNmT3FjaFhZZERnSHA2UTFub2FoL1k1Z3V5eWJjaWw1YUdvRTUwSWJDM3Q1?=
 =?utf-8?B?aDFpVHhqTnNxSVBiQmJjS3FwN0MvVnJya0U3WWtPdnVYTXB5UXFxVjVIREd2?=
 =?utf-8?B?cFlBcUw3cVZuczF6NnVQbG0rYlQ1amxMUHZzN0kzbkd3cm1rMHV3SzU2L0c4?=
 =?utf-8?B?SmxpdTVoaXJOa0hicHBTQ1g3V05qbEJZWENGQVZMblFhd04xWHI5cmkzdnBF?=
 =?utf-8?B?YVBXcHhHYjhNdDIxRVJKQVZLcFE3NTBrNzJzR29oK1huZEpFRFZGdDZlYlBW?=
 =?utf-8?B?dW9RcXVaU2syaEJyVVZxbkRRendzSmZES054ZXNWQnRYcE4wZGhTMDlPUk5W?=
 =?utf-8?B?RDgxVW5KYTVMOTBOL2ZiQm45UHVZdm1sK2J4ZFB1RFZVenZYMWtpMHhuQ1J4?=
 =?utf-8?B?MVFmR1Nkdk1HMVBlc0E1UHFxYjB4TGU4TVNkNFRxNlVYU2RBbWRoUmhzcjFk?=
 =?utf-8?B?WXFnSkx3YUpHaVpGR0NPMmkzaU15TGZrSDRRZjRVYWhlemIvSjlWU0FjT3FY?=
 =?utf-8?B?QjhuN0hOeTJ2em9VeTNiaG5lR244UEtJcUQ3SDl5R1h6bGJWVGpWRzJ6QUxu?=
 =?utf-8?B?U2VzUUYwME0wSUV1N08xNC9meE5vdDFDMDAwRWJsTWJzWmJJUWczVXhhcmJV?=
 =?utf-8?B?blVkalg3ZEJWWGhBaFArN2dxUjFwdm1QWVJIYlNEK01FL3NSTlo5c2tTVmFj?=
 =?utf-8?B?WjIrUS9kQm9wY3NjSisvWjVleDJVSWI1TSs2MjBNREdBTlVYZ1hQZFpoMlFh?=
 =?utf-8?B?QkZoY3cySGd0Q2tZMzdCaEpjVXVBODJ2MERYd3QrYm8yMjRSVnpKRkVaZzNi?=
 =?utf-8?B?SEh5QWhwNVQ3N3k3U3NLMDg1VEFNMm1LRGcxejlUNWhmaS8yUDE3SzlkaGda?=
 =?utf-8?B?UFQyUzY1MmNtVFdPRXVhR3JRbHBvNTJrNFZ3R1kxVjBHcHJ4UjVNSWJibjU4?=
 =?utf-8?B?cE5NV09ESkpFZ3hVc1Z4YlhFSHB0OGc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTIwbGhaeWRxY2d5aFpXaE1XL2pTTytodkxHeWdOMGdlbHZDdWs2VWNKbmdr?=
 =?utf-8?B?bFhONm1xUzIxazhFRENHa3phSTFjaXkwYjh6WGZQbXhLc2JTOElPTVB2dzlU?=
 =?utf-8?B?TGNZMEtLTEM3WkRrQXZNNG9SdWNUQ0pYOVIrZ1RTdlFGSy93Rm81UG9QdDRm?=
 =?utf-8?B?ZTJSNStpUnBHYUJKRzJOdGE5N3hPTy80d1Jlc1B5TFNzd29CcStkaXY0a0do?=
 =?utf-8?B?QmJwd0IrVFZscG1xQjNwR1VDcjV4NWdKYUpGWjBWU1JzZ3l0ZFkyWEUvb1l6?=
 =?utf-8?B?b1Fva0FaQnp3YzFjMFNjTHhtRjUvTjVHRGlZZjZJeW9sQlVZaHczZjZuTVVw?=
 =?utf-8?B?dVVsUWxFQnZ3TkRFMTFRZkpJNU4xaHQrYnorRmk2VFBRME5ma29EcXJ6TmVF?=
 =?utf-8?B?NFR4VjNmalNDZjhFYm9TUUpINFd1RUpxSlM2eWdkWTd3ejlqb3lFWXlGbEpJ?=
 =?utf-8?B?SHBuWUYzbzNUM0pEZ3pvYnFPMWZ5RnhKeUtEZEVUdmNoc2lZMncyV0NOeExR?=
 =?utf-8?B?ZUNBKzRuZXMxQVloNjBwZWpHSDBFemdsWkExQlpXd1MzWWtYd3d0N1R6YnBP?=
 =?utf-8?B?VGR0b3pRd2Y5MWxiRjFYQ3FDeTYzcHFnakxtYWl3TlNoOGM5Vk1IREdKQmUy?=
 =?utf-8?B?YTJ4UjF1bVNldzljakJWVTJYYURlbnRGdzNseXBNTFJFazBvVVBRU2JBRWoz?=
 =?utf-8?B?TUJ2TFpKaERiYk5obldsTW01amlYSzBMSmpSMmFBSzE5azZTOC95Z3RlQlRv?=
 =?utf-8?B?L1JraGw3Q2I4em14dm5YUmZ1QmcybENKUlA0c2ZtU2o4TUcwcjZOOXV4QlZq?=
 =?utf-8?B?ZEcyTXJMVW5ndUNEWkFpTmtKcHA4d1dsdWpjeEJ1aFhmeGRZb1FUbzRuZ0NY?=
 =?utf-8?B?cXhtcUFIUXJxYTI2WkVyM0RhaXVwaHZvOWdXSHpiK3l0SHFOb2dIb0tPbU4w?=
 =?utf-8?B?MEErWUp4U1FBQVhEMDJCb0RVV0I0NWhpYzFQT3U5VzVBMk0za3UrT0x2ajR1?=
 =?utf-8?B?V0c4dUx6ckZDOVpjYlZ1YU8yWjJQdVpuTUU3aEp5Z2FneUh6Y1VXTTlsZ1J5?=
 =?utf-8?B?YmRocHhlZ3N6anBlZkpEcjJQVnYvTndXdUh5OElzQ1BqOElSOW1oK0xtTU93?=
 =?utf-8?B?Z2FxbFQ4T1Y1VXNPNEMzNjNzb3JZemo1WFNuaTJPT3ViOExDbHVRS1U0Rkhr?=
 =?utf-8?B?RWhiTHIvNFp6eE8rQ1pHb21SLzRTZWJpeTQzSmpUS0psMEU1U2hNVU9HSDI1?=
 =?utf-8?B?RXZFTStCa0I3aVBMU1RrT2xTeWZ0ZVE5WlUvNnp1ZE1iSlVrRWx6YTQwa1JR?=
 =?utf-8?B?WmNySVgyTXpqYW9BOFJQVmtLRkt0U1RNYjdzemRTeUdTNXdkS0dieHdzckdP?=
 =?utf-8?B?dHVwOWxsVnQxK0VWdWh0dTlzM2trT3l4K0RqVHJKTEthTVBWT3JaUWsrQjY4?=
 =?utf-8?B?Q1pNa1hqYXFiKzd0b1o4ZXdXOFFqVDZmQnkxRjhlQXlKcjZFMFdPTElwNGh2?=
 =?utf-8?B?MiswaGpteFlEQ3Q0OGttUHVrdWhGSk1OZUcxTHZuZUdvd2F6Tzc1Tm96QkhG?=
 =?utf-8?B?YitBWDBHc2dhM3VtZWxTNjdhUkVOd1phYm9ITURmM2RPODkzRitEbjdONXla?=
 =?utf-8?B?TjdrOHBWcUg2eW5jMFRVZmpzLzFWc1NBbkQvVGVYOVViLzFHUS9MSzZTOWc0?=
 =?utf-8?B?SGZEU2JrdGltWGZYNE90WEJoMHZ1OXoxaWI5TGlDY3JYczYxL0EwN3BCUmVN?=
 =?utf-8?B?NThXeHRYNGRRVGtWM2pUMUp6d05tQUZFSDFydWoxcEltVDYzR1VCQmhEdGEw?=
 =?utf-8?B?NWl5STBVSnU3RTdQdHRINEhsOUZFTEZtaDdLME03N1ZBeE1oUlZOeGdQK1Fs?=
 =?utf-8?B?cStycUl4azN6Z2JHdjdzLzRiTlVHeDAvSUIyNU1kZmZxSW9GaElERFp1dTRq?=
 =?utf-8?Q?PQTrrG3HYjv7CoNsd/GxSlrzt02416vE?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d603dcb7-ed01-4721-3cf4-08df13424f68
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:59:23.2406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P191MB2334

usb_string() converts the UTF-16LE string descriptors of a device into
UTF-8, so dev->product may contain multi-byte characters.  Copying it into
the 32-byte card->shortname with strscpy() cuts at a byte boundary, so a
name that does not fit can end in a partial sequence.  What user space
receives is then not valid UTF-8, and it cannot repair it: the missing
bytes never left the kernel.

Add snd_utf8_strscpy(), which behaves exactly like strscpy() except that it
ends the copy after the last complete sequence that fits.  A name that is
too long loses up to three more bytes than before, but what remains is a
whole character.  For pure ASCII the result is byte for byte what strscpy()
produced, so nothing changes for the vast majority of devices.

If the string turns out not to be UTF-8 after all - more continuation bytes
in a row than any sequence can have - the plain strscpy() cut stands, so a
device with a broken descriptor is no worse off than today.

This is worth doing on its own, independently of any richer replacement for
the name fields: it makes the existing field correct for every reader that
is already there, without changing what those readers see for any name that
fits.

Assisted-by: LLM
Signed-off-by: Luca Rodenhäuser <otzelot2021@outlook.de>
---
 include/sound/core.h     |  1 +
 sound/core/init.c        | 52 +++++++++++++++++++++++++++++++++++
 sound/core/sound_kunit.c | 58 ++++++++++++++++++++++++++++++++++++++++
 sound/usb/card.c         |  7 +++--
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 2ca24ac7e3..36bb95044a 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -316,6 +316,7 @@ void snd_card_free(struct snd_card *card);
 void snd_card_free_when_closed(struct snd_card *card);
 int snd_card_free_on_error(struct device *dev, int ret);
 void snd_card_set_id(struct snd_card *card, const char *id);
+size_t snd_utf8_strscpy(char *dst, const char *src, size_t size);
 int snd_card_register(struct snd_card *card);
 int snd_card_info_init(void);
 int snd_card_add_dev_attr(struct snd_card *card,
diff --git a/sound/core/init.c b/sound/core/init.c
index 2b33dd7b42..67b79b1826 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -789,6 +789,58 @@ void snd_card_set_id(struct snd_card *card, const char *nid)
 }
 EXPORT_SYMBOL(snd_card_set_id);
 
+/**
+ *  snd_utf8_strscpy - copy a UTF-8 string, cutting only at a character boundary
+ *  @dst: destination buffer
+ *  @src: source string, expected to be UTF-8
+ *  @size: size of @dst in bytes
+ *
+ *  Like strscpy(), except that a string too long for @dst ends after the last
+ *  complete UTF-8 sequence that fits, so @dst never ends in the middle of a
+ *  character.  For pure ASCII input the result is identical to strscpy().
+ *
+ *  This matters for names that come from a device: usb_string() converts the
+ *  UTF-16LE string descriptors into UTF-8, so a product name copied into one
+ *  of the fixed-size card name fields can otherwise end in a partial sequence,
+ *  which user space has no way to repair.
+ *
+ *  Return: the length of the copied string, excluding the terminating NUL.
+ */
+size_t snd_utf8_strscpy(char *dst, const char *src, size_t size)
+{
+	size_t len, tail;
+
+	if (!size)
+		return 0;
+
+	len = strnlen(src, size);
+	if (len < size) {
+		memcpy(dst, src, len);
+		dst[len] = '\0';
+		return len;
+	}
+
+	/* @src does not fit.  strscpy() would cut at @size - 1, which may land
+	 * inside a multi-byte sequence, so back up to the start of that
+	 * sequence instead.  A sequence is at most four bytes, so a longer run
+	 * of continuation bytes means @src is not UTF-8 after all and the plain
+	 * cut stands.
+	 */
+	len = size - 1;
+	for (tail = 0; tail < 4 && len; tail++) {
+		if (((unsigned char)src[len] & 0xc0) != 0x80)
+			break;
+		len--;
+	}
+	if (tail >= 4)
+		len = size - 1;
+
+	memcpy(dst, src, len);
+	dst[len] = '\0';
+	return len;
+}
+EXPORT_SYMBOL_GPL(snd_utf8_strscpy);
+
 static ssize_t id_show(struct device *dev,
 		       struct device_attribute *attr, char *buf)
 {
diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
index 0376112cc6..d462462543 100644
--- a/sound/core/sound_kunit.c
+++ b/sound/core/sound_kunit.c
@@ -299,6 +299,63 @@ static void test_card_add_component(struct kunit *test)
 	KUNIT_ASSERT_STREQ(test, card->components, TEST_FIRST_COMPONENT " " TEST_SECOND_COMPONENT);
 }
 
+/* snd_utf8_strscpy() has to behave exactly like strscpy() for ASCII and only
+ * differ where a multi-byte sequence would be cut.  The escapes keep this file
+ * plain ASCII; \x escapes are greedy, hence the split literals.
+ */
+#define STRSCPY_UMLAUT		"\xc3\xa4"	/* 2 bytes */
+#define STRSCPY_HIRAGANA	"\xe3\x81\x82"	/* 3 bytes */
+
+static void test_utf8_strscpy(struct kunit *test)
+{
+	char dst[8], ref[8];
+	size_t len;
+
+	/* fits: same result as strscpy(), NUL terminated */
+	len = snd_utf8_strscpy(dst, "abc", sizeof(dst));
+	KUNIT_EXPECT_EQ(test, len, 3);
+	KUNIT_EXPECT_STREQ(test, dst, "abc");
+
+	/* exactly fills the buffer */
+	len = snd_utf8_strscpy(dst, "abcdefg", sizeof(dst));
+	KUNIT_EXPECT_EQ(test, len, sizeof(dst) - 1);
+	KUNIT_EXPECT_STREQ(test, dst, "abcdefg");
+
+	/* too long and pure ASCII: identical to strscpy() */
+	len = snd_utf8_strscpy(dst, "abcdefghij", sizeof(dst));
+	strscpy(ref, "abcdefghij", sizeof(ref));
+	KUNIT_EXPECT_EQ(test, len, sizeof(dst) - 1);
+	KUNIT_EXPECT_STREQ(test, dst, ref);
+
+	/* 2-byte characters: 7 bytes of room hold three of them plus one ASCII
+	 * byte, so the fourth has to be dropped whole rather than halved
+	 */
+	len = snd_utf8_strscpy(dst, STRSCPY_UMLAUT STRSCPY_UMLAUT
+				    STRSCPY_UMLAUT STRSCPY_UMLAUT,
+			       sizeof(dst));
+	KUNIT_EXPECT_EQ(test, len, 6);
+	KUNIT_EXPECT_STREQ(test, dst, STRSCPY_UMLAUT STRSCPY_UMLAUT
+				      STRSCPY_UMLAUT);
+
+	/* 3-byte characters: two fit, the third would be cut */
+	len = snd_utf8_strscpy(dst, STRSCPY_HIRAGANA STRSCPY_HIRAGANA
+				    STRSCPY_HIRAGANA,
+			       sizeof(dst));
+	KUNIT_EXPECT_EQ(test, len, 6);
+	KUNIT_EXPECT_STREQ(test, dst, STRSCPY_HIRAGANA STRSCPY_HIRAGANA);
+
+	/* not UTF-8 at all: a run of continuation bytes longer than any
+	 * sequence, so the plain strscpy() cut stands rather than eating the
+	 * whole string
+	 */
+	len = snd_utf8_strscpy(dst, "\x80\x80\x80\x80\x80\x80\x80\x80\x80",
+			       sizeof(dst));
+	KUNIT_EXPECT_EQ(test, len, sizeof(dst) - 1);
+
+	/* zero-sized destination must not be written to */
+	KUNIT_EXPECT_EQ(test, snd_utf8_strscpy(dst, "abc", 0), 0);
+}
+
 static struct kunit_case sound_utils_cases[] = {
 	KUNIT_CASE(test_phys_format_size),
 	KUNIT_CASE(test_format_width),
@@ -310,6 +367,7 @@ static struct kunit_case sound_utils_cases[] = {
 	KUNIT_CASE(test_card_set_id),
 	KUNIT_CASE(test_pcm_format_name),
 	KUNIT_CASE(test_card_add_component),
+	KUNIT_CASE(test_utf8_strscpy),
 	{},
 };
 
diff --git a/sound/usb/card.c b/sound/usb/card.c
index 9307da95ef..a83c51a3d5 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -630,9 +630,12 @@ static void usb_audio_make_shortname(struct usb_device *dev,
 		return;
 	}
 
-	/* retrieve the device string as shortname */
+	/* retrieve the device string as shortname.  usb_string() hands back
+	 * UTF-8, so cut at a character boundary rather than at a byte one.
+	 */
 	if (dev->product && *dev->product) {
-		strscpy(card->shortname, dev->product);
+		snd_utf8_strscpy(card->shortname, dev->product,
+				 sizeof(card->shortname));
 	} else {
 		/* no name available from anywhere, so use ID */
 		scnprintf(card->shortname, sizeof(card->shortname),
-- 
2.43.0

