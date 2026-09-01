Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9F54A3845
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294285; cv=none; b=C5ukGgkbItDfXuJd1W8w4cr24pbSnzp7+tLiWogmLhZDF2FdGLuWpMapxX3OpwNZLRLp5Wde4AGo8VdQ6PM0jcuChIg2qAwjNPsuIfyfTv8+4LSsX9idmHvgHH19onS9LQrU53MzFZssS8k2hBqpGrfmhXchxIiJKTcUaOjASiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294285; c=relaxed/simple;
	bh=sldmoJYScfl31jM3ib4ObxKG2HqldB+IrI8ee6KokdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5B+vabVVXTneOuhAdJ45IaN4BqNzSpVyer/6yVoeKAr1mGBcge5vXvBZ6NYFV8bp1RJMGXKiDoEeUHJjaBBdJ7rzwMVnPiW8v2mMGVT8RCnVA2wMElFnG2/ton69G/AwotNeKh9hC1fyi/KyYORH5PKCZsZ0io1qZlfmMgQg3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=g0QS+gj6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="g0QS+gj6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c250a2bc3b3so22315066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788294278; x=1788899078; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4RMRsZtxYKt7wS2Hs0vwKTCicpwK9tkOyvJwCizYns=;
        b=g0QS+gj6Ji3zg8Fzmx4cCyoyEbCIDGIl79aR4zw27omEDgIgB4JfQ0Y/l+PIYbn/PA
         Be8IjXoJNfgHy5gwlDoqh5Ib6hvaAPJCMd5l7I2MRG+PFsHNbmhhLRM+8WMEys5fR9Ny
         akkT2Yt8bUpjMOeYMMke+xGT/zAuo07qOvO4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294278; x=1788899078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l4RMRsZtxYKt7wS2Hs0vwKTCicpwK9tkOyvJwCizYns=;
        b=l+cuHDo1p9Dth5pNqouesmc3RUOc9lwl8c3Qx7N2ts8+FS5Ue1ytmaJhDeeUjHw+T7
         Ghtj+tspvpU6zQhlVvTfeMDnWwlQL+Wi0GxuEvlSDNsNidHh+oEL0VtozjaIxIz7CS88
         MYY/uOvQjB4zRqHcXAWyf0B9MIUZ+K6+96xCeT7rJXvET2CUH366k4q0Y2+t4Y+euEK+
         l0IMUTs/uvMGjtg6NkMnMht2LcBzCIUMXYIO7wffN6PGMwKr9U3n0yo5wuyZxR8c60mI
         sAbxw3GdTdqUXI0SyKCGoApABKWcv8sBeoKrwSa+BIa3nkDvWApEPS5c83KeGZT0pB5q
         58qw==
X-Forwarded-Encrypted: i=1; AHgh+RqOPTdXkXuiyWsyU0/cJrqVxbiP/gb9BSMkLKBcidVFgWe90W762ludP8kIYj2Otv5RzdlVysxoWc28MCY=@vger.kernel.org
X-Gm-Message-State: AFuF++lgXtj/w9r0G9OKIgmu/FtjCqQpItB928/WiciVvOD9hgHAe8iH
	VARZhG2eHIcTAk2fKNfkYZmI/xd937i7h1uMvkcExkNfSSAjfVOYnOFd/ucz3wyqY7+7WVVaQt9
	XQfipOJw=
X-Gm-Gg: AR+sD13c7DOCb+hCSAdxG0Fna6Fr4BsEzOgbXEkQqk25u8ExVzzogfqaUxfLnrtogvz
	AoZ0n5OFjdoitjmGLqq1omnuT/Q7vliRvaDss7DwSojwG/q8Qtts7prf8/sEwrgs1AICPDUsaS1
	yuYT9hfjn0Rngee5m4ZYf5tSJ/MAnvdV7Dwi3nvCfqrnwXlBVcLIm3Zfui/aqPTQA/1lX3pZ9Kq
	tBrM6CyPcChLHPnBPh2+BbW+8WVaIRC1r2GlsJhw2bOBwJ/THbUZclIADUErIZFDVZeNsczngfq
	iUwIcr+p8MGsf8C6cxVqoI+GUr7p+WbGpDkDd5R4fZle/RRoNe/LIOcLPYFz00gP+KLy/JqGUkp
	mgV44mX65cyrtuql8uzyTBsAPVEaWOd6PdnlEluOJ5mkrp8HJXYg0cwAMTV4JGEY3weJgtl0lKM
	Yy43ol8r0HoXfN3fG8Cm/NbIgko7ZsFsMEddRKNxVkKs4qhZWxFXJEIVfFoEMM/HTyhhFlqPSJx
	8kSSwFl46D5wOukhr2mE+0XqTOxCNw1zN/hTvmOU60Ybp7U
X-Received: by 2002:a17:907:1ca4:b0:c21:9870:c4f7 with SMTP id a640c23a62f3a-c2557433257mr2259764666b.20.1788294278463;
        Tue, 01 Sep 2026 13:24:38 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002f908sm20560666b.20.2026.09.01.13.24.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 13:24:37 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c25b661d37dso33570666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:24:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RquE7pZeMG0vzPyzP6LmMqN+ysW3giLVIH61AONB8Ben/Of+R21uaEvN1EjbWOHlfrWdWKBdXjwxwcxuqc=@vger.kernel.org
X-Received: by 2002:a17:907:1ca4:b0:c21:9870:c4f7 with SMTP id
 a640c23a62f3a-c2557433257mr2259760166b.20.1788294277490; Tue, 01 Sep 2026
 13:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin> <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin> <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <CAHk-=wgFEG7ZVaFAbo=bWWfsSh_weA4cOh6BV-xHWNSn6SwNBQ@mail.gmail.com>
 <737a4f62-f50a-40bd-a94a-1f42e9f3f54a@acm.org> <CAHk-=wiZog53-M8--_2m7HRk4XOQ+_jkh1XVuyQXXJgSwooQng@mail.gmail.com>
 <07dcd177-bc20-416e-accc-9c137d70a5d6@acm.org>
In-Reply-To: <07dcd177-bc20-416e-accc-9c137d70a5d6@acm.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Sep 2026 13:24:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1rTtCXQVf-_doFT0KbnCDObvuoG0yEv8eH6V+Yq4=vg@mail.gmail.com>
X-Gm-Features: AcwNN1UrGJ0dKTFkZKrqa4mGdf-1Ln_Qsse_j-BYtQta2GxuTVhnifoPDPpl0ME
Message-ID: <CAHk-=wj1rTtCXQVf-_doFT0KbnCDObvuoG0yEv8eH6V+Yq4=vg@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Bart Van Assche <bvanassche@acm.org>
Cc: David Laight <david.laight.linux@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 13:06, Bart Van Assche <bvanassche@acm.org> wrote:
>
> This makes me wonder whether I should switch from the official sparse
> tree (git clone git://git.kernel.org/pub/scm/devel/sparse/sparse.git) to
> your tree?

That's an option, but honestly, I don't know how good the state of
that tree is. And I'm not going to be a good maintainer of it.

If we really have lost sparse maintenance again, and nobody is willing
to step up, I can try to do a minimal job at it.

But I'll be honest: I think it's been exactly two decades since I
really worked on sparse, because I think I stopped Sept 2006, and Josh
Triplett took over, and then we've had Chris Li and Luc Van Oostenryck
doing maintenance.

So I'd treat it like I treat my microemacs "maintainance" - sporadic,
and probably with an LLM. Because I'm not really willing to put in a
lot of effort.

This is partly me fishing for some poor soul who actually *wants* to
maintain this. Because if somebody sees that "I'll use an LLM" as a
threat: that's exactly how it's meant.

But Bart, maybe you'd like a new hobby? Think of all the glory. People
stopping you in the streets, asking you whether you're the sparse
maintainer and asking for selfies.

You won't be a rock star or an astronaut (or a fireman, or a dinosaur,
or whatever you dreamt of being when you were a wee tyke), but it's
the closest us geeks will ever get.

             Linus
