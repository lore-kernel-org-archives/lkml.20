Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793816940;
	b=cMQ9BjV+jXaWtr3CwSasZHvBWBqNLBdbTmZcPJXoCd0RbPZKg3T3N8h+taQs69c5np+N
	 SEkXulJM+g5aXZeKNVJyDtmyiv3HFrzOxqEf6dtGPRmcRsC0sQiE75Itz8vdzAUdqyCuw
	 aBBUJ95mWihC49C9phqpxJn8ZJBtW7lztsvL0xngq6/fBJBs8t0kwsp2Z4sLOVmy9Seta
	 odla/mNMe4DqsgWBibnMCBHumXtugpW1UPlihHEbtpq4oHbxGNcWPhNKdcRC63OB7kTlY
	 z1SxifbsuOAjuym+AsChQIMsXHCTb3kUJzKu17Fk5gEpwfVMdn+OGoxYLy1ae1I/NSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
	b=ZBCmzs0RuyPocSP+vF5Cv6A8TgugWrbwUabd3Njhr4cVrnhaX1p891uqaMoLMAYzzJ4W
	 Lf+djVtYpqtzsaB55CBe1kTPXj1v8X17UoTZdr7WKJVJcB6VFTln/XWe3OCtdHuClhup/
	 /XgdaK3tVKE5kT3auA4paEesIMGFLS/j3KIB0r0louWuVRRaQ5IXoe6agUN87uhkMdXFP
	 E8rvT8I8J97mjNp7etW6BnQoRJONwmHReQSItBaSk0TZwlg6Sq91KZ1ni3IYsVvVqym/V
	 HrBEQIKIPWC9Ev0w6hK/gI1EqedI9z2lHxrsOzxHy/35ZOZpBVHeClYIJzwAhNomrIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l2lZUqHx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F6F606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F6F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l2lZUqHx
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6798af41644so906063d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:29:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793816939; cv=none;
        d=google.com; s=arc-20260327;
        b=UNkjQybTyhLCEM/IwcImt+BdtyOxoNaSlMJnxkRDr//dGgxPYGjPCU11h3+3ZpKEoa
         4V7hXjeAYi1aIJLIs83g+BVQHi+mQ7J58hHZCvm2M9ejRcgb2kbTqSS/T32kNa14mlAs
         JxPunw4QbAe0hZn2jET+qqEyUPaJskLks6oBHYvcyNHEYuLIItrtFdpJkhRN3nSqr1kX
         lJttx3gGYi2+kfcvQdaHEJtDFLWzZeApGWNtHhGy2S14+Z0O+CHAZEEqFFng12TwMK1j
         iSPZ0XQiv1AWrTErr/eHhtEFhZbWzo9v7JbE4EIb1CkcovhYOdczkki15LTiIQX9TWGT
         NvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        fh=eMRneo84FRNcEViizGlEJ1hjYUIGzk9kPnZuOQFx8uA=;
        b=aCk4fTQrsaH46q3DLdgVyBlZ//jiLDeXgy/GDUetgPyEgLNU4iU4/+77z8iiLYtuW7
         JxeGHQrqfdqKTCgEIp/hjm+HgzfkU0aYsPHkTE9PBV79Gb4EZg8oiNuDy0EAbVApD7hg
         LU0Rhs5+Dlzzu9PvTp+/OkWDwlta57LOX0eSgUQd1UCvJdi793UvjUV04ogAzqEu37F2
         xeXCbXsGRQIWosPA2ug+B52M1rdHcgg1HV+5bTI0pnbi4GvAxCjpVlhCO13+JnxnRgkN
         DGAC4W16YQtfKMMTsq6EAZhxe7pbrkPn6yD/yuxYXeV3Nhg6lFFE4opnjjd/34Cs9S6w
         P6Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816939; x=1794421739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        b=l2lZUqHxKUw0nVrkuB7yPry8j3h//8yuowAAoRk+iBZEM4cUm5HbFKEqIhFTekpFo9
         YufDO7KmNAtlily3UOzkmSHWL+3d0+fRhWAi1qPSyQ0d+DsyIYR8LPKHgxf4bVh/vVfe
         gimWuz1KFm1KglmAlXKWddzo9OO+rLUzUK/Op1fEQzaNNNI/hdmsBDxPQXYr8qzFFwqE
         ADj+WRTqWBKhSdkqk0bPE6w+KPwFcRgXT92mhvhuUz9dXxo+l/+tbMAnR2qWkDkmhKdt
         B3/ruallS+TloRVjzjVD3SwbMISpmzHYl+s3+6fkb+90pMguBaHZ8+mpjFHA9jB5wVkr
         rQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816939; x=1794421739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdq5Jhzjm532KgeiTAQzmaCt5J7t13cAH8v0sEUsNDM=;
        b=zSwV8ONASGQ7s5s01SKBbqVxYVryxz/mhTI2bhizaNrAOyO6l61KgTuFcCg2Oh5jaY
         3+yZZYUh5rJyTDHJU61tbLSFqYhjPmPJcAZKgAkDJGuttqBkrjbKmW2kzCnm/a5l7cgR
         5GUtQz4NK6wI14AcgBdmpD6+GKb8necqu4ty8AMr8MeMhSY0gkzFO90ZpHkfg7QXs4QY
         D14usXGAT0mXKzPiWd1nBE7BKb+OmjVRJ/ziffD1r36KzKEvy1+f4ySUtrXIDDVTPXsU
         grSuBM5xZHgwjWEHoVvXu00jbsf0eOALN//vBF93AiMn0NVqUp/ysAcezTg4mHmetwkh
         fHQA==
X-Forwarded-Encrypted: i=1; AKwUvBxs1WsoMQfiSm97b8azMNu0ejF4pcXQ0/TX/8wlksS8ZThQaIvTsymOxwTrwXMGMYzIaf6SoxWLIzDWJYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ixmQ0OwSUaQQIp2CEuxoF7LUC0kmWSnVFJpZW/5+nW0xqTajk
	EjboVxL3D8PHlB/der7xFMRK6sREo+akKnxOv7UnOkkqcAIxRA0PffBPbTxip2LEeblx0xlm3yO
	d3qguEVKuv7/SnVHWaMT1BrzUscUG76Y=
X-Gm-Gg: AYBFou0mSyCqxYF9ZOn5b3fkGuUUxoM3Q5skWjsOJlqYbej1UPo4qJf82K2cf3Mq9xD
	vDXPKHD3GFwqevFD8bUgvcPvr6PYbiEKPdbLEYIxbhphmC3SYNT3oZw6N6YWMgsl1MQCpW20bwv
	IKHjN5kHVILYkm/+D1s/gHMAibs1jA8oNNhqcmexSV4fOWSbSgUgEYJhmTK8S6AI1vuTj6PJMuX
	VoopAnEGcKVFzDNK4R4mbcpRmQbApWVVqGJXCVy9oVxR1GNFrsLWGEz4493bXlp0SfBr6Hly9Yc
	2PNgAfbVtwZVI7Prw/ZReoGSbrnEoYuT6biis8h5Sty3WLSUCZgU/8Rip5+NyheQrEyDWKeJqDB
	49+H9Y7h0lPLW5zqMJvLcme9TAcEk1EV8JrDeUbSgMgsNuP3GpFOJpFhKjEs=
X-Received: by 2002:a05:690e:1c1c:b0:679:9340:acb6 with SMTP id
 956f58d0204a3-67baff093ddmr11231324d50.98.1793816939248; Wed, 04 Nov 2026
 10:28:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-2-36722421db6e@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Nov 2026 19:28:00 +0100
X-Gm-Features: AclHuK8q2ZYeS6p9RTAqL2gmNJFu_7rEVvUOjm2KNLVXYzJFGgWF-O5cRxqiuAQ
Message-ID: <CABdCQ=NH2NDYVXvBFoM0k-Gn9XB=F5FX_y+uNomjTCb0TtpqFg@mail.gmail.com>
Subject: Re: [PATCH 2/5] clocksource/drivers/spacemit: Add K1 timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

El mar, 3 nov 2026 a las 11:02, Troy Mitchell
(<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
>
> +static int spacemit_timer_probe(struct platform_device *pdev)
> [...]
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;

Consider using dev_err_probe() here for consistency with the rest of
the function.

> [...]
> +       rate =3D clk_get_rate(func);
> +       if (rate < 32768 || rate > U32_MAX)
> +               return dev_err_probe(dev, -EINVAL, "Invalid timer rate: %=
lu\n", rate);

32768 looks like a magic number. I'd recommend you to add a comment
above explaining the clock rate bounds.

> [...]
> +       timer->sync_us =3D DIV_ROUND_UP(3 * USEC_PER_SEC, rate);

3 also looks line a magic number that could have an explanation. I'd
suggest you to add a macro with a proper name to have it properly
documented.

> +static const struct of_device_id spacemit_timer_match[] =3D {
> +       { .compatible =3D "spacemit,k1-timer" },
> +       { }
> +};

The device tree bindings support both spacemit,k1-timer and
spacemit,k3-timer, but the driver's of_match_table only lists K1. You
should add K3 to the list.
