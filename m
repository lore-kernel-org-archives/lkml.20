Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295D57ED81
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970057; cv=pass; b=c2GLhZQsSdIzJNBq3CGVhGCCD+r/OknotABSfvAjKX05Bi3AFzqlwcZdNKAktB1aAgfTIbHvW7PLNW34gmH5/o5KMWXSU4H7MY55S9vxrxDjiHfWty04FckUgAVDRW60a0FvKyS/UMmA96rYMbQ5QkCsOz+0si3lP+CnUETobxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970057; c=relaxed/simple;
	bh=eqA+q71s9PnGpb5EF2JJ3CYoUeL5o0ABiNpshgAndJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTkY4Sb30J122e3xHHDX3w6Ab5jYB5H+y4MX+ehXIfIL6QQSr/542ufCoivMuEyb/qkAGm7ZCo/mhpyuaYh/LWs50zzszCu7NZSWhTfMmRtgwLl59LI+KuL96MidMC6rGwEhYtD0Zoliza+gMuTfSKtvgw2xiD3bzbK+DUw+IyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Da8Gx6mr; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da8Gx6mr"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c8ff1so2696875ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788970056; cv=none;
        d=google.com; s=arc-20260327;
        b=JsqLRurZgAzLH3NmkAXyPgRlB0ErSHQRe3i4nY3J/8AQorP5pvU4vx9tt2trZINsJL
         Neg6+MNO+fssJPut/nJ7GsKrVgadpEdcDyWLqDf6i11kKCe6Qlm4yQPbQzFSqIYx6SCz
         vs6JCnTqMAdzVxT3Ppk27iIwgAhGzkqWudRxoE4Zts/sXe204eyrRI4lUPSWmNwMrCBs
         VHy5Lyc7HzxHwmDeKKvpjzDUfAEOaLI5JXZ2Qekb8By2MJgtTdZgR6JVG2BdqnJ5xPEv
         sRWlCFUpTj/xsb+s1UqyzC8YE5pEiQ+BZr5FgjSWIWO3HD+HPDMfGvJeLbmi1UleLiNn
         8UQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jdoulqW/dybJZI4GeBlXySvh7R4n/US2mSH2P60zwMg=;
        fh=lr74ce1OOZGKQFF/9w5EBRqXfjNbtSMZ6obvHfihnNA=;
        b=fwiy8F7uCUFgDJYMkVQghT6j8DHBHKOJt3BPI4KVrKjeigMN8eQDJrya4YXsPOV6YQ
         byrcdz+B4h833u7Ch8cdy/T+frKZhT63x24mH95NDA2Q1XzS/9CyAHtjficGHmvgcDNd
         InThdpN53Sd5yovp0jDUzhIJbziS3X6mZzg7eUmzt42eRWV5UYoeA4ZtkWTBx5n88hC0
         rykBwT0z/+OJ0lKD1q8XCT5JgLTPyqX1d4ZwTHoDNwT/pyJStBS2toQlFlRgWA6rWXrB
         JBI79wfQOd7s1+bKLSfw/6ABiZHUcbb1tk7JK3L/dQdQZa8rPJ2V1RA8vpmxDms0EO3h
         YWoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788970056; x=1789574856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jdoulqW/dybJZI4GeBlXySvh7R4n/US2mSH2P60zwMg=;
        b=Da8Gx6mrcbTqoT7imqfPZQZ8Ie8SXUtWst4DJpBVYvZvrFSd2MNTHLDBuDxPxGG2b5
         /yyA9zw+udFjvRbZPRPqF7UO+uOB4AtjhjcwVIkznpMFNXxU3JzXvrI58rLDvk48bkQr
         HbOpJPqQO3kpVVjgI/2X9lrPyavG3rS3kvuFUQh+U0W1G7M6ytLocJk9uNQoW2Do4Bhn
         ZdfBGxjwsXnGSZpCdeTHKlQwAwT6dscBDJ2MuKCpUlxIok93CWMmNjhSTBV09+xEqbrZ
         rzLO5SQssrWWcGmdSr51kL4Qwlzv3T5iWC6gPRLChd9Lh+QcevI7rxsXC2KZkQ0fQAc/
         B0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970056; x=1789574856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdoulqW/dybJZI4GeBlXySvh7R4n/US2mSH2P60zwMg=;
        b=R1ht80kydDzD4ddN7vcK5z7ZosvnQL4/5R5efuDGHYfz4fGewtZXBlvgjKScnQUPab
         NciqV6Nr++hKHYQ8Ym3c/Af538WdW9vEB5WVdOYf764Mxxl30pBuK6ZvEI/mpLo/QzHs
         YqIZfMoeK98ul7DeLDvQWjMMcljwt2ZagWOxxONk1zU6Oi/IKjiPXagltweKifDOgH15
         BHGNFPwWvvsufvh4VvBCYkF1KkOq4uplcGYqUNNzAxTGTxFeMOQwAsFXblmnkGtmcIzA
         C+OSZG+lkouCrAbIc2eH/+kPukwq2TQjxFgLAMK3uJzADJ1hva2mTfA39wIf/myTj2tz
         Bs/A==
X-Forwarded-Encrypted: i=1; AKwUvBwh7IZZWfEQJfiDHRoqff1lgWHdxryFQhFR8j8G7jeMPQAr/UrW9dNVOPm/bvaXmypUwG05lYxlRYyt0H8=@vger.kernel.org
X-Gm-Message-State: AFuF++k3/fKshuiyc/llxmjD0VHJY7YLP8WJawoBGVHcwtHj4V+bucj7
	vaFV7kIqzscYRTXQkvWdGs5cyJLYo5WobTjWpHEQG93h3H62/3RQmeAovw1kjh8Tej6Zmz2xzMJ
	lYScYVpAolJDxT62ysE43RvTdVypE382hLA==
X-Gm-Gg: AYBFou0EcbKycVc5jyf9G65zQ4L0+RF3DjedERxlsYF743JsfhsVlipYi7lImOMVPeo
	z89o8aR165SfFZ6sk25Txead0Au4OUagkKuB4asArNH1H2OUSQ/A8DSQlP4vfS26oZKWlbKyPHx
	yBXRzqQL5H6tOsILzH2pIFipuMwpg6EqpPJ2yJ4rr4jsa1mP/6hDYviGxwO7djmEX6XTd8rtqx4
	ZfJ1Vcij9/dJPrJjRjDFfNBhUVxHJwFHhBLDx0s2OrSZbPtyVmOEtBEnGxzHKyjCx+YF8NnYwnG
	6K2SKvzalbDgW6nXP6guAparfWqwtm53kEhQC8XmigCO0zFIUyUOR6QEt41IV84SeV63TYzXI9i
	kvENoWJ2bf0TCvtGK4CDNu7xMTvjO1n2V0XiQVhE1Cg==
X-Received: by 2002:a17:90b:3bcf:b0:396:d27c:8696 with SMTP id
 98e67ed59e1d1-39b2693597emr36809891a91.4.1788970055249; Wed, 09 Sep 2026
 09:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909093728.642473-1-yijiangshan@kylinos.cn>
In-Reply-To: <20260909093728.642473-1-yijiangshan@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Sep 2026 12:07:23 -0400
X-Gm-Features: AcwNN1Wg-EmmRELnPbnQlQ9xJ4UlYGkSyIL0bUzk_gGw4JWn23xrtxMYlOmL-yk
Message-ID: <CADnq5_PPJHOpgVo-+r-g6X1Z3r2wRJPkE-Dkp2gpt12Q5EGUvg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove redundant NULL check in amdgpu_cs_vm_handling
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, tvrtko.ursulin@igalia.com, sunil.khatri@amd.com, 
	vitaly.prosyak@amd.com, pierre-eric.pelloux-prayer@amd.com, 
	moonafterrain@outlook.com, candice.li@amd.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	13667453960@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Wed, Sep 9, 2026 at 9:05=E2=80=AFAM Jiangshan Yi <yijiangshan@kylinos.cn=
> wrote:
>
> bo_va is assigned from fpriv->csa_va, which is already verified to be
> non-NULL by the surrounding if statement. The inner NULL check can
> therefore never trigger and is dead code, so remove it.
>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 03b41f803520..c978f042ae1f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1146,8 +1146,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_p=
arser *p)
>
>         if (fpriv->csa_va) {
>                 bo_va =3D fpriv->csa_va;
> -               if (!bo_va)
> -                       return -ENOMEM;
>                 r =3D amdgpu_vm_bo_update(adev, bo_va, false);
>                 if (r)
>                         return r;
> --
> 2.25.1
>
