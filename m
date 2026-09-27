Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540F043230F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790537002; cv=pass; b=ZF5n8Cc8I3q+G6oBExi3e75TIsdFJOuFb79RZ439YPoeKAkkLm0L6eme2AUC2o+jMSDKsvX/dvymQIpf62raOU21GdEXdyprII3SA/XGypoPQpubFfJipyXN7SFBoMk3bsUdE7kiE59WmTKTUp9LiebvwUmFq2BM5UDUfp5W3Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790537002; c=relaxed/simple;
	bh=JxpCDu+yGAq3x+LaLrqPzWBYldA8v+H1aqRDcrTIXZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELM8dyktVh2lxI9bXxAEvdEOaDZZ+RxwvRlgaCA394WwtUKDav3pibjaoTSu4+t36wXNhW+LtnWs860y2FaAnuSVYfYSkfVHo+JzxUkDdn3J+Iq5bPv7GxiuG0glXgUk0hUgnKTEkCmBpRLmexLI4ICWzKe4qhR1HuOqRyeuST8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLc3PqbG; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLc3PqbG"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-141a5cf1370so61701c88.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790537000; cv=none;
        d=google.com; s=arc-20260327;
        b=mpFynIt4YMDknIFyOHf4qN3DxfkQWkA9NGwinw+EXtQ9feNwU8xuVPX/85k5DwBDJj
         H6nrrvh2DIqawBKwqK9FoTEBvD3DmKtlp/VPA05ihUGqd8c+c9Qcd/OS/WmaSXKm1jkQ
         DrR7p3p4vx82HaNgRb/1ci/f7+t4eMFJW34aNjVbAAE33W5ACGrOQNOzBWeRP7hvEiSy
         LBs/3ACJiw2KNSIvSMQozItH14eH03HqtpMs7gCQQ/lxz/xAYKqN/mnDwftO2muKPgGU
         ZBrC4j7DQP3VEqdYaA+K9lXuMYM1eS5ZA6EalL37REJ3WOBg0nvkAW8rTZbb1b7g/j1U
         sFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQ1aNNlcd5tc7JMvOSQAmrryeFFMB3Nt+WvcOu7O2ZQ=;
        fh=f9crU0ZOsanjrVL8MRePlYvIFZJrWPF+DokhwYYiUpw=;
        b=lWlrpK6UjFJhPSXxXf6tuqVXm+cFONTIjNViE4zIsDc57HjTxRhpZX9PzGfi3M0eH0
         FyHSfjnsz6oL7uEZCpEnu3bBIfv+EsyYk+voPz/Z+OU/J89FJX2aN+4LbSd+qRIrOvbr
         gWingYVzzdRbTHIFY+sZ8+O92paEdJHurrVH7U2C3dF7fFucC38zIRHZrGoBCvsEkQCo
         +l7cxJZu6eX15ho44skH9XjdIahSvhx1abK1V9NT04JcecVcLfjENr9cAHiHYppm9c6f
         tt2GTH73pmc5bAwdJkKu9B0CRiTrQACMvUc6yWqgC/A7Z4kMAYhqoz5kMm9zy1g5uWC9
         QbRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790537000; x=1791141800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQ1aNNlcd5tc7JMvOSQAmrryeFFMB3Nt+WvcOu7O2ZQ=;
        b=iLc3PqbGRP7UUnhp7KfiUQ2sdc5u0lbS1oxp9hEgz0PXkh2+W+wI84Zo1aaanj/U+B
         n8Ga0YhhhJDq3W5jqEM3F0R8iyCG9Pz464Q5Kmt86Tl5DzLXQjkHLOJn+i8J9oowU7Sy
         fq6gtxbhraRCTEzsgTpHX7Hii3L7tjR0enYDbclXxQH31XYQj5IkT66faRdzCnhgp9UZ
         ekg3R9WRFeurKercVJE/364iXxLTWY3kXg1yRP7dFTH48TmE2wvIq91YAunXk2jjMGBF
         9cNEhNvLDfChZ+FlK55PAN9gRVLDNSYOVZXv+DbMtnTglGwLfcgjMreBNcVjTXKUDOvZ
         saxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790537000; x=1791141800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ1aNNlcd5tc7JMvOSQAmrryeFFMB3Nt+WvcOu7O2ZQ=;
        b=N+sngkz5J3IzDvexrMzbVUyjs+NVgIOrOzkKZ5qdP7FDgIdgJ3OpztDTb/Jb+wdW3R
         WPCzYNy/43KOQJyt6mVlP0NWGcT2/PVDIvx54AwhVUFmrVePh6e36kMffFSMUVzqwh8p
         d6NdB/hyp2Yen79RwNnFz2r8BitSf3MbFBZTWrY9w5tE2wRj7cUZbeCinoKZzFxfpwFj
         8+HBDxaIK3SfEtECCM3Bk3BZL3fHAPfhtxjydaWGu9l01NuiWro2SPyHcfog/UyUKZLY
         MbFECno+ctnsemNlus1YYsoXm/C4X6srqkjLGdlM1auIzl/oOLTE4ULJdun0BqAqHLU0
         +rGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlhcAtEYUdnQ11oPeOmZSWAQhA92EytOY0mXb6oaVaqB7rsnAaN+2RyrDsccu9CTX3bVOBRsATHOUmrzY=@vger.kernel.org
X-Gm-Message-State: AFuF++k+w0frtfaoLRsvWhpkvSB2aPxwh+lplBOlemrhVRruQsZ+gXkB
	+BbJrjQg8m3sxXQZu2mOHVtOdJt3FktAILmxCINfn8DHRyzuFPoKZc+HekZ8JMGTIjZGW8p9+PB
	nQ10iG20r3Fq9vcvZb7BmQwWi3XUTMuo=
X-Gm-Gg: AYBFou1JGTjYtjdFDhcsBsoAJE1zq7P8YzmN2wk1wpqvlxOPb663Yl+/Z42Jcw7lLwr
	TQ+HLgKOJ98PlxhIEj0jU7kTa57wprCAd78T1snvt/9Y/7RRTvcPiMOf+xY/RFRJDDA6zSQl+Fm
	GJWJv4mPv0SfUKROQf/rbpyeXb52wa9nc2lIanS18t/v06Q/WQ0pV2o6xWKDuEfGPIy2exMAl7i
	ZA7403FJt1N3YW3IbPMioWB0Y0/JgLLaTZ5vv5hT62gkW5yCFMib1uKMXOCRJRe1M0KN1EoLkCv
	WouHTKvMsuQuSZ06GNZ0se6Oxqj2TcWp8rdgUsFwgQApmhr9jJf8z14rHqQkaxWYF9K2tpN2MMF
	ZNlRqwYY7kXDoau7SobmVpDyj0e6yuYtTnsZgJH8MJg==
X-Received: by 2002:a05:701b:4542:20b0:139:81c6:67a1 with SMTP id
 a92af1059eb24-146cf7ee6efmr11412357c88.1.1790536999746; Sun, 27 Sep 2026
 12:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927161601.1183525-1-sashal@kernel.org>
In-Reply-To: <20260927161601.1183525-1-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 27 Sep 2026 15:23:08 -0400
X-Gm-Features: AclHuK8wUu5keriArIOfnqcjTa0PI5BDk7mnauwk6N-t9qf1EcExXFN7ZB-zoKE
Message-ID: <CADnq5_PBt-8TZ2i90m9fs8OKWQHmdpLqCx9+my32duvb78Yaiw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix sanitizer check for the DML frame
 size limit
To: Sasha Levin <sashal@kernel.org>
Cc: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Hung <alex.hung@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks.  Will include this in my -fixes PR later this week.

Alex

On Sun, Sep 27, 2026 at 12:26=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
>
> Building x86_64 allmodconfig with clang fails:
>
>   .../dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10491:13:
>   error: stack frame size (3128) exceeds limit (3072) in
>   'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
>
> That config enables both KASAN and UBSAN, and should get the 4096
> byte limit meant for clang COMPILE_TEST sanitizer builds. The check
> in the dml and dml2_0 Makefiles concatenates the three symbols with
> no separator:
>
>   ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
>
> KASAN and KCSAN cannot be enabled together, so before UBSAN was
> added the string was at most "y". UBSAN can be enabled alongside
> either of them, and with both set the string becomes "yy",
> $(filter y,yy) is empty, and the build falls through to the
> non-sanitizer limit of 3072. Adding UBSAN to the check therefore
> lowered the limit for the most heavily instrumented builds instead
> of raising it.
>
> Separate the symbols with spaces so that $(filter) sees individual
> words, and test for a non-empty result. Only the configs with two
> sanitizers enabled change behaviour.
>
> Found by KernelCI builds of the linus-next tree.
>
> Fixes: ebf8b0fd8508 ("drm/amd/display: Relax DML frame limit with UBSAN")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile    | 2 +-
>  drivers/gpu/drm/amd/display/dc/dml2_0/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/dr=
m/amd/display/dc/dml/Makefile
> index 91465ac05c971..eb4ce5b1ecfbb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -29,7 +29,7 @@ dml_ccflags :=3D $(CC_FLAGS_FPU)
>  dml_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
> +    ifneq ($(filter y,$(CONFIG_KASAN) $(CONFIG_KCSAN) $(CONFIG_UBSAN)),)
>          ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
>              frame_warn_limit :=3D 4096
>          else
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile b/drivers/gpu=
/drm/amd/display/dc/dml2_0/Makefile
> index e8bd061be05c1..2181079c89d0e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
> @@ -28,7 +28,7 @@ dml2_ccflags :=3D $(CC_FLAGS_FPU)
>  dml2_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)$(CONFIG_UBSAN)),y)
> +    ifneq ($(filter y,$(CONFIG_KASAN) $(CONFIG_KCSAN) $(CONFIG_UBSAN)),)
>          ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
>              frame_warn_limit :=3D 4096
>          else
> --
> 2.53.0
>
