Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511966;
	b=heYgDGKFUedSUr0HzTqK33DN6WkK8uszx8QklAr9C0Nx8sPKUc8vbp55uvu5se787sPz
	 d4WUc7M03eGwCXUDH6/Figek13TBREY4f0jPRjX6mY3jHaoHkYwEWQMAak0gqKTx21b9a
	 FM7C1uDaBJqfUGccNLgUuKQnDnXuXygn0lV7pEKKJx7Jc+xOrfkomylvORTsX7q1OzMvm
	 3TBRNokmimshnfL6DnOYoLUMUuLQD4wFvTDGE3PwiBeoLx8/f/9ERXO3P/lcOWWtLpcVe
	 HST/NDeExR2DaXgY1PeT4NnphEcoaS+s95549r7VEsQm/p9bAoG8Eu2qKemL/BHVxgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=CVMf6oRZ6B+8F2dCoflcUl6BcEG/gpADTobYb94CITk=;
	b=1LiLcmj6UdAscU5i0U8tugtstySZ9eoYMwsHGkCWa9GsWJzSxoRtW81rYUDoxpQS2hHr
	 kpzX2vRHF22reQjG/n0pbFitn+HgEgBQov8XOtKyxWLDARxr7cwnIolCkP68jQS3eI8y9
	 7tdmGEHc/8H4yMA3ehtgVPQiDuhSXR63BXfk6S0piy1EnOb/FxWSH0OYoWIcvO1urRdAt
	 3lo5ABUqtqUH4yZ7/FKAOftOQt63ZXiCFOue4vNwDOUpo5U9QUp/4jd8magkZzZNAW3na
	 AaldO43FKscS/SjNy2A95Dn7tudFfgDeXHofSKsO4yPYGDw7nPC5MZHIkBWGNB6kCMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ihpFrfr5;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CF4606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CF4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ihpFrfr5
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so17872315e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792511964; x=1793116764; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVMf6oRZ6B+8F2dCoflcUl6BcEG/gpADTobYb94CITk=;
        b=ihpFrfr5EYn7VeiZgx0hVFVqSnJm+t0eTJDskZtSUhNVwWwt8cnodUKN4O1nVRRRpl
         r7ks/XlmZTTnui7oJr0v2B9yittAsSTWRs1tc/UBIikJ4U5z077CVSBC55+25plHGUOG
         N4GC/x1jhE0BkkO+ThkxpSPXQTmV0LJ3JMeoYyHO2QYZ+w6ogZMiaR5F4yBFaGTU3Bt0
         XWKsIjn5Klv8A88IA1N8rbEGZ3I0BVjPU5qisFfFK4aMx/9bmv0yVDpHYmAKiPsdJ/YC
         WnSrNi3QbTCMon43Vh/lWinmmhmHtkhpfW1eU89r8KQxDi5Rb1zPkqhoHldGGBygpqHV
         Pkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511964; x=1793116764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CVMf6oRZ6B+8F2dCoflcUl6BcEG/gpADTobYb94CITk=;
        b=BwGiMlaCzmWcUNm0rzMqrA/8BPibeFuA5LITPYEajNqBtr2Kk4KV/7JNWpqKuybhuj
         +r0O2Gvs8kc0JKRQQo7rLBzZYEVzXjAU9t3tXYH4ghlt8F2ixySeDJ9eW/gpXNky1FMd
         Iy9wgBmvZzH9uQSMRRQr21YJB5TwdgkdeJ/WqfvbJ4EaqYa4QvSbkoyKSLTtl2CzkaBE
         DoMIff1Ax1/gpQo0U8f5O5h/jl2ikzzfPmiX+TfIRsJTY2ciSKXH9BSTqrkONziB00af
         +youRTf8a2Aav7Ie/HJsJa8izkUN62gTzMwIYC/y+6m6gzGRr0eoz3Qh9zA49xwzj360
         rsKg==
X-Forwarded-Encrypted: i=1; AKwUvBy3fmc7IvKr53syTwRc/7NY9KNf+aGBaALgDlu5WjWVaJzHsEumC++65azOfVyvgVVevvSmvlZLS/jPml8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1SEolgZ/xuuqO5saueyG/sexVEsY6CiZXYwSCCwidnCHRHSU6
	drQqSEeEA/G0cMyWrMW7H5W6YrBiGpPhv8+6Uqz5zDMlxSgRt//pIQ1T
X-Gm-Gg: AYBFou232v/UZZBS7mRAT9+3q5SB8Hledde9xFG6NmVtA9cgbWPBtvUCV1o7J2ZgA6P
	H9TRJhcZsROt739zZkez6z2l0vPozAdB6xAPQPaq7n7DYxhAjB/wHrliIJTNOTSm78P7aI2rFiZ
	HpUpcyfXP/sYe+tnFMSVVgvMBNAqVCW5hqnMelH+4/cK32xKLrGkbQ2Vziy1JQyzsoAvtxGdP9Z
	frlP02odWLadH2RCuIjpJ1o4GIvA78luof14690vGXGsDaJudcVGGVG3fsEdT0smA534B7tRoLR
	/haR1MiwwaN6oJFICEwU3ig7CUSQn17u3QFYL5BF8EJp93j7T1pxny21Jsm2p5T7ev4klmvKB72
	QSLvtrzJrgxUAsfTicHxRYtlnGeCl9zEb534ESvgnA0A2lBwZ+VMOneWtY/scZ6tnY8FcO7Lm8D
	ILiZJOwmr+Phs6IPJXII+KYrAfzHZzHW66hx3CQUx4mifGgcnvv1KKkt7sQJftdGGOTWUD
X-Received: by 2002:a05:600c:870b:b0:4a1:d487:2dc8 with SMTP id 5b1f17b1804b1-4a1d760518amr241254865e9.18.1792511964332;
        Tue, 20 Oct 2026 08:59:24 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb95b390sm5691555e9.14.2026.10.20.08.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:59:23 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 20 Oct 2026 17:59:21 +0200
To: Oleg Nesterov <oleg@redhat.com>
Cc: shaos <shawnq1@163.com>, Andrii Nakryiko <andrii@kernel.org>,
	mhiramat@kernel.org, Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] uprobes/x86: uprobe syscall accepts forged trampoline
 frames
Message-ID: <ateP2e_rLyc4YlrG@krava>
References: <20261020003704.1012276-1-shawnq1@163.com>
 <atcbYbiI9Ez5yHhK@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atcbYbiI9Ez5yHhK@redhat.com>

On Tue, Oct 20, 2026 at 09:42:25AM +0200, Oleg Nesterov wrote:
> (resend with more CC's)
> 
> On 10/20, shaos wrote:
> >
> > The x86 uprobe syscall checks only that regs->ip lies somewhere in the caller's
> > executable [uprobes-trampoline] VMA, then trusts ax, r11, cx and retaddr copied
> > from the user stack.  A process can jump into that VMA with a fabricated frame
> > and make an enabled uprobe report a hit at a site it never executed, with
> > caller-chosen register values.
> 
> Yes sure. Userspace can easily fool the sanity checks in in_uprobe_trampoline().
> This is a known issue. I think we don't care, and in fact IMO in_uprobe_trampoline()
> can die.
> 
> At worst this can trigger a wrong a trace event, right? Nothing to fix, I think.

+1 also I'm not sure what we could do about it

jirka

> 
> Oleg.
> 
> > 
> > HEAD commit:    fe2ec83746e501645709761605c2464a44fd2929
> > git tree:       upstream Linux checkout, local branch master
> > source version: Linux 7.3.0-rc4-70-gfe2ec83746e50
> > compiler:       gcc 11.4.0, GNU ld 2.38 (from the kernel build banner)
> > 
> > console output:
> > https://gist.githubusercontent.com/shaos26/82a14d478c3e5b27d81713f9989693cd/raw/9eb4cfbf7c87bf4b06cd6138775a13814ded54c6/console-output.txt
> > kernel config:
> > https://gist.githubusercontent.com/shaos26/82a14d478c3e5b27d81713f9989693cd/raw/b1d9a09b984075b425aab4875117a6766a795110/kernel-config.txt
> > reproducer:
> > https://gist.githubusercontent.com/shaos26/82a14d478c3e5b27d81713f9989693cd/raw/b7e400345a004b4a4c340eccad862ac1f569aaee/poc.c
> > 
> > Build the PoC and run it in a disposable VM with tracefs mounted.  First print the file offsets for site1 and site2, then register and enable a uprobe event at each offset.  The forge mode executes site1 once to map the trampoline, then makes the forged syscall from a uid 65534 child:
> > 
> >     cc -static -no-pie -O1 -fno-ipa-icf -fno-stack-protector -o forge poc.c
> >     mount -t tracefs tracefs /sys/kernel/tracing
> >     cp forge /forge
> >     /forge offsets
> >     echo "p:uprobes/site1 /forge:OFFSET1" > /sys/kernel/tracing/uprobe_events
> >     echo "p:uprobes/site2 /forge:OFFSET2" >> /sys/kernel/tracing/uprobe_events
> >     echo 1 > /sys/kernel/tracing/events/uprobes/site1/enable
> >     echo 1 > /sys/kernel/tracing/events/uprobes/site2/enable
> >     echo > /sys/kernel/tracing/trace
> >     /forge forge
> >     cat /sys/kernel/tracing/trace
> > 
> > Replace OFFSET1 and OFFSET2 with the file_off1 and file_off2 values printed by /forge offsets.  Run as root for tracefs setup; the PoC drops its forged child to uid 65534.  
> > 
> > Two fresh boots emitted a trace event for registered site2, which was never executed, and reported attacker-chosen ax/r11/cx values.  Legitimate execution produced only site1; an unregistered offset produced no site2 event; calling uprobe without the trampoline returned EPROTO.
> > 
> > Impact and prerequisites:
> > This falsifies tracing and profiling data for an enabled uprobe in the caller’s address space.  The evidence demonstrates event and register-value forgery, not kernel memory corruption, cross-process data disclosure, or privilege escalation.
> > 
> > A fix needs to authenticate the probe context before dispatching consumers.  Checking only the trampoline address is insufficient because that mapping is user-executable.
> > 
> > Validation: Two independent boots emitted a trace event for registered site2, which was never executed, with attacker-chosen register values.  Legitimate site1 execution, an unregistered offset, and a direct syscall without a mapped trampoline served as controls.
> > 
> > Thanks,
> > 
> > shaos
> .> 
> 
