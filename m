Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793635523;
	b=X2bFYFfBuI4VXnpE3x/24hEe3rU9u6tfptauOkDKNrZJR/gD61KMk8IhGnb8CI8BARbB
	 TMXrrge2VhLAOvF/GGjGUNq7VedYH/iJhDM47i7nf97wTYkhnR37VtyaVnru5aIRQ7W1K
	 UwB5NuEkKzdM8Gi1gxrgkUUp+Fj01CUfIdFrFA8+fsX30FDMNEnVFjb4MvqckXHWmWWKx
	 nl1WuiQOKAj77SqOw/+YGvIyOTaA8qJ9ygFv4HNAuk6E/2L2d6ow+cEYIzdgZwyS0kgrR
	 3GX1ya7wlEIx53DZtA244Cmdyqn4FGz8Lo4yZGclEAAcC1VfUWp0mURQMKYbsTMrbXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=qM2dyLxIJxVzLOT8NAS4jU2rvWxXsjk/TSdQCq7DDTQ=;
	b=gZKymPIU50BD+L9gUNVBUuQCX6xroeyR3XhkohGX/zTroeM+cgOI0f7ECbtrgYvY4xqO
	 VvdooVPCwopKQwGXLGjbOmbO9x93UcyghRImFwaBQ4W7x1pP4kThD7mzht4YlJiCrwF2R
	 GK68IXLYgUiQET/IivP5TxWkCNIGiZ0gnTZprIq7wGIr3nGZsuaIf5SCFdtNg2S7xAFWU
	 AUJREU1v/PfqvYNWQpy/WQjt+s84SM7u3nxQjJw90Uc7c1WrbyE64loyv60VpM46jX/5C
	 e8Rtp2Sp+JurTrnXePFt/wl5kqI+dkfGah7DKhQvUrpZ8bNmLqVQyjbgPobvJiz9t4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9Wh539n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6D60703B9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A6D60703B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9Wh539n
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ac926f28c9so217258c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793635522; cv=none;
        d=google.com; s=arc-20260327;
        b=LpUMKO+jSj1qy0Q5fW/gz4deqqawoUcY1szTTaB97tu3RKy+VZLG3Y0NMYAblElRbb
         IkCHyLLUCxxPovbYvHl37J1LguhtKaDsAn6EDxn8hnM84m34i1zugvf8cIBrZPyyrlcE
         bifgtRO315/pn2zroaMIsW8FOzKl9IyMkdxJ7wPUCWbfMZCm21O84oUCEij1+8We2iBQ
         pRV/RFwEwKmHX3286PtGIUbudZpfUCpVoaqj3fgxvdb3+/kIpyvjqz4G7uPwWzylGGu/
         OuJRCkEwEYICN0Wd/X+BtIp8mc38lOT8GOcjQ4G/fwPycNbPE+BnTDhf5CYZq6KiC5hw
         c6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qM2dyLxIJxVzLOT8NAS4jU2rvWxXsjk/TSdQCq7DDTQ=;
        fh=QyxmhxjO6OxZFh38VKl5cvAdwprmQxHUvgsxzRbcZaM=;
        b=dKIsAZKaPtDv91EqN/q8OPbQaaH0nQK3OUzSbH19vmBWV+L6CZFN2B9WAO2ucVJfL/
         RvNcSrEvLKBWhG4nzZJieKm0g8XC412WN95AuO63otutAMGeocggSJJ1zwlY+4rHZpiq
         28Ch1sDwIrgvnF+umPFT6y/lzbTPejHh6gNu9vvuSo6S8303BbSDdXAipTXIKRUWPpBx
         DqKmRJY/fRmMOEJps2N0tWG+lHiX20a+D6nblmkpj/javFhtLMoQJ/Pn9Qi6WOPJoBfk
         2tRG828V2CbaLUdTsUlMsYl1DljcDu9kZ24fYKgQ+j9OPo9y1MuEcH4tQhkp6vKgN481
         soFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793635522; x=1794240322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qM2dyLxIJxVzLOT8NAS4jU2rvWxXsjk/TSdQCq7DDTQ=;
        b=i9Wh539nCLSEySGjHHSfkoZe/l8gubvOvSH/8IH1F92/tKOcJmKcaMZAvZ2I0j+uBa
         P5G0Nk3IiXocDnZDK5rZPsNOkl+Xjoty7ukYiDRz5op31ODXZh8g8g7OOG5CRIe4G+IY
         eTpa2q6htUNckdKvXeAR1QYuX8w8vbNuHtOVzF7UOcPB6+4vik5xMgOzQPionGb/8E1l
         eTQbBBzWJ4mJdq3oSl2BDZWQ5UPLG7zATc3cea6lcpkMMzpLtjOjcxQvTNHHY3rqiL11
         C+mdjI/3l/FfU9NYx19EaanUVFNtZQltg+9MSqTxdkm1F1auJgUkxjFAEgaEU/urMIUY
         4B3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635522; x=1794240322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qM2dyLxIJxVzLOT8NAS4jU2rvWxXsjk/TSdQCq7DDTQ=;
        b=h63fMw5eMoQ9Ch+gB6S0momAJmpHgOsvF+ilzy8q63iFp9g1aK71TO0p9ccYk7v7cH
         jQylQQOxgT4Llq8IIAIkR1JueUrqUQ2ksDBAzN7f/WT3y92VstImrdWgdmxX/04PljyW
         H9ftJE4tUQLjH6lVKhJB8t32E/N7IhuYihcWOPxdp62KK35t584wibA/CPDTV+lKWOJL
         0C3sR2fM7wTOfWOU1aUhDogLYAHk0McVdqRnNDq2yqoHnjFRaov5LBwhOKMVzxFj6SyV
         qeMQ50AXan2h7AyRGArZN+1xs0K+V7FmwY57s8o1v3VuYhuhMuineautgzMg187e0XkY
         RR1A==
X-Gm-Message-State: AFq9FYIZg1Mb/bF6GlZy1sc/+5VIp/oxp8KimanPKF4dC1zKr0KYCX7E
	bFeeXP3CiR9UA+Eyqk0Ox1IEHLmEjviCti4Nxv7/tpa+ovPsBbpiJDP/oYN5IQayMqU0DTDV2hN
	UItKZ7mXo6kfgNreYtNI4lYqDwxUlTms=
X-Gm-Gg: AYBFou0o49wJSYn3sMPg6BvCHp0FWfVeeYdjNAZwaARkImU6hg7SKnVJXq6YaoEeQS3
	zrg9FyqwIufHM0SxWy3z56sLppxziHRWGMH6EjBOykEy8bQf0Grf5jhrM13YFZUQysNFSzsZhTL
	em+iJt54YRqVcJWiKknx00+zyQacIAQKsx6pTntDERFT7qVEP96SIKVexnHTkErZOXgSy+P52qu
	pn0mFLKMRwseiW28TDUfdPP8x3B+fMoBz4EGYTl1pnVtqasDT+pQwGPdbnQbh0fajcGzM3Pxj/t
	pQ+TXnNaczVaJJG8hBQ2J3Yumw9A7zakZoPeSZA/rc3b5l2oQJpFQoKWM5vRaHvctVvniN9gGTw
	+DDVzSR4dg51Clc9GIfG+LJMraWcPBNq5XlUmoKZb2jqsbSO+fpwxot4XqdAxnJIDD06FHmrPlg
	zZ5WHqW4PJuhJIKPxX9bI60X8=
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id
 a92af1059eb24-1ac5b7dcb2bmr26252824c88.2.1793635520495; Mon, 02 Nov 2026
 08:05:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>
In-Reply-To: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2026 11:05:08 -0500
X-Gm-Features: AclHuK_T_9wl2_ge7HTrGL9Ufakev4qpuajb3TNVntCGEszFix2ZV1_vjQMYFjg
Message-ID: <CADnq5_NuQEvx8OpyPOuXgtzQB67jgaNtwW85X70UraOLaF=M=A@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/amd/display: Allocate DCN32/1 dmub memory to GTT"
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alex Hung <alex.hung@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	Aurabindo Pillai <aurabindo.pillai@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>, 
	George Zhang <george.zhang@amd.com>, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied.  Thanks!

Alex

On Tue, Oct 27, 2026 at 4:36=E2=80=AFPM Calvin Owens <calvin@wbinvd.org> wr=
ote:
>
> After commit a637a140ab860310 ("drm/amd/display: Allocate DCN32/1 dmub
> memory to GTT"), a machine with a Radeon RX 7900 shows random garbage on
> the screen. It reproduces sporadically, but at times it is so bad the
> machine is more or less unusable.
>
> The garbage is always horizontal bars extending across the entire
> screen, always approximately 200 pixels tall on a 3840x2160 screen,
> for what looks like a single frame. The bars are mostly black, but will
> sometimes exhibit striping and periodic artifacts which smell like
> non-framebuffer data is being rendered to the screen.
>
> It took some patience on the "good" side, but I was able to nail it down
> to commit a637a140ab860310818a14fb4d37e39e51a06be4 with this bisect:
>
>   bad: [cee9395acd8043be0644b25c34bfa86623f2b935] Linux 7.3-rc1
>   good: [8d3ae59288f1e7d58d76558a6ee96d533bc5019f] Linux 7.2
>   good: [55ab7e14222e5f0b0fd9f7711ca391d2924b35e3] Merge tag 'for-7.3/blo=
ck-20260819' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux
>   bad: [df51bdc5e80dae43cab81f6cc641e98638303c88] Merge tag 'mtd/for-7.3'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
>   bad: [29daacacf4cd84e6917f09de6a99fb170071c14c] Merge tag 'drm-rust-nex=
t-2026-08-08' of https://gitlab.freedesktop.org/drm/rust/kernel into drm-ne=
xt
>   good: [fff648aec5e2790d117a0ec5c849a284d9d33d70] drm/amdgpu: include am=
dgpu_video_codecs.h only where needed
>   bad: [336e0cd576817ac64a4b394ca2b3680029f3e37f] Revert "drm/amdgpu: fix=
 aperture mapping leak"
>   bad: [789f7486a384ca58b9d7a76abba5efa0e80e8dab] drm/amd/display: Test p=
lane colorop helper walkers
>   good: [e0e426f10ad653c5e9dd33fb4a76d55f06101992] drm/amd/display: Test =
helper_check_state rejects
>   bad: [982b2a43682b55e7d9800000f2592832ff2865ba] drm/amdgpu: Fix IP bloc=
k NULL check during soft reset
>   bad: [9102b39fa924dcc3dc75a3137bfa9633c40b88c0] drm/amdgpu/userq: fix i=
ndefinite fence wait during GPU reset
>   bad: [b23470a026afe64de5c1df4ad181587b49c22923] drm/amd/display: Exit L=
S for ISHARP before coefficient write
>   bad: [f02b2e47355e9d381a7f34acc997e1c47879ca21] drm/amd/display: Add KU=
nit test for wb jobs
>   bad: [c6a13d145cc811b19c8a0620f25868cf7d5700c0] drm/amd/display: remove=
 unused dcn42 socbb values
>   good: [1d8327353de6f1f34063840f362c208c84064f54] drm/amd/display: Fix V=
ABC Init and OLED Support
>   bad: [a637a140ab860310818a14fb4d37e39e51a06be4] drm/amd/display: Alloca=
te DCN32/1 dmub memory to GTT
>   first 'bad' commit: [a637a140ab860310818a14fb4d37e39e51a06be4] drm/amd/=
display: Allocate DCN32/1 dmub memory to GTT
>
> Sure enough, reverting a637a140ab860310818a14fb4d37e39e51a06be4 on top
> of v7.3 completely and totally eliminates the problem for me.
>
> Mikhail has separately reported this regression:
>
>   https://lore.kernel.org/all/20260829010525.29935-1-mikhail.v.gavrilov@g=
mail.com/
>
> ...but it seems to be much more consistent for me than for Mikhail, it's
> never taken more than 30 minutes even when the machine is completely
> idle. I've also never been able to reproduce any artifact one single
> time without commit a637a140, despite a lot of effort.
>
> I'm not sure reverting this is the right way forward, since presumably
> this would re-regress the timing issue Fangzhi alluded to in the
> original commit. But nobody has proposed anything concrete yet... so
> let's start the discussion here.
>
> I'm happy to help test other better ideas as well :)
>
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c    | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
> index 9ff25bc8ee5ae..870534b7cf46d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_dmub.c
> @@ -511,7 +511,6 @@ int dm_dmub_sw_init(struct amdgpu_device *adev)
>                 DMUB_WINDOW_MEMORY_TYPE_FB,             /* DMUB_WINDOW_CU=
RSOR_OFFLOAD */
>         };
>         int r;
> -       int mem_domain =3D AMDGPU_GEM_DOMAIN_GTT;
>
>         switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
>         case IP_VERSION(2, 1, 0):
> @@ -648,19 +647,13 @@ int dm_dmub_sw_init(struct amdgpu_device *adev)
>                 return -EINVAL;
>         }
>
> -       /* Limit to allocate dmub to GTT on DCN32/1
> -        * TODO: Other asics with GDDR7 may have worse latency
> -        */
> -       if (dmub_asic !=3D DMUB_ASIC_DCN32 &&
> -           dmub_asic !=3D DMUB_ASIC_DCN321)
> -               mem_domain |=3D AMDGPU_GEM_DOMAIN_VRAM;
> -
>         /*
>          * Allocate a framebuffer based on the total size of all the regi=
ons.
>          * TODO: Move this into GART.
>          */
>         r =3D amdgpu_bo_create_kernel(adev, region_info.fb_size, PAGE_SIZ=
E,
> -                                   mem_domain,
> +                                   AMDGPU_GEM_DOMAIN_VRAM |
> +                                   AMDGPU_GEM_DOMAIN_GTT,
>                                     &adev->dm.dmub_bo,
>                                     &adev->dm.dmub_bo_gpu_addr,
>                                     &adev->dm.dmub_bo_cpu_addr);
> --
> 2.47.3
>
