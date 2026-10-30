Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793365951;
	b=Dqbb3sAd57NaOgYN8C/X4Ld2W6D8aQG2ICH9NbdqV8bm0v+x6dWSJCIOevl07T83Rp0s
	 gVgPwzrg6Wnf/9hk56/NKUwcoGIKKBsNyRBYVJoQ1A2g2c8WEHV9Wp1iDy0+lck7qoDfq
	 XeqLw4HO5dwfJwv52IUNtFr2Dpqvaeyw/JiuVVgmbPrUYuDABWbV2mzNgzkNUw245oGUw
	 HuIjVAfzOygEenPzxvX3yfVu0lQGqHXcYah6N2SB7XvGbuEjmN3kQPNnrJu7V0B6zXzNt
	 H8F7lUsPyvHtxCnCojUY9jZdggScpzQOFB0yY/6w1Jpq4nAfLOAD+0nMGHouMPER3MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dDBHKImO6A2eY0c1X6s+PbB3F+7X5/fjHZPXEe85mFc=;
	b=RekZDf3f1krsxmlb5cgNLfR0asXrHuvhYkCzDh1tU0N1cqb/L1gRcmZOjiqW+Ccgt02Q
	 ct58lN8SYvV+4zY7qOhG/vo1vWvE2nkQy2fLnr6ofFn2zWrsI31xJkh2PxhQ5mDqogB47
	 5QPGKdybJXNuw9XT9pAlnWTRtl3ZiyWhgMWGKmrPzRd9aHQIS+oyJ6UWd86+inwNX1DZS
	 P0NuKNEFq88A2m3F2pxDuAFci0QjyHNOvLWeDq9ewsOh/K+pt1X/+JbTQs71ejr4dcxB0
	 RciQ4XZESEdUOb+4C99x1livsySfzAHCw6NzHkY2XU4DMZZNXPaMFPQfeQTKGFGKVvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=D3yKQ2Jd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18394606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18394606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=D3yKQ2Jd
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8aea7b7ca0cso6524527b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793365950; cv=none;
        d=google.com; s=arc-20260327;
        b=B1toF+flPvAn4Wc0ExhjEWcwhBBJvWq020it28B8guTefCYqNC333JUTevdHDkcXB6
         cpMeQLmviCktPH2/8TpuxQrDX/cEHIHTRj69xag3blxuUB9uMpuFdtoWLvjWNcLGSqpn
         FaGqafCd753yGZQ9qzwPRlGe7OC6PxgZzv08dIqlw8cd0GnEGpAB5+nKTp1YgOh6KSaD
         G/hlUqaKBCs3MeWrzgcvimAJLRKppyhYY4l5/Iknw282gq8rbq2E5wduyvv7ziLImGx3
         czkldbeXGo0yTWIhVBPxZwKzYMeJcMedOfTPpRejaozRtm8mL2EbwNi0dosh+THqmlyT
         rRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dDBHKImO6A2eY0c1X6s+PbB3F+7X5/fjHZPXEe85mFc=;
        fh=6Bs/tNBnUIplkAu9ThvVNPCG8skJJC9q3/KPUf1IBGs=;
        b=fJ6KCEItrQCX0/pEQdMLSHyviPmHrV/N7cA/ZkHtwGj7boU5Tb0A4fhWJAN8TAucDs
         Lxbqa+GDe1xeCDVgS26iL0NP+IhnTXRfGVCFBkq6ZybgAYr/XYgD/tFxVU4liZ8OlQXt
         dgaDmHSLl4PPypJQA7p5mbqjFdVwt5InqfnOuNszyy0C4LEchTPdDqVZL9n3VtwoGEz1
         7mJz9d5yoZPRMHSitHszp0gNwrkp7kznwj3jXsuIFEnTldatIT+b6WUVC2Z89P46xAth
         i7/OY782Cg/LwAPFRwZaqr5xJAy5EmhyKVnY2C/ywEcAXtci+fnhdWQ1ly7jx4fmo2KQ
         g75Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1793365950; x=1793970750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDBHKImO6A2eY0c1X6s+PbB3F+7X5/fjHZPXEe85mFc=;
        b=D3yKQ2JdWepoaILQnUijgya8UQM//JiglGXTQB2J6NrWBmvwu1wopzjWxV070FzF5M
         QcLQaiBhVgJ35vAuvLekKi+yUE62PPqC4LsOqFx9MW33G2SF6KL+iZeE+iw/Rtlf1gVo
         +g7p3NexqyD7Z3WcyY0kM1ugLrGIn1Z+U3qUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365950; x=1793970750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dDBHKImO6A2eY0c1X6s+PbB3F+7X5/fjHZPXEe85mFc=;
        b=Z7C1WBzgd3RtGPEZBED4yWHVjocjTwUjWE7ORFUSHgiEInWrnHoGbzJ1ouai0voUsa
         KkubCtZWHAh+PG5m448txyp0Nkb0aeCIPU+FTlGqR3LV80j4D2DBRpGi8Wa4tALp4LHj
         j7X04Izi5VG9lS6W7v9IPumzj9seH0PvxfSfD9USjDLZH862mJpglAzwsTGWt62N6b74
         TepzaNyDN35V15RNuHUOXf7rbhlHn/xyXCfS2X0Eku6WSgHO83Ryg4tI6TeY0rSck+dX
         +3IB9PNU7lfiEx32kgkt4N4n7XZ1fdaBG+QwxsGmZgXQl0Uj2dgvu6WF3kz993zGp6b9
         T5ew==
X-Forwarded-Encrypted: i=1; AKwUvBwz0lT2DsYkf/gUVSq30BLBfWswyc7C771qsGm67VkCtJHOr5k0Y4Shbajlng1g7t3Qu+CQAvfirHYiuuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxNP8vUw7VoQen07nv58m0aKSgriYtsRguh39hxPmyzVwDqJ9x
	m5CL2vFCqwE+LdWBNig1ziGFj5pefneh9uaKmA6Oq9Lo4fmWlxzXgwYiig8eS3yZO/Y+0pSF/qP
	dkbAuVbYhK2lPrtnb9KSENX6SvC5A5sel2OXos+fzdQ==
X-Gm-Gg: AYBFou0pnDH5TJuM5EWbkrQ1nI9ccQ/AMypP24znrVQI73EQb4xZYqxjlnZ91rS58Ra
	/roLLmQAga4HwTtH/XkKJZF+N0hgHeS/ry9aPT9G/33E4/d7y/gR4HuSuSQGZs8kVAZF8D9R1XH
	6b74qDMz/SJV9kO4bwkrb2HRIpKu5TJK8EjfR5sgbSm1M4eVt40tIZnq/CyvQpv+qxYHzWcQl26
	YS13xberansybMRbvyzt/Gil/3X2UlV57HgvC0n5iecNyaNAfT0hw4k6k+ETaUXtV/Tm0a4r72d
	21Tww8ld9UzhvxLTg5fAdnCc30QGXnURgO61MBdEUlFJnsb58qtlUdGnXH2uQYofRd/B3owq5+e
	gRWSEbN2J1T79lMNn/IYJEpMZiiaukg3BcI+snPtwAqkzUguriFsWmsAO8PU7jgiKymRs4A==
X-Received: by 2002:a05:690e:1699:b0:67a:6b2b:b864 with SMTP id
 956f58d0204a3-67ba4ee9dedmr1201735d50.45.1793365949593; Fri, 30 Oct 2026
 06:12:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
 <20261027231513.816148-8-irogers@google.com>
In-Reply-To: <20261027231513.816148-8-irogers@google.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 30 Oct 2026 06:12:13 -0700
X-Gm-Features: AclHuK8xzB6Md5YiYDKg7cBeqIUYy-GW213xYmIva0VuA5491eZtPnV7iOerbJU
Message-ID: <CA+w=M=Sx_X=NsvvNEtwgjBtHZg=fnPiaBPyqopHXze3NRe7mLg@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] perf symbol: Switch backing storage from rbtree
 to struct symbols array
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2026 at 4:15 PM Ian Rogers <irogers@google.com> wrote:
> + if (symbols->sorted && symbols->cnt > 0 &&
> + !symbol__less_or_equal(symbols->symbols[symbols->cnt - 1], sym))
> + symbols->sorted = false;

Just want to call out that in here, every out-of-order insert clears
sorted, and the next lookup qsort()s the whole array.
This is fixed in 9/18 I think but moving the sorted insert into
this patch make it more clean.

Some behaviour notes:

- Symbols with the same start are now ordered by end instead of by
insertion order. That can change which alias
symbols__fixup_duplicate() keeps.

- The order of full ties now depends on qsort() being stable.
Patch 09/18 replaces it with a stable sort, but still falls
back to qsort() if the merge buffer can't be allocated.

- On libc.so.6 I see 62 differing @plt-name lines compared with the
previous patch, for example __GI_memcpy@plt, although both sides
still have 55 @plt symbols. My guess is that this comes from
get_ifunc_name(): for an unnamed R_X86_64_IRELATIVE relocation it
resolves the addend with dso__find_symbol_nocache(), and libc has
several IFUNC names or aliases at the same address. The old rbtree
and the new array do not necessarily return the same alias there,
because same-start symbols are now ordered by end and full ties go
through qsort(). The PLT address and count stay the same, but the
displayed name changes. Was that intended?

Thanks,
Alireza
