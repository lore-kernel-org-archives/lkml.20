Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626839;
	b=agqDa3GmX5HiM0ulFwJc3iZS5l+yz9LXhzlUDs3RrqOKvyxK+AkdfZTsCZ3sb1ORXrne
	 FO4itpLdLZzLMw0/mpvMnmWbOEaOkda6Psxgdi24qb8VBvcGD3jrxSUMN5L9YpLr13m9b
	 PEPXEidxhN/oIaHlvHe1frpjNaVPqNx7UxY//sx49xKzH0FtKdtYJonIF2Uu7y02w6rdp
	 il0YGqaUiNEjMn2OWqO6Zd1OfFHYQ7FJcOJ8gnVNDt3lpCeWkkH+c+Ka2O0RZJKqnKAiT
	 jBP3ePAsL+RQRtmtzjIAzep5IUGVZYhJiLP1XZeZUQlMdwSc2PDvYi6GUmxhXATvAXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=h+wkXijMt26jWnEtDLY8VzmO1E+BB8IahUIUjU3Iokw=;
	b=oN1CWF2BoaCTOPT0IgJbGg25OnYczYFknMe5ezomth94upH0gq1pAzRF21aQOb/rluUQ
	 iRTaAlsY9tbwOwXw7JItWWGjNhFs1wLid/aeBtIwi/Ie0jf3EkHWZXdPdZIlnN9wB1/Io
	 eIfL7h5rAP1RXjX3AfMwz6RliKvEoM7hHESy0c2jBs0KVPcT4bwraZlizPv4PcyYT2QXg
	 hdmCA3t5x/CBevDwaFwMn8j04fIH19bSy+aVl/y+zPH0NqNV7K70OtMAIazqQ/m07x+QT
	 ygMkrXbZVNwAnjneBAXV3k3opcsjvWbFsypssMXgMFa0YDg/h7TpgTKsSx23IvUzxfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfC9zOfN;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F1F606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F1F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfC9zOfN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34647405e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626838; x=1794231638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+wkXijMt26jWnEtDLY8VzmO1E+BB8IahUIUjU3Iokw=;
        b=jfC9zOfN+TtGHvYwFdh25/WeZJVuysLM3fzT3vC4kmGLy1EsAdN6y1fFLrI2BJCAf0
         huuq9AtTIAp2fbohQJgxHLtoYbUBQ8qC5e8+J5ZVRJAPJKutBxHFK6yUVl2SYUI1HdIr
         jBpm8GxQvfNaNQ/rq/TnyYFP5MqlV+PDWEXRmRpScb6hH9eP7x8OSzeDSQOcWAUoueau
         VfWXWbWoles1KzARZdhQENXFN44yL2EtVih9Yw9qilRF2y7odjwC1DzBGOtO7ksZmLuQ
         ZiwWb6ZbEzCv6xHzGkxMY8iXwoO6JFbyTNSXEZ5cdpRAm/12LRrg8PeYDZs1fcVKADLl
         o5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626838; x=1794231638;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+wkXijMt26jWnEtDLY8VzmO1E+BB8IahUIUjU3Iokw=;
        b=kRG+TuHz0ibJ7zM9ea1KbdTSo8WnkzSX5hS6BNlswn1BJMQqRrY5YoNmHyfEEdCjCS
         Oq0lQOIkhSiFLZ2/MwtrwYNH9F8Z9kyHaK+jbJJUY5yzVIEhcCiPPYE2rlp5rvmue+9X
         Cu6dJ6ettfQbMLzjsdWKC6WZSrzlpbYmHXNnBjYzSvf8yVGNYe+YvT6LqZ42pXlBihsC
         OcJrO9S1GGaXErFzun/Ui4aPXmVvz/0U6cVvyUKwz3z5SvYZGRTJ1O9hfqn/sMot9Bhu
         RTygpJ1HFML1lhBu513dWItUCwbSLo3vUb1vcz/QHPiHS18LkkR66CRCsG7LB+MsWZX0
         YIsA==
X-Forwarded-Encrypted: i=1; AKwUvBwBnDvKVAeEdOGcize3xlrAwgWIAxIGHGSGULS9zqiotC4Fqih1IUL1Pj68GnZvPzq1QmtrFw6dzF1w9Ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU3vvaBRv7dbQxwzB/OJen/q7hamUvyTyuc6Z1zG6vdGSQTY5/
	qrlnelungYWXu9pjq75OQMB6MElYaROq8tM8U7jv1SBgiTrTqkAMkquVtDovAX3atGc=
X-Gm-Gg: AYBFou1SemLxhs+8UQS3u6Bngg+ALoepR52oA70aqw7wm3GIDGItoxfZ6quTkLGhipU
	DHT0yc20Eom2qVygkVA8iXW5lbQJIJbh9N3X0xqYH7m9P2lIy8+kS80Q8EckqiKnPWLmmie6sjM
	GT41pVxSdhqfWqfv8EvFaxOaOOw0rcFQwz6CI9crywXn26zu2u+bQDWZzCdtNbaqDopKaOYiqay
	ktL1auXKoOI76txYoTIs3ZupWve6DlDNNru2lgPEOQy3vypC9MaanfA5qEQJjnV7gMYyivFUAXC
	HBd4/Vu5hn/LOtKP3MWYnQFH/R5VZqZeb+hVDiNPz2uUVwkI8fhuRO1ztQTkDydGo1xw9JQNcB+
	SY/+9EtXYxkmEJlXvk5EOvSQLLm1bZ2TcmNWaPmSNW/wW4K2Oqx9V5MElN3hN3b92srljEq1wLX
	iOZAGaItNSHTY/dAnLyTNFDcd3FhU/AcSmXq0Aj7xz1QPRlODi0yRUD+RQEX2edLJttu0KWqOHi
	Sh2ENAPKDr8v0sueohnu/tzyAkGRwG0mVeVlWSPyeif7bUlDCbUByhwSItsSn539Yrdc385Bi4v
	kVLewcr0bKs0Uc3ESI5CWxInHJfFIiERXI+KhX5no1VP8Ed3cg==
X-Received: by 2002:a05:600c:a48:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4b22ec58f9emr16148545e9.10.1793626837704;
        Mon, 02 Nov 2026 05:40:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
Cc: Ondrej Jirman <megi@xff.cz>, Purism Kernel Team <kernel@puri.sm>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>, 
 Felix Boucher <felix.boucher@savoirfairelinux.com>, 
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
In-Reply-To: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
Subject: Re: [PATCH 0/4] drm/panel: st7703: add support for DCLTek DT300248
Message-Id: <179362683669.3310106.16771881319791378859.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:36 +0100
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

On Wed, 07 Oct 2026 16:18:55 -0400, Marc-Olivier Champagne wrote:
> This series adds support for the DCLTek DT300248 10.25-inch MIPI DSI
> panel based on the Sitronix ST7703 controller.
> 
> Patches 1 and 2 are necessary preparation: they make the driver send
> the init sequence from prepare() with the DSI host guaranteed up,
> since not all hosts accept commands once the video stream is running.
> These affect all panels using the driver.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] drm/panel: st7703: set prepare_prev_first
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/aa0f8d68fcef246d626a8edd8724e889a71c346e
[2/4] drm/panel: st7703: move init commands to prepare()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a8e72d97ce2e779a95e1d521553c9914791ae759
[3/4] dt-bindings: display: panel: add compatible for DCLTek 300248 10.25in panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0a16c2a62af399444849dfbf7c00980150371e43
[4/4] drm/panel: st7703: Add DCLTek 300248 10.25in display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8068c2f78f7233a0ab528e429a02fb73864f6423

-- 
Neil

