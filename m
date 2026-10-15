Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CED1D63E4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071098; cv=pass; b=ULMQVxy9UgIlrQMWk0aMFRJ9AoqL5DTPN1O8ZmGVSPJxYbKexeuqcOEEuxMcqdyWP22cBE7P0Z78YtBr5edPbbz7VwPyr3qB5qLPUNmXB2wmvH+GjJHxCKM7+JdFm9Wargc9ojhRFfEjfKUrWwks4J9QH9ruWLbwOJa9Ym5AM78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071098; c=relaxed/simple;
	bh=Ep+d+gS+BkMctrctsViaLTmtGq36PoU0UPa3C5c6mv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Teg8svSlBZh3b2vuUeQGb1zZOMQHS3OVgCM4A3n0dt4v0VbNPIP838aUS9tAn/QfaIbE4t5FCkYvYPnQxMls55ghk2+WbMNY23NI5RL1d2ZlV1ShkQpg4SaBPRSyBgcHciUCf7qPT18SlparX0N2LWbChVhO5XKQwWemeKcb/n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0D/c0VR; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0D/c0VR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33c10faf6easo558909eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071096; cv=none;
        d=google.com; s=arc-20260327;
        b=TWXhDSAXjFTSbDgXav0q11iVFbKcBrsnpO2Z7JSCzfCJ8a/yPbRbIYWwaSoV86teMu
         t5j2GQaxGmm9O14GKYBib3vSMKN1qmyU7zuBW62+xwJzxUX+NojFh+tJsx+wGL3vQOzt
         yhaRnN2OeNYLS30AbLA1usdpa3c7dptXeWANOu7e+d3d//mUx0QGMrPMBdZ+MKP7t2t0
         IfcgoJEbpne/8LQFDOgIZyMy6cMjSDU9Zw6Uf6ZdSrGNUZOAyD/dc9M4Sft+AKHjH0e6
         JbfL82ENVUMs/jkrxLRkK/8mUYKBT6UyN7EtyZzoQoTnKdS8lzrDLFAs0T1WuQSgEFes
         y3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QApmXxg7MwJF7cN9FykhLPyexb+qvhQ5FPRBd4FC7OA=;
        fh=vLkgjPiVbWdVWvnfTb9fEf/efksIk5rmPuvyGK4TXL4=;
        b=dvjLDMADscTTFKDLuCBaHngeAu8ORzfw8gTbpZdnt3enm9fqWiDkkyf7gKMNtAmgHK
         ooGITIGN8dFwfLzwLmJ3A1Z9h1OwGF7oT/gRwTPZ47sUIETVk2r6c0Vnrx7S+ID+bB36
         gxv3DrtREJrEG0tpqx7+2UYnr3zEw7f5/8xgenNHuTz+P1h5om9Lai4JjbhOOrhUCtjU
         iv2P2LB3kKF2z2bdigGRyw56u7EBXB6sZTDJa73hUtQZ/VsqxDqheJnFreC6Z6TvHV1c
         hjzQDDRFP66FhcDjgB53wRhceX2iz82cQfDZVeiJL/DrfTWFMDQ9eLgqqRtI0cuwuPba
         ETyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792071096; x=1792675896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QApmXxg7MwJF7cN9FykhLPyexb+qvhQ5FPRBd4FC7OA=;
        b=F0D/c0VR+UDbYHjrFJHDyKv+q8kNTiR2Gqfyg3h3AoGN8pq3wuehAW2NQ3VU8cfyQA
         Sp6xdsprTUdxflkq2/+jSUXO75xMaj9TrQOWAAaIb8JbMUFVcXNv1JxyFoLyZJdIGxn/
         eIDpn35NNNuGbVBgi4SOQ1GnCqLc9KZBzouWorsIGvraqL4jOX20kcNRdK/aehHdeZ7W
         JilzIdh9qpZvcqw2GetZnw52KhndXc8zOi9UGqdraEt8R1UR+l8zRdOyyHLNAB2njw7/
         YWAg/W7erj68VM8jTTUzMozGga4EXGigL5lCE8Eh0cchLI+HOw9xTQYBPaYhJ53TRAHm
         rHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071096; x=1792675896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QApmXxg7MwJF7cN9FykhLPyexb+qvhQ5FPRBd4FC7OA=;
        b=ZWy1VXPXrN1TMJD5ZlO//ZpmVSxCZx20XbIxAgRvN5TWKesiiNY/areC/sJgf+b+xV
         vPF6bfcuLkgNUngtoQ6IfXZ9kG3z8RGKRRVBXHizeYvqTVRqwR+0uX03rxtrdvEp+TMo
         x2dSt6SZZEDslujqJ0GRwQGy7+uE+Gt5VfjoDFOY/x/pmA2GCQMlgkU7eAvJ6gzzg5lO
         kNqMgW9Q8EYFtoL1unAydbvfpvcaRMXfdZXzFaC6rAUD+2P6qR4EzkVOnzKvaiwYhHQ8
         xpEyk6uttTTZuttPhCVeawWvYIfRg2b76SNTX2Cc9kv7NvQTz6kRO0ae0ISz7aD7eEmR
         TTEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsHUyKelixuT4APU+MYegdsX81n/yGRuRzTHV2ceBXdJU0FDwN4fmQtYcawXHfHLDJeKHONeO+SsehNSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUhUiWq8ePbGhlIXvfuK9l+1XpI2zQlZ8yzlhyg42hUIf6WIgZ
	a9G0NzN+acfO78u4nM+cwB8Iyr1tHX41v7ZHPeu1NDH0yK2yGNifTpU+hJ+MLYIccno5UMr96TX
	9lMs/xyo/K+/W5r40RuJIwjyRCfYC4udYuFH1
X-Gm-Gg: AYBFou00zOcDEYWrjY6se04cdVPFWJswXQjna25YH4L6g6HkOfE0ubpkmSOaLB5f/D7
	fnWZyb+Cv5qfnnaX6urqEZzHx0LmTjs2T6DUAyinWJ18AxkbZ6mpBXI0/owAT2YCvozjpPYjpay
	YdnRqKtlFL+U+PF114oi/DzS7zAy/RG5dW47ap11Bdd/2JK0fgm2Pj8KMCPnulUcV5bSsu6poH4
	EOTT92tLf3/yJ8eKupQC56udcmUIiv5mX+hFKV/Uk5XKXhN2jNy9k1+O3thfAIZcM0K5//8q9HB
	Y78oCbsQGP4BMLIZALNGpSsMJtMD7yd6i+rHyae/G8EgtNAbousqBVQa19Ot+PqzinhGZZw7QnW
	rNB/+5920QN+TCQPu/HB7otO53sghcsjWKp2UokEK5A==
X-Received: by 2002:a05:7023:a5b:10b0:147:d430:7322 with SMTP id
 a92af1059eb24-16a5bc5bd84mr37714816c88.1.1792071096077; Thu, 15 Oct 2026
 06:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADnq5_O=kVgSZoqe_ZVQDmVTWNb+OZ2XhmVx=0CPQQfCaf2idg@mail.gmail.com>
 <20261015002344.98683-1-williandossantosdeoliveira287@gmail.com>
In-Reply-To: <20261015002344.98683-1-williandossantosdeoliveira287@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Oct 2026 09:31:23 -0400
X-Gm-Features: AclHuK9ZmUn4FKK7SEAciymXYIUH4N4bcGFcrSo8pT-xgjBou-x7Yj183erpf3s
Message-ID: <CADnq5_PnCPpWsDDWBD4RicjxHQKTV+_MALbpzx28BoVej4qiyQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu/gfx7,8: remove redundant RLC cleanup
To: Willian Oliveira <williandossantosdeoliveira287@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 8:41=E2=80=AFPM Willian Oliveira
<williandossantosdeoliveira287@gmail.com> wrote:
>
> gfx_v7_0_sw_fini() and gfx_v8_0_sw_fini() already call
> amdgpu_gfx_rlc_fini(), which releases the RLC objects used by these
> IP blocks.
>
> Remove the duplicated explicit frees of clear_state_obj and
> cp_table_obj.
>
> Signed-off-by: Willian Oliveira <williandossantosdeoliveira287@gmail.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
and applied.

> ---
> v2:
> - Keep amdgpu_gfx_rlc_fini() and remove the explicit RLC object frees
>   as suggested by Alex Deucher.
> - Apply the same cleanup to gfx7.
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 8 --------
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 9 ---------
>  2 files changed, 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v7_0.c
> index 5fc19fefca81..7c56e36665c7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -4454,14 +4454,6 @@ static int gfx_v7_0_sw_fini(struct amdgpu_ip_block=
 *ip_block)
>         amdgpu_gfx_mqd_sw_fini(adev, 0);
>         amdgpu_gfx_rlc_fini(adev);
>         gfx_v7_0_mec_fini(adev);
> -       amdgpu_bo_free_kernel(&adev->gfx.rlc.clear_state_obj,
> -                               &adev->gfx.rlc.clear_state_gpu_addr,
> -                               (void **)&adev->gfx.rlc.cs_ptr);
> -       if (adev->gfx.rlc.cp_table_size) {
> -               amdgpu_bo_free_kernel(&adev->gfx.rlc.cp_table_obj,
> -                               &adev->gfx.rlc.cp_table_gpu_addr,
> -                               (void **)&adev->gfx.rlc.cp_table_ptr);
> -       }
>         gfx_v7_0_free_microcode(adev);
>
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v8_0.c
> index 7f91186ef1d1..27fbb5b59645 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> @@ -2060,15 +2060,6 @@ static int gfx_v8_0_sw_fini(struct amdgpu_ip_block=
 *ip_block)
>
>         gfx_v8_0_mec_fini(adev);
>         amdgpu_gfx_rlc_fini(adev);
> -       amdgpu_bo_free_kernel(&adev->gfx.rlc.clear_state_obj,
> -                               &adev->gfx.rlc.clear_state_gpu_addr,
> -                               (void **)&adev->gfx.rlc.cs_ptr);
> -       if ((adev->asic_type =3D=3D CHIP_CARRIZO) ||
> -           (adev->asic_type =3D=3D CHIP_STONEY)) {
> -               amdgpu_bo_free_kernel(&adev->gfx.rlc.cp_table_obj,
> -                               &adev->gfx.rlc.cp_table_gpu_addr,
> -                               (void **)&adev->gfx.rlc.cp_table_ptr);
> -       }
>         gfx_v8_0_free_microcode(adev);
>
>         return 0;
> --
> 2.47.3
>
