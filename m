Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081B4A3D3F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146922; cv=none; b=a58IJLLiDPx8xNe7ms9yt2jC5bWirFqmXOM7yx6mLzR/5caZrcaYxYero/hwB7G5P/4yo7+6XjUV1BKS0tBGoeR6Urk4PwBEDSlcpm2ejJT25H6QAkT6T6NxygzsBatLlL0QQIgpFJCjPmZwYdi7aUBxMlTnuC3E7hYWfaorjFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146922; c=relaxed/simple;
	bh=YR/Fc6F20gxIYCN1JvjHBQOyKIUt8e7Aini4nSAO/q0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WmInxMJ8iEo3a2KOV4VPghL2va2771JuNNacdhf/fonpddNz2scNZ3FOlZAUm8qXA6Niiy93oNIWEVcVATeEflcYCXZgDK7K1ot4MQw8uLfs8uty3RDUgpKugYzT0IYbv8XhcjBOkTWRhZw4yB1kKcFfTWqFq+r2kP2TJCjcmcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYqu7N6u; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYqu7N6u"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso13599915e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789146919; x=1789751719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0puZl5iMYOFPwpCVxa/sjuttXa6CX64CcoBDxQVmuRM=;
        b=GYqu7N6uvM5pzvcVhXr2snZ3hit3/rhekDCtq0gEOisE/EtNKZ2HVt5hpGJeFCcGPu
         4bkxyAYTrPw5GAPsuyfrOMgZbRfnOOmRsKI+PgleoVYID1E8GTLpCkDhvlT+a+K6CHki
         Jwumrg5Aij0iW7O9fgid9KMEOwPeX3zsYafaLULjKO/UVoO0ZwbW3vhWlaUY3oIN29H6
         /7hwxXfBlTp4txFbIB0hO1q6cB5gxw3+iLz5bRDUMSxxzOnHE3yUDhv0j2U3GeYenWYk
         EOHgkZBqxMuayKUdTj0Lh8QI13JHfXlBzf979qzwLMK0xdmI3uaFyjZgO23J8Cufhu12
         oAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789146919; x=1789751719;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0puZl5iMYOFPwpCVxa/sjuttXa6CX64CcoBDxQVmuRM=;
        b=o+OftNCouO4h778Gn1ThbhZkSPmaDIW4sOSni289p+fvn0W+LmcfkqYRYCHOUfL7Jo
         xFtikAZrdRYUroIUkfgFO/XK5QRUVFKz4gi7coICMzYCUbXxAH+P7WETbNVtalY26sLh
         GLI4ar3U67eeMLLmFEkZbw/m/gUanNFXr3+AaJyhhRccTWBwWiuBPpDCpvoD3e+Drj89
         BWiBr/ndcU3s/ZnTjwQ9VJTiCY5tS2wbNLsXB/mHrY+rlz78WaoBMRsugo9LDyhTxVxP
         7/DSq9FtdpEXgSajpcZQveKo2fqcqYIR18d1VGN9+G2C2f5tIsi8gWMHdmb0FHEs990o
         v7sw==
X-Forwarded-Encrypted: i=1; AKwUvBwQPg0O6gqBpKO70q9KDkKVJtddY2UfBOa0p/pR444AQ0iXfsCzrkqY+fk4yAP8azdlXVX9Uu72efe9iHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kcrBxA29XDnMX/OYofVmeEROqByYu6aWqV4CgdHlAae8TLeqsY
	I/z7fhaDcZJw2UIsrT8T22kgPg2LrruaD4BCEsiQd49WSnjKnfgepsvq
X-Gm-Gg: AYBFou2To2TLLYK0kJWe7jwv3ZmS6HKkukMvS6NySa+3dQIfQScRQpYRZXgE1HAZ/cE
	QoufNSPdnZoNMMEwYzRs7MEdWNkWVQyIK3XrrXekMU+uBmmxXMOR/JvQ6yivTadU9aoMIKp0qM8
	QgW2hJF8tOJZb5IljN5MWTjHVaEBf87bemReaxVp8rwWt7vVgzfjIxysOkNdPkigN9QXKXljkBb
	A0QXI6alb/uuxyWiAfdGg2aQLbSc0nzJvolN0mcIxuzqwdIw+1ExS3XNYqY5oLye9QGYgxnqsjj
	EqkSV8QLn/jIzXELeYJn8TY9eg6k2sLUsUFKjduzIdn3rEO1C1IIvVr3mCncKBpSPA3FUY/9MQX
	A1xVYgEtPjiX+lrUXhs1oV8Cqd8z+L6Usy1daS9vK8whONupI4gpszht0WhzuyzLAjn9ZHr0ypA
	XBXhLplXQlK3Szr9138JFBBst6BggUhzBMxwDFa/RZY+94r6d85P9Wil0G4SZR5qc2Pc7YUwRgl
	8OgrVG7UcSLK6uH2jjGXfZqZoiUAYUa9+xu
X-Received: by 2002:a05:600c:3513:b0:49e:6b62:edbd with SMTP id 5b1f17b1804b1-49e6b62ee31mr2552675e9.1.1789146918604;
        Fri, 11 Sep 2026 10:15:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm3026587f8f.0.2026.09.11.10.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:15:18 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:15:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: Waiman Long <longman@redhat.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 0/9] locking/osq_lock: Optimisations to osq_lock
 code
Message-ID: <20260911181516.313a8a2f@pumpkin>
In-Reply-To: <E2131B35-DE77-41D3-85C7-521143FF94A5@oracle.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
	<CAHk-=wget=mgjpkPJ+3-tueqo7AK1m4MR_Jqht6bj3-w+FhQHg@mail.gmail.com>
	<20260907182705.54585f73@pumpkin>
	<89F7CD08-2BDD-424D-AA2F-77D72647D93E@oracle.com>
	<44bdfc4b-4729-4dc3-b7b0-53c671c5ee34@redhat.com>
	<dd6a7873-7d23-42e2-adbd-b59c43141d96@redhat.com>
	<0ADD6DCD-6EF1-469D-ACB8-EC7D6A94CC2F@oracle.com>
	<20260910120016.04ba8ae1@pumpkin>
	<C81B298B-E8FF-4F96-8216-CFC21D167EC8@oracle.com>
	<20260910130557.74e1ae45@pumpkin>
	<E2131B35-DE77-41D3-85C7-521143FF94A5@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 15:30:03 +0000
Haakon Bugge <haakon.bugge@oracle.com> wrote:

...
> > > > Do you know which part matters?   
> > > 
> > > No, but now that I am able to test the OSQ locks as a module, I'll
> > > quickly find out.  
> 
> Only the first hunk is allegedly required:
> 
> @@ -143,7 +143,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>          * is implemented with a monitor-wait. vcpu_is_preempted() relies on
>          * polling, be careful.
>          */
> -       if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> +       if (smp_cond_load_acquire(&node->locked, VAL || need_resched() ||
> 	    vcpu_is_preempted(node_cpu(node->prev))))
>                 return true;
> 
> I say allegedly because a passing test doesn't prove anything, it just
> gives a good indication that it is working.

Indeed.

> > That also means you can quickly check which _acquire/_release are definitely
> > required.  
> 
> I did it in another way. I just added an "atomic_xchg" test to my
> mutual exclusion framework.
> 
> Lock acquire:
>                 while (atomic_xchg_acquire(&el->mx_atomic_xchg.lock, 1) != 0)
>                         cpu_relax();
> 
> Lock release:
>                 atomic_set_release(&el->mx_atomic_xchg.lock, 0);
> 
> This passes. It also (obviously) passes with atomic_xchg() in the lock
> acquire. But the _release _is_ required in the lock release.

Isn't that accessing another branch of the 'big union'?
So will be overlaying some other field - possibly the count itself?
It seems unlikely that adding a barrier between the lock and unlock
(or unlock and lock) will have any effect.
In any case I think it is enough to use smp_rmb(), smp_wmb() or smp_mb().

David



