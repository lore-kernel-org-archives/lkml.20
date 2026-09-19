Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9235F619
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789844983; cv=none; b=OXpde12dN/6q8m6F33EBogfZMzFcqJM/060Fm8vSJcCmmuECudDu50IT4zciJU163RImif291+Enrf4nzswGIIHrxDbja9hmjkkODqgSKFklitLjmRrTC4l+2kQqt8QskdBSzM46crhNIYCU3ugOpLvW5PQU0zZxE8E5WypLucc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789844983; c=relaxed/simple;
	bh=ufrLzN0G4iorWWuVwTHDbj1hN/QiQkoi3KV3uS/avk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofMb8UZexh0ZeuJ/4oikSa3v8sBX5Qj+L+/obD+XMkcbj7pXX29d2E2ZzZeei6AqUpN2YydEmOGH2s7tDFmVjSHXy6OlpKQFUtaz1Dx8jkd4uxc5cYqEpjdcyhdkNz0qAPWTt46vDJYQ7GYtFrD3AW4PqiOWuZHhIVKIvEmc+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpxmN+8I; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpxmN+8I"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d90ba1d807so21891955ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789844980; x=1790449780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+A8NmYL+ONSVcQNv/Xmt66mRPmqZH9O1MKGhSoPUDE=;
        b=OpxmN+8I8j9SQ3z7DJisb0+AW8F95W+v7mlT4FtK2e3nD2SzK1KW0pv6kqLGBRZIFP
         UFVsWXfZP2D1ZIhFs+7N/U/AUKwUFkeeO77KUXxtEKMrOnrwYfIu53dunq8rwjR1vqhN
         lht/BPLtiuN2TcjIPzo71oduAID7tIuyWHvbI5n90stcXB0x5z5ePF2xNcbQi/8v6dyR
         FkGKXgHUVOzeFNgtHYXP7aekGg1qtmuzeyJwVIfvbCAOaNERm+G0Z/AqfuO6NVRCrqyP
         BZUTRc32Q+86QDOZbwvXMxjZCtuLDFdB1YAoMF3LrE/seVaKMWY+LUasMExCYFopdLoC
         ynhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789844980; x=1790449780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+A8NmYL+ONSVcQNv/Xmt66mRPmqZH9O1MKGhSoPUDE=;
        b=0ZFnXK3dSZqIbMutovYUsrauFh25josQQRlUrNF2YmyJvaeXlyFAIy1nm72KPYbE1R
         45CYCPd3qyUkIVf+UPPvB1b6GB3UfzkFEFy2HDaE0H4tokWm/0N+dkvFcR1rBOWbEA7c
         oU1GaOUKObdAUlUFIm2sR96m+LCGBQmoIRVNNrdaDXYnzpblhKnJzIZDoXWlGbOd8Ciu
         TrKG493oRaNt+RGOWdELIJoG9BxOv9fyd9tOFazL+j2MXlt+a4WXCQECOAGithUBaSw7
         xPBuBSMqqxPCsNofKToLjYMZCcSWEb4NlZlDYDIg3A33Vc2deYPzdRjX3kOiNbp915La
         DOhw==
X-Forwarded-Encrypted: i=1; AKwUvBziHA1y/qqi94Owj0gntYDv8FVZuol4Gh7vyWIAilPg8ie3laj+O9Cr4H+sRqaWTuKFANQVeTBw/XQ/jnM=@vger.kernel.org
X-Gm-Message-State: AFuF++lFYjxuAE3d38JYgfJPfXkjeb7bTdFeD848XS/esjSPS+v/TO9f
	W6TmyoQC1GpoC6GmT66OIw8muM7T80aPA/u3dRteQgb5KTyuCFlRpD4m
X-Gm-Gg: AYBFou1kQcHvF1RG0kHlR0Qtpg+XTIahsq2oS0iEbS50EEZeUlBCNucyU0rX08A9ONz
	YVX3t/AJAyfLuAQybOOA8S0iOb5ev2byCbTu6hH0UFiOJIMYcXUADXekSTJiYTR6zL+NnrcMuQh
	Y8nvwHQSQKQd9Ejuk6Ago0gPHkbiLDJlMaYLPpz4iCQNdlV4bT0YuNPb+4Gv2eEBmGKCPkQnRNi
	cArJkrmm3gQ5nuf/9H904ejXALx9PjpIcE9Wg6r1v8/FSuGKrKCjW/A4TwqHVeyLgfNyYbH3hWm
	u+wu1zBawgmHV66qQxaetu7EGiBJBuNC3ydmAZXVCPcPWxkc92MW5/A1N90vjA6Rw0EiAdGR4O9
	KIb6gZ72N/mx+pIWGO+FIpGLw2CcirD6aEIqNHxu1kHTcV0BLxYpDzorWRqeYFQSR0VFYjxnvPm
	kwnuEP0BsVyCsiNiOamCoIlXPtWGQMEsKLchWzWsKbhAZRLbMdyspOqhzAFUvVyZGyFcF7xyTFs
	g==
X-Received: by 2002:a17:902:e80f:b0:2db:39da:90f2 with SMTP id d9443c01a7336-2ddb1adbee7mr109128495ad.8.1789844980074;
        Sat, 19 Sep 2026 12:09:40 -0700 (PDT)
Received: from celestia ([2402:1980:c3f:8e4f:9945:ef6a:453a:80bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17888a8sm12378465ad.26.2026.09.19.12.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:09:39 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RESEND PATCH] mm/damon/tests/core-kunit: add test for unconditionally skipping the last region
Date: Sun, 20 Sep 2026 03:09:10 +0800
Message-ID: <20260919190953.86705-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919160725.86256-1-sj@kernel.org>
References: <20260919160725.86256-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 19 Sep 2026 09:07:25 -0700 SJ Park <sj@kernel.org> wrote:

> On Sat, 19 Sep 2026 16:01:58 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > Commit 50585192bc2e ("mm/damon/schemes: skip already charged targets and
> > regions") introduced a minor issue that causes the last region to be
> > skipped before it is processed.
> > 
> > Example:
> > 
> >     1. Target has 2 regions: R1 (0-100 bytes) and R2 (100-200 bytes).
> >     2. Quota is configured to process only 100 bytes per window.
> >     3. Window 1: Processes R1 (0-100).  Quota is full.  charge_{target,
> >        addr}_from is saved at (Target, 100).
> >     4. Window 2: The loop reaches R2.  Because R2 is
> >        damon_last_region(t), the old code unconditionally returns true,
> >        skipping R2 entirely and resetting the charge_{target,addr}_from.
> > 
> >     Result: R2 is permanently skipped even though it has never been
> >     processed.
> > 
> > Add a test to prevent this regression in the future.
> > 
> > Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> 
> Other than a trivial style that I commented below,
> 
> Reviewed-by: SJ Park <sj@kernel.org>
> 
> [...]
> > +static void damon_test_last_region_quota_reset(struct kunit *test)
> > +{
> [...]
> > +	t = damon_new_target();
> > +	if (!t) {
> > +		kunit_skip(test, "target alloc fail");
> > +	}
> 
> Let's drop braces for single line, as suggested [1] in coding-style.

I will change this in next revision.

By the way, Sashiko reported an issue [1]: min_region_sz is not
power-of-2.  While this do not cause any real issue in this test,
non-power-of-2's min_region_sz is not legal.  Should min_region_sz
initial value set to power-of-2 value (e.g., PAGE_SIZE) in the next
revision?

> 
> [1] https://docs.kernel.org/process/coding-style.html#placing-braces-and-spaces
> 

[1] https://lore.kernel.org/damon/20260919081239.8A3D91F000FF@smtp.kernel.org

Best regards,
Rui Yan
