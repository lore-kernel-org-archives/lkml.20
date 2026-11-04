Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799450;
	b=U6PvZfRapAVSlfsHQ+HxJblgssqtlobPYCMSoY06jnTd1bU3lcZb/DuRj9NlGZAPEGME
	 SWNrlCm80U/JYuegqAWpkMceivJFPyyGC5RGvtJ/wSM0N+Ohy6Lp2zfauGX5TztAhGIHk
	 HbipiKlFcbDaWkKbVVK+YMahfQ8fyMnvJkPvM1cEz29jgOzWN+v2yK9zlEspTvrEdfBmb
	 jMehA3ozfdVybMm/YJl+6R/umVhuoWjkXzV6Gfr78X8YtY67x4f1TgwsH43Saf3Drn1ET
	 dRP/kUq6sLOSJlO2cPlUcgNRkxlon5wL8h3bVGKewlWmcFIPXN44gxwoNbCijMTcNqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
	b=G2vlzWIhcUZcEjqs39DE7lNQRImAtFhNbuxlib+8YmFW4YTnOASnr4fu0PW8LQc3hpoK
	 s5Fzmjt8+YJUjvnj4zQjitEqtndbEL7c05BlGbJW7Ycmh0ZB9Wm1d2dyysYr9hDTNU3bQ
	 U2lTlTh0klXIcSXBkGxujegnCF6eJT6NaVDs93kY2SYXMCu3vOwMtTSHI1sO02q7upleV
	 shDgwi9WPBs3O9+/K53uWJWprZyUV4T0Bk0zoXxRDn2YzEnI7jDxu0J0+tRSMp8EKbXxl
	 wsxSbrTxAqNes1esAr7JlBThNL/NOGuY6KfqiB1ins1LcwFwHVeAdOsbzy4ReC1Z0/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbJKKYLo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEAC606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBEAC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbJKKYLo
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-82380b0f55dso294886a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799449; cv=none;
        d=google.com; s=arc-20260327;
        b=EU1WFiJZMGSvHT6+p/yCqcMsOCo7gjLccXC1XHQAVKG1hgcNHKF8YTLVSibvQyT2b1
         wpbERFCOAiceUehDD937i7fakpmLzOlsbqvf+lNzQD1+BZruqqviGmNjoAPpEOKK2L32
         T7fbQRg+YyuCwJ/DEBUCOb8PTpbUo5k24Wgk6Cczg181hOHwWFu4MtJLOWBMlQ9j6Xix
         JOsr7RvYcut7iy7FQZyptwdbrCn9EO31jsKiSEfKyTcRVrfsEqenaSUkuQzx9+TIYccI
         NAy5fRvpvs2jXoH15XRtNUfXbko6IGbqRLRZJ2oHW2n+VV+am44Z7rxjyhQiQVIsFOvZ
         CX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        fh=yVrQbj03ylc+Wvs+8K1I8WnrfR8ArGhTV07uzRaZ3tY=;
        b=SJtq3a1EuR47UF2FmNRr/GDvcHMJnKtIpvJBGhMzy5mMf82Y0+R1BnoZ+ZaR/bJX3w
         cs5Snopxih99yZXJ9P9tlDm0m08CmM9RuguIelJMPPh5wDjqYOSOhdOscwHzp4ybhqHC
         9ahfSx2bCYexQhl6JJ1NUiCXgjqvXeZxPy+yDgAxLrCRYxPZteeQg3hffmQTQByj7dTP
         F185ng48P6lOQ5pS27hihXOggm45/BDM0FF/mxjRf4gtwRBTaR9kVomSQdgNID8Cphgw
         v8fWY4addtU10GxAaHBcffuQZEPMWBFz4MOmwzjZvkKmJeQXWnNj7J3IC1oOcEl/vCho
         5PMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799449; x=1794404249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        b=HbJKKYLoRFTbv88+u68atuiDsGsfEkhGD9eTclvuReNcQP7HDpMEPxVstZpud3wUT6
         md2aFf7Jl64Aqg2kr+73B+6+DSf7K3bLWhJo2zrkqk3pqlIOsIe9A5YSq6/f+UixpVjh
         VRGj/VMu4gDKqlk+/zOSkVxDRi+cM3RrjL8MChQV+8pukxf7tOoKwoPrgN0KaLN3/Xqh
         kq6Z4jqJwJb44vLVtS61kwDPbUN62SiGYDeByPHe4MWzzGtGKyBbmt1WBYpY8S8p/OSP
         kyeRQA0DrCZ2eFtyujgQ1eNKJGAaCSgkM9/8eaW/Sa5cyU8h/0N2xH4wH1qcQKuV0PSu
         uM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799449; x=1794404249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTyqhH9cJxVsqLc2y1LUsJWE4gN77K97C9Wv2c9HyzE=;
        b=CwYHuEuTJdQkzqet2BIuUwAY5X076o+AP3HunlkclrDzj8mnj5VcxUBTExwJX8LlUS
         UKl8pur4690NlQ15HXRv5Ojf3Km+dtae+tfpxX0e+8QPGcjHfu6xTC6em5ewbISrDRif
         Pr7LxKqmInKb/mi9F+oMr+pxdTwc3BEaprEZUb5zq/NH5H16EStrOtvInL5l99insILK
         pt2S+WGYoUhiL2bv0OEzZ9qOUl66Xeiatx7o+NzJqRUgCQdZAAwiR/+FsxyvhcETWmkt
         wRcIP77b3SUrEyC+kRPOxbWYmd+jhJGs6p9xkxUPRTvRmzlQ6htYscLxpbrtp16+Nved
         0OkQ==
X-Forwarded-Encrypted: i=1; AKwUvByZNTnV7RCv2roaHsKDgDUVzhmsUi+72RtMRP2adGcVBXwqx8TVpaCDmJbCvFHPzKSC7Tqh+iiGlCWwYag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+MSAnl0rMfrEBaNEkTya6dJIcuYNq//rG57chVV/EaAp+Bb/i
	E6BviB+RO2XXFvy5uhla8C8dO3zWkLOx7FwNKhqDQkU1C0Lrcdobhok0TYsBr0lKvDNUuhI1Dgf
	lwGgfN+nlaswX3nGJE/4pjuQy5Ap8L9MR7yQ5
X-Gm-Gg: AYBFou3pjJquxC5nFnXKg3ja3Jy6+YdWnjARqYBmELTKGtU8pNdayNyP+ZxPBNh3fRv
	GQw0zqLLIZsX3cg2u1uw4KzveSJjRQCDefVmDgDd19ZVnpjirxrEzihCZKkYUEEKueNo8cKCfMC
	HlHQOopgH2JLVkN+tPz4wKvmxdHB7JJ2KKKADb2k5SO/5dyF8cU4570KJbreZYonU832ryGl73R
	5kTIhY26K9QCjhovG19nuApoPfwa5F7sXnJsI4AxexOoVXc5irwboiKsxFlU5VEimggbOtnTOF9
	Z8ttXZKYUuduD6zP511i7s2VUYAY+PMTtMLL+7OqOvOPeCFXY5iIwmxvXKLfJAS0jjURT09TTCD
	TXmmHr1/BlHry8XARboPZ0Q7AjckljyyWrNuA9kiv0kfUnunKbqHxh6zep2Nvcc7ksMmHHpZHnI
	rSiVKc
X-Received: by 2002:a05:6830:2a8e:b0:843:ed9d:1535 with SMTP id
 46e09a7af769-85eeebf194dmr2565221a34.19.1793799448718; Wed, 04 Nov 2026
 05:37:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
In-Reply-To: <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 4 Nov 2026 21:37:17 +0800
X-Gm-Features: AclHuK8-JeRODUOUq-HqZqaALo40tyoUFGXYArDC07Ims6VRBqfkF1PB6rfGKec
Message-ID: <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: joseph@telaak.dev, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Nov 4, 2026 at 5:25=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
> [...]
> > +
> > +static const u32 sf19a2890_gmac_resets[] =3D { GENMASK(1, 0) };
>
> Are these two bits separate resets? Are they individually controllable?
> Why are they bundled into a single reset_control like this? The commit
> message doesn't explain.

These are reset lines from the same IP block for different clock domains.
They have to be asserted together even though there are two lines.
See nUARTRST in [1] for an example of PL011.
The gmac lines are for two sides of the same async axi bridge.
Asserting them separately causes a bus lockup.

[1] https://support.arm.com/documentation/ddi0183/g/signal-descriptions/on-=
chip-signals
--=20
Regards,
Chuanhong Guo
