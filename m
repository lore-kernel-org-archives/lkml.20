Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793573885;
	b=cFmjzn/8NnSq9H4aepJOAAwcJHWCwvfHddyS5WdT5XpaWPyvBPs7MqGE+jeR6Z/4SInY
	 JUgZkl2k2Yam+Amago9OI63tH2Wwj8ufLkuUC0uO+0cmnaeprQdxSAbv2Ub/6+Y0FlEF9
	 EBPT3fC6R0CtIRAmkQnx1EKmMmvgU9n+ys0wp/BVOLACKix9XrliIVWb9d1Rf9275B5Fb
	 mWNS3yatCOqlBUzkweo3lgNnQxxUrxvhBVQ2utLiIJSZqM2/9U1+PKDBklMhd/y+48Jh0
	 6Q3GM2BSyGC1JVf7nepwEGL4X68OVXwlUWlKBrrOkYHCNr+NLAoxha4buvT1D28KzTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793573885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
	b=AiyYIOtOdDPapIMAO8K5BeEGOekt2Z6HipVNQ1U7BKaqYpp8MKYxkbuvvceiTIHa7xBJ
	 S+Hia3nbc6B6XCvf10DQb35RedylFnLy9OtAgZoNNTkUPyAKkdObB4WgVgmuqdHyxwu8m
	 zWO4zfjt/qkhaiu6tmut1iL3GqeBzuRz3AHjV3Nqb/ZEySpLiUC6/R0SglumL7En1jFO+
	 XKacbyjnfc8dB0FsDlA90KCksPW9U2TKt1KjDRlp/s0BtQdsOAdyAukCN8mQDW/vkhoUz
	 CzjCI7vD3UYkxTqoi1wM3S5klU03flJwi8Jn4/0LdQzW7yNmOYn7NqdjftkBgzBUF8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=0gw6988x;
	arc=fail smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29431606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29431606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=0gw6988x
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679334baa1fso2482079d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:58:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573884; cv=none;
        d=google.com; s=arc-20260327;
        b=WYnp/iFA8+yy5c8pKJjBjioTAWNVlY97sMWxaqij7Nc2udvEdJFaJI/N18Vk8reRrA
         Woyj2TcvH0WnhsVKWER5qbJ2i0zIHkGdJ3+IUJAJ+CPdOikjk+98VkVBU47yO5GHhPwk
         h5GA76i4yFVmG0qN/SET9GRZ8hJTnY+RGPk8ztSblbIoCT3zlQmNGF0lZeq+lNZdZXCi
         upi0wE785lAmYHTbJ/ETTw9+GvfFla9wIZAdqwX+DMA4pCiZ3Ssk/GUnVebFsRtBuhJZ
         RRWOLiteoaqHyPDvew1OOlr8K21wsOzsOy/SrNgGfO6LvTKrmV2C2kNMreHTt7xBOc7P
         3tug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        fh=hSvBJdv6x67SyrmT6UP518oR8zPoCWq/KwO1V+hJPMQ=;
        b=P8CdN1YFyTLQsRYzj8baS6xvWLVGiZqbI3nNXObPVUmZB15EDHtI0FcyGyCklnnZj0
         3kCcXZYGhZAVZCH4Q02EpKxJXux4hfdWRd3nflefsyA61DZcw3TCvBUHwTVf9xnrIyIc
         so7jtafse/1OvA7/4zynmIt1g4aTmfag1j94/uc6Arx+qji/DFtB4JeM9UV/BxJMYmQO
         2T9NUMJnHO0bd2Rksj6ZxIGcdM9ROr7BFkUDkLX15DpBzdbVckEcBWolV0jRLFacwoeW
         vYORD4CwKnxRZCY2AxIr84thkUnolN38vHH27APnpI2nHO007NUSogebl+5G//BnJBL7
         4BJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573884; x=1794178684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        b=0gw6988x/OCDWClJuRql+I+XqjdNXzUvr8O7ZEWcoZLYy+VvIdMXHwqGOzr8ayBDVe
         yAEgvkjZgxnOlVYfaCDGwnezLFdbkElvBGH/pZz0JKPgX3IBpkZEB8IfvlFsOB5S7eiY
         mnxJzw5l3aG4qaWan6aQn88UimfqUzjZdxgFQGUx4s2is7MwTOOLzoXwLaoKR5Bri+uL
         SjsUMD+eYTbmShVuq1uk/p8J6RsKY3ex7k+P+oZ34VZqStq4oW11LtZUeXg0kaS7VjwO
         1v+5wT61XpShxrkIiR7xRWxyb0X2P+mLhm05+StfxvxoNrltq5aPXXECR5VB1PiwGdYK
         +o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573884; x=1794178684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hA8T79umdOtjSmsdO6dNcesjyXAMCgZnStc1nU8y/M=;
        b=b2HFvnRcL7tXrtJv0SJM8knQpCj9B3AkCEdcEKAlAG6w8XOsFeuUN7sIlYzcQphNCu
         ShvJMoQGwbRJdgWYaBpwdGA4F+VTcqAjLs7wewpSdDYgtVNw4ON9PGPnZOeMKkpOb/1M
         /r/JMSVxvyx97B0wXKLsBT1aa6nIskWBX+noWEiS7PtMpyKpz00GzuLRMRs3GfKSvXKU
         pFWsGUw2ZqWT8Zz40DLH6VLxv9vHFjZ6eFqwj/crLXZq0VDyj039feftIyHRc7AxkiWm
         Vy92+yb5xdA6y+ERoswXXi5Nm8NyO2LrBLABb/VXOn+BaH/RgXKz1wIbx8DIQhwavfhm
         XzpA==
X-Forwarded-Encrypted: i=1; AKwUvBwjXH8ihL9pMpvvVaCNRQ7xJHZ1qw3Z104D1ruzj3+W7Av533y+NRR3SGxnEc9Lw5AMhOvH2TciN8N9Eec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wpHBEuJ/GL2wD57SsBXnno3wd6mxiGrZMugaol8fmXYA79IH0
	qVVRJZUJZP9HwMmCS5XK23axYrdkQX/trmBVIb0Wy0NlN/9DzCWyb0Z6n5PPzjdFYSj4uitDSmM
	4wMuMeRL/q0QfLmYDrDuxtb6bwmuVxAQ=
X-Gm-Gg: AYBFou3thha4+f3cW9mHkiyqna9BoAAFROQhFQNbM7H/Yc9Ri/7AT1Njc+hYqBguNCD
	f0ihrNUS2uZi28zTgWMzWhaXUlf/3AA1LL99RCnGcSaurwzgCoD/evo+36nCjxfvzIxAj0G8kgb
	xTmo1RSFOZNh1wle+VGfV7pAkXDzyHuMp8t8/gnYMRy6KG644cwSlYU9aATYtJYiEF7UcYmkvCL
	q6VQfFL1xyQ3ZrB0OnZn7bH30yOuXqXwb4PaPe83la/Hzh8X3QdyMNAjFYDzB97Y+tB/p4CmTtl
	ST1A+LuH2NQ37uCtjdrVQArxOn6PA4Ey1CkyAYwdydmztod2VWK5UWUjna4jfLWck25sJbvP9/x
	xvtvUlRhiMFI8gLGAOJ1OhFaXw9QFcj0+/jPehSEe5/Ys4G6j/bQT7MuSZoZgNrB4TQ8s8Q==
X-Received: by 2002:a05:690e:4507:20b0:679:5bea:d3f5 with SMTP id
 956f58d0204a3-67ba4f7cd36mr2946413d50.50.1793573884100; Sun, 01 Nov 2026
 14:58:04 -0800 (PST)
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
In-Reply-To: <20261022200640.3101932-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:57:53 +0100
X-Gm-Features: AclHuK9XeeIDEqdtINHt3p0JMcC8yqSM3_Rvc2uE8IOAzFd_ujX08owtUzvHpsU
Message-ID: <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 10:06=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +       if (!dwmac->data->init_delays)
> +               return dev_err_probe(dwmac->dev, -EINVAL,
> +                                    "missing init_delays callback\n");
I'd rather let this crash hard to make it obvious to someone adding a
new SoC that they forgot something.

Other than that this looks good.
It would be great if the netdev maintainers could comment on whether
this now matches the approach they had in mind.
