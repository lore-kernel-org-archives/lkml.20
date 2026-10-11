Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996823B5DE9
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727444; cv=none; b=qi72HctENsc7iHqxRE6r85E8Hgiyrdx8GMavF3Wvd64QI+qZqoPId4qtDtWDN3AIVfkPv7/olRIt/HC/S9d7QPRfGIddISGAolMmqOvkPY3Z6kP1ULmuJ6P8yyU0ZcbeDieL7pvnGgZ6LPiYcviWXDxM1NpjbRwfPXbJxanl5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727444; c=relaxed/simple;
	bh=vwitLrWDUbd+rcaMBijrdyXKEFGLB1mS3G7PEfvfIxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4Q5OXCjE2oO2dOxDkdKGSWkRSTgjpighEK9/hn54UixZsDMnxRq3cLFuBhHrKKgdaLWlh3Nv7ZKfT4QRen2EH7zwxG9fHqN6nmVnWBl4mZOO7aEX8in/D46Dz/45mMmVuy9wh5kJknQR1Oj9Mr+MLbdjNue6NePZBzCLfcWvcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4W4xec9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4W4xec9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624801F008A1
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791727443;
	bh=86pWPhLv9adWOQ1oVMYMQWf73TNhvR4D25U83YvJRXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q4W4xec9m/VHOuiG3KnYHd2gtbv11XoCyhIIjdFiPQ3wyinY9CbDqE5SmCdVMSqcE
	 TXT6m/13swQ+bs5M/5+S5/Z1DMFAHcJE3OOyVqmi8Y60tI8scQUm95FvyUH4PWKJun
	 +U+87pw3NoMFk1g4pyNPHYAHexQI9vZtKEeQGplYF7cjld7f/K4gS7apga9g6Sv4Rh
	 4fSYJ8p13RhIxpguIjscDcDkfM1mlBf5OiDfqVvyWMl+r/RBZTpbbnCzRzH07dNmpE
	 QNbK6PP6tQg3o8EaAxIVGWZjC7dsVzzVPs4SQOqaFQmKy5jKXgEFRWQfLYsliTxvti
	 02u+IM/Tambmw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6afb0d2a586so1990675a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:04:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByq3mtcLGTeCvC5gDRv6XdqU5Ou0dtUe0ZCsnHbbXP4FZA3OlRdVfYLynx4VyWdRlOF9HPlTeMcBUAIXb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYnGmLd+uxlHfLKtXCtaBRPwTFR0sMpRtXgl9ZZ+KhU9jsTGYB
	vq1KiEqZNUVgwUICZdMu1SKRhhNAt8SoRNbERl0t8bqRMNsb2R5oKFRI82IP8YSzchGf0krsXAp
	OebKQpw50tc4QbghHSqoqaIAY4wSUmIQ=
X-Received: by 2002:a05:6402:304a:10b0:6b1:b5b8:b696 with SMTP id
 4fb4d7f45d1cf-6b1b5b8b911mr909603a12.23.1791727441955; Sun, 11 Oct 2026
 07:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003093415.e64386de1e64-1-archwse@gmail.com>
In-Reply-To: <20261003093415.e64386de1e64-1-archwse@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 11 Oct 2026 22:03:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5bHA_MZGsA7=udMTiM57wqG-nQMbak+afeq3+CvVcBcA@mail.gmail.com>
X-Gm-Features: AclHuK__mYheWRSoDKQ5OBLHeWz1vxxNsOg4UblzjX9eWNRSrtJhbuLE3srtb7Y
Message-ID: <CAAhV-H5bHA_MZGsA7=udMTiM57wqG-nQMbak+afeq3+CvVcBcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/loongson: Fix double free on BO initialization failure
To: Evanshenf <archwse@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Jianmin Lv <lvjianmin@loongson.cn>, 
	Qianhai Wu <wuqianhai@loongson.cn>, Mingcong Bai <jeffbai@aosc.io>, Xi Ruoyao <xry111@xry111.site>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Sui Jingfeng <suijingfeng@loongson.cn>, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 5:35=E2=80=AFPM Evanshenf <archwse@gmail.com> wrote:
>
> If ttm_bo_init_validate() fails, it drops the buffer object's reference
> and cleans it up through the supplied destroy callback. lsdc_bo_destroy()
> releases the GEM object and frees the enclosing lsdc_bo, so freeing it
> again in lsdc_bo_create() causes a double free on a synchronous failure
> path.
>
> Let TTM own the cleanup after initialization has started and return the
> error directly. Keep the explicit free on drm_gem_object_init() failure,
> which occurs before ownership is passed to TTM.
>
> Tested on LS7A2000 by making drm_vma_offset_add() return -ENOSPC for one
> selected dumb-buffer creation. The error reached userspace, the destroy
> callback ran once, and no handle was published or tracked BO retained.
> Normal buffer creation, zeroing, mapping, readback and release passed.
>
> AI assistance was used for the ownership analysis, fix, fault-injection
> tools, build and test execution.
>
> Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller=
")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> Signed-off-by: Evanshenf <archwse@gmail.com>
> ---
>  drivers/gpu/drm/loongson/lsdc_ttm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongs=
on/lsdc_ttm.c
> index d7441d9..88536e2 100644
> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> @@ -475,10 +475,8 @@ struct lsdc_bo *lsdc_bo_create(struct drm_device *dd=
ev,
>
>         ret =3D ttm_bo_init_validate(bdev, tbo, bo_type, &lbo->placement,=
 0,
>                                    false, sg, resv, lsdc_bo_destroy);
> -       if (ret) {
> -               kfree(lbo);
> +       if (ret)
>                 return ERR_PTR(ret);
> -       }
>
>         return lbo;
>  }
>
> base-commit: bca45af5998a05f34b13a2ef11e639bac9c62643
> --
> 2.43.0
>
