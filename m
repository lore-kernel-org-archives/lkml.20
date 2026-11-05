Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872804;
	b=WWrXjHuRRWSmsU2c6ar6BDWILZySvRb8HwHSfBqP+I2MeZkCbr2YliuQmRY16DJpQksn
	 C09k7RSHQC1UCz2IbQfjrMvr17LzmoZ/TL8byjWOVabi9be0mreqKY1n4483rQvlt39qo
	 KguP6Xl7F3KzI4TPcwP2Goe8dKWK11pdtrDx0DYSuP4yeH3/YDnaqAlaQco+FkNdjyTNt
	 Es1cqThKME34sl5HohQg5wO0GYH31bsGSwmfE+/UafNC+oPlgzwEYriBfJ3N+9GIfZ7lh
	 ZnuD1yBwBgYIJ7nKu6VkUdklze7hKZkfWGtCKF7TmjvPNXBOf/FJwvDsOPEbXA/QBhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GH7uru7zaJH25aiIA6h8MhXHcRq1Sqokqji5mDZdGfY=;
	b=Rmr4dmiIVQC184jUD8n7DlCfEQuQN9ZQoGIN8MgCJFjpekb/cPAZxP54i8CgZ6ZDKDtQ
	 Sj97ivAhAE2hXNR3DltIPSjQQcQE1IAAE5A8AFwWzFqwwnxq08eqYFmpbJzw+WQmvBID4
	 lS9zB1QReSemqgCPtYuiCwk7QmpBzim8vl9B5iysZnvCR+kg72fVCOcpjp35W5Wmq4rCc
	 2/rslmy6IU3t7Yy692akaaKHCQQzNFkDwa2q26v0+HbTBUbuZGos7m8WO6n+cXoXovk+I
	 eMO6hWPGEZMzyzSes9dtb1vyE/+8/5rAY+l/5zUZlmqdHT5OedKxESkYEpHAE5yrnng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=etW6r4w7;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B9606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 173B9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=etW6r4w7
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10019775e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793872802; x=1794477602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GH7uru7zaJH25aiIA6h8MhXHcRq1Sqokqji5mDZdGfY=;
        b=etW6r4w7Fe7eVfv21QaiCTdhQIBN4o4Lvuxi3MbHG6EAN635MGUqMBinDCDelh4Hm+
         LSoFlhHrBNR6sbHsftDq3oa7lgx9Dk3U64gJPfPdWs8VAuoEcnWsYZL9ZhfLIAfnayll
         DdmfmS+wUYzAM+1vMKmRcf7/JmBclaMLCL9NJ4ir6C+j6J2cgEkevSVoI8HlBRs2xDEs
         GMw+4X05jEhlpY3ycHPToYlpEpc8OEj/Sls5o2ksr1WJc1ac/Kq3vEo9B7CQsfhV5419
         R+jaiZ3EZR4bjjPO8Z3uYBe/ltEJ0oI4rZ3+UAS8IGmrJYPl1hJoNUDRp/51Az+eeIg/
         pRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872802; x=1794477602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GH7uru7zaJH25aiIA6h8MhXHcRq1Sqokqji5mDZdGfY=;
        b=K9ja7Vk21omL/ZQOyJCUe/CdFW+4mvNaJntSAvsc+zdWo3BA8awmtoYpN+iudc1so3
         nqhBygD/xbQZRxEMhgT8MJf9jg9U5FCXciiqXorHjvsFa/xceHgAPgI8O2PTd7Ni1ZKU
         vdIrhbug16GNAJdv1WeJqSX2Fj2mnPYdBoWKE23IAQZqctDc+ZuPl2piVehTehX0pHYp
         W1PWuJWBbCJ4NQDFqesdAMOF5WRqTqdcYUw3t37UtDQ2fB1oYDKMrzSgdVzJxgQKIpcX
         cE2egisCVHVQC00SeZ+pp4Hkj5ygH4aBDld9iM4sU4Diu3mjNwO8bVHbt711jxAVAwZ6
         wJfA==
X-Forwarded-Encrypted: i=1; AKwUvBy+u74HWcl+8y/ZmvZaMPfhWkLaQhboYUntkXsB94j5j5/BjM3fu74RwYnLP7nqHW4oF+dopTOlgl20WWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UBNm6PBsrEn+3jO7Yyg7WGRnGosgUVUS5QheoFA+61+Jw22Su
	DU05/qSC9JvUaT7lQ1vu18fPzqtbOazRgCozAnyJHsvSXBOfyjdHrYZ+cc2b6QPmM3E=
X-Gm-Gg: AYBFou3qa8R7nMt8z77lQghW4CatiT2pomR/L4TK824tKsGl1sptwREBrMlKB1JFOrv
	LT+lj3VLXoxwIjJjFMxwHBWegCHzF1CGacZMUPXLyHXd6e4JnFp5FaxsP2B3sdiN/eAaOFC49qY
	PGxVYNUbdjh4ae70/8sbWNf9zniKdGALKDunerR1UOBF8e95/OAIvItZMM4McHEflJ+c1oGAQ1T
	oAa8fRM55O/LKYcEb/Nh9lucLyXInbcS2yecSwfnFNlWzDVzqOFuExFHk3bCXhbeS4dwtp1IIQd
	g5mlVJPFyky/u2+MOEe98K7lLSnspVoM01skvywf6s/2wfPqR1bX2dhFtNK/PnChGzqBu6VNT4S
	Z4m787JyZ27ptRQWtX99a/k2K3+h1Mp76fQSKSkGVDunmPgr7zkU2ogR5oSjAP9CFm5aTTX3uCj
	FlTDVu9+HafdT2Fz0uaiWKQyGIuSU9BjdkBToFWxb+6Cuf93RayVfOSmPpmqQlsS37L6P03J3WL
	Tv05S8l9MxKLaeA+2ufMAwbMgAvwhtmWwmtRwcCfW87+s2ZIXUcN8dzedtLzx21BDgYi/Ow1lbU
	0vfb1ZIVAHslUn98HTFJVU8YlC1uGw==
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr401555245e9.34.1793872802185;
        Thu, 05 Nov 2026 02:00:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1ffdbsm8718707f8f.50.2026.11.05.02.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:00:01 -0800 (PST)
Date: Thu, 5 Nov 2026 10:59:59 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>, Marco Elver <elver@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, kernel-team@meta.com
Subject: Re: [PATCH v2] kcsan: Don't enter an nbcon emergency section for
 verbose reports
Message-ID: <auxTn4YuYHUOt4ml@pathway.suse.cz>
References: <20261104-kcsan-irqtrace-emergency-v2-1-ceafc0098a25@debian.org>
 <87v76cahn2.fsf@jogness.linutronix.de>
 <autB8IxyWgtaH_oE@gmail.com>
 <871p90psjl.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871p90psjl.fsf@jogness.linutronix.de>

On Wed 2026-11-04 15:48:06, John Ogness wrote:
> On 2026-11-04, Breno Leitao <leitao@debian.org> wrote:
> >> Wouldn't the below diff be the proper fix?
> >> 
> >> John
> >> 
> >> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> >> index c3dc84a7cef26..71f1b4b8f06d5 100644
> >> --- a/kernel/locking/lockdep.c
> >> +++ b/kernel/locking/lockdep.c
> >> @@ -4245,8 +4245,6 @@ void print_irqtrace_events(struct task_struct *curr)
> >>  {
> >>  	const struct irqtrace_events *trace = &curr->irqtrace;
> >>  
> >> -	nbcon_cpu_emergency_enter();
> >> -
> >>  	printk("irq event stamp: %u\n", trace->irq_events);
> >>  	printk("hardirqs last  enabled at (%u): [<%px>] %pS\n",
> >>  		trace->hardirq_enable_event, (void *)trace->hardirq_enable_ip,
> >> @@ -4260,8 +4258,6 @@ void print_irqtrace_events(struct task_struct *curr)
> >>  	printk("softirqs last disabled at (%u): [<%px>] %pS\n",
> >>  		trace->softirq_disable_event, (void *)trace->softirq_disable_ip,
> >>  		(void *)trace->softirq_disable_ip);
> >> -
> >> -	nbcon_cpu_emergency_exit();
> >>  }
> >>  
> >>  static int HARDIRQ_verbose(struct lock_class *class)
> >> @@ -5797,8 +5793,11 @@ static noinstr void check_flags(unsigned long flags)
> >>  	}
> >>  #endif
> >>  
> >> -	if (!debug_locks)
> >> +	if (!debug_locks) {
> >> +		nbcon_cpu_emergency_enter();
> >>  		print_irqtrace_events(current);
> >> +		nbcon_cpu_emergency_exit();
> >> +	}
> >>  
> >>  	instrumentation_end();
> >>  #endif
> >
> > Yes, but it was unclear to me what were the invocations of
> > print_irqtrace_events() that needed the emergency turned on.
> >
> > how did you decided that only check_flags() needed it?
> 
> The emergency enter/exit's are intended for lockdep splats. AFAICT
> check_flags() was the only call to print_irqtrace_events() that was not
> already in emergency state for lockdep splats.
>
> KCSAN is not the only non-lockdep caller of print_irqtrace_events(). So
> my suggested fix applies to the other non-lockdep users as well. Commit
> 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep splats") was
> only intended for lockdep splats.

I agree with this reasoning. Well, more messages might be printed
in check_flags(). IMHO, we should print them all inside
nbcon_cpu_emergency_enter()/exit(). I mean:

--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -5769,6 +5769,7 @@ static noinstr void check_flags(unsigned long flags)
 
 	/* Get the warning out..  */
 	instrumentation_begin();
+	nbcon_cpu_emergency_enter();
 
 	if (irqs_disabled_flags(flags)) {
 		if (DEBUG_LOCKS_WARN_ON(lockdep_hardirqs_enabled())) {
@@ -5800,6 +5801,7 @@ static noinstr void check_flags(unsigned long flags)
 	if (!debug_locks)
 		print_irqtrace_events(current);
 
+	nbcon_cpu_emergency_exit();
 	instrumentation_end();
 #endif
 }

And there seems to be one more lockdep-caller of
print_irqtrace_events():

--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4649,6 +4649,8 @@ void lockdep_cleanup_dead_cpu(unsigned int cpu, struct task_struct *idle)
 	if (unlikely(!debug_locks))
 		return;
 
+	nbcon_cpu_emergency_enter();
+
 	if (unlikely(per_cpu(hardirqs_enabled, cpu))) {
 		pr_warn("CPU %u left hardirqs enabled!", cpu);
 		if (idle)
@@ -4656,6 +4658,8 @@ void lockdep_cleanup_dead_cpu(unsigned int cpu, struct task_struct *idle)
 		/* Clean it up for when the CPU comes online again. */
 		per_cpu(hardirqs_enabled, cpu) = 0;
 	}
+
+	nbcon_cpu_emergency_enter();
 }
 
 static int

What do you think, please?

Best Regards,
Petr
