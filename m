Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088751;
	b=u0kCkl668CABV22utjvUyTxvnrnlg/8HRqgVQDiuXWGpDOV6x6EvqkJ2SfVk9vp6sS8Y
	 XXuBbPkD8NgTb0Aox75YmGpV5iBtRRk+Tx5H8MTxjGuGb88idKn5hf25SV/TCVnAIw6pJ
	 RlCnYPMm4CSENxTKsIv53P6KAaM3h9DhBj1SIiXItCgtBMai/EAOmiwoSL8je3fYO4lKQ
	 R1l3cyzpHlNz60HDXCRW6fzqwTpJOhr/l32HbcqMvjNrecqt4BRaXWEmX66uUYyG0DBum
	 DhdDTnSC4XM920WSNfWgaPRbZCgka3nJxAODF9yVuk98nPvvW07eyN+ctDT4wsP0EfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088751;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FJIy+SLFeA3/C6VIteyOfVGbwqXel75/TJmRF6auaDE=;
	b=kQu2s97OkTjmcRz+8RZCOrRP3qFJpNzVr4B0HqvFqwD2Qhx3QH/cBjMAL2CEXs3gdAGv
	 QuOOBN5e3tl0p/sHKq1L9dHJoRruLEXy0eMq4eM3XkSVIFBqRKB332NyTDegmLbu2ijyO
	 yHejh0VUg7Xs/1lopNYsk1Uv6Qw0XziBuunNofCcqhZYqz0tjebbTf1E0elupHt45AXhC
	 gFjB2QRKuI2iYfCeVqBb2CbRAnDf47gIaaO+8hUeneOMWBo4raV74xPN/HLOfAGsNCURt
	 UR8mS19LY4POaIPL/gTUL+Sa0ig4HB9iy1tJOqVbI21+/OBnDJggPsaFwLAZq2NOeEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cr4+YX5L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55821606A31A;
	Tue, 27 Oct 2026 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cr4+YX5L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8EB1F01829;
	Tue, 27 Oct 2026 08:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793088751;
	bh=FJIy+SLFeA3/C6VIteyOfVGbwqXel75/TJmRF6auaDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cr4+YX5L8b+JDgLe8VqKWnOlsnffa/ODJy2Ou4qjWz8zlG9M0QIlLf+22C9+3771U
	 +lLULH5+2ybGwhwHmeuHjlxqFZ25swdI8jyagdxGGnv7SFc00cYxeRrQlisKAKHcft
	 42qp2aG5np/ZvNNkn25ShHrRkABsSAt/lQfhDMHroCBRkGARWJDmYrMSOfh3qEeXDo
	 ClRuaOihAmU3gHRyOfQ0u4hKyf4jqKpQOZGhiYPBv4udm8A8LY/IMdUqsy7DH78qgl
	 uAO/IFnCwEKuitwdmQ+dUOFJWniS/WSW+aXzuvxmR/pJEADDmLcYouLl04B2TZaFFp
	 6hGnhRR9ppRaw==
Date: Tue, 27 Oct 2026 09:12:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arpit Saini <arpit.saini@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
Message-ID: <20261027-fantastic-benevolent-boobook-272a9a@quoll>
References: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>

On Sun, Oct 25, 2026 at 12:18:17PM +0530, Vishnu Saini wrote:
> The DLC0697 panel is lit by a separate backlight device, which is
> referenced from the panel node through the common 'backlight'
> property.
> 
> Declare 'backlight: true' so the property is explicitly allowed by the
> schema.

Why do you need to explicitly allow it? Since when?

I see no benefit of this patch and commit msg does not explain me what
that benefit would be.

Best regards,
Krzysztof

