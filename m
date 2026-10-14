Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8D55C1D5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992458; cv=pass; b=ErlP5JKxuvyjfv5t/HIhV0I0vNa8XJciW3pTMblJpakO5cZPWVBD9I8UIsCRhKYOMZyMghXIgFz8f4ZVPFB2PtdsQK78lbCuoXdnJSVLcZoaV4Oa/65fAdJx4qbSckixZjAjBGUxg26CW8CkcAbeM1r8L80n0tC4he6ftzRV5so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992458; c=relaxed/simple;
	bh=FGhpEsHWxSWGNakEws1EJQr0M697F/dwSZmFY6wJ4TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3YbFsFTrBHqc8jNIlpb4wcG9MPsmvQbVza3fXpJkrz2aOz1JpXbg92t9Y9jsL0iEe6gB0G/xr4FvUVgzTiZgpTdHbuP7uyukgM5plokdJocfZtJuzuWzREENTfDbzQx4EGcBgJXlbAmYpdZQvQWilsbNdM1zb/ndMw84BNJKQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhPmuV5B; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhPmuV5B"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c380ecf9d6so104752137.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791992456; cv=none;
        d=google.com; s=arc-20260327;
        b=ipP7rSUuI8I5tHPQ3Yt26K5ne6o3SU/+bDvM/jp5nDW2EnVry75vUEzX8VskWa7U9Z
         QSD7ZQU96AhR9SzfuR3Pudu0vhHMb3moZwEtci4CBuMh5KnpZNeJSCydJD42hFCWdINo
         wDo8uMnfB0rPcWApDiC+Sl0qkAwjNHNupjRSNFULf9EhcJQLG+nUJtMqu3iSJ+iap4E6
         vgBCdXXpg6B8M7FOdb31AgaZg26lvTrHrdPxuMC6DbBpgQM4z3w+tXlVq+H1IEVZksLv
         FTiJS1R0A8bNn6WKmTzSzWojjxE93ZCfVNBTLhaqu4DJADXs0PvNqfFDOfzj8p+Z47It
         bgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DbKzH4i6zRAMVk8eEw5RFUvTFq2T+6ztKAjhHEjk4vM=;
        fh=hfv7E6qY40kFS4oBD3IC82vKUBKN5mnYrkRWJmT48j8=;
        b=gSekDGwWV0xPG73sEGTYi5angVM4J+O2fJpWwsGLa+yFs6MB2ZUaLiJD9OiLqowE/F
         Y4xq35S2YEr8kP4nBnF2bM1pWLsOjgPKcs/MvBqmIWcuMfYGhSeG593tsb7KPh7PomAv
         TA+EXBAaGyLcJpKqCPLxsiZQ/8Mj62IKbp5W8/nParbsVRKTPp91Fl7OxvgyyGf9xezx
         0lBZpT6yE5KPWv2MUP8hBRqGhywPdlwhUlRDl4s38hfzAZ0i2lsqdwI/S0tq4BoXYGgA
         CoONEbffwFsv/yYPv8enV9uG1zLpRKoEE6wnDoRx2BKi+ahmlK+2NlQELPyX5NGRB6Dk
         nK/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992456; x=1792597256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DbKzH4i6zRAMVk8eEw5RFUvTFq2T+6ztKAjhHEjk4vM=;
        b=hhPmuV5BCNVSI7D9/72U17vtHfXaM7J7fvwZ15x9+r1aJeyZoMkkbdSnKBHRhjB+v0
         y9yIQtI1YUbYJGd73ptSzRBV/kJiVXHzv+3/mt4pUuqkXj2niwNlg6/fkp3sln+Qvrhp
         k0vntCXaQmPmWd96uOhf45v5sA+lajAdrL33eEYcz88Vx6kGnl6yZSLLsCJjyQsRp7Uv
         kJynju3uh/aPtyQLozODvjBIwIxdisAWH80imjrXqoAhdAa7w/ivQL+75BO4QewgGYWG
         RBuKUYdY3k0ouifXZ23wrnY1RkjaVyBn9DDxtIcbCWF6ZVIV3nTZhgb5iP9joC9IHzos
         a1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992456; x=1792597256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbKzH4i6zRAMVk8eEw5RFUvTFq2T+6ztKAjhHEjk4vM=;
        b=cZuoyqLT63bvuPazj4TZ/jPDZRXIwMnHYW9pQha3xnCwtckigtrBrJcjWX9Ww/gKMw
         Grh8SPlu6AwZOmoNPvPPt0Sv9huc+Xscj99CeuXPDM738j0FBoxxuyjGT60Q0TEG8g+G
         iihrClA3Nw7hPYztT5Fc/VkgCpwqlHTGgdQn/K8nN9QLndlqXsqiSFcfvNe+QgEJAn+I
         T5ND6/7NWatInyh4/dW0W0+ojSVqxmN+Ipx/NhUon/Kd/6mb1vXCLwV2ueXfLRMPAzjA
         EqjL++J+sQ4FyCumQufwhXR+8g7/uRNdl2mx/ERZgx0TE7LxAy0+u8KwYpWHpdLpY5In
         +d0w==
X-Forwarded-Encrypted: i=1; AKwUvBwj2t5ZY8alxqPphDHKcPo4H8oEWQYvu1siN3aT8xqu4PMP69SWPC4sOiqdTa2Jg0vrpt9U+21GzRtn+dM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK0YRWuIqPrzunNpH/2RtEY43Tec2AXSAiBbIqCibccnhK4nPM
	kkMUBGK/aYPAL/GIlv49jyMRBuEtLoxHH5W6Ssbmp/JRoCDFBy4kswoGEgHosk0FKahw0GpLuIR
	F7wOymhoIl3oIqh4BkjrA/x7mMOrG2YI=
X-Gm-Gg: AYBFou2ByS7vj3R8nJRCLM2clITsI8EadXZfmNlfUV2fNYjrF4RH40B1EHGIs0Cq4/d
	ZR6Rnx5Xofy2eeOqIuz5Ijn2jZ/47x/40lkkRc5GhA69b005CVahkPvooQGT3EbhJMLfv8v2ptS
	ZWyVl/E3mH/oxMFbMudEg+gU8Wi1243Wb7AslEBhX2L+ZD30uQDFhpyiPhkJl+TwfxXM6LK1s0K
	pJJ1MEQ48opKixY2WBgJMhFv4d3iqHcq+E8Hpsze8Fiz0mI5OCqDNHRWO4Yd0+4jHEHvkhnysnV
	sGdLRrIzw/jwTPV275ONC04b2U4PiCJ+fJFePUQHLOH4S1beshcFcie6Yhh6MeWMY3ziNljgO4V
	3afnBTRG5kEV4Rbpr+c2jGb7sz8I9lrGdg+oP++87DQ==
X-Received: by 2002:a05:6102:c07:b0:7b4:f1cd:80dd with SMTP id
 ada2fe7eead31-7cb3668aa3fmr4015389137.1.1791992456409; Wed, 14 Oct 2026
 08:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013140104.32179-1-omer.e.idrissi@gmail.com>
In-Reply-To: <20261013140104.32179-1-omer.e.idrissi@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Oct 2026 11:40:34 -0400
X-Gm-Features: AclHuK9I1qQZX4KcbB9N2WEIH08IUM_G0_q_Cb0vteRJPQ5eD7bXK10TL33mfvM
Message-ID: <CADnq5_N_c9OdhcTo_ByJM+w__hhu97=1m9zsR74crivKGiiauA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unused tracepoint
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Wed, Oct 14, 2026 at 8:56=E2=80=AFAM Omer El Idrissi
<omer.e.idrissi@gmail.com> wrote:
>
> Remove unused tracepoint "amdgpu_reset_reg_dumps", flagged by UT=3D1,
> from amdgpu/amdgpu_trace.h
>
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 16 ----------------
>  1 file changed, 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_trace.h
> index fcd4cf2f4cd8..6fecee5be1ba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -564,22 +564,6 @@ TRACE_EVENT(amdgpu_ib_pipe_sync,
>                       __get_str(ring), __entry->ctx, __entry->seqno)
>  );
>
> -TRACE_EVENT(amdgpu_reset_reg_dumps,
> -           TP_PROTO(uint32_t address, uint32_t value),
> -           TP_ARGS(address, value),
> -           TP_STRUCT__entry(
> -                            __field(uint32_t, address)
> -                            __field(uint32_t, value)
> -                            ),
> -           TP_fast_assign(
> -                          __entry->address =3D address;
> -                          __entry->value =3D value;
> -                          ),
> -           TP_printk("amdgpu register dump 0x%x: 0x%x",
> -                     __entry->address,
> -                     __entry->value)
> -);
> -
>  DECLARE_EVENT_CLASS(amdgpu_userq_queue,
>             TP_PROTO(struct amdgpu_usermode_queue *queue),
>             TP_ARGS(queue),
> --
> 2.53.0
>
