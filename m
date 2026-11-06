Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793925810;
	b=E/SQMZEDWXxkCj2LYNt1JNYRk9eTFqyCYqAzSBuONJ8GNiyaUi3ONMp3sldvb74HQVQ0
	 YRpZHvKi1EkL+akB8zY/IXVXkcoQIZyX0OfSEQq5keoQA8aKiE1qwmYunQZKffBQann+z
	 LHtf7nUm035NOTYm5Y+7+i+V1J7vXwGndWQnlxRIC6iUjB0Qk1wkwaTUsgAnzSqmy4O+g
	 1F780PD9y3/HSgFeJ76iXKQde/IAfpns5twWbE1NFNhoN88kyjfYElHAge6J6LGN45LQ4
	 2cwcmJ/FILSsv6IVQPJgDUYwSa9pPzsziR5Q+xDjorMWDzkX5F+sI8nC3vLu7MbtLLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qjiIc9YUnEoIVWcKqPZO23DxNrAI/hQv4scM2zT69bw=;
	b=sWj3y8z2lv6nbwyAq8DNTnZ9KQ1FnbAg/3Vny12GpyVxQHHIbggEv88aaJgY7KYO99YM
	 AqxAbNrPPTf6tPytG7OQeZEN0h8YTv+FkrKpWuE33zauERQwVQvxpYO1a5gNBFtgd06NY
	 PgRY/Ct7v2L2cyW8i3aDGoSjoBw4R+WMC9rihWx7tt1OnMp4FXzi/X8zhSYkC/EHnHDtz
	 BFpnmBaRdN3V9LuLth0tGF33zYUTcNKyWOqfSbnfb26EGYPXGsTYJI9wbe4UFYhq2ps2a
	 pFDZIo9frRuc8HPsXWKCWuuDSTZMzr19CGDP3wJiaPNvBo9KeoOPf0ROpuYBgaUoYWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hi3VR8f1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A44606EEB2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A44606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hi3VR8f1
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso81066e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793925808; cv=none;
        d=google.com; s=arc-20260327;
        b=ev7AOBizghRsigHA/WZjxjeAkcJCAhtjJnlkirnposD8C3h2FlYMqFodCD+M5XM96y
         dd8tp5r34Il6IOWDFa1loqmbgoAa8nlyVAYfTQ5AnclwvcGHXcWB2ISrYuS8PddRLC1X
         ZG3vqecEHdVVSbdMU3Po5GO7p/qWV9AVRePd/OVzKzeE8wjFE1alVMKsfBWcAhGN94Go
         8C2+REkWtIrYs4wlEt/wCw4PUReH0+/a2HJafdOVrovIq8XdHAH5JceAxF1slbtxyyat
         Iw9wSb6+DNWT9vPSkJmbNqDl9wRHo6g7OJxqD9TU1f59Zev+/az9h/xutk539kZxZ8d8
         dcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qjiIc9YUnEoIVWcKqPZO23DxNrAI/hQv4scM2zT69bw=;
        fh=xYCAIMe0QJ4TKOz3R9FAJ4RRZuZxJqn3ReVtpZ1wa+s=;
        b=nfEfdqy4fxPIcPaJmt1y+dm+7Mglr+OYY7zDqzh0DVu+nJ+lzn5JyUZbAqJ94DPUDd
         UMJialaZecQdB5uAfW9IPOhnt/ZWN4o0JVaTFJjEg6q/F24DefIPlyhbcsOIzzagGqGK
         DifrXbG2/5uLU2grKsq6PCUmlSq7scC9Rur5UC2eME13uRv2gkndUrVrx61j390FZgXR
         C0c4MeJIYGG348lzAU1xBKnQ+O2SXVQ9SpTDu0HpM39et0X8+reH3GWZVa8wquAG/udv
         5s072BDgvBUK1J3EoOiDnO43l9k6uVrsLv1Pn+MITi9VtPIqMjK7AklUHtXRxHF2BzP6
         Z2CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793925808; x=1794530608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qjiIc9YUnEoIVWcKqPZO23DxNrAI/hQv4scM2zT69bw=;
        b=hi3VR8f19ljxLMo/woOrQIC0BeUowZpIXobmdibAOPuK8DY9d+cDEZHbWIqWZhE8ax
         krsw/pPZV6/lwTgmi0R4CS95+P9GyG021vf1BBxaJ/mEJxesPELhgXG6KgRFSpjzY2J8
         lW/hOrK862rc3REFXgxUnuzxlB0rgs8kGUb5Sv455YgwSm6CRd899yk/UMyh82bFf2O1
         w6X+9XpQYDienE44sme+aKMuw2GODQpPTDdN/dFZnqDG+Cact+CcYlcbYu+cmABH8XFL
         Kqg8Dr3SXndSAXznmUaibxofEixLdLeGSlUvePZGQ26JOh3X9Q1Ak/ImzcGiYtqlQztO
         EbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925808; x=1794530608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjiIc9YUnEoIVWcKqPZO23DxNrAI/hQv4scM2zT69bw=;
        b=yWZw0H1qPCoNjLNSYKP4PfC0LDJ0+canlrf2OsQ3yaebjZJ0NhFK8GOFt9qu1N3lh3
         Lf4XFpkhZjL7Wf/ZU686nTm9htPIf1dMopsjQqrT5CmrX+bxta5PQgQPm8B7RgEF5th2
         hl35H2enyBijrqktwMa9DkjBODqt9LFScUXS+flDPP4TtALi8AMBnnUk5yk5ENQkYssF
         3wJIFvNdmVN9LgakNVfaDH/MFB0GjIVpn8vYbzq5Ykb4Hdq8LEu/KdGIFM7hD9xHgLB5
         3JRjdXnR848YamiGBHT/hsJFAXLu8YLLi/hiylTl4qLL5lOKhMns6nXzDzbCOrrfs8Hi
         NsWw==
X-Forwarded-Encrypted: i=1; AKwUvByQygwWdlgg5eYONj/VcagvKsQEfacVmWnh7kkwcdtio7Qu+9FD7BsNXyLFxFOVy0CcZwypMYjDWZybgkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3iP3L4L8fPEYHTw2+ez6Ib4n9bBghDsCEKlzvpBnsNbug6JNh
	Ple1KBbogaj4fOOxUrsdUua89soo1DahfVM9jjRmqfqPl4BFczggKxqg8hTJF98W2V6XNIC8XOx
	4XIpPQ57tj9lXfsvJOxtnl5Naet611wc=
X-Gm-Gg: AYBFou3Mc/81PaoWrAOuBBc1IxxpsR9kHFmO/CZG2GT6+Q0GDx76PDxBNP5nUYGFVXP
	jsHZHDNMZFK0HJIvP0KyinE3ldjl3JlzdAcsHB0U2nqcXdQ5qjoNB5jr/O5NRBMtOsbT0x11rMP
	GT/6OAnDDzyBijn8IOk3T1IykjWP1IF7G3Xuc9FgEFntQSYlKbZ42Qg3AfTAhZe5nDOMCyLGkRN
	auasfMNdfKPROyRW1w3NKWi1duW+DJ/4P+2LNYccfGWY8ThPBWwmbXycW0dUPoGsQfyO8vC/j5P
	mhh2tQOSwn9aLiYyFdCWknRhKGBDR5vSWpWiLoR5SuKmjmEy1wrj0r0v39k/qBdYl7QnmeRKJQB
	wTfsXzs9ctHUDE492amoqDB/e2Oy5hguwkgPObE+De4ZtU9/HREEobhR6nwvPrvfVl/8h9YTxn5
	IirlhYVgGmCl1ZAnjm
X-Received: by 2002:a05:6512:b88:b0:5b8:eb86:7ab with SMTP id
 2adb3069b0e04-5bffa14052emr1230702e87.16.1793925808122; Thu, 05 Nov 2026
 16:43:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027032332.1945140-1-liuc63@xiaopeng.com>
In-Reply-To: <20261027032332.1945140-1-liuc63@xiaopeng.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 6 Nov 2026 01:43:15 +0100
X-Gm-Features: AclHuK9dRbLnxECgRD1l46eIc4GQ22vJU4NjcoMmUKgwsiEbNqgmSBWhyJwPnKI
Message-ID: <CA+fCnZfgi_UUsMg4p2iRePACOAR8StQRYhgC9fHETE8Q5n0z5w@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: raw_gadget: fix dangling ep->desc on enable failure
To: Liu Chao <liuc63@xiaopeng.com>
Cc: gregkh@linuxfoundation.org, krishnagopi487@gmail.com, kees@kernel.org, 
	balbi@kernel.org, zhugl3@xiaopeng.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:23=E2=80=AFAM Liu Chao <liuc63@xiaopeng.com> wrot=
e:
>
> raw_ioctl_ep_enable() assigns the user-supplied endpoint descriptor
> to ep->ep->desc before calling usb_ep_enable(). If usb_ep_enable()
> fails, or if the subsequent usb_ep_alloc_request() fails, the error
> path frees desc via out_free but leaves ep->ep->desc pointing at the
> freed memory.
>
> The UDC driver may have captured the stale descriptor pointer during
> the partial enable sequence and may dereference it in subsequent
> operations, resulting in a use-after-free.
>
> Clear ep->ep->desc before jumping to out_free on both failure paths
> so the pointer never outlives the descriptor it references.
>
> Fixes: 97df5e5758f7 ("usb: raw-gadget: fix gadget endpoint selection")
> Cc: stable@vger.kernel.org
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 46f343ba4..b52ab3ce7 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -886,6 +886,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, u=
nsigned long value)
>                 if (ret < 0) {
>                         dev_err(&dev->gadget->dev,
>                                 "fail, usb_ep_enable returned %d\n", ret)=
;
> +                       ep->ep->desc =3D NULL;
>                         goto out_free;
>                 }
>                 ep->req =3D usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> @@ -893,6 +894,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, u=
nsigned long value)
>                         dev_err(&dev->gadget->dev,
>                                 "fail, usb_ep_alloc_request failed\n");
>                         usb_ep_disable(ep->ep);
> +                       ep->ep->desc =3D NULL;
>                         ret =3D -ENOMEM;
>                         goto out_free;
>                 }
> --
> 2.50.1
>

Commit message should ideally mention that the use-after-free is not
actually reachable.

But the clean-up makes sense:

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
