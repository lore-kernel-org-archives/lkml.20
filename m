Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723835;
	b=AxDlMFoLi8hfYXOvwD48VgwNygUHIi2I2ejED1o/SYQHSnv7SmCJ6dcnVQceTt5JHu7k
	 TAwRlcf3o+x3qg8j2bTKAcUhtBeA30QLmRg/BKF5+OigLoBMnI9JMuBAOxkL280dsGgzb
	 K8weD4c8f45cDRagrfZUL/uTD+GmlC46XliYBL8BjqeqnATsHjviQak4x6KEeU2Bt+RHC
	 JD2n95G2sUP5xQZ1XeQZDHT3DQPcF+fDLYer8DiY8728CT3CqsVF6cCqvqwYnK8F44NWO
	 StU1JLGViRjdWUI8bnYrifLLMHHnC+IT4mEfoem6J7p24telfi6E/hzVNLowr/ITxUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723835;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lM5wLY70mAhEd66eVg7LK8p6PaCJhmOslbKIqWnTrnc=;
	b=qlWjt6YKBlD3RIpeX6PcBTupH3VSKsZ8nkT4xyao9EX+A9LvFsJgIa8Y/IfxVae47M9+
	 gio/xg6XPZ9npE3sfKMv6Hr/8LkBmIaNiXdHe5nfqjbqH2OC/W/em5FPFUBZyzUn3nYA4
	 0UA0gXGY2nmh4nzm4b8FY4fcWhvuufCBJSWz/yRF6omU5JsqDqajySdLeSsvyXiPlQ0gO
	 N5JOBszYCyZ9JfgGG3gOaM0eQz94qs8MpU5m2idcrX0fXvFu/Nn+0ZCpijAQWvs/sKyZb
	 /WTDdtO7Ymd9kYBta7X1xc7CQqZbEcZkwKgaQyp5vdcL8FRQ1TxpvQMv+iYZ+nASpEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48E606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F48E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so967552a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723835; x=1794328635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lM5wLY70mAhEd66eVg7LK8p6PaCJhmOslbKIqWnTrnc=;
        b=jAzOWMZwGxeln5r/16ARjO0pE16ZUSNTwKpHdz5P2NtnmlDxG+FjLu4gUdJRGA/HAc
         gqHMSUoZyYTkm08NmJt8Yf/hJAYWB3CKqX4+MxnFrKdsgZ9WxevJpgA9+vh05Zhbcx/J
         yoc7+HG2VcJ7RcmlDwYJPDCxEvyUDayoQWoA1GNNWhz5oPrOe0Rtol6Zug6uvOTiiB/n
         9fOHtrgxIginQXonPEWArgP6DiBUtOepE+TTiP467qnh8ptD8/zZdaV0VJWxQubG9bgt
         zi9RdnUexxAYB6HBjiSYm4msIrT25cZLfyR24qdegensxaozHA8BhDC/pd4IhoPpGTca
         7Ehg==
X-Forwarded-Encrypted: i=1; AKwUvByrKoIQ1GSOz2GrX2mEpT3SXsbHLC7Ja0Y+aNApkZQBoPwRPhRLmsAC/e+2xbOPjPhoQR57lnR4iFJDBkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/arF/CZ28hbfNou/eD8TKRnz7aHKvuE3bwzjPpjEcuLeHUxqfV
	cMlzn29Ihfw2cnGJP9NoY7W2bdKEfVcbhcb0ah9vqDSoJWtHJmR6MSzNphgnCw08csipRw==
X-Gm-Gg: AYBFou0ZvgMblpYQpy1SRXCaX2n++NhPshi3Bmq2CefKLVjQihuL1AZPK+trMj2vSMx
	qWLTBeM/XGdRTKuYwgZoBU2wRQaBWH8meqEJQMqVjFa3JtrrK4EphZitbtc8rpRizX552zsHFjL
	C2+VeTW7hRACJ42dLYbwD5EJvFC6Vqq1s3rJAUvN6AeVu1067WGD8VvX5DGPF3DlmAISkIAYT+c
	KMQVvssX9adhqvsgFgGh5D9MEzZ403/E5hl09dagfG6IoT5r6GL72CqzdUIeIaT96M0gG2DZ5gp
	APEwmeiCYUzez5Eu9SxKNTgyrGn0sxx3ybHpkachqnPvNzDzajX+mNc8tnpAnHo9Cw2m2WcYI6g
	r6fPN/4khN+utFT1ETcDDuHYf9I1JUDWaqPEdJ4wMic2FLYZqdW7Ou5dsVdpIfRM0CUuwB2D0iJ
	7v82CvApSXTgdTFhqYJoNhBH0cfHci1yD/BX9MRw1uvP4cT5yZLmOPuswiaZAw6K6dlQaTiP13X
	gzg6cdpaCQOW+mN3R4FmI9HcZPMiYJ3BuYimL/AwB62AB/9cCWseHQ6ENXOZQGLbdKo7Oi47gP2
	DaTDB1siIyk4nfPhFlwtNrpdUYL0JgepG7gi1fGElldqO3+cbOwTJnpyLxTJFT/jwKMKVE6wYma
	v1aRdQGfTLOqIJ3u/g9PPXpDk8zd4aejbKqPbbT7Al5DtR66VNzWjhfoyD8iz4kPvxOFU9M/w6o
	uG
X-Received: by 2002:a17:90b:1a8b:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3ae8970fd9dmr11646596a91.13.1793723834850;
        Tue, 03 Nov 2026 08:37:14 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c72eecasm5237910a91.17.2026.11.03.08.37.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:37:14 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4709228eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxBwBDgIm3kJHHIlR+Cvyd5VAXrn18aYBk/xEpFrNSWLU9x0LuR/yr3WOZ8vU+LHEDtCw8DKIFUhAUy7vY=@vger.kernel.org
X-Received: by 2002:a05:690c:6b12:b0:8b1:2b64:6fbd with SMTP id
 00721157ae682-8b2b68290bbmr97956117b3.65.1793723494365; Tue, 03 Nov 2026
 08:31:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
 <ce7d357b-8990-49bb-94c5-5491496f3ba8@lunn.ch>
In-Reply-To: <ce7d357b-8990-49bb-94c5-5491496f3ba8@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:31:23 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+38UPjtAxz6EsxWDaWTZFz-jTQ67WKFSLGrxmOeMaOLNA@mail.gmail.com>
X-Gm-Features: AclHuK8EDS_pThzfN9kbbX2pgEiup5lgKQS3IQZ5CGTtBeqTGSuccPA6dHYQQPQ
Message-ID: <CAJX_Q+38UPjtAxz6EsxWDaWTZFz-jTQ67WKFSLGrxmOeMaOLNA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +/*
> > + * Delay handling of the SoCs up to the G12A. It reads phy-mode as the
> > + * list of delays this glue has to add, falls back to a 2ns TX delay a=
nd
> > + * takes the vendor delay properties, all of which ethernet-controller=
.yaml
> > + * rules out. The boards in the tree depend on it, so it stays, but a =
new
> > + * SoC must not use it.
> > + */
> >  static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
> >  {
> >       u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
> > +     struct device_node *np =3D dwmac->dev->of_node;
> > +     u32 tx_delay_ns, rx_delay_ps =3D 0;
> >       int ret;
>
> Does this code need to change?
>
> It would be better if you did not need to change the old code, so you
> don't need to worry about breaking other SoCs. Just don't call it for
> the T7, use you new function in its place.

OK. In v5 the old code is untouched: the parsing stays in probe and
meson8b_init_rgmii_delays() is as it was. The T7 gets a callback of
its own, and the only change to probe is calling the callback instead
of the function directly. The T7 keeps has_prg_eth1_rgmii_rx_delay,
so the existing probe code already validates its RX value.

>
>         Andrew
