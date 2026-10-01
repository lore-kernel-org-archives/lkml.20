Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01470519DE5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863158; cv=none; b=IiBx+CWQkgbyR23xpp1r/PwYsCcfp0LB1h6U2jn/wU7/yNrqWabl/OFjDaWLfBX0oDTR+tNAfTKfLcXidgpEnKeeU2Bxcc7d6ktya6ITwwIjUoGaoWWTixlvY621Hijws08m7FavVsYsCJSIaZ1arwvBFDn8Ho2wM/08tTb57nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863158; c=relaxed/simple;
	bh=f25TJUdggfvsQDzhvWbRIPYVa+HjVy1e0GvKGQwRC1k=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=GAd4KMZvDm2UIueupic5uaJEAk7JgBYo6DzislusZPaPxDZqDbGFHKRdoyGDIBYbAC7f3lff9Z7H9mI2cAr4TgrijAB/k9+OWvo1RR4zOQXRwOkWufGvbjLzVQfvDIQHUHhP36o4NTdunxdRy9hxYcOJ6wrxMheqWoGFFA32A9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDuzimaI; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDuzimaI"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93a2dea320fso652918785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863156; x=1791467956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVxTmi5k40WI0DcLtCyKWH3QCS5Hnr6jxxODyyl3ffA=;
        b=lDuzimaIUA4xRC/bC4X9LFb6vA31sEYD0TjjCz14ZTTjwSv8Q1gJHBBqDTEsFA0HYJ
         s+eW10k/e8DYOqozhXMIUg5j2XloRkdLqdCz0yuJEBaG9EChlmRdqlfU2JgRB9VpXtKu
         CEK3E93pEpHhRcP7ExVoZAoSI5phFl7BgE01OmSh/9QlLJ/Kzgkr06p3EyCUZqnMpOgq
         vbcX2YZwK0OiTd7OPaoN7Pfaxm+p11L6wYp/MME5AOzjyqtmjOgDDNrGfht2eg//1jWy
         Omy8/1HQkuzD9aAxoY3BNryPlzmiVGBTXwus8jRZtzpvWgwPzJRj/ZQlg8VwmjHsFASa
         f9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863156; x=1791467956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVxTmi5k40WI0DcLtCyKWH3QCS5Hnr6jxxODyyl3ffA=;
        b=sE7kInaBx81jjSrPfzCMjPmuZs/IL87HM2G5d4CCKOdpNxu2OKtH09AOvm26yr4t1j
         W2hOS8UlpOOFzM1vYZ73HIZjCghIUWsFV9yxlLENYkZcZ8iSerQxsWjmFnRCejjLaDVw
         hxayrWYbT/DrEBJC+RdVqbpI7eWm3uDAgj+bNJIF2bZrEPgzWpLsGJJ6LV3E14gRwBxN
         a2g0nKAfy8LBcVWDjqtDr+dhCWItnt9V9Kh4nNUblWEbPMNUafLTR1pyo8gR9iVKvqhN
         UL3wxOce+igcWSa5CEmbWZWqU148e7AZ1L3VFNzr4eC5ckKEcTMmsTwwwTHHmKtUmPto
         ZwHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaSmZT0sKYy1EGh8YEshntzdZwdQ9ymZj/tuohdmjawFkRwcPN7LYfkWjJNI3LMa0hNXfuDBzDKElS7NA=@vger.kernel.org
X-Gm-Message-State: AFuF++kTXYJNonXp5zhkBiCyxG4YxQC73CrH02XJV/dVX6cTpPelylOM
	K95BgDb3JlY+n25VzYKwC4o+ouMlcw68ye+BninvU3yEPkHcZFRo0eXS
X-Gm-Gg: AYBFou02bbapPrYvn/AuJVi0eI4OvegCFUubyH+N3b+piQ68oQQtmmgKMGi28OFwAiu
	hATP8iCciEzrsPYCEpslMXjTKPvLU3nwhuRd2PBzNuLKIfWC2M/fKxMBVzu9Dpc51AgC7Da707A
	3di4j0QznqAJ6xODv8nJGtySUV2hC2nuuFU/4XZb4QUgAhyUW1Hvd1YNWIg6y5wNrosUxCpXexc
	sTj+8Wm3scM7qBCP9wi1q3YSOMkUuU8Ygwd8GnMtEFBUhzhH67o5D4RiRDSL24Avo8bZvYoNNgX
	MfsVfBhiHkxyDi/jra7FKR1iOT1HvcuK8nQRIXFhtCOfyHj2jWsLzWpwXzKDqZamni2/Q1bKSQg
	zN8AD4TRy08rb4WStWt+69jIr9gviJHlw8J7P5pmqj3adwM8gz92WXQ5+BO2UQxHA7bccaeLa5t
	ONqJQ1eTyStqA7oCefvTRrDwlz82O5LgKYGSBU66K7WeO6LjuDRk4VsN1jfUaJT5fJO1y+CVryZ
	a6vHrqpqiIbcmOO6TvBQnZaWoIMTb6gkVv3GAudSL56
X-Received: by 2002:a05:620a:2626:b0:93c:c08f:ebb with SMTP id af79cd13be357-93cc08f5401mr227577885a.26.1790863155696;
        Thu, 01 Oct 2026 06:59:15 -0700 (PDT)
Received: from [192.168.11.3] (215.96.231.218.rev.ocx2915.net. [218.231.96.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cc7093756sm10772085a.38.2026.10.01.06.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:59:14 -0700 (PDT)
Message-ID: <ac3e3fce-b27a-4d17-9616-48a70ddaf28b@gmail.com>
Date: Thu, 1 Oct 2026 22:59:11 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linusw@kernel.org
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk, oleg@redhat.com,
 paulmck@kernel.org, ruanjinjie@huawei.com, tglx@kernel.org,
 thehajime@gmail.com
References: <20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org>
Subject: Re: [PATCH v3] ARM: entry: Convert IRQ handling to generic IRQ entry
Content-Language: en-US
From: Yoshifumi SHU <envzhu@gmail.com>
In-Reply-To: <20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

I took a look at the Cortex-M (V7M) part. 

Since V7M now selects GENERIC_IRQ_ENTRY as well, a call to
arm_rseq_user_enter() is required near the V7M interrupt entry path for
rseq to work correctly. It corresponds to the arm_rseq_user_exit() call
you added in entry-common.S:no_work_pending, which V7M reaches via
v7m_ret_to_user_from_irq.

A minimal fix would be:

diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index 49a3a34e2913..e8102413461f 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -87,6 +87,10 @@ ENDPROC(__irq_entry)
 __pendsv_entry:
 	v7m_exception_entry
 
+#ifdef CONFIG_RSEQ
+	bl	arm_rseq_user_enter
+#endif
+
 	ldr	r1, =BASEADDR_V7M_SCB
 	mov	r0, #V7M_SCB_ICSR_PENDSVCLR
 	str	r0, [r1, V7M_SCB_ICSR]	@ clear PendSV


This actually calls arm_rseq_user_enter() in PendSV rather than in
__irq_entry. I think this is fine because the rseq.event.user_irq flag
set by this function is only checked on the return path to user space,
specifically, during rseq handling inside do_work_pending() on V7M.

However, applying this fix highlights the ongoing maintenance burden and
motivates converting the V7M IRQ entry to use the generic IRQ entry. I'd
like to take on this conversion work.

I already have a rough idea of how to implement it (it is somewhat
complicated). I hope to implement the prototype within a week or two. I
will send it out as a separate RFC on top of your patch series.

As a quick test for your patch series, I confirmed that Buildroot boots
successfully with and without the rseq change above on QEMU MPS3-AN547
(Cortex-M55 / Arm v8.1-M). I will run more comprehensive tests on real
hardware, like kselftests including rseq.
 
Best regards,
Yoshifumi
