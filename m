Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794424527;
	b=dwafdtrZ7pWN3ECgZxjPKecKwGkNfH4okjbuSLRVzsb/LJIaku/4FXq+WTLA09sviGPz
	 DY4byvm4Nrun4mgvGz+mK/VFzrOjj9eWe8KVdyVFGN0HiallKHtVRew7nCiOvj1SB4tdv
	 DhRG93RaOE2P4WShEaJpICQQ8fWHaD72RT/e3AqE65NDhwFFpN6DsiNk6k5E0GFd+yGWF
	 DHaa3hhhrYHcU4zFXZeLPtyHpmSefBBha7+vM6IMmcf0jWQwjLkDsz0WrSbdtH0asR5QG
	 OZskCtV4EQravAr51i4tjBoAte95F550OjFkQBchLjCkuROhYdXUVtl7ePSoT6NYX4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=w1oVDcieurPdSdWwnc7nQV7WwoS0Uq1TcY5MJlnhTYk=;
	b=cCKH4FkRFciqxAH+EFzkM3CHI4r4S/VXWYjpXX21MisHdAYucjVMpD2TzDOlZIShvlwt
	 vFe4UJEwZUvAsu4mtAOQZJDb0FQgUyjMcLHI0g7QpU7Ao85+rWWOLCh+3mqe88eCYhYi0
	 kUy/FGGbrTAsxi9qEednOu07lV99y/l9cuCEAZeQphpSmUtPhNsE44l6em1TOepd1WaBr
	 xT7RMy2QA+Qr6GbzjC6eLLZKnFn9vxaauDvTLI3Pxm8V0Oo3IzV1AZ2HFNowOS7MRaOva
	 Tn3vNXIBryN+5E3FqaF3UDNpY+iRBdvxJGCyxmwJKm6DeoQbwl2KjSflxExib5hfiug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gNoUae1v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF27606A882
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF27606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gNoUae1v
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so4651429c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:15:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794424526; cv=none;
        d=google.com; s=arc-20260327;
        b=mLnoNuPFxCkLCR22yJbhuSXlgsehfwsvIhruHvks0UjK2otzAluH7UhRxRvoPvUH5K
         B51Q2au9KGsY2zrEDYCTlXajce8SLU3sDExXUi1mIvrR+IAtXfN6+8gCWQwzLg3vOKE3
         7O1b2+UIaa14Hzq6LlKTrqhJ6GyAvcdWJK73AAc3BPILnu06sL6xPNbmNt2fBmrK9HZV
         K5KzaARJPdflqlbkKHN4Hd2S4vSS1v9E6h9CX7dmiU+I1G5XqoBzhj0P2OyJkQNDKCx7
         8TLPuVon05ipXc3bfmt1aD5f7aYWmaqEMvTORWhcj4u1L6/LT7VplJ+S745Q0XuORdRY
         ZpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w1oVDcieurPdSdWwnc7nQV7WwoS0Uq1TcY5MJlnhTYk=;
        fh=AwCOuRwDECskqdAf9Q2AZqb4YbdBMjHdjaI3SrBwxgw=;
        b=bGszg8gyqZaXFh9L2RoX9lWgjzG+NMZ+eoYJH2noEdSW4OQx3LMk4x3B8flhJ1YnsE
         H9tbII9Dv2iArfHIf4EEYTPw1hUmp6q1wL7TFwjpBQ3ZZ6XrOSDjTVQ+YZuYoKdQ8y+x
         I65pBERU3PnGCe+F+uQx0LFYyc2j9XLFrvTmULVkO2uGQ0MmspSF5pBvEruWbKUwbNVG
         0D+HFKrt7EW67v5x+8vfh6BcZ2kkn3Nvw/Jbbm1delhcioqYBq4Bb/I17mQQIS5BW3Ov
         EQLavf/ltGj0oxjOgbCDrBV8/Vj7icy/SMiRFNryrtl5nuaX9vCW5G0IrdPn748gEumS
         Ljmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794424526; x=1795029326; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1oVDcieurPdSdWwnc7nQV7WwoS0Uq1TcY5MJlnhTYk=;
        b=gNoUae1vLXP09hKLYnuXxsqhG8zZFxsEHW88btMTZprhoyfK85qg6eYSsgQ9gt5FKF
         p05jdicuSWSXj1Hh2lMR0SziyzKb9bRWXsBGPuFxPuG/pTt+kXgPlw2x74R/jzb7ATh9
         VXMDenV0SKQjtM00PI5bwXAwXKEkPhXPbcKzQ+TS4UdWsopnq0iCP9K1LJm1vNavulvO
         UKVVaUVDdORi+C3CbfRSr+WIhOThNG0GqS6f5lPXEGkraWQi30CpuH+IWSngK4f6+uMD
         8XhXXtQbwKIHowtN78CVYKB9xu737wo13bYVv6hKUyXHafafl5cXquRKmDc+TrmZcX/v
         Pteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424526; x=1795029326;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w1oVDcieurPdSdWwnc7nQV7WwoS0Uq1TcY5MJlnhTYk=;
        b=v2oJQvpyXhMG0Ww+OLmM9sKSxYXrqdjjXal5VYzqViR5TZMN8D1pDTTrIpdNALDCsp
         upwypoHvm2g2BfZ4TlR7l096XZXND5uhwHWQEhh6lQV/nGnxNsNjmqGpw0No3u14DyZv
         FNcKIYlU9+6c7tgFDL8fYSB6zYPTsL06ou0YJmTKrgWiLxra/f/7yPAq6e5WqYiGjoRO
         j4+GP2mK0sZbSFoKrgPGo50ZqXjkbkq/g7aPvQWzOdGEwRHbS/Y6VoCfMUUs8ysaCl6h
         KXtQ/Ahyz3CNpUBPArm9SwwG8u1gLQNbYeCrBZLT40GV9Ax+vNkxmLtNY4B26nDOiJbQ
         /XHQ==
X-Forwarded-Encrypted: i=1; AL+hErG3439G0cjE7Kzp+giCZQXeK1rm/qxIJqwFH9cGfSr11HE/bddtggyVWRxy7BcHTyKRv0zm/LIlAo+pdXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l97cKOHmXSAFjxBK6K7q4wlUhfzll4Sw7VvQ4Sk6oqBpoKPqw
	+ysdAT82BkLc1pBKBKYFsyFQKe09tXL4+MC8Bb1nyWrE8ZhAiS/453A1Wtlua/uMOrY/dCWhvuq
	MgQOcd6jjPxEEnPF5+xPMda0mhHKxQYbbRHDsfcXL19w5Ms1MomVrIhYj
X-Gm-Gg: AYBFou3IWjqhkx7eT1QOwB0odOfCM1isSpMHSQOdcKZSceDAhTp6GN5FdtRV1N4VP28
	082a4MddHQ6beXfnk5Ul38XQyMJurfbpiOJRH30IA0YGcva/iJHnqM/5t+m452SuN772ER48wDU
	Wn7A0THRBfjyrR0NWbENZ8Ou+KQXMQgKr08uSfpnrbMkb4puOfCF6WKh/9Y+m1vuiBel1SF9SzR
	bKeImDo7qt1WAmVX388Xz31SKJl8aOvuErfhcfxvzKgag87ya0zTl1KzOQfDWrVA1zZKIMRuAUW
	Ojjcn2NsZCqcQGcZTizgHvKayc5RWmFeaOTXLDLS0A20vpDpEE/mD1viyL9QtnSkKK6OHUSCfPp
	uP4eQNnjogjlYCymEn7aL4XVEUX9mTz+kHF1/QrkcAL4fFLzC9aU/rs/2vFOU5C6pbYAF
X-Received: by 2002:a05:701b:42c9:20b0:1a4:9eaa:d01d with SMTP id
 a92af1059eb24-1b3c03aaa23mr3070740c88.45.1794424524814; Wed, 11 Nov 2026
 11:15:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793654853.git.bvanassche@acm.org> <avROwpyToVNLOolq@elver.google.com>
 <40be79da-af73-480e-b3e0-155173f3ad28@acm.org>
In-Reply-To: <40be79da-af73-480e-b3e0-155173f3ad28@acm.org>
From: Marco Elver <elver@google.com>
Date: Wed, 11 Nov 2026 20:14:47 +0100
X-Gm-Features: AclHuK_Z8a_n2t92eMt6XS-x1Au4dnU6yzsv3_m2mhrtb3JPViNndT3695LRrZQ
Message-ID: <CANpmjNO51WYife2NhvS08n2En0WjP+XOzD9Mtjsj_Hc=_nw0Qw@mail.gmail.com>
Subject: Re: [PATCH 00/14] Stop lockdep_assert_held*() from assuming lock ownership
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 19:41, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 11/11/26 3:17 AM, Marco Elver wrote:
> > I'm still not convinced by 8-14 esp. in light of my below Coccinelle
> > experiment.
>
> Hi Marco,
>
> Thank you for having shared your Coccinelle script. I think the script
> shows that the current implementation of lockdep_assert_held()
> suppresses warnings about missing __must_hold() annotations. So I think
> that your script confirms what I explained in the cover letter, namely
> that lockdep_assert_held() should be split into two macros: one macro
> that includes __assume_ctx_lock() and another macro that doesn't.

The point was that the Coccinelle script could be used to add those
annotations tree-wide. We do not need to make the lockdep API worse,
if the legacy-code problem is solved another way.
