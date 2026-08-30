Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1700130674C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788131182; cv=none; b=YrLzx5fj3hqg+8LX6n6Eu9P/qIHky0fxlGrT1R367BiACK+HaZpf0y9syk77/G93KzBnvoYuTnkSKy/64aSnChnL6SCQX5WEOJ7XQdDscA0nNA3OTusiRIbq2KzFandL0Li6Pu15vTyi7DrcuPIWhrE3YWNAjdBvGLZkK3dPx6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788131182; c=relaxed/simple;
	bh=rL4yxxYKKG4TIDB9CU1E4ZNOHQlWPM2opU9VJ6JG+zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pl8Tr+BrEguwjftDvenolMN5NDRA7wWRr8YTFeVGwDsppn5NmvW7cFvb+a78/S2Z6PYYeovvqVcLVbsVSqUoacpD34BQ8JBS5geUkF4yLnlJC1djx9pNW7XemqYef82Zde3O/HVrqmEs4ctyFfyZe2qVCZsD3hWZwxpTasHonS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hxjFWMRF; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hxjFWMRF"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso3595601a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788131178; x=1788735978; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kchg3SI0pR13iwu/DkltwTxRLDpJHhH3QJUlMk6iCEU=;
        b=hxjFWMRF4q1i6ZxYrXejLkl7Jatic3vdHu02PxLogkpntD80xTjxEpSUnY9CCN3a2L
         mlvBo/f9F/eJwAveZ5ragf0tJ4/CCikMkqNOu5eAUfGDRZTP+u8FNrYZDu26MZpmplEb
         BUuhIzFp/fIbVmnirPva0vju/oxgQsn5FY8yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788131178; x=1788735978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kchg3SI0pR13iwu/DkltwTxRLDpJHhH3QJUlMk6iCEU=;
        b=G3STTXolJHiAXfbNUqrZM/EcL47qAFWdEzLjCjebyD68PWLkFcAjRORAxqdv7wXFik
         l9fmttOdz1QSwvVyi92AUxTkQ3k279ztvlsp8dTKliTjswSyAgVHyrUDZ4c6mheaoVo6
         PttaXnxFGnfo++0g56C4IRYOKBI7+i6sBeqkCKC41PVNIgFYpxVKmieZEixkcDtWhAjF
         owmrDmaHue6HnQxCjzWMWYpbS1b01fbS0VtEQ1L22kSmuQM19rtEIZno3LLm9+A/3Whc
         DIOnz8olHZjDiVc2Nbz/ptgWnEHOUNEkMduZCqc7HljTVgQZJJo7xo0W9/1NnjdWr8Mu
         M2Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzHqOcMZ2y5sNnGkHoMhgzik7F1mNRN4TYfO0/DFtMzqi9QwEhDo9vYrxi//ti6LC6tkIM2J3jcvNzjtIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n0AeGIXK4TO3aHgTYrj73cSQs44NKx87DTDo4hueOPzUK98YcK
	S1TP8NUlj4HgsN6+O649GDG6j6qIqOhKqclozDktihTW6Kyr5xnXwBcsGhrYjKZh0zA/WFHBmiq
	xzYktdNc=
X-Gm-Gg: AYBFou2FzXSoNSnSiNT+mv+AWeXtF4VfsrcYCAB6VpO1jX6vjAohwdRFMUhZ/2+63EA
	V/HkRwDT9JAlQKOGi+4RoRliP0yy494hrjmQh3Q9nThtwvVdAdxxi+vPOLG7kKG3wjcdLwWp7BM
	UtrlKDikvpoT/Q31aBnYhoLNEYUCsPi2i9vTjD6MYe0HjPcg6WoHMTSoqCb8KSfmjKrmBG25RQT
	BdatAGX0ItvWmoDa6ZxQGs7kctMaE+29tpTdqepYJmvynjLarMCNpEoCeqC179V7qZR3NTmbZyC
	ES/xD6yBuMFObMmEGXsfpTmdsXiMQ2BZO4zFr6eq3Wh4t2G9N4tUZFLVfHoieMlgC1BuAS7cTpQ
	yO15CSJhP+HoE0xEt9Nczq8FBF7eXn33l1H2X/ZlguxVB7I1Y7GEF7syKlDuSG89GJZTsWYZknf
	qjy3SwG08tUHT++Tla2IhFSp7Yc7ty4yvRj04i/N5qRlyDCozxZYq+Tspn8WXJVuNPK9sYaLWlr
	USklvrLDBczuvvUff23rk5EA7kOuF9Yd8zDE445cpu6Cgvz
X-Received: by 2002:a05:6402:a0cb:b0:6a6:32f9:d7cf with SMTP id 4fb4d7f45d1cf-6a632f9d94emr5204596a12.20.1788131178171;
        Sun, 30 Aug 2026 16:06:18 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b88472sm2600929a12.12.2026.08.30.16.06.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 16:06:17 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so2697203a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:06:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRl0wjo5TJa+psEhobbWOg2b5a6aKuwa67GrDWFMctvzjsfYU6ib/8qtQ4iHL0f8sUlgw3VSacWhOz7AU=@vger.kernel.org
X-Received: by 2002:a05:6402:304c:b0:6a1:8d1a:816b with SMTP id
 4fb4d7f45d1cf-6a60d3c68e1mr10567029a12.11.1788131177037; Sun, 30 Aug 2026
 16:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830222100.2706175-1-usama.arif@linux.dev> <20260830222100.2706175-3-usama.arif@linux.dev>
In-Reply-To: <20260830222100.2706175-3-usama.arif@linux.dev>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Aug 2026 16:06:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg3d5HUkgdWq4Ac74xoUDU_BiHTC_ONacwYFoXnMQZ7Pw@mail.gmail.com>
X-Gm-Features: AcwNN1V9mL9a1wNLsNDWQwZtJk0bPbWUHAKzqqG4Vlgljpt5d7Cp4YfC54xzDks
Message-ID: <CAHk-=wg3d5HUkgdWq4Ac74xoUDU_BiHTC_ONacwYFoXnMQZ7Pw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] zstd: use cpu_feature_enabled() for in-kernel BMI2 dispatch
To: Usama Arif <usama.arif@linux.dev>
Cc: dsterba@suse.com, linux-kernel@vger.kernel.org, terrelln@fb.com, 
	terrelln@meta.com, linux-crypto@vger.kernel.org, yosry@kernel.org, 
	ebiggers@kernel.org, hannes@cmpxchg.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, shakeel.butt@linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Aug 2026 at 15:21, Usama Arif <usama.arif@linux.dev> wrote:
>
> Add ZSTD_USE_BMI2() and use it at every runtime BMI2/default selector.

Thanks, this looks sane to me.

I do still react to a couple of places. Notably, this part (repeated a
couple of times):

> +#if !defined(ZSTD_USE_KERNEL_CPU_FEATURES)
>      cctx->bmi2 = ZSTD_cpuSupportsBmi2();
> +#endif

should probably be an "set state" macro the same way ZSTD_USE_BMI2()
is now a "get state" macro.

And:

> +ccflags-$(CONFIG_X86) += -DZSTD_USE_KERNEL_CPU_FEATURES

We don't have anything like this for any other ZSTD defines, so my gut
feel is that either this is in the wrong place, and it should be in
something like

   lib/zstd/common/zstd_deps.h

which already has kernel-specific stuff in it, or it should just use
#ifdef __KERNEL__ like we use elsewhere for things that are also used
by user space.

The whole situation with ZSTD configuration is a bit strange. I note
that there are things like ZSTD_ARCH_ARM_NEON that the kernel never
uses.

Why is "DYNAMIC_BMI2" a settimg but things like that
ZSTD_ARCH_X86_SSE2 and ZSTD_ARCH_ARM_NEON are never set? This all
looks messy.

Or is there some hidden config I didn't find?

Strange.

             Linus
