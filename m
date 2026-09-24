Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9792B361954
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258373; cv=none; b=Xa4ct9kaV0FUPTM04D0SNeCxsqULvwylqQoPhpnNqGwhCNj0Xu+xVl1DM7ixDVbvlF6KrgT/PV9E3fta/DmgvdgEgcevNV6nNl5VgbLfygxalVQPwSQqmrAmsNY5MFLgQc9nW0ZEURNJb8HR/impPn/E1Cao3F2x1/LZVvdWF4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258373; c=relaxed/simple;
	bh=L/4hv4EZEMiVQux+VtgLwWpL0BikHh5yp6cw2LC0nRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pAYEJ7v9vT9zcXK0/6wZ50/q4qaWKBtdDms7Hw3q2O/yC5Yn24Ok1/c+Cx/gl5F1bb/4vDOdShVaEODofomPXozFSKRdq9sW09fPRSp1QBk9JDujOQlHMuNRrNMKc22M1sdk7sGk0jaYBv+IAJVJIuY8yoXdtTLqHjfiq7yXT1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUesZJSa; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUesZJSa"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so1871702f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790258370; x=1790863170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tts2aH+0naRt7JQ1fJiXvGThSzsg6pVhDhZq99ElXD4=;
        b=lUesZJSa+l5W2MHsBPczoONAi3Px0Nx1dxTEHTlSea5q8iUI3tED00EXk86fGmp53R
         iCosFJVIGJ6FhicGBEj28mxp1VpNONQaUbZrO2ImI89eQ7a/TWN19kEblZBkqk3AjBuC
         8WngNz5JWrO+Ei5kkouMuNFqK9GieyQpjXBM+R/qoGar7xIJvcyF9Yyc3DxLZB/eZeyK
         EhnTWR/QKrrNi4fqI9loH7XVG1KT/YLlmLd5NVhE47Cpab2vFEk/5OsgDviDnirgePn7
         8x0oSJ2A9CBaopzZVkqEVW8GF6PqxJ/eC2TfApuvb+q1JN/vDWfa4Jjypi+ZJToGAjCf
         H4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258370; x=1790863170;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tts2aH+0naRt7JQ1fJiXvGThSzsg6pVhDhZq99ElXD4=;
        b=S/4uH2ks3HMniWCEOJ1HRWbOAzJtgO2AiNu/MSJKljtWH3xzUisjRLNsfzns84dOKC
         rVB2f+CfUHYZbrUGHakv+TZt3H1wTaAm2fgWszR1ULXPUysC+Ag1P3NIOomobuDDF/qP
         DfeZ8LJ/HNIZqoSxcW4cNWiBP4Af+HM03f9e4gDOLXhtP1PPnJxSmDLzpHcR3NNrqscB
         yEAquQzxOYBnTSr12dAY9T500GadiwyXqEqlszQ26m/hfgPd9KmXzHoWXWGav46G3iGy
         rsOh+ZyH5Lc2/ay1CdjYEqrpH6ifQe/Gj07ItO3QboIXdMRM7foajtgvhkvIJ/J5JVgQ
         bwuQ==
X-Forwarded-Encrypted: i=1; AKwUvByKSYA5/bdWWHVcnrVaMSp27sgPRrzTJu4lzBnGoDlW3QfytUrLmd4TG+fM8w3b6vOmNFriKcaRnb3Kzx4=@vger.kernel.org
X-Gm-Message-State: AFuF++lFOW7rg4Xn5mpxd4FuVd5n+iQ48tLUjx/jS48l4nlRGUQijgbh
	Arse4O7JMewTYLKsh7o7qnaWzwVa28aNtbfWjTOLlxTs9Lxoj3nossnj2voDQA5r7+vMTtSqm1n
	cJkBX+i0=
X-Gm-Gg: AYBFou2wQzgDmhoIthUlvUD7qczVEmgGqRUIeCsbCPimMO/gGXgsA0cX4MamI5UxCNO
	4fPRBT1/KGzG+KqEIL4nffkS8FMERS/dsIajmPWXtpcDXEsPuaS1lv//JkkyEajMKOoGqipvwCT
	wfkMqyXvBfEi0FzhDtsiS8iLdGvX8mmlu+iCUHfC7rkxUwQ9bAJb4vBIIaaITMZUV/VAnmksbsG
	qMRNTkkv0hpWJZYjsCD1/C/GvIX2EZ2xpy3qULjPFkx/krJZqEeJ3PDsobzG5bTE0YUOf8jKQlS
	3owHhRstRklL3VO1bLitXVDF1h5TFx9Mr40JiFQP3Hsmj4GhMkqEoeFVWYs0lsSnvko8K90GeoQ
	6LfjgUhMGXZkhuh2+Pozj8yVSzFWhNRJIq/XpFgZK5xy8pa0O0hWC3Vj+Mtt1hldB4tHJ5mc0aJ
	rodJ1VciQypZgOzvrDbp5OeI3Oj/HBejqCoFX5P93lnUf9JbGk3+ntIoME34BfnQiFfMEtmJZA9
	6f7y3AJz0tTPB8dnotF
X-Received: by 2002:a05:6000:250e:b0:486:f770:787 with SMTP id ffacd0b85a97d-48871769a22mr5154051f8f.31.1790258369629;
        Thu, 24 Sep 2026 06:59:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm15799213f8f.19.2026.09.24.06.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:59:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
References: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add Truly TFT320240-229-E panel
Message-Id: <179025836882.3234093.130291455472831294.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:59:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Thu, 17 Sep 2026 13:05:13 +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add Truly TFT320240-229-E panel support into panel-simple driver along with
> the required DT bindings documentation.
> 
> Alexander Sverdlin (1):
>   dt-bindings: display: simple: Add Truly TFT320240-229-E panel
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Truly TFT320240-229-E panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/001a7baa873891b7558f6b91e36136bb8fc66fc3
[2/2] drm/panel: simple: Add support for Truly TFT320240-229-E panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/45b46cd3c477a2e5ed547450a15dc80f0593f418

-- 
Neil

