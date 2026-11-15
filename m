Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727926;
	b=I8sH3BIXLWdRzmvNMUYwkw7/iOyxiGIV69JJDqOMnCqz/wcOUdlMi9KBg2esTAWNL+Pp
	 Ay3jQayNL0kzX9NgqerXUHs28rxHSMPn0k1K53bduXSUuPs/wwotAKX3yqiWMUmzn+BXP
	 ryZFkcEqcLZIJaZB2OU1yTK46qmPydWUMgvzzkXUy2Ee2kCtOOIS9f4he47QSc5lSvc0b
	 /RRtfAjcSEzkbTYJLlbRhtYl94HilpgV5+a+NTDAFFDAQiWUnJVQpSJUgYQGQ89PZP8Y2
	 WbexvTUNJiyLJTj+qjKx7XYKcpcT2TPukVqRZSiuunhK8+bx4EW+AKUCsP+FqTm3hBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
	b=pCHEpTw1MxhHuCVb5tb6DvdfyWeeuBERrbZRPDE5saD70Zz/LeXvQTZlT9GxVnC7VXfJ
	 +mvxiH8lZvq/Skjy5zOq4ahju4ujHvEf+VFi39ngXCpluv4ZUt/5YnIc+rICIe3lFT5nh
	 GlpeK++Whr7RcHHfMFKbScoI0wID7FU5L0gzU8JSD866GHlBQQD4AIAPNpmkxAcRGSilc
	 QzFl5NMZLc1EyIcog/IhLK00Fwo+YPC351CqNgqpobPqTXYjnqbHELZuRfLnFZIh3L+PP
	 YzndSi5K32E/XpRvTa+rO2gTxfbhSIOibju+vwlU80WSw467Z5NC7km7J+BaLUgDN2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BFE606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38BFE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490a0e72588so1007623f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727924; x=1795332724; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=zGLp07qNJvhQ6+u0soNSdE4zISfLgteQxFDtiLB3+MHdU5R8cLNayQpDOu9z6E8HsN
         cokgnkhAr/wayCMP5a5YNMbrz8W4SjZLOU5BRZvRdWywNx6ylkAud+eGM9IO9xu5mMW7
         vNaai9gq6sOgHH/Plv7KLPJqtlQ7SNQhP8MwbOsiVY9oebQhNkQHqvTKMcZy20gw6VyG
         k7ZCwjq9cWqbqhlBhjXQDv7h88lCfGgbi6MypmIx2cT/mMVK282PdLi8Wwi9Md6f2p2U
         0P0GPJt+gXIMzGs33ytfrKjlEGV7t0Pg95zZC84eG54l5hQ2KUyeWmzxrEwtZdsEBCOn
         OqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727924; x=1795332724;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=OY6IpUqBlQzHmjst0YRRiSiUcRruQklcRHxqsY3l9KF4iD9zlHM9iCuDmUkpEVyITx
         HTGbM00iETp+L8vxn0iVuzT8Q3og3C03LZ8hvFeyK/FKdtWEmdqQ4KJ7OsNODrspmmD7
         u9pEL5essQbuO955ighff0TseKDpLFJuGwVFEaV2YVkUZHjMsGXR5zPJG1HF7L6IUo/+
         em6iFdtdK4ODNfqbpd8zmVfkQDUJm/Cq3QuOJtJ+v/Lz9ssH6Hr8ZSKYMF1KLp2NglIr
         VYE0cjoGnMKNUtHHwKg94rXBqTAJOylAid8Z2iVVvu6oo1wvUuEmyIN5yTdrBqly95RU
         mGSQ==
X-Forwarded-Encrypted: i=1; AL+hErFkJJj1fLlOVHlwaHxe7xq7yxBi6s8P43KXM1o3YboQ9ZN4BqhFzItbNKteWEhXEdVxa45WWOoS+ZYS8Wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/+EFMTuEuYd5dvFbnssE3+eUQstZ0mfWfmrgTOWQ4YvflszWT
	HJss4UQf+qMqjY6b0NF/u9BIOv2xOGitbu1kCivDA2TkEmSWFiC9VulJ
X-Gm-Gg: AYBFou38/W0PZkbvH0f16ViTGN0HyrGrTFOwHRm1lYk8g/D3SyZ0dbR9JKkUp82C6Nr
	EDdCmNmMN8Jd7c1nnFEm/EMScElrKxCSqhK5j19qnvpprlriJNhJC2gd7JYSFPPKlB0NrR8kDH2
	2RefVaQtwAYOr83XSGZFKsL6nCXyS3kAGnJozkUuXPJ7qv2wbMIKVoQbE/TfZ6X2O22WIJbD+/X
	/I5hnsxv4aaL2mPHsDiGTHDp2oJPQ6JEkp7tHhWqhSMHSppQ83hfPdpyQuh+1YrVR3iBbGdz9rT
	9GmGpx2pAMf7nLJBzN5hIN0OL1F/NtjjQwBqZzWxfhyTTOVyEBQldTxRIE/flel0FLBGU1voEn0
	qDLGjLEVlwlpwX8929LooxLj1ibooUIixJnVHSaevXc5PPkpOXKyXMma2WrwIHlAdepKwiJOWFc
	N912XPPpDWl6llAstJumKC1h+u12Ncp5vFPNrV7V/hBOf5vB0S3pYzVRedbIDFE3KppcFrPbY6J
	Dt2UHXhFhcgELYMpC1japZTVsYrk5kLUvaaI5pTZ4eabsracLnYzTFnAchNM940Aw7ecrLIWCbT
	TcI9XoAz9J3cztaVV6b2h3UwKlUBkqerJ+/N7rX3l95HflGL2w4Q+iFVWTpAdVVc3zaBk8O3LH5
	CQ1wdD+U5oxpV8nB7gIgBFirXOL/fZhpGS1ktHc/GKqGmllHg/51TiGrEuowy1628auYWPu9CAB
	hXkSBIfoFtLM9oLEbiFgSh1LpdlK30vcvS+Jxo96mcvPOg5lgdS9C1L3D/BGcKW3hC1T1Rrgmyq
	ygtrYzHwSmjn/erb4OyW+gbDUYCFKYsLzdkgfG/RyLeRl4=
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr146703185e9.21.1794727924403;
        Sat, 14 Nov 2026 23:32:04 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm183982925e9.2.2026.11.14.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:32:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject:
 Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
Date: Sun, 15 Nov 2026 08:32:01 +0100
Message-ID: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via B4=
 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > From: Han Gao <gaohan@iscas.ac.cn>
> >=20
> > Add myself as maintainer for the V861 bindings, clock and pin control
> > drivers and device trees.
>=20
> I think traditionally sunxi do not add maintainers for specific SoCs.
>=20
> Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> item instead.

Usually no entries are added at all.

Best regards,
Jernej

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  MAINTAINERS | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..dfc300dc1eb2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
> >  F:	include/linux/irqchip/riscv-aplic.h
> >  F:	include/linux/irqchip/riscv-imsic.h
> > =20
> > +RISC-V ALLWINNER V861 SoC SUPPORT
> > +M:	Han Gao <gaohan@iscas.ac.cn>
> > +L:	linux-riscv@lists.infradead.org
> > +L:	linux-sunxi@lists.linux.dev
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > v861-ccu.yaml
> > +F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
> > +F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > +F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > +F:	include/dt-bindings/clock/sun252i-v861*.h
> > +F:	include/dt-bindings/reset/sun252i-v861*.h
> > +
> >  RISC-V ANDES SoC Support
> >  M:	Ben Zong-You Xie <ben717@andestech.com>
> >  S:	Maintained
>=20
>=20




