Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023141.outbound.protection.outlook.com [52.101.72.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4334B43CE45
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824506; cv=fail; b=bYFDmqzViEU7S4OFB4obN63+wlWhFSxth2TnbhBTyJJDziHTWTCzfwfLUk949WQ7+DdT6OyWFsCxHUjT46NWpZGgm4mv7x4zi3MCxIMvI1eoBgTO4KA1GYVeMcbYqpTqyleGSxl9tV7qBXq0fUElg4pI5SOV+ecsSStnFdHJ5Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824506; c=relaxed/simple;
	bh=EDSKyqyu+DC36nWy495+70wDNsVxrQZD0eF9sviU4VI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=OonLY/85Qy29bMi3KWPLCdv5knw+r6TIRmqZiJUY+ST3DSziSAIaPlmhLGTupaMPDccJ47pKiWUB0ThbWMgVqY9L9D/Wv7tU2CQxXLbeGMXp0phK2EBTUY+T6Bw65M4pKtD1PYeXhByw9R5rdCE5XVoyuCO/aBuI0FU8wMuOPXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=XlgE6CUU; arc=fail smtp.client-ip=52.101.72.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="XlgE6CUU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vxi++l0AeWdsZ03MmWpxKfN1guNf6LPqLWuTOqtvIXpKIV4dO89ZJjVzdwzZF+s71MRvF6W8fp5bDTugtulNGfxyIB70AB70ImqJ5G1xitGPsjUbmbKVm/eY1k9cLjG67FRSmvtsDIwkPJotS6GQ03xdyza5Utx9o3frtpKlfDADn9k/T55ojZahRMIVLDc7F/C+DBi87J8FLg27LDEr5FBWUwlfdQq4Ju/dJpNZHsTpFxtXbQXLBC98HvkNkLMXYGiAM7tdNcrmiw6tx3BWHxNpQAtI0i/xrWHVbNekQOfJ8gPlMAGFrbvVQFaanHcjvX/VUN5eF18LiPCcTxbcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jR80UhcpcHNoo/jy4EYyqlCC0PqACzJgHWatRgQMI8=;
 b=gaHR0Ngbtwk5rsNchuxWidQ1xIY1DLetq16Nk1eJpBPd+55a/s3VRwt9eUyRPn5TpLeVv9C99GP/L42Dd5v2pSSDYajlia0hO3d60vKkIb/A/+XbF+8WlzM9P+cTC0LWRstNVFhwu+OfYe5MxF3A9Ido1+UXbIil1+RTEHkOhTp1L3mUNWbY/0OtX4wfh7G7uIrpwC6ppSzfqFU0bsLZeCBuSkjhayVFw8oDT1Ky+nA4JguhhzhyPWR09sEuUPINTtp55qBAfQwZacFtdjyc86ffAURlf9PbYvH0Betkz79bw6N/dcibSkIWqtIRgwZyQ1YhyeHZYLqg4KETeQuiog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jR80UhcpcHNoo/jy4EYyqlCC0PqACzJgHWatRgQMI8=;
 b=XlgE6CUUatQFHgXDNNAEdWcXOkSxqLCNEZiANTaysbc68dEtcXnPX+KHfMxeuPm7Lpq4zwuJGjw3DnFANDgxDJup4z9PZ2tKmAoH1w6OZlpVpNYnjU6bk2ZvEqHSJ6LrFmFjrDug9r7UX229TkGUcKGWaHKHt9WAyiT59tZskDLLCauJlqst6ldB52qYRQUiqZCk0PsnkHIxus/QYZUMXXB4V3OqKYZLEHr+OyF9iInTRbK49OitwGq6CphpHSwX0IhHpfFcyfAuKVnXMb+0ivVfLt+a/ih1p934rjiuigsshes7ZrwgbjD/zFnsMBuD6Snp7L3A1xk99VSy8kqyPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by PAXPR06MB7645.eurprd06.prod.outlook.com (2603:10a6:102:12e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 09:54:42 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 09:54:42 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Thu, 27 Aug 2026 09:54:34 +0000
Subject: [PATCH] ARM: fix get_cycles() always returning zero
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-arm-get-cycles-v1-1-6495fc03369a@vaisala.com>
X-B4-Tracking: v=1; b=H4sIAFkJkGoC/x3MSwqAMAwA0atI1gZq8X8VcRHaWANapRVRxLtbX
 L7FzAORg3CEPnsg8ClRNp9Q5BmYmbxjFJsMWulatbpBCis6PtDcZuGIJZElW3daVQpStAee5Pq
 Hw/i+H1lfsk5gAAAA
X-Change-ID: 20260827-arm-get-cycles-4aadad692050
To: Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787824481; l=3391;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=EDSKyqyu+DC36nWy495+70wDNsVxrQZD0eF9sviU4VI=;
 b=32oi0w41N59HsxhQIaRtyf3ahik+OIaDMHiKWjYYuPdim0DzHy1j4Xmql4D67Lw/r39kC5rEn
 XaDQc0pZzx5BljIHBxN0s6TeAA7eciKq9byKsaQCbV2v1SrO3EZfhjE
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV3PEPF0001DBCC.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6a9) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|PAXPR06MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: a27c30b0-fe78-4eb7-0a73-08df0421378b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	/dBEBEBz7R1mzgqwjXJOaCBb9jHEqDXXb7GnawfdkbAPc9Gc/L6ffKKMZbNogvtiPYkEcA563nPxCnJdMescR1Ac0jTyzYxNDh1G5eZjuhXTAsMN0dnL6A3ZFI37w1l3b2P85h+9nIkAJaB4ZwMO5vUCs5nq/jk1EfGO0sUQj+yFxnOw2nYh9/NDJm7ngASkSBMaZGnP7Kcs3XifwYT70ZOaSDppPwIXNTi1jOHXpxq48lr6L2jRi1f//nRZ09GHVQyzKZMLUT4GlRz/5lYT/m01yr8oKe8jWjJLgrDCRugdCzb/QBLgvH7pACx4YjGvGiqINrKy+6ZwZ1tWw0LcFeyBnt4vdeIfgkxTyvgM590Y+l1G+8IA3gBQEIkp6AkGMWKdPp+eU/dl37xkz0Hyk+sWKEAItW6IhWCNQtGnOawOgpkRfnfmOncsa5QWq5FNxvnkgwMUMM9GCnArVuTTNqdUS5dSLQLgPwrNjXTuLMzwYeBFeZ2It65e6iUZP12UfUUWAr55U9u0Kml7s3NQGpUk0k+OSqLnimLVqHwbEMZjmgD2dWP2t8L0bDkTZif0TfdRIDAkkK7eMHsX/pgiLm5l5TSJEtYHJsr/23UBOKxSlEugQ0eKmqo+3LAmkZFOuUBCz5kdrjAA5QTCfRVnBkdGNwMN8b1AwRL/EoztZQ50LhyHuDbAhXRcPb+E9rzmpnrNMEwn2C5DGR4ButbnPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlhpOTFRVGt0RVR6OWtjRkRwbzRpUDI4K1AvUnhBY05WQUp1UjI2blV2cWsz?=
 =?utf-8?B?cjFmaEFEL3VBdCt4dFp2Z3JTR25FR25taUpqbmdjV2xHWFR6NWZCUHBrZmhR?=
 =?utf-8?B?eGxWeFFkN1JtWUQ0NWlJK2tmd0Zka2JOcFdSTXNteXhmNDI4TFFPT3EvSTdq?=
 =?utf-8?B?WUowRUIrMkFOQVpSRWg1cmRTcUtrSUpXTDZpZFYrejRRWTVGdnpiTVRZZDFQ?=
 =?utf-8?B?Wk5GQVZ2UElhS1hmL2ZQTURqMWZOWUNSQXdHSnRXTlNaRnZwOVQ3V3hmL1p1?=
 =?utf-8?B?clFrcXZYQzNOdmd3QXRrOC9UR2k4TiszR0RaaFZNK1F3VGJvYmxNaHZ3Tkp0?=
 =?utf-8?B?ajduSDdtVUtsWko0VmpSek1OYkpLdXpLRnNFcEtRWHd0RzBoZTQ0ZDMzL2hq?=
 =?utf-8?B?UVZzUThxMTYzcmM2aTBxc0NGSk44cHl3UCt0YkkzM1lkOG1ENCswcGxCQ251?=
 =?utf-8?B?ZUxzMjNKM0JESUozNnovYlByUWtsTmFWOHVpY0dsMldHaG9JcXV5Y3FSL2dU?=
 =?utf-8?B?UGpmWWtOSTVZMFd4Wit5NG9yVDRDQkZQMlJKNmdsTUd1SnZ3RWtoMkNFQU1v?=
 =?utf-8?B?bnJGdENIbVY4d1hBa1lIbFBua1ZKZzluVFZ6NlVQOStjZlVqWmp5R0lFVjJt?=
 =?utf-8?B?NzFCL1dzTjVrQW84aTl2ZkpiWEwvMWlPZFhIS1dKbU1iZUZkN1UybkkzS1VW?=
 =?utf-8?B?NWp4RGF4ZGFpUTNvUDNxK2xpaEQ1OTV3R1V5SDNlRDdVeWVGSE9qZS83Uklh?=
 =?utf-8?B?TkhoUWdtVWVrdXFxR09IODkrTmxmZXF0NzR4b2JDK2x2S0RxWDZlT053ZUpv?=
 =?utf-8?B?TjcwK1YwTnJXcjFnSWxNbzErSExHbHlieVhmQ216Yjd6NzY4QlMxWk5mWml2?=
 =?utf-8?B?OXEvZEtzOGc2eUtnbG51M2prU3ZJeEo1SFd3ZjlBRkhMbVQ2NmVMWS9ibUhW?=
 =?utf-8?B?Q2xaNXRCK2J3TGFEWWtIc2o0bm9DRjY3bHJIT3VuNi9nN3BucG1TdzZmS0NW?=
 =?utf-8?B?YnBRUFU2RzJqclhTZUFwN053SDN0QkdmRGh1L3F5K0JPMmo5d3l6K05Pd3Z0?=
 =?utf-8?B?UXJyNHBsdVdIQkxwdjlFM1k1bm9uQmpPa3FUSGFwc0hOWDBQelFodWliWnpI?=
 =?utf-8?B?STdSWGJQQnhGUjVIZlF1aFl5TVc4WVJHMGk0djc5ZWdHY2NLN2xRZnJZa2pt?=
 =?utf-8?B?RFRubHZKVE5RTlpWWHBjM0xVQXpVM2NHNHBDNEtYRjZhVzRoRUxnQ3pIUG4v?=
 =?utf-8?B?RmRtZnF4c3R0WDVrdC9mVEUycG5WdmIyc3FuRUtQQkwxeUNvMFpiQzJxSnll?=
 =?utf-8?B?aWI2dXdBK2dveExBNVRuR0pIRG1vTzZmVDdqM25hYzJaQzJJVDk1UjdYWWVw?=
 =?utf-8?B?VzhFVHBFelZvZ2MzamZXSUlXS2xZRFllWkVsUzZUamJ0ditIcVpvb2RiZTlY?=
 =?utf-8?B?TDdqMFR2K0lLMEkwVlBLb2RqcnlvR2dKQnUrRTZWQWV1VllVN1kxNTkrdWdm?=
 =?utf-8?B?Umw3YTBuQzl1ZkRNMTVpUEhlNVZlTVdCZUlnYzk2ai85c3Zzcm04YkFNU2Fo?=
 =?utf-8?B?a21qdTY5dlBxMXlzR2tucW4wSEFaRDZiTVh2ek5DOXEra1RLRzBlYnhPWU1i?=
 =?utf-8?B?bEMrRVgyVm5xZFlaL0l5R1g1azlJbHgveUU0ZlNjRXJnak9oVUoxeVEyOU52?=
 =?utf-8?B?T2krMi9UZ0J4QmdNTHFDQlBWeGJEVERpbzZVanFnaGFvaWw1VlRtZ1JjT1JO?=
 =?utf-8?B?cVJlOGFVdG5ldElYK3haRFVuQlFla0JIakVIZjk3SE5mTkV2Y1F0b1JoZklw?=
 =?utf-8?B?eDBTRFo1RVduUytoU3NQL0l4MjZ2QTRBY1ZmZFBhcWMyZy9jaDc3NkFqMWtu?=
 =?utf-8?B?d1Ixek9GNGtuQ1FYbi9zak5TRTVqU004WkZaUG9XbjlvZlhtVHdsMHU4UVZL?=
 =?utf-8?B?MFp2cVdTOHV3RitZRVFhT0VzZlBBTHVBT3hzdjJ4ZzZYK0w1OGx5NWQ5VTE1?=
 =?utf-8?B?YXBWSjdDVzY3SmFSaUFXMWVJeGVMUGNwUE1UWkVYT0czR0MzaTZKcE16akhv?=
 =?utf-8?B?eVpsQk02RnlQSFgweThVUmtuN2Znak13ZUwyUzJoWTFKZ04ycHU1bVNJSnNU?=
 =?utf-8?B?TGxyT2d4dVphWjlxUXdSVXFJSHNuSU1xT29FRVNVWjkzdWNKdzhtSWtpNGdo?=
 =?utf-8?B?RG5EZElmQ0Mxci9OTlB6YjNZRTRlL3BSQjNFN1Q1eEp0dDQybkZBQkNObUti?=
 =?utf-8?B?cWkyMW1scGp3OXBDZ2ZSaXNleVdXcHJLQVpaeVNWQWNidVFmMnpMSHczbFJY?=
 =?utf-8?B?VExqQkMydTJRMVdsbzBCeG9JMlFBTjhZczlaTHZua05RZzZjcjlySzUzUHkw?=
 =?utf-8?Q?J48BXH7H9x+unm3w=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27c30b0-fe78-4eb7-0a73-08df0421378b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:54:42.3089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bybiRHBy/bB8M1ossfZRAReAgKy+555/QEJwZWoQ9vtl3wmcTUHo+d0fdd+wVu/z2BozhDl+lEZ5fQ5HjRXK99g55jvBR2qWozybqg1EZHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7645

Commit dfc256dac54c ("calibrate: Rework delay timer calibration")
renamed read_current_timer() to delay_read_timer() and inverted its
return convention: the old function returned 0 on success, the new one
returns true on success. The ternary in get_cycles() was not updated,
so it now evaluates to 0 whenever the delay timer is present and
readable, which is precisely when it used to work.

__timer_delay() then never terminates:

	cycles_t start = get_cycles();		/* 0 */

	while ((get_cycles() - start) < cycles)	/* 0 - 0 < cycles */
		cpu_relax();

so any udelay() asking for a non-zero number of cycles hangs the CPU
forever. On an i.MX6SX this stops the boot in the first udelay(10) of
i2c_gpio_init_recovery(), reached from i2c_imx_probe():

  calling  i2c_adap_imx_init+0x0/0x18 @ 1
  watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
  PC is at __timer_delay+0x44/0x58
  __timer_delay from i2c_register_adapter+0x604/0x7ec
  i2c_register_adapter from i2c_imx_probe+0x3f0/0x6a4

Calls with a zero cycle count still returned, which is why the failure
only appears once a driver requests a real delay.

Arm is the only architecture still defining get_cycles() in terms of
this helper; the other users of the old interface had their get_cycles()
removed by the same commit, so they are unaffected.

Swap the ternary arms so that a successful read yields the counter
value again. random_get_entropy() is built on get_cycles() and was
silently falling back for the same reason.

Fixes: dfc256dac54c ("calibrate: Rework delay timer calibration")
Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
I ran into this on an i.MX6SX, where the boot stops in the first udelay(10) of
i2c_gpio_init_recovery() and the soft lockup detector reports the CPU stuck in
__timer_delay(). Instrumenting __timer_const_udelay() showed that the requested
cycle count was correct, which is what pointed at get_cycles() rather than at
the delay parameters. I have verified on that board that the change below makes
it boot again.

Arm appears to be the only architecture still deriving get_cycles() from this
helper, since the same commit removed get_cycles() from the other timex.h files
it touched, so I do not think anything else is affected. I have not been able to
test any other platform.

This leaves any arm32 platform with a registered delay timer unbootable, so it
would be good to get it in before v7.3-rc1.
---
 arch/arm/include/asm/timex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/timex.h b/arch/arm/include/asm/timex.h
index 94e40c19cfc5747866aeb78075c80ec90f1d1d15..4d31eab9dba2111a858e1010594d6f340159b948 100644
--- a/arch/arm/include/asm/timex.h
+++ b/arch/arm/include/asm/timex.h
@@ -13,7 +13,7 @@ typedef unsigned long cycles_t;
 // Temporary workaround until timex.h is cleaned up
 bool delay_read_timer(unsigned long *t);
 
-#define get_cycles()	({ cycles_t c; delay_read_timer(&c) ? 0 : c; })
+#define get_cycles()	({ cycles_t c; delay_read_timer(&c) ? c : 0; })
 #define random_get_entropy() (((unsigned long)get_cycles()) ?: random_get_entropy_fallback())
 
 #endif

---
base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
change-id: 20260827-arm-get-cycles-4aadad692050

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>

