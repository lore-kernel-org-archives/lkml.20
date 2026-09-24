Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B5410D3D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236663; cv=none; b=bfwZVGyfHvDyAbI+IiLPUbq1Z6FhoQ3qbaqhOg7Oezeuf99MC5P8rYc3sDaTIY0RsdVB70WN+H0e94OP6eM7rigfqXLxsxC/IdvykAP0cUSKk3M9QKyVb8V+f1ijaMizqmgDmqL5oqELyHgLIqlbLq+UebnoRy5Sr/1LS9Va0YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236663; c=relaxed/simple;
	bh=H6mEPlYC/Zx2xm0YxomK8IB64DpKShzG1ZNf7mFzOLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aK7GqRnKFXEchXWlABiQ08LIy2Obe/u1KEcx7e20Q/HxQiieVTBGJKtcNWg9bvD1C+jesWUHyi7FVC5qxlIefhZ/USHnGIXB8bDpuAWqiUl0QrE85fb2hq6/G5p08FGS7E2Rdi/HS1y738LYAQ1jySnCsz218Pai9J34PpxH6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlcDbdBq; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlcDbdBq"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1000067a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790236658; x=1790841458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxnh7K5pul4WrdHHRSoLszYKzHojdYKXEO6rx1LCqCE=;
        b=WlcDbdBq4TB+WiVSqz6laib5vnlsYsTdTdfyAwaB04IR0y3Ej7msw2Ui2mRs6Rny/P
         xlx+cqqT0trF2blRblok75HfY6RawYIkOw5wi2yGE5VWoIyWHyIZXCjcRYt6EsBhJecZ
         MTFIcBts7AucpbxRQW321Y+cG8QuNUENi+niMFR0VpkVhTcVZtTYBzWS0Y5id81Xq/Oi
         Aw3LTBiS47aBvFBUs2hkzxZvB5kSRCoEaHRsK0TNYgbxvTVA0FmEs/pw6c94l3XicN2k
         cNYcYM6Am9v6ofC4NeP+P6psxmgLtOiv3MU1mELo0hfyGDQpRU5KoZRiqTFHV0f/TFfw
         2QaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790236658; x=1790841458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hxnh7K5pul4WrdHHRSoLszYKzHojdYKXEO6rx1LCqCE=;
        b=Oq2kmP8T2OydX5FuAx70/3fGvU1klm3zan3rlB7hAGsQcmaLWzg7tKX4xpD6Otyc06
         tJCwBQ9YOLz/vwwRt/VnghUU1+dnRfT9luqpfywMpAwo5Xtwg0hbI8nRfC5rxeNUfNdN
         bzUnQYBcTFZQZKeJv4YzOgSRodL9gchvFn3UgSm2vAX1gJzRB/uw2hHsqXyDiA1eUeVC
         PBFILwAPZAT4irAozPv9OUb/VpHmOyrIhaNHJIeDKYeNznhxEqZS/thHj68sAqvp7i1t
         OQSLPwZ22Uxzlli4NA7geTnTQc0h5+Z5IHsm1DU9JYWvxgLHFvSoQFOrOwvMc+mbqK9q
         JDnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfp0ysk0Fvazc8cAqI+dgxKogXg2FzE7yu0U3rrWR9yYkvEGiVv7BGryEmLAPXTYFmpr49jtXCoqW+iHI=@vger.kernel.org
X-Gm-Message-State: AFuF++kAejRCl00JCY8L0Zlz9TuHA80FalI0sHFj6ozUy6l16f57AYZU
	s1z2PoaHcGVJ2sFQycljyc2PyAnP1QxEEwWOmg+llYOF71ydbRrw2Ap0FLyFSQ==
X-Gm-Gg: AYBFou0Kmm4LTwr9WII0gDcACOZlCwmHhti4L4IQ5UPrngNmTM1S6vbQ7tBE0FO5Fst
	LTWcfK4iLWzVToqPpiwLYKXJxVNUYqFjJRHQbKd3LG3DXxxyMYDiMXnO9gP2sGqCtXzVeNJrOYp
	WhTxfgREkbT2tcgQsHudQwuIMIrwJkzCH+plMz50laW89blxFKbF5WaBnJqRd1kqv0cfEu007zT
	FHOPxtmkKVe3yLUuGqjVV2Bx13bvYwQ4HlqU59moxk1PzFMKiS/KlSjqfl675kOAASIcjpEiARw
	nUIRx2XcMgCVVrjD+Vq0NNhZAXNpejmAWy7ks/gshl3jlMs4ZLz5V6sP7te6auEOSpV0BRyNAdG
	IZL9djzxVTpldTAbk6/pr6Q1EkC9ufeoHksVuaSQzKuxAl2dVfhXDUUd5ozDqBvhk/kpkkraMhe
	LA1fyMq71ngq+nQqDfvJveCLHi6/uReVutHfyzEnqbn/PTV0KJtvUgRsRXTVMlc1xRStVtI7wM
X-Received: by 2002:a17:90a:2ce6:b0:3a0:a055:1741 with SMTP id 98e67ed59e1d1-3a0a0552127mr323462a91.27.1790236658340;
        Thu, 24 Sep 2026 00:57:38 -0700 (PDT)
Received: from celestia ([2402:1980:867:387a:70b:38f1:a1dd:9303])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972eec92sm3573872a91.7.2026.09.24.00.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:57:37 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RESEND PATCH] mm/damon/tests/core-kunit: add test for unconditionally skipping the last region
Date: Thu, 24 Sep 2026 15:57:42 +0800
Message-ID: <20260924075754.6839-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919190953.86705-1-aethernet65535@gmail.com>
References: <20260919190953.86705-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

Just a reminder, I think you might have missed the question I asked.

On Sun, 20 Sep 2026 03:09:10 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:

> On Sat, 19 Sep 2026 09:07:25 -0700 SJ Park <sj@kernel.org> wrote:
> 
> > On Sat, 19 Sep 2026 16:01:58 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> > 
> > > Commit 50585192bc2e ("mm/damon/schemes: skip already charged targets and
> > > regions") introduced a minor issue that causes the last region to be
> > > skipped before it is processed.
> > > 
> > > Example:
> > > 
> > >     1. Target has 2 regions: R1 (0-100 bytes) and R2 (100-200 bytes).
> > >     2. Quota is configured to process only 100 bytes per window.
> > >     3. Window 1: Processes R1 (0-100).  Quota is full.  charge_{target,
> > >        addr}_from is saved at (Target, 100).
> > >     4. Window 2: The loop reaches R2.  Because R2 is
> > >        damon_last_region(t), the old code unconditionally returns true,
> > >        skipping R2 entirely and resetting the charge_{target,addr}_from.
> > > 
> > >     Result: R2 is permanently skipped even though it has never been
> > >     processed.
> > > 
> > > Add a test to prevent this regression in the future.
> > > 
> > > Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> > 
> > Other than a trivial style that I commented below,
> > 
> > Reviewed-by: SJ Park <sj@kernel.org>
> > 
> > [...]
> > > +static void damon_test_last_region_quota_reset(struct kunit *test)
> > > +{
> > [...]
> > > +	t = damon_new_target();
> > > +	if (!t) {
> > > +		kunit_skip(test, "target alloc fail");
> > > +	}
> > 
> > Let's drop braces for single line, as suggested [1] in coding-style.
> 
> I will change this in next revision.
> 
> By the way, Sashiko reported an issue [1]: min_region_sz is not
> power-of-2.  While this do not cause any real issue in this test,
> non-power-of-2's min_region_sz is not legal.  Should min_region_sz
> initial value set to power-of-2 value (e.g., PAGE_SIZE) in the next
> revision?
> 

[...]

> [1] https://lore.kernel.org/damon/20260919081239.8A3D91F000FF@smtp.kernel.org

[...]

Best regards,
Rui Yan
