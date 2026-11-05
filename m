Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793879032;
	b=vUOO4LcHj62XMecyIIOSit+/DOh+Nr4ZEjiXAl7dAA2xlcqPLZ9/8Qbn7/tJvQkG4Zn0
	 cEhiq8XMSx4pv1oNfOuIbciv3Rcrd/FCf4VlfcAXnCT/+peHf74Kj7m1195wsBi4IbRK3
	 qZfCsjLoStdMTgEio9E05nMsgUn+C48hZL0Z0jzWSmm5Eo5VikCC4vnRysSqi811pjErA
	 Lh87PA6FdyPMVBFULbFbiEw1aobVK+fmSNcWELxepmaYvscgxLCYtAtbTcc+WgTayNQSl
	 cWN/pM4iRfSL6kHyb+fwrUFl/tsEYVz3GjqAnHOsvepm4bxC2Uiy3j//Avq8gkCrnHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
	b=hNRnoMi9aRDAzQtgHlmy1HMOcn5N3a+9jRLMlAZJZvaSz6NsWJ/zRisJufeuIHZaOiQj
	 MDuZqKLrzdtQqLL0HEfyYzIga/Ac0cQO8SB1DC6sjGOOEJOAsDUFBOjsq5PV2FLL2wJYf
	 5ah4l0cRzNX8sjpc0Vx+rJ9/zAMMCYfZ+PeIONx4X1PExbTTIFFCU6s7kAGlcVxDwQhHD
	 qElxW2cGuWijUVE4O3nW2xU1C+GLcbZU6RRE+8R3waeujr0j1OzPQYGOzDY+u1DD4Q1ck
	 /fMwTVoz21t02Dk3mv2askUeGnidu7UyRbPEJ2mg3MCvjyQVdYUeKv+1Tckhc/EPGMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=lBrbOO5H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710B606D83C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0710B606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=lBrbOO5H
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9ae391a05so4087905ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793879031; cv=none;
        d=google.com; s=arc-20260327;
        b=OdmeGJVUTAs2eKp1stGIxWp35tWV2fuiZuPjMjE2RwjNOePgDMFyVsItDBLUn06AlJ
         qN7w0wC0sm+FnW4aFm1OAERQuulTCwz6VyKYgs2XgVBLX752Ke2lHHpMthFrHeA0cY7a
         2aXZ47kOyhm6JIHiEIVaDN77szUrDc9AsoOExX3Kca/LxdQZVB6svz0Z+69p3KdE6CLM
         nSIVMMjeAyQzb3vTSDhXDrFTDeUu+S0LoxMVShGCE+9GVpkabVcBg8Ag8Ohul0e+GE68
         C/rxp5rQ6n+zy+oaIyNiGPrMyk02XQRzb9d5tj3tgERtkCFXWAh5Fjbr29+vIEkpz6qc
         JaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
        fh=fEr6ItWBAxjLgRbJFf5bHmup47h3VWrWLOWU5/gJrkk=;
        b=p9HARBStYsp2sIaYIR+8FQ9ZCU5ZEOmV5cYdjkINjhEZ+FeSyLrIRnvPYE/NXTbo+b
         +D16WRJOHyVstkC/oW3oceXwuJbwCniUdXpt2jS2ZK3HAH3Q0YILo8HPByw5YQn2chvr
         oBBYw0OUZHD1UVakYKr4PahcHlNoibMykgt9heXz5H+rS/4IOGQt9Fcg8eM4bpq3dEMT
         O1aSfguUrI0kuy3sdWv5J3WtNmE43spQGMk2hB0u0p6/SHDaTAdskwuSchrb5+KTEm/F
         cn+bJeA9Cu5JevK0vkcUsq9NVOdwN2BHoeAVycPy0JcioSzrzVzC/Sshf7SsN8qRImC1
         doCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793879031; x=1794483831; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
        b=lBrbOO5HeljfsIiv402sCbs/EKe5ZKXzXimiRCIzjRfpzTYeVFhDIiEhQGyOX2S4yk
         lxewofy6L+gOuEdQU2H89T7P8/U6cDouz3bPIlm34+8vxFRJoyr7fBtjgVf0QELxtFGu
         ddVeVZtRXGhpm9QMwJXNWSNy/6h3DlQDGkzD3WQ22l3Hu6o+6uIPvZuUEZWn48QYKCUJ
         QPLsZmBh65G8biiV7G3kTb/j0sNZ+PNSwWzEQjwzJcAce2Y7vGyTg8z71ZZ9XJs8/FC/
         B4cbnK6oRdiF8nWlBg4q5exGORQaA8yFXhUShVNU463rhOZpjVA3PZHXerntCU1XmRR8
         XQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879031; x=1794483831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJ9vO3o1ng0Vc2a7LO8PFMvHKiA8ZblNfQZPhAUrQbE=;
        b=JtXH5HKy/nWXzSNJr2Kcs1Nnm9i8ouJh9kpxaO15wa2xcpaAv/2+anmpJ6LGJO1lap
         Ssp25bm8UvnEaweQGGI59nSpmxhWifp/NGUFGE6pL3haamVowyV2FnFu/ylagKiWZcEI
         23FBiqc/1lCbGAcrKm8wf3i7p3wRZK8HbNxtfSN75YhTX4JfFO5Ssa0PhINWyr0XRMSD
         hbkx2UMzuFRUjH4PQ56VUA8iWu+goLTEzcPLq7aZheetmdRa742e57WvFYWprFnnu5MZ
         /ADMfIxBfkJ8hOqLrzO+K/JaSMy1pN+eVbcmfUy4StHECujspkCmmIS52QdBUUUceC50
         a6QA==
X-Forwarded-Encrypted: i=1; AKwUvByHX5mF1HeMNXLpAVDAA4b1OKEi6uH0IhXHBX500gHUtbtV+jNuv0Gwg644w12MwkW0gKubQI8jmgV0qro=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/ch9nkyVrD7VPANjCfU6XsfBraCLJQMAyNqzt5tS3zkHgc2Qv
	MIWlnHdudNhXxV7K4kQyuPIP1fH53G5w8pa2ER2tRn+L6nbJ+EyzFG0kJnYrhtHlLtJmP8Bjth0
	U2rJTpe5H/yK1A02atY0Tpc3slBPvyjFdWHne8lwGSg==
X-Gm-Gg: AYBFou0ftwMqW87fMK6otS3pWD46xgtYcavisYr+Nq9JjmnDm9GgoqSk12cikw3zQFn
	rQ9u20YqW08zGNFMpzS1hW9PYw/w2fsorT7a7D7GEZLPue/4u8bIlSjmOC3SUvqhXilhXrKjR/Y
	7eornL1GcTjR4Prbqod7QzUfFJQGUh5fnurFMdyw8WTqXsm4D2AaI80XOyvwMgrBLudR2xsvORG
	PzJVd9oAyZRw+sXssawLGjtd7yvaANlbwuu8z6tDr20BfLnHjB1O/EX74CbjLrDnsX33b4YN4L8
	idyELnMsPOdsHV4eycyMsGkZfLL+eFA0qPH0apo3fRSuYmdf2Mk4TUlvwnHSkoT2aFP2ezJR2p4
	LCEuiYs4RPgY2/n4Jv9NfltHa78hh3pJhZCyS
X-Received: by 2002:a17:903:acd:b0:2dd:c100:2521 with SMTP id
 d9443c01a7336-2ed2405ebe1mr15348025ad.42.1793879031149; Thu, 05 Nov 2026
 03:43:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-3-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-3-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 11:43:40 +0000
X-Gm-Features: AclHuK_G5HVtKeWQBX7RTZFBduxaJbvsY8isCNKQp8OLwXCa8s_PlYhYGah1Zi8
Message-ID: <CAPj87rN4sxAmb+Lw_xGeQMsQeD_hR-GNaCHeRFivAKfp+Ww=fA@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] drm/rockchip: vop2: Disable core clocks before
 dropping runtime PM reference
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
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> vop2_enable() acquires the runtime PM reference before enabling the core
> clocks, and its error path releases them in the reverse order.  However,
> vop2_disable() drops the runtime PM reference first, potentially
> powering off the VOP power domain while the core clocks are still
> running.
>
> Make the teardown mirror the bring-up sequence by disabling the core
> clocks before calling pm_runtime_put_sync().

Reviewed-by: Daniel Stone <daniels@collabora.com>
