Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360191;
	b=X4jU8jrice+l1wZZnFsYUNfjz+C9AmXLXOACnravM7NZsmS4ckNOcrw/wZbBTx9WBDQG
	 KvURxV3W7Mzj1PqcVXRIKrktycQpxq3zHO8P3L2esDMS/ccgQeiXc0rollx1h2HOlgs7Y
	 g8NC2mhc43KJHsZ6ofOWtzllC50fzhkp2GoNK1yr0Q64uxZv5jAN88jwY6hvQ3WgA6cTW
	 ST8rWFTe+w7VGt7OGurRq6WoPXbPzdIHHOVM5eM3H0wWA8tpLRUTPAhvQc9EWj30aSEgl
	 xXZz9KaWC0SUGzzLHfn7B1t+WRi+r96B9gZDDHS2jar7stQoDFZ4/CC88qlo6TqX9FA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
	b=IdqaVev9AaxPMDyi0z6KWbF6hod717746atwFmSG1h7K0EPPGzCZ/4fleoZAJQ7ABl/e
	 nhGF3Awpp6QS6ipTfheGi6F2oChQQ0YAO7NxuHZFgzYZxqFnmzBkNSOPJGwRsMroJghA8
	 Q94vckDi049T1cJYE9T0+Bfd+ODaAWZsnbJ084Uc7FGZh/9dtcrIaBK72vk2apIZhhJjO
	 Wsd9gMk4d0evhnAYRcv2knq/rUrCflFjEnZfGjN/h6Tl+2Zs791gp9gf2Wr4yBH5uoyoG
	 XzJI/43vI6I+eSgf1gk0B8pnrX8s98SSaV80ET/ByRifGQk+SFzyCQhSBwc/09YBH/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=YE69AjFJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5B6606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=YE69AjFJ
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e98798cbddso2672295ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360190; cv=none;
        d=google.com; s=arc-20260327;
        b=GT8hi0/dbGG7IeEzgJE6vL0mTCYSmmGl6fBBxUpmjrNwhwOsn83LoN6t9FERuUBlAn
         MkKKdCi/RJru4g0FBJX+8LpSwt/XImMgx1fHKPq++eto/LkS7n6Zz5zzy6yy/lnsZanb
         sdDfDiVPToXPJ5SBpj1Lab1LHd3dpqSByAxcBqdbaNqHAMYkOHfIt2PmEpzWME3O0bHZ
         vSOaCytWmg7bfGAc3kUEVxOJJ/CK+93sCjQUX1Cr9/l1X64TZsnYNmKwWupaMyzkINg4
         W7ZcCR0R4ct83TXImJRI5aaR//4ZfoaxvRx91ml1+8fz1Ao7xmbrFRETqXXYyghTRJv4
         kecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
        fh=Ts3ErbTJOFZ/DGQZIE9jDU8ix8+7OWrXrGCMQs0yUpo=;
        b=ao9e3t9PcdvkUo8qiIx+yI6RxdWXnqZ7FFtWyiMyStd58jiAFnMGJzxySWvRrM9uAe
         5XqJaAwuqLgRhZzkIqQa9g8cUdkNdpSxvggtuy9kXudjN8gYLJf7p/3zm3r/A748vQt3
         DE/bTrsuILFf/jMfShVdMgmBdcazqr6PfwtHQ40rl2AyTxzIWnY9apKbdVcC9zTfZu2Q
         pBIgf/EHEFL8Z+avemRAREN8NZ3cxTvM1wqwE8GNJpNJej0NumzHkSlRzicM751fgEjM
         5GIybo3wDbSvq1WlyTfNcy8Xp7TDHdrwmEd0dP5OtRIYC2FzU2VLMpdAW/Kz4RFssDGG
         CjXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360190; x=1793964990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
        b=YE69AjFJX8iH/bYVabiBDOlLVZuf4MDa9bU458YlPkxrzkq7hkxPVR+o3YJSNYeYhQ
         o/xTq+Vdgo7EMIdvC0T/La4V67J7KtkDP7jep0ixIgwq1GCulpTp3bdBXMM/bnXtHJtO
         L+paF29Jv1HT0M+d63Bty+LpwoSHhkWMkaW6DT/PmCdViksjsyu139fl6XGBuAAPmWCh
         wFjOA32Geyi0GuVo6xT7eWxyaZ2CmoREooUoC509h3ywjQfh1DBeF7HwubcHMFht1GEv
         UR9F7mOocFcgLCbaW46DhEy3OVPU+uJFn+Sk2ifiFzjaHrgS+1v/nvNwkQtRsbxjAw8j
         g1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360190; x=1793964990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LtCf5nVW5bznJzuzPUP3xJSxpr7qf7Ib525PZhWyGlc=;
        b=iCW7i3zpu87pdNdhzTwWW7Qc+L3UEcTOfvSIMgvP5rUUEgkDni3S5N9H9ihGofhHAG
         uGJWv03QC5g1aDTkiA+s8CncajtZ2D9seQWSSXNKQz0MiOGL5inZQnIVhqcw9//kwd7i
         7W0hhgl8D8cpxWoW6tmezwZX0VwCh21G1EZio+19XhCsAZxEcRcUWHJ+AynSdmbqghce
         aL1D3n6zRjyKD4opQY8Y0/qx1DVJIcQOs8xgV5V9QQbfWrdju3S2MuSsOu0Jey8SAesp
         sdRY5txSlt2r8g3IP92g2dYXUVPWqiYiH0YC4VRNxTz9b7509xmXJOTESEBoLMyjMxIe
         3NrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp9M0goN5sFDEH3KTG9VuXiqqblt2AND74BEbiSqeM6im+lsjuoeIHIg4vNJsv2q4OmL5sIRnC8wuh2lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtJXse+JW8kAL/7nr8eVrhVDVxjjbk/djp2iWQMryO8jVGt2ab
	2qgH8HhKezNNaCZYlcm2UuzR7w+BxDJMyvjQIH3NOe3qYAfCu9gZFUoQ/DF9Zlsq9v36EokCLr6
	YziB9zgymaNgkwpgr25DGmdY2UrROYwscmCIcypMmpw==
X-Gm-Gg: AYBFou2zkLUmGbK1s7KJeUN95IZXSihsVC2WoJB0qZTiewIrhDtYdwO/SZaSdI6U1RC
	Mr6mFZ8baLwxEkN52OhYdSuODjb6pOXtMXuk6JaOXvDe1L3CtUmwfuez6uXm25yHAnsgAS/kcxr
	sXrSltgffFRMxDDUvEGefj5gsXzTiiRdobv17HsnSH9toS95Mjuk2qyd1ymXoBtZAfIdM/trouv
	x2eWUVVjY8m5M9MoV2/t7mkr8Hqw0rc0bj6/NVtmWMmQB0q5yDuGPM5wQuWj3so6NmenmfQXAYt
	5Rz5RtxRBKayGspPj8PM+7EAuZ7Ktm1054BxR23m5i++XNdbhjKXBjzRtWrJ4XJHrCCByWlwL+2
	Bko2R+3dbKkOfnjMrkCdEBksHFlLK9KP5TxFmSZM3rPPd1iEY54FZAfhs7g==
X-Received: by 2002:a17:90b:4d83:b0:3ab:d26b:c2e9 with SMTP id
 98e67ed59e1d1-3ae89763ad5mr1536469a91.33.1793360190259; Fri, 30 Oct 2026
 04:36:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-6-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-6-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:36:18 +0000
X-Gm-Features: AclHuK-U0mC8XWkCgVPn0dV4tOoEVFqDFmKaCqBI68agDhWQD9u0tSx5WY3ydLY
Message-ID: <CAPj87rNJgUPhXtBj6tw7pzeHqmbPwkmVzzc6fT5pj_XxAuss=Q@mail.gmail.com>
Subject: Re: [PATCH v5 06/15] drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE
 overflow on 32-bit
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On architectures where unsigned long is 32-bit, VOP2_MAX_DCLK_RATE * 8
> is evaluated in 32-bit arithmetic

On architectures where unsigned long is 32-bit, we will never run VOP2
code. I guess Sashiko doesn't realise it's just asked you for a
functionally-correct but completely useless commit.

Reviewed-by: Daniel Stone <daniels@collabora.com>
