Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793927289;
	b=woJmCHsjLjv6jxZq3RCOe4pFWegwUFZWuSCP2RG016RIxC/YLVHMZ0Ev/z38K0OVepk5
	 yXb9uiMOm1ohI8IgeO3aaN8iauhKSIF37tnbaC9Is6QOam3QJwQPGww08pumfVOod+lWr
	 L979r1AGtQebiQFcsXQHk+q99zB84jF4RfWCUFdantniODUOpP8zM/qDCNEP6cA6MEQKv
	 PDh9Rz3ukoYcCGBrqNSfzyaF/8IlFOQlvuSpyn10wJV1vmeYVhumid6KIIr4eeUh4LIfM
	 3Uirymb3MF+UAfoQhln2YomIcCoiOHiVw1UZDsNh/lQxJgu7JS2vd6miHFFjTIaSovw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fJkGz5CpoFWJRGd5AF5Qs6l5/HtOobvMGiH1ORmFADg=;
	b=ZVYue8QCM84/mhfgs88zVf+0kv9arj6XqbOEtqr/Lpr71VVZPHpyO/Qg790YFPC9Bqw1
	 fWjPQiolEyejbrDEIuVNtCx1etVo5JJDhfDGHzrasWBiIe28aIgti9KK9YHXj0P7jENj8
	 gN+IMoTU2RCtQEMFBR2K6Uw8GdjyyMKx1IsSqz8ApZskAkLXRjCdZHRniqprE0M2yT0zB
	 OB5ube7dV5UnhKVb81M5CTaEXl/T/J03IaFZYlSVEloMhxmNko48UEt1bnPSQe4IxLfUi
	 LJTDilFGHyB3GuGvtUXDVxTCQY+bTuRyUi98Dv6l4pd33tqU2zjozN1yk83qyVdVj1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mxfw4T5t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C478606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C478606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mxfw4T5t
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so549911fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793927286; cv=none;
        d=google.com; s=arc-20260327;
        b=oUQt0Gwlceev59pvrVhKPSs3ohjbStKRBFKpyaEVbrxGjXgU4UcxN6zBXUY171Jad3
         abUteOmdHWBvO6r1QasVtzHQQL90I8yLAYu3l04/CVbATxgkBcnoQ0neVN1VG4b6FRRv
         RIIJR00xgIH2rt2QaLplXrF7WylfuCDTGIl2153BwpjXjIEywTkZ7RMnxOlg+4vHyIuU
         bJgUKB4eM/T3+HydlrMBfjY4k8v9Bq9jA0J4SX67BmU3OsvNMIDBBUugwYYWQhJa/Q90
         PEKoGAy7KZWmG7ddGqdjm+my5kLlY835KqRUqE8BPPjEjCr6nveor14BwhROBDKNnGch
         PwFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fJkGz5CpoFWJRGd5AF5Qs6l5/HtOobvMGiH1ORmFADg=;
        fh=BpT0Q8dvx7DtneMS9oj1mv3Q/W/eI1+4CnipN2ZL40E=;
        b=DxuTQPwBaDCUv8N7q0guhjXLKwZrBN10xvfYnW4P4QmxUEvtTXY4FOW8duYOQLuWrb
         FaAO2+kqVxw3PrVe/buU6iehr5JbeZafg22ctyXLFt5NweD3ODEtikpKkd5gUqSYIlcP
         DKfiYhNvcth/2/iP86LktUG4cZ2JcS/C1uf/Zfx7+/yKLd0nqtaqjYA0oMMhHMJRVJTJ
         YaaK162GS5a/l+E350M5Q8XIgSPOBQ2faUBZqc9rRMzEePeKprI1fSpKb/WUmt2/i5vt
         Slhz11zUf4aVMo7B1youFSWO1b3reJ4CF5E1hFRXyGHCG4tGkVE7d22YYSjKT1WO9kh5
         G+EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927286; x=1794532086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fJkGz5CpoFWJRGd5AF5Qs6l5/HtOobvMGiH1ORmFADg=;
        b=Mxfw4T5tUufe87vDam0XgzvAbn83pyWk6QvSJE5ic30mOrJRb0aQ/mUuC6oqPJiSty
         VZNyOvDCv6JqTvqXqKkMd0alCaqvsVd1HyPioR11hT5VRtb6oN7spV/F+OXFEruEM9h9
         4yzlD2DUbJkCwioK/FDxF2oQF/hM2518Dyd+if4nji/cGPcQhizWGSBB/8kluO502+bL
         0jX3tTT2LpRM8NnL2S0Fxk9st+vGpAoFzfvo5sLYVqa04XndUaUhvbFEDWWwHVI9z0EP
         9Wp50CG6j5LWcFLucKB3/tTjk5W83Rwnz9JEModvplA9A35Aiz5ERAVclQ1FNnZI3S7z
         evOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927286; x=1794532086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJkGz5CpoFWJRGd5AF5Qs6l5/HtOobvMGiH1ORmFADg=;
        b=P1KtAREsW812jLTox80lekH+GHA7UTIkXvIlNSvuNXDOO728o1SzGKl3HpmgbP5zEr
         aw0CSNdPxaAQbDKT7xTlFih2kuGLKpJzMCa+m4c6OsLBUNzB8KESncEAvmLijiU29vEu
         MTcckH3HYeD62MjJAVMfe3fQQkZbYbkbnbcf0WV8ef1UJUFGgP1qOxErjKJ6VBVBNIsY
         gMQot6IkcWZIO7k3UgMUf/moyPjx7ZrEfgq+pbEs0gdKz8kI4kFzmO3YtBJN7slUVBiE
         T2Ll5qilhbHu5tV12irl4m6MjzpS+pLvh6IsIzsjPimC+DeUDypzukqd8A2535LjzIIf
         B4Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzryyqMrIESZ4DAS5htAXPjU1Kmk9cn/TrttsHJ0zt8eSojjwIc6DVKwz9yR3VFwRkyzPTv5kkdg8Vr+BE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/6R44MyNK31b81NXJ2RvVYyhzIaNCdr3Bw/24lZZKUjpwqnLL
	MiqPVUVaom8w2EAzTc9HhUivv7YzBSWjigyY9UbZqyBzTRpiRfgKgXBS6vYy7tOHjpgEW0tBVeg
	k0Cd/DKU/OObQhfiT5mOy1hSkbxGfeKA=
X-Gm-Gg: AYBFou1ZTjqJq3A1TDZvogevvoNUrxPMj6/5/A4zFrvyid8/03xpMCz7kw1cOGmPCgZ
	A58L0cwpyHmrxwfHY0yY860KPzM88fpyr9/suGm9DfPzW8sQFOkVW0D2xj6JBpM4E6/4GAxD5cD
	Dh/iVs4XWtkvwM15G5SFSHIegyLWtQI8Y9JLZW//tUaRRFM1ZouQmmf8Y5K8C2ZAPLpg02YVv//
	Y+xBWc1G/IxHOdayjqZo7YWpMGAqzozndjFAsDLMI2m4FxAw1hOTcL5ZfBA2yZb8vyFRb10MFxs
	VW04HB+gH1VF9fZ2gTNi+A8DM9qciiPMJehELYL3FlngfoFgyJfRC+84VwBdr4iAxccv48HKfzK
	pEfNtlO8LpMecnN/HWVoq/jVNqO5XqqFsghsRcy95e/0TRty6OT8udsgXtK2Pcn37xLb3Ay0=
X-Received: by 2002:a05:6512:6d3:b0:5bf:b249:375c with SMTP id
 2adb3069b0e04-5c003ac2cd3mr230843e87.13.1793927286155; Thu, 05 Nov 2026
 17:08:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027032332.1945140-1-liuc63@xiaopeng.com> <CA+fCnZfgi_UUsMg4p2iRePACOAR8StQRYhgC9fHETE8Q5n0z5w@mail.gmail.com>
In-Reply-To: <CA+fCnZfgi_UUsMg4p2iRePACOAR8StQRYhgC9fHETE8Q5n0z5w@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 6 Nov 2026 02:07:52 +0100
X-Gm-Features: AclHuK_GOq5XW9qGIOfiza9qDe3tNSjEThoOLcatbbltrIx8xUgFUsgaRXZuPqI
Message-ID: <CA+fCnZcH1dZ3=Raeh3GkQt7vfqdhKtTq+VcyhJ7Ks2ZRcV_dgw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: raw_gadget: fix dangling ep->desc on enable failure
To: Liu Chao <liuc63@xiaopeng.com>
Cc: gregkh@linuxfoundation.org, krishnagopi487@gmail.com, kees@kernel.org, 
	balbi@kernel.org, zhugl3@xiaopeng.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 1:43=E2=80=AFAM Andrey Konovalov <andreyknvl@gmail.c=
om> wrote:
>
> On Tue, Oct 27, 2026 at 4:23=E2=80=AFAM Liu Chao <liuc63@xiaopeng.com> wr=
ote:
> >
> > raw_ioctl_ep_enable() assigns the user-supplied endpoint descriptor
> > to ep->ep->desc before calling usb_ep_enable(). If usb_ep_enable()
> > fails, or if the subsequent usb_ep_alloc_request() fails, the error
> > path frees desc via out_free but leaves ep->ep->desc pointing at the
> > freed memory.
> >
> > The UDC driver may have captured the stale descriptor pointer during
> > the partial enable sequence and may dereference it in subsequent
> > operations, resulting in a use-after-free.
> >
> > Clear ep->ep->desc before jumping to out_free on both failure paths
> > so the pointer never outlives the descriptor it references.
> >
> > Fixes: 97df5e5758f7 ("usb: raw-gadget: fix gadget endpoint selection")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> > Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> > ---
> >  drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadge=
t/legacy/raw_gadget.c
> > index 46f343ba4..b52ab3ce7 100644
> > --- a/drivers/usb/gadget/legacy/raw_gadget.c
> > +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> > @@ -886,6 +886,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev,=
 unsigned long value)
> >                 if (ret < 0) {
> >                         dev_err(&dev->gadget->dev,
> >                                 "fail, usb_ep_enable returned %d\n", re=
t);
> > +                       ep->ep->desc =3D NULL;
> >                         goto out_free;
> >                 }
> >                 ep->req =3D usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> > @@ -893,6 +894,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev,=
 unsigned long value)
> >                         dev_err(&dev->gadget->dev,
> >                                 "fail, usb_ep_alloc_request failed\n");
> >                         usb_ep_disable(ep->ep);
> > +                       ep->ep->desc =3D NULL;
> >                         ret =3D -ENOMEM;
> >                         goto out_free;
> >                 }
> > --
> > 2.50.1
> >
>
> Commit message should ideally mention that the use-after-free is not
> actually reachable.
>
> But the clean-up makes sense:
>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Hm, looking at this more, it seems that the UDC drivers that care
about the value of ep->desc for disabled endpoints, NULL it out during
usb_ep_disable() themselves. And other gadget drivers also don't seem
to be NULLing out ep->desc explicitly. So I'm not sure if this
clean-up makes sense anymore. At least, until we get an actual
reproducer for a crash.
