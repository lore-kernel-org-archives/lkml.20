Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B5C35A395
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791777706; cv=pass; b=HNrFFHB6zgJVOnoq2M3u3nvYhWSnwnXSeyYLRGLc/xLuMDoTe91jPSgZg1bG0OxZk2i2JtmJ6C2UTGhQNJqvp/l8wFMVOgVLhgO1aRO0SkHO89ls64iRWFEbvlhp/M1QwHYV4wUI12aqRee+o8JXfpfvDzP3NAlyctMxJm2uIDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791777706; c=relaxed/simple;
	bh=Pe/a+GuYYDIVdvs2+OYKQN4TuAur+dcC/ty/ULPvGLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RorgYS/xcuFqeI/FHJg7DlpwRbQO+s1IT8nnWOZYiobMhQ+g+p+b6c7zdD7gPxVOvTld+CHoN02HnU/Jm70qwFXaDtSEUbA9aSUY1IHAam2S8PGShA/J5Pg/z7fRMbLaGo9Sbl3J6C2JvbnJO0kZnDn6FboAgcJZKiq6JEGw7d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQ36cwfG; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQ36cwfG"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so15436711fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791777703; cv=none;
        d=google.com; s=arc-20260327;
        b=mk4KMWzCdUUavkENytZ2IY/Q5MqPO5EdlJt598ijLx1V+73HREC+enrLfmIfiQIG2/
         xmDlpr6cZDktMLmhCTRjlWj7UY529WHxsP2ZgfHErFSqGCeuDGQqZtr8zMlLdZURBbq0
         dlbioJtZlKMtwKmKCZMW9qmm0TBcAIiQXzV/SBU2EpLLJ/MuSg7J4Z3WwOxWx8UxJz0i
         8aDEPg4WGdzFg1Qw9+Vf9NKYH+rcuC2gI7r1zB9rEgxSStr8XP4HNaNVqlCVnUYvfQFN
         SJcWJuw2bamxX45zp/+kDy63s4nhrexiiy0r7TnHnxsA5RnkwdmHx6SN1tm3iX9ymZlG
         akjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pe/a+GuYYDIVdvs2+OYKQN4TuAur+dcC/ty/ULPvGLo=;
        fh=0oyeNT63Z2YPE2AXELus4tZrD9pGvol/Ie75hr4ZB0k=;
        b=gTb5UvyuUZV1N0N9bgATWx/xvyY+2+53SAdve6/+mTZxB2ZBYHe1iG6nmXK4Tdu1Go
         s5BNvKcGCWNnwAqFgNqesDh1FXWgxWea9ML4vtx8npiP4HZxu6dYlZOHeJUW9fV/zy+Z
         6wTChbdLbs4C434MeuR+GEPi1N63+aN04LO1YBPbi5m/wKaWKuKjKVlOQbbX0LTCefgj
         wwB1NNiwNOkU7rO896wBrTc+TfjENLf/gOuyoFTW9TeRXwVP5iXMStKjYS4vmQrlpWLn
         JttUtTt1X1uDpkfdJOJt8+07JpkaFSsigpNx/lFMsPD3iwARK7GWbqeS0iQQ4QJF1Z7e
         HC8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791777703; x=1792382503; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pe/a+GuYYDIVdvs2+OYKQN4TuAur+dcC/ty/ULPvGLo=;
        b=AQ36cwfGPhnFdbImpDl6KR/pLalB3QqBuYM1+G6v3iu5ogXH25D2T0RHBzSZu9FWCk
         3p4D+QEmcvmjMtBSyu+NmZrk4ncIr1YQNVNjh2YIYFLNa/BBUvC2/wAfUrYXGr1twD4C
         fPwLtwW1ptwaTokOl1wHSoWV/neoUswdX2mJLjjv8xncQaO2VKXOiOak/VwT0+RCe7tw
         St4x2vsyVQu6QSl67grvqQMpRFUw7h8LKh04QyeoPgCfSEy1P2GpZ4bCVNuDh4EQWXD9
         l8kdnxM1BY0VB4/mFZZa+jNOZwW6+u+HKXZzJYhLaOUQS23yJhpbCBUj4MBskEbNeIya
         9IJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791777703; x=1792382503;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pe/a+GuYYDIVdvs2+OYKQN4TuAur+dcC/ty/ULPvGLo=;
        b=pMTZ7O/NeyKCMiK1MpOTgSLLz3w7Z+/MDKfKAotcuDlVagw/T2Tp0qSjCHfb7GZi+g
         9ihV77nZyE86flfgUf6K/pYRgaEP1Wce3UPrLM9xonxDsDQr0WnxLbbgR9JN9KGqyrbV
         qSymLua3F0TKwfLARn3+iQf2t6+OsOFjktK2HQ7VGQuvubQhbwOGJYewUacmxXtDuWI7
         mu7X1wnexLJlWGDijkzW9l+USwvXxbFgIlCtGhzrkjsmyzXh8S84rN2kCtwjReeDSKRG
         GzTXxBVKdzRp0sqsq4CwyPeS1JjaBsThEA+SqTvXUKznDbrIe1Zh1qD5qjTYD8o2wsiF
         3HbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjg6/Jekio8kHK1huiQzz6JjypGj1ms0b+G1mmjgOlX2ZknmIzSLT9qTq3h2KOtNhyppibBUU67paTSYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuC5USgg2YS3OCbEJVvwXeO4He92XJQxMj5zsXP3HGgXvrN4GJ
	UcwX0XFQqgxXwa+7kBBhu0Tbo5IsdEdF1A7iVVmTKHOp1y359NzgAHADvLC8zAD1RfOgygal8Vs
	plc6PyBeba6p7ZxIOD9RjXGN9/zzHM2c=
X-Gm-Gg: AYBFou3TjB5Ez1sXjpSeF+bQNbkSCRlxiRi+k+G+DXgtVRK/b2Izwv6/Fma7j2qH4NT
	iWrq3/UMCSUHCvOeYgJCRsYv1MMhtL8Y1o8V+6NHpyoyBHn8UzzMg0pqRCQao25sfOQTCPYP08H
	qJxCwi3qfURcDLyg4qXxmCXzx1yaj578qXcfvIIstlUYoIvk0c90pws98aF8iqcrGlKi/Y3aBEW
	Hq3nCNCvJsKtBhe6Yjb+JqvDo1PykCyajjnzPwOVRQPA9Tv/q4ADeFm1cUoDnizMvhsXkJDyyPU
	92I1fQ5i+rFilHQ4sp+NLIpIBQKEb0axI3vGy789Z1/QAUYSVTDSl7vtJU8VhjeEWA==
X-Received: by 2002:a2e:bea9:0:b0:3a6:6a12:61e4 with SMTP id
 38308e7fff4ca-3a9c5380907mr22473741fa.19.1791777703249; Sun, 11 Oct 2026
 21:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004212403.208681-1-oss.patchbox@gmail.com> <asm4DV84UitLCbve@dell-wzy>
In-Reply-To: <asm4DV84UitLCbve@dell-wzy>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Mon, 12 Oct 2026 00:01:31 -0400
X-Gm-Features: AclHuK8Nc-yI1UOeFL3cp2dh7P_n3SkiObRIXOBg2zlQtbRku8sMwkQ2lyVopD4
Message-ID: <CAGG=RgApzG=MeZ9xbpeBzqE0i0Q6RCPXtnyS-30JfEDPDKNN0Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/i915/gvt: Don't replace a DMA mapping that is
 still in use
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Xiaolin Zhang <xiaolin.zhang@intel.com>, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, zhiw@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Thanks for the review!

On Fri, 9 Oct 2026 at 23:59, Zhenyu Wang <zhenyuw.linux@gmail.com> wrote:
>
> I don't think this is *real*, as code would simply destroy entry in
> that case, and there won't be on-the-fly dma operation on that, as
> guest mem setup is totally before execlist submission, if guest driver
> changed mapping by ignoring gvt emulated execlist status, that's just bad...

You know this code much better than I do, and I can't test it without
GVT-g hardware, so I may well be missing something.

The case I had in mind is the guest mapping the same page at both sizes
and keeping both, e.g. 2M in the PPGTT of one context and 4K in the GGTT
or in another context's PPGTT. If the second request replaces the entry,
the first shadow entry seems to keep the old DMA address, as
shadow_ppgtt_mm() reuses a PPGTT that is already shadowed. Is that ruled
out somewhere? Please let me know if so.

> So this change would always force 2M to split into 4K? why?

No, only when a 4K entry for the same gfn is cached at the time of the
2M request. With no entry or a 2M entry nothing changes, and a 4K
request now reuses an existing 2M entry instead of replacing it.
