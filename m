Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214201;
	b=S+IfH8g9tN28JQFDhsfpdUW5b++i/an1Bt4xSNIGEj8uJi5/zv7S4qBLvUI4CJiV/8JK
	 ZFe4xA6ZfzoxluLRtHhtCeHpR7sbfUnQSKyH8ytm+UTCSmu7hfS8f7yIKGtbDC+lUiYDv
	 oeypfJlcvXYdUOypsigkDiehpigTBd7RzvgcY65R/YwcGNP+rms9BlPSKs9/1M0DKXcXi
	 SD8Mo3Pwl82ssKrPxBE+Bv+iVscyW6i09423by5HHe3YkCG4cX0hh84B+vHURi9BDm7yn
	 L+pkoacJGoSA1101lLROwfm0buuZaV55WtFK6/NzoyJyT+WsU8pt32e7a2z1ZtE8qTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
	b=Zs4j+huZpbLM6Cy0hSdPm4E8vLmwaMt+GYSzPxKNgO42Xo+jr63SAJhsxSavaUb4qO1s
	 AapU/ZH+6gkF6LIZvjWjiQRMM8/c1Z+s2Of23B+YyyTUj/GeQqAckvhT9Y9nCmmUgstFn
	 UWt+pIGMiJV2tc/NeXdDTzkW2YFcCKSkwHEAcDpQ/9gtqEce4R/Gyo+hN6B4CvZR0iMAE
	 PfEcL5CIpL0RLyl3P3p2hlHBm5VDRiHKjt02WD9t/tCH+9bCBPQub1nLmyqRiNNvIhm3I
	 vonlAOsPLcIn1xrzFTannX6aI7iLhbVlaIfCxeAOLpFB7irSHH9UCBlXogt8qZ2/Zwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OnOd9a+4;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF360A383A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FF360A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OnOd9a+4
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e4831c028so664665f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794214198; x=1794818998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=OnOd9a+40cUTIUJd/RPKN6pI46RX5PKhDsWihEr7CJdmnIghpvKcynZLfFAdlmQLUf
         CkKPJvCDmZ+K9I92oLjkIP6Qegn1s/vMzh6dzqs8Pf92kRp7Czy+deTkYb4CrUeq+Nmo
         xVgmWZUxKhklinLS64tasb/WZSjPVSiXXuiiwOfz+gGyAn9WAm62TiYODWcJQUnfTMcf
         6Pu3HRyq++/t2+otcKIe0MtZVq9fATorThVCebMdl2D+yvja7OHaOWHYeK2/f6B3IOz6
         JWCSOP69cmyql0lrJU3z4Va67GGcrql04GqBwHbtt+v01AzgxHGSjC5tP0hOKjw21+F9
         J9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214198; x=1794818998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1k1iPnwy0Bc6PGE6t+Zl0LM80Ml+GB/glVmXDTikwzo=;
        b=sVZLat7R7ANf4beBUhv+k8lhn5VF3Gkq8EMWBoIHYzhg7ffummqTSpkMWeiDP0g2hO
         Vy+9n40HNJgNu0Qy7uwLiskt6xfG0G6tGuCDCUnmJhJS1xkudzAjsKWEOCYkw5OVIM+A
         Y7JCVhD/KLwFhS5JoCb2D+QQ02v3HCnwh5/yq3oougwRlanvlDuJxb40IgKjRboacoDz
         QhZiqeqXUYPFnTfFK/c96ZDd9IUDLK/HZLn6yjV/Lq2NT6t0lUPt1Qs7UMZN0xwNvmnL
         VVjCWSvf5VoFAEkqoLJDnK3QpNK56C/aifgpZNMz2S01zNFoI4cIrbhXgbbwmmJNihQw
         f4GA==
X-Forwarded-Encrypted: i=1; AL+hErGQ+po7RAMifweultqkrP/eaQ4WMMwovGBw81SnXE6nldkLNZeT0/2YTm7c/rTjaWHDC4ORZcVYyIaEt5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jyvib6pcDrrymt7dObz1yTcDbV2GQub4WV5dSFVy8W/9630ik
	BxBTOfkXo+C2wRmiKu1Fg47SGHwXbTP3ZeyddRPqGxKH5wdyWOSVS7Df8S+uCA0vyjw=
X-Gm-Gg: AYBFou1z0oxYtYuYCQCyFKbXv0MNOv74P6cg6pENQBgbzc6p1dO0u07R3DfX+wA4JHR
	89nlhgClLqHd5G9rjwZfJxuJH7M25rvNosvQMs0eXK66kme/DCFjDTRo34Rnip/cC1XBlUVIKUU
	pvNKamtzuvqqjsxyWmRrAANTr7ZOA+tiUlP1GZHqJDr3OyN0gUnsFTPF8GIcMJhN2bo8HEDyKmz
	r/WLkzpVHIiqR6UYWLKpVGffDnBlWEh9ZzsVuYXNXaqfvPUgBymgt/UxbKdjQMUBWpN8tGlaCPX
	vujQhr1dbxfS0QcaTHJeOUb1jiMbeSfCRtMD7TAvlZOExZlWY8BvKUktMyClnxiA6FzNOkCKStX
	WhBMAj83rSDP59aUcoaDVoKSB4xhDJMMJOZoVja6pZrOvGMMobJ4AfLyaKAz4yLHfInws/9CivE
	sKrxGDWDqFguH/i5zkkO3ZdyUJg7jNccKk+ec34uLNeQX0GXC+HndkL/KupeKAaDTRczxm/b2Ss
	xf9UDihd7Cta3gdjI46csLM6Mj30PInU3ltzN69esJrQUvWItVcKBav+yI/0QW294zKlygGY4/1
	XvYh1304Hm5+gblyfLXlRYow76BZbigHZZ+ylbpaco4kis1vjc2L/dv3MaD4hrrZ4BD5r+FKjvP
	ARjP6F4pwD56CHulqv4YXN2owDjU3mtAzmpNobZ8m9jtuVg==
X-Received: by 2002:a05:6000:248a:b0:48c:4442:54e with SMTP id ffacd0b85a97d-49584b5afe0mr6225635f8f.30.1794214198288;
        Mon, 09 Nov 2026 00:49:58 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597090444sm9069465f8f.31.2026.11.09.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:49:57 -0800 (PST)
Date: Mon, 9 Nov 2026 09:49:56 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avGIMja1yTAkG2X8@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>

On Sun, Nov 08, 2026 at 23:21:08 +0100, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
> > The S7 firmware exposes clocks through SCMI, including sources needed
> > by the other clock controllers.
> > 
> > Define their identifiers so devicetree can reference these
> > firmware-provided clocks.
> 
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?
> 
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

Right, I'm not strogly opinonated on this, I followed the existing
Amlogic SCMI headers, but I agree the dts directory is a better fit.

In v2 I'll drop this patch and add the header to
arch/arm64/boot/dts/amlogic/ with the DT series instead. The examples
of the two bindings you just acked will no longer include it though.

Thanks,

--
Carlo Caione
