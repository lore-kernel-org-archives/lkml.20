Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020110.outbound.protection.outlook.com [52.101.195.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5C548BD46;
	Wed,  2 Sep 2026 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352632; cv=fail; b=k+3J9EXxHOX4RJ7uUsC8a0oN/lNMCOu1FLacQzrZnWKK2T75irai9hz0JJfM9LnUtsrhchNcNZ30dbhqX5AOZcExuS9oh+hK9lY0kmoULcJaWSk6fjL8Hkc5IW2+7VX2Uc3oQMu9GJBNRGRnvUV6M0q1DEiX//gGkLmJYl0zxPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352632; c=relaxed/simple;
	bh=8kHZEHSyUv0zU6f70Hh9QapYQQidPVxlncr2gK9F+jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TGPPRITaG6U+Z3BX3Yani/MBL8MTXVf07eSvuiMsh+gJoje/vqGGJBhFz//lhtOjR5YCjuMx1iEOmanTB6pjXW1pcHv5McOn7z5BKBIOvQsct7PsJwJd4AxBO0h568Pq7PfoUHfJwdjVwa03vOZYUfRM5XCBsyFn79nottfPA6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xrh8+yiW+k+k1xnmoB5sfqLGr4wevqrKrBCu6IZBEOUa2bTaAgBu2zELpO4FFeOCeZRVU8z3xWeddlXXttrWbji55getA6RfKR38LfhqTSKC97AhcdVmNiHJfpgXG/ZZiMNmiJLOFu72jlmEJmDKUV9icsPtmD16iA3j13uVPsjxg6+JMKoa+YXT3MtHXIfwA+Xcdi4lcvD63hlv7w3K9cFUcpeEFTvWgYwIsNhVuJ8ZUXTPtNXgShxFKKB+mBwSpaABlvrLYl5ZCraXXQDjGAbmb3RA0OGSip8dg9pztAgGKlwOa4d+EtH8eH1DqSfnRqCus36J8RU/wp3pRa+d7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=YoxwCW+NBZTC7Qqdko8hFv0E4CaTUh5XlXgkxjc1q4A=;
 b=aS7wtRwdBUgIrEdubhGYFRWNKFF0X0mQe9DC4tYsgKogL0PwsNj2eOWDgTHnC0xP4ey2BvF3zbYOW3mF2unDOKvXyG4/nyrjUF7dJjwP0op7KB9DB/lw1QJW6U4vCUAAAH6fEI2e544MJ1PAWcdok1fgtD0eZCwwBsNBFVb34Tk34pKldH45OkxMD26Q4fm9j6ZqPVJQ9AuRsfbj6AGUmGY6G6fAC0kTfmr02kQCQDFNKK+YCVBlQTlXP7cPDm04sQcuJLsE+u0t8DHtROYu/H72wnRHWuI8divTwbYEeWH7PLQ/vXMSdXX88ZT4WMKIsLO7fkqGtLBXTJ/yNTTIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from LO6P123MB6616.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2b2::11)
 by LO6P123MB6999.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:347::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 12:37:02 +0000
Received: from LO6P123MB6616.GBRP123.PROD.OUTLOOK.COM
 ([fe80::3975:c5e7:bc1a:f383]) by LO6P123MB6616.GBRP123.PROD.OUTLOOK.COM
 ([fe80::3975:c5e7:bc1a:f383%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:36:55 +0000
Date: Wed, 2 Sep 2026 08:36:51 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com, bp@alien8.de, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, frederic@kernel.org, 
	marco.crivellari@suse.com, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, 
	mproche@gmail.com, nick.lange@gmail.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] x86/mce: Avoid arming periodic polling timer when
 not required
Message-ID: <q763ak7xrotyqmzuu4uwxtk5aec5p4mrdwdtsnq6i5sdtlnm5q@ujq4y6wtztlf>
References: <20260902020234.149814-1-atomlin@atomlin.com>
 <20260902020234.149814-3-atomlin@atomlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902020234.149814-3-atomlin@atomlin.com>
X-ClientProxiedBy: BN0PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:408:ec::15) To LO6P123MB6616.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2b2::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO6P123MB6616:EE_|LO6P123MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb2ee85-d845-4f01-d367-08df08eedf3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|6133799003|10067099003|56012099006|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g/KaqMA+/DYws5ujS/Z0HGSZ4FqzcwlNw2uwRbTAgIUZYzV8QiPN4zOaJEhvzE9nrhWXJ2fVX65CM374+D3bOdd8qlTu+exX5n2Y3HH5Wn1ngByVc9KAzdsBUCd/pd5MuU/2Ehd+O5kiCfBnHMC1cpDYpaTUDsj4KKpqfjZuNHxFRuGa+9KL3O9tEsactdTyvb1KeM+WmopvIcXq066vc05JMBpCOlpAMgbIbbxrVRSEstq+ZIWTdKA9ue0ISmsckf43EXza74E5Dk3nyoQgQ1z4PxfKYAytxMM/8xaYWc548tWJHiEy4XzUdMx67kvk1B6FR3F/hKuwrJdzKuNkRWBxeoenWLLzs80cd6gRYmsSMN0SwpOafOAAovVUA9woQ+1IyrL0ZlR90JJSFQjnNljAVd6i9z1i1jZrqmsvyMsR2VzP78raxy1YygjrdwDIRzSxGZnrbAlz9MTfexc4mk91x86caawymd6N+oBCYqS3FEVIBv7Pf95q3blgEINrl4+b3D3aznZK0T9xxPHScpUkFDjvs5pH8JF/ErdhNOqZ5nOP4j5Xf7HTbz08cB9zzSGAS4rBNOVMIMNxM10q+bIUK1gU1/4fJ0RNiTVIMzU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO6P123MB6616.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXcxT0dHQW14bjcya3FGcFRYZmxnWWl6cnE4SHhtZXIrYjl4aW42VUlsTjg5?=
 =?utf-8?B?Yk1ZaTBwMzJPZGJTZlMwSkllUzM2dVVaK044dVZxTzlTMFlXWDBjSGJGbzhD?=
 =?utf-8?B?RFpENEN5RWo2OXN4ZFdxdHNUaWo4VXFiWCtpcUtSbmFkck0yY05LQjVaa2ts?=
 =?utf-8?B?VDNkTXBIejNvaU5DTTFyS3JleU5ZRndPUnhZdmhjRTVOa25KVlErWFNib2d4?=
 =?utf-8?B?eUM2d2haMm9sY1laK096M1hQVUN4RklmeDdvV2w0Q2swY0ptYWxqcWNTU3pn?=
 =?utf-8?B?TE5EYnVYWmpiK2x2N1kyYmtMcHZpeTIrYVNIWXNrK1RTUks1eStWR1AwMWtE?=
 =?utf-8?B?ZTY3N0Z4OFpIOS9rMG5BZEs0Tk5tbWNldm5qbWtFcWRCanB0Q3RxMjdWTHlF?=
 =?utf-8?B?L2plcXlJUDAvVFU1MnFLRGJlY0lya1lMRWZDSWtyWVhBYXFqZGYzazlKd3g2?=
 =?utf-8?B?RHZPenFERWFGL2J1MFB5TFVtZzN4RnJVYVVNNno5M3dBVk1kcGw5NktaQ2xx?=
 =?utf-8?B?ZTdvN1JuODhUK2FXM0tVcmNsTnZPSmhUTGdxVm4rUHhIaDEySTRxOFAzQmpM?=
 =?utf-8?B?NGxNamtham54SkFmK01CT1lqcjRHaHdhVExzVHlFcU53ZzNIZmZLM2RuQlhi?=
 =?utf-8?B?MmhlVTlkWDhxbEM0d3A3NExFQkdOK1dXZDljdFUrMHhpc1ZwdWVKMkJyam5Q?=
 =?utf-8?B?a1AzOHhPcFhQTGs5MTl0UDlZVlVVeldWYTd5UHFRUjhHU3FJZFdNRCs0SW1x?=
 =?utf-8?B?Z0tKbVFsSEtZQVJka016dWpFOCt1V0lQd0NuTHlHSGRQR1N2WmdtSmtpeWt3?=
 =?utf-8?B?b1I1eHBhcnp2TnFoL3h0S1gwNmF4VFE0eW5naHhqMzA0V1pDTzFOOEt6Misx?=
 =?utf-8?B?QWVBZkFHeFpseWVkNzkyeXRJZVNIaVA4ZUt2MTNxQTdoS0NZeU5KVmlsTEpw?=
 =?utf-8?B?REZaUklxeTR1V3ErN1FVcGpsMU5mbnZmenJFV3Nna041NzlML1dkSE1Xa2RJ?=
 =?utf-8?B?QjlMaGdRcE9EODE2dFJhRlBaZmZERDhobDNpVEM4Qk1HSzY4bGZKTVpYVmhZ?=
 =?utf-8?B?ZjhMZm9hMk1zbytrRitLUnBPL3JYUzlScVV1SEd2QlhCVWlUSENiQ0VXMWhv?=
 =?utf-8?B?bnlEUDBnZ2tLd1NSWW13V0ZuR2ZMb1JtaHhPNnFvUlBmT1V2a3RQQzg5dkNv?=
 =?utf-8?B?Ujk4R0htK294ekRsNi9wRlJ4MkVTUm42alZ6VFBkNEdXSndkdlZYdCttZlhh?=
 =?utf-8?B?bHd5MjdnaHB3T1hJREhCNlJjZkYvMmxWVitOd1FIaG4ra05XdlJCM1k1bHlD?=
 =?utf-8?B?bGFhS0FYWkVBNFdtdWlpMDJ2WkRTRHBXY09keU10aDVJbFljWFFIWnZKaHFh?=
 =?utf-8?B?SmpxN3g1Wm92Mkc2MllZVkVpN3ZCNzBmVUJxZVEvYkRzcDh0WDdwYit2Q21G?=
 =?utf-8?B?YkNQREptY2RKSFpNYUhQOGdieHE0K0VGMzdBSmNwRUc2S1pLd21CM004L1FX?=
 =?utf-8?B?QzZlZGU5WVZKVUxrclVOVEE1VzFEeVdsaU1mdUlCR1pCVDBTZzBrd0w0aEJF?=
 =?utf-8?B?N1Z5SnlxOGduT1RRUmFTYlZIdlRJTE8yb2lkOFlOZGQzck0yb0dNMWtNMW1D?=
 =?utf-8?B?OFpoWkRNOXBHSDdEc3pFb3h5WHo3QWYxR08rYVJOWUQ2OFM5TnE2ak1OV0VJ?=
 =?utf-8?B?RWhWLy9zbHFOK2phb2hNWkxZQWhib2h3dmxKWkJvYVIycVNzMG9qb0xWdVMr?=
 =?utf-8?B?eEZrc2JGR3dIdVhLMUNHa3pOdk8rVkNZR2xvL2gxOUJjZi9xRXZVeFR0NFlX?=
 =?utf-8?B?SE53eUJTcVZNeEkxbzRycDhNUlR6TThwdXg3ZTZCanM1RHVkcDF0VEJiOHAy?=
 =?utf-8?B?S2FGWktxQ2RRV0UrdjU3Y3JWMzlkcWovOXUrUUQyeW85am16UnhoNUUreU9C?=
 =?utf-8?B?Y0pkaWJiSFFZV0hIZU02blVFUy9wYUI0Rnh4T1A3TE1IUU9RWDRlV2lVNlcr?=
 =?utf-8?B?L3lsdFFKTGNzRk16WklOZk5nZDJhYndaaVBLOVloVzMxelFPQzhoQURiNjdH?=
 =?utf-8?B?a0F1MXNYU2NRb1RYWjc3N0p2UXFrVkZJRW9iM08vTy9hZkFuWGV5UGhEVmQz?=
 =?utf-8?B?UU1QcHd6UUJmRUUvaFdwNDdaSU5scnRPZlgzRzE0SXk2Q0srYWcvdytLdHNj?=
 =?utf-8?B?NkxWQWpJQTRtcWtFeUUyd0pxN3NJZmhiUi9FYmZxU3ZwNkFSZXdHUWFGM3Uw?=
 =?utf-8?B?M3VMMnhyamI1QnhocWJEYTRyOTkzbk9aWFlqYW95ZmNVbjQyWE90RTg4bE02?=
 =?utf-8?B?REIzSjI2cUJLb2c3eUwvMTI2WktjWEZRTHpVUEpuUkM3ZzR4bWpTZz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb2ee85-d845-4f01-d367-08df08eedf3b
X-MS-Exchange-CrossTenant-AuthSource: LO6P123MB6616.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:36:55.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6BwDpyRfuHKulQie31vPz9THflBFpuTjAYl+pakv/RgBMbso6X/Ldt/ar2vUq6R6Z/V0QrXN/AtGSzerlbR0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB6999

On Tue, Sep 01, 2026 at 10:02:13PM -0400, Aaron Tomlin wrote:
> On x86 platforms, the Machine Check Architecture (MCA) subsystem arms a
> per-CPU, pinned standard timer (mce_timer) to periodically poll hardware
> banks for "silent" corrected machine check errors. Because mce_timer is
> pinned to the local CPU via TIMER_PINNED, the timer core cannot migrate
> its expiration to a housekeeping CPU, causing periodic latency jitter on
> isolated cores.
> 
> On Intel systems supporting Corrected Machine Check Interrupt (CMCI),
> hardware generates an interrupt for banks with CMCI enabled, clearing
> their respective bits in mce_poll_banks. However, for banks where
> MCI_CTL2_CMCI_EN does not stick (such as the Power Control Unit bank),
> Linux historically assumed software polling was required and left the
> bank flagged in mce_poll_banks.
> 
> Per the Intel SDM (Vol 3B, Section 18.5 "Corrected Machine Check Error
> Interrupt"), if bit 30 of IA32_MCi_CTL2 is zero, no CMCI is available
> for that bank and no corrected or Uncorrected No Action Required (UCNA)
> errors will be reported on that bank. Therefore, polling such banks is
> redundant and wasteful.
> 
> Clear non-CMCI banks from mce_poll_banks in cmci_claim_bank() on
> CMCI-capable CPUs, and amend should_enable_timer() to:
>     1.  Check bitmap_empty(mce_poll_banks) so that mce_timer is never
>         armed when no banks on that CPU require software polling.
> 
>     2.  Pin the MCE polling timer to a HK_TYPE_TIMER housekeeping CPU,
>         sparing isolated nohz_full cores from periodic wakeups on
>         systems requiring mce_poll_banks polling.
> 
> On modern CMCI-supported platforms, mce_timer is eliminated system-wide
> in steady state. On legacy or polling-only configurations, housekeeping
> CPUs perform routine polling whilst isolated CPUs remain jitter-free.
> Polling fallback during active error storms is fully preserved.
> 
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  arch/x86/kernel/cpu/mce/core.c  |  7 +++++++
>  arch/x86/kernel/cpu/mce/intel.c | 11 ++++++-----
>  2 files changed, 13 insertions(+), 5 deletions(-)

Hi Tony,

As per Sashiko [1], the last paragraph should be updated to avoid
confusion, thank you:

    "On systems requiring software polling such legacy platforms lacking
     CMCI or when booted with mce=no_cmci, the mce_timer is restricted to
     housekeeping CPUs. While this intentionally leaves core-private banks
     (e.g., L1/L2 caches) on isolated cores exempt from periodic polling to
     guarantee zero timer jitter, housekeeping CPUs continue to harvest
     telemetry from their own banks as well as shared package-level
     resources. Synchronous (#MC) exceptions on isolated cores remain
     entirely unaffected."


[1]: https://sashiko.dev/#/patchset/20260902020234.149814-1-atomlin%40atomlin.com

Kind regards,
-- 
Aaron Tomlin
