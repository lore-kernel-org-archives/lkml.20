Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62464AB1C4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056433; cv=none; b=nYge8G9BMk6KhbKHjJtoeErnkXFr6IZ1kWqStaaMDnWEoIolyC9smyV6s5kEqGM895R3h7HhUmILL+teocfx8DgMWKKOJRPdTmGJTsE3Hzw7XNN6A/SylaHS5zDI5x075V3BLhR0AciHy77lxhZmKUeNhqisUOA9U+0slttsxz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056433; c=relaxed/simple;
	bh=ZAa8H43N9tNV0wev6/gCfq1RFPq29JfINhtmvCkDHUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Klj3tlhLpcFpDTuyIZnR/BQulIdFWXjvS7hu0BdWPuAGBK+0+kAegum0SLkLXrS7fY9M3Rh1V+Cn9tEW4DaZfI8ZSw+d/4qdMiTmbgjInYjx8LL/k1C+aeclFtoJYakJhcclEyQqKrDAz9Uy6TXuYym8LqOLht2XfkaSaCTpd2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D36TpPcS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D36TpPcS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so27185e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789056429; x=1789661229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dX7P2+0UXjBFLbwcIRVQxDJqxLq0XE6y5aklSGH0fI=;
        b=D36TpPcSqeQ/+oPFfr8OPGqkOYQPSWaqGqE/HGtybg1nEgxQO85KwI0FEl4FF713al
         lPnh+xKBF6mUc4z+N+cpZgr/q28HdQuGxUfyyJuEtS+OsNlZe1SwBMDu27xNrOP/0vZh
         yvNnWvmqP7dPsVVR6cY1lJHhjDs4XPXaTH4cMJNMGv/KZ7wD2vDxrgQEHYmndcSxcwZg
         CiLgyS5cEWFiqaoVlApo/rkmV6fZQ8LnsrD45RiHkqZUOPjtSvsRV4jtQbJ590KqQH0U
         KscNuwSNsMPcWWvVRaDA6AV91O7WC3boVqUBxF5+fkHLcSvnroxMmUphMvqbXufohurD
         skgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056429; x=1789661229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dX7P2+0UXjBFLbwcIRVQxDJqxLq0XE6y5aklSGH0fI=;
        b=NFlFA+rqNKt7zL5FCFsUka5K1bpX35ze2lDxMZCuoj3UKIRmL1ZtibqsNoUj+217Zw
         ezZoPkGiDb+e3Z3vK1eJJr/UsBb4XtEiyotLHKqcFHX+vOfySi9aooj5DV30nIoFAkkD
         mZWxCf0PxmyoGBnVWw7iqVWiA9RFKA5UY+qlLRv48EZVxpE2gfZsmBg5UOhygssIn0xp
         UMt1TpZJuEd7pUt0m0MOOZb9aBk3KUDRpguFmT+p99yFmDx+S4DgWCOJ59/jFnT+AbMC
         NlfmVQ3w1ndsfTH3GHqcsP9d5mxQlseBcIfzAREyxSRAfzpuabcpRPZU1PzWgbKYkAhL
         w/Uw==
X-Forwarded-Encrypted: i=1; AKwUvBw7r7oqhF0jn5TpeUWsxN+I2VlZTAe7qL4JSEwKdRXcU8uW+Xzyl6ibUmIBjtSUkrnZCEZKSYDsUdfwlu8=@vger.kernel.org
X-Gm-Message-State: AFuF++l+u+JXjuGMruYIuh8ZE/abeZr22U+cv1Fh1v5Tnms3P6RgadnY
	ytFIUpPVJzgU/jCuwpmRFiRSa47lVcvx3vf2Hza9A17VzcBnEgt1VeNs
X-Gm-Gg: AYBFou2LcVHazglH7w3IiHTeE81ayXCGBGKJ2GMVWWQ+VUsCYjEE/xuCQZZ98/XreJX
	K/FbfltzLGjKkpRA7wNqV2PKOw4Jf+QlLud1HoCfu7yWjUetUcl/LXWM7Kj3a3CnwoenUUxymCi
	03eSQGVuezjWzPXdJdPCuUwdc3UUI3Vsm6aqTXq2ZuHIR5jTYqczd0+a72K69brWeATUoVV7ne3
	qCzHzuyZpomsyaJhT2MWzOlor3L6FoxsjWgbD7Ze0dVm0msF8VXMGnCSyHMTidQDZY4SgmT24oN
	k+JJj1s4VmZeE4SHYXPn+bKOCZBCo862mxymNSvr8JcFjdqK3ITfJYECfGOmkCRR2G34Lt6KgxO
	O7lqr+UgPK429mdKsMaAqRVXNyUBbtaCnmaJdaJAtX5vw3WOlvEZFfGFDEf3z8HEpVu4jICX5bY
	1v2yeklUKZtLmLp2E514sCUgzjhjxBJDfuUshJWiRg4ayA4pcL+guP7klmlkZaX15zByYOLtEZS
	JERGtXCfthHxCgnXtdm
X-Received: by 2002:a05:600c:64c6:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49cfa20ccaemr391623755e9.25.1789056427375;
        Thu, 10 Sep 2026 09:07:07 -0700 (PDT)
Received: from [192.168.178.84] ([134.19.60.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm304986225e9.4.2026.09.10.09.07.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:07:06 -0700 (PDT)
Message-ID: <e0d0c87a-7502-48cf-9d64-f383edbbacb9@gmail.com>
Date: Thu, 10 Sep 2026 18:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: apply the swapout bulk_move fix to the intended
 condition
To: Vadim Nikitushkin <bub4z0r@gmail.com>, thomas.hellstrom@linux.intel.com
Cc: ray.huang@amd.com, matthew.auld@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, skainsworth@gmail.com, alexander.deucher@amd.com,
 bernardomagri21@gmail.com
References: <853fb020-592b-4f85-a9b5-a522aca6a29e@amd.com>
 <20260910143451.65853-1-bub4z0r@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20260910143451.65853-1-bub4z0r@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vadim,

On 9/10/26 16:34, Vadim Nikitushkin wrote:
> Commit 3db7d7d58341 ("drm/ttm: fix swapped-out resources never leaving
> their bulk_move range") landed in drm-misc-fixes with its one-line
> change applied to the wrong "if": the "if (ret)" after
> ttm_resource_try_charge() in ttm_bo_alloc_at_place() became
> "if (ret > 0)", while the "if (!ret)" after ttm_tt_swapout() in
> ttm_bo_swapout_cb() that the patch targeted was left untouched.
> 
> ttm_resource_try_charge() returns 0 or a negative error code, so with
> "ret > 0" a failed dmem cgroup charge no longer fails the allocation.
> Restore that check and apply the intended change: ttm_tt_swapout()
> returns the number of pages swapped out on success, so the bulk_move
> removal must run for ret > 0.
> 
> Fixes: 3db7d7d58341 ("drm/ttm: fix swapped-out resources never leaving their bulk_move range")
> Cc: stable@vger.kernel.org # v7.1+
> Signed-off-by: Vadim Nikitushkin <bub4z0r@gmail.com>
> ---
> Christian, the commit in drm-misc-fixes (3db7d7d58341) ended up with the
> change applied to the try_charge condition at line 532 instead of the
> swapout one at line 1434; the resulting tree still has "if (!ret)" in
> ttm_bo_swapout_cb(). This is a fix-up on top of 3db7d7d58341 since
> drm-misc-fixes does not rebase. Sorry for the noise.

Mea culpa.

AMDs mail servers convert incoming mail to a different encoding which prevents the patch from applying cleanly (yeah everybody knows how braindead that is).

Usually I pick up patches from patchwork now, but this time I though I could apply the one liner manually.

Well long story short that didn't worked the way it should.

I've just reviewed and pushed this patch to drm-misc-fixes as well.

Thanks a lot for helping out here.

Sorry,
Christian.

> 
>  drivers/gpu/drm/ttm/ttm_bo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index a12af5b..9b85b5f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -532,7 +532,7 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
>                 ret = ttm_resource_try_charge(bo, place, &alloc_state->charge_pool,
>                                               force_space ? &alloc_state->limit_pool
>                                                           : NULL);
> -               if (ret > 0) {
> +               if (ret) {
>                         /*
>                          * -EAGAIN means the charge failed, which we treat
>                          * like an allocation failure. Therefore, return an
> @@ -1434,7 +1434,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
> 
>         if (ttm_tt_is_populated(tt)) {
>                 ret = ttm_tt_swapout(bdev, tt, swapout_walk->gfp_flags);
> -               if (!ret) {
> +               if (ret > 0) {
>                         spin_lock(&bdev->lru_lock);
>                         ttm_resource_del_bulk_move_unevictable(bo->resource, bo);
>                         ttm_resource_move_to_lru_tail(bo->resource);
> --
> 2.53.0
> 

