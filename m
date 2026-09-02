Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2B3EFFC3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339731; cv=none; b=WTzMbihul72T+xdb59mpaA1UqzxtUi+vvWMqcME39waEXEZBff8UX6phwescVRmGUV7N7vWxKisVyxFD8v0VnSbUrlxbC3VGrNfBJR8KAV2wNm3LFTxiHVqUW9EJOx/EIHrOGHmYM7lJMJc6rEaIqyk6h0VHsOppTBy4yBM1EbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339731; c=relaxed/simple;
	bh=LE1FGay9sT7mvcDPSk+q0IW+U2idHpKGbrIWVgYjQao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9SQgikUOTQBMjMDVwW555F3pqZHDg2tf8gYn4HkReGl9VaAjAM7k42VBdwrwTeM6XqPKGUgoNVu/sATI54Nz8aDqJrrHBhfk7DKyOyKeVAl19b9ufRmooQA14xCqjat+WzztTXD1uMotPvI82/XdXdzwtJV22zCDap9iziqKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkJyrxRa; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkJyrxRa"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-853c947bfefso765781b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788339729; x=1788944529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fy8D77TbbTZZuJ5DhR2JoC+KqjSKdSPnzBcIAoctkic=;
        b=jkJyrxRa+3fXokTj3tIcKafUOb1XAbk0nHOEmSiJwF4zw6TEXteEs6O+sm22jRGZv3
         NK2yRRSwY7peKCarFp6GRs1Tv9qCFZtY1s4ShfL3dhVXctL42UPGq0/oNX6Z86vaaI9o
         /OxzRTcQTuMyPonZwLogHOA7/gpojovVjUB83NrBP2axB0OXIu4EyNIAcYZ11MOQNDN/
         pFfXHuFV0MUP1U8Sb83cwKDu+lxhX6jCzftZNxsjzam1cGfk66jpPMCZSzzV+BRu06hq
         bYWEW2WMfBe4mMt/idcieM8LPS+GFCd0uOhtJmb2zNjov3wr/QzslcjP6hdg31p8Nq9K
         EakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339729; x=1788944529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fy8D77TbbTZZuJ5DhR2JoC+KqjSKdSPnzBcIAoctkic=;
        b=rqtr68QCds91O0f74A2c+i2j8apgU1E6l18JVd3XeK9+m5GgUrYp1oeN7d0p7zVJuK
         lBQqQGjeQVDMLZYkqDx4LuNzk0vZAmSsgGqBUuLth10voaetB2snPgrUhaH1PJ2p6G3W
         g71L22/zpnUet/g1GTibkksj4pBhg1ZYvGSbIqYiEfQlWC7obYsu/qrHYD7VpL9MGpxL
         kHGLLcxuDBSeDragYag+m5yHjfLN7rvFyZjYL9RebuKTXEjAyunPHu6GgA0mvvzNLMYM
         rzm16L7UQSADMMUYPhpJa3vyAWLp+1cWhPBuNeA5DANku4mVNMWROawNVUdwY59Mqpmj
         K/2w==
X-Forwarded-Encrypted: i=1; AKwUvBx7bOTnLThIlMVf3yKtz6dQ6YFW9v0ckx1Blkymvr2e+aPeFMJhZXKwAw4RkhVzMJr0rbqnfy8hkxGQX54=@vger.kernel.org
X-Gm-Message-State: AFuF++n8DCtW690l4Gabu6fdRKQ535VIlm8MxMBbU1Cig27sdefI04w1
	CL9hwZh1Kzb9PgsP+LEm768hVsJjZUcdOWc18/pCPK0DlnlYxjvFjiXs
X-Gm-Gg: AYBFou2hCo8Ctsp/25KwgDT1JVbgLgOpWFGchz+d9iL4++Be1A2HVlB0ik99J+TDHI9
	DrEfcWV5eCcSSewgsZoacE5lh7w3g2JbgrQjkINq+4y59ZT9mMu90c/SbplJwveW9IjwiiyF5bG
	SyQGVm+cA5YWR29XLpWgqIVhS9VAmVkVMJRqzZSmve7wr9dIxOo12Iwaey/EeRDtp7yFhoinhWs
	MyfeIpuS/LudhW2WO607zgITMoqAAl7qNEBQb58Rsy88gta/aQ460QGIOwSDqeUZj+MTeGaHpB1
	SKg/9gWG0tyLBxpMS6jQuy4vwoty7zEkjQJkkYvi693f0/EB8RSTDkcepqj4UomlROG6svVDZF/
	+1b9SCEBgueHyrTL1K0eQkJqHKk7MRaJyf4mL9y8g8LwLzK+fJ2gsI2zNdtH6TTL/lVMXzcRUvD
	zpXSgyT0w4gzVFCUIwb19KRJRv/SLRdrQJkq3O6LjLswy3mM6RjLQeqNbr5ahGJxM6IU+CWEXDo
	tJQdtE4ejlPpKDzAQ==
X-Received: by 2002:a05:6a00:7099:b0:848:48d0:934 with SMTP id d2e1a72fcca58-85f448cdd36mr1124512b3a.18.1788339728703;
        Wed, 02 Sep 2026 02:02:08 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db23f7b8bsm1038728b3a.2.2026.09.02.02.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:02:08 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: aethernet65535@gmail.com
Cc: akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	sj@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] mm/damon/core: fix false positive in
Date: Wed,  2 Sep 2026 17:02:17 +0800
Message-ID: <20260902090217.29968-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902081825.18931-1-aethernet65535@gmail.com>
References: <20260902081825.18931-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 02 Sep 2026 16:18:25 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:

> When setting goal_tuner to 'temporal', if the goal is achieved,
> quota->esz_bp will be set to zero.  In this case, damos_quota_is_full()
> will always return true, even if no regions have been tried to apply at
> all.  This causes qt_exceeds to increase unexpectedly.
> 
> Fix it by:
> 
> - Returning false in damos_quota_is_full() when quota->charged_sz is
>   zero.
> - Adding an early exit in damon_do_apply_schemes() for schemes with zero
>   esz.
> 
> Fixes: c7ec7d5f6b3d ("mm/damon/core: handle <min_region_sz remaining quota as empty")
> Cc: <stable@vger.kernel.org> # v7.2.x
> Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
> ---
> 
> Changes from v1:
> - v1: https://lore.kernel.org/damon/20260901105925.106186-1-aethernet65535@gmail.com
> - Changed the check in damos_quota_is_full() from '!quota->esz' to
>   '!quota->charged_sz', because the former is an upper bound, while the
>   latter represents the actual quota usage.
> - Added an early exit in damon_do_apply_schemes() to prevent a scheme
>   with zero esz from being evaluated by damos_quota_is_full().
> - Changed patch title, original title: always return false when esz is
>   zero
> 
> ---
>  mm/damon/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index 8e3ded1a2cf6..de78ad56c8b3 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -2560,6 +2560,8 @@ static bool damos_quota_is_full(struct damos_quota *quota,
>  {
>  	if (!damos_quota_is_set(quota))
>  		return false;
> +	if (!quota->charged_sz)
> +		return false;
>  	if (quota->charged_sz >= quota->esz)
>  		return true;
>  	/*
> @@ -2666,6 +2668,9 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
>  		if (!s->wmarks.activated)
>  			continue;
>  
> +		if (!quota->esz)
> +			continue;
> +
>  		/* Check the quota */
>  		if (damos_quota_is_full(quota, c->min_region_sz))
>  			continue;
> -- 
> 2.55.0
> 
> 

Please ignore this patch.  The title was truncated, so I've reposted it.
If Sashiko provides a report in this thread that differs from the
reposted version, I'll forward it as well.

Best regards,
Rui Yan
