Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022131.outbound.protection.outlook.com [52.101.101.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8ED3BCD2B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267754; cv=fail; b=tlCSydr6hgXkebp+Ng/iaAhkhdYA9CVccwvpBPi92HDUN+EEbeZZdMkqhu1xQ4ZfMJBjUBJ2ySdMALrRZmBa+ORpx2Bgsy34rjUkvx1ppKylM57Ix1uK/76ocInKrEb753CBcFInVgsmgROATUFUE55l1IL9MSJEJQaayDZkWCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267754; c=relaxed/simple;
	bh=YaxA5e2Msou+hNfzEvmHBljdchdXKqhDhlF7GYn6k+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ACJ/SNkFbkTHmXkwcbo4z/7OrloQp0DoLpAVkAyP6KRGE5WVI66/4ZrvvnkubP1WYubX6YbWdb185XtPpBk4sxbqfZYD8EbM9aanNK59ki2yChrcVYBt0yaRLp3UnFkMlXsgbapmqmDXhZfzLYE330ZTF0WtD5E7AjjGhvOd574=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHt70IZf30YylUfOUxOincGYOKO9+2r8vo2bEgbPGfLWVaHY6FofZFeBWBidWcSOR1y36LoN65/Zb9qowXhzMZ0YI19gAwnBzDSByg1KqrLIwwcHUQlqIvFIAagDVRHS93tsvFdOmJzXUlbD3LDE5ORt4fTiYzCpQ7HSUckCC8MJc+lcxpgMUbkK2qnlh26SF8hSi73xznxJtQSavsNvMYzuUZa8wpfMjchAWfjw/HnTQAiST9ltUjEUw9/ncUqDiRYQ40fijLCf1lV0njpkoWtQoW715XpBg/c2W+jEyro2a6UuUl37/rkLQktQ6PMdm4xNP0Db8u0EUYSmPl/j9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=opiWxe4PDKhbg3w712/uzx8pwHCVvzXlY5udqcXSIFM=;
 b=pswnd238kMcR3uzcJKJgjwLPO6Ze5/SEBjx1+WvQ7hQFdn4ADF7R831K+pc53lsIRWs07mv99lWfwWRjt9BAfqJn26bbLFUcH13aWG2WWcqQ3TbHJdQ2fy0c59fI+C0qAlll1jRZ+pI9Se7hoAnQDrqctRqgSalRJuJRw0S8RVoC+lXu1UEDwF/bmUzghKenlhM/5CE+B3VBMKx9m4TfCjyt38jdYMQBP9CpAo2FusLHITvwaIf1zxB5f5pJ2/QRXw7tH+aLu9EMZxlDZncdeRPs9c3xjzcTHWA+Vb1O7EQbHM5W2TxVjOouy+o9a/vALspCyi3H4i2cULcIT9QBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOYP123MB3405.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 16:35:47 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 16:35:47 +0000
Date: Thu, 24 Sep 2026 12:35:34 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Petr Mladek <pmladek@suse.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, rostedt@goodmis.org, 
	senozhatsky@chromium.org, neelx@suse.com, sean@ashe.io, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	john.ogness@linutronix.de
Subject: Re: [RFC PATCH] panic, printk, sys_info: Introduce
 crash_kexec_in_memory_sys_info
Message-ID: <bw764via7pr3demxiq7mwnnysdafu5e5qt3xtnsx5jfjxu3kmb@ksxcdlwolwxd>
References: <20260916201546.661384-1-atomlin@atomlin.com>
 <arKe6WiDWKpv-_S3@pathway.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arKe6WiDWKpv-_S3@pathway.suse.cz>
X-ClientProxiedBy: MA3P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::11) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOYP123MB3405:EE_
X-MS-Office365-Filtering-Correlation-Id: a776cb1b-b707-42ce-36a7-08df1a59e23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|5023799004|56012099006|3023799007|4143699003|22082099003|18002099003|10067099003|6133799003|27256017;
X-Microsoft-Antispam-Message-Info:
	CXtD0nJ4JkBzGQ3AwLfax4NCjbWSDamYIgZ8cEgePtRT1/Gcub4Lq4tuJ4Lm18lX6hg4MJig4o1rbdlgXe6IxvDEpbPUaHG2ihlPZsZhpwAZPBJ3Hxj5teu+yI2BtjK+ilSpgUtXmpsCFnElx79YiChtKnsip1gFaN85Cge79TLFpy57YnCakC1YsRnIHsxbbGGpIam+PFeAoVe+id799IOfRUHvuSuTHodGmJrrqBihptYLO6cjDnhRyTI9MVZbPWC4NaEQp2QyY+P90iSfhYMx28gcLHsGwvWzIWrjYgCtEb4HAPkpSyOLUFI/plYH0dJs/4tb0Li1+UBHnMiKLuRA7EkPMR7iszmWC+bgLOihAxyNdjhQM5FzuDfh1scv1Ejt59+55l/Yk4OFPh3IR9WO12fq50evbIfcwDTg9RgQhzlYaPp3Nbja8el8aDzjoTKfOBJ5evU5zQSSbLFW+7VdO2K3MCspp9K21Q6NUjfJb/E+qhim/IJ8PAgARJ/uLKKCN2M3mmJcM5qyHaJ/BUWpj6XoV2BCkyRjhD5tFE6hAwpytsosNAPnQrTH5ZcibdHEnOkKVtcvoCj9T4pceDtYzVY0zkDKpeIPRoQNegQ6rcvm3sKqvUTELP6cbHq3jb9JSIlQnwFMpOpvXgVBwRSFLygesGW7ct07M0hZzIyi9tKpOlGTZtsriA2l75yx/Yw9AwtjyOg4PouZzkrYiP4G3A72R62tatnRGLFs+xs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(5023799004)(56012099006)(3023799007)(4143699003)(22082099003)(18002099003)(10067099003)(6133799003)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzgvQ3pNM2cvUDBXVWhLZXp2Y0RYTWd1MXhGSmNNaDJpSytQQXBPcEtudHVh?=
 =?utf-8?B?Q25wMzJlZjl6MEtPRUo2VjdIblZnVlRNd2R2Tk1MQzlFd3UyN1REMkowbld3?=
 =?utf-8?B?Wk02Y3NyUXVUdG5GRExqQmFKNW9Cd2J3dnljNFJIaWdMcVVZeGRnUDY4ajA3?=
 =?utf-8?B?bkdHZEt0dkdTdkVmNnlsU0FBTmppTjFUN1FINHpFR0I0VzFkMWJoN2NQZGdu?=
 =?utf-8?B?OWhDcnNJd0tRTzU1SU1Ma1dqVThicDBDbmVUWFBxU0NXWUFLTGxUckx2Q25B?=
 =?utf-8?B?YU5zNGdRditscGNyeTFOZWw5eGZYZ1VVMmR2OW9xeiszaVVybG92cEJOWFpr?=
 =?utf-8?B?eTVxbXdQd2tkSUsvNk1OYkRLVDFIZnBIT2xFVXA2bWkwLzFWdENCMGxmL3ow?=
 =?utf-8?B?K1NQMUtBOHhCeHNFRXFQVnB4Y0VsVU1iYk12aDBEeWFhbVR3QVloWTdjaVBa?=
 =?utf-8?B?aUNIbWJydGJMRVFBOWNES3M3WnhpdG1pRXU2bGZyN1E1aUYzc21NakhYVnV6?=
 =?utf-8?B?aW1peWpERnBFVlpPV1FhZXp1OU1uekEwM1ptMGhQMnN1N2FSWklTWlVVb3Yy?=
 =?utf-8?B?UEtHVDNvdHRYQ0dYREhWQVVIZkFNaE5hVXVyT0RZQm5Oc0M2OU1SbExLY2tO?=
 =?utf-8?B?U1J4d2hqcnlwb0RiN05Od3o5cmhWTi9Td0VBRWQ3d3c1VVZwVzBtYnBEZkx6?=
 =?utf-8?B?UXU3TnZDVGt2ZFdXMXFQQXJQUnM5SXNHVXBTaDdvOWpwTCtqVFJuV1pyUmdq?=
 =?utf-8?B?YUpOYkhSYjN4NE5vMnU1VVBNWVFmYW4xbk9CZmxuRzRNSkUzOW50QUN1c3ho?=
 =?utf-8?B?aVNNYmtHdzdkMVhmSXF4WUVucEM0VXRaOFBpNjFuV0pmcHJsOFpyNm9Gc016?=
 =?utf-8?B?ZHpTMzRQdzhTL1VlcnRxRCtYa29kN3Z3MEZzdFl3NlpxbklLYVpBRnYreFN1?=
 =?utf-8?B?VTg5WkxsYVB0R2k3UlB6UmY0dkFXRE05SjFvNkFvVW03YmdvcEtaNGFwckEx?=
 =?utf-8?B?L2tGRWVGQi8wemZjVEcvVGJOZExwZzNUaG5DT3J5TStOVVdSN3c2YlBDYS9w?=
 =?utf-8?B?a3RPelNQVkhOdHdHQUkyeWRrSjY5M3NrV0FPVUZwZHhlTWNJMHlJbFNHOUI0?=
 =?utf-8?B?eS9MVEZmZlpRbmF3Y2tteVJ4N1E2TUk3MWMyU3RqVzhWWjV5TFVCZzNSK1Fh?=
 =?utf-8?B?TlNWZDIzaW8vNXc2M29nM3I2aTJUYy9Mb0JTSFQyZ0VEdnZvTklNU0dzVVB0?=
 =?utf-8?B?bVBoQXh5V2kvcm1BY0hBTGVDM0U1SFlmc29wcExSa3RVNThYMlMzM25hZnV5?=
 =?utf-8?B?MG5PRXBDdVh4WEZUc0tOTGhSQ1lkaVlVRWgrTGJhNkF3MXhPMlE4azRjaHBG?=
 =?utf-8?B?OGt0MENRUHRLcWxLaHprcTB3YjVwcGhRN29zWWZjWjE1WklVTUgxcGlXREM2?=
 =?utf-8?B?OUFnRzhrUk45eUVEdTh6bDhESlR4MDR1UkFMVkhqa0NsekhaUjRmc3FGbnBm?=
 =?utf-8?B?K24wQXk0NkpYRERISEFld0xCcGpTRFJJZ3pHNldpd24zMnorSTVUdG90bkF6?=
 =?utf-8?B?dGh0V0JERHZiMkxieTR5TUl4WEN5OTBRNVRFUy9xMkxMUWlkTHdEdWpYL25N?=
 =?utf-8?B?TzFIZmNRdzNIZXpxVTVhUzg1SnQ1MGtCRVJ5UTUyazkzaEMweE0yMzhpVUJO?=
 =?utf-8?B?NTdOVmRKU3ZidWpEUE9GeEJvRTA1dEMwT3J4ZTM0NzJLVmE2R3NCc092L20y?=
 =?utf-8?B?R0RyRDhlUFJYeVZTSWhFSDRaaExNbXBSNXBOOWloRnlXcXJERjF5UXdWbWhJ?=
 =?utf-8?B?RGxXV3pBWnZobDhDY2RxS2lscmhROG85MnQ4bGZoU2ltWVFFa3ZJdFRwSlVR?=
 =?utf-8?B?dzU4QVBodkxWTFVjQjhFZklYcVdtbGtPMjRtcDlVS05hOVQ4WVY2UGQybWJa?=
 =?utf-8?B?OGtBTFBPR2lRVmRhcnNCZzBQeTA5N3lZTmxKbHQxTmhhdDllM09RTVp0TW9U?=
 =?utf-8?B?aGs4L2lHSG9DZGUzMCtJanE0NDh1dG1XMGtoZkNmZHNEVjN4TDQwVk9RelVp?=
 =?utf-8?B?MTlEMlN1c2d1SHQ2enczdERTT1g3cDFJaG4vZmxlajI3TklMK2dQKzREcmVL?=
 =?utf-8?B?N3kwdFk1QU0xcnNBamhWWFhDSzhaQm5MbElNQitpZlU1b1d5T1d6Mjg5VVRM?=
 =?utf-8?B?NVN6b2hESUt5SzhxYkorSG44bFVzNTdQd3JmTjlDWmtGOFo0citUVmM1ZjZa?=
 =?utf-8?B?Zng2ZTNxRUJzNVEvdUJlVlFhSTFpV0hubDdQVGhNcnFYRXBjMkdhMytwdWpp?=
 =?utf-8?B?OXdFOFVTcFowVGlsMG1ZU1dubCtvc1hzMGtpZDdJWnBuSFpRbHlqUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a776cb1b-b707-42ce-36a7-08df1a59e23a
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 16:35:47.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQMv1Qm7HTpXLTBl3moOQhA+Dbfds3QH2/oPrH2529DLD/k//A8N7D6t+hCquAAUdrWcYwj+SmEVXUihrPcneg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3405

On Tue, Sep 22, 2026 at 05:29:45PM +0200, Petr Mladek wrote:
> Adding Guilherme and John into Cc.
> 
> On Wed 2026-09-16 16:15:46, Aaron Tomlin wrote:
> > When investigating kernel panics, capturing post-mortem diagnostic
> > telemetry (e.g. memory zone metrics, lock states, active timers, and
> > blocked tasks) is vital for root-cause analysis.
> >
> > While crash_kexec_post_notifiers allows executing panic notifiers and
> > sys_info() before jumping to the kdump kernel, it is frequently avoided
> > in production environments due to the risk of watchdog timeouts induced
> > by synchronous hardware console emission.
> 
> There seems to be various motivations to set/clear
> crash_kexec_post_notifiers.
> 
> Guilherme wanted to add some filtering because some notifiers
> were failing, see
> see https://lore.kernel.org/all/20220108153451.195121-1-gpiccoli@igalia.com/
> 
> I believe that they are called after kdump by default because
> the information provided by them is included in the dump.
> This idea is supported by the commit f06e5153f4ae2e2f3
> ("kernel/panic.c: add "crash_kexec_post_notifiers" option
> for kdump after panic_notifers").
> 
> On the other hand, crash_kexec_post_notifiers is explicitely when
> the kernel is running on some hypervisors because the hypervisors
> need to get notified about the panic() before crash dump.
> 
> All I want to say is that the situation around
> crash_kexec_post_notifiers is much more complicated. And I hear
> about the watchdog timeouts in this context for the first time.

Hi Petr,

Thank you for your feedback.

Interesting. Guilherme's work on classifying and filtering panic notifiers
sought to address a well-known vulnerability: namely, that third-party or
device driver callbacks registered on panic_notifier_list can be fragile,
corrupt state, or hang the crashed kernel before kdump has had an
opportunity to boot.

However, my proposal here is quite distinct from Guilherme's effort, though
it shares the goal of making pre-kdump execution dependable.

    1.  Bypassing panic notifier entirely

        I deliberately avoid invoking panic_notifier_list. The instability
        of arbitrary notifier callbacks that Guilherme highlighted is
        precisely why some operators avoid crash_kexec_post_notifiers in
        production. Our intent is strictly to collect well-defined kernel
        state via sys_info()

    2.  Purely in-memory collection

        This patch addresses both dilemmas simultaneously:
            - It eliminates the risk of notifier instability by not
              invoking panic_notifier_list.

            - It eliminates console stalls by suppressing console emission
              and freezing the printk tail, recording the telemetry purely
              into the printk ring buffer in RAM (within milliseconds)
              before jumping to __crash_kexec().

Consequently, the capture kernel receives an enriched log_buf (extractable
via vmcore-dmesg.txt or the vmcore) with virtually zero risk of hardware
watchdog trips or notifier lockups.

> > To resolve this dilemma, introduce the crash_kexec_in_memory_sys_info
> > boot parameter. When enabled, it captures diagnostic telemetry directly
> > into the printk ring buffer entirely in RAM before jumping to
> > __crash_kexec(), completing in milliseconds rather than tens of seconds.
> > 
> > To make this safe, fast, and reliable without risking buffer overflow:
> >     1.  Scoped console flush suppression
> > 
> >         Provide printk_suppress_console_flush(bool) to clear the console
> >         flush mask in printk_get_console_flush_type(). Messages written
> >         via vprintk_store() remain in the printk ring buffer in memory
> >         and avoid synchronous hardware console emission and waking
> >         kthreads.
> 
> This might help when the claim about watchdog reports is true.
> I am not sure about it. Anyway, there are other ways how to
> prevent watchdogs stepping in (touching them, disabling them, ...)

Regarding watchdog intervention, the concern does not stem from internal
kernel watchdogs (e.g. softlockup watchdog), but rather from autonomous
vendor-specific hardware/platform watchdogs (e.g. hpwdt).

A situation occurs with IPMI watchdog
(i.e. drivers/char/ipmi/ipmi_watchdog.c) configured with pre-timeouts,
where the BMC asserts an NMI and independently enforces a hard reset after
a brief remaining window.

In these configurations:
    - "Touching" the watchdog is ineffective i.e. touch_nmi_watchdog() has
      no awareness of external hardware or BMC timers.

    - Some production environments mandate nowayout=1
      (drivers/char/ipmi/ipmi_watchdog.c), which deliberately forbids
      software from stopping the timer.

On a slow serial console or IPMI Serial-over-LAN (e.g. 115200 baud),
flushing comprehensive sys_info() output (e.g. tasks or stacktraces) can
exceed 10 seconds, allowing the hardware timer to expire and reset the
system before kdump can initialise.

Regarding your remark that console output is important when crashdump
fails, I completely agree. That scenario is explicitly handled:

        sys_info(si_mask);
        kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
        __crash_kexec(NULL);
        printk_freeze_tail(false);
        printk_suppress_console_flush(false);

If __crash_kexec() fails or is not armed, suppression is immediately
unmasked before proceeding down the remainder of panic(). As a result,
console_flush_on_panic() flushes the complete buffer, including both the
panic Oops and the newly gathered sys_info telemetry, out to the physical
console as normal.

To clarify, an independent, external hardware controller will forcibly
reboot the machine if the kernel spends too long flushing diagnostic logs
to slow physical serial lines before jumping to __crash_kexec().

> 
> The console output is important when the crashdump fails.
> 
> >      2. Scoped ring buffer tail freezing
> > 
> >         Introduce printk_freeze_tail(bool) in printk_ringbuffer. When
> >         active, desc_push_tail() and data_push_tail() refuse to advance
> >         the tail. If diagnostic logging exhausts available ring buffer
> >         headroom, new records are safely dropped, guaranteeing that the
> >         initial panic Oops, faulting registers, and primary stack trace
> >         are never overwritten.
> 
> This is another questionable feature. The ring buffer would need to be
> super big to hold all messages since the boot. IMHO, servers are
> normally running hundreds of days and the log buffer gets rotated,
> like the user space logs, ...

Apologies for the misunderstanding regarding the lifecycle of the freeze.
Please note, newly proposed printk_freeze_tail() is not active from boot,
nor does it hinder normal buffer rotation while the system is running. It
is activated strictly for the few milliseconds during which sys_info()
executes:

        printk_freeze_tail(true);
        sys_info(si_mask);
        printk_freeze_tail(false);

Prior to this call, the panic Oops, registers, and faulting stack trace
have already been logged. The sole purpose of freezing the tail during
sys_info() is to prevent newly generated telemetry from wrapping the buffer
and overwriting that initial, critical panic Oops if the remaining headroom
is exhausted.

> >     3.  Execution sequence reordering
> > 
> >         Reorder __sys_info() so compact, high-signal subsystems (e.g.
> >         memory) are collected first, leaving high-volume dumps (all CPU
> >         backtraces, full task lists, and ftrace) for last.
> 
> This might make sense. I am just afraid that it might be a personal
> opinion and we might end up with an endless shuffling here.

Fair point. The intention was merely to prioritise compact, high-density
metrics before unbounded dumps (e.g. all-task backtraces). However, if this
introduces unwanted churn, I am entirely content to drop the reordering and
retain the existing sequence.

> My opinion:
> 
> IMHO, it does not make much sense to dump sys_info() before kdump
> and block consoles. The information is lost when kdump fails.
> The information can be extracted from the crashdump when
> kdump succeeds.

The information is not lost if kdump fails, as suppression is immediately
lifted. In an ideal world, the full vmcore (i.e. makedumpfile -d 31) is
always saved intact. In production, however, dump targets may suffer from
storage exhaustion (e.g. accumulated prior vmcores). When this occurs,
writing the multi-gigabyte /proc/vmcore is truncated mid-stream, leaving
the memory dump corrupt or too incomplete to extract dmesg e.g. via crash
or drgn.

Crucially, kdump utilities (e.g. makedumpfile --dump-dmesg) extract
vmcore-dmesg.txt first. Because it requires only a few megabytes, it
reliably succeeds even when saving the full vmcore fails due to ENOSPC.
Capturing sys_info() in-memory beforehand guarantees that vital state
remains preserved in vmcore-dmesg.txt as the sole surviving diagnostic
artefact.

Kind regards,
-- 
Aaron Tomlin
