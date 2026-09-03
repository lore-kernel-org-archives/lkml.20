Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A732A3DA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404681; cv=none; b=Sc3p3crKO9657THC8AvLWiCnyfKXSJb6OA/gE4Luo0Ot/i8dw2XBuo6Dmeh1QcbUoMgCHSgOF0JygvwP9QQSxTJfkYtYBxgPrVBMky7FSLQ0c0X2ldZOGtF9WWbTwwdN7H0AM3rwpIIEMnKJuH2Y8fwm5yIL1kJiu6z9lFbR7Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404681; c=relaxed/simple;
	bh=jZiWYHItaHZXLwaaS6GizSmKCrgqOiwgtX+q1aMZoz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSzZgl1nzAYbiFHo7RmR6HLKfnG+W3HBXmG+XK2jNUOkPEaW81WifouBQDRPew7FwLTEru2klaTejxj172I9H9w3j4qfWz/J28zVlM6MznSAjp59v+mECT64+V38c6gXl7A2w3QHXQkaVEhL11mHbUfzzz8ZsCQQcyq3TWXDcrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKpftsFp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKpftsFp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce98cb8165so6628295ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404680; x=1789009480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ5VZbOzOAiIg21alHu3P1D5kKDO/4ea9+shULiGmrs=;
        b=hKpftsFpGZ7SIGCko8LqaAWKV/v2qY/j2EWFzVy0KBQ5a1Ur+YHcjFe4doHk0pRm6c
         GCOdNdRgAYWm93W+y0t2TMz/M3X7MiNYN8plL2Zw5m0Uvd5pWn7b7utP7uXNvbEE+Ps9
         WF3cw1vdaOrIReRdD5sIjI/DUE78HCATsMReoIuzfBvPbozs2HyEfkDTPGLeAvFaRST2
         r7oGCbBMmGsMsHMM6a67LAgh50xfRX3og7FXm3rN9iil7lE+RkoFNesgTblJ2TArEZNH
         VgaKL7mYMTd24IXqxSfJ6uwtu/lHrOS93NcYsGSs0BWbimuSHxKtceKLJLGSMcuxtjFK
         lE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404680; x=1789009480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZ5VZbOzOAiIg21alHu3P1D5kKDO/4ea9+shULiGmrs=;
        b=khH8cBZfD0un+jEDj/4WrxTvaw9wtSrBtrm4uR/kSMs+AI62pvX/JT4w9Tqmznk99z
         zphdbYh1RdwDtZY68VP+fPAQ13FvaALENyQ8mHHbI40xh56gZ9QcUZqMwgKxa52tPjsg
         e7+koynH4rIXZdpE0F9uHp3kx7Tne9yh00kY5vokLhTq+8hYnlw/tOMIwKC0jtHlQt4w
         dU2e3J9eIgvoKGzlD4Lwon/VBEFAg6CYe5JHYI0SEfxMjsqiXjpsXdXKW+DFfRHNfU+2
         0nlR60BTYDtmWpQgOYB49BzwNhz8hHF7GZ26bBXZT0Yzt+b0qfr0TnAZfaPdF8cG6glP
         q1fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfYhvBVE8s91iTwkQrCZoJrk0W+U5DgAWv9ZIuh2WGSsV76lJRsY+4Owzd7LQxpUbcr11Wg4v9VdC/PGA=@vger.kernel.org
X-Gm-Message-State: AFuF++kP+DOK2KvnvUgujDcFHi8vp0M2T+S6qfYdG2UPFoqsX5qaAaoA
	nuZ3SeSaoFvtgYis+lRItIBMX11Qf1F5ZxT0dhgFCKaNM6k7BOne48Zxu/6M/aR3
X-Gm-Gg: AYBFou1vjuvOsb6XqwmjZABnsCDWhvfl4FIKzeyqObxPjjkLsDhVBT3MyGz68ZPmOSq
	/ow3mnTgkjtCoJQ7Pj17ghLfPVhdTKOYPWeOkFoh23YlFp0k/MSkhHRiVq9phFUT7w1Tiomh97Z
	JApUDn3aNtROAZOVvLuHv+Uw9+RirQLxpceXjOnZATsJIE3TcWQI9HW7+ggHojhmB5N2XbndK62
	QH4q8BNm1AFYcnnH4M2oSVsEalsoOphqfldJYnPjPOEGOxVZEM2TOtyianVapUYc1osgJ6UY5Wu
	DhGwMaMH4a/sO5+J11KFYpF3AFFhaomSaLRdmTjie9BtyQxkdJgY4g2DJ5DgnUWdPtM0VmotNDa
	ZVU64t55ALY3dYC8gRWx2TLSAobhdkdir+wcRnFCwmW2OC+mvWb6TBikc+++TOCdQ2vtEK1p+oT
	wdCaUd0cRUzb7dsFFdvCrB97Zeh6my3xhWEAe9azQoe8eZoyTuWuMl9ZYKDKnF+I+pKyBTDA==
X-Received: by 2002:a17:902:f545:b0:2d6:dcf3:b754 with SMTP id d9443c01a7336-2db020c9d24mr8716085ad.7.1788404679175;
        Wed, 02 Sep 2026 20:04:39 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafec286d7sm2793645ad.51.2026.09.02.20.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:04:37 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH 08/12] mm/damon/tests/core-kunit: test overlapping ranges for set_regions()
Date: Thu,  3 Sep 2026 11:04:27 +0800
Message-ID: <20260903030429.309611-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-9-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:41 -0700 SJ Park <sj@kernel.org> wrote:

> Commit 954157679ec3 ("mm/damon/core: disallow overlapping input ranges
> for damon_set_regions()") disallowed passing overlapping input ranges to
> damon_set_regions().  Add a kunit test case for the overlapping input.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/tests/core-kunit.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> index 3cbbbcbfbef8f..a4164ac489a61 100644
> --- a/mm/damon/tests/core-kunit.h
> +++ b/mm/damon/tests/core-kunit.h
> @@ -612,6 +612,17 @@ static void damon_test_set_regions(struct kunit *test)
>  			{.start = 42, .end = 21},
>  			}, 1, 1,
>  			(struct damon_addr_range[]){}, 0, -EINVAL);
> +	/*
> +	 * Regions resulting in same region after alignment should return
> +	 * -EINVAL.
> +	 */
> +	damon_test_set_regions_for(test,
> +			(struct damon_addr_range[]){}, 0,
> +			(struct damon_addr_range[]){
> +			{.start = 10, .end = 20},
> +			{.start = 20, .end = 30},
> +			}, 2, 4096,
> +			(struct damon_addr_range[]){}, 0, -EINVAL);
>  }
>  
>  static void damon_test_update_monitoring_result(struct kunit *test)
> -- 
> 2.47.3
> 

Hi SJ,

I reviewed patches 6-8. The test helper extension and the added
error cases look correct to me, including the overlap case after
range alignment.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu


Sent using hkml (https://github.com/sjp38/hackermail)
