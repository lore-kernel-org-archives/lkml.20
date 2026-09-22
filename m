Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853D85187FB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083829; cv=pass; b=IAawIFZqjCnv9sd/o1nOqcxmhS5WZ/ergHoZapLPlsvivDgUw9nX3BBJXXVTf7wD4CJ4arzVSGGp7JmIqpdZV4s7q9v6km4HIuRrssCvxUpaixeserURZKd+DxvE8XzesdVFz5EP+xZ4Y1GW/ZtEhx9jT7X2yQBB8pKnbsnehf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083829; c=relaxed/simple;
	bh=oNy4d+0RbzyXHnfwSqTP5xFpr7l4hEiK8yz8jYP6AOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBHnYRx5ImmKg/z4WZjwSSRf60IG0jM28Rp8y2Yj9N55tDBf1HitU+x2dG2LJH577EoyoKpEm+uY6Qi4qIzLOWIykwzSh+I6ftD+RwX65dxSkjIquTCuOrxqcxJ1Vkny+Yqe0F0NCP92YIazPNJxeAF7gUvAozDe+xchwjbPgnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHtuILGO; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHtuILGO"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39e6298aa19so575760a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790083828; cv=none;
        d=google.com; s=arc-20260327;
        b=gUjIbJFyivO3bnDIgpPXKHOPhTETo78J6wAgpAOWnLjToq9cHkagcYfQIOJXbDYxDm
         jozmIDz4yq7AGrmSI/FwStXpdcI0PtBuqRZkgPXewRyQZpeA+sYQKtJXXN5sJvVxeuJL
         P7FtYyVt1XgUStL8BqNqNpaHZIgBISIcERheuJqFaxfdq/Pfh+As1PKmYeSvEVOq7sVB
         AFafyUvFl5sS9v5X2XiadPaU/hO9myhENDPeisDMqIahu4lgoHUXrCz8KpqV5OB4odlJ
         eAtmPnDgjbGuWj3QRSfyVVUNa+IKEZrNm+5Hlo5C9f9fpFiTGmRorpqgQxGzYkMSbkTt
         PQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/wA0KBR683Rxf67wOoQaReSR/BOf+zjptaqpc+T3kfE=;
        fh=rKnstNki2gNlNVX1G7WnqX0GkG06PFtc/q8xK3hHoTA=;
        b=Z3xUpGXdiltUwdr+ZAF6Qw2pACnqtpjlWgyPDsLpam8m2NKFYQlmzOROODgkYaMB5t
         0JRNUq2amv9s0hJ5UWXIgXKs541JUrIY3urC9r0W7ToxYCB/yLxPYlkGDMhCHy3DBbQF
         Ow/qZh4F4Y5HVOwpbzW+AMgK55zGGVizlOkE5o/F/nOif0B+B+utoHo04Hy9lqNNLsc8
         oi1EIFWI1ipZpqYEDcaYPRqyJckLRR2TEHBzqOTqB0lqLkASN10NdHqeY0F2K8eh4Re2
         UuF6d87FU3fLbbJ/t5iD/kc30njFqXnDf7v35LOw05vFMxaZHjDMHekcLksoqAXTxYiN
         qZkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083828; x=1790688628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/wA0KBR683Rxf67wOoQaReSR/BOf+zjptaqpc+T3kfE=;
        b=eHtuILGOersW4lnWnLffxVgTr7mLbJ3j5fQls5ip7Tkn/yaqMLujWG4BQ8vcqBM5rp
         iFlk4YzihsD7CwnFQivhTtUNlwFUSYzAK0bh9dPq3lJkPMhnxIaPq8Kj6LJfkL/+Lkis
         UvRt+mUt5C2E0pJ4i8xBnnMMr8A7lYU+/13Pw40rdpWX1BKMV8x0BlXpjUvrjRsfGwBi
         42X/I7zY0XFAXcIM3H3IUuDMYZy5yKz6C7qTSv+RMgbztGjHmUsyU8L+pbeJZ/eAgPnC
         KPWtsKlf6vsnt6v5n0lsWRAEEpEAc3IgvE6JXhsUnh4Nget7GnHrz9x7BKtcPGUUH044
         auDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083828; x=1790688628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wA0KBR683Rxf67wOoQaReSR/BOf+zjptaqpc+T3kfE=;
        b=WeIVtK+ki8SuLEqRHRtLTjvP1Y61Mlf9kWTuGOZCQWNlS7bvYRXmMFgY6OpGrtWSQx
         Nh+1V/uYvsWCWX7qIyDJCy5xS/S/GRRzKBD7TagoaSBnX8qsAs2LpsCQKdEx/arcxHVl
         67bRR6upUOo3QvWMmWaiqdPusqeeLUpEPGh8MtfMHUopPwh+fqPanCNtK9nh3vDlgxXn
         TiZwYrm7jiWxm9x52p9uRqejLo6XG/YR/cke8Zq4K6z61/44hWSyIf5HBiK+bAvTEbjl
         22rk/IA1WGZeHIsYrhReB3hZXdZZGlHgJ4nxnJ0+ISYMKBrxd6sj8ZcvdfSKIvtlR4SD
         EOkA==
X-Forwarded-Encrypted: i=1; AKwUvBw/8ZC6fFTRHQDN4y20mCKxSdPfi8CQeD1UlCXqT9a5Xqc3uWTup2kD/xOK7GXHVyGsCyRq5FyZ7a9FfMU=@vger.kernel.org
X-Gm-Message-State: AFuF++k7cZqzTkcBce6f94JvFfuGrqLzf663467+c8F4m+Prp7iAWc2C
	AsUtZAuUL1CfeNBa4+CsoN9tuWzBkRJOb9SAQDQLg3I6GhvaG9bK/jsvKFGhK8lVeUm/hzN0eSz
	SCwtlQe3zhAGjNtihpgv3Tb0WW0krTTk=
X-Gm-Gg: AYBFou29YA0NekCk0lSFXgfVLs1eCOmdClZ2VSM0Zvq9+eMGW2JNfFC2M3IqQ65cVRs
	9m0IxLT6WzkOeJQB7Tt1CGXjV0bE4se5+a2JAIxCbzDkDte9qFO2c4nW+C4wxMdpr3cLtDX31GI
	L1rq3/h+rayDLQBDumzxOszxRupnQwsiaavVU7RVAkY/B6eQXxIp6MehK1ETZNY/7rDyrOUoJ9n
	xAYP6KEOtiVT42YocW+hnspuK9mo/gmdh/+IhBgbrY9TE1QiyCQpvGFgiT9dpbmV7jnTvkA/u2D
	mTO8kDMPsHex+s3Phn9nYElyOX3xdKnVvTeGBqIoR3v/vUg68znxbRI1xZ4rFBtPDxTFO8TDNo/
	UP1f2SOkmm5rAuFneLa1jPARYQQwsPawwY18I2batiDQ2tBuKnAru
X-Received: by 2002:a17:90b:2f90:b0:39e:2f57:67c8 with SMTP id
 98e67ed59e1d1-3a07333690cmr2055086a91.4.1790083827685; Tue, 22 Sep 2026
 06:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922015411.116292-1-williandossantosdeoliveira287@gmail.com>
In-Reply-To: <20260922015411.116292-1-williandossantosdeoliveira287@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Sep 2026 09:30:16 -0400
X-Gm-Features: AcwNN1Vh3Py1nkVejJCuQAOkulIvl34lmizTsCKnEe3GX6RsIUZUqrjredfWcos
Message-ID: <CADnq5_ObCd1rXewb4YXEZVTF4R_ZM5Vib_Rnr21sAbpNTfnqoQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx6: fix firmware leak on teardown
To: Willian Oliveira <williandossantosdeoliveira287@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	=?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	Mario Limonciello <superm1@kernel.org>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Mon, Sep 21, 2026 at 10:01=E2=80=AFPM Willian Oliveira
<williandossantosdeoliveira287@gmail.com> wrote:
>
> The firmware requested in gfx_v6_0_init_microcode() is not released
> when the GFX block is torn down, leaking the firmware resources.
>
> Add gfx_v6_0_free_microcode() and call it from gfx_v6_0_sw_fini()
> to release the PFP, ME, CE and RLC firmware.
>
> Signed-off-by: Willian Oliveira <williandossantosdeoliveira287@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v6_0.c
> index 95e939363db6..a5553d181d97 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
> @@ -322,6 +322,14 @@ static const u32 verde_rlc_save_restore_register_lis=
t[] =3D
>         0x00000000
>  };
>
> +static void gfx_v6_0_free_microcode(struct amdgpu_device *adev)
> +{
> +       amdgpu_ucode_release(&adev->gfx.pfp_fw);
> +       amdgpu_ucode_release(&adev->gfx.me_fw);
> +       amdgpu_ucode_release(&adev->gfx.ce_fw);
> +       amdgpu_ucode_release(&adev->gfx.rlc_fw);
> +}
> +
>  static int gfx_v6_0_init_microcode(struct amdgpu_device *adev)
>  {
>         const char *chip_name;
> @@ -3254,6 +3262,7 @@ static int gfx_v6_0_sw_fini(struct amdgpu_ip_block =
*ip_block)
>                 amdgpu_ring_fini(&adev->gfx.compute_ring[i]);
>
>         amdgpu_gfx_rlc_fini(adev);
> +       gfx_v6_0_free_microcode(adev);
>
>         return 0;
>  }
> --
> 2.47.3
>
