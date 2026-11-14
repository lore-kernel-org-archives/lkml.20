Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647638;
	b=SkO5gLVluCXTbsF34UTxjXRQkBA+uzKf8tU+eBI66oh06NaaLyFgnefrUpamRymEY9HK
	 xa4zpqaC2xJzqNSyh4c9Qme6Msaxr4GUSCaQBMUXJY6Hq1esEGtsGTIFPf74ad40BPmEe
	 PUjHWg0Lg3F55WtcEWTHHahF/M6pYkvuHfevCWWZHKH5mkarq2tX8PoA9ZnmB/iQGl2ic
	 R3E9iv4Iq7MBR+T9zmHb5R2ppZfTqqdEicTuWmTAg6BsC7nJebXhlqHJUzYVwHkM5J5lV
	 zTfhrQ1w+6uc7yTWrU8/7dwj5UKjKlmhRNO+dBQruLrHne8n4lIhLjWouwLnVCCka2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8ie7J0FJagTe78B8tUzxlFkiEYKYkmpvWYFLVnObvFo=;
	b=AtKd2u83TErMfQyPTRNxomdJN+khmi5K6XwR4WLaMUZhJr2HJW5apzCi3VbUuTrYme9D
	 V+ILeytlvizSHVx4z/mpldrMQ2aIh+eJ+tt4uv655pQQVXwz13s04rVQ/zDLXyhwYHB5Z
	 fbHnwZvU4tY30/eM9WYCakjjaKRw4jFbzLHiCqGtq9yqupFaBXyR0Qv/pAB5UJOIEkoE4
	 /lqtdMK/bhu20dEG1BINaZVpspmdptL5yemvJ667jjN0NXxy/5DiQmF1nzp7eiDCnSGHH
	 UgGJUtgJZYaazdkeR3VSEQi+zEHg/IEUnLFgORBYoJ68l/be1NFct07kZEcSoXaqT5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ag6ewlAa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDBE606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EDBE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ag6ewlAa
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3129103a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794647637; cv=none;
        d=google.com; s=arc-20260327;
        b=ge8etUEeUHq1/LkwQGv1TbIs3SZ64pNvI/ezwDG82g2Qrbh5fGQgmDaqC1iQFNwy0Q
         wuxtALlB+Ys/Eh+PRAzxOXANRUPRbf6w+NLUMH9irhOUJRdwZXc8nd0zh2cntcZ2vQ0b
         0R/4DK8bRoDRujihmYwlGTA25UPo0/GIpl0D8AGrokrvbEG+JfXPBnNpZLPzBYWOb/t9
         FwxNnGGiqJDikEaRrlDOyumWy82gpcQFjJqEilyLrPhLr/HoqG+v3p/PvW2hGfFXHPcM
         v7l/Qf5XsvhuhIgge7QREcQA88quhk3UB/H7HlL1Omdhtb7lfUJu/psozf0T0+N/fVI0
         +eTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ie7J0FJagTe78B8tUzxlFkiEYKYkmpvWYFLVnObvFo=;
        fh=LHZi61bJxftIsECuM+nBCPNkh8E6ICb4NWORZ+ZFfXk=;
        b=DqFd/6evvv6Y3h84VD4oYhysnBoH8Ko/wOqJ9IaFWRAeJs622zSQ/XsEGdAi0+gygL
         hrFQQg9rIGfJ3H+LqPdKdpCEYPJQEwVeYV5qA35Ro5t3qhylBegRYPQ7LyuA99qOX3vv
         fifMwbX99ds3mP2DsFXDtCJTl5vCbDN2ltoXnZeNZvkqRcB+2j+UW+rhlskj+ijnSeTm
         UiQg9SiEQHbp50HGeIDHDzEz/scBU53TWvIlidOaLiXFvUuPKCISnbw3bbC/s9PTMPE0
         W/2rkbxy+O6TCAwLcVUf8/lRw+0vAo5jQMHAPz9CGhv0GLxjP5qRrluI5qJQrpcOa6Rt
         8V9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647637; x=1795252437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ie7J0FJagTe78B8tUzxlFkiEYKYkmpvWYFLVnObvFo=;
        b=ag6ewlAaz81yhb1pzvlGZ4YZzFu0odmkI+M1Y1WpMHThGrSlyKOachfoxV/3Sj5d9g
         /slMinWPxJ0g/5IKJ1hX7muMyrcPXT24xm2Ua7HT56L3nbifcmXTcg1xqIrggBUxLnjj
         jdAj/aRw+BEtDgx3xgnsrphejx8GTUntFm+CywJi8/yU3d+vcXmxt/CrFBiTdUtlyjV2
         ERUEmLb+rYrIGd14s0zTN0xc/qn19e0eSbQAixQ7wgeci3seCSw9/h/2PYdC8Ge9WQPV
         yQ82e1i8lmtx7dyBUBWmneHmFAgUba/642m6cSF/JJKzrmeAb1SN+dkaoEYhHJzxvIgh
         Tk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647637; x=1795252437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ie7J0FJagTe78B8tUzxlFkiEYKYkmpvWYFLVnObvFo=;
        b=hJwqIlhQMtSYw7BbdBnXZ/xOfNB+C4DoMUgTKPhZb5VfSyxKVOvB9BYDYxfTzWbwf9
         Hj25Y+Z+msvmMTHtBGiuMXroiazF/AcBlimEmjlB5lO9mVhRbhTUNzFHYwQpoXXAi6kW
         xZ5OvZh9al3eutQvCDGr80UZj4mfLwLyXrRR2EkthkOMgH1bNz7X/a6/pDUtHGTlkTnM
         KKpQ3VkW0AS8fQ+vgefIapIZU8aK8jxa+3ZDSBJPyh1OC35Yl4fH2klqzIjnu+2RJfd+
         T76kBybEZjGx93bp3zJT9AAcSIZekLnkVjyOzqkzY6ptRPztUAA7V02qHRc0d+4wFmVM
         rLJA==
X-Forwarded-Encrypted: i=1; AL+hErHEyHwbCT2luKH3QVnlE7DgRbo97c+GQ9FcA6hKxfwsQqZppFdILz/OQMH1fwAy9gm8P1hN+rv4w2JStL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ge0VOi2gahfkKovGNZ82EMcCl1EpeXXTParSSAWmXJVISo4KC
	bdN6bZ+XD10dIdQhjaZwMH8atRLHCdV3ciXzYkyrhimOnMO6vOMmGY+uZ/8/sguMtvHbEpgZAoo
	6J6kOpyuQ0CTilg9dnDvNyGJIzawEmIY=
X-Gm-Gg: AYBFou2F6HAXEGxMby4/CTFb49ILWBaZURpXVOaMr+Ji5kho7ysJ6Xk3IfYfWyLoWAQ
	EMO1PyCOz6+yAzT0xQQLpUEklavxLGW7WaC+8ZWCScdzyZr2rq2O1/AidBsVDGslfUa4MlZD9jQ
	wGWxDZNo8hKGQzAyimFVq36MC0e0Iyxd1XF9ycPnUWk1/wm2Ru5Vb0Zy1bJmuar2LX8xlGxno72
	NLQxpH6GaovefygroVfb1eCOYEY23vHrr8sZqDbIeb2zM1qps/HApmBaJHP7FxsHvWIPSLaZMUh
	1HTIF8jIKRlZsRMkfTklCNz9iT6kq8FyN6dPU77CflfmYyGUovAzWaY+4wu4rpKu4PWQnPvqK0e
	y8mWt0JlgLEmvlxW+WFu8XL8bvxIsWkD3D/6lnDSWMx4zAJiyPmM8HDW5fIIp6MZs/5+AQRl++n
	1jnhsyXkCtNLuKrkXjuy6hqK2y
X-Received: by 2002:a05:6402:13d2:b0:6b7:e902:5e23 with SMTP id
 4fb4d7f45d1cf-6b7e9026013mr717104a12.33.1794647636609; Sat, 14 Nov 2026
 01:13:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112200359.32685-3-blum@kernel.org> <20261112200359.32685-4-blum@kernel.org>
In-Reply-To: <20261112200359.32685-4-blum@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 14 Nov 2026 10:13:45 +0100
X-Gm-Features: AclHuK88jybBaSEEPMTliBUIGHdiw1hpHPJEag-axkztBSs_Zfqh3EhY0WqZ05k
Message-ID: <CA+=Fv5TLvQx+c1exSXxecBohM6HUGqtnQRCAqHMvugCMpa-K4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha/serial: Add include guard to asm/serial.h
To: Thorsten Blum <blum@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Thu, Nov 12, 2026 at 9:04=E2=80=AFPM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Add an include guard and remove the stale comment while at it.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/alpha/include/asm/serial.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/include/asm/serial.h b/arch/alpha/include/asm/ser=
ial.h
> index 205e61ef2975..7fa754cab5df 100644
> --- a/arch/alpha/include/asm/serial.h
> +++ b/arch/alpha/include/asm/serial.h
> @@ -1,7 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * include/asm-alpha/serial.h
> - */
> +#ifndef _ASM_ALPHA_SERIAL_H
> +#define _ASM_ALPHA_SERIAL_H
>
>  #include <asm-generic/serial.h>
>
> @@ -20,3 +19,5 @@
>         { 0, BASE_BAUD, 0x2F8, 3, STD_COM_FLAGS },      /* ttyS1 */     \
>         { 0, BASE_BAUD, 0x3E8, 4, STD_COM_FLAGS },      /* ttyS2 */     \
>         { 0, BASE_BAUD, 0x2E8, 3, STD_COM4_FLAGS },     /* ttyS3 */
> +
> +#endif /* _ASM_ALPHA_SERIAL_H */

Looks good, Thanks!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
