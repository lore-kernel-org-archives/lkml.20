Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626843;
	b=HSDHafXd7nCe+Gca/JESOhF9AFTgEphj2hgcvnSIfEDeqAmkLlWFJ2SC8HmtiqVruFxd
	 rCoR8GgTO3wkUczjt8onb0oDE22yRG9/8cfqfKETyhkv18ARHtbHMPUKiYuAKApG8tvHz
	 aaDZGo/sVEWFMYRYZN+xUOzUZDB3jDTmyQ177Xg1biGJBNrm96Yk8DcrSGCtPeG+sdD82
	 u+wWHazapfEDBcCpomH+RH2ar6/qvdpqMOtnzUQHpeYJ42oZoZRG55r8CrKaR5hOXJrLq
	 aXoC6TTJzVtk+Fw5SxZ009WSbfd7ObKX5mjb58sohvQt3PCYqqEIfvxa0CjmEqct0zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=RJboDKYLD5odXq2wMgxBJknNJQ9cln3HeP/apn+7A4Q=;
	b=PcDk+ptFJR8ybnYkJyae8Gb0ZvJiIEWX+wWQa4ChyCaLIJJpGXFnwz4w9eayseg2tTUW
	 YM/5KuC2ekswAkNqOhABL3eQ+rJBB0wV+mbo+xZ8XKSnrZwGqjyM9jqTPciNeCyPHrolF
	 Cjalz4jUNGwxtsgakCpGYbzuny6NsTL0TicQujZH/nbAPh+V4Yy+mTk+UA+YyCozLUG8U
	 2arfaFkF0qLo0Cr7yVCxqIN8sExyQDMFmmvAsiE3Jik95n8eu8goEmd8CDibRQGdjbU2M
	 1YAv/YvxAKQvM6uTkcg9dOSfZmHIDweU1vTFaGuGeY0wgjNcK5U78a9qx/2PlkccPEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=miet7gjH;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25A760A263E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25A760A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=miet7gjH
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so20160175e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626841; x=1794231641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJboDKYLD5odXq2wMgxBJknNJQ9cln3HeP/apn+7A4Q=;
        b=miet7gjHfQ71wOjG0yXT7GDSHAxbEnMOQ8j2w0bbLCadjcGJ2ZOOe8OmsHrQpLsveU
         nCg6HO2+QCmV+ZcdVPpOkSElgsHmj3w9yZC/r4C3UKRrURfQa19eb0uPDDGHDZqh52Et
         0O7mTJ5wsWn27di+rb+YRcRGzyNUKXSAA6Z4wKnhgMPdn1q8d8UQTzCnR9KkWRZtZpy2
         ejadV4qBK1Nk9BoBmPEEiBiS029T0zxrd2TVduEBzmDrTBlo6lSaHEuDPgrACuXhoUM2
         wbOFRB0t3HELHsWTv+ywLuidc+Gc81+Xy1EXw4ErvzHBOmM0EfULpYt0VezwV42d6Ft2
         Hn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626841; x=1794231641;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJboDKYLD5odXq2wMgxBJknNJQ9cln3HeP/apn+7A4Q=;
        b=YgQHt+m6uiXGn3qfXH4k060uA65ba5vG82O+qVIvBA7mtXucEbd7j6xmgX8r+VALxT
         BQf/nk5/cu1rCdlM3mUzqwO9EO/hfX/SYYv944SmBCpJsIvMcY/go1uZlozfvftEr3Xg
         l+uT66ZzrMDhcvUPWxVGFHO32BFt3+mwAklabuaXityA4qtGPlpGs41CNmxQ6I0EPzFH
         cgaPb3avjuK5YR0BqmhUEPYMaL07oPusbarRWARaPeeF84WxdjEGj2RuHN2R+g1ak9df
         okxnAD7pOce50hP1Yrz+qZpI6o6hkeUOIyqtpclMapLmVoaqnvESJXa5+NrKzoanDBfQ
         6isg==
X-Forwarded-Encrypted: i=1; AKwUvBxa75bIJ537l9SRbQRmt1Cw1PAJvR4cCIqYZiOf19TIQ4GqzFEPr6sd/eR2EeDoKGe5vbXDDpO/pqI6x3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUbG0wr3pfSE6y1Ixfi+ZVXcs7gmTda1s9QXZhwP8nl36FEipp
	XMxMvbPv/BLZVfpydLUGaPs5guay4RrqWWbC3doHaOlJsVNeNgBvhzgyjkStnIfq67E=
X-Gm-Gg: AYBFou2qx+d3Urnb+4sUxNfqw/a2tHOfNUiOL8kV48sKYIkUBMkfXdyVb9C3+OAOiJI
	7rQXE7GQ1VdZBz+UEkTSU60CpByhxbTdoypFGiqzQXvQA6ddTYNNWyPT2ItktCT7Tm9/m2rAn3R
	4nxvWcPKCOsdB3xaJ0x3deuLX70PUy05rk630u5pPtm12aI79rFvrm5rf14yAFlKN5ycWq5V3P5
	kRSGEgw+6/0PkAaKxkIYYr3NeQWwyR/Yje9TBebkwydBUXdNI9WJ6zs4CyvLuJfBFeB3mbweV8Y
	ItMJupEOZt17FVcqXLTSnmybLawQHHizG96Dy68gBM8ws9xQrBWdlfouWWyEQTOi7X9K+ScC3uq
	naocXT/LqLHj1DbT/TUuk3OM9l+9RE5VM2H+hz79qXFfCvX9Lfo5JYxoannNQSf6IGMumE4DVHB
	QgYYaSDrYV58PYYpzHrpQTt0KauBrQ2FYd/iBqkGxV1N9BOuDwSEfKJ+1r0VcU4Lv6Wwqac7TZg
	jorZn3QklzbMcv4ytmmKoq0ICWIKiN60+KliQMEVtgzxeU2/xV/0u+mTO5TiZECuIDquB1N5cK4
	S0OiZU0ds2K/vnQRtaULrQlDSk2ArOTdACv698yA839bbTqIWw==
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4ac19234ad8mr231192185e9.30.1793626841264;
        Mon, 02 Nov 2026 05:40:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 Aboothahir U <aboothahirpkd@gmail.com>
In-Reply-To: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
Subject: Re: [PATCH v3 0/9] drm/panel: novatek-nt36672a: Extend with 5 new
 panels
Message-Id: <179362684012.3310106.12925421623133714405.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:40 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Sun, 11 Oct 2026 14:54:01 +0300, Alexey Minnekhanov wrote:
> These series make the driver for novatek-nt36672-based panels more
> easily extensible and add support for 5 new panels to it, used in
> 4 different smartphones, all based on NT36672A:
> 
>  * Shenchao panel used in Xiaomi Redmi Note 7 (xiaomi-lavender), the
>   exact model string is unknown
>  * Tianma TL063FVMCA01-00 for Xiaomi Redmi Note 7 (xiaomi-lavender)
>  * Tianma TL063FVMC43-02 for Xiaomi Redmi Note 6 Pro (xiaomi-tulip)
>  * Tianma TL060FVXS16-00 for Xiaomi Mi A2 smartphone (xiaomi-jasmine)
>  * TXD TXDI600YANPA-43V3 Asus Zenfone Max Pro M1 (asus-x00td).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/9] dt-bindings: vendor-prefixes: Add Shenzhen TXD Technology Co., Ltd.
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9f6142a00d86df12120562c27e82c73cc6d30862
[2/9] dt-bindings: vendor-prefixes: Add Shen Chao Optoelectronics
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b55dbe9011975146527b8d371f5cd9a36f03a446
[3/9] dt-bindings: display: novatek,nt36672a: Add 5 new panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1123a125fbdff4e220be9d7e1613ddac2a32f4c0
[4/9] drm/panel: novatek-nt36672a: Set driver name to novatek for consistency
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/109516c683991707a4880ed26680c45f0ce4cce7
[5/9] drm/panel: novatek-nt36672a: Combine two init callbacks into one
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8a834378028bf53a7bba729681afdd350a1169a2
[6/9] drm/panel: novatek-nt36672a: Add 3 panels used in Xiaomi phones
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/df9c727a0895f3f27d8cf8f577a32f5d4620bb63
[7/9] drm/panel: novatek-nt36672a: Add Tianma panel for Xiaomi Mi A2
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c13368a4f3f9206034ad89dc979935b0226c48db
[8/9] drm/panel: novatek-nt36672a: Add panel for Asus Zenfone Max Pro M1
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b6b23fa0fa46140c56cbd3886f4c4065b6fec761
[9/9] MAINTAINERS: Add Alexey Minnekhanov as maintainer for NT36672A panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46c59e358a47afe5f3de9df39d37f588c5f6dab9

-- 
Neil

