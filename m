Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626837;
	b=2hVwMGJxc2Zot0s8snHmfcYTE7e7Wxz+IDCg/m6lShwkNLPa285L2gK2WsrnMIiQHmmR
	 9PGGsibXdlPDqSlJVhubfSM2KsYTEEAagcYFnMoU6xipyNh23wavz3FytULvykGHoA6VB
	 0nrUrDL0bQn446CM+ZwiMLMIMBQkDGKGGukW0qcvwWz9IdlDd32tvxfn3iyUGFVqMwwQ7
	 9BjMM3wPzikaPOvU4x0wKyujV6EDOexIXYQ2L8PMuEZgfiW6LzTB+8XI1fhO0bzogQHzX
	 6bRg/118cqDNHZ9Ix5OpC/65RhMa7I4qgSTdCsCOij2YaiROn50lOViqQ7OCNv8lDfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
	b=ZSFZh/kS4jJWAcbIEfXV5KrwfVUgQfNWIFaSgQ7A+hpECAiLR1oIsg87SMO++vN21V2M
	 JpSjZ+ADCR89CFT6x/g8LVyBZqV6nUfEwDqqXRf0TBabtWdvCuLGsdZ4anpuQrRpXQvKG
	 ySVBTRrNUA9iUwI2T7KoT2z9hdCgvUbYgaJW6JgQtthCSNbTTolG0gg+gSmYwNseHbcHL
	 VuAks5XD3xHQJF+CzfAWdPnjX9D8ZHlnUwrrQY3X7v0esuWpafY5qypBt7SfbWaHJdyQC
	 ORa7VIDMqRyncUx7j5ccrAha8uR+bQRILn2vFIAfqcFkpmXWfK1fcaMmngtp3eERcbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vuzfuEg0;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E7606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249E7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vuzfuEg0
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1501962f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626835; x=1794231635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
        b=vuzfuEg0e/+AlSp5CQMLuWfWasBigWLX8d2tuC7hOQLrke9H1N1y748w40zfzFyr+O
         BBfaY6lba8Ruy00rEYs7aI0tVkWCQH/LKdR/cJ9PoKAj60Kqu4e3PG0w+60rkOk7XhVe
         +mbpIr1lvEhQ1kIOB4dlMgnRdo2zXS207rTX+/rlHZ0oGCcKZiy0X3RUziEL5XbAjluG
         szTSx9AznDdgD+u/kc3L5MVpATOzgA6VG1FeZIij9B0Rk4UtgN9SP6oCJyGOcx0mVWQD
         URHkyqzPnRMMnkSNJnY5l3WSP5LOVtnyLINn3j17WPMNEyATYMdIe2gwVy1ZFzbWPyJc
         I9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626835; x=1794231635;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Md2bnpbIvy2X912Bc1LhqLaDZUJHkR+XqT7pG6E7/w=;
        b=VDfWCpif4aO+w+0AiVZmqdmzZo/HsZfks8bP81ksi6De+oReDUfuMBHPWYzd6GRkDd
         CIycmp4H7kX9X55S7cKnmkIHR6leFISNeqnRpwyA5IBuk10gRGDe3JNidL84P2Z2Uqu3
         aNn5UV1NFPuYKO976ApkxA8tyHxqPtkkU8wgAS6AvTxELsF8m4oppnYX7Nec/Dw94pz3
         q3sPoiZAqegepmRJhgCyZcmJsqQv3P3N4qp2/Bn0dsNlh4HU+yT5G8ETrhNvJ4HXHflA
         SuYtpdDKTnD007O/0qQgk08s37eMraEpmVRHdD3qkaeGKK4DOo5PSEFzJ001Nh4QUdHq
         sNtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXvxqH/K/IUBe0nQKqzHh73vE+Pket/M2OVQbD6G337dv9OMEDhmkmSJbqSesaKMDIdZhVbPjQb6+qFe0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqiL7uO40H87orWfJoLjWJYM/j4G4DAc4CB+/sez/J7I/91cux
	XARNQuWmEC5oMMbiwUv/gYg2FSZGPaVBXqA5Mqou5fw5Kxh9k9BC8Zid/ed2EZ754Ig=
X-Gm-Gg: AYBFou0uBMqL6aiXjxFTljckHA7Ng7vwG+IR3n6giUpVa0urUHE/TAj3w1BjLykOr6l
	n6+amCSayXdcxqiFfjQWV65CAJ/pXYw9Eb5RhvKlyYNXYdsQ4753hZwF6qQazox/rYQ/CTeodxu
	6Nr9/A4YKMSqTqmcoGseLNBLeT7W1LMpZ4L7afS46x0RMB2Covo/za++Hk1AGfVjHjwMOZf7W/Q
	lYnaOAV1f2maaJYwTc8hEUnwB46hLsLkbDV1qcNEQRYPwIw7OBugbMQ+D4mUJpI5gTcjoeveMyl
	3meGayDzp2qv8pksSkV/HNpUHZUUdwXJPQSwxObOV93xn+d79h/2LGNck4VTWKyyTvczIvY0GoH
	nqoRoBmdUP7wOjQr3Oi64We/hrHibKnhNhyoQ+3sSXkWVsuOgQOwiNoPv8XtFPHY1hF5qj2pA/E
	43ZEnUivflDtCQUD6TqDx7gGPt/sQnJRj/ez51Bo5B4BR1wYgyE24BqaH4t4duyfHD07qgmzcaV
	yj/fJUX+AdnRjQiJ/U4fGIPxxZKqzjgZ0Cu0WIJnLNNCfyYqVXoV/mOjryzYzXysMQu/pJt71sg
	/0UtlAi/L3ptRdnok9p6CPAWDDdyD96t1Xt08lQukc59LGBHcg==
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr233451845e9.20.1793626835401;
        Mon, 02 Nov 2026 05:40:35 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
Subject: Re: (subset) [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply
 for Startek KD070FHFID078
Message-Id: <179362683429.3310106.6925209959908507351.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:34 +0100
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

On Tue, 06 Oct 2026 15:25:00 -0500, David Lechner wrote:
> The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
> DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
> and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
> 1200 EVK it comes from its own PMIC LDO, so it needs to be described and
> enabled. The existing Genio 1200 EVK device tree also turned out to
> describe the panel supplies incorrectly, so this series fixes that too.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: himax,hx8279: add vddp-supply
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6ebc6210efd3502c8ce2b1b2740ad61f69188df7
[2/4] drm/panel: himax-hx8279: add the VDDP supply
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dabbf2758be8f05c3757bb4727f2e48fba4ca66f

-- 
Neil

