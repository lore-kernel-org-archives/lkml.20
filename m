Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794395094;
	b=EavNaaLVSlI/QwApyhInfZZ70ZcEh1A3UiCdtFehKsmxtz2PwU37pN2peRugGf8n27vo
	 x5Vwu9GoMC72sZsloPc8Hs4N++LoYVellvEfkrSp8tms7AmU8WuBLdMPVPaG5/UxR/Ym6
	 99dUHZphV8IdxdPrzJVU5cvKwkVmI8e/IUzdFp8YQQqaqAHfh0+Y3utWnKDfaE/QyuLd+
	 cKg7trmAaoJv+MEJYtZP7VWJRRS3GaX/6gIoZxElmqCRUfMZIXK/yD7BUtuBTX9aMoTRG
	 HjjxO5wR9fkrRyI6mEub/heKUJ5Q2wWDy14mfQlmd0EbwINX8zshtCBVAUX9l+xp0+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jMrOmQIR1CR4KS9YeuEOTqbPfdWn20VePiYda6IL1nE=;
	b=Dn9q6FqdWRcvZzWWmSwY2ij16LshRgGiq7WRau8VZMHycTusFZTGIw/l8Se/bMH4Eqi4
	 0xiMcFEyOa+wyMUF3VcYeBfd2rn1CQCQG2amS5ikyN8ycR3BYgCd1MiFi2WDCY/URC6G2
	 wEEE6hVjGjPd6B/2VZBlBz4uOXB8enJ/C6LbE1PXcqAlhcJl73X+yO3j+rJ1Bn+C8Blrf
	 W9QplOQoP/xQhdGkh1GQoiMr/U/z00OcgT3aj/VtPE1BRnWYiYOmJeYVbH4Be63+wCgA6
	 nZgrIpbjhh4a9bUDgU5mOP06v+ntPVVRNP3m/U1oOi8KyqY96QTkr37cMOtlTOrib8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fighYvnn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF88606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF88606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fighYvnn
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3704d30b84fso3908229eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:04:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794395093; cv=none;
        d=google.com; s=arc-20260327;
        b=QipaU7HpegUq94f8ZGxx6sZ/5qEGgHCj98fsXdpnhdU13pvfeeckt/NSfFrkn7zsyK
         SzjgWZufBnCsTLO8FQMGoGvtJI/3E7eEoXbiN3uUOj83isbB78LV08gR67w8BCv6H3/K
         9L49i/rdb+0hwDvZXMNz816tWIYIN8wEXgxNX+WgoFBFzUAmqUG3W4W9QRxSwh1tu+MG
         DzPBChATFTOpKJSjqqbZinEd36FiZIuDYx4AXYcPItI7OEh6CY9pByc2Ve3yt7p8ukI1
         BERSGl9MbdnjW2RAXXPTMFOdM7j+Cy1LsYQeAUvCLG4msKr3acx4s2RjoJ/D3Yxt7CYb
         v6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jMrOmQIR1CR4KS9YeuEOTqbPfdWn20VePiYda6IL1nE=;
        fh=jgBN4vq1e8ymAZDKqvpCCkkf/2Pm+9Nx05mECv7K1bI=;
        b=bPwOVtBo4hXNzWIN6Yfu2VWSJoBjK6WsH9EhfYe+WF5z4UFc7QjsKj1kZ5H938wezK
         YVvyaIiBZp3NoDalFOsx/rNm+gwxjl1PAtPVoipnHxVUFLnh7WpogdbdFk274OGX6FDa
         NfibMdpSbSTEsjN/eMfVaxvfKv+0mY3V9sAVCiuY1IgTnCTYDNQ1HKGIAPsDk7234SsW
         xNBnFnjCIyTf+cNy76g4J8gNCMsXUI5TPO3ZUrerVh3VeCSSn4STWPmzeaCUrqAqt/7R
         zZjPqwRTC0lSK2xGbs/GEqPSa0eCo8zL/k7qgthYHuFZsctMZfB4ey8VmhmCWQgYyusR
         blkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395093; x=1794999893; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jMrOmQIR1CR4KS9YeuEOTqbPfdWn20VePiYda6IL1nE=;
        b=fighYvnn5CN/YDG5bhiNkTjgO3OsUT8KEO07wSgQjAMiimturzoj/ohHwr4bI4hYx2
         Ie+9v8u0FxrJlw5CBOzo3q1MA3LgkcA78Jo6OljiUklUWibupY4mmGlZaT/n1gdcpDCl
         GQdL9wQlKvgKof92rUoZmcnI8WnrHowUDsr/iCTmEW2yizzofoU4Ii2Eju3YCk8Ownsj
         NsLnNsd7tW02IK4ZScU1GSETJMtU2uRK46feArkJkiG2qxDfCyrxcXVi+SjGxMDYy1z4
         Eg7FCJUocJahhIqWVAD2Jt0cMPi8Txc9STA1no1LP8/kCz2+ayi1K1KMD6KRI+x2Dh3L
         QLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395093; x=1794999893;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jMrOmQIR1CR4KS9YeuEOTqbPfdWn20VePiYda6IL1nE=;
        b=xqSU9hXnS5qDr9RVsgwrRGFmxokWimPWkvDFRS9mfk6VPeF4nDbaqTO3KGH4b9H7b+
         eX+JzmsV3hEzD9hFh1wTmJLfpC1lmUyYF09a6L5neH+Xrl0//yGXQiUGTQzEjGyHBpG+
         Xt2/B9UsNJkpl2XSwrZOArW9bVCulXYGRdykpbqrWQNLUg0gTlkKt6791FRbpxBRJ5me
         VBQHiB9M9da6KZpaGRAN8kAzU5dNwl/08t9eoWrXwwSjL8rFWXh3UlplBVY4PDUm83A1
         5AZDhyzjjHa6O2dqSF9JuKWH1eFGOL0ymkUAg68229xCPsscg1ruBQ5kxoxyqKdsvv4K
         ofUg==
X-Forwarded-Encrypted: i=1; AL+hErEM4PQSOkh7hqZbLIAmACuRi/AKokJ8r4DAzEiEBvL7xEa3B6oaU8p5cKEhkkPG0BhhttlwdCV/OhYjACg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wSEveNoplOsKOOj2YHBWslJIhCu7WfPt/9rRxDdjMX1288wOG
	TC+4fCBY5WjriHS9ypeUzI5sUFdgJ50OnfT0SFSTQuA6wCN6ttUOnro1cymUU4pmeGBYNDChdOH
	wEQtKBVaJ+uMxBDzXuk4uQ3kQIDx1P1nnmprtbAo+
X-Gm-Gg: AYBFou1QuEl0A78KPdZ+uIUoTZPS/X+SXrF6Wdk+OAoee0FB6O6/Y6QOzoo+p7f88fb
	UJ/Koe1lCLXG0x9LLk27Hobouumh3hW82Zv2b+aeEGb99yuIyXiCVWmx3ni8fX1ZZC4WPrfeyA1
	px0bTAupw+QzhnwMsbkCGTRGyU9T4I4o9nhCoWmtzTTZWYNmajXEmdHNC3r6smKF46vQMAfbVfo
	2DhIrC57kITMp+vVbUfkEEDP048nTG0hjVTZMMWjal6H8EapqseBLUIdMuEpSAg+7AhjWMowH5y
	bAv8qGu30zQf7sjXQa+52k+l7T6fdAvn1CcOaQ/LH614xh3JNGxQr08tjgod/qxMvQkuqxevDvD
	IIVgldI012P0PUpRk0qfCgUH3ggTkebOQXPX2CvFrnskZfFEhbzB8V+EcuiNK+bvv7/KaYw==
X-Received: by 2002:a05:7022:1701:b0:1b2:3742:828e with SMTP id
 a92af1059eb24-1b3c024f239mr1954484c88.3.1794395092470; Wed, 11 Nov 2026
 03:04:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794250850.git.bvanassche@acm.org> <f4725746370a2251abf3cc3b2f34cf79caac32ed.1794250850.git.bvanassche@acm.org>
In-Reply-To: <f4725746370a2251abf3cc3b2f34cf79caac32ed.1794250850.git.bvanassche@acm.org>
From: Marco Elver <elver@google.com>
Date: Wed, 11 Nov 2026 12:04:15 +0100
X-Gm-Features: AclHuK-Jc_TdSzpM3SMerx-pCwfw19u0lAmliZqh1YqRJfb8j7Cd5RXZ8kMmPrs
Message-ID: <CANpmjNNtjR_rGMgQSL9g18PtvQWrZqnuuVRURyhwdre5mbQa9A@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] lockdep: Introduce lockdep_assume_ctx_held()
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 20:14, Bart Van Assche <bvanassche@acm.org> wrote:
>
> Introduce lockdep_assume_ctx_held() and lockdep_assume_shared_ctx_held()
> for code that needs to inform Clang's context analysis that a lock is
> held in code paths where lock ownership cannot be proven at compile
> time, e.g. because the lock is accessed through a pointer alias that
> the analysis cannot resolve. Make these macros call respectively
> __assume_ctx_lock() and __assume_shared_ctx_lock() and also verify at
> runtime with lockdep_assert_held() or lockdep_assert_held_read() that
> the lock is held. Store the macro argument in a local variable with a
> unique name such that it is evaluated only once and such that nested
> use of these macros does not cause shadowing. Rely on Clang's context
> analysis resolving that local variable to the expression it has been
> initialized with. Document both macros with kernel-doc comments,
> including that __assume_ctx_lock() and __assume_shared_ctx_lock() must
> be used for context locks without lockdep support, e.g. bit spinlocks
> and the RCU context tokens.
>
> Convert the lockdep_assert_held() tests in lib/test_context-analysis.c
> into lockdep_assume_ctx_held() tests and add tests for
> lockdep_assume_shared_ctx_held().
>
> Prepare for removing the context assumptions from lockdep_assert_held*()
> so that pre-existing lockdep_assert_held*() calls across the kernel tree
> stop silencing Clang context analysis warnings in functions that lack a
> __must_hold() or __must_hold_shared() annotation when
> WARN_CONTEXT_ANALYSIS_ALL is enabled. Use lockdep_assume_ctx_held() and
> lockdep_assume_shared_ctx_held() only in the few places in the kernel
> where static analysis cannot prove lock ownership at compile time
> (futex, kfence, rtmutex and Bluetooth).
>
> Cc: Marco Elver <elver@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  include/linux/lockdep.h     | 54 +++++++++++++++++++++++++++++++++++++
>  lib/test_context-analysis.c | 16 +++++++++--
>  2 files changed, 68 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> index a6451ecbbe9a..23ffc5f0557c 100644
> --- a/include/linux/lockdep.h
> +++ b/include/linux/lockdep.h
> @@ -412,6 +412,60 @@ extern int lockdep_is_held(const void *);
>
>  #endif /* !LOCKDEP */
>
> +#define _lockdep_assume_ctx_held(var, uniq)                            \
> +       do {                                                            \
> +               __auto_type uniq = (var);                               \
> +                                                                       \
> +               __assume_ctx_lock(uniq);                                \
> +               lockdep_assert_held(uniq);                              \
> +       } while (0)

The __auto_type/__UNIQUE_ID dance buys nothing; the old macro expanded
'l' twice and nobody passes side effects here. Keep it or leave it, up
to you.
