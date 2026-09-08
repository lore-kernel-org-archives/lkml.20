Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010005.outbound.protection.outlook.com [52.103.43.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0170436F8E9;
	Tue,  8 Sep 2026 05:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788844480; cv=fail; b=jcON8fXMyWBYhMfqzoEZuClU2G7IVDILeGO6saPAM20GG23RUVmg/FDXCWzoG7cMI9lgiZFJeS9ikrgrtiIBAw9qeN4x7pcOS5LtlUecxB01rjN+LakTHQ7SYtdmWZOFQHsC04OuTMw+Jytk31b3bnNQtlisFN8lhf4RcBHJQIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788844480; c=relaxed/simple;
	bh=69oJQP7Asu89f6eQ2jSYywne/6XpW8pQTNr7kbv+fxw=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=Pp09QaSQoBX7a15oGDgla63mynIHxI+upr3o7nDVCh/2sP29l8tW39SpV73Yz79rhZHA9Q7pIOkeB9UJUxzDGR9NGPDRcyZQlYEsJmvq+ttVadayUVzs/F4uyVFp+Mgdpq/OYG7T8Ar4QrMY31jNfV/LfatcgRGlqhIb+nVWgNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=f5IyC0oV; arc=fail smtp.client-ip=52.103.43.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="f5IyC0oV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYkq5pKc1fJnFUWucam9oec/nYO08vNrR5xnHJnOAhA+eG6FI+Hvi2OQVrmM1MsYFJlcj7MacTmzg+ItUwL+5IsCALS7SC+X9ewLKTwVKCZ/xTLv3tDNkcrhtI0HAbYzPT0G9p1V9ItmWGrlyaS0j+RqQ7K1M6031798MmVmiKbXCoFoWN03ieWmBdCE2xV9TWJIkSOu34MkiR6dp+yM4MTzx5VSWXOI+8NR9vjrmG47FSN1MeDQ38im0ZwjmEJjqBnTxdRIX+OsSrg2T4iWXo9nr847xBGpvz+kqJJpMRfeh8n/rPYrjf6DtoKCyXsutX772Q/AeYCHCQiJBPD35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkq0iXi3it1Yx6UiaLWWhgOnb8jNrLiEw4Rg9mmIT7w=;
 b=UDWt6T/DBbvymuNE15PJ69gD7vm/iYfVLoADtqXSC/Lxd/EoHH2sdx2VeZQ0H5mh4wqm4Kct7yEJr54hGXuouL3EL9qiWYYJIiu/NxTGi24TIdUbjQgTK3A4CgyOBxr7TRc9URBHvuWXV5wT5NcQT41AglT7Y2hwvn/H6tK5+IRYDqJNb/WR3zhteXY9HB8Ofkgq2qDx2bYleRKKZSUVkFCuu3ZGURxw/Xx4o0CNufIAPaPH5YomfXtfcAmmaxyV8Fv6LszPGUYxq7inUExYZlVzwQNR34zs84Nbq2ctKlhY1n8PibqdFkfk+JDwt1lQRuZdIFHsjMvvJ1Bm/TX9iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkq0iXi3it1Yx6UiaLWWhgOnb8jNrLiEw4Rg9mmIT7w=;
 b=f5IyC0oVXY3eOezDwg6RTXlncd6iF3+6wd45xZPAI7UEeUuh+l/Ugnj6Lyo7UtlNEhHGTTcTfoGZ2WkFJyBqY8l/l87fEFdgC7HMo9uJYusRR0KMtHGusIz1zlhjIeUsIVcBAxdRMklCDtQ3GVhL/twKXUF785gfYXufe2IhBbLASK76u4E0g0odYSpEwjvILU6xu1peDrpraoKfEcVclMc3N209Ln8rruJcTlTtMfbc6IukYkk8vp9pAj9E6szPbgerQe7YSBLwTRq8Np6/K9rfK91U0nE0IXSKe4GlyeyvjeZxc3dk/NWh1xw0PXXMr0CZTgfal5zxYiqNWBNImQ==
Received: from TY3PR01MB10206.jpnprd01.prod.outlook.com
 (2603:1096:400:1d9::14) by OS9PR01MB12357.jpnprd01.prod.outlook.com
 (2603:1096:604:2e0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 05:14:36 +0000
Received: from TY3PR01MB10206.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ddc7:e52a:f875]) by TY3PR01MB10206.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ddc7:e52a:f875%3]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 05:14:36 +0000
Message-ID:
 <TY3PR01MB1020607FB346FA33C71EAF844DAB12@TY3PR01MB10206.jpnprd01.prod.outlook.com>
Date: Tue, 8 Sep 2026 13:14:25 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US-large
To: tiwai@suse.com
Cc: perex@perex.cz, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
From: Seas0 <season1277@outlook.com>
Subject: [PATCH] ALSA: hda/realtek: Enable headset buttons on ASUS TUF Gaming
 A15
Autocrypt: addr=season1277@outlook.com; keydata=
 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
 bcxa5ph3Lcgy5F3EcVYzlQ==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS6P279CA0004.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:30::16) To TY3PR01MB10206.jpnprd01.prod.outlook.com
 (2603:1096:400:1d9::14)
X-Microsoft-Original-Message-ID:
 <51d4938f-3ede-451a-9b9d-13241c6dbaca@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10206:EE_|OS9PR01MB12357:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1942fc-d08f-431c-73c1-08df0d681313
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|6090799003|24021099003|5072599009|25010399006|51005399006|25031999004|19110799012|23021999003|8060799015|15080799012|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVBDdVpBUVd3WXBaKzVNY3I3UzNKbkF1M0x6SUpGKzg1TXlHa3pyL1hMWElP?=
 =?utf-8?B?K3RuRldCRnc2Z3c2NHVFZC85eVdoRDlDTTBCM1BTMXVSOG9QbVNBM0JFRDFH?=
 =?utf-8?B?M28zSzJYczh4b1NCci9lb3YyWHJoNVlMTlpSOW8rWHNXSENLRTQxbG9SdHZX?=
 =?utf-8?B?TEZsK3llTm4wNUlJakV1YUY0cEJIcTQ2UTBDUW5hblk3UExWMDM0NWZaY2Vq?=
 =?utf-8?B?UXorcEdySnhmRmdpZlJSbjAza3ZsUi9XVUVuc215aW8xOEpBYkFQQmcxVlNU?=
 =?utf-8?B?eFlHOFUyRkYxcFgzNWh2NVlYT0FqQmxkNmY2U0N3SjhYNlFudENOdlpkV1Nl?=
 =?utf-8?B?ZzBKTXpndkNVekJRdWl5SUt5Y1R6QisvSVk2UHFXUjVoUndXaU5hbGI3OExm?=
 =?utf-8?B?ZXpOYVVOZGM2dStKZnV3dGNmT2wyd2EvdUFSYUpkckQzd3dSdFMrN09oZkt6?=
 =?utf-8?B?NHd4RmNCYUxnMStVWVY3ejJsNDMvcHJxaG4yelNvak96SnJ2T09nVXpLVmJl?=
 =?utf-8?B?NWxHazNZWXpJUDFmTEFYeWZHK1VaZVJaOXUzYzFmbjlvOUl3Tk9hbDdXZ0dF?=
 =?utf-8?B?SmllUU56Z2poL24yelhJUTBpaE1sMVFQLy9ld0cybHh2Um5ReXRLeUkvVCti?=
 =?utf-8?B?dG1rVGc2L0FpbXI2RDFIZVZ1eldxTUUvRm45Z09iTUFmMEc4cVNrZXFBejVW?=
 =?utf-8?B?amxnb0NJdjJIa1l4d1VWN1ZPSVBicUNTUndVaGI4V2M1Um5sL2R3aW0wb0lB?=
 =?utf-8?B?VWZTK2x2dlNBRDJZVkowZm9FdDF6TTFVR0F1Qk11MEJCSzRRYjNMNFlscHdM?=
 =?utf-8?B?QzRCbDdlZVZYcXNEN1RYZWl3Wk9GSXA1NTRTbUdJTG1nQ0RxZ2hYS3FhTU5Y?=
 =?utf-8?B?bWxOcTRzOCszUFN5OG9IU2xlYXR4KzE0ejJRdU5hMVh6a2VQN00xZmRwQnVR?=
 =?utf-8?B?a1BlNXh0by9RbERwNXRZMlArRTZKMFloa3RGNXIwWjc5MnVSTThuaGRITW5N?=
 =?utf-8?B?UkluaG1qRTdVK0JMbkRZZGorZjl4clhFbEF0VnkyWGVQVjYyZDhyQlVjbnF2?=
 =?utf-8?B?YWFIUURHTVNXelJCT2wrV01RS3dPbW5JZk1MelYwR2ZvQjV3NTBhem5jdDc0?=
 =?utf-8?B?c1B5UytlaXlZY252ZTdMYWpqTHNsVUVJak1XVFdGZ1JDdWlKVFJsTklzWXJl?=
 =?utf-8?B?b05lNTlrYzZhbDlrWS9kTXA4K1AzMDdCa3NMdVRhMEZxemp2S2ZjVUtzZFFH?=
 =?utf-8?B?UUErY1lJcWJYQnJtMWJlYjNlWmcyZjltbmJsSEtidlVqQlNRQjdZd25wMHV5?=
 =?utf-8?B?MlFwRlJDMzFmZ041bHRFT1RBdExTdHEwdkRTSGhpWjZDM1pDMEJLWlFhUFB0?=
 =?utf-8?B?bENVeEljRWJRZVE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enFLYWtlemN3bDJJSmhudU5jV2QraEZNT3ZLVjZuT0hXUGF0ODJhRkxKdHJt?=
 =?utf-8?B?UkdkTFZLMWRRV1AwdWJ1aHR3WHpnRVhxdzk4cFNUcEQ2ZVFGc3VIR25KaGxk?=
 =?utf-8?B?ckRMblNvWE13cnE0elE0R2I5NEJYdFBQeVlKOHVuR1B4d2JFSXBVbmdDQWdZ?=
 =?utf-8?B?aUwyYVY3SFoxZXBVbEROZmpJZllRVjVFSGh1cmhndUhCTW5YMUU0TGIwQmFW?=
 =?utf-8?B?eWhqUVJ2dUhxKzBJUWhqUS9uOVJxMXF6T0hLelVISWM5K0JpWWdudjZhbno0?=
 =?utf-8?B?MHVOblRjSlY1TGZFTzZUZGo1WGNscG5rdDNxUGYxN2lXc0NzT2dQNW5URWJo?=
 =?utf-8?B?dmo3WHJRNlZsckE0RjlWTnNRN1BabmVmcEpZV1ZrNmUzdXlHSEI2RVJhejVx?=
 =?utf-8?B?L2JVeVlaMmppbGNSMGljQmo4cnJhaXVOOU8zT2NQWlBTZDZMa2owWnNRNks1?=
 =?utf-8?B?dmNzV2hibWN4TUhyalV3TC92Y1RyQlJCV1hodUFnSmxLUUVnVnczMnNMRFR1?=
 =?utf-8?B?aUVubFFzOUgwSkdoUkhOeXNCR0JrN09DWmxZdy9uT3dMT2xQTzBqNm9jeFJM?=
 =?utf-8?B?Q0pjbVVsNmNxcWw5bmFMQU04cytTeTZ4TzZ4eG1OY3p4SGlpZDNWV1MyZEpP?=
 =?utf-8?B?YUw3Ykd2VHptdkZ5bGREVXBzSG40ZWRVaFhPVnB5ZDZhN1B3UUVlaFVEa1B0?=
 =?utf-8?B?WERjRjVFUVJPL0tCL295alE4YVIxUWdMNTdJNjJYTFJJYTZTMWU0K0dZaTVV?=
 =?utf-8?B?UEtBVnJpV0pxRHNBQkszRDRnRERLK2M4OWtaVUY0Q1hmM1BlZm1ISUFmVVY5?=
 =?utf-8?B?WThjNWlrTkUvV0FhV3d0YTMrOEZUUkhWLzdsc01iamFIWGc1ZDZjTXlFUEJE?=
 =?utf-8?B?MHFhb2JLR3A4UlNPR1F6L2JkRE1lMWgrL1V4NnpUcVdtUFJlZ3QvdjJFV1lH?=
 =?utf-8?B?YitHdGNzOGNhYmtZVS85MTg0UVhmcVhFQUNsd3BkZFJ2SWxjUnNDR1N6b2hP?=
 =?utf-8?B?OVFvbTJXS00rSURrSHRDVlp3QW5JcFVzSmdzNlN6c1dFaXNmUXpLZW9kakNM?=
 =?utf-8?B?K3llbmRZZWlCVElGcmxVeGlKWmx2M1VkcERUODhnSmFFWXNBMitRcDVNUEVj?=
 =?utf-8?B?bVQya2JQVUF3bEdrSkF1c1FNSlFPMXh6RFc3RWxqWjRaMDhKWkV5eGtBcUND?=
 =?utf-8?B?b2VFME9IK0xsREo1aTlGVmxhVThKc2ZhVFhyQjdvTVZBdGVXZXhSZFk3Mk1E?=
 =?utf-8?B?ZzVnTVNnRktTeWtFbnoxeEFpSVlFYks3blh0TUNCMHVpeWY2em5GdUZCalNm?=
 =?utf-8?B?c29PMlZMVXV1WVg3OUtOaHJPcEU5cWI1TTEzVUtxZU1nc3JnMHZXamc3eTUz?=
 =?utf-8?B?dDFQdlIvREV3RzlURmFlWkwvdXVPLy9URVZuNk5UcUFGSDFwWFJ1NWxKemxO?=
 =?utf-8?B?aHRrUHlaT3JvUU5vV1lIdUNPQVpETHZXNEF5NXJhRElUMDAxZ3lickNycTln?=
 =?utf-8?B?L0FGNVQrRUNoWWN3RmNGREk3YUNhVXRPWDk4MTE4V2ZrbmhpclROZFg0OTdn?=
 =?utf-8?B?NmxXTWNFZzY1ZlVwMjJwakNFaWw2bThGQnFrSlRpajRlRGcxZ2ViL3ZFNDBi?=
 =?utf-8?B?Zktjc1dYU1FrMlhXa2VsZGNrUmRGckFtV1piSUxkSGZaejdlQTNyZ0l5WWp6?=
 =?utf-8?B?VGE4cThaZ0FnNk1KeTZkSXI5OTI2K0FPWFVNM3RPeVFnWjF3aElmRXgxeVp4?=
 =?utf-8?B?OXNyUUttU0VvS3JiNElSK0RXNTlqUFZvVENPVGkrZnJKSEFyRWk5T2RRLzBz?=
 =?utf-8?B?YjVONUhxakZIUXZKWkpDQmZKN0EzTzBEUWJNU0hiQTRsMS9odWhOeXdYS0Jw?=
 =?utf-8?B?ek1HS1RsL1R3Z045bEJ1aThLYWw3S2t6ZnhVSU9LMDFuNVE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1942fc-d08f-431c-73c1-08df0d681313
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10206.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 05:14:36.2087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12357

Inline headset buttons are not reported on the ASUS TUF Gaming A15
FA507XV/FA507XI with an ALC256 codec and subsystem ID 1043:14b3. The
existing pin quirk selects ALC256_FIXUP_ASUS_MIC_NO_PRESENCE, which
configures the headset microphone and CTIA/OMTP detection but does not
enable the headset button decoder.

Add an exact PCI subsystem quirk using alc_fixup_headset_jack to enable
the existing button decoder and key map. Chain it to
ALC256_FIXUP_ASUS_MIC_NO_PRESENCE to retain the microphone pin override
and headset-mode handling when the PCI quirk takes precedence over
pin-based matching.

The same quirk was tested on an FA507XV on a archlinux installation with
kernel version 7.2.4 with a three-button headset. All buttons produced
clean EV_KEY press and release events during the test.

Assisted-by: Codex GPT-6 Astra
Signed-off-by: Seas0 <season1277@outlook.com>
---
  sound/hda/codecs/realtek/alc269.c | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ecc9c6e6ab98..9e33d29a3c15 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4175,6 +4175,7 @@ enum {
  	ALC286_FIXUP_ACER_AIO_HEADSET_MIC,
  	ALC256_FIXUP_ASUS_HEADSET_MIC,
  	ALC256_FIXUP_ASUS_MIC_NO_PRESENCE,
+	ALC256_FIXUP_ASUS_HEADSET_JACK,
  	ALC255_FIXUP_PREDATOR_SUBWOOFER,
  	ALC299_FIXUP_PREDATOR_SPK,
  	ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
@@ -5718,6 +5719,12 @@ static const struct hda_fixup alc269_fixups[] = {
  		.chained = true,
  		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
  	},
+	[ALC256_FIXUP_ASUS_HEADSET_JACK] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_headset_jack,
+		.chained = true,
+		.chain_id = ALC256_FIXUP_ASUS_MIC_NO_PRESENCE,
+	},
  	[ALC255_FIXUP_PREDATOR_SUBWOOFER] = {
  		.type = HDA_FIXUP_PINS,
  		.v.pins = (const struct hda_pintbl[]) {
@@ -7756,6 +7763,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
  	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604VI/VC/VE/VG/VJ/VQ/VU/VV/VY/VZ", ALC285_FIXUP_ASUS_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603VQ/VU/VV/VJ/VI", ALC285_FIXUP_ASUS_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601VV/VU/VJ/VQ/VI", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x14b3, "ASUS TUF Gaming A15 FA507XV/FA507XI",
+		      ALC256_FIXUP_ASUS_HEADSET_JACK),
  	SND_PCI_QUIRK(0x1043, 0x14d3, "ASUS G614JY/JZ/JG", ALC245_FIXUP_CS35L41_SPI_2),
  	SND_PCI_QUIRK(0x1043, 0x14e3, "ASUS G513PI/PU/PV", ALC287_FIXUP_CS35L41_I2C_2),
  	SND_PCI_QUIRK(0x1043, 0x14f2, "ASUS VivoBook X515JA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),

base-commit: 4c4e4be4edd5dbf5f7f6a3ef4fc0c243f2d01b3c
-- 
2.55.0

