Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626847;
	b=d5UaBQmbfd60va3A8s2uOfNOs2KOd6Qm1rE0vTRYFwTxOcT8aTTIlk6eBuBnu2d8Lpu/
	 LBkmdAQvVU7zDoDXgiIrgmWG1UP9br1k7IiUa2HYiNrTDcEun90JDogE9kXJ/tW0ZWKgn
	 tc/x01P/rNsc9+aEc+zrGALh+mLT2UUrS0v4z6kIZx6UrmyhCiWDC4BB+18V0O1vlRaFu
	 TJhpKUFYzKEoNQ5IfTRcrpmz2DMEdAPyAlI7lRgLoQfaE8rhLoDtQ1MPeRCACQ6qdCbvi
	 cBDJs5vUVTA4lY6h+JPi0z3oz2rXnJ1Zplv2SRxQBjZWxmHJW6G+O0NaTWuhoftQFsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Dl78OSEC2a8P0qNwjbCaKAfKyZ4r0+nLQbHmynuYPGc=;
	b=OEGYddCOJPsuTjxHg+THu7MBSmK1D2PekOXcbcthbWZokvXtIBVsZpeMdWRfRTB+IgjW
	 LScEo4FFK3jv2DqCnCSbZ2rzmkDNH2+Hc2tY3ZO2UyZbBlUpJ0wvUq1Uhvdk+MdqgB7aI
	 rdWdMiAP+XZJLTS04Or6yBZlIeb3BBg+5nLF6o/WcoZDhYLC+emjcxbjFncZrt7pxbAYo
	 zIkwpSA+t3Rd86spNU9XilVTKN6tBv8+WyndyXzI1fCnPbJBb1HAHnAO1FsnylJClFE3S
	 0wpVdZ1nTMcJlPE7+pfCedxCug9lGEt8mUWeo5u29phNuXChkV5se9j4LYEgVqa0xqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pGkOIJT8;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED5F60A5BCA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED5F60A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pGkOIJT8
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so22822535e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626845; x=1794231645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dl78OSEC2a8P0qNwjbCaKAfKyZ4r0+nLQbHmynuYPGc=;
        b=pGkOIJT8aTj7/6uiIaRBS3XwqfzCUiLgyjr+tCG+wwhMd6uN3K/73Apl4KlOG4GhNr
         gYiqhRrlgYSVaY7APylkHGDuW6gpsEqkcW9llLievmRJBHXfm9PpGGMzdhdv2vGddSYW
         0ZlNtSb020V1mglQBLioU+kZ/Vd+1pDe/n7QRDKkoKOMIqLeJtP9e/eeK9wy01cGBmO1
         K7KtIn/1dy+SjWLlvY7vzP/Jd2rjTuxfGEnhgGOxpBc3X74P4KH5rd+abpBDcCxInnTQ
         xq0hm9e/a+qKjV6NvNW7tDJ4V7hMjYzCF2mOUJf6ONxWc8Z8amvSDtqIJZ2zuKqi0WbV
         xnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626845; x=1794231645;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dl78OSEC2a8P0qNwjbCaKAfKyZ4r0+nLQbHmynuYPGc=;
        b=ooNn2VKCS/PQczjf6Xix9TCvNBgT9b9mvaL8F0khedj0va9mb4ZSwhNHP10K7URk6/
         W0wIZUNqiugWKc+x8X1tVlNCLFFxpK5F1GYrgVq7WbbRcjnI9E2Lb0ZrvGJRJa9nD8TZ
         NcDBu7H1dE6eg+CNOIV2luOjjOfRyLUOWNGyIv+9SY6n97AIhgsSGsQx5JIJdFIgGObf
         3eEG2InSYY37idFXnGjDbT1cY+dvoiXti/3MjrNvE6ZzJfNPewsb+FjbgsiGjQJCMxM6
         xtLBbyz9LVOJQ0+Ig89KBow8ekwsrun5qSG78PivNhTCX6EhcYzUe1DPjIFwxAY31LPZ
         mOrg==
X-Forwarded-Encrypted: i=1; AKwUvBwBwkI0ZMv0rNusHKyekFA09fVHMXUz59ZdLwgqQ7MWSn3ziaLE4/7JYcjYcJiNJaJcOlmNT8mSWR6G5gY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdOy3eGOaQ9N3LISKYsSwpImpeIhewG2/x3OdTaz5EkkVgQHhb
	HajXMD13WjMQHH5a4EAjRQnL/4BhfBfxhsm9JdohcYqqwlQUEPfxW9reAcknB2FvMP4=
X-Gm-Gg: AYBFou1TKywndfJ1HLfRqeZs1jUUQnZsrokN6pz/HU6fPSPGBQnqyKxBB65XYEGRQgI
	FBXc/UWd1jL5JtMD1t3qb5DsEC0QmiWnWCKo+5dssmxozbqreRs3xQMIP+5ppHJAlQwSVOHhU3X
	8j+Z2AejxWLu86gdrehWKVv5b5K7jF1Cocc9CaoE6YRRqTuRTFJrb9nqqKPWx5ilf3usgF/Ix97
	n34V0BxZz/My9ZqMpYB+bNo8P0GAu686vkUXRNEobiZgwoSbBwo9rTPXpWXeK8KNWl4VPQ2+k71
	mtS78+UkPU2o9KbNzCEuUVRqRe7Stqo+SNzSggaQrET27rQnDt1OpPLZ64uUqQYFItmcteLvw+I
	FXI91EDCsl3GgPdAhwwF6s/LYrrd5VlQb1QPsmaO8WOVYOVsYHrR2D2X1vTC9GPF7gyTea8Aa53
	nq3ITEaPnnge9o8qMbGxAz+ktyDVqrUdcR/rQjXPODjKQn0+4xjV6/noZZtSitTmn99InnA0dWL
	IjrZa1uvqL1vtTubDC89+WTf9OIoxPsWUbFtzwpJaNz7ZuSvbctv1NhD0hhQk7B1Ca2IbE6rBzr
	HoHv+G7mju5IS9YXWgTaFbwpvxH5SQw6w/qiqGSMtk2cx+88ZmCdtRUISspb0Jglg2HzXN4=
X-Received: by 2002:a05:600c:4f82:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4ac1889c857mr215222075e9.20.1793626845007;
        Mon, 02 Nov 2026 05:40:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ishu Brar <patches@brar.si>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261026-panel-ams644vk04-v2-0-e88cafb3e577@brar.si>
References: <20261026-panel-ams644vk04-v2-0-e88cafb3e577@brar.si>
Subject: Re: (subset) [PATCH v2 0/2] drm/panel: Add Samsung AMS644VK04
 panel
Message-Id: <179362684370.3310106.4332858082729247133.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:43 +0100
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

On Mon, 26 Oct 2026 22:09:31 +0530, Ishu Brar wrote:
> Add a binding and a driver for the Samsung AMS644VK04, a 6.44 inch
> 1080x2400 MIPI DSI command mode AMOLED panel with DSC, used in the
> OnePlus Nord (SM7250).
> 
> The driver describes only the 90 Hz mode for now; the panel also does
> 60 Hz, which needs a way to pick the mode from the display pipeline that
> I did not want to invent here.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Samsung AMS644VK04
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/362fc4c73d39eff00ff1232275631a5b05474a52
[2/2] drm/panel: Add Samsung AMS644VK04 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a72e7d5b3d038915e05a1c459b513e40f7e06ec2

-- 
Neil

