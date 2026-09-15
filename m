Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011030.outbound.protection.outlook.com [52.103.33.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACC14B0CAA;
	Tue, 15 Sep 2026 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487979; cv=fail; b=lgYRIi4Mtf+Hh2chspPzYikwgEXvxEJg+yAHlbHPGO46oY2qa56ALOFrfPm0SjzqV2Ii0nIfbnTRsk6Bnl/AhBB7ER1gq+wqG1iYGHVQSMxDazhiZFseMU7OYB1zstWy7QjLUNT4mymQK7trJi/FsKlNJUSkzHGvr9XY708s45M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487979; c=relaxed/simple;
	bh=dVdKGBk+KAaGd8MgjCmUJnh71ZGGQcBornPOJgNgqms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QRYg2STokjzDX1q7+b27LIeG1qe14WPAWiJ5+SuFartUNqUsA88IWZ/vyQm8KzyPNEug/1z8aO4xygnE/5ohEQmLnS9D0w/jSzcpPSwE3+z08U1q5jiZxShdlDIT8MjA4/igUE8RAhgZKN1PJWHRk7rzDWp5h6ru3vR+o2271Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=iTNm8XqY; arc=fail smtp.client-ip=52.103.33.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="iTNm8XqY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMK8wfNoIGkhXXMGDY96SxIlFfZOEXTmfnlwuTHB0lZBIfG4N0q4vSlWX0/GWCUFbhptN+9oa6G/ASb5a6DI5NrASwYhf4ZpnKs31hqR31I688ROuQSt4Sutc8sl/dd058K0ptbWhtdIZgmGqBfU1UsCMBsBplof1kzovxqzIAG3EVmf7Z2BBCIoyaDrBbo/EI/YlHDlHumS5kxy/o+nlnf5RqK7abl8bdEM62b7KmSZD8mxaXNAJoqq8x2hng902TyN+WA7Rhj6V8HqEyRIJwnTumkeN3M2mz/h6SkrIk4b6jpv7wZNNptwSfIe4gUQwsu2nmF0QA9PX8lEl1CZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXOXS2/Dmpuq28KnFb/Qa5G+SmfooSftfHLJ6ziZZ3Y=;
 b=TDR9PvDyZBx52YkjSWfWW2qh7l8b21jIRcYXDfEAtBCDv+TVvAyqJkWkr4hDdFHMAFqgDJp2B7KTaXwK0OdxFV1h0Jhk21yAbGzhKSjekMtzlEokkA7+FlxU5HzgR3S5acoyyk5kIZHbRntbyHcOXncvnUb6Gm/CoVgMvGQHqGmh9dQ4SUnhyh0MLoyBnx59DYvsXYq3jnDwkBBRNuIrCFVkNNk++lcK0YsyfTDenoerLHwuLEkU3NFx0l4wxZW88dCBTUF+VlqCAABjmgAIe66Nv+1fQz+Mxjfgrp6OoFzMkI3D/jISP7gpLsvFdAwf7Rk7CCo302WH0qlpU/Uu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXOXS2/Dmpuq28KnFb/Qa5G+SmfooSftfHLJ6ziZZ3Y=;
 b=iTNm8XqYZFC9lOASgmMnxElSvxSeUAxvUrWoP3FVY5oOA1ITJjHRPs2ko8VMZTmpH8FJn7WkjGcvWgs9/I1+1/q5YJqxStVDcqFGVpP7HqrhwGfQrIm3OO5hDMUL+/LzLk6MKTRKL4smOQmIELKkTpwfDVTWMV8uwEmFsqueSvETh0/HsVypnsJbxy410kBXpCA+m/k8+GQrTETiVb9ThkNksA3MtKpJbnFwT/hAfj3om+cbSaCtTDldZTpqEU8tjvD+vv5evDiCVBUrQ1d27P0imrJ7+9YS0xwk0DAk1Z/NGh93MNZUuF5U0Pk9cR88k2BrhPDO8hwmPtqvaEQRmA==
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
Subject: [RFC PATCH 5/8] ALSA: control: return the untruncated card names via CARD_BYTES
Date: Tue, 15 Sep 2026 17:59:05 +0200
Message-ID:
 <AMBP191MB2886BF0DB6DA82D82BD9C526CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
References: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <20260915155913.421839-6-otzelot2021@outlook.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|GV2P191MB2334:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf51402-640e-4f6e-0e36-08df13424fdb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|55001999006|41001999006|15080799012|12121999013|19110799012|5072599009|8060799015|23021999003|6090799003|25031999004|22091999003|24121999003|40105399003|26121999007|2607281247196008|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cncwbFUrMkp3TFBVOUxxYmt6VUM4WEh0bGNOakpYM1F1T2llZHBCcVZkZFFX?=
 =?utf-8?B?eUxjck9IU09TZW5IdjFKT0crUHUzczc1US85Z05iL1Z0eElGcHo0VW1SWXh4?=
 =?utf-8?B?enU5SEs1UFhGNzlvNGNNYzExZ1BPSzhaUms5RkpTM1UwZjNYWUYyb3VoL0tI?=
 =?utf-8?B?OHloQW9aRTBFWWVvYnJyUHB1M2NWVHNEN1FkcERiUFRwRmZ5NzY1dlp6L2FV?=
 =?utf-8?B?MVBEY3BqV3ErekJVczZwbVRLNUhnQTRsN1JzQ1lsbFVwakVOdWkyck45dGY3?=
 =?utf-8?B?UC83cDBHam1EdWlUbHppNGxmSzJ2cFlwSDl5NmpKSHNMY3IwUkg0N01OUkwx?=
 =?utf-8?B?VjUxRVhIRFFKQnB0VGdzUlcrK0ZFREJuVEdDU2xCcFdqQmk3UzlwRXg1NG1C?=
 =?utf-8?B?a1ZyekhGdDNLR0haWXFUa3lzL1dCU3B5U2c3WmsyaTVrenMrclljaHBWTXRx?=
 =?utf-8?B?WDRXZk9MeklsaTJzZWFJaEludHliUFpPWkdpcmk2bWE2RHZmc0FWUzE5VytU?=
 =?utf-8?B?WFZvWllvR0FCZmpJeU4vY0tVc1phWnRwMGFBQU1DSlR2VDdCNEVGNUdKMURy?=
 =?utf-8?B?dUJaVG84ckVsZGJ3SkdPellTR094RENiRS9FdSs1Z0hZeWdlaXdIQ3ZSdkdt?=
 =?utf-8?B?MUxFb3RvZTlXN0tRQXRiWFZPRys2SFROcDRzRzVMejhSbENiUklRbSt3TnlV?=
 =?utf-8?B?Q01iKzFTeGNHYW9JaWZrcjJuWU01RG44b3NNZVJ0S05VMmlDaVdNaERrZitm?=
 =?utf-8?B?c2srNkw0ek84ZzVhRndPaEFqQlNZVU1ndklOM1UzYVNYRWVDVFRUR0I4M2Ns?=
 =?utf-8?B?NENGS1o5RWI5azAxL3hQZ1VWeUdOL00wQ2hjYkhPc1hpQkdPOGxEMGRGYzVS?=
 =?utf-8?B?SVQ5bVpiQ0JUdVR2T3k1aTBBMXpteU5paDlyQmtxWGhaVnNRRG1JaUVUZXFT?=
 =?utf-8?B?V2NvK0E0QkE2dTM3aVZtcVhEQ0ppU2JTdVZVVUlPb0pSSjJaMHhnbnpJOWM2?=
 =?utf-8?B?QVIrMVZSaWpVZWFYbEVNTEI3Vm5QdDZUT2M0NktsZXlFbEJyY2ZGeG8zci9F?=
 =?utf-8?B?d09Xb2xKcEttWE9RcjdyUDZCcnZJQzZTSWc5V3lUa2JmLzR6MkpuVEhMbC9H?=
 =?utf-8?B?UGxOWFNiMXZibjRzWXFIVC9tMjJnWXZzeEtBUURoeTNveEtDRlJtR1F5dTNR?=
 =?utf-8?B?cDV5QkZmNGw4QmpucEVIdGJVbno2T2VTODJrR0hXbnlBMzdHalJSOFlHYUxU?=
 =?utf-8?B?ZlhDTzh0MzRqTzVUZkJMVmJUR0o0MytHclArWkVGV3dHclFwdWFXUE55Sndr?=
 =?utf-8?B?aEdpQS9oK085KytUVjJTU0dUbk5IY013bVFYOFJjSEtPMm1FK3pDRzdnTzB2?=
 =?utf-8?B?WW5id2VPRmRZeHdXUVo4N085YkpVa3doZzJCL292eFVTTGRIaFhDU2pWbTF3?=
 =?utf-8?B?TkZSMUgwNHlSZG90K0tLR3dDNkRrS0ZIWWpEVVNGUkwxR1ozNVZ0dWVxNG1Z?=
 =?utf-8?B?M1M0bDNBdk9QSTc1U1RFSHRKOExpTU9zaE1DbW1KODlRdlBHL2xrTFhsMnl0?=
 =?utf-8?B?ZllocXV4cUZDSmRmcUdjZGRnZ3diaEdOemNrc3FZUWh3TUdUWFZGRFZ4cldC?=
 =?utf-8?B?L2hwaVFmZEVyc2MwYXVOVmU4YlV5VkE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0F0dm56emk4MDJ4NHdZVFYvL0hOL3UzSVI5M293YlZpeWx1VEhxUkM5YlRW?=
 =?utf-8?B?ZUtlWmhZdDNjUHZnWkdHYlVMNEt6MS9qK2gvWXdkdXdKeitsRHdGUEZjUSs5?=
 =?utf-8?B?VVEyN0lDMktycEhhdXd6WmdRcUk4ZUtVQXJrVWYrVkNWTGNpYjAvcmdKc3Bq?=
 =?utf-8?B?QS93MzU3b0Y0a3ZmUDhrMkNycGRkeWtGKzJOWFR2QXNWRkdNOVhiLzdhNUxO?=
 =?utf-8?B?QTVHbFgvbFV2dmErblFwOE5qTEpYMjdFbzdrTy9QQ2FDTE1hczZqbTNNSStp?=
 =?utf-8?B?ZkFZZlVEQU1iVmRPanpLUjh6bXgxTEQ1dmE4YWYyUUQ5R3lNVXFWdFd0VFZa?=
 =?utf-8?B?YjFQeWdGVVk5dEpmejFjYjRPT1V2T1d0SDJISGtxRnFrMXpvMWhtd2lLeXRT?=
 =?utf-8?B?dHEzNk1ScmJobmZpaDFFY0FVcWtmZVFzekJxaExqejgrWU1aRi81cUUzcTZN?=
 =?utf-8?B?L2MxUkhCM3NvSTR1UXNSZ0Y4YTlrdnJGOGFqaEV5ajg0Y1FGOEt0aUdMcnFq?=
 =?utf-8?B?VURUVG81WG5QWGxOSlkvRVR2MU82WXYrSHBjM1hwSHFPYUJOaS9kM1VuVENV?=
 =?utf-8?B?amlVT0lNbUQzaW5mQlp1aVVXRUhtK2Y5eUFENXpCOWlJekp6Wm81QUUvNGRX?=
 =?utf-8?B?eENPcVVXYmpNVVY5cm0zK3R2RVV0dnBycmFIMVZRbXY5bFVmN2w5UGN1UCt2?=
 =?utf-8?B?aEE0emd4VXNiZW5ac1pjanVtWFRsNkdmSWlFYVBUVm5hUEpuK29ZdVZMVE5V?=
 =?utf-8?B?U24rQzhFb1A0MVdNU0lzOGYwdWxFU3UwS3JhNjhZbnZmNDREYXhGWldCWFBo?=
 =?utf-8?B?Z1dmWXhWWUVPS0FTSnJMUlNRMEdqOGtKdjJ6TXB2eWIrMVFnZVh6dVNlQWRI?=
 =?utf-8?B?L0dscENPZFVHK29rc0htY3owMDZ5SzBzeCtyVzNzOFBHbU5CV2RnR0hTbmVD?=
 =?utf-8?B?ZnlzazJhK3lTUkQ2Vml2Nml0Y0Fib3ZtZFdLRU5udFFuUFNZMzdtZ0p0aVUv?=
 =?utf-8?B?aHJnSXBUWWpFMDcxdkJUNlh6VTJPNkNyRU5aeXc1NitwandmOVpmU0JuT0Vi?=
 =?utf-8?B?RFBsV0Q4aUQyUTFoaFp2NGo3WHVLZDVHc1R1aWZLSFBnTTlWbmtuL0dsRDdo?=
 =?utf-8?B?MkFkU3p5cjFIRFRIaysyNk9pWlR4NHZrNUJPOXlqN21ZV2JrR2NJUU9DT2pu?=
 =?utf-8?B?aEl1RUFjNks5Q045UmRsRFQ0bWhQUWova3dJam5uODNpaGJZcVVrZlZGTWhI?=
 =?utf-8?B?TkdWYXY2clBXbnJXRzVkTVhvQUVveWRBSi9QKzViM0h1SVUzMEZZR1V6VUxF?=
 =?utf-8?B?aUNtYTB2TVJvODRiaGtFTkRJRGg5NHE2OHQveWN0Q0F3S2FlellQaWcxdzEr?=
 =?utf-8?B?QzVHekFydUk2MVR5NGJ1azZtdXo2RHVZWm1DczRiUXdweGlnZ2Q1YUpxMm1h?=
 =?utf-8?B?VjU2MkVRaTlvUzNwb2tIWkRrZ3JONjIwdUlOQit3cnFKbzhCVEJWUml1Yjdq?=
 =?utf-8?B?TUFNeDc3REJ2YWEvUkFVMXlna0o1UW5pWmZqOTJsdi95Q1BlNjQwM2libGF2?=
 =?utf-8?B?SzB5NG1zMFZZTndOZ0xvNk9pMHJxbnpBSnJ1M2p5UEdMM010cDF0bHdVdGtW?=
 =?utf-8?B?bjNNQWpWVEUyc08yUHdaeEx6U2hsbzR1RHVzYWQ3K1NUdkUyL2NmTGpYZkhq?=
 =?utf-8?B?S0tyZjAxTGFBaUJnemdpSUtoZmNLbHE2Um13R2M0V0hBMWhVUWYrd1FYYi80?=
 =?utf-8?B?M2Vrai9YRnQ5NnhDWjlVbWZWdHVjaFQycDRjWDBhTVN2Q0N0N3h6RWdWVE1a?=
 =?utf-8?B?L09QNzUrbXMwS2N3TnNBT1ArWXA3VENVRUNGOHd2eVRjRE8yOWRBQ0RPVHBS?=
 =?utf-8?B?dlI1Y0ZPY3Nya2loQlZ3U3lQQ0RYVDNCZGpVL0JxWVVPUWU0MFdxU0RLMDdF?=
 =?utf-8?Q?nLqCIykcDlSeCQpZlqYUNVtMpJYpqXx1?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf51402-640e-4f6e-0e36-08df13424fdb
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:59:24.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P191MB2334

struct snd_ctl_card_info is fixed-size and cannot grow, so the untruncated
names need another way out.  SNDRV_CTL_IOCTL_CARD_BYTES already carries one
untruncated card string, with a query-then-read protocol and a __u64 user
pointer that needs no compat handling, so add three types to it rather than
a new ioctl: SND_CTL_CARD_BTYPE_NAME, _LONGNAME and _MIXERNAME, next to the
existing _COMPONENTS.  No existing structure or ioctl changes, so old
binaries are untouched.

A name that fits into its fixed field is returned as an empty string rather
than repeated, which tells the reader that snd_ctl_card_info already has
the whole name.  An older kernel answers -EINVAL for the unknown type,
which means the same thing, so a reader needs no version check; PVERSION
reports 2.0.11 where the types exist.

The header says what the kernel guarantees about a name - well-formed
UTF-8, nothing that would break a line, never cut inside a sequence - and
at more length what it does not: no NFC, no homoglyph detection, and no
filtering of invisible or bidirectional format characters, with a pointer
at what user space has to do instead.  A promise that cannot be kept is
worse than no promise, because it invites readers to skip their own
filtering.

Pull the string lookup out into a helper so all four types share one output
path instead of repeating the copy-out four times.

Assisted-by: LLM
Signed-off-by: Luca Rodenhäuser <otzelot2021@outlook.de>
---
 include/uapi/sound/asound.h | 30 +++++++++++++++++++++++++++++-
 sound/core/control.c        | 36 ++++++++++++++++++++++++++++--------
 2 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index c11da9656e..bebd1b1049 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -1058,7 +1058,7 @@ struct snd_timer_tread {
  *                                                                          *
  ****************************************************************************/
 
-#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 10)
+#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 11)
 
 struct snd_ctl_card_info {
 	int card;			/* card number */
@@ -1076,11 +1076,39 @@ struct snd_ctl_card_info {
  * Card components can exceed the fixed 128 bytes in snd_ctl_card_info.
  * Use SNDRV_CTL_IOCTL_CARD_BYTES with type SND_CTL_CARD_BTYPE_COMPONENTS
  * to retrieve the full string.
+ *
+ * SND_CTL_CARD_BTYPE_NAME, _LONGNAME and _MIXERNAME return the untruncated
+ * form of the name, longname and mixername fields of struct snd_ctl_card_info,
+ * in the same way SND_CTL_CARD_BTYPE_COMPONENTS returns the untruncated
+ * components string.  Available since SNDRV_CTL_VERSION 2.0.11.
+ *
+ * A name that fits into its fixed field is not repeated here: an empty result
+ * means the field in struct snd_ctl_card_info already holds the whole name.
+ * An older kernel answers -EINVAL for the unknown type, which means the same.
+ * So there is one name per card, available in two lengths, and never two names
+ * that could disagree.
+ *
+ * Card names are UTF-8.  The kernel guarantees that what it returns here is
+ * well-formed UTF-8 carrying no code point that would break a line (C0 and C1
+ * controls, U+2028, U+2029), and that it is never cut inside a multi-byte
+ * sequence.  The fixed fields are cut at a character boundary too.
+ *
+ * Nothing beyond that is guaranteed, deliberately.  Invisible, bidirectional
+ * and deprecated format characters pass through, NFC is only a recommendation
+ * to drivers, and homoglyphs cannot be detected at all: all of that needs the
+ * Unicode character properties, which belong in user space and not in the
+ * sound core, and a range list in the kernel would go stale with every
+ * Unicode release.  So a name is a display string and never a security
+ * boundary: isolate it for display (U+2066/U+2069), filter
+ * Default_Ignorable_Code_Point, and match cards on id, driver or components.
  */
 
 /* Type values for struct snd_ctl_card_bytes::type */
 enum {
 	SND_CTL_CARD_BTYPE_COMPONENTS	= 1,	/* full card components string */
+	SND_CTL_CARD_BTYPE_NAME		= 2,	/* full short name */
+	SND_CTL_CARD_BTYPE_LONGNAME	= 3,	/* full long name */
+	SND_CTL_CARD_BTYPE_MIXERNAME	= 4,	/* full mixer name */
 };
 
 struct snd_ctl_card_bytes {
diff --git a/sound/core/control.c b/sound/core/control.c
index e404cb55a5..cfe451f0f4 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -14,6 +14,7 @@
 #include <linux/mm.h>
 #include <linux/math64.h>
 #include <linux/sched/signal.h>
+#include <linux/err.h>
 #include <linux/cleanup.h>
 #include <sound/core.h>
 #include <sound/minors.h>
@@ -901,6 +902,26 @@ static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
 	return 0;
 }
 
+/* Pick the card string a SND_CTL_CARD_BTYPE_* value refers to.
+ * Returns NULL for an unset field, which is handed out as an empty string.
+ * Must be called with snd_ioctl_rwsem held.
+ */
+static const char *snd_ctl_card_btype_str(struct snd_card *card, __u32 type)
+{
+	switch (type) {
+	case SND_CTL_CARD_BTYPE_COMPONENTS:
+		return card->components;
+	case SND_CTL_CARD_BTYPE_NAME:
+		return card->full_shortname;
+	case SND_CTL_CARD_BTYPE_LONGNAME:
+		return card->full_longname;
+	case SND_CTL_CARD_BTYPE_MIXERNAME:
+		return card->full_mixername;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
 static int snd_ctl_card_bytes(struct snd_card *card,
 			      struct snd_ctl_card_bytes *info,
 			      unsigned int __user *data_len_out)
@@ -909,22 +930,21 @@ static int snd_ctl_card_bytes(struct snd_card *card,
 	bool too_small = false;
 	unsigned int data_len;
 
-	if (info->type != SND_CTL_CARD_BTYPE_COMPONENTS)
-		return -EINVAL;
-
 	scoped_guard(rwsem_read, &snd_ioctl_rwsem) {
-		const char *components = card->components;
+		const char *str = snd_ctl_card_btype_str(card, info->type);
 
-		if (!components)
-			components = "";
+		if (IS_ERR(str))
+			return PTR_ERR(str);
+		if (!str)
+			str = "";
 
-		data_len = strlen(components) + 1;
+		data_len = strlen(str) + 1;
 
 		if (info->data && info->data_allocated != 0) {
 			if (info->data_allocated < data_len) {
 				too_small = true;
 			} else {
-				copy = kmemdup(components, data_len, GFP_KERNEL);
+				copy = kmemdup(str, data_len, GFP_KERNEL);
 				if (!copy)
 					return -ENOMEM;
 			}
-- 
2.43.0

