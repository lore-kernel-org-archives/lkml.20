Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793881150;
	b=j627aIFt6pCLIjnPGpMwl64bQ1QpFedkrYJDhWipltNNTdUfUiO+xBbXj+74y2UIw3Ep
	 cPlGXbw9nY0kFgu65XL0b+ZtUZzlbImVHl8C9KqlAPlQwIMaf2Al21tTZESNYIXZ0AgKV
	 sQWVG/eNclxVnSsNqcfcCOHATWcPGVyVgalmzFjLNcoNT2+u4+wFQLA0YAl6mejCkeo2h
	 Rix5/4CXZeCapoe7hGP40VtORvlAFbXM1a6J59arX8JXqEN+aTqKrt3Aw9zodbHAf30TP
	 0tRBHG33U+8dYDPLgcCYnOvyR5fYpMN5A1qvMgE36FKQOCoNI8tXX6B2hXpL1pySetQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
	b=fIoC4gHZWIwzDyw7Zk60++HCXmCl6quWmNP7FG0/CiZlnyZddh2wieoHNSgJlq6U1hPb
	 zW7QI7xvKoSEuaRzOCm3LqOpq+Um6cwwxPl5rZxa/boeL1Pbb9wIGTkGSe8MNpRVB/by/
	 LK3gBtRUFimT97J7ozbjqY7fWHSaRTAGJbA+C3QDFZ5hJDpNu5/R6dq0jqhu9p2X1PHjK
	 OWuSiUB8YHXDTOznkP+3ffhiioPI6IN1E0UX+/aFsnWtvI5NRwkLvE6BTjaBgDvifev4g
	 bG3/NW+BvMqozKlv6iZQcAlwNPOwnpfdwn5Yd3rvBhPR1jO+wNezsb+S8YuVlIbk1iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=pGveBj63;
	arc=fail smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D081E606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D081E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=pGveBj63
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so1046305a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:19:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881149; cv=none;
        d=google.com; s=arc-20260327;
        b=ELbZAxfbwka/QgDUlql1d9u9qftY2jrMkyVIetacILwUuqdvXMf+flKGKi3tirR2BQ
         zQ+oOurRgLiE8+mCT0geM2rqW+ywjbPPUMlb8RBOARLBPXvW4fcQlglUnpqVXCQFaDfZ
         /f1pj3yW/5VC8ricv8kwTbsyQM+q/IwOPsaIULArZAw20U2DIB6wPZg/IZ7HJOiijQ+0
         UzcOzTZypRB0wkp4sammlqBVYw5EyyXY7MdRE4/n+TBXbSozYtxL+zoFhMHRWk/xwdlF
         E8TEDQnJDYaF7u8D6/0zsdqJe2qWiRBKm/7Tu5ETfwZYP1Y5qGit0ALMjLPGOJlKHpxs
         1BlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
        fh=lZPqPhrRaYNfodY1YuB39IZbzc8THEeTRIIHlRtmtK4=;
        b=a36cdQ4k/jq8DKXgVtW81RWSeiAiynQWpEIxOxPJjBZF/vYLj646VlYu/2PPDgHf/m
         Fwj92ms1LbcBNaajOk/SwOcfUDql6BYw9QHU7UsxF0RQp//BZnoJQ1JZ3hCA71YpWTcd
         D5C9h9HT2Yo/dnJcleFYiXJPt88FDAZIsvexkcEh1gcRN9xwPIqBHIQDJ8p3dVNclZB6
         i2o0RZYl70Mp1738e4vLX9J+YG9QV0hzLd1G7XjSgppuiFLbTPTe9BpVlEOoK+A/ni5r
         oFr14wASF6ilR/J5uaGigwNY+uaZNdTVr+2myauU5aaeFFOMlUe37lZh5fOni8K3aYNe
         mFsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793881149; x=1794485949; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
        b=pGveBj63J8QKWRf+jhueXuB0ndPsWZfe7LfoalkUdNlsHOZ9fsYsqkqT8rGUpHJctn
         fUipHFPEHKZDCMtm+V8vJFC0ZwtAS21AcIQQ08Oq3K4w6YLjBfHSLWfapxR3EAHLSONf
         U+D+Auexv0At4mf1cLt3mcv3aHONwJuTkLq++LvA6yX5iUhX02j4AsQC9x2zxuCpwc9c
         B95kJHOFl38wViqg+1WG06SuRaDrsF2S60UBOx4n8YDUcdoJaeGVhYEMkzDfiOuckzWA
         HutJ3tTF6DgBoF7yplyl12feb/JaF7RHsVHFmW+4MXyQARMdGlOCu39ZZ/O5X90REnfk
         STBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881149; x=1794485949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bt4DUf+UH7jk0+BorwFH3uFk7RSEIMOEju+OL5ej03Y=;
        b=fvaDeE5XJrF5KpWvVDLMlM+lWTPL25uIGasZ+mXtQ1wp0Y04PQyBtoLSxLL+bQV59Z
         y9D4n7ptrxMc1fD7mUGJL1O70bC7cKtjssWWbOWMmmMKTNcxG34kf9+EQfUgteyLTGCq
         IWMuxwLQxuIuXZh2AHVw1jNizdikuKaZNNJP/6M+sob2seQ3Jl63vx0Pz4AElCMAKZjC
         JFp2CGCQHVE2e62L8rYbAptDRNsPSr163DjDQHxPu+RfjgRsLH3oUUeFl8znmwILtECA
         Qijc9QNQE63kVW3f5ig1Y5eWbEQLOT1HSxHiYtU/9f1oOG2RoTmuuypuX8gw4iFwcdap
         G9Hw==
X-Forwarded-Encrypted: i=1; AKwUvBxeT6P7+nk+/4oir1dV+gzzZ2oVawOnfoezQPt4Q2BjryDpgUPJuySl4X1kVYm+TQY3TE7Kea2c/K26iNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bj/+26Nke5AZUcrjd/KtGXMs9OXWuJLQySsIKsOnvape3gFYB
	AjuFkvjwouObpvwRn2ph0bL+vXB5kahthZaCvn4In/AjYg6p2tbkkrS9ZhI3rztrGLEGAKnjBTI
	1lB35HTqeSSxlQlqHONhaGfhZw7tSU7JIoDxmh2amcw==
X-Gm-Gg: AYBFou12CrK/ObxV+jhNPvzIp9tV9hwUnyr3bHIH8Df1oxXRh/iFDPlvOEM3kFWcW++
	P50gU28X2ACI2PaV/zxAE/H54alOdjk3UypG3VbsZE0uy30NuWWtpP45m12XGy2YF2VLfzstHTN
	OIlvGH63skybMYlDmf6Gz7L1LKJBEfM2/e4PORJaBZdd8uS1zNbmVZC8QBIJNCgTuHslyqWb8OW
	OXUhthLWIgja9/GMvSnl8KQCSn5ij+w4ufU/aFiKIZPQPitGGp7oaTNfT7ipKh2JWA3rPzSayoh
	aWAK3sI1z62O+uAVbZaz4NdqYe+FS6rRZnc3/VTmP4QPmEBK0iEvlKeqZ37JRM1oow7MB5tmaJm
	Pp2eFXcZvk815JofC8xTmZrSp45DfGeRXHUq2
X-Received: by 2002:a17:90b:2741:b0:3a0:e4ce:31fd with SMTP id
 98e67ed59e1d1-3ae896f8304mr16451431a91.10.1793881149147; Thu, 05 Nov 2026
 04:19:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-8-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:18:57 +0000
X-Gm-Features: AclHuK_2VZ_bwNEEFECKGIAUHsyDmb8_QQvXN9pJrwLdMDPCY5CttgkKVemI1Rw
Message-ID: <CAPj87rPk=girxTziKY5ROV3ZYqGhKRz471BLWpkCjtvNNseuog@mail.gmail.com>
Subject: Re: [PATCH v6 08/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> +               if (pll_hdmiphy) {
> +                       ret = clk_set_parent(vp->dclk, pll_hdmiphy);
> +                       if (ret < 0)
> +                               drm_warn(vop2->drm,
> +                                        "Failed to switch DCLK to HDMI PHY PLL: %d\n",
> +                                        ret);
> +               }

I'm confused ... if we have switched to the PHY for dclk, then a mode
switch wants us to come back to the CRU source, don't we need to
reparent to dclk_src?

Cheers,
Daniel
