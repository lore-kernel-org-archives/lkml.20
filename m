Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9CB41D64E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186567; cv=none; b=NY2eApBs/34pCI2y25d3nleVe1FAJ626qM9Tk8AhOTCpJIb6kO0kmGjYKcaolG49lbqvFRYoa81t7hMooCfhK8bPqghFz9oL0V/rnS5C4xwOV652vMmE5wtrJ5tZQyxuew0UJFgjEtZfLYeTUcZkQIWdsVpLPnpnv8WjDnwyjrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186567; c=relaxed/simple;
	bh=c/AO9mlLPLcxcm5WfZp7uIom46VnbsPApFS71v5t4U8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W1Tyji+3sCEfMHIN2+XzFYs/yfRaXlxFlscyJNnlPvkl+oSJon5U/AAdngpM2v8+0JQC05qs8Jd5p6SdBpwrG1E5t1hh/1oStcigrJEwUNNwwRg1tVwO8u5fLIS15Y8VbiJiHuVIPe3L6Pe2LwKXEnpXveCQ/db510e+NVTLYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjoHbGIU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjoHbGIU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso13162445e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788186564; x=1788791364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42dtUqvN0sDvzTs9n0Ajnz+iSZsJQO3TYWIEYeQ7is0=;
        b=ZjoHbGIU6MrztwPzKXnzHv+HzW9paeCF+KhzpUy3AdkJfm5tfqrU2K2YYmSzVWhCu3
         Lsv8nwPAhE57pOHyuc2s8QtxxGZH67Hcs8Yz+hqJRHgP+a/IFGOFgp/Vithq4J3y/gkX
         TZCQiXCoxzIpQ0AmMx6+4tyAepuRVd7O6S9FNMTPoh1t9IWWgNErroUhtiUT5CRMGhiZ
         +pjeYTOMM64p9CODy7FwaOqWSrXnX+dOZec4aSC0iXBmWfKRGJrAOkVpuMMLo+xLwEU+
         yQ9ufmG34Jbo5ha70wmqXAidU4slqOttyx6b3gqXHQwEmllrMFd1rnP20lAZb26s3uQJ
         iZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186564; x=1788791364;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42dtUqvN0sDvzTs9n0Ajnz+iSZsJQO3TYWIEYeQ7is0=;
        b=rLtC2PsDpExz+u7ZD6Jm4Juph6aF2NDho184waH1fLFSO3MfeSp19TkoCR3aQni2Ek
         y1T9yLGXl1Z1512hzlh/pGinMSYLQTexIdLJ7lYRWcjQyB8QkI8UqXp8IGj4NqR2lo4f
         RoM8J2xSG3NjhFElDqiFgE3oa3w/jLpuU3e7eG3x/dfutsQrMmN4N3CjqAo8a+1qgTHq
         5hWZQ2d2UujS435ZrRA9aFSdpCHRnWn+64wAwX3nouAiZvO33F9reardR83nD547LU1/
         6uwNu+VEqvg1L9gC9OywtSnsQk4SXhnmY39IQ4ctsR6qF7Zeh3JPzr/A8sbhAZ+SHoH1
         5uLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvO2/+q8PDoUy6w/EFrcxc/Gm19psccYx/b+nxHrudgqpIBY4XaCr9oena5e92G9XHoILsqfvGOi96y2I=@vger.kernel.org
X-Gm-Message-State: AFuF++nN6Dx6zLYsYefUJ3GebjmnEcANNC5gAMFzCLWEF8juUJDQVtLj
	o5X8TyrAv+KjSK4Eoo/M0X3OdoOWjKu0gwXGJVD3SlT1M0WLT/pdcBAJAmZLD5jRzIo=
X-Gm-Gg: AR+sD10RaLycYEv/qCQESAZLSpXUgy/npq+Q4Q9KAngQJY3FMEvt+9CMl3g8auEnwB8
	jhFC1gGt2sRV+NUESplFxe7tk2AyhZdDzd51c7C4FrwoNd0YN8XV0YtitXETklnvBimgW3gDioo
	C44USaFryAZxjeu1Hp9EoDuPB8yXPNRTdQ3E2rKPyLYd6Z+Wsrt6gP+AC3xI4gVIo26LGoKOX5k
	cgyeo0iEWbAxmUi/KKJATlSuXh1NDXbbuPHntFqZEtFChvPOjo/urVDodDRSYb8E+hwmkNpAT8w
	WG5IklUzjQ1+l4S8KvmOxj/CipKCtOGvCx9Lz28uP1bOGa7WdxZUCErTckoCfi2IFTpnl87wRQ7
	ks1dOarmGW0lbJRrOwaaQ/McrpUsU59SBsFfjUg9LSn3oiAwkVYeg8Hp4vsw0eSnmVetOWo7ifX
	An27IDqgDnO7w4ri1P1Re/vu1TB1m+LBkxVRr6lFy2wA0dZKrZPx2cGn0ND34IOaRf79djUoXl6
	VI6QsT1G88HAw==
X-Received: by 2002:a05:600c:c0cf:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49b91c51e62mr367747135e9.14.1788186564317;
        Mon, 31 Aug 2026 07:29:24 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm145266605e9.2.2026.08.31.07.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:29:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaron Kling <webgeek1234@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260808-ili7836a-v1-0-07a7becc5636@gmail.com>
References: <20260808-ili7836a-v1-0-07a7becc5636@gmail.com>
Subject: Re: [PATCH 0/2] drm/panel: add Ilitek ILI7836A panel driver
Message-Id: <178818656303.2615924.4877103512503955677.b4-ty@b4>
Date: Mon, 31 Aug 2026 16:29:23 +0200
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

On Sat, 08 Aug 2026 14:01:13 -0500, Aaron Kling wrote:
> Add support for the Ilitek ILI7836A DDIC.
> 
> This depends on the Retroid Pocket dt series [0] for the vendor prefix
> patch. That series depends on the AYN dt series [1] to apply cleanly.
> 
> [0] https://lore.kernel.org/linux-arm-msm/20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com/
> [1] https://lore.kernel.org/linux-arm-msm/20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com/
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: add Ilitek ILI7836A OLED driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1b59be32378e9ff5e9d1fc1168e46362701c751b
[2/2] drm/panel: add Ilitek ILI7836A panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8a78143d94bbc9ed471d57599563bee0757493f4

-- 
Neil

