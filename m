Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969B385D61
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358045; cv=none; b=X/mMlCQaG3zRwS/7zVmk/LcDK1jYCBQFu7Wm1L7UszcNXlEAXy6InG7MMm/PQx/yNTMRlD5mBLdD3MuaBnjLzPFA/j3eIYlDmeqtvPWCqO1iuGr/uLmWkb2tTfa2Y3EaD3ZfuIGgMmfDuuIxjgqi9uneSI/4+Irm/bsB52NRXOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358045; c=relaxed/simple;
	bh=5R+g6WWRD1369zOrd1lygc9HCLZxNdDMskBf5JTl1/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2eWvececWlZWq1bLCIbersmppSAuLE4s+0cmrroDu9X4dsEhajYFX08qsV+vzmJhMSs0VxVlfoI1grGe1BA+ihzVH79MEclRkcRHAcNrBVBMueWK+YPX59buGmaANhkO5sU2aaCFpKNE9FiwCG6dqRMhgeoG8Onmr9Tfo8KM90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9IhKZOC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9IhKZOC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1065307a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358043; x=1788962843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cu79MV34wPsRG2WV//Qk9X9lwsBT7aOPE1XdtKONwGs=;
        b=l9IhKZOCGwLyCeH94m648fhElozUQIT+loewkUsrzHoQELrcuHezU7LFMMVZ6exfPU
         Oe661OpKUuyVF7eqj6bdM552JjaagQ1VKKNwvKnrpsv4n1mNxEO3U4rsDT45KcfrAJJb
         qAvNfbVPrGtpeKfYL0OHdZZUChkFEK+wHGCJrQWOjUV/G9u9/ti8knjqMfc6WPxI24EB
         /d6BVXPsAncNvLl7NWhOBtVnqNhd9Hte60hTD4rVxvvxjb6ZIIMIaHh5ZDj+9hmXQQ2M
         H90eWRELm8pH23aQ9IGKc2JJGfnMn4XGIpKBo1ItKWKCZJIdS0IOss8tf562HA8JqRFW
         5XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358043; x=1788962843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cu79MV34wPsRG2WV//Qk9X9lwsBT7aOPE1XdtKONwGs=;
        b=SajSHUoR4oybDyJzJ+VjQWcyxNciyswibgnyNIHOxRcUSpAU62bBUxL4IYf9fBvcvU
         bbk87ReV1B0iHaWhtxnddhE824IQyz5g9Wm/2WXwLDZBuwPGbU7CMjhvilbFuBmxSM1f
         Ff6jzn8UFdH9mzX2jBowTFTaeqNvM1PPG3dyBN6fDhMzhTOYON8825tWAkFGugID+pKP
         Sj2tsihQTEpTueULmWNVUURKr5qrO7u7U8WQhDBWRU8+IHC/ftY6+jEdYLAFM+j0RjJu
         Ay/C6vIlQQFd6NwEDgu+hur7x70/fhKkZR6QTfdWQw9PJ5/bxx0+wfFD3AepSZ38fCXz
         H+QQ==
X-Forwarded-Encrypted: i=1; AKwUvBynyRDL+ViK6tSkwYs7UQBdl8TE10mnb4UIdlQfbilw/LRZqsfZEejyvEXa5/TvulWgDP1MFRlrsDwSepE=@vger.kernel.org
X-Gm-Message-State: AFuF++kWE957zmRGy6/opuoXJSoSb/kxSC43YHuCt15ym8ru2Y02Jmf7
	tu9zAt9rUHnS0Hn0H4Xe8fHAiH/K4TC00kHLkp8SVWrrM9Y7CKrOAmJd
X-Gm-Gg: AYBFou2TwykW0YzPTBCV1yYRXxw44MezjGJVxxuaOzvszULTODfpLdf1s6ul2VvdIt0
	sX00SYAD4EQrky2E7fUcU/ZpaVHWvdQD5ZufAQmu7LhtJ21CusbTH6mnGkLwIfYt53YxTpE22+a
	wwjPyx/bpzH0qBpq07R3YzXpAnq/LS7Im4KkO6B7CJOelsm5Irya80VpxhMFm9fi5FVHdbnwM0k
	seS91jXelBb5jAPESqrZ1ETQK4672cGJoj7tI8vfzCo3CbzbMfNadFqVzyert49jUGklrSEWHwQ
	Dkdt/eAS9Ac0fCLLQ7HdriesC1NkayThmarrQ5NbsKGpkr9t6kpU1uMyryPU3kXDTFVR7V6xC8P
	LM4TZi30EY/2xvz2aBu5sTt7GbFpbP+g62BgaR2yrIRaYg6ER54iL2YBQ49qur/9o+h54KgJ/nD
	LmEyIq3jm9vQ0tVaYn7TNW3D3EFbvHOWBvjF/gTX6yf9MyG4mHBHX8+E6afGA=
X-Received: by 2002:a17:90b:35c8:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39aedf43130mr7799632a91.10.1788358042526;
        Wed, 02 Sep 2026 07:07:22 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d7a9sm5579972a91.12.2026.09.02.07.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:07:22 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 05/12] mm/damon/sysfs: remove probes number validation
Date: Wed,  2 Sep 2026 22:07:13 +0800
Message-ID: <20260902140714.4023700-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902054747.99370-6-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue,  1 Sep 2026 22:47:38 -0700 SJ Park <sj@kernel.org> wrote:

> DAMON sysfs interface is disallowing >DAMON_MAX_PROBES nr_probes input,
> since DAMON_MAX_PROBES is the upper limit of probes per DAMON context.
> The core layer is validating the upper limit again, though.  It is
> preferred to let DAMON API callers such as sysfs interface to set
> parameters in flexible ways, and do parameters validation in the core
> layer.  Drop the duplicated validation in the sysfs interface.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
> index 7ec14f48d157a..b576e97cbfdb8 100644
> --- a/mm/damon/sysfs.c
> +++ b/mm/damon/sysfs.c
> @@ -1479,7 +1479,7 @@ static ssize_t nr_probes_store(struct kobject *kobj,
>  
>  	if (err)
>  		return err;
> -	if (nr < 0 || nr > DAMON_MAX_PROBES)
> +	if (nr < 0)

Hi SJ,

Thanks for the cleanup.

I was wondering whether DAMON_MAX_PROBES is purely a core invariant
or also an interface constraint.

With this change, sysfs allows nr_probes larger than
DAMON_MAX_PROBES and damon_sysfs_probes_add_dirs() will start creating
probe objects before the configuration is later rejected by
damon_valid_probe_params().

Since nr_probes directly controls the number of sysfs objects created,
do we still want to keep an early check here?

I agree that the core validation is required for non-sysfs callers,
but I am not sure whether this particular limit should be duplicated
at the sysfs layer.

Thanks,
Kunwu


>  		return -EINVAL;
>  
>  	probes = container_of(kobj, struct damon_sysfs_probes, kobj);
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
