Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626838;
	b=Wm0RpSxYHZneuFsI8H7Vfx8jrNXTVEmWlLGLMfM2Q82oDBqpsWkuk0TpQvJq4UTn4Q0v
	 PXNL7H8Y+vLgy6l8OqIUlrjIDzg9ibiC4fhEgBs4fMty/IsQ6hcTQw9oAMpOIS4MA+zVS
	 lCdgPm71fdKWlhm6HsBrIF8RcnRV/R8qTqEzjOlpoO0MnfPwKS74+VoT/+EOX9cEC4TwA
	 heJ5xDLQthEIAWpTDh2HrvMJJ3Mu50vqgaCM7I/vlqepNiUZkk3shuVaaxtUMF/dsX7yt
	 H98BgCyv7K0AO3cNn3DBj+L+/u9WhED1/QxSIGR/mr0NgoiELxQ1r1u7NuWOTSCKdPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=ijcQqp+PDwh0iYp+MD/r/nuQr1SB4jBOpcMmhui2GqI=;
	b=lBSeiJjsw0zK3q3fDXpLCp+uLDIiRqXvwO+BvgtwsjA6DbP1wCLdxGFOcVdUuB/uonj/
	 GkeupvClG5w0ybaIOIW22pgJt0bItwnZMTQBJVilOFuffF4upWLhV6JkYh5Z3OELtWIfV
	 RgBqJJ1O2lrFc6IhEdEmz5G2IGGpqVPuavOyA/wvZr+BEi0RPpitgRINGJlH2UiKKCBFM
	 5f3auojsj7YqBLeUemY4Wmp/B2btiKeVPDG3DjJzKNxFkynBRpuDJ0fQXaB4Xlco2pM6X
	 T1BWU/6flWJc+barCxAU3CXYfCRsb2UOPclkp8VqcAEVwSBg+sfd2RRQLVRinEBie9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEAb9kZe;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B864606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B864606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vEAb9kZe
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so34647035e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626837; x=1794231637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijcQqp+PDwh0iYp+MD/r/nuQr1SB4jBOpcMmhui2GqI=;
        b=vEAb9kZeP/C25ewsu5ITdxJmy7OKRRRgBo0AfsRkKR3ew1HoA9CLk6qGeh9JOHEDCL
         ynS0Gfa2GApWXzOJBpNchtmgFhfX1TTsteJBw0I59TI0+NwJaJYCKJ8BozyQp1ENWhhI
         akP1wqHzylHwApLzUbDz5Jmu4toyUvj/DE9KDMHTcfpWDOHRegHrgzXaDNc7sAOq8Lse
         6w9KRpYaxYbgLVLc22PpmNa7pwt3m8/FsFcocIC6V6krmdqouUKR96jcJhbvhGysFU6B
         1pOmbgAZcN2FYBaU4PxYRMNzTwYVD4MMdsMz7B2R7isbcq0pvn43rTMn7501rJSQYNgT
         2jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626837; x=1794231637;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijcQqp+PDwh0iYp+MD/r/nuQr1SB4jBOpcMmhui2GqI=;
        b=eqarPG0ysGUD1vonR6FZjGCMpsH7eQrj3ldVMdcYtW66hgfBpbf5jBO/cvAo0di0PM
         3MG8BVWZDKJIvixzIlETASgwOcimuVWV+adRMdj3ky4rzQSHR3j/mA+QNkbpTX8CD+d1
         584HiR82JFdxu4JbwJJCMR1RQsS8rZb8tXolfq+bvjujgRP/Z52yOGT/LDxStiuEgD6o
         uT6uSmdGcBMiKrj1R0nO/HOneJbk5leG4Mf7Dgm/v04dp97jgytXvSWeRleZeqPyDD6C
         hJVW7kGUdWRn/JPxdgv/7TqVrI8xxjFKT+PyZYN0GKcfDXm3ky5o+CqjloXl3gvjqkf4
         0QdA==
X-Forwarded-Encrypted: i=1; AKwUvBzXbPufLyHOH4J2hXTARivdIYimUQDm2oVwng8NhYY1SAnhXJKOMfcEHXMxlmtkfNeXQBsw2AmeVZEV7kY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVSFQgwBHVqX5HsJikfDvPis3/T1YHkGzvOzt6RBLbgmWrlRml
	ketgkF054aBBvPjtM3T+kxJ57dSIFAXqzznN12S5juuz0y8ev2B6IDQgrlkPC2rhpNk=
X-Gm-Gg: AYBFou1GKzzUA6UDYbr7O4/cpUupDmTEaXutVaxpSdDPVy/HpPBWlQmbFHT61Ugpm/D
	5BuefC+7l971NxAZCtk+wSpVPEoEiDG9hZ8rUTspzJiD7xItyKjI68hjUCVrf8hdPVpq/Fwd9XP
	2Pg73N+Gsq8E+OH50cvly0neUEXrF0sdBERe4Yd0yNLyLeAyA+nAPqxHI1dnhQ5jRYRj+kawBaU
	cGtIErYC8o9YaCOe1VyFns+Ky8cPdEa1dBPPJkI/rtOBlaqOHCyx2PcYKrkgO4FqWZ8EhbdFe7x
	zmfY/GE8DeYJtAYf7IWwwNCXc6XcCBWHVkBEXTOjahsgLjxoBdv4/LC9QzE5y+PdyA4BcK2a8+V
	0UuSwq7Ffoe6VwaD3wRC8xZyZwRj90oIx2629aWas7IZX4w+5dImSZbPvDXq0I9PSgABAKAeJR4
	BnkT0I0APhvzembKzwyeGl/eL6yctdERsdv58P56nBkJAybDBES+OTxS28lvyvgeeQR6a3ICiQQ
	smz4LdLgdc6lY79fbtsTiMEk7hZqXCyNO85kpeZEWQ63KpXDrAb1zgD6W+twGebkbrXIJ1nvSeI
	8q46q8tgbREwm73BSc0iwkom9vasNhcacMHmKSYG26ajHqy7nA==
X-Received: by 2002:a05:600c:5397:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4ac1899353bmr229794415e9.31.1793626836593;
        Mon, 02 Nov 2026 05:40:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:35 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>, 
 Felix Boucher <felix.boucher@savoirfairelinux.com>, 
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
In-Reply-To: <20261006183455.2350966-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20261006183455.2350966-1-marc-olivier.champagne@savoirfairelinux.com>
Subject: Re: [PATCH 0/2] drm/panel: ilitek-ili9881c: add support for DCLTek
 DT300249
Message-Id: <179362683550.3310106.10835901197698489630.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:35 +0100
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

On Tue, 06 Oct 2026 14:34:53 -0400, Marc-Olivier Champagne wrote:
> This series adds support for the DCLTek DT300249 5.5-inch MIPI DSI
> panel based on the Ilitek ILI9881C controller.
> 
> It documents the new compatible string in the binding and adds the
> panel descriptor with its initialization sequence to the driver.
> 
> Marc-Olivier Champagne (2):
>   dt-bindings: display: panel: add compatible for DCLTek 300249 5.5in
>     panel
>   drm/panel: ilitek-ili9881c: Add DCLTek 300249 5.5in display
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: add compatible for DCLTek 300249 5.5in panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/342542e4ccabf8e768293eeab4c4b43337708a54
[2/2] drm/panel: ilitek-ili9881c: Add DCLTek 300249 5.5in display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/164ec23bad8e3885b7ff8b881190d162feaa32dd

-- 
Neil

