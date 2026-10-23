Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782720;
	b=yuK76SqKo4xRUvg+YEow1JnARrMEZrSOMe9tOq7hOjkrIp+ANGd1WKyI5YWEnFIOmgAl
	 8WljJCvXhPyPH0a+jK7QbLGh5HB88MWo/R8+YYsdj1yRP1GvigpiDDL0JPjgjrLdB43nR
	 H/0bVr4JcwaZsMvbxWS1aFFfp44crWtSjcO2Dq0NJAhEzqMurB0fopaMVHAwLaT4FuDqX
	 PFnQZIGB5hwN1xgTxWx0KhPs0x4mcR8F2tfV7TBUHLoyYYzLQisB0VHcsyuiyF44LP9XM
	 no6EjNyG6cPpCGZcP5LwCKUzjh3GCKEMhZsB+5LcyuiXRVhGAYB5M22XQ3V2SgE4EEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782720;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:From:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9I3nfi/zCxpfxBzYXDJ/rk4ur0A2HXnoooyC3zKal0U=;
	b=SMoG+6RfWE7b6Dmpf0GxATAD6tyLIRiIfJKpgc7sShwxLcdYMNX0f41TR6TrjDHrky7a
	 9OQn8uIfpphFium2tMm8UEAPw7bLE9nGlhiU4RoJi7mmnrB9VLG/FgQQfhkaUl6ZZ6xba
	 Yp2gxhvMQ6/a/5MAOgpi+liJuYhz/enhVsfdSwkmQZHuQfa9nUVIhbw2a4cbeIfC4G0h1
	 nnznN2clWStFphPTHLJEwqLYey5CX6dvg0jOFwgkk9wzjCtSxxNQNPV2QjNiqWNK7Z1Gu
	 bObROxnyv4nPiP6aYY0WzalQdpeKIgo0VcBT+4pWiApU94xlY/AY9ljxBdUusso77fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AVVgbw5H;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gcwxglSE;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7245606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7245606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AVVgbw5H;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gcwxglSE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792782718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9I3nfi/zCxpfxBzYXDJ/rk4ur0A2HXnoooyC3zKal0U=;
	b=AVVgbw5HD9Alq0EhT+iF3WGmRyVJDwdJzhGzRnNH5SuQwUXXvOfoIV5fgKzzlqlL032UdY
	HARYnCkrP9pZ3aJJUJTVyTIe9f7MrmAE9PloNEpjGvDvjrs5QiUQsZcLnxdER6ATp0Q+pz
	a+OqsMf+3C9vLqsAwmHFhJb4HURGjuU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-EVe98ktcPs6oWNWr20viKA-1; Fri, 23 Oct 2026 15:11:57 -0400
X-MC-Unique: EVe98ktcPs6oWNWr20viKA-1
X-Mimecast-MFC-AGG-ID: EVe98ktcPs6oWNWr20viKA_1792782716
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1fa972b4fso6120275e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792782716; x=1793387516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9I3nfi/zCxpfxBzYXDJ/rk4ur0A2HXnoooyC3zKal0U=;
        b=gcwxglSENpiG8H0/G3s1KgxGb5C9fnx7KEt7B4jrfwCV6eDao6/0CfYrHLLcDRMvMA
         ex1d0zTPaeYWjJ7Vul4JUGREhyYxzaLXQoJXKRC26uy4nBWs2ktlTvMf2p3Z8QV+zB6Q
         467NgKO3nqggJwiI7EBjWf4Afe+Gi8tS3jfk7yK0EZ6qDT+oV0nyskTYuJOvaDvaBrRj
         qiSFVKCJDXCVZbXhV+gdQG+VV+KTTdfanuvfKr9w7oPwmzttm88oUQw6e+OReNN7TiIb
         n5R+wcdg1qENP952P4SCJHd2umqOdMrXWxEDrE61bGR7e8Q+zhtyknEISDJ66Xs3gHof
         3iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782716; x=1793387516;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I3nfi/zCxpfxBzYXDJ/rk4ur0A2HXnoooyC3zKal0U=;
        b=D9SOV62UrWyLMMamNDAOXWaRAw86ciTI6rBGLD9lDXCBPB+dZlPbB56agICznz4dry
         t31waT+L1tMCxzeyhKafLBp+7ARti8Hyol59faTrdLMUtbHSvMZOf3k0llJTf/w8CX6c
         pJRwlkP/ZH+WLYGpDCg8la4nehBoxw09S4Swp7EbZlGGP8AzCiM16bz6fg01Wi82PsTb
         WM3tl1z43KWw0O+7IRYk73kFTv3oP16XlpklKRVih3UMLbhSv+19MPYcyUiRSIceIMtZ
         3R/gDdIDmAibaScjWdejxh8KVv5FEebBhmRMXWmHmDL8Aty6n7FV3qM3bfsUPzDOYEZY
         6DUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ95lWkUNY+rAjDtXSSI+rB+APcZz0vgg5nb/3B/+iTb5JOidfVxwz7SfuWiwvQAXOWSUEs0MgSJysflo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlQ8NAMve+g/qkZnSVcoSsbbvhhs2sbg/Te72y880diSa/zlEp
	dUn+aOowpSj8kyTp56Os/bEqK+XFvvvJVQKtmwq4DBCmqY57wdph6lgTjqJ9a/421ih5HANQUC/
	WWlRjxNaY0PfYiKHJVnODk63hNoX0d881AeJzrse9UkNElz55xL7I03/yDJ3A5nV/WA==
X-Gm-Gg: AYBFou0UNg/7z2K4sxO8wgDl6DE9nbzLPMxtRHPNxc0K+JKhGC0xuxIBPyfYE3zpvaV
	d4wDZg3PJim/4qHxfO9qxE1DbN3IR3C/vPpx5AcvBuMZQfMQmMx7+GssKC9o3Gc0ShrONLPyf5T
	RY/vc0R5uZghqLBsGpWwOSeRdsOBZi44wrmoCZtWX8osJ4iDDi4/AV6QoBlWOGYQIsx7x1C+5B2
	zLbBf1ltXDrno4b1VwKGhuEfI+tKxo2sH5pILM7myyseCLbakcGCg+FpPsgLAQRh6msi/hQHjVx
	ng8D2w1cwaZ+r/eZ7u8AyyE7DPOvvdWtp5g0TDDpi5DuPJXNZSfu+7A4Gow4EHX+cDCUM6ccZfh
	eDn2/d0MG6LFvwVlq5d2AMrIBBWd7P2H8ainXEQ==
X-Received: by 2002:a05:600c:a40f:b0:4a2:86b7:b76e with SMTP id 5b1f17b1804b1-4a286b7b9eamr16884415e9.13.1792782715763;
        Fri, 23 Oct 2026 12:11:55 -0700 (PDT)
X-Received: by 2002:a05:600c:a40f:b0:4a2:86b7:b76e with SMTP id 5b1f17b1804b1-4a286b7b9eamr16884135e9.13.1792782715275;
        Fri, 23 Oct 2026 12:11:55 -0700 (PDT)
Received: from [192.168.0.29] (ip-89-102-207-131.bb.vodafone.cz. [89.102.207.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41cef8sm2011003f8f.45.2026.10.23.12.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:11:54 -0700 (PDT)
Message-ID: <d9660f99-c230-4107-a89c-c62e0b3e7f03@redhat.com>
Date: Fri, 23 Oct 2026 21:11:52 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jerome Marchand <jmarchan@redhat.com>
Subject: Re: [PATCH] powerpc: Use raw_local_irq_pmu_save/restore() in local_t
 functions
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261023155529.3895393-1-jmarchan@redhat.com>
 <20261023130943.775b2b65@gandalf.local.home>
Content-Language: en-US
In-Reply-To: <20261023130943.775b2b65@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 19:09, Steven Rostedt wrote:
> On Fri, 23 Oct 2026 17:55:29 +0200
> Jerome Marchand <jmarchan@redhat.com> wrote:
> 
>> On ppc64 with CONFIG_TRACE_IRQFLAGS enabled, the ring buffer code can
>> enter in an infinite recursion loop.
>>
>> The problem occurs because some PowerPC's local_t operations
>> (local_inc/dec in particular) use powerpc_local_irq_pmu_save/restore()
>> which call trace_hardirqs_on/off() to generate trace events. This
>> creates a recursion loop:
>>
>>    ring_buffer_unlock_commit()
>>      rb_commit()
>>        local_inc(&cpu_buffer->entries)
>>          powerpc_local_irq_pmu_save()
>>            trace_hardirqs_off()
>>              trace event => ring_buffer_unlock_commit()
>>                [INFINITE RECURSION]
> 
> Hmm, the ring buffer has recursion protection that should prevent this. My
> question is, why didn't that work? Yes, I agree with the patch to not have
> local_inc/dec() call anything that can be traced, but if this caused an
> infinite recursion, there's a bug in the ring buffer code I want fixed too.
> 
> The ring buffer has a trace_recursive_lock() that will allow one level of
> recursion and then prevents new commits from happening. The
> trace_recursive_unlock() is called after the rb_commit(). Why did the
> rb_commit() allow an infinite recursion?
> 
> -- Steve

I might have jumped to conclusion when I found the recursion and the
peculiarity of the powerpc local_t functions. I now think that the issue
lie in loop in powerpc arch_local_irq_restore() (goto again label). That
somehow it keeps replaying the soft interrupt when event tracing is on
and CONFIG_TRACE_IRQFLAGS is enabled.

Here the output of the watchdog where we can see that most time is spent
in softirq:

[257154.724054] watchdog: BUG: soft lockup - CPU#2 stuck for 26s! [cat:107460]
[257154.724084] CPU#2 Utilization every 4000ms during lockup:
[257154.724099] 	#1:   0% system,	100% softirq,	  1% hardirq,	  0% idle
[257154.724120] 	#2:   0% system,	100% softirq,	  1% hardirq,	  0% idle
[257154.724141] 	#3:   0% system,	100% softirq,	  1% hardirq,	  0% idle
[257154.724161] 	#4:   0% system,	100% softirq,	  2% hardirq,	  0% idle
[257154.724182] 	#5:   0% system,	100% softirq,	  1% hardirq,	  0% idle
[257154.724203] Modules linked in: bonding tls rfkill binfmt_misc pseries_rng ibmveth vmx_crypto vsock_loopback zram vmw_vsock_virtio_transport_common vsock lz4hc_compress ibmvscsi scsi_transport_srp fuse i2c_dev aes_gcm_p10_crypto crypto_simd cryptd
[257154.724399] irq event stamp: 0
[257154.724410] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[257154.724471] hardirqs last disabled at (0): [<c0000000002b04b8>] copy_process+0x1418/0x34e0
[257154.724516] softirqs last  enabled at (0): [<c0000000002b04b8>] copy_process+0x1418/0x34e0
[257154.724558] softirqs last disabled at (0): [<0000000000000000>] 0x0
[257154.724621] CPU: 2 UID: 0 PID: 107460 Comm: cat Tainted: P        W           7.2.0-rc4 #1 PREEMPT(lazy)
[257154.724654] Tainted: [P]=PROPRIETARY_MODULE, [W]=WARN
[257154.724665] Hardware name: IBM,8247-22L POWER8 (architected) 0x4b0201 0xf000004 of:IBM,FW860.81 (SV860_215) hv:phyp pSeries
[257154.724688] NIP:  c00000000004f50c LR: c00000000004fc84 CTR: 0000000000000000
[257154.724708] REGS: c0000003affdfa68 TRAP: 0900   Tainted: P        W            (7.2.0-rc4)
[257154.724727] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24082800  XER: 00000000
[257154.724819] CFAR: 0000000000000000 IRQMASK: 0
[257154.724819] GPR00: 0000000000000004 c0000003affdfa30 c000000003c8be00 c0000003affdfa38
[257154.724819] GPR04: 0000000000000000 0000000000000000 c0000003affdfc08 0000000000000000
[257154.724819] GPR08: 0050244d39e48235 0000000000000049 fffffffffffffffc 0000000000000002
[257154.724819] GPR12: c000000000669520 c00000002ec9df00 c0000000060bbd40 c00000000453e200
[257154.724819] GPR16: c000000006d66b80 c000000004366af0 c00000000280b940 0000000000000007
[257154.724819] GPR20: c000000006d61100 0000000000000007 c000000024832600 0000000000000103
[257154.724819] GPR24: 0000000000160003 c00000000c573400 0000000000b5240f c00000000e555fe8
[257154.724819] GPR28: c00000000e53e108 0000000000000000 fcffffffffffffff c00000002ec9df00
[257154.725212] NIP [c00000000004f50c] __replay_soft_interrupts+0x6c/0x5f0
[257154.725255] LR [c00000000004fc84] arch_local_irq_restore.part.0+0x1f4/0x290
[257154.725299] Call Trace:
[257154.725309] [c0000003affdfa30] [c00000000004f6dc] __replay_soft_interrupts+0x23c/0x5f0 (unreliable)
[257154.725369] [c0000003affdfc30] [c00000000004fc84] arch_local_irq_restore.part.0+0x1f4/0x290
[257154.725423] [c0000003affdfc70] [c0000000006946dc] rb_commit+0x50c/0x620
[257154.725468] [c0000003affdfcf0] [c0000000006992cc] ring_buffer_unlock_commit+0x6c/0x3c0
[257154.725514] [c0000003affdfd40] [c0000000006ae9c8] trace_buffer_unlock_commit_regs+0x118/0x2a0
[257154.725569] [c0000003affdfda0] [c0000000006aec74] trace_event_buffer_commit+0x124/0x3e0
[257154.725623] [c0000003affdfe10] [c0000000002cae68] trace_event_raw_event_softirq+0xb8/0x170
[257154.725675] [c0000003affdfe90] [c0000000002cc964] handle_softirqs+0x864/0xc00
[257154.725725] [c0000003affdffe0] [c00000000001cd1c] do_softirq_own_stack+0x5c/0x90
[257154.725777] [c000000040b279e0] [c00000000001cce4] do_softirq_own_stack+0x24/0x90
[257154.725827] [c000000040b27a10] [c0000000002c9ff8] __irq_exit_rcu+0x458/0x560
[257154.725876] [c000000040b27a60] [c0000000002cd72c] irq_exit+0x2c/0x90
[257154.725924] [c000000040b27a90] [c00000000004fc88] arch_local_irq_restore.part.0+0x1f8/0x290
[257154.725978] [c000000040b27ad0] [c0000000006942b0] rb_commit+0xe0/0x620
[257154.726021] [c000000040b27b50] [c0000000006992cc] ring_buffer_unlock_commit+0x6c/0x3c0
[257154.726067] [c000000040b27ba0] [c0000000006ae9c8] trace_buffer_unlock_commit_regs+0x118/0x2a0
[257154.726122] [c000000040b27c00] [c0000000006aec74] trace_event_buffer_commit+0x124/0x3e0
[257154.726175] [c000000040b27c70] [c000000000527c4c] trace_event_raw_event_sys_exit+0xcc/0x180
[257154.726222] [c000000040b27cf0] [c00000000052837c] trace_syscall_exit+0xec/0x1e0
[257154.726266] [c000000040b27d70] [c0000000000440e8] syscall_exit_prepare+0xce8/0xde0
[257154.726315] [c000000040b27e30] [c00000000000d6ac] system_call_common+0x16c/0x2c4
[257154.726368] ---- interrupt: c00 at 0x7fff9f08f8b0
[257154.726421] NIP:  00007fff9f08f8b0 LR: 00007fff9f070a20 CTR: 0000000000000000
[257154.726440] REGS: c000000040b27e60 TRAP: 0c00   Tainted: P        W            (7.2.0-rc4)
[257154.726458] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24000802  XER: 00000000
[257154.726582] IRQMASK: 0
[257154.726582] GPR00: 000000000000007d 00007fffca534fd0 00007fff9f0b7f00 0000000000000000
[257154.726582] GPR04: 0000000000010000 0000000000000001 0000000000000000 00007fff9f0b0b40
[257154.726582] GPR08: 000000000005edb0 0000000000000000 0000000000000000 0000000000000000
[257154.726582] GPR12: 0000000000000000 00007fff9f0ba580 00000001359c09b8 0000000000000000
[257154.726582] GPR16: 00007fff9f0b3580 0000000080001000 00007fff9f0984c8 00007fffca535420
[257154.726582] GPR20: 00007fff9f0b0b40 0000000000000000 00502449f00961a6 00007fff9f0b0cc8
[257154.726582] GPR24: 0000000000000000 00007fff9f0b0cd0 00007fff9f0afbe8 fffffffffffffff8
[257154.726582] GPR28: 0000000000000000 000000000002fd2d 00007fff9f0b12f0 00007fffca535000
[257154.726956] NIP [00007fff9f08f8b0] 0x7fff9f08f8b0
[257154.727011] LR [00007fff9f070a20] 0x7fff9f070a20
[257154.727063] ---- interrupt: c00
[257154.727075] Code: 39200000 48178df1 60000000 7dbf6b78 386d0933 48b427e9 60000000 893f0933 38610038 61290040 993f0933 481176d1 <60000000> e9210140 7dbe6b78 386d0933

Regards,
Jerome

