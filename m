Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794395893;
	b=e7eB74mDa7n3/9jHoQ3lA+8xhKO3fOVqOONeSca88l2QvRzhF5uUK8SAUgibwhuK3+Vc
	 z4KSF/p7ZqcsrOeBsqrcIipohXbq+KpDGvxcHhCvYZeld3CZxstCgc+1UNQcT7iM2Nmvd
	 rHuscgp86+vDsI3Iq4/wqoNMvrxsSS7nI+CylqiQ7stDndVIBrPCZ9IMQ3eeFIArUXW/n
	 JkhYWpW1dgFl0mmgeEOBoIjZ9oGqR67+vcwo1O79kq7O2WmfcdKZZNPDcZR6ybVWSn+4u
	 u0KKookwvesZ1BMm5cWw6u8Yldu4kgo/FtFwN9LVH4nPfLPuX54Lzi43hblEYAzai9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r1oyng5HmTkXJYBOjO4xwXQ4nKo/fyLrx6V7oMlvY/A=;
	b=rEKD5tzohSE+PfOZozEKmVP+ffHpv/eMEo8GHcjSJRh1HZJ0FBw0uWpimScWliPu19IN
	 TiZapRAyFGmngIyW/4sTw6aL6DAN2nnmAYC87VXnbd3Y585zfwtKQltQKcILoS5Vt7Xqg
	 +adx0TrtcwH0UeKVlcll9wHiCo7LfRyVyICFOfQ6qR5Sf5gP3BJ7W250e0DkS9t6QRjBq
	 Cej5+2tTdV/SDzxzcTQKEMiMzAFIltIL2q9v7KtUs1Bpg39/mAiNoYb/Fhu3AuwYNAmKK
	 zp3Ox7hK0xfMmgsayKRPYWAhHUncbmMfgw6xjXExZZf4e6dFwaM3Eq48tU+vxNQ4cig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1dKiKMF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE62606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DE62606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1dKiKMF
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f8cdd30beso5257541eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:18:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794395892; cv=none;
        d=google.com; s=arc-20260327;
        b=aqkhZritrV3LjdEvY80p1Rbsa0t552476zvV9RQC6pRYBlwjTR/u1pB0k9wpMwzwQ/
         i0Z50uW4fK1lmJjNLf4O1oojSvw6IuAKDu9Xs/gbF7VQyiNSHPmLzOrLw35MuujNjYzQ
         QoRvwSg5rN6kb78aRA29TSS2jxA67hfg9YPjhmsGSvBjpUtx92oJIkiTJDEsAUk10AZk
         HivqgO5RZsPaVduMdhsvt9QF1w8NJYcIjU+poi8RhOvRYnlleAwKcNQEKhSqszCxKo6N
         FiHL+lSBQrFE9+RxgJQV6EOJ8SZiWRrpnxIx9iXbp9RrVa3K6tY7mVAD7mC34Jrd8yYk
         TKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r1oyng5HmTkXJYBOjO4xwXQ4nKo/fyLrx6V7oMlvY/A=;
        fh=qOMngD4ND0jb6DfrvQ8Ek/7zk1HKgys2MaMHNXBEAfg=;
        b=mGZKSBWV5pJcdE7EXQxvLJ3nuSxc/mX8CqS7FeR7oKARF7XjAKoZEmaSXbCeFvEBsR
         yjsuqLZjmShhmETzsUUtCnykc3KZWJwfMWcMlkE4tYA0ajvbz53nFuBgCNJNr414MKIS
         9PJITViKpDSjUwUS9h+jTA8yEGde4aoddWGksnDJFkThKhnTzzeIO8y5rzhCxK+tp+9g
         /TaRW96407v5FLlgMxr/3Cf73B3zeyJy8NRWics6DZ906Adq0egUdYUARV1yBck/MR4x
         Asn8uHdUwOxin9yJEmn2CDRi77dDESlKGDAquhuKDDsbLy27BGJHGE/4qFKsinD3H1ek
         JcVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395892; x=1795000692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1oyng5HmTkXJYBOjO4xwXQ4nKo/fyLrx6V7oMlvY/A=;
        b=F1dKiKMF4VJajRFj0nHNImoDhIUp8W9AWsqwjUNVel+BFQjyDQmyuTVu/c4p+Nr2QE
         7GUJznGwWgwagJDi+zaKjBM2+70O7Z17rGubc1sag41BoblWWRgDyB8IYE54sC9joJFh
         fsu55pggmsU8lE6RGjMwRFWbKkT1QYx2wetE4yKjWffmSRYfD2ekBOwW1ZeKnPykNnCC
         4K/Dwrjd45d170g1jscSUYj+wI6H26nwwYP1yX/PkIYSw8wsiuEDYez3uO4tNEYjr7mR
         rbGxhKiq5f/Y/Kjom2fy1knuvLGAvdVS7+Mh03iimoiLj78422wBEurEl3iOKv61qrUk
         T3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395892; x=1795000692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1oyng5HmTkXJYBOjO4xwXQ4nKo/fyLrx6V7oMlvY/A=;
        b=BC5xUIaGMNsfwtFlTXJjOjUHl4Fq/sNdF+2iJJj/BbHUkYZjjcNGF53FY/UtXQL8Op
         Anwgfhf5FTxFpuGmBnXeVlNyAjf7JmNXdDZTmjtOK5pOeU8hVnUQd6eC5vQj8Rz4eqQ8
         M6YXIKbSwUTHkcrc2y3JaokBeKDe8x6qnwqAdL2QVFVXgvNDwJFrVYRihcWwr1m41Rtq
         J7IxndsqTQi9cJhWBmyrCer+70QCjqH0GqXfQcINiKXPS0rVEZ8xz6AIU2U1Q5AwtPTx
         de0R+aLOwO75nETpmTh/0hOZ3EnJsqhwxMGnJ9FdtNIwWrhyZS5gwtaVUodkfI2gMhYG
         BC2g==
X-Forwarded-Encrypted: i=1; AL+hErHlJMAiuxw7+pw4febJOkH0FXIiytYimiNk2t8V0vPh6uKjBGt0p7YiKLJ1aOFTmhQHHfBy8g63uQQpKvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1boDQ+RDqpiBsEHZPxFkEHqjc8fMNj8wJEWwtzUwm+4WivfLH
	eoUkLaeoMqVoXdss0ucG+m3/WwXBcAFZEKzQMzuyj88QAaZEEPFlcAOTpcLiB2wY5J9oNvmSLZh
	u9cfanp60ORjHfnCtCu5WstGHRXp5sRw=
X-Gm-Gg: AYBFou1Wez/gWjfo3q8bR3xWJ1mwJK+oKkpUF8tEOzrAmvOZyOLBox58J37Ip+eS+V4
	5It/HDmR234B5MhBlEpvzH34vQmYWrM/5/0FCGgeYCFx8N5untpTnAxzHwlBLlb9W1v1CwjJ/2w
	WrqzHTja28ZEsjNKy6Raq7uouRX0GRqoqF3ZtH8tt7JnwDHQ1QyO2omYxrhCWJPPcDNBB2pPBdN
	fSSjx525st1+OTk7JojaCtNf/opdZen71XCBxC/qSGoPulcArpb0yxA7daF06IrNv60Dauwr+Kg
	pon3N/sZQk3mLy/5C1Cd7lRC7MyKtHUGjdTpE+zivSReA6e+athffI7t826ct512qAEmZdgCYJz
	Z1+PneyYOsVvRh2xyGv8OOmyLjRkl6mRU7IQnZP1kmlXqKpfv+OkCzlhxdB7K8K4p47xLJ3Vnpl
	x1PZo7s0mlNcbDvN9XcvfFJJIwcBX+3w==
X-Received: by 2002:a05:7300:d942:b0:375:50d9:474e with SMTP id
 5a478bee46e88-3768366a40amr2582746eec.4.1794395891501; Wed, 11 Nov 2026
 03:18:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 11 Nov 2026 13:18:00 +0200
X-Gm-Features: AclHuK-O2dC4RAUcsZW-78NPaZ5DVC69K9fHpFDz6S6p3zKh72SRrQsMpZxuDAU
Message-ID: <CAPVz0n0-jBU3jnDsA4FmAkiF22Bqba=87_VRU3P1H2dzHHbteA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port optional
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Selvaraj <jo@jsfamily.in>, Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Cristian Cozzolino <cristian_ci@protonmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Ryan Brue <ryanbrue.dev@gmail.com>, 
	Nickolay Goppen <setotau@mainlining.org>, Robert Chiras <robert.chiras@nxp.com>, 
	Alexander Koskovich <akoskovich@pm.me>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Morgan <macromorgan@hotmail.com>, Barnabas Czeman <barnabas.czeman@mainlining.org>, 
	Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>, 
	Arpit Saini <arpit.saini@oss.qualcomm.com>, Michael Walle <mwalle@kernel.org>, 
	Ritesh Kumar <quic_riteshk@quicinc.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Danila Tikhonov <danila@mainlining.org>, Jens Reidel <adrian@travitia.xyz>, 
	Michael Srba <Michael.Srba@seznam.cz>, Shawn Guo <shawn.guo@linaro.org>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Alexander Baransky <sanyapilot496@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Romain TISSERAND <romain.tisserand@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 11 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
3 Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> DSI panels can be placed under DSI bus directly and many Linux DRM
> drivers will work fine with it: mipi_dsi_host_register() adds device for
> such panel and DRM driver does not use OF graph to configure lanes.  The
> affected here Linux panel drivers do not use OF graph, either.
>
> Requiring graph port for such panels is tying the binding to one
> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
> requires the port.  The port is not needed for the hardware to operate
> and for some of the Linux drivers, so it should be optional.
>
> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Remaining one Ilitek is fixed in:
> https://lore.kernel.org/all/20261109160706.2272332-2-romain.tisserand@gma=
il.com/
> ---
>  .../devicetree/bindings/display/panel/anbernic,td4310.yaml       | 1 -
>  Documentation/devicetree/bindings/display/panel/boe,td4320.yaml  | 1 -
>  .../devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml      | 1 -
>  Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml | 1 -
>  .../devicetree/bindings/display/panel/elida,kd35t133.yaml        | 1 -
>  .../bindings/display/panel/feiyang,fy07024di26a30d.yaml          | 1 -
>  .../devicetree/bindings/display/panel/himax,hx83112a.yaml        | 1 -
>  .../devicetree/bindings/display/panel/himax,hx83112b.yaml        | 1 -
>  .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 -
>  .../devicetree/bindings/display/panel/ilitek,ili7807s.yaml       | 1 -
>  .../devicetree/bindings/display/panel/ilitek,ili9805.yaml        | 1 -
>  .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml       | 1 -
>  Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml  | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt35532.yaml       | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt36672a.yaml      | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt36672e.yaml      | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt37801.yaml       | 1 -
>  .../devicetree/bindings/display/panel/novatek,nt51021.yaml       | 1 -
>  .../devicetree/bindings/display/panel/raydium,rm67191.yaml       | 1 -
>  .../devicetree/bindings/display/panel/raydium,rm67200.yaml       | 1 -
>  .../devicetree/bindings/display/panel/raydium,rm69220.yaml       | 1 -
>  .../devicetree/bindings/display/panel/raydium,rm692e5.yaml       | 1 -
>  .../devicetree/bindings/display/panel/renesas,r61307.yaml        | 1 -
>  .../devicetree/bindings/display/panel/renesas,r69328.yaml        | 1 -
>  .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml        | 1 -
>  .../devicetree/bindings/display/panel/samsung,ams581vf01.yaml    | 1 -
>  .../devicetree/bindings/display/panel/samsung,ams639rq08.yaml    | 1 -
>  .../bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml       | 1 -
>  .../devicetree/bindings/display/panel/samsung,sofef01-m.yaml     | 1 -
>  .../devicetree/bindings/display/panel/sony,td4353-jdi.yaml       | 1 -
>  .../bindings/display/panel/sony,tulip-truly-nt35521.yaml         | 1 -
>  .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml | 1 -
>  .../devicetree/bindings/display/panel/synaptics,r63353.yaml      | 1 -
>  .../devicetree/bindings/display/panel/visionox,g2647fb105.yaml   | 1 -
>  .../devicetree/bindings/display/panel/visionox,r66451.yaml       | 1 -
>  .../devicetree/bindings/display/panel/visionox,rm69299.yaml      | 1 -
>  .../devicetree/bindings/display/panel/visionox,rm692e5.yaml      | 1 -
>  .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml     | 1 -
>  .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml    | 1 -
>  39 files changed, 39 deletions(-)
>

Thanks!

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com> # for renesas
r61307 and r69328
