Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794414125;
	b=zEUSjUyHhSddnRsG1MFjJGgfxX0KtLcor1a6ku5Whftj8kQF9nnqCneMwIc/bWk636rb
	 TsbSEGgv8bLQLHCzpfT/moQ2jDPByvg3/uwLEIPCm02oNKLRW+FPnvM8Sn21IWvE7bz4p
	 6wxcxEecXwK7ulmeOgOl0f35+CkUGeNSFl82yb2bvLBMPQgwO3yD2prwlDbQVBE8KOn3v
	 A1sYhvZAK8QzLt4egVvF2NtcCwZyHlusGum0ZYTfvEBnHWP6wMNvW25expnKqtoNzWA36
	 +NaPi+WqN18SLFs2CkGGKadDegeXR1Old0VDuNZgfZ//ipMkfuoikzvHl6ziTsmQ3dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VEmKr9XjWd6SJafMK/s6uXcGULEcqUlVNrdZViHwMeQ=;
	b=jfKK1IYZ1mIRcebbuw3XBzvBnPVWZ3Ui48MB/lNTmEvwHX+pbWK1GQkk5CB8SFemBEco
	 1hIYQjbBSsg2OAWTUn276MNqqx5a3qtIdN6zaUBCz49GF/HWW97wvLBaY4iSLV7sX9fMv
	 aUU/hrbSR89rDfXhEuXXPhpT/uIhFxomGT5+ZKfeQXy+QrRyXh5n1nAzA4OmLr15KA3UL
	 TuU9YK6EybQ0NDnzO4hOip3hu9A3sRSK5mNZ1tbLUppVHiNF2Q3coODuxed5w23esHsEK
	 ++bAT7l5fNHdXb0AYffbmPMu0IJt/QB9SasG/e3GDGhjqpIBVv2+o1yVGBfYKXlAVVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkyBy+vG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD72606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD72606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkyBy+vG
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99c36873ceaso28160241.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:22:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794414124; cv=none;
        d=google.com; s=arc-20260327;
        b=Rzbin9RNKkjtH28Rcdikwc1r633VVX/yvTSSvnRR5XFlPby4BxrstBzaNl8Pi1Kd/J
         jnZQP+/r+nYsiO8CHkGW3W6H2ldaoAmy41SB+pvYgFVo0tCjspZf/dAa+8fQVBv1nltD
         9Y3B6/u2Sdl1bP+TJt4ARlpDz1DTyIsxS/VrgKL/FVGtS7GF241oCNfppSUvHB2aEKnS
         dw4TQ03HT/f92/Ho78HjliFGm+uasfdXJnqe7ta4n2Lc24OQiqaHyJU+eU9rJF3xjk2X
         fz5K2vVagkD1aV6YmrC7evmPskF8i5AwiLfyu3USDRVAbQ+GIY5fTPXYLNTRm1+bD/GC
         x4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VEmKr9XjWd6SJafMK/s6uXcGULEcqUlVNrdZViHwMeQ=;
        fh=QyulsSO2r8mwstscFwZViq71SfPZTSgG7yLc54iQgug=;
        b=fFrlvzy/iVscxPirQXar35tc6FkCEJkrinCsoEfEIqODDeRC9U/qXO3CZT7XinZFbO
         VvW/M+IQ0d/3aYL6eagXVBTQMxVeMnUxdnVg3hyohXPyGaNBNRpbUTbQZW6OT9BAU9RL
         Ciq0P0ANSkHm7830WPcej7JDnzi8gsQ+gdvBRiiW8iobPPuEsmHDI4Mdh0G8elQScL0J
         dGm8fB8Mll4P9uvCRX90spppR7HETgKu23ET9rHk9iNxwDcILn+R/IDUgKEjJFYQs/iJ
         zvvIqT/EtWi7Ge8A0kNJSGjl0QvZu3fSVz1A/TVXN5z0bxhVfY3tmG1HiVT2A9ab7ixh
         ZTxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414124; x=1795018924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VEmKr9XjWd6SJafMK/s6uXcGULEcqUlVNrdZViHwMeQ=;
        b=SkyBy+vGX5o4amffhTUlYC4HGxUYNCdvfyUkC7/EDO0Uw65Q456ZgdaMQIe2lJywdR
         slecT6gBsRmq0irkzCUGyrgtoYEcjz7KuHVI5Yti3ZtYh32XFlFjAUfb+0C4LWkdXJBR
         HzihJb64+gqpBbPL9wY5PsnTMVAfplgGVBED1nWTnokV4xvipf83X8Ln6jwfx2bAVAk0
         HJmHU5XHb/VWR5bK/7OssviLzDVCH2WbySxzo8Erg1tn++ZRQKQLqYffgLpPqvVOHscL
         pbckFD4GvJtG67Wgzl1L2A/+ZAsdMXE1n2HcRVRuEfH1qz6Y44fZsLhDCZoehL3jYwMF
         EQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414124; x=1795018924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEmKr9XjWd6SJafMK/s6uXcGULEcqUlVNrdZViHwMeQ=;
        b=Q9Mnlq6wNryCBRJF6+tgd/a3XdWNlP0zxdYI0F+8j4oraaVwcK4JPzTnzIRPdzAGQ6
         8JP4+PRVn4gATH2tDOpWmnlaws0HIUQtHN3CdDUv/hx6CTu2nFQUDy+Wjgqn8SQXRjnQ
         MiBJO491uWP5hczps/+pY8dbAE3NGLTukt2bMUnzUW763r7Xvzc6oMvYnZd+Ezg5Y2AK
         IHQ7cCEP2mTxloApL5C04yDdpvN9yQ7RhAtz9VzKMd2mZ9AIC2mK8PRmafOv7T6DjpWs
         3hSd9NNk8188+MQzwsJRV9apAEm71vhVeNWlLw0mE1CdL/N58lb3TAKeb++4Emn9T+qQ
         vJBw==
X-Forwarded-Encrypted: i=1; AL+hErH5RD/A7ZPFTK+lbxUNjnGNAeGdIRMVrMr7Uw4lzIpuHAvGCg13MmMAYAUkhZ77VXNmWyE7KkU2DY/GIpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3LQZXvO/bllSHeLAJ8amTTvyk3uhHWdUgtT/jv5toNgtCSLhs
	tAmc429POdPA9DYg0CQAycnyo7Aqqx/+e4Pir5wXtnj557/gFc/KFKsV7NTTqno8mW/M6K0UGkh
	pWvO91UJkXt5tKbVTmRyCWGY5WWBMGBU=
X-Gm-Gg: AYBFou2o8U/nrYTdyvBlrtfKFSE0dPO+lkSvsYfrHjfUfjWI7oE5Pyph10DqPwHUuYf
	Spt00SrxLAqtv1PcbryCOS4U+fXT43YLgTDwFJKGhsTHA+U3tB91PNJ30rvkYTgdt+J9takV2KN
	WoomSD+aAEvUL2LMhtnW/QNi/a9SH/lhFnjJb7DnAip6BoDBwv0RkW+MzcI75bbttExRYFkY0Ep
	JFhU3SmmgNIBMWcsTQMWOPKIjxjYHU91mnntuB7fJtbF9e6LaDi3a2z8YVfIynDShYBfWOyLck8
	nB++D56rZFJbz2Fb1+5hXtQt9FelkRFCzG8OSJ7cwIsIDaPiMEKXlqUUnhqkg4UDe8th0yku4Dr
	qcgsflzHZGXN/2qrOosO4ixQhZ2BSvI9PyYn7L/gRRenS1luVxvbMr9+mT329mtA16AbbQc1w0H
	RncHYHeDuRON66auNVAIc76MlGMjdy8WVIXc78tyT8XqWE34vTsw1BYDAHWtM=
X-Received: by 2002:a05:6122:870d:b0:5ec:b681:f4ca with SMTP id
 71dfb90a1353d-5ee1c433357mr1222074e0c.4.1794414124275; Wed, 11 Nov 2026
 08:22:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104150632.33843-1-sinha.aryan03@gmail.com>
In-Reply-To: <20261104150632.33843-1-sinha.aryan03@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 11:21:51 -0500
X-Gm-Features: AclHuK_SVfsU1onLelID_Qe8h47UVP46ohV1eNk_tzZkaP2m6CnheQmaf2PAlsY
Message-ID: <CADnq5_N7zDDuE-S6Jyg7q706H3SW6WuM4eOTBcEU90boYJG=PA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: fix kernel-doc in amdgpu_ualink.c
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:11=E2=80=AFAM Aryan Sinha <sinha.aryan03@gmail.com=
> wrote:
>
> The two comments do not describe what follows them. The one above
> amdgpu_ualink_npa_vm_unmap_range() is missing the ualink prefix, and the =
other one for amdgpu_ualink_gart_npa_addr() sits above two defines instead =
of the function, so kernel-doc attaches it to the first defined one.
>
> hence, Move the defines up and fix the name.
> The description also had a stray blank line splitting it in two and said =
dst_accid_id where it meant dst_accel_id, so join & fix it back up.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202609241952.zFr1FYRB-lkp@intel.com/
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
for patch 1.  I'm skipping patch 2 because I find str_enable_disable()
harder to understand and just as long to write as the current code.

Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ualink.c
> index 6cd3927a7..f875209e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
> @@ -4631,7 +4631,7 @@ static int amdgpu_ualink_npa_vm_map_range(struct am=
dgpu_device *adev, struct amd
>  }
>
>  /**
> - * amdgpu_npa_vm_unmap_range - Unmap a range from the NPA VM
> + * amdgpu_ualink_npa_vm_unmap_range - Unmap a range from the NPA VM
>   * @adev: amdgpu device pointer
>   * @bo: buffer object backing the mapping
>   * @pte_flags: page table entry flags
> @@ -4727,6 +4727,9 @@ static u64 amdgpu_ualink_npa_addr(struct amdgpu_dev=
ice *adev, u32 type,
>         return npa;
>  }
>
> +#define AMDGPU_UALINK_GART_NPA_ADDR_GPUID_SHIFT                41
> +#define AMDGPU_UALINK_GART_NPA_ADDR_GPUID_MASK         GENMASK_ULL(50, 4=
1)
> +
>  /**
>   * amdgpu_ualink_gart_npa_addr - Get GART-mapped NPA address for ring bu=
ffer
>   * @adev: amdgpu device pointer
> @@ -4734,18 +4737,12 @@ static u64 amdgpu_ualink_npa_addr(struct amdgpu_d=
evice *adev, u32 type,
>   * @src_accel_id: Source accelerator ID
>   * @dst_accel_id: Destination accelerator ID
>   *
> - * Computes the NPA address suitable for GART mapping by adding dst_acci=
d_id to
> - * NPA address to access remote by SDMA.
> -
> - * clears the source GPU ID bits from the NPA address which is set for
> - * address-identification mode.
> + * Computes the NPA address suitable for GART mapping by adding dst_acce=
l_id to
> + * NPA address to access remote by SDMA. It also clears the source GPU I=
D bits
> + * from the NPA address which is set for address-identification mode.
>   *
>   * Return: NPA address adjusted for GART mapping
>   */
> -
> -#define AMDGPU_UALINK_GART_NPA_ADDR_GPUID_SHIFT                41
> -#define AMDGPU_UALINK_GART_NPA_ADDR_GPUID_MASK         GENMASK_ULL(50, 4=
1)
> -
>  static u64 amdgpu_ualink_gart_npa_addr(struct amdgpu_device *adev, u32 t=
ype,
>                                         u32 src_accel_id, u32 dst_accel_i=
d)
>  {
> --
> 2.46.0
>
