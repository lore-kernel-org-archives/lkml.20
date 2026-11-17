Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878344;
	b=MT86HJ66VrPmZkPnxUSV39SFc03mu7Ged5XR3usc73XxjXfZQuxyBWLxrqdoB74U45C0
	 W9JTXn+Ec/lu3iCxXJvToKZem+EukG+VrrGvbirGqDkOHALdk029bbE8JHE6SXRnpFdRZ
	 c58i52BdEtt5q7ulSarxQNDARng+fAAepI5L37InxCa+mNEXsA3Ze6oi1i4ZfL/rgNzQt
	 LQK+NoSZkFUjN2RSkEj6rf5+TkvEwmCCAjcrVnG5BRf4pVpe2lk4nEHsT6RYMs6M2Z1Ru
	 V6iAjmRda+U3nFhAsHlPNdpLXwUbMU7IFLc6YBSmPUwTax8jiIeqMKIJ8VIw3nXcmxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
	b=UUL9arid3bX20RCG1k2Cf4GINk24tbDF0bLhetbDXk8gt8teVqQRu6uRxMxDQdZupj+A
	 gLNx6hMrUOpzqozwB3JZd9KMySNPtu0zTWt9G9ONSfTJBGWE/dBvSAFPcnyAtxc+7zprX
	 RYmoY7G7uTgI8w+RqnmX7UnsrqK2q/5/7n+ABIe90jeuBU+V/ZfySxjz1hbi2Dm1j0kdU
	 q2SkffjbMFTAZ4BP6WWsnzVmQX6+t+ZKw7jCRWWVsqFWl8Nzg2Iwm+nnH4pIRszqy1SbA
	 9R7Wha3qkrW/ReMuuHZJRf5DUh/nvaP8IZo8iOulVZFwwNrWxLPBINPUoRYBPN/eAnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1sKZPNT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B98606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B98606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1sKZPNT
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so36924331fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794878342; cv=none;
        d=google.com; s=arc-20260327;
        b=Kt+SwJvJKME/Ck3exV58fHyl+kLVjd8USY9Tp4rMgasFH7jpiDZtTjzJd3NWFzaAbv
         KDOYYNbJFT3KFDda07xpUCvOrn/NRBM2zhR1ye+/I5HuR+IPWR5gYG0vjRYt4yYwchr+
         XLmbSbaN7yIyph2j6eehjVUgm1U4LxRNT0Et0CKJutzBRzeDJT7b6hNEBkK+jowQDsV5
         zAUeRP2VYIMKJ0L4wHwgR1cERMqA9ElH+ndDWUn58kWHqQ3aSCb+4QH+MqkYGKQlCKas
         z5G3JIqVaQYtDl7ihAUKcEyu8uJKgIh1/PWD5Afd+5pnkzaMJwuAcKzDqx6eCkepLYSN
         SqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
        fh=cZak7WtyyzJlYEEsg3itoVJPmg+4HknBcLb/Fi6hsqM=;
        b=ocFCN4G+qe0+uYtL8lmO/CLGFt6gmyJa++t1vuOBL/oXwlQmvcynjn+eIj+pvD17av
         jwDkiFkJO1M0GR+gJuD/DnTI0oSPmfzQEVl+rQZj+EOzI3qWMjh8xx6xOjx/9pxJHRd6
         S4BB9UWCmPKqss2b2aoUFhDZxwdORI8dbY/D0JXIQ/e+lMe/ZnXulNJ30wobv5LzmHZk
         rWGlvvyL4IQUZWramnRpG9Y10NBFLp14pPZFsZwl9S4XPcKCXWTZuGahWycTzkfutNbD
         qjVa2NfSF3QYtGHo7NIbpKpT3vSUJdjop+L+7oJRaxsn1UAXP6sW79V4M1V4o85qcEDb
         MHZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794878342; x=1795483142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
        b=x1sKZPNTBgI+oXYSIw4eVifpFiIzZkJlL4rlZLx3kOxRYR2UD5N33hRjLk3va6Vsrj
         M9A5MgvOKKavPDk9a3EXOmoKe/tmJ0kovYBdQCX9+eLE7X90MKvW1AMtuIb7sF+5akJd
         JJtuZGABTZhSN5r20zZx2JzH5t/DK8GNah2osDJvVVL8U+jE/pLKRX3DPNnA0qupZ+O1
         WPbReXb48AVxZRtZw2ExHTtIg2++XNad8/9TM6zOlytRNwQMEKZEO1lzJPotKKehBdV3
         JTkVviZDn6hP39W6ZoVO2lcMAU+nNuJvYeVX0uAe9Wo760P6h0fjCoY9xcbjJX71Eetr
         wBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878342; x=1795483142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LMIhRKsAqf7tkHd6CvCf8vX+HRhhWOWmXfOlVGA7zA=;
        b=T/fJRyTWqkDs4npqRlReTlr745WHiRcJpG5g3Gaq0tl923gY5pJ7lHjRLMIuH7oOuw
         UMJrXmQ+Xot46uhwxvzCYAbGyUPq8rRxZFHIGACMzAKgPtG7+LcfzC/3wU8gGEGxGHg0
         p1HJNC1pbassWjMFdOUnqHqnq2FSpV+P/CRDdk3SXBuBs1wlHcca+8x/SZCV0jlNN+vH
         theIjSiQanow3ZERlKPp82QQWaRcbo1RJaVVSK639BxociBhbh+zoh1QR9IHdeoy7Kpv
         FkLDXNPiiaoZQ0wmUzNRB6nzTSs8SPYHqla/UECD43dfh2RX26mZyReeVyj8WgkrooSr
         ymwg==
X-Forwarded-Encrypted: i=1; AL+hErEA6E840jdw3Y2omyiNqo2DUCaYn3uIj449Kd0EtvTGMtRa6KNXXHK1J2Hd77+v6TWY5SVr/csBXA6wISU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H/XEcXLU7B91KJnqserJIdgKqPCRcUWg197jDFzRUabS2lLuR
	1sEj2V6nT9MDWnfxPDzFHBUyZ7Ts9+qJROHDGjyWQ7pfAX4HnGgqBnXvJtCHp/dOlZ3J7q67lVg
	+Bf4OlQIRqmu4+la1E+4r4HVnKFHPKZs=
X-Gm-Gg: AYBFou0UL3PfX2txeIS18uuHrUwZgA7ND4QxLkkuV4hjwgLpwAVTc0k804mBEl81m5F
	abvBL5n8ylgcmGBKVxcpvgUy4xWmYLhyQnasLKlzEt5brZE3GOgpJmqASOZXmWRqkCWR7mGrnNa
	ul65LtICOUN4xK7htg6H1oo0ygMup1rFd9FJrl8pJA5ZBtYf5Msb5BKDQNDep/FXDwZNPxqNFyt
	9elnd2qOlixnY/nZLtxB9CzKsn3FluNezLDCUMvqxIjdap6Nu1X/ZS+6EeW4Y6gRbe+D9Q5zqSQ
	8Zb4uPrCyHgAeArJGLLmBrlgpq8tYmr7bcYkzy8HQiXGG66Hxjd3QWqUgV7lB0gmoc6WEN5Zshl
	Mf8kCnjtcan4B1p8v32XlwZXrJYxTYRanO+z+DpQmOY5U2l/Y17uZSH95L3MH7rLoWEs+bFsEjr
	eu+ZxqW1h4G0jR3/NFnxl6f1uxfQ==
X-Received: by 2002:a05:651c:41cf:b0:3ab:4f5e:3edc with SMTP id
 38308e7fff4ca-3ae2b4f0263mr32473621fa.15.1794878341861; Mon, 16 Nov 2026
 17:19:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260311194531.70441-1-festevam@gmail.com> <177344689795.3706356.13043407533958417879.robh@kernel.org>
In-Reply-To: <177344689795.3706356.13043407533958417879.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 Nov 2026 22:18:48 -0300
X-Gm-Features: AclHuK85a0wTDwYZkXytyVwys37e_78s3w7QVgGrJmJ9qPzFcQX4mkAQjyHnXmo
Message-ID: <CAOMZO5BdxG2_raZ--ZrrTn=_i2HKTM=pCB0hWi4+CBRno3DGtw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: wireless: marvell,sd8787: Relax length constraints
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: briannorris@chromium.org, conor+dt@kernel.org, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	johannes@sipsolutions.net, krzk+dt@kernel.org, kvalo@kernel.org, 
	linux-kernel@vger.kernel.org, Frank.Li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Mar 13, 2026 at 9:08=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 11 Mar 2026 16:45:31 -0300, Fabio Estevam wrote:
> > Commit 31ed9d9d71ec ("ARM: dts: rockchip: Limit WiFi TX power on
> > rk3288-veyron-jerry") added calibration data for the rk3288-veyron-jerr=
y
> > platform. The commit message explicitly notes that "the length can vary
> > between hw versions", as documented in the original text binding.
> >
> > The current YAML schema enforces fixed maximum lengths for calibration
> > data arrays, which causes dtbs_check warnings for rk3288-veyron-jerry.d=
ts.
> >
> > Relax the constraints for the two properties that have
> > variable-length data in this platform by adding minItems based on the
> > actual data used in the downstream kernel:
> >
> > - marvell,caldata-txpwrlimit-2g: 508 bytes (from rk3288-veyron-jerry.dt=
s)
> > - marvell,caldata-txpwrlimit-5g-sub2: 744 bytes (from
> > rk3288-veyron-jerry.dts)
> >
> > The original maxItems values are preserved as upper bounds to maintain
> > validation for other platforms while accommodating this specific
> > hardware variant.
> >
> > Fixes: 25f855413885 ("dt-bindings: net: wireless: convert marvel-8xxx.t=
xt to yaml format")
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
> >  .../devicetree/bindings/net/wireless/marvell,sd8787.yaml        | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Can you pick this one, please?
