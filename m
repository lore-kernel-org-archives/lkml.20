Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABBA43553D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424412; cv=none; b=lMD2Xq5prJfXcvNOfTGhzSe105qVwp8MJpO20ShgVg9HrXbSl5x+lcPZT9ecn4uLszRaV6owZT+8EAd8adD+hXTAXakKOrSIERntkTLiNhxvMRvwGlhZNDi9J4uupf3tUYaL8iKa2Zt2UrHmcVy9e47won8KoV83LKvO8T6J0JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424412; c=relaxed/simple;
	bh=D6LEF5qrYz6DbFwcjMxDSZY/iZagbFXt2muTMD4vUes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNQYNrSOH8s16jFduPQ+lkHU40APEAzQHiUM/qlBL2lxxZ3CS2RhZaiSxm2SG7zTbezjlrM4b8n4/5AVnL+ylYjESIZMR9gnExRmH6R4qxy824WRzWLePvz5Hyz2RE4oceRYlxBAtjKNrQZ7jpKf5jJ60ozA6jmjf0xi5/wzpZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5t8ubOs; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5t8ubOs"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca80d708489so583428a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424410; x=1789029210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OociqrsBmV/E6a5jpk0qDALr4bKhrSE+A8mgKI0tJ1g=;
        b=M5t8ubOsX6jeEy4gU7oPAUeJVi7f+V9euo3pYU7IgkCvU7XTCjpajBwqPZ2Jn3/p5/
         7Fvr3lMNi1sR+VRMwI9vwKYtCsmXQOgcBrpjdB2cxRRd20Yo2fkMsyqCzRkAy8nvw0Pd
         SdDnNaZEiK/udGXTBvlmqzx1AjSI5WkFnjAPA3A9RkW0/MMb0srbLnV3oSmqeq7N6gbg
         3yj8vZ+RkjOR8UUlEjc23eWAO00IiS1WJbPiYnULvFB/Onjm9H3Uur9ksXqku1sRq4ix
         vQoAxmy9qQvxbMbAb7kjHJ1nWCzLuqNLyx+GHT/z/TyvBcryFaNByA0HAFzUjKKHVXHF
         EoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424410; x=1789029210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OociqrsBmV/E6a5jpk0qDALr4bKhrSE+A8mgKI0tJ1g=;
        b=SrpBfglq/NjYqQf39CaCuiaK0JqY1JQJuRXW06yEbuyMQJO6/tlfQx92ciFb904ViL
         9xych8kkY+N+9uBmK0U/UtUTnL+po5NjKydA/g1sbjkFtwJUBzI1lSabqRN59aW+pgjE
         LmOF3sNGhafw5KRHa7zipfgn+UU7XK9AAILM7oEbvjyrpk4wDqU/Kjq8/O4NwRlQ0JZN
         nDzRkNofix1ktEsfrBuRF045JjQ7dsbR8oQIvi+401VXg6VeaG74lCaMFWpLt7CfQKMi
         Ij0lY5cIhX96NF+LcJey+86sjL8CnkXd2Tc70e8yAKsXe0yjjIRT8VGQk5kx2dnK04IA
         KiWw==
X-Forwarded-Encrypted: i=1; AKwUvBz3v0wLQ8BwTNozxYc2M14PJk+dxLfGDL6I4xIrfZrl025cqApmjzHJtY4lK9gJAqyzxL/UOazg7ivhhgY=@vger.kernel.org
X-Gm-Message-State: AFuF++lBstkdB+wPklzi7f/YOPzAS9Mxi1UTn0OqKHoTpYblb03UuJVJ
	6G546FIrGPcUj7G5dQyvQM13Kmoio0KQkrV/FKt3Lw8QHJJyjAGLsjWB
X-Gm-Gg: AYBFou1tNPcxUE1DKuKVUzPYwgIDg5fybSDb2yDfB6R1Z6jyDP3lrOMOfvfhG2dVwmp
	DRCntTZ8gE0AY44wF8cwTRruCBAwripMxdPz54/2jRPVes4eAf1kffIWlExYuVwyIfzYeRSkYWK
	O2Cy667wMnNpY9qWNEzL5X6F24Y2PvTaiKAm5vpyRQmXkFgVQJ6q4qibc22/bxBjY+2CFBu/fDU
	H/ZXXls16xX7IrlrFd98A53Kckn9PbkMuN9736j67IFGUP4D9m3WkMezgSaP/M1x3vzsChQ079D
	EJTWLNJSYS2DwPYpuMAL9D/eiAzofVqWDx0Wp1gJp/VqVKUzxUCWjLjx4lo0h4qDS0E4Pu9ZJ7h
	98+Sf32DJdYNOW6ySqb1hvh2FeDtSNZ5M1M5/FlT1r1JeqjcyKuCQ3iP+UfJ+Og67yiBMicUwT5
	x0+xwWCPkgD6u+4uOlmjdG/7qLnqLpNiBjZ13LhDdLqdo9YfFwA3FGhxf0a6myBvAJI5MOA9A0
X-Received: by 2002:a17:90b:3cc3:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-39b132d819emr1843780a91.14.1788424410133;
        Thu, 03 Sep 2026 01:33:30 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm4001175a91.1.2026.09.03.01.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:33:29 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	stable@vger.kernel.org,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 1/4] mm/damon/tests/core-kunit: test committing psi goal to psi goal
Date: Thu,  3 Sep 2026 16:33:18 +0800
Message-ID: <20260903083319.451754-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902002725.108635-2-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 17:27:20 -0700 SJ Park <sj@kernel.org> wrote:

> damon_test_commit_quota_goal_for() is set to test committing a new psi
> goal on an existing psi goal.  However, damon_test_commit_quota_goal()
> is mistakenly not covering the test case.  Add the test case.
> 
> Fixes: 99f89debafc5 ("mm/damon/tests/core-kunit: add damos_commit_quota_goal() test")
> Cc: <stable@vger.kernel.org> # 6.19.x
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/tests/core-kunit.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index 7071ec277b007..f1e11548c771b 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -793,6 +793,13 @@ static void damos_test_commit_quota_goal(struct kunit *test)
>  		.last_psi_total = 456,
>  	};
>  
> +	damos_test_commit_quota_goal_for(test, &dst,
> +			&(struct damos_quota_goal) {
> +			.metric = DAMOS_QUOTA_SOME_MEM_PSI_US,
> +			.target_value = 234,
> +			.current_value = 345,
> +			.last_psi_total = 567,
> +			});
>  	damos_test_commit_quota_goal_for(test, &dst,
>  			&(struct damos_quota_goal){
>  			.metric = DAMOS_QUOTA_USER_INPUT,
> -- 
> 2.47.3
> 

Thanks SJ. The added case correctly exercises the PSI -> PSI commit 
path before the existing tests change the destination metric.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu


Sent using hkml (https://github.com/sjp38/hackermail)
