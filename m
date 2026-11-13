Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530226;
	b=ZckrqZlnU7wP1dBzcLGXEgPY+/ej2Qhch5KSPX3FQKe7QUPwZhO/ERAuxDOcC44aOMIY
	 /eLzX6re2BSITRiKbngM2flh2O1gm6Q3/vvkTlu1aXeO7HJdB5c1hxmAGEmEhU+gmKaG0
	 uxgx/lIzDVva7Aod0Ckc/nRV/Oqs5M2aByECtwdFrVJPqRVfhcdd5WyFk348O1JY5ZJ32
	 YiXG9HA0GFqfBIWqs4OMGVrGxFfHL0x6yoK9MP28Pf0tmIn9BsxUpDwSn8XFkcmizhbaX
	 uuEAv6HBinAHcv3/xaeKl1rIYPKlPpRUj6fg8rBIsP2169iITQeYKHhpNTXoO2+tUqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ndSvCKL9DmCz1Xlym3gvmuPi6Y2z+W2Q/BEPD9rU47Q=;
	b=GNFvEe5668PMkGNC3vW0ZQje/m2+UzpNfT5o2KzeVk371d2ONlgbPlnOFqyXQQ7RFzlU
	 1FvIIkgTpGkWmw4R4sBi35qyYlePgYDEEKWPPbv4B07tkDK/IYE9C+Fpa2U+5IwPrWmkb
	 oA6RF7dCU0rZ9yl66NOHyGfulaC1gyKEtvpXQDisnTZn0foXp9yB58IE/2GWMG/9oNmXG
	 l+AW8yNq1Lxyv7DUGshzTYwXEdumH7JMWRxgUjQIRaAewgcbY5qGSqjrg/WQfR+58fZ+Z
	 6J4dqE6yd1hSaeKxHCTKAd4xGZvG1k5ZX6M95tz9u7gDDUlp1t91A4Qcki6qnPRtDhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQy7FD5U;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E558606A8BD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E558606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQy7FD5U
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so5590785e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530225; x=1795135025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndSvCKL9DmCz1Xlym3gvmuPi6Y2z+W2Q/BEPD9rU47Q=;
        b=zQy7FD5Uky8jI9lN1ow5BVWTgrCgNFNDWHfYmrXC0j4sT0wuqg2a4W1yyOahHI3PzQ
         mLfBh7BNwqqhUcYO+NEOXsUtVtvG7XkfgT1NWY6uubSRX03Y3Ckhdc3fd7Z8XaV2Gm5a
         AE9v8GyA1QqkSpgfwPwcnFPN+D18G8w7Tjm67tgyXF+wkpYFjofH1DzNtHY/BDY7GWAs
         9PP5GRKX0MQeiJUKTYA2+hrSuTBVatYr3zKCfqy0sHPa6wzHqEgBw2LXop48uI9FGfdf
         Cbcqg7hkyBaFlIWeXdF56cXJR2WxczCM2MrUbAX4FgYQbKiZKNUzpoMjYm/VQRLB0mHu
         FKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530225; x=1795135025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndSvCKL9DmCz1Xlym3gvmuPi6Y2z+W2Q/BEPD9rU47Q=;
        b=KTzACQbUm4DfWr/pajvCW56BtFm7byssFgovLSjOTuWuwzHYrfz5rM6jDALWxq45at
         lmywVpf82FITToe8hcVRZvy7UQakoNUn2WRn/mjch+EfygNOGOmjbLmNgscsgMfdU/VO
         3kITyN+62EfCKIYkbv8jiMI5xQxV677WiH67qx2NNAuSVklam7FFBwBlITDIUaWM5fJy
         hcF6IL5H1g5jb7uMYjfGY9tszQhrJ5evDTqJFTEY1TkimewqwpO8iwOhIoU5gA/jCSrL
         qEqAI5n666TttkI4oga+W3iwZ19JLb3k2Q+Y9eieAGFJwBa0JUuua0k1ytYm95Vo4qtB
         7kLw==
X-Forwarded-Encrypted: i=1; AL+hErE7mPiP2wJ2bkxnmokCq735isHSF+kS4EsHma8Sk0sspezBIR4/oUHXziMovW6G4s5cI9jTarGwbPXKzXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WgiciiYo9mmCCtVGxt5Ntl7PM1Wa0GNACvA5+P/P+t0Si0omV
	6dw8frKXE5TPoCuK3x+IJHu/iXNK8HCHjwyx+mzPIutX8JUpkELJkEc+
X-Gm-Gg: AYBFou2Abl/xtSrnX3evj2sf5fC9nh1zXf/G1IolRvKNx0d3QNBPARFj+YrzalXsl6z
	jyVn1jfp1xV7WNgcXXHgnYvSfhb1vJg8era/XKhxQ57IXvlTdzrOgu25QAaqs4AscUpywzW/pza
	krDPZKczfRwnTdccn5zySelydIccOVExB5S6fADJpIPi+PJ6KSfpXCmu2mUpdmgd0DDNs/HYo+7
	dU3+/cTFXQc9Vn9A7+yHpcDeBPjg3r2nmavC359DtGMrQG9schss95c0g3Xq6nUERJKF87iEdI5
	qImNBRXbTnmA4qQBuWjDhQzt/OaykyGwdvsBKcq2Gewr/DTtibfhSuqF/OMaCchTOuSQrXTgMMQ
	JSwAj4g/tmBVRp+/EMmGDSe4eKgj1f2Qfxm9DH4yNuTaPnpB+Ie0ATjKamtxvcJhwYl/za8EI+W
	plBNJ8ThiOYEvk2UBuMdJGI0A16JZPsz4rQQCNMcOTjLB5RV88fQmRQ9p+lOtwmzAXOZ6WGMZaq
	He0CrOyyOAioHRCardP2VGoCLQMN/FXuLIAteDvDFFxpMaspy9PUB7Xspemqvrs6d9G/vfkXj20
	vLRO3Wupd2Dkli20iIOZXAGb5v2Kd/ZZSRK7r2HT17tDPu+o8i1iOCHNqsBUyAiwEUU2/aRxAfM
	70eJSLDZqYobpX3FPkAwAzFusWxlftiKTFeZfJW+LspFiPMNfekmQ3OGClnAit7DLa2BtwcB9lx
	lhg7ED3L7i8EOxl6kV
X-Received: by 2002:a05:600c:c05a:b0:4a3:59c9:a750 with SMTP id 5b1f17b1804b1-4bb55a6a5e5mr14393345e9.9.1794530224913;
        Thu, 12 Nov 2026 16:37:04 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm2591625e9.2.2026.11.12.16.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:04 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 15/24] net: mdio: Add ZTE ZX279128S MDIO controller
Date: Fri, 13 Nov 2026 00:37:03 +0000
Message-ID: <20261113003703.3666085-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <595371a9-6b7b-4ad9-985e-66f0e659f4a1@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-16-ghahramani.navid@gmail.com> <595371a9-6b7b-4ad9-985e-66f0e659f4a1@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

Andrew Lunn wrote:
> > +	writel(0, base + ZX_MDIO_STATUS);
> > +	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
> > +	       base + ZX_MDIO_CMD);
>
> This is the same as what you did at the beginning, but in the opposite
> order. Is it actually needed, and can the same order be used?

It is not needed. That clear came over from the first driver I wrote
for this board. There is no public documentation for the MDIO block, so
that driver was put together by reverse engineering, and I never
checked whether every step was needed. I removed the clear after the
transfer, so only the one before the start is left, and tested it on my
board. All five PHYs probe with the same IDs and link states as before,
and a few minutes of PHY polling plus traffic gave no MDIO timeouts.

> Is this the bus clock? Does it need setting to 2.5Mhz?

wclk is the MDIO block's work clock from the LSP1 clock controller. The
driver sets bit 12 of the command register, which I took to be an MDC
divider. The 50 MHz and 2.5 MHz in my comment are not measured, and the
wclk rate is not confirmed yet either. I will find out the real MDC rate
before I resend the MDIO driver and fix the comment and the code to
match.

> It needs a device tree binding. But that is mostly boilerplate.

The binding is patch 14/24 of this series and Rob gave a Reviewed-by.
The MDIO, PHY and switch patches will go to netdev as their own series
like you asked.

Best regards,
Navid
