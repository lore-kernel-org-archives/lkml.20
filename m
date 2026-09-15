Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011030.outbound.protection.outlook.com [52.103.33.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464524AE13A;
	Tue, 15 Sep 2026 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487967; cv=fail; b=QNNWj4GMVJ5lnVUnfxAQ/ILq+VUEsRTrSIO+KBZb0i70oH7Y0wQ4iAvELqjKpMATI36azMdZ1w6gNeifkjVQzE2GNcQirltOCVo1rKl0lNVlvs9JCE8MDOflWzpjHXgNOl5jD2/Sp3Fp6b6dQmCMEG8lI1c7hNI12yNdfVWnaMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487967; c=relaxed/simple;
	bh=XIYPBvWy9big54+yfz3nN8Jlfnvrj2cUQFjBJ5JbQR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oYEvZC8Ni3fwIAaQaFdoGRvQoZUfzzbP+90LLEba6Jr2/rdDLn3sG/wTKJYJHVEFbvghQJ+xk2e/R4TihPQXGyfmSdUTTgQj6NKR+PTBL5J5YNXQnI3sYwRh2uUjhGhY2tiK2jfw6HQljr/wEkdsSClGROuEnUqWICOa1KtJ3Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=SnObwIIK; arc=fail smtp.client-ip=52.103.33.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="SnObwIIK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeWsyvV81afCAYJ+EG19Gr+rYUBQ+5arw/u8jhA85IWpsiUh6MmTNEb6qJtl2oH4FKIppR8cV/tD/4lqNGM44d8UAkWZSUvE1lIgyK4TkPVfS6K+Kv2AX9IUL2gvstz8nYwQEjiI/uPphsKRV5K+dQDoSdmgGbQ2uPPfROO5lgArvmWomLV3uIrQfbIXIXZdMyIDP6naIjA20KjNi/AeD8zXBs8DiwaqmjLG0fCqqYt8OIa6MoweAZxS3t0LYiA2bm+woEE9zbAzvH4a2XFNTjy4Gp/U8/EX1GoQH8WmO13JFYQz1FuiJ/3SlxPyT83WuZM+xfRuG7QWth49lXxfJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5SysOqpISiY2rOwBIzD/pv8FXRpsUWYJUBVKtbpqZA=;
 b=dWT0KkmHmtXM55C4735owGtm5Q1+2jy3V0SY8J/bNEHnhtJ7zCaVsyKI7gGCy/94UAPKPcRVhTeRGPqzb043gXkr1ihqzJyluDE/szBq3/YeM8vq4PhLlxVWZIGWvQgdi+WunquPhNQb5ZGsH5xa/Bkx7q3pWFQCauru9QRiPCaR6TScR1XigMO7ZO4SGCGflFZe8btmVmm0intd5Abnc5enZSviMvzujT3pm6V5idOzGQ/uUuoLeRfal+ZNRz8MGuD4TepAiSoLONTeqlEhxxgKuQbyK7DLGFFvqpeEgM+ky0RL3olQttYq9Q6FKNBZIxniytXhRzj+pDzrH2JdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5SysOqpISiY2rOwBIzD/pv8FXRpsUWYJUBVKtbpqZA=;
 b=SnObwIIKKs5+SUNfOgkpOneaivC0lCOnr4znU/dCLMfbZ3Nj53rgvLWYeQ71e6yTIBq5454MPrnKcfNH+gYKMdBlyNZd+de6cKQdKjqRj3KVBoKIziZlWWURf+oW5zdfMiGZsNiVte7TWn0sB1GXJpNgc7vsQFpoAWmd2mcoADmWAh0QeC/Of34Npu+ii7N+lYg9VOENz+9NtyKlkJRicjNiBjMzqX8+NteuCXIKuvmvGNgVKAJhQP5E0AWQ6zt0ULyxBRWSy/dzfdBpCM4f3W6wtBUE1NTwR9k16Bw55t63azMhXhDhd6RwMYeR2mt1sL8X2tmECPh7t4vNEeSa7A==
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6b0::11)
 by GV2P191MB2334.EURP191.PROD.OUTLOOK.COM (2603:10a6:150:d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:59:22 +0000
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883]) by AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:59:22 +0000
From: =?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
Subject: [RFC PATCH 1/8] ALSA: core: keep non-ASCII bytes out of the card id
Date: Tue, 15 Sep 2026 17:59:01 +0200
Message-ID:
 <AMBP191MB28863B6CE1C116E63E043CFECEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
References: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <20260915155913.421839-2-otzelot2021@outlook.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|GV2P191MB2334:EE_
X-MS-Office365-Filtering-Correlation-Id: 884b1773-def1-4530-e316-08df13424eef
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|55001999006|4140399003|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|25031999004|22091999003|24121999003|40105399003|26121999007|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3h3VjB2Ny83bmdsZWwwQnVXVEZvVjlmNExJNms2ZTZONG8yTXhJUHV5RWRZ?=
 =?utf-8?B?alFhM3lGZ3FEY29vR1ljMTY1bkx4QjZJUGJodlYzTnlpUHQzZUZ4ajJub3dH?=
 =?utf-8?B?MkQ4cDIrd281ZnJWMFhWeFJQbG1INTZxNHk5Qm1FYWhFQXhNSlUwckJkVTNz?=
 =?utf-8?B?S1lyb2ZyN24rdHlWVGtwdlNYN1oyRFBveTJZRnJqaHRSS3ZRa2Q3VHdybnV2?=
 =?utf-8?B?UDV4T1lwTXp4M3FyYlZzQ2piQ21PektkZFlpSDVoUmdYUU5sTURFMDBocXpa?=
 =?utf-8?B?OXh0VnVNTUN6ZXlpNldUL2diUCszSUJRMm54dEZNcnNkN3JrWVdIU05vVmFt?=
 =?utf-8?B?YU50R0xSdFJld2VlaFlTKzlMdUR4UHFKS3VVc3UweHplKzd2RGJkMmpzb3RS?=
 =?utf-8?B?T0VzdFlCTmphTWlINUNHcVdzaVQ1T3ZQMWpxNkNVODZYSkx2QWhKd2hGcFJC?=
 =?utf-8?B?MWRQZE1YRzZJT1VXemxTUnM5enZmTEliSGhDNERsY2h5N1BYeU9wbHZ6OEpE?=
 =?utf-8?B?N0l0V0RaTnhSWEdrVVdjeWJ3UjdMNFE1TGZqTkxEZ2pLRXRWNXRQWCsyQjBP?=
 =?utf-8?B?RUNpK1RkTHZJS3VIZVJFWUlnKzM1VFBUNUhZNnhYc0ZRbkQwN25pZU9sSnNz?=
 =?utf-8?B?RkMyVW50Y1c3UEZiK0dGL2c0N3RacWJ1cnp4WkN0c1kySFJ4cDgwZ1kyM0di?=
 =?utf-8?B?U2dQNTdWZ3B4dEFHK3NFWHJSOHdVUXhhRnRoT0pVWWdBYXFwR0xtekpUYTNV?=
 =?utf-8?B?QzF3T09SdlNGd2lNNFRjMHo4U1BKSjNxWmxIby9UVkpNb3JKWTlISEpvSmJs?=
 =?utf-8?B?NVB5OTJOc1JhQldFYmw0QVBrczlGa1B6RXI3VlpBK3ZiSkk0dmFIVElQcFk4?=
 =?utf-8?B?RTFGeHNZbnNzWGFLSU1ZZVJBMGlYVFh0emxvd1lmYmY1RytybXNkMmdGeGtN?=
 =?utf-8?B?d2gwQzFPdkx0bVdYWklWTDY3bjlYMFo1Z2RvTG9NN2lwMHhSZzMxYWJWZDJR?=
 =?utf-8?B?YVdwUm52R1RHeldOYk5RZ2t5dWlHS3NHbGZ6OXNBb0JsY1U3YTgwNFpNOFR3?=
 =?utf-8?B?OW1uV2xmVVEveWRyRnVVZlhkNFJOYU1MenI0S2h5WEplQTlJcUU0NGNSbmtn?=
 =?utf-8?B?QXZUUWVMVEIxeWwzbGF1MTQ0Um9QdXdnNVFqd2tZV3lVMGMzSTYydnZEMVRM?=
 =?utf-8?B?QnhsME55TEhPKytUNGF4M2hVZWdXcnllOGEyNzFmQTZPVnBYa0U2WklvM0Yy?=
 =?utf-8?B?TjlvYTRGQTJRNVc4NE4rVjZGaDZTOXZDcjZqUllYbkZObmlWakdrNW81U0sz?=
 =?utf-8?B?a1U3Wm5PR1NnRnZVemdxVlN2TFhjZTRCWEZBV1FDdkVnSGVVMHR6QktiRnNz?=
 =?utf-8?B?b2M2V3VBZFNuOFVZRURzajRhRi9vdDA4K2tLNFJ2NGZ1M1dVNmk4ZVVsSHBQ?=
 =?utf-8?B?U2xCYkdTRHlvalo2OEFodDlKYzVuMzArcE56WlhNNkZjODJBRHdkY2MxWXBB?=
 =?utf-8?B?eVorY0czbU5VZENEZG80cDRqbjRtTmxLdHNsUXFWWEo0YW5hdW9rNldkOU53?=
 =?utf-8?B?RnpVdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S01Wdndyc3lyenlrRmtGUzh6ckJMVFFOaGQ5SWtmekVneHcrOEZHbUpMcnJF?=
 =?utf-8?B?UU1iV211UXFDZmZSQ3Nva1pzMkpOMTl4VmNBajB1WXRvZW5KRVZYcTRoN25S?=
 =?utf-8?B?K3lWd3IybmpvYUJaWUJqeXBCeVFMOWxVYXRxVDFNMm5lRk1FUEo0VTVnand3?=
 =?utf-8?B?eldDMFpFTTRPcnpNS290c2FKdHBpTXUydTNYL3ZndjBmZmtJeVJHY0ova0J0?=
 =?utf-8?B?alBlL3V6bXpvMjRiUE5jK2ZXZEhPckdLeEVRSm1VeUc2NEg2YS9LUGJaaDdT?=
 =?utf-8?B?L0JLUkpPYktGQjVTYnh1RDNaaGZ0cDB4M3BDY1BTWmFkK1lWVUxJOVc0a3Iy?=
 =?utf-8?B?bVorOXpTc1IzaVlUUWs2enFDZ2FPaFQ3Ti9MZ2o0ckFsdDN5bTlwZW5ZUzM4?=
 =?utf-8?B?cjREc3Y0ejY2MFV1T3MyOVVBVlVkb0pHa2FQYk8yODU3R0VrK3ovQUp4RDdl?=
 =?utf-8?B?Rlp1Z2E1MG1ic3JVcEkxdVpqRU5xS29aL1J1aTJPTC92dUNZOERndWIxMEZ4?=
 =?utf-8?B?OGpiY3JXWkRYamNEVmlvRUxVZXBBWFVPeHE2eWVCQVhXYVYrd25kOEpPbUli?=
 =?utf-8?B?WGRZSW91OUVLQnJWcXhoM0daOXlOOG5hcjA4bTdzVHFCMTk2cXlSVytmeXVh?=
 =?utf-8?B?dVJqeXdpQm4rVW5JOHloSWxVcUd1VzNMeWVESVJiTy9lciszcDhUSDY3V3Uw?=
 =?utf-8?B?K05TYkhnUEEwTTlRVlVKR0FxSnFKRm4wSmFuYW1SSVBObzQ5M1QrOU1zeEtz?=
 =?utf-8?B?QkFPc3BtamkzSHZFcUJ6cmZiQXkreUlFMkpyWTlPblVudmlXNUgxOGxzU0w0?=
 =?utf-8?B?YWhRU0JHVHNXMmFKak05OFZyZDZ0czRjeEI2VGptaStBMVgrL1NLTXBveWJv?=
 =?utf-8?B?cjBvL3B6SmZmTUczOXNSRFFnL2ovOVlwRU1OVkc4MStXcTRBblZBNi9DSklK?=
 =?utf-8?B?bVBJY1BYeWxlbFFZM3Iya2hPOEpXQkc2dFNYSU1wRThpSEh2Z1hBR0NwT0VL?=
 =?utf-8?B?TnNFMFBSa2JKM3BTd3YwZ011TXI4UCtYa1dMcUw1ekpJVjlFVXB2dGdWM2JW?=
 =?utf-8?B?ZGpMYkh4U2FoUy83aWIrcTBISWZnS0xVTkljUFNzUTQwNlQ0a04rMTh6RHRu?=
 =?utf-8?B?czd0bHJmUGthbjl0aXdxc2hkYnFKMHB6THM3VjgzZmFYMlFtYldHaEFveHJB?=
 =?utf-8?B?VStqZFlBZGVBb3AwaWxySFhucnBuN2xMcEJyNUZ3ZkVuZnkrdkRVSDJOWUFG?=
 =?utf-8?B?UlRCRGdpdkpLSzVTdmRhRVAyTjcrN3Q1TC9HZ0dJVVExYlZWTUY3Nk5kOXM0?=
 =?utf-8?B?QkNxUWhrM3QxbzRYMVROQzNmN2MzdEM0SStub2g5Yms5QnNCZ2dmWWd3OHU3?=
 =?utf-8?B?M09zVmFqSHA0WXo4dU40M0ZZbWNUMUNlano4a002MStWOHlvNTVpcmtIRVdj?=
 =?utf-8?B?QjlmRk0yaUZjS2gxSDlmbzY2aHlkNHgzMXI5QzlsUm1CQnhLd3UrVUo2Vm1J?=
 =?utf-8?B?WXZ4VUlSUnV4MytvaHp0anNMUEtTcEV2QjEzOGxzM2FQSzkrVzlOTlg1blJx?=
 =?utf-8?B?em0yaG91NHpQaUg3c1ZmeTcyY0VtbmE4ZG9vZko1NjgrMXRvSTN1NStKTlVk?=
 =?utf-8?B?VnhkYjNWR0ZmNVBWdjhtVm1WWjRrK3E1d0t0ZEFoY3dHUEFPakdKWEtvZmFU?=
 =?utf-8?B?emtoZWpqbFk2cXlGTm1WNm5zbkRsREFiRWdxK3grMFhQNW5DQXdSSHFTdUZC?=
 =?utf-8?B?amhCaTMwNFM2ci9XWWY4MXJmTzA4UEV4eWVnUWhkOXlRYVBzT29wTmNZZUo3?=
 =?utf-8?B?UFJ4TGFWV3dpU2tnREFmMm03VWdYRDdxa29zWnBVb1dqRzZJelAyTGtIUDl4?=
 =?utf-8?B?ZW1nR3dHSkxBSXB0QzBYSm9wcU9jNUtjYktYcE9RbGpINHp0dFpKZm1KUW12?=
 =?utf-8?Q?30RmmJfrpoQnlNSNgh4FKHDNCMZOE/x3?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 884b1773-def1-4530-e316-08df13424eef
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:59:22.5028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P191MB2334

copy_valid_id_string() filters the source string through safe_ascii_char()
everywhere but one place.  When the name it derives the id from starts with
a digit, it prepends a letter taken from the original string, guarded only
by isalpha():

	if (isdigit(*nid))
		*id++ = isalpha(*src) ? *src : 'D';

The kernel ctype table classifies the Latin-1 high bytes as letters, so
isalpha(0xc3) is true, and that byte is copied into card->id unchanged.

A USB device is enough to trigger it: usb_audio_make_shortname() copies
dev->product into card->shortname, so a product name whose first
ASCII-alphanumeric byte is a digit, such as "\xc3\x84" "3000", leaves
card->id starting with 0xc3.

That matters because card->id is an identifier, not a display name.  It
becomes a directory name under /proc/asound, it is handed to user space in
snd_ctl_card_info::id, and it is the handle in alsa-lib's hw:CARD=<id>.
The sysfs id_store() path rejects anything outside
safe_ascii_char() || '_' || '-', so the kernel currently produces ids that
it refuses to accept from user space.

Guard the byte with isascii() as well.  A non-ASCII first byte then falls
back to 'D', which is what the same line already does for anything that is
not a letter.

Assisted-by: LLM
Signed-off-by: Luca Rodenhäuser <otzelot2021@outlook.de>
---
 sound/core/init.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 9693e646b3..2b33dd7b42 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -707,8 +707,13 @@ static void copy_valid_id_string(struct snd_card *card, const char *src,
 
 	while (*nid && !safe_ascii_char(*nid))
 		nid++;
-	if (isdigit(*nid))
-		*id++ = isalpha(*src) ? *src : 'D';
+	if (isdigit(*nid)) {
+		/* isalpha() alone is not enough: the ctype table classifies the
+		 * Latin-1 high bytes as letters, so a non-ASCII first byte would
+		 * end up in the id, which must stay alphanumeric ASCII.
+		 */
+		*id++ = isascii(*src) && isalpha(*src) ? *src : 'D';
+	}
 	while (*nid && (size_t)(id - card->id) < sizeof(card->id) - 1) {
 		if (safe_ascii_char(*nid))
 			*id++ = *nid;
-- 
2.43.0

