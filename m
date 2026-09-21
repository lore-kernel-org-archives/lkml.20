Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462E43AE6F7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790028108; cv=pass; b=kulJefzqQr42B03wXrAxbDjAro2/xTe0irY9AM+cuoxVRb38qaHthaZQVBgL2qmE02bY2NyVroJWcC0fPlw97ZFkcTi9OGnS1gBObwYFobEG24K1E6M//1sCbZc6uin8N+PYXx5DTCXRc2mOQlf9gx8ZMeMr1UxvEy8/AQ0ZRT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790028108; c=relaxed/simple;
	bh=U/IwgPrpaHxi79QzKG2CWLERd7nUYg2eWaJtoYv4Wv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUYabYWPjEp1QPsl3nCANnCgXQ4XB43CqPy+eD0kZnZTC5eLyp3PlGQY8ZoDuNoxYQP4zCaReLJA1c5OtFzv7YRjcNcXeAzqG1MZ6l0+fe93uoaasXP6dIcZEomLMz+3P/km7rMlgKcd/Bfz6OkYiSXWY+IP/HRPIJ3gIJ9To/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c85lj3Lw; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c85lj3Lw"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39931869b4aso221128a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790028103; cv=none;
        d=google.com; s=arc-20260327;
        b=szN8YMeAS+V+vbCFKUU4NlnOkiB9CS7eP+zImzFQKm7PmRgDSrurGLPfdldZLw6qpL
         e/T0Ev552dIcYlJ1j/jQk/gNcsbJxLMY8Sjw/KrpqJV1zA35xFhFjw3N7n1YCDyMVBvQ
         opwvyxcamQg4NJbA0h6e3SVWqHmjCKQPtMsuDC1BWyKzl14DgXF++X8csuQpSw3KnCtl
         7eDDeyjxzkEJRYHroZQtvyZKo+qxDqFzcbCM8uO1pU5KI9fKg2e98lBwUbp2mEzTor8N
         JhRsVZyHRH7dKrjPkeOMvSqilgR2zmsdjdwNxdFZt/NF5JD+e/X+7khli4VS+D6a53kF
         hFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1J+saQss82xL8Ce5qI/Gv+3joKI+8Uu+v3gbZJZO9EQ=;
        fh=9FBTvhzehatkiCoha6Bz7qJQGDlCGmpiQKYvxZpS1ag=;
        b=qTjIPtmKScf1/1VX+psGsfI4yVBLs7H8rrF/lCsjo0HdUV3SJcdzuGh60Tu9jMOk7a
         RWl3tqwvzhdLtxJOl3llw08lkh0TEjRyRxcmY8FJEZLd3RRCH5hrc5qt23DHcGWbOOIO
         q0Avmc/RtgEcE2/0wPW71MINY6hJpBkFDEw5dPXpCgbMagbFTnE8sDt5ZWvF/DrEMmyC
         IqYdsw6EkZnfjgsGFLdTBtarfSkt4rQ5Dp4hGGXsuJE1vtpIfse3Z/0R7mBZke4WKg1v
         dGybqVpN8eKvC/GIi+Uj1gYFixkXozRzI0jMcr9qSMhyolNwSP2MoyvKGD5TfqPRXDns
         RB3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790028103; x=1790632903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1J+saQss82xL8Ce5qI/Gv+3joKI+8Uu+v3gbZJZO9EQ=;
        b=c85lj3Lwlpy6DWSDIg6jI2pKT4YFX/DyhNGDgwgfUCb+KE59K6olrjodsONX4Ocu0e
         EjUJUfP6Dg347oAeYCXmgPyx7eYzhjpik7cKSBNHEUfkfkaEJ7GiyqBslexWfbttaSnQ
         m54YW1q9ZqMwwGYc19VUXj1cEEmhfqc7vjqUVKgXoJaXjaZzA+4N01qcE0+hmLi5Msli
         YgU9atgqzIDpljF9xgg+4NhevIh93qyiTxdFTlQCKOWK7NuEEqUST0HgfczE+VTCuD1G
         JZy92xoOFgHprPjSSU+RBJZQcYGRRCynTBf84iA23pR7r2yhvTEn76VVWNOtlnG24SGQ
         OPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790028103; x=1790632903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1J+saQss82xL8Ce5qI/Gv+3joKI+8Uu+v3gbZJZO9EQ=;
        b=o3W8S7sj6+jfO7li2EoDnm+aV0eJKQlfEMMpLtSs6QNbzVzIYdmQAPLJz5/pAc5E65
         GaZDMmYEtaUnpRlG5fJhpXShr3gMomjC3jKXyR/SzF/iAya/zjrzrWblqfocqeJZlN7O
         aU9mXyv0Ix0XCq88Mx1tSDDnibRQa9epNKDaQ5uMVkCjhZs1FVnZescpLDHgGNEdRyOb
         PE6D3I3WsKW7okta8dKf5jdMdMZ+Eyb+Bj2Azy5tLkBSFGz4Yt4OHqVqHxAeRHswy4R6
         R7knSy4Ar7rNkn5GUQcsDom9ZRT7xATfefkfIvZUZNihJrDqWWmDEP81YTgAk/JsIfTw
         qvuw==
X-Forwarded-Encrypted: i=1; AKwUvBySgXWrn3pY4L/+8ZGAaqhozlasSDs+X8j70gQqF4P2NipfqA56gSexBG2YMNxkqaA8iw14AfHlVltBaBE=@vger.kernel.org
X-Gm-Message-State: AFuF++lRFM/eVTvz4WqbbhKvH6w5340xBKCvqCf67KXYYxdWcFPVuIQr
	UVzVdyfSYcDpkOXJjtTxHfgEtK5GoJeQjY/U4TdmrbcsyIMNz3qhJLD5CgRLnf1p5PMd/cnYcOO
	pAF43lkB8bvCfmdfkoUZkX4VVfmAJ3JM=
X-Gm-Gg: AYBFou2MQB+UhQpB3U0wTZEQ8V8KGv89Zzj3y7sJQXzZkamsFzNVYfPkPFniG9NUBfK
	70lfvla1wO2GXveBiYZOTIAsJes8mI2lc+n6e8tjh976kZHZfZLrcrU61vxGjZyEaTPDZJijpwX
	fkZpElTsL3UUdvBLY7ngyFnepORxeTk0170p0ei0/dhUkNB9X8S/wKndpyDDAyJueRkK6BZt/tk
	cp12GCD2yezH/vPyETOjbwjA+g9G/mahSn6/8Gps9rjKr6uRMIz4ENFp86hc05iih1hBeS3Lbeb
	lXeirq239RWLL0NVboxe3AtXgM1RoEi2YgpqMg+7roUjmguOA4JnW4AzAE2iEqWjKRT3m6J8zeQ
	nb7kDdfr8F9K4fvqAHnQn8JRxjZS+aNll4N0jSulFmw==
X-Received: by 2002:a17:90b:50cf:b0:39e:2f57:67c0 with SMTP id
 98e67ed59e1d1-39e591e3bd8mr22753640a91.0.1790028103022; Mon, 21 Sep 2026
 15:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921103318.353216-1-lgs201920130244@gmail.com>
In-Reply-To: <20260921103318.353216-1-lgs201920130244@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 21 Sep 2026 18:01:31 -0400
X-Gm-Features: AcwNN1WqVwSStsMay_gri4_rw5IDdLWdJymJyP5EtqkVYtYOv-9on_0dL0POVzk
Message-ID: <CADnq5_M39zRZW57prCham1JSmUEo1dZOaaannkAsTA=LeLz8Rg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix ACP MFD device leak on init failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ce Sun <cesun102@amd.com>, 
	Tao Zhou <tao.zhou1@amd.com>, Brady Norander <bradynorander@gmail.com>, Kees Cook <kees@kernel.org>, 
	Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Mon, Sep 21, 2026 at 6:51=E2=80=AFAM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> acp_hw_init() registers ACP child devices with mfd_add_devices() before
> attaching them to the ACP power domain and initializing the hardware.
>
> If attaching a child to the power domain fails, or if the ACP reset or
> clock enable operation times out, the failure path frees only the
> source cell, resource, and platform-data allocations. The child
> platform devices already registered by mfd_add_devices() remain
> registered and are never released.
>
> Remove the children from the power domain and unregister the MFD
> devices on failures that occur after mfd_add_devices() succeeds. Keep
> mfd_add_devices() failures on the existing cleanup path since the MFD
> core already rolls back partially registered children itself.
>
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>
> Fixes: 25030321ba28 ("drm/amd: add pm domain for ACP IP sub blocks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_acp.c
> index 9014678d75ab..be4d00ac96b3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
> @@ -318,7 +318,7 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_blo=
ck)
>                 r =3D device_for_each_child(adev->acp.parent, &adev->acp.=
acp_genpd->gpd,
>                                           acp_genpd_add_device);
>                 if (r)
> -                       goto failure;
> +                       goto failure_remove_mfd;
>                 break;
>         }
>         default:
> @@ -443,7 +443,7 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_blo=
ck)
>                 r =3D device_for_each_child(adev->acp.parent, &adev->acp.=
acp_genpd->gpd,
>                                           acp_genpd_add_device);
>                 if (r)
> -                       goto failure;
> +                       goto failure_remove_mfd;
>         }
>
>         /* Assert Soft reset of ACP */
> @@ -461,7 +461,7 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_blo=
ck)
>                 if (--count =3D=3D 0) {
>                         dev_err(&adev->pdev->dev, "Failed to reset ACP\n"=
);
>                         r =3D -ETIMEDOUT;
> -                       goto failure;
> +                       goto failure_remove_mfd;
>                 }
>                 udelay(100);
>         }
> @@ -479,7 +479,7 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_blo=
ck)
>                 if (--count =3D=3D 0) {
>                         dev_err(&adev->pdev->dev, "Failed to reset ACP\n"=
);
>                         r =3D -ETIMEDOUT;
> -                       goto failure;
> +                       goto failure_remove_mfd;
>                 }
>                 udelay(100);
>         }
> @@ -489,6 +489,11 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_bl=
ock)
>         cgs_write_register(adev->acp.cgs_device, mmACP_SOFT_RESET, val);
>         return 0;
>
> +failure_remove_mfd:
> +       device_for_each_child(adev->acp.parent, NULL,
> +                             acp_genpd_remove_device);
> +       mfd_remove_devices(adev->acp.parent);
> +
>  failure:
>         kfree(adev->acp.i2s_pdata);
>         kfree(adev->acp.acp_res);
> --
> 2.43.0
>
