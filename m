Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F6456E10
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291819; cv=none; b=uDTjEuNlMDSP+AG3jKsm74pXDBv2nsVqd7cVjheiG5hOUfvmj6rQnNfDCGgOUFgo+3VtxQsq4dA3lqfBYWEa66DYk+jxoZFxFLueL5LF7lfNBloe4ATYRN5c6NjT14DPzqn2UShxqPNYmNZJucZOrb5GUTE9jws/ZXvP2P7N1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291819; c=relaxed/simple;
	bh=an8RRqaHB41r0ebVeLgeXHHwXpS6JRCN4uHoaw5ZiSU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=m3uw+6z3FnmTNZHcEIv0DYrCb8rsatuYKffqHsea8rFC/SdCou8upXTy/DA0oKwnwzWCgMXh09z12ABvRaD9tMTxQYKd/gSdmhw66HTD22Ia1BTHyBtAmkX3N41sX/YNXWvzyATlcUrBw2dHL7so1tsyRR+esYEExBnZApDd/T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wUWDC7Kj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wUWDC7Kj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso4130075e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791291816; x=1791896616; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bZZmp3CRIOdGFj58JHDnDs9xiyHh/RfAbGLo8F1+ehk=;
        b=wUWDC7KjcEKRPexMyJyfi/B8HUR6AVii85AdT5Ef5pAaVZLL0hZQ96YF2sLI1M70LE
         bDBPSfTMhV8up0z8svDoZ1jtxLPrwehLplqq4EB5jPXhWVeuJHms/kjuMyvTsXnnbKOM
         fh9+FABUA3LtBkbnxAreIft49gwPD2oDspFnmFB4A6twayVhn3wm+xbrdWZUYLzx03Ca
         sOlrBYIV3oRH7M8MDZLfcA57qJbULKVGqELO/tyK4UAI4bN/1axuZzUmUbsMvAl/bUNl
         7T0aXgNdgzBDikXDrhkT55yWaHMHv+LZkOAv1T8f3s0hu59WXmWc2vmm90lROwDvNyP9
         bJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791291816; x=1791896616;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZZmp3CRIOdGFj58JHDnDs9xiyHh/RfAbGLo8F1+ehk=;
        b=okBeZKqvrc/NgLJTFSUpmaowjZDef1NnKYl45btcU2cFMdU+gW1rqAJ+GRKEMXzzRq
         Zaam5gScA2UBezjxpX8pZ+2MpZl1plVYUuigV2vQ5vkyBcrM8aF152/WPlX4eVW6w+2x
         DBRLF5j1xJdk4Ry8MY3zBnsqjWA0D1kzKJx3OrOopsDJPXKJpIwxs36733+ZhXLY42v+
         9XS5Rk0C+UXpRAKTufdkI3L4Ii/V79aJvNBUQnz2pDvFZD2eAk63QshJTFjfaUsOgc9s
         UQwvzDADnSDil6H4v4HFNnDGjja502ikAvx+8C91viIVJg8ltToohK3daw/ILrMmWJIm
         lYgg==
X-Forwarded-Encrypted: i=1; AKwUvBzi0O37usDqiI/zQH4AM8IJ/mBOSDI8IRSk2NoEpOYHJgHcIte7rWvdQAvn+PqFIH/ZCQMaJHwzb+z7cNg=@vger.kernel.org
X-Gm-Message-State: AFuF++k5sDDRapKy1d3U6p6rIFvm4t2CeEa3IYRoSczF2uJ2AQEphDj8
	afpSn0WbwIf83pf6wQUZg2X0DyX6jI3pcEz0dbgejIBMbCq7qOepyM77TLS9zB0Dldk=
X-Gm-Gg: AYBFou2HT8qrNZCEYdkw2/3He49Oibty23sRz29WQllHITPoa0OgJMaPXd44+T85glW
	9Kcznvz8JbFw9a6P/0cPRzrTgkxXI3uVTVrjt7+GkK7OjxfddCez87A+dFHTNFykWHD3+x2tQdi
	xIPOUIUCZ+/ttMBUSvf5g/XagcX1CVEvVoaRI0ZrJC4OvwQG9ohg4HQo7BtbaaWRRCI+EuZSEBh
	qqwbLp/Jx3jUVNu6mC0nWNycGxoJPLE4IkfvhCn5FW6ThZvPnoQrGkTuR9RBWQ5IiT8iF5Epycw
	rvRRC1Ivyjti0BaVUE+z8tL7jcWCzxgamU9UtvnO42oI7TuMuufQNJQ8x5gp2UzOIIIR+swtW9a
	8WiJOI1PGeEAen5BhT5SeAvr5FHicT03ZJDHzgwcukvtEaMTNX+QvbQ+YTHgQeB1ZbjlvYPIXrr
	1wOmaw+xSMF3M9YLGpDDrlFIQ8VjqF290Jnqhj5DU00Ij0CrQB5LtcAd8i7yaUh9sgBkqt2xqMb
	lizaU1aH+ymG3XNyT08
X-Received: by 2002:a05:600c:c490:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-4a17b53656amr21782015e9.17.1791291816314;
        Tue, 06 Oct 2026 06:03:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178caf832sm81042065e9.4.2026.10.06.06.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:03:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Igor Velkov <iav@iav.lv>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <179126094299.1095177.4869656735733059341@iav.lv>
References: <20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv>
 <20261006041733.8C4081F000FF@smtp.kernel.org>
 <179126094299.1095177.4869656735733059341@iav.lv>
Date: Tue, 06 Oct 2026 15:03:29 +0200
Message-Id: <179129180999.592940.1230542534490853306.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=an8RRqaHB41r0ebVeLgeXHHwXpS6JRCN4uHoaw5ZiSU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqxPGmrDte5eWAM2zYZCOxW+dCQx8lZh15pobaMzdK
 8mhJRwOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCasTxpgAKCRB33NvayMhJ0XryD/
 48bpmUXwaPrcjsq5bMH5cKzGfT54W2AWi9J6zlK/7uVia8sMg1eGMfQciIz96Z9EguvHk1CpDiEL1g
 UkGmSjQE6v7C8p31NwNiO4Wmv04iLWsQc3HCW9nFuJLTkD05DVmXQW76hrxq8Fks+4Twyj+lQr1UPx
 LLqWXxFvdwh4wOTenYpKuUGlAXYizzthnQkilSyO6nqdz+WpIj9sQCr5gYi60L+LhJfNeZ1VsCGaAZ
 SQ4oFW4pi0ZBiplW0d739hCWQ+IaX/BIzQ0BrTxiHM3eMwJAI5h49uDpyp1fOzJfExphssTAwc4YQD
 /C2A8wTq3eVk5DIsQRBLb3iSe0+O+dOOMDIXy47U5isY0WWgNwubBC7fkmA3b8dawfZwOdbT/rSQ4l
 uJTdQxz4VpKNvk+fdGmiBUjSJxiwwbgowIOPu4mwOo8qztFd6S7HpUH6cKZzEL0Sny/8kgmodOXyTG
 dpbxnoekOMkmqmghcLsQWAoWKPC9gcSbWw5WL7d7KvnmTdeS2jRFef84NmI1ys10EtS8IfsAHc9Oav
 3uOP4tnpM+b+4Ew67j4fQm1wb/dFuG2o/fJfwssqHNrg+6KMCnXDrD906eLuPlzRlqeb8sXBuUnOqC
 l/XQMQw5ZPbpbyyF5p8bBfHZqmv5wAg56d9JBitTQ12lYBC5g1xU2vid+g/Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On 2026-10-06 07:29:02+03:00, Igor Velkov wrote:
> On Tue, 06 Oct 2026 04:17:33 +0000, sashiko-bot@kernel.org wrote:
> 
> > Without an explicit pinctrl-0 property in the fan0 node, will the fan
> > tachometer silently fail to read the fan speed (always reporting 0) on systems
> > where the bootloader leaves GPIOX_7 configured as an alternate function (such
> > as uart_b_rx or pwm_f_x) instead of a GPIO input?
> 
> Checked on the board: with GPIOX_7 muxed to uart_b_rx, the interrupt
> counts edges as it does with the pin as GPIO (452 vs 445 in 5 s).
> U-Boot leaves the pin as GPIO. The PHY interrupt on this board is
> described the same way, without pinctrl.

Actually on Amlogic platforms the GPIO Interrup HW block
directly gets the pin input directly from the pin, so
the pin doesn't need to be set as input.

Nevertheless, so be sure there's no remaining pull-up
or pull-down remaining on the pin, it's safer to add
a pinctrl mux node for the pin.

Thamks,
Neil

> 
> Igor


