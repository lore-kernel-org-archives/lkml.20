Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721213128A3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604771; cv=none; b=UAXymbfqYWRRUK1eWX4oFxWR90q3BwiLATMHVUFHvguWb39yMSpRkPiy9hloq9Fh1XKXGvHfSAfggo3jAvPu+TWd4CWj7f0WPNja1baaJw58BIGcr0VM23PQTErYI6+IuZ+So+kdNgRhWMlWAB9g3W9MvenYAU3P3BtLVOkz6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604771; c=relaxed/simple;
	bh=qKwArP0WigeNsSMiWM9fRKfNl+ixVag40Kpf76pLGks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8p6AkjLbMhsnx/1UNZC7i+XNVoCWob3yJMvgqtv1K4/pujDL5vT/2C5Iuws4s+uTp5rNi0+EmlJ9fvmWZmsAZ9MOhzPh2zQ+NqpBL07xlqLkRRj4z9haBM1vrYEjbfy4JYDkDrd1JPSso/p6EzWFpfRYQV8jBfI/9K6S1TOFN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFULPblh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFULPblh"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so20281055ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604766; x=1789209566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WXSZYdhEXRp/byDgRnPhYVP+JoRijs47XywpK06FLE=;
        b=DFULPblh00QzhGjhOtYWYGszXWRkwWab78QiwXLfM1kRqCEkM3tx/pMIGnUlLk83HW
         iKhdG+QqugrnTwBz3pC2FU18hyRDjy9yJzCFcuA/GHu+lNlmb2bVW4v6hFk46afk+KuS
         3ewZt1dhIN0Av8jqnEtgUozxtIvkcu1hsnb7eLukyUbw9wb/r1Muh9sWsbGIBvzxb6Oh
         8f5wGk03q/mNyOanUsTsrhxRpijFf8ZHCksTpbeUJB72ykkwVrLvESRXJRb+AuG7UTma
         G94BoQ0r6gMmQgZ82lMnEc3x4xJlhO1SmMVRXdRid42IeWYf8wAMO5uJ6bxiDO7mGho/
         EYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604766; x=1789209566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WXSZYdhEXRp/byDgRnPhYVP+JoRijs47XywpK06FLE=;
        b=BJpchqYi3FgQWNY0pb2u8g7BrG4j20phHOr0WuU41fD+DHew/ZQXKCimb2w09vYum1
         hJLxh6dIlTEMQQpW6t1M4U9QnluBazix7dsJWjGlvXQBnyC/Soi69m4cdxO6drZOL6YR
         o+mV8iCRumRAZfi/iTDOnhX7JloxWyaG3xuevRh493lUYu2gF4x2MYVESEUtdmfxSFN8
         t6KhZpUDh4rs0Uy3n+Kg/8rx8cTxkQ1PLsz4KjEkqdvulIJpLeuQy5KT7m3SX0OIbjpI
         cgCQ2VgZnrzw2SnLBIeXtd8555vtEUa2CFj9u2VnhddfB77tUghaMcWZUat/TppNSXXM
         5czg==
X-Forwarded-Encrypted: i=1; AKwUvBwVdXJv83DoBEsqi5YkhUdiCWmJm94slCU3zXZslUAzJWsUnXYrSMo1qIGLHvXYjflIfK0p3yvuJuZW0qQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m7xvzY5PR3ualxstBqcDGgEsLEfkLY2XlDGfVU0NuLc5cb1UuF
	r+9aQvisNgCr3wT1KhpFDf3KtL5WKpS045bwCAuO6DxJJqUFseKuxrHM
X-Gm-Gg: AYBFou1b6hKf1DU3qr+FRE0K50dveYjZJF9hBsLx6yDp5Yx4TLlot8BDLBWQDbTH4YL
	ogHg8vB9yRUFvXsNclrZd6DQxWeDZLb7y3N/3VIP115nQG7mJXkShglUEpnwK8xXarY1oG73oRD
	/sUgUlAcgOAJOo1+cUgXHqFXO0LkV/vbGkME8uifYRfWrxSA9rHoIGPf1BCLoRgvuDhGBjVknBI
	8rEqitm7EaR1yZM2pPGUb73fiG5VS8ResafRjscuOjJ8ioGLMYacAhicEJ16T3OlV7B21d2rIDx
	O33uoTtI7e1uuOlBLTh6BzJhf0pL3WyCLFhD2WZiIsqoLsDSRn8YLe1JFc4qmHprRcRGsj4Ilop
	YtFnHENw7c8jwwQ6T50r0F6NOZdKmTOFKEedF7cZFJm7/YaqW93/qCeP3lh3GH+6z28N1IpUFXA
	lP2oIxS9K1JwCDOAIbXzcas7zalEVUmSOYrpMTb58egjeWkNEd4Z/VW92wMnm+nKUE8nsXEkiIJ
	PjY
X-Received: by 2002:a17:903:198e:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2db125ca4b4mr188947935ad.13.1788604766401;
        Sat, 05 Sep 2026 03:39:26 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([115.164.90.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149ccf2esm21288335ad.73.2026.09.05.03.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 03:39:25 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2.1] mm/damon/core: fix false positive in damos_quota_is_full() when esz is zero
Date: Sat,  5 Sep 2026 18:36:58 +0800
Message-ID: <20260905103935.4871-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905002534.67885-1-sj@kernel.org>
References: <20260905002534.67885-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 04 Sep 2026 17:25:34 -0700 SJ Park <sj@kernel.org> wrote:

> On Fri,  4 Sep 2026 23:35:38 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > That said, it's not important for me to add explanations to the
> > document, but may I know why commit [2] changed the behavior which
> > introduced by commit [1]?
> > 
> > Commit [1] Behavior:
> > 
> >     if (quota->esz && quota->changed_sz >= quota->esz)
> >         s->stat.qt_exceeds++;
> > 
> > Commit [2] Behavior:
> > 
> >     if (damos_quota_is_full(quota, c->min_region_sz))
> >         s->stat.qt_exceeds++;
> > 
> > Before commit [2], qt_exceeds will only increase when quota->esz is not
> > zero, but after commit [2], qt_exceeds also increase even when
> > quota->esz is zero.  I'd love to understand the rationale behind this
> > change to better grasp the design evolution.
> > 
> > [1] 6268eac34ca30 ("mm/damon/schemes: account how many times quota limit has exceeded")
> >     (Fri Jan 14 14:10:20 2022 -0800)
> > [2] c7ec7d5f6b3d1 ("mm/damon/core: handle <min_region_sz remaining quota as empty")
> >     (Mon Apr 27 18:33:50 2026 -0700)
> 
> Seems commit c7ec7d5f6b3d1 didn't make a behavior change that you are
> describing.

I actually wanted to point out the behavior difference between commit [1]
and [2], but I've understood and agreed with your point.

> 
> '''
> $ git show c7ec7d5f6b3d1
> [...]
> @@ -2601,8 +2613,7 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
>         if (!time_in_range_open(jiffies, quota->charged_from,
>                                 quota->charged_from +
>                                 msecs_to_jiffies(quota->reset_interval))) {
> -               if (damos_quota_is_set(quota) &&
> -                               quota->charged_sz >= quota->esz)
> +               if (damos_quota_is_full(quota, c->min_region_sz))
>                         s->stat.qt_exceeds++;
>                 quota->total_charged_sz += quota->charged_sz;
>                 quota->charged_from = jiffies;
> '''
> 
> And I don't think there was a behavior change.  Hopefully commit 54419bbd0ee3
> ("mm/damon/core: allow quota goals set zero effective size quota") will give
> you some clues.

Thank you very much for your clarifying :>

Now I completely understand why there is different behavior between
commit [1] and [2].  Because in commit [1], esz==0 only means quota is
unlimited.  After commit 54419bbd0ee3, esz==0 also can means do not have
quota at all.  But the qt_exceeds should just not increase when quota is
unlimited, that's why the current implementation is completely correct.

Best regards,
Rui Yan
