Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794812429;
	b=0aGWuK/GcbVx5gqoGpf/mJl+tYjtLK59vToNR01o1L6ZUW+X0g2hxLKz8wr2XOBTxwvl
	 beBAROfGzgpzbQT6883XLTHNl+4ytga9WCLLMKnE/f5Yh29dSGqvCn+t3g53v0xVlTwO4
	 8n8132d9e/mQrtx4g3rW6ktLksMbVEhjwZebK/qLssdW0M0sYQLW9PVquZQREZX6x19JO
	 a6cMKYwIBabL777rGh3a/UARQMC2jRYe13iEqnm2FXlJx73EcMwQ+LLGY5Egc6dh34oWs
	 K0COp8YJ0sBYv2LNJzE0vHSR4grw5EMJLCOqO/FDHakshiLXALaGCyjUUOpZrrVkOnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5s1cMjlhSVoN+8pwAodz8Vnb1Cd7Y7PNKE3ORLQFJUQ=;
	b=ULaiDkM9bdRKO47URj3pfCl49p6PzKXoTHh/oJgSAM09vAGqqT0w2EoGabTeJAdAUfBT
	 JZaiIKhzSACUYqtam0hovvbTcaePiTtGlvcVjzaG0Yw4uWHmZuHVo9of0cInCbVtvTBv+
	 Z8/sXa9tWGzm97ViqYrBUH5EWXhiNSzdCA4+PRqlTC7hTCPEQXC6ljfppLwYO+i4RenwP
	 VG0gPZ0xCv7oJwFxgtaW0ma8CzRDqsUhnC4hAqdS/s8fX5ihloPj6m5ceEruuWwyvwb6Y
	 HtH4DyWN77rzHDeJwjzESwjj0ws6jWeWzKNt9V92RfJJRWZIwLBM1WUFrUgA2EODUtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aM8kJmic;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE30606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aM8kJmic
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3457339c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:00:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794812428; cv=none;
        d=google.com; s=arc-20260327;
        b=lYCLV8wl/WdvhdZG+DG9RUJY6go1/n8H8akNmLTUQCyOn3cm2fFa1X0p0o+jsTfO0j
         gUTiFFittGAwmY+eKZDBHOwwhsFKs3ajV+KB7tIrV5oYP6eWMS0p/FuskBnT7vobR7mw
         +Wp2/DfGiGOi205Ba/k3SXyCp0ralsbCvCHyKksI3FEPUwqH0aNjVzXkhlJfQecZVRas
         LMHKRaZFxRzfrQtRmEduB/EJzH79FCemNFC+TPJ/xNOknRyb2HzpNWQ5qIjoWwVaNrOt
         /YxHItPB2Yw8lB/5TLvqMOKnGOnQUKNdig/3zxKDym5BH3qlhJ46KqNdlGgSBNjNxOF+
         xYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5s1cMjlhSVoN+8pwAodz8Vnb1Cd7Y7PNKE3ORLQFJUQ=;
        fh=huhff8r4zZI0GO9ATOKG+ugJSNYePadZcWkjDmFYSSI=;
        b=g36QCdFdYgZU0Du8SeCAMCe+ne80rhn31HepotNwhMWZXp0zYt4oCGFgvWu9CJri23
         Dazb4UpJ+kx1ShFKtNdjba98ztXTj+4gCf3XYEqYHOYNRGjsQMxdT4NqXC3M2rdLsyQy
         H0QMeV3TQguAaHb9bThB4SZMJ+fEqUTjDOm70aJa7L2TMZVlavK7lBclo9SFyz48TqoU
         8K30LlGdAyUbPfEQl5tUNkmxJPdfsPlNPaFJJaYTfrl1htHk/qyOf92xp9+5/gETMlLc
         pSxJ/9EZzd3OUn7OxsGDEBVDUtniCU1zXAp0z48YL7hcKRelclVtD0L/936h6+XF4c9o
         MWlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794812428; x=1795417228; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5s1cMjlhSVoN+8pwAodz8Vnb1Cd7Y7PNKE3ORLQFJUQ=;
        b=aM8kJmicAjEEvAO8VJcw7Lk13a1P/J+UL1Ot0LwjE3UM44EQakokEW1GpWqoIgBL81
         XEMKqZl0M7jEeIQzfSUnL/Wg2MVRMh99yiApeIgC52YdGoxRL0vtAgz+UQJuAi8R/eSw
         rmQGfkDI0AdFt/ZMn0n3NonYDBJ3qBuu/yAFPVNCOWYn9wuduSeN0iQTAXuHA8pVqKF0
         VkCZuTxZ3nneZ7x0B4h2DypFJQOmT/LB4IshGj9aMxQn2WlGRzjUQXs3mijOEtVOA7JT
         oghcNRa8E/eN6VI3vzUHnpUbH1kNxpTVuphAtTQLzQzeIypTNtWlZWim3SGHtkcZapZM
         xLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812428; x=1795417228;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5s1cMjlhSVoN+8pwAodz8Vnb1Cd7Y7PNKE3ORLQFJUQ=;
        b=S+vkklasm3Kqxy7MyKNV8aH60Cp0BS0Frs3FAzgPLvAYynx6H7KObdsEVQ8PFwsxRC
         uFLWrh8aMQhIgHz8hWsFaJWMh55Wb71Kt9DR0Mktb3GrfrP2mkAknoso745Genx8OoxS
         oiMxC5APzW4Mw51qhbPvrOTHQtX0WYQRZTlWqA9v7M6ftqsLcNOHvmVl4/h3pXf8BfYL
         SfcOlcSeEoCUl+vzcaLf0OlqJ++F3RT+2fr9wB7o3QHsC5x3X0+mIlPIpgu1IKstVi/2
         CPysGAzovx/uuXn2kliUbKy3IIIlgK7izvVywP4YHEyTF5CKwtrkpqG3xWqnGG7rWt+f
         CENQ==
X-Forwarded-Encrypted: i=1; AL+hErErnNlEQqw0nETbvWVK1Y9w/ePh9rBSUJVhM3VGLZ53erciaEdqMoxGVVX1xExb/QulAhscRWkZJCo3jN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bjHph8Lv2F5K+kLNNe6Djxkjb6AfUbMVCDnUInsUyHMEPw6vB
	igRSRJaEht7YE3VuKYylf9eB3gusCvV3Q94fAvNcJuibkarEoRAWbSbOIbtxlFPEQe7Okj2DxL5
	pYXFc+Hs1UkB0gR16wKK0ph2N3QfXWiMJHBrUJ6UpcqFi3DH13cK8DPrR2Kw=
X-Gm-Gg: AYBFou18aRoa8ouRDxhI9WRYK4uaPosoQozb5gQkRJ5y8o34KfDaTRPXlF2FfO+4qF5
	oJjmj6gvJO5IA1ggPYGLnCEAg5CPAHqJmXJ3o6G8s5/VFkoZ5sRSGt0yO79gZCwPq/gQDgjlq0q
	2xmlvITAb+QuqxyrRLknrZk79oZKEMroV6FCV6F/p8Wg7Xffu669/JC1uJSZTFTrPbFMA5O+nPS
	2T53WnHX/MjL8O7odgkRM4rpjTN5wl0w7RxdNickX92E1Wi90qE0gdbtzuMdojplD+MztE2a9h6
	jFroXGN333cfXvdYh4QXLLtXzuLVlsIpcueqshxIEtq2ifbH1PA/iGodigtNzojYAtaksEUCs7H
	hdNdKpkwLSNUZJYM+Vnlt/O76hTdragik3p1743fVKTuWgK+x4loMwDVaf95uTsg/88cL
X-Received: by 2002:a05:7022:3a03:b0:1b3:755a:ec49 with SMTP id
 a92af1059eb24-1b503157e74mr10651080c88.40.1794812426897; Sun, 15 Nov 2026
 23:00:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auA7FdubFEDVPB7v@chrisdown.name> <CANpmjNMunLgXHRqXgW3LnniCX50CLbLYsE3DpY7h=cuvu2vSkA@mail.gmail.com>
 <20261114150201.d428c3847d573be1@chrisdown.name>
In-Reply-To: <20261114150201.d428c3847d573be1@chrisdown.name>
From: Marco Elver <elver@google.com>
Date: Mon, 16 Nov 2026 08:00:00 +0100
X-Gm-Features: AclHuK-F0k1P_2O2E2wygaMki6BhhjUtxnekVFOvFTlkQiN3eI7cLbmv5yhD7oA
Message-ID: <CANpmjNNwaeFmVxfPsvdVSc33_DoF_Gcz9DpjGWf6PLD_GZwAyw@mail.gmail.com>
Subject: Re: [PATCH] kfence: Allow selecting static keys mode at boot
To: Chris Down <chris@chrisdown.name>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 at 00:02, Chris Down <chris@chrisdown.name> wrote:
>
> Hi Marco,
>
> Marco Elver writes:
> >On which systems have you found static keys to provide a significant
> >improvement? Can you share benchmarks?
>
> I don't have numbers that show a significant improvement. To be clear,
> the hosts that use static keys have had it set that way since long
> before I started looking at this, so it may well just be cargo culted
> by now :-) Given that, I had a go at measuring the saving on its own.
> It's there, but it's small.
>
>  From a quick check I did in an 8 CPU x86 VM, a
> kmem_cache_alloc()/kmem_cache_free() pair takes 8.0ns in static keys
> mode, which is the same as with KFENCE off. With the dynamic branch it
> takes 8.4ns. A kmalloc()/kfree() pair takes 13.3ns in all three. Both
> are the same with either branch layout.
>
> So static keys saves about half a nanosecond per allocation at best, in
> a loop that does nothing else. At a million allocations a second on a
> CPU, that accounts for 0.05% of it.

Thanks for the investigation. On x86 I thought as much; I'm just not
entirely sure about other architectures, and before deletion, that
might need some investigation.

> >IMHO, I was thinking of deleting the CONFIG_KFENCE_STATIC_KEYS mode,
> >because on most systems, it's not worth the complexity for the small
> >(if any) performance improvement anymore.
>
> I agree, and I think the numbers above are enough evidence for that.
> Deleting it is better than this patch, because all we want is one kernel
> across the fleet, and that gets us there with less code. I'm happy to
> send the removal, if you'd like.

While eventual deletion would be my preference, what you say here
doesn't make sense. "One kernel across the fleet" does not necessitate
deleting this Kconfig option from the upstream kernel. You control
your .config, and the Kconfig option is default-off nor is anyone
forced to enable it.

An intermediate step would be to e.g. not make
CONFIG_KFENCE_STATIC_KEYS selectable on certain architectures where we
are sure it causes more problems (global IPIs on systems with 100s of
CPUs) than performance improvements. We could do that for x86, and I'd
Ack that right away.
