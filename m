Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011030.outbound.protection.outlook.com [52.103.33.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731435AC03;
	Tue, 15 Sep 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487971; cv=fail; b=tIVxqg/e4QMD530kzj238HEUi6qeIlSfLISs1nMoKBIKxP/MJAt/CuC7NnWQcNFB3rwdoNZrdPCIKh8B1nvUHYRkuQE+2DbJW3YE7EfMShogpsbhmol3ps2LR3o7cRwKrIfC8yYri+t4jaVUNWfe+IigyzgxnMp/9hUhQPNDDMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487971; c=relaxed/simple;
	bh=q3+D5Kfq/3Rw56J5Y3uKc6S7M8PW7ypCSUr81L+ChgU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p0Ku/os1CNzfnoOnnrYcBDbZYMbAESKLV2myGBTnfEK0mJy3Axsf1k+KEfGW4H+E/aw0ShBE+x9YiNar85FeP8hGalOnK7dcOE1ifEwvYiWSzHyxYI81WUrU2zfX6Xo8/L3gqRZ3VYlK2CnHaF0nrra8RP9i1lvRn+fQJevHuDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=kkMFDq4e; arc=fail smtp.client-ip=52.103.33.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="kkMFDq4e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/nK+DEG+GKdNPBTn89dCn4GlsvK+3B0zFUw3GL+9HFtzcY+04SyS7sSNiQIZP7+/qVq6rLyreCV5l8TbmoLyBLZzt2mt2EhadlAXs3yVeRXDfyxRuMj0wSKJbyBjVoCFHRnLJQa/jVYRVnMzbSVFBTyfFPUl7Vvilbd4BCKYr6VRdnfNwGDKm5Mddc2vK2LmBJ4vHdep8BUhmY0kKz6P/kjDaG3VNg6xKFYiHD4bpUfej68a3PZO6bvaqtoaHQH/jRQVxane56j6xP8Yy6lkGvGGsaEeoXP4EioYyEbsXW1m9hqz+XYVpzBTVMeaa4ipy6IzeFXB7qmOgYBL1/HRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNLJ20R7CVgBMHMxyrcj0Xv0lokdUSdycinChYaoCVA=;
 b=XMRN+vzqjjZyr6r1lj16V36MmajF53aiWjZjld9si7fflH8BF+FpcJxr9PQ27R0ujKxPY9sjdoEfuddCOo61TD6Cqt0cyegbuYfdkjl4e7HCow6gAqv7Cd7rOoVuAm7EgLUpAh3OPwPxjQ6q74Edq5MPfmWMluUBqH/M1wwovC5ZGRk/+a9tprW/thLOdx4IZOa/w1V7ilK7KzxPrw6wgbeBnsfh0EvAA1DdrupRrwV6QXMr6cUfWwdiLNfYHY1u6lCSwRd+v2Vn1hMQf4Ez01Jg4YxtorLAt0PDM4UUvEjiNpra5Brjcahhszxk3VlNh0whQ5Fw1VLp/LjZVhjWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNLJ20R7CVgBMHMxyrcj0Xv0lokdUSdycinChYaoCVA=;
 b=kkMFDq4epGvWRzUTYQleNXUI9HC6ln9eUIesfUiy1yvV4Pll5TOx2r93sp57uO2RAgknoMx14OHjNnzqms2S1Z4wuIH54cQaHbW59PZOtHMo7Rv79ODw72J46eRZ9B3Y6jcyNA03z9w05vL+mLlq3oxZyBq3xov7PQRpbMiThanjlb4DaPF1txkkfCe7c/3uHJ88Jg5/5WBaSP1R+gMoEWXrg0cplcpmDwKRpHLDD35GEdrd9W7O1lf8Wu9nSmTID8urpsR8EUqcWGltvP2DbFQ/CfOCQ4djEdlaxd+GO1yK8Pil+/xoFCV4rsO66ZEt1FizRWWjn49kFm8nar/AAw==
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
Subject: [RFC PATCH 0/8] ALSA: untruncated card names
Date: Tue, 15 Sep 2026 17:59:00 +0200
Message-ID:
 <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <20260915155913.421839-1-otzelot2021@outlook.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|GV2P191MB2334:EE_
X-MS-Office365-Filtering-Correlation-Id: 645ed2c1-d711-4e11-f512-08df13424eb1
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|55001999006|4140399003|41001999006|15080799012|12121999013|19110799012|5072599009|8060799015|23021999003|6090799003|5062599005|25031999004|22091999003|24121999003|40105399003|12091999003|1602099012|10035399007|26121999007|2607281247196008|56899033|4302099013|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bERaKzB1Yzl1QTU4ZFhrRXNrNGU3SlgvZkRSTnowbUFzdTNKb05XKzRzYVZY?=
 =?utf-8?B?aGlIM2dBMDRqbWg0ZytyWHQzeGY4cUhCbjJjdnpWQ0szWG80Q3VNdk84UUdC?=
 =?utf-8?B?ZXNERmVTTXZtVS9hQk1samJWOHVZaFhJaFRsN3UzU29qNXgxYm5kRThSeGto?=
 =?utf-8?B?Mkp3OUZzaTFBV0hNaDVvQ1pqcFhoSWxhdEhXT3lXeXJEZFkweFVtT0N1WGsw?=
 =?utf-8?B?dmVDRDNsRUY0aW5EU1FRaW1Wbm83b1pDTEdlakUzWkZrZkdZNXR2U3lVNldR?=
 =?utf-8?B?d3pkeGpXN2J4ejltMW1NdFRIUFlpNm5TRWxWUXc5STZmNWdwYkROUUJLWW9r?=
 =?utf-8?B?TW55NkxKM2dwakVnVWNQVDZrYlRwUlFmd0dUemo1ZDhMejV2ZFpBb1lrdnZm?=
 =?utf-8?B?dTVobXhkMkxQVG1pWmV5aG5JamFESEdCMTd0bEFEc1owcXpCdjdEa1JrRWZB?=
 =?utf-8?B?UmZBdi9reHptMEpNbFpFVko5eXBXQmNUV0FrTGltVWk2L2VYVFNhT0h3ZTJk?=
 =?utf-8?B?NmdtMHY4ZmhaSG5Ia0pwYnV0YVVvRmFpSVlheTRqOHl4emJqWkY3WjJ3VE4y?=
 =?utf-8?B?V05zRDVFTks2cmFiZTZwK3FNckVsU2tueTAxUERJMU1CMHo5ajlySU13VS9T?=
 =?utf-8?B?MXQxTEVyejRiTENONHUzM3ByM3Y5VVl2dCtZb3d3RXJjUE1uQitnM2RydFhZ?=
 =?utf-8?B?Qk5paGVoQ0VadkFUR0drL1d1WmdBaFBPbGRoY0piTzR4cTlxekZpRVlWempH?=
 =?utf-8?B?NytBNEYzMStnYUdUZW93STM0VGFJTWdTMzJ5R0hHb1NpaVUrQTgxWUU1ZW50?=
 =?utf-8?B?NEx3NCsyWGtBSk1qRHhveG9PdUQyaU80bEdpMUVnMGR2T3JPTmdLY0Mxc3Yw?=
 =?utf-8?B?RVFnb3lETDZRM084VzNyeU5WdTB0M1JqU2YrdDV4eVBHNzM5TmlUOGwzQTU0?=
 =?utf-8?B?YldzbmtwUk9Zc1Y3ejlMaTRMSzY1YVZUZkpYRFVGajJHdHAzQ28vTzBsWEZD?=
 =?utf-8?B?V296RGxhTkIrd29HWDU2OHhZQ1dPenJiYkl1WXZDYjloQjg1c2NRUnR5bHFY?=
 =?utf-8?B?Mzhaa0VyQ3JVWE8yK3h2WVlKSVVodGpCTHA5dkhLQXd2YnhJVkpsWGZvT1NT?=
 =?utf-8?B?VTR1NDhjcFhDUC90NE5KZ0liM2c2ZFJmUDJ2cmJ1WG5lSHMzT1M0bmlKbW0r?=
 =?utf-8?B?d2k1bG15UFFNalZNb3BnaTIydkhRb3BqMGxHc3ZDQW1HTXlPVmhFRWVsM1Mv?=
 =?utf-8?B?aFN3Y21zbS82b1lHWk83cGNQR0wvVlhhb3h3SUhJeG1KcTBYSkNmTy9SSm4x?=
 =?utf-8?B?dEhLR3JUUmt2WmI4ZU11UGhnV3dURlE3ajcvblBRQk1nZVd1dXJTWUZSVUln?=
 =?utf-8?B?MEw0OG5hSU0vNGloQjFzTHBpeW1OK3JJNUlMVERnaDk2bWM1NU9FekFmSUM0?=
 =?utf-8?B?bmRWNHBpSmtKQi9hcXMwTVFGc1NTVWJCd1pNajZTY0pvQ0hsbFVrRU91RUxW?=
 =?utf-8?B?V3ZsRTJiYkNtQmdrS0hnaE82cTNXeVhFSkNFUXl3RjVKWVBXL1RINUgwZFgw?=
 =?utf-8?B?Unh0L1dXZU9lcFErN2JqSWJWOGIxUUZnd1FQcHdGdkhBbW9QSXpyUUV3OXkw?=
 =?utf-8?B?RWRSRkl6TUgrVEY4ZkNpL25EbGtERFJZb3ZnWDRMWVBRSkoyQi9pVVplV0VK?=
 =?utf-8?B?ZUJncEg5S3dncHl5Wk5GNXREMGc5WVNTRnhwVlY3enllSlpxQXUrbERTYVVt?=
 =?utf-8?B?ejkrcStwUUtVU01VWVJscHQzbURsTFZpVmh3N3Q3cUVYdS9xK291MHRFZVJG?=
 =?utf-8?B?eWVoTkpVNFBjcWJPSGdNa3U2Wnd3c1RwL2NtT1pRQmFRUDBlM2dOUTZNVW02?=
 =?utf-8?Q?SqLNGUFd9/6QI?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2lYTUZGNFZqOENQeXVwZWRyQmxCY1FvUHhsLzlJWjB3VXo2YUs0RHQ3czJx?=
 =?utf-8?B?eFRjckZ1Mk5UVlY4VEkrRnRLdTloWlZkd3F0M25xOUtldTBsTXBGazBYYzcz?=
 =?utf-8?B?bWxsR1VVbjB4Y2ZOVGVXL0Y3ekw1WnNJVm9rY25maVRhQWZZL0hDZ2dyNHVK?=
 =?utf-8?B?MGdSRC9ab2FSU1IwOEYvYlpqMmdWWXRJVVI5TDdNb25yN1RUOWMxRTBONXhk?=
 =?utf-8?B?dWtUVDRPOTZFMFNzNlRHYVNlZElvMkJweCtuU0JQWUoyblFKbHYyaExnTWVH?=
 =?utf-8?B?aHpUSDhNbm5UYzh4dUNZTzQzMVhEQ1lxaFRCZmh5T2FhUkZMaCtXL1NQb0N6?=
 =?utf-8?B?cDBWNUNrbGU3dGUyb21hc0JzTldoQnZicFl3VnExaHlvUnFiY09BUythSmNK?=
 =?utf-8?B?VS9jTDR2RkxFUFdNQnFHL1ZQbkZ2N1FoUXV1Z2dEUWxGSWRyRjFpT3pZb0E3?=
 =?utf-8?B?MWk4bWlFQzNkV1RhUUpyUk5hZWhZaXpoZWV0cVQwcHVxbndzTDd0WEozeVBB?=
 =?utf-8?B?QVYrTHVwaWRUd2NPdUs4SFU4aDdlc2RsZnNZSHRxUk9HSkpBM2FXVGJOYXAw?=
 =?utf-8?B?d1JRYkVXelEzSWxwK0RJaThaK0RXVTNYUjBCRGMvOGtPbnRJTlorclA3Um4w?=
 =?utf-8?B?L1U0MEpHOTJmRWJ2d0ZlVzRjUlJLYU0waHkxTUNjRDFzWE43WXpZcVR6R2Fr?=
 =?utf-8?B?bGtEK3RjUnVQbGV6ZVl2KzV2c202Nm1BblBzbFpsRW1IaFcyWmozVWVHRXhK?=
 =?utf-8?B?T3pTdUxOMlRiSStXM0VPanBtbzl5ZXR6dzVkVlpXZ0lHcWsrMW90dUtyMFl1?=
 =?utf-8?B?NnBCUGQxZXYrdWhGUWw3djd1N2kxWngrenhJemYvV1hRcmIxUnNGK3phRHEw?=
 =?utf-8?B?eG5Kb2d3NWx0MXFOcitRWno1b0xmdDJnVnAzOFZCazZXbmxjU3ZmaCtnTUVn?=
 =?utf-8?B?YkFRZTZyc1d4TEs2OU1ReldDM2FiSG9WT1NqU0k4Yk43RFlBenZ3eGcxaHdm?=
 =?utf-8?B?TVZOcG43a0ZGMkQ2SDRhSHBmakc0b0NVOXJWWkpxblAzcEJEaWt6RFZyNUxj?=
 =?utf-8?B?T2xlK0FwSmJmL0xhNkFubDZiUjR0RGtGOU1NSHpDb0pZR2ErUmV1NE5ocU5i?=
 =?utf-8?B?eEZwaGZJRVpOYTVac3VINmlpR1BGSXU2U25KWnk4czVBMWZtQnM4c0dlS3A1?=
 =?utf-8?B?bC9leEtCTU8wNGMxMlBLK3FHUmpKeENvMnRBLzdNSnRlbTFmaWhIUFZLbFlW?=
 =?utf-8?B?YWtNWjVRSFJYQkloNTVyakJuQndpcFphZWFvdGwya1BzN3czVldEQkduVUtF?=
 =?utf-8?B?YU9HT0wzUG4yV2FEa2xVTG1hS3ErRVdKQjNQcXh4dW92SmkxQWtWM2o4aHp5?=
 =?utf-8?B?YkVFdWladVA1RVhwUzNwVE1RUU5SRVlMeGhxM1hIYUorc3B0UVU3R1ZPbDlB?=
 =?utf-8?B?OTR1MTc2ZkdqUER3SmhOd09wQVZ1RklEc1FFa1ZaZEl0bVhYeEhremo5YzM2?=
 =?utf-8?B?eUdybG1yLzBlSitiQ1N5eUdoRVlXQnIyVE91cUg5eHJxSW41LzdNSDMvNkE4?=
 =?utf-8?B?aW5jd3NVWVVGT2cyMUEzY0ltcFdjZUt3RCtXY2p3YzFNOHlmeE4wM2k4TlNU?=
 =?utf-8?B?eDhwMm5WYkVOYStTb1diOU9tckk5U25vR0Z5YjRzRE1HbFJUWUYxdGtrdmU3?=
 =?utf-8?B?OG9HNHQrcHdjNDRSWVZ5alJjdi9vOWQ3bGNoNFBvMmZHQTgyb2dkRDJnZmhV?=
 =?utf-8?B?dVlkUU4zQnZnb0lxcEpoWHZTdlpuUXgwK0RRWTRRQUtwODF3bUdvWHBVdXdT?=
 =?utf-8?B?TlNlT00wVzhPQ0hudk00WXptS2ZTU0E2N1NpcEUrd2JGdk85MGJQeWdJaDRB?=
 =?utf-8?B?Mm04dGdsNjJuZTlwcHNwR0xPSDRVeHpZQ241NFNOMjBRa25VZk1EeTRFNWlh?=
 =?utf-8?Q?JK67CYr4IjYp+6Wf7ckrrGEKrv24sRqf?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 645ed2c1-d711-4e11-f512-08df13424eb1
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:59:22.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P191MB2334

This is the series behind the design question from last week, shaped by
what both of you said there.

Link: https://lore.kernel.org/linux-sound/AMBP191MB2886BF4BED02C050FB4D6B76CEBB2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM/

Takashi:

  "I personally find it OK to have UTF-8 strings in short / long / mixer
   names.  That's no new problem, and it's been over decades.  Of course,
   a broken letter at the end could be a problem and we can fix it in
   either kernel or alsa-lib, too."

Jaroslav:

  "The fields are printed in procfs, so the kernel code should do this."

  "Accepting UTF-8 in fields and provide short-long/long-long name through
   SNDRV_CTL_IOCTL_CARD_BYTES when it does not fit to the standard field
   length is also acceptable (as for the components string)."

So the series does not introduce a second, differently encoded set of name
fields, which is what my first sketch proposed.  It treats the existing
fields as what they are - UTF-8, fixed size - and fixes the two things that
follow from the fixed size.

The problem
-----------

usb_string() converts the UTF-16LE string descriptors of a device into
UTF-8, so dev->product reaches the card name fields as UTF-8 already.
usb_audio_make_shortname() copies it into the 32-byte card->shortname with
strscpy(), which cuts at a byte boundary, so the last sequence can end up
truncated.  What user space receives is then not valid UTF-8 and cannot be
repaired, because the missing bytes never left the kernel.

And cutting cleanly is still cutting: 32 bytes is eight CJK characters.

The series
----------

Two pre-existing fixes first, both in code this series then builds on:

1/8 stops a non-ASCII byte from reaching card->id.  copy_valid_id_string()
    has a path that copies the source byte guarded only by isalpha(), and
    the ctype table classifies the Latin-1 high bytes as letters, so a USB
    product name like "\xc3\x84" "3000" yields an id starting with 0xc3.
    That id becomes a /proc/asound directory name and the hw:CARD= handle,
    and sysfs id_store() rejects exactly what the kernel produces here.

2/8 moves the copy_to_user() in snd_ctl_card_bytes() out of
    snd_ioctl_rwsem.  A user buffer that faults can be made to take
    arbitrarily long, and that lock is global and taken for writing from
    the card probe path.

Then the truncation, which is Takashi's point and, per Jaroslav, belongs in
the kernel because the kernel is what prints these names into procfs:

3/8 adds snd_utf8_strscpy(), which is strscpy() except that it ends the
    copy after the last complete sequence that fits, and uses it in
    usb-audio.  For pure ASCII the output is byte for byte what strscpy()
    produced.  If the string turns out not to be UTF-8 after all, the plain
    cut stands.

    This one stands alone: it is worth applying whether or not the rest of
    the series goes anywhere, and nothing later depends on it.

Then the length, in the shape Jaroslav described:

4/8 adds card->full_shortname and friends, holding the whole name,
    allocated on demand, NULL when the name fit - exactly as
    card->components holds the whole components string of which
    snd_ctl_card_info::components is a cut copy.  "Set" therefore means
    "the fixed field is not the whole story": one name per card, in two
    lengths, never a pair that could disagree.

5/8 returns them as three more SNDRV_CTL_IOCTL_CARD_BYTES types, next to
    the existing _COMPONENTS.  No existing struct or ioctl changes; an old
    kernel answers -EINVAL for an unknown type, which means the same as the
    empty string: the fixed field already holds the whole name.

6/8 adds KUnit coverage.

7/8 makes usb-audio offer them.

8/8 documents it, including what the kernel does not promise.

What stays out of the fixed fields
----------------------------------

Takashi asked what the fixed short/long/mixer names should hold once the
untruncated ones exist - embedded ids like "USB 1234:abcd", or the vendor
and product names when they happen to be ASCII, falling back otherwise.

This series does neither: those fields keep exactly what they hold today,
minus the mid-character cut.  A card that shows up as "Caf\xc3\xa9 Audio"
today is displayed correctly by anything that treats the bytes as UTF-8,
and replacing that with a hex id takes a readable name away.  Falling back
only for non-ASCII names does the same to exactly the devices this is
about, and makes the content depend on a property of the string that user
space cannot predict.  Keeping the fixed fields literally unchanged is also
what makes the untruncated ones safe to add: no existing reader can
regress, because no existing reader sees anything different.

On the id, Jaroslav noted that this is really the only field where
normalisation is needed, since usb-audio hardcodes driver and mixername:

  driver_name: USB-Audio
  mixer_name: USB Mixer

1/8 keeps the id valid, but the result for a non-ASCII name is a fairly
meaningless "D3000".  Deriving it from the USB id instead, as suggested,
would read better, but it changes existing card ids, which udev rules and
hw:CARD= entries point at.  That deserves its own patch and its own
discussion, so it is not in this series; I will send it separately unless
you would rather have it here.

What the kernel promises
------------------------

Two things: a name is well-formed UTF-8 and is never cut inside a sequence,
and it carries no code point that would break a line (C0 and C1 controls,
U+2028, U+2029).  The second one is not cosmetic, since /proc/asound/cards
is line based.

Nothing else.  Invisible and bidirectional format characters, the tag
block, variation selectors and non-characters all pass through, and the
header says so and tells the reader to isolate names for display and to
filter Default_Ignorable_Code_Point itself.

An earlier draft did try to filter those, with a list of ranges.  An
outside review took it apart: U+061C, a real Bidi_Control, fell through, as
did U+2065 and U+206A-206F in the middle of a range the code claimed to
cover, the whole tag block, the variation selectors and U+00AD.  Completing
the list means carrying Unicode character properties in the sound core and
revisiting them every Unicode release, which is the same dependency avoided
by leaving NFC to drivers.  A partial list is worse than none, because the
promise in the header invites user space to skip its own filtering.

The same review found the more basic problem: rejecting a name achieved
nothing, because the fixed field still holds it and readers are told to use
that.  So names are repaired instead - a malformed sequence becomes U+FFFD,
one per bad byte as recommended for a maximal subpart in Unicode TR#36, and
a line breaking code point becomes a space.  The setters cannot fail except
with -ENOMEM.

Still open
----------

1. Limits.  Each untruncated field has a byte cap of four times the
   matching fixed field (128/320/320), so the same number of characters
   always fits.  For card->components the request was to drop the
   artificial cap and let the ioctl report the length.  The same argument
   applies here; say the word and the caps go.

2. full_mixername has no in-tree user, since usb-audio hardcodes
   "USB Mixer".  It is there because the three name fields are one set, but
   if "no user, no API" applies it can be dropped and added with its first
   caller.

3. Should the fixed fields carry the '>' truncation marker that components
   uses, to tell a reader that more is available?  It would be consistent,
   but it changes what every existing reader sees, so I have not done it.

4. Consumers.  alsa-lib and PipeWire have not been asked yet.  If you would
   rather see their interest first, I will do that before a v2.

Testing
-------

18/18 cases of the sound-core-test KUnit suite pass under ARCH=um, also
with CONFIG_KASAN=y.  Two of the new cases are regression tests for the
review findings: one pins that card->id stays ASCII (it fails without 1/8,
with card->id[0] = 0xc3), one pins that the characters the kernel does not
filter really do pass through unchanged, so that nobody later mistakes that
for an oversight.

The sanitiser was fuzzed for 400 000 iterations under ASan and UBSan
against an independent UTF-8 decoder, with the real limits and with limits
small enough that a replacement character cannot fit: no memory errors, no
malformed output, no output over the limit.  The harness includes the
function verbatim from init.c; it can be posted if useful.

sound/ builds warning-free with W=1 on an x86_64 defconfig plus SND,
SND_USB_AUDIO and SND_CORE_TEST.  Each patch builds on its own.
checkpatch --strict is clean apart from warnings about deliberately split
string literals in the test data, where a hex escape is followed by a hex
digit.

The usb-audio patches are tested by build and by inspection only; I have no
device with a non-ASCII product string, so that is the piece that would
benefit from a real test.

Tooling
-------

Per Documentation/process/generated-content.rst: the implementation was
written with the help of an LLM coding assistant, from a prompt describing
the problem and the constraint to fit the existing kernel structure.  The
first draft was then reviewed by a second, independent assistant run that
had not written it, which produced the findings described above; the KUnit
and fuzzing work backing them is that review's, and the series was reworked
in response, and reshaped again after your replies.  Every patch carries an
Assisted-by tag.  I have reviewed the result and stand behind it.

Luca Rodenhäuser (8):
  ALSA: core: keep non-ASCII bytes out of the card id
  ALSA: control: copy the card bytes outside snd_ioctl_rwsem
  ALSA: usb-audio: don't cut the card name inside a UTF-8 character
  ALSA: core: carry the untruncated form of the card names
  ALSA: control: return the untruncated card names via CARD_BYTES
  ALSA: core: add KUnit coverage for the card names
  ALSA: usb-audio: offer the untruncated card names
  ALSA: Documentation: describe the card name fields

 Documentation/sound/designs/card-names.rst    | 178 ++++++++++
 Documentation/sound/designs/index.rst         |   1 +
 .../kernel-api/writing-an-alsa-driver.rst     |  12 +
 include/sound/core.h                          |  28 ++
 include/uapi/sound/asound.h                   |  30 +-
 sound/core/control.c                          |  68 +++-
 sound/core/init.c                             | 333 ++++++++++++++++-
 sound/core/sound_kunit.c                      | 334 ++++++++++++++++++
 sound/usb/card.c                              | 106 ++++--
 9 files changed, 1045 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/sound/designs/card-names.rst

-- 
2.43.0

