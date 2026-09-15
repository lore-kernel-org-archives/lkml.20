Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3484078D1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789443067; cv=none; b=tMkiQaWqflKnBDoamCCRjUs8Ny+5UvCAtDY7FilmIFLjBmJBpYnnqVPMzzLSZtJbqhxdu7NlWHBEi8VpjYl3ozek/6jxYufKPNCNNOq2nuhLSQ+x9oC5hB6r6CJkrAs01AgCLptRbspj/RgxaXyDx6GihDUBliyVORkF9OmQHYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789443067; c=relaxed/simple;
	bh=s+LsBuhIlfs/w0lJnlNuOPSGSL6VueLtw5zs57ipXSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7PWRtNWKAzkFiQ1ASxY+yVMZA6imPkahWoX/wpCIyVN8YcFKR58r4g49yqgmlk2QhdN9n1aOqViBsSmR6L8K/fCXxgv7UhMeU7uTdZpISqrUQe4gY/Z2Ze6irWHVPV2jp15lIfegXe5modhlDIwMJYYwy0l3ElDVyXIDkXEh6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXzv7R3Q; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXzv7R3Q"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so2062816a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789443059; x=1790047859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7nWcLz8pfZOPdgnq2ek5GovUDuRsqxFmdnwCI+6u6U=;
        b=FXzv7R3Qg7NQzViOeUapHToz8WDa3tpYZN21PQdHLFcaNsU+9litBh8p1+EYAaGvE1
         rS9Q6N8ZSq35kV0PzmyWRA2khovmAId6w8i8HLvxQtJxWDkJ3J5JgU9snmRIkC2zA0wT
         3OXgabPmQKBMo45S+RXO0h9kFDLjMkW61pfxLtNqW2xAzw3Qny7n/fWoD4TTMeVBunms
         f6Gz0XEYAaYZJx/2hd0+qpmXPuUX8rWf6OEAzY6Q806VRwb915n78yH/RvHyLmffOojd
         Ov6v48IocUCqgafKhGGcEUJJwLMO0raMlRFGVyKhwWKpGi0jQFB2eQ4Qun+XWSljcOK3
         N7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789443059; x=1790047859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7nWcLz8pfZOPdgnq2ek5GovUDuRsqxFmdnwCI+6u6U=;
        b=xxSPXA9nPOT4KTPvVx9iPPqvfLEYeygQSZ03tpUqB2RQgyDm/NfOS1eJJFdIP2mr+w
         lnfZpDYH9IBLEJFnfC0CBckk5FkNIPEs1k+96n/oo2uBvM/Lz8jBlLLDke9S2aW1TNv7
         kLJOLb5CNrYJ3pNt417OUFGMQ5nKLkKNkGkai0yf8lEdiIbizcwB9igCJzbVn3HHO0iK
         gNUic+WSFgNZ0SsfUevcuz7rSku3A9dw5u6i/AxCV5wxaRVzE2BeApajkE4/w7JSZsXt
         R47sJox1rlDeBuyLo8AUJOcuz6i2GctP4LDQcZp7HIGxThiW9sfBoJLIHQqDwmarGrS0
         7d/Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9wNQLNvaqbin1yQrbDMG1Tyl/3eFRnXZRSsCkZxdWAgcNV4tgvfQLM2cfIvZvtab037NJX73johVdm80=@vger.kernel.org
X-Gm-Message-State: AFuF++nqy5Hmvph8uOvZ6dwS+SAfAPLAS4gfugjnyBK0oqqQl5pcptcr
	axY8XEjnRAwkra/aMnNAIGY5m6UoKFEHSrX8h0eLcQLQi2zcSXRoAyGE
X-Gm-Gg: AYBFou2VsoK9t7UUMGwSEj1JVEw2VmB/9BEt3Pux14LbIy/aA1z8EFi33v8k9MjrWJV
	7s4lK9iCg+H5qGy8zMyAol6WcGgKeVGU4ZbFDrryt1LSSn9OKdbU8z0K6Lm5me1U/zLdvVrAO9C
	Gn1DW9h6Mbrz8o7R5HIr9CEHtsKovnSNjMSBg/5vuuEWWb0NE+U8+ojKFuLNOUPAMqwHhDIDcmm
	xFQJVL+Y+dNghEah6/FdyYnrmt72zcqTVVPFUljRbiJp0IMvF3PQajvJ+hzBDHCVCmaL1Cgictv
	3FXOI9pydjktTggkwhjjTBwUhIXYSok2oA5TXnLx7MaiRzyODqco+bIfgomG67kRxh1WcXkY4l5
	7U+YfU7bKF6913JkR7UJFp5wxVLGyckQNPjLhmuDHpF4shGcsqcEv4cY9bvI8LKO2ZhuHhx5v5k
	mZW1qZC7FGXFngxNBQNNI+ZxVcee6E/R8YFdp2TGA4gcLpTc2H+vUISLuqgvCKt6UJYDKs1g==
X-Received: by 2002:a17:90a:e7cc:b0:39d:fe64:5725 with SMTP id 98e67ed59e1d1-39dfe6461f0mr4210211a91.5.1789443058917;
        Mon, 14 Sep 2026 20:30:58 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm31317478eec.24.2026.09.14.20.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:30:58 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 3/8] mm/damon/core: return an error from damos_commit_filter_arg()
Date: Tue, 15 Sep 2026 11:30:49 +0800
Message-ID: <20260915033050.1579457-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913171706.103052-4-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 10:17:00 -0700 SJ Park <sj@kernel.org> wrote:

> damos_commit_filter_arg() is supposed to always succeed.  It may not in
> future, for example, if the given filter is invalid.  Prepare the case
> by modifying its signature to return an error when it failed.  Also pipe
> the return value to its callers and let them handle the error.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/core.c | 41 ++++++++++++++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index 3d7a973ea8b6f..ea7d8d5a4abf6 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -1317,7 +1317,7 @@ static struct damos_filter *damos_nth_ops_filter(int n, struct damos *s)
>  	return NULL;
>  }
>  
> -static void damos_commit_filter_arg(
> +static int damos_commit_filter_arg(
>  		struct damos_filter *dst, struct damos_filter *src)
>  {
>  	switch (dst->type) {
> @@ -1340,28 +1340,32 @@ static void damos_commit_filter_arg(
>  	default:
>  		break;
>  	}
> +	return 0;
>  }
>  
> -static void damos_commit_filter(
> +static int damos_commit_filter(
>  		struct damos_filter *dst, struct damos_filter *src)
>  {
>  	dst->type = src->type;
>  	dst->matching = src->matching;
>  	dst->allow = src->allow;
> -	damos_commit_filter_arg(dst, src);
> +	return damos_commit_filter_arg(dst, src);
>  }
>  
>  static int damos_commit_core_filters(struct damos *dst, struct damos *src)
>  {
>  	struct damos_filter *dst_filter, *next, *src_filter, *new_filter;
> -	int i = 0, j = 0;
> +	int i = 0, j = 0, err;
>  
>  	damos_for_each_core_filter_safe(dst_filter, next, dst) {
>  		src_filter = damos_nth_core_filter(i++, src);
> -		if (src_filter)
> -			damos_commit_filter(dst_filter, src_filter);
> -		else
> +		if (src_filter) {
> +			err = damos_commit_filter(dst_filter, src_filter);
> +			if (err)
> +				return err;
> +		} else {
>  			damos_destroy_filter(dst_filter);
> +		}
>  	}
>  
>  	damos_for_each_core_filter_safe(src_filter, next, src) {
> @@ -1373,7 +1377,11 @@ static int damos_commit_core_filters(struct damos *dst, struct damos *src)
>  				src_filter->allow);
>  		if (!new_filter)
>  			return -ENOMEM;
> -		damos_commit_filter_arg(new_filter, src_filter);
> +		err = damos_commit_filter_arg(new_filter, src_filter);
> +		if (err) {
> +			damos_destroy_filter(new_filter);
> +			return err;
> +		}
>  		damos_add_filter(dst, new_filter);
>  	}
>  	return 0;
> @@ -1382,14 +1390,17 @@ static int damos_commit_core_filters(struct damos *dst, struct damos *src)
>  static int damos_commit_ops_filters(struct damos *dst, struct damos *src)
>  {
>  	struct damos_filter *dst_filter, *next, *src_filter, *new_filter;
> -	int i = 0, j = 0;
> +	int i = 0, j = 0, err;
>  
>  	damos_for_each_ops_filter_safe(dst_filter, next, dst) {
>  		src_filter = damos_nth_ops_filter(i++, src);
> -		if (src_filter)
> -			damos_commit_filter(dst_filter, src_filter);
> -		else
> +		if (src_filter) {
> +			err = damos_commit_filter(dst_filter, src_filter);
> +			if (err)
> +				return err;
> +		} else {
>  			damos_destroy_filter(dst_filter);
> +		}
>  	}
>  
>  	damos_for_each_ops_filter_safe(src_filter, next, src) {
> @@ -1401,7 +1412,11 @@ static int damos_commit_ops_filters(struct damos *dst, struct damos *src)
>  				src_filter->allow);
>  		if (!new_filter)
>  			return -ENOMEM;
> -		damos_commit_filter_arg(new_filter, src_filter);
> +		err = damos_commit_filter_arg(new_filter, src_filter);
> +		if (err) {
> +			damos_destroy_filter(new_filter);
> +			return err;
> +		}

I re-checked this version, and the error return from
damos_commit_filter_arg() is now handled at all call sites,
including the new-filter paths.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

I'll take another look at the remaining patches.

Thanks,
Kunwu


>  		damos_add_filter(dst, new_filter);
>  	}
>  	return 0;
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
