Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082974;
	b=FZWlF9P1lvwlUH2XQh1ZfuR7hdBmnPoeiKSKTaXprQCmq34FN+XrUGzVh9Ita74yvUGk
	 rBnmV51b5okwDTyuLgYzddmVfnAPeYSHoLXfXc5zcaNyJD5Q0+rxV1UpnoJ7l9Rbi4EXd
	 xhVfsC3NIu/PT8QX/vYGdC4M5q9Qm3FPglhZzyNSB1H5IFFloeNgy9Il32NzJMF0Fv061
	 Ov7xmZn/aieE1Xr8zeWZymnUNWg4TeuNq1KZQOOIIy8tF2Qpwln5GgbVpAHepgZ12At5u
	 njeW60oDi/wLEYlcvQzEREpzNf1acHlFA3djOAFsfUEaX+Z308Kp73R5tiObKDTkAFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
	b=ViBnJVtGZyMbYFrISo8sUKVOhQxmNc/6D3mZvm4LFjcWEIRw7w3E0QDs1EmR77edtBKi
	 2OQh0V5GOgXS5uKaaEEx6hKlk6els5apD1JEjVozbxTESFIlGeDHzjBcgfPfQYOTxW4PS
	 rT9XpLrO7OW5mgVzI9HQnCv8IpHRg7fxE4lIiWZkzvYXWxnzM6SSEQLt/jhEsLAAMoby4
	 m04QDMQUThi6iAfSkb3YCf1KORlVPsTkA2rhUEjnplkVpHYSbloafGvTD5Wicm9mMU4Y4
	 tZz8UpALa3POkMJCpVN2bU7v8G+3M8oLpEOYivi/OFhakVV2c4E51PzwwGaKs2TWDMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="oXO5/xix";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE4C606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE4C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=oXO5/xix
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso869332a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082973; x=1793687773; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=oXO5/xixxcmqSABWV2HOCg/JLJ443Sgr5Ze5DRJdvGXvl3NNCkF8nt7WWQrEvx8zHL
         PatDlkNCLCw+31QgEdZMIwd7Yi4vS6qW6eWUBdf6vOxlkePJ+2iD6ScKEMZH09IFCQGU
         tIE9IL41JWC5LojEARxDT8+Qj5WWMLfz/NxgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082973; x=1793687773;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=c1vavAzPv1J4At1PokcIDVuWvHY3Yh3Tuv8nLXtyb4mhFoMZJUpw67W7Xz9snFTM32
         RAH0lY+djMqn3oZb7cTVbf2YZlk/iQjk4NfQolhJ3ImHpd0FkZPiqcWAHDD1Um+vNFRT
         t4/sQR37hveluxF9yPZDM2oAkFyLk8jn/Zw7fb396Vr8SgPg/owbl39Q+YqPP6QYC83O
         5A3LiKt6dhQOj0+Q0dIcLahivqX1YZThV4Yjg5vA1/STmPi/WRLGRw9kKlsqv2JHkqtL
         TdaxaSLeArOgrCtFTDzFoT3q21ntzpa6XJY59LYs9Yfkie7y3XVPha5T8gPSl+OpQlBX
         Z9yg==
X-Forwarded-Encrypted: i=1; AKwUvByhpGVnko/Oeu7CbdPblKpLkVPBPdCuBz0DTrHTd9+1rucDGhm8rQvJk9QxLEVGk3EPaaJvD/JUl2iAYpo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLikRa5d6yUFJUVDDgSKf9D9A2AW/Mp5K7rZryI0NdAm802kg6u
	xMKX5UN0FojF17VaAfhthLanTetZtJXKNwfFAMe5nEkER3m6m38KSEWK6G6zA8QlwUM=
X-Gm-Gg: AYBFou0g1Rr45TZ6UsbBGU9nSZ1MOzg4Nka9mDHEZGegTkFwst2sbi/al272bhe8g8o
	JKu7gDkJh7u9MHyZ5U/R190KbSZ3/lsPqDivnEWXL7mmYBxALVMIl3Cbz5XKok5irblQ8/WZlQS
	+pIkBBxKPvM5OH1+tRMnJe+lnp25wZ3MwEpQIykFCz3MMFFAwW5XPjk3axhHjn+LgIuiLn52z5m
	Z5D/hegrjM4Y1JCMkSfSR1S82+E4gVCOUvrvm/ku+rSzJ2NPbeNFs/kNYo687SSNljJ8AF0ijZC
	58Y0fvWZ4vLsDdu+sFfhHq4LsorJVBL+Fxu9fkmMbCwgRiphnt+ZlIV4MwqKgvjB5+A9zEVAQ+v
	yXg7DHTsC7KYm+BGKgXBq0T3Ql7y1xG77zPJ8wYi4R2VRIPaxIyi9rEieUVVrOeLeEFZrtZjE6L
	mMyvZloMYJ0eo5glkV/VnknwuErl+/NPTia/QQv7aXTuI8vaWWzusSeQPTiy4VD5DMGYIIK8FND
	jv4V/OZgCP0ni/3gFakTQjRe02kIvIhTOX5/IsU34ycFpPkv2kD4DWemmizN38AD+MIIUloKlvz
	oFwG/RqLW0SonVAjUVMfOHfmULEzflUa9K7ea/WnxXJEyni8GV3mGMjvbTWZE2MHViHa3I4LhVV
	abmw/xY2ItlsqoYK07m5ZMHk=
X-Received: by 2002:a17:90b:1c0b:b0:3ac:9e5e:d19c with SMTP id 98e67ed59e1d1-3adea8990f5mr7512458a91.17.1793082972994;
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614daasm2254704a91.4.2026.10.26.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:09 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is
 disabled
Message-ID: <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
CPU lacks pointer authentication. scs_release() already checks
scs_is_enabled() before it looks at the shadow stack since commit
9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
schedule_debug() does not.

With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
unused shadow stack on every context switch. That is harmless right now,
but the check is redundant and costs a load from an unrelated cache line
in __schedule().

So, let's guard on scs_is_enabled(). It is a static branch, and it folds
to true when CONFIG_DYNAMIC_SCS is not set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158de..fc269fd10192 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6152,7 +6152,7 @@ static inline void schedule_debug(struct task_struct *prev, bool preempt)
 	if (task_stack_end_corrupted(prev))
 		panic("corrupted stack end detected inside scheduler\n");
 
-	if (task_scs_end_corrupted(prev))
+	if (scs_is_enabled() && task_scs_end_corrupted(prev))
 		panic("corrupted shadow stack detected inside scheduler\n");
 #endif
 
-- 
2.54.0

