Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793889614;
	b=HFhjY4tWtj3qxducaw90v1WZ65R9qWxA+VuK4iqqQ5NdkogpNNc9p2h70tDee7cjzLj3
	 yiuZ270Sp4v/2KevsYEIO49jl6FnNybyF05PjsHXPF0x7H/EMXhHocV04kAIQOoKRebhd
	 5GAs1pobic9EziQu9gtQ9FsC56f9xKYaFKhBsF6UqyqisadwusfMynqap1MqTnk/fhVEG
	 RekXbwaAxC6RdPLA33Qc3W9m7oNUp43ebnRtTotECWC2Q5kwLwGctCBOvaq/hhUJPmZz4
	 pWB1gfjzJ8KOJRYi3hSTJhmQBklNk4cceKsEymuaOfebjDLcdheS7E81sQgkZkPfKXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yr5JKusQemWFn647G9c278cFb0LlgW5RE9g50mX/iiU=;
	b=oRmoXWhkM8BaLJA1kKNqAHUrkIsfDH2H2LfWMScIvYqAOIDsuGAD4V0b+dvjr9IEaWTH
	 Ojo3aoqJMD1dRsJspIuGFrPfMlga4Yf/ii31fchGlj/JMXUdRe18KHV+9kTjXYCWyK3Gb
	 jA6K5Guyi4RPpz/jYvYWA+IczMXdQY996jncbtOcqddraeIWddSor2NebQOZEPZLu9Qnq
	 ocO0MiRLOZtvfY1+/2S/djZEODyZArw/Oga/BMIXKMcpzeosojFMBRFfSHkFlpVwqGp7H
	 AqAC0g6FbDt0eiAICF8qLwIwTWvuDL5SbTIRVEtCE70EuFFcoTkJiqy1SHhxKS62gcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FV9H08Fj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F2606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E6F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FV9H08Fj
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6767d92cde6so2210454d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:40:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793889613; cv=none;
        d=google.com; s=arc-20260327;
        b=dRRDGndhWTCeBrqLBqSDp6BKNYaWXJOgO3qUGbLMbaWPJRwW/8e5+JJ5SmoAzPw3Xh
         pmE3BeDy741hbenYuuTGMgo4gNgmCQRtMTP2ClzHbOn7tkJRBCGYdEmmFdv03uJ0IlIh
         AEgphow9pKfXCO1tJPaAz7sC63uCNjFhC/UkrV2p7cJrQ4zaiZw/2F8S2aQNVAuXGhyB
         pQt5fZ/breH4v/Ms2KcpX1ObJWsqlfDiAgD94Ie4v16Ee/H+vpFsO96sFNkD5DX+k1E4
         6m3wNH+kNLhtdbsNopohKYvZL6UJ/jNbIR6aJ9h1TBAYFqZUM46sdPZFczdfJKje8Nvj
         Sxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yr5JKusQemWFn647G9c278cFb0LlgW5RE9g50mX/iiU=;
        fh=EcJNObMexqFbm5TFzCumLkS0Qtc+k4iAMjtAIIrv9fQ=;
        b=syRHNXDOklDiBB+LOqYULAW33kBFAn0KJkCHpj/V9LSRW8RSU7wGA+ilxBHhazND94
         pGVyr1CD1lsjXdfUw3xar8sjL4EdPsBRl5vjsZal3j8C1LsalNfp+RYuhhNMNRVu0XOC
         VXaywRcPUqWThCWad++GxiBgzpbJY8jR2LIFZcImgYD2SYMp1FtEnh/EUOw1NYHu+Seu
         NlSsBkaBorzOxwSKJ9KQxfzcTgLfcA7z+Pl5vf3ZHHJ0uuA2mU2q23brB6c61uGAkRGr
         aqOkaENyO/+THnXJGmgmH3o+7oJnbq7om8V5vp68riA+HVlpRf4apGhJ0FEWB5ll3Ndq
         CjWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793889613; x=1794494413; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yr5JKusQemWFn647G9c278cFb0LlgW5RE9g50mX/iiU=;
        b=FV9H08FjFZ/5CpxezBXEB+UZCoPXyAPcjHjL60B23eI9DsPJ0W6Va6OYaoOsSorr/I
         hM4xMoLzFaqoPy5IP2wAKZNkLzXTnKcyzVcQ/f+R8wUURmnP3EYgdVHlF5rz8bQ5qacC
         pFqbpKeGT6O/zl2m1P78XBoqRX7q8Ny7PpNMc+3xULwri9UmTc/n8UXndeqAyTs2Hmsy
         QzILl46BBbWoQ2lfdwprwqv0bIJeaHNmRJftJ3DOumDN62P8uPMeZU1XQ7ebin1snNwT
         3xG/m002wLNPhXerXJs7cGZ8Z3xxcR2ALrOULZqGvT8RdZ1Jl7ZVJn3G0AANFpnZdx+j
         TxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889613; x=1794494413;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yr5JKusQemWFn647G9c278cFb0LlgW5RE9g50mX/iiU=;
        b=Ohqr0OuqRKjWWtZQDuc+LgXy2+oPfL61vCrniKXv3nC585q+kDxlOXoWHPrhFOrNXW
         PN4gpwbgdTa2ctoboWxZRAGjLM/0mPo2sLJikSv+V7htl2N0opjxApAoDezUPl9s0vpm
         o7p3qJQtVMw0fuy9ahX825KHGwADX7pYdQpekMUfZeNA/3p58cjvlgCP7S95HYgyZ+0V
         6o4/0HcWHmzyrijgf+skO9RA9K04N21WLWiDOLWxsVJRGChm+9z06K67EC0QdkVAn9rz
         EpEjp3n5S7IQGNMzz35lcEtjwSKWPRwCWDDgBRpCg74H+SDzWfzXeifbUpg3yqFeUY02
         /ABg==
X-Forwarded-Encrypted: i=1; AKwUvBzJ2tm5iYhYm0+0G/GOvmIQTMFAPMRlvLLUJDk7oFgI2kmM3RiBrVJgbA5fOFhVmCGF5oMKXP5b/wwvhwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4iiW3OdqIq5Ag9QpFede/wH/zPl/SJrnCWMktDGNd6NeOejHI
	eAmvO4opcItJAiOzqsdt5aE3/icGctRFwhyFUSqGPVeSXbMsMIUlU7uuH/m+GP60HDKCIlbBUXC
	JLWbVYM+8GQ4xzPMGo7mJNdu+XFI/H/KB1yTdZTa6
X-Gm-Gg: AYBFou0T8KHuYd2lyhzYIkhJRIAVIKFg2s50KVTT4FLvGtSesOzb7GoIBBlGOG03Mvt
	CpnTRmictF9aeCHfAvJj4kk0e2sDOPy89++/Odre7zxUDEi9VMffNI94FlHG1vZ4i4PWb4H4AQ9
	wIhfbeKWp/KUvmZ3R0Blm1Vj70M5f2BJXUBEpU/Oo93vLTz91cDPSpC7KWwmtfTbI9Q8HXNrIzb
	34Ac7oSFigpOkHpULwo0OpA1JEQFmpCfVkfBrYBwCyE7nzEr2x4khQNzX3BKYPj4AtwZYOqPifF
	f2s5AUxQ1W3j/q95vfP1xl2+kE5FMO7KhRfGVJ/++uYrvGk+xqL5nQMUMYges53NJV0WZwsKtvu
	ofcFBj49r3zOYQGouEQ0uNKf6RRpisA2++L4ppTVr7u0wt7NMYD3x6eZy0PJ3/q26tYI=
X-Received: by 2002:a05:690e:1183:b0:677:d419:8a27 with SMTP id
 956f58d0204a3-67ba501b9c2mr14870735d50.51.1793889612801; Thu, 05 Nov 2026
 06:40:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793654853.git.bvanassche@acm.org> <71bc2361d8676f1eea3c945cbf21a0c2542d5b92.1793654853.git.bvanassche@acm.org>
 <20261105083746.GP2668804@noisy.programming.kicks-ass.net>
In-Reply-To: <20261105083746.GP2668804@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Thu, 5 Nov 2026 15:39:33 +0100
X-Gm-Features: AclHuK_TG6MwPMMgocq4vNSDBjluG02dmtOuFVXgqdg-1HhQhvNLKJkCpEonHRA
Message-ID: <CANpmjNMaDwcm+tQ-cOUjnE3n+5x8WgB5CZ037uurbwVa4Jn0BA@mail.gmail.com>
Subject: Re: [PATCH 08/14] lockdep: Introduce lockdep_assume_ctx_held()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, 
	"Paul E . McKenney" <paulmck@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 09:37, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Nov 02, 2026 at 01:34:38PM -0800, Bart Van Assche wrote:
> > Introduce lockdep_assume_ctx_held() and lockdep_assume_shared_ctx_held()
> > for code that needs to inform Clang's context analysis that a lock is
> > held in code paths where lock ownership cannot be proven at compile
> > time, e.g. because the lock is accessed through a pointer alias that
> > the analysis cannot resolve. These macros call respectively
> > __assume_ctx_lock() and __assume_shared_ctx_lock() and also verify at
> > runtime with lockdep that the lock is held. Store the macro argument in
> > a local variable with a unique name such that it is evaluated only once
> > and such that nested use of these macros does not cause shadowing. Rely
> > on Clang's context analysis resolving that local variable to the
> > expression it has been initialized with. Document both macros with
> > kernel-doc comments, including that __assume_ctx_lock() and
> > __assume_shared_ctx_lock() must be used for context locks without
> > lockdep support, e.g. bit spinlocks and the RCU context tokens.
> >
> > Convert the lockdep_assert_held() tests in lib/test_context-analysis.c
> > into lockdep_assume_ctx_held() tests and add tests for
> > lockdep_assume_shared_ctx_held().
> >
> > This patch prepares for removing the context assumptions from
> > lockdep_assert_held*().
>
> So the only convincing rationale from 0/n for doing this was that the
> current annotation can hide the need, and thus cause a lacking of
> __must_hold() on the function.
>
> I'm not sure I understand how this alternative form of the same avoids
> that same problem, and the above doesn't seem to mention the whole
> problem -- either that, or I just can't read this morning.

There's no problem if you're dealing with new code. But we have a lot
of lockdep_assert_held*() sprinkled all over existing code, which when
compiling the kernel with WARN_CONTEXT_ANALYSIS_ALL will not warn
where we would be better off with a __must_hold(). I believe Bart had
been working on enabling this more broadly and doesn't want
lockdep_assert_held*() hide warnings.

This latest iteration is a compromise for that problem, rather than
the previous proposals of removing __assume_ctx_lock() from lockdep
primitives entirely. The programming model is unchanged: we delegate
to dynamic checks where the static analysis fails, and that's the main
purpose of __assume_ctx_lock(). The only difference is that we'd have
to be more explicit about it, just because of legacy use of
lockdep_assert_held*().

I'm somewhat on the fence still, although would be willing to accept
this compromise if it does help catch more bugs, and is neutral to
only mildly more mentally taxing in writing new code.

Thanks,
-- Marco
