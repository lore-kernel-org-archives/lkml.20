Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360085;
	b=IShEEeHQ1mUkScnl24yJDJmUzq4AUy/j6Sr/qHoE32F4/UMvggtpWrNKp5QGd1xpkkb1
	 ALbxRmZu85T5lE2mzTLJ/6sDVTKL96RAU1iFXpssAgbJ/OijNK4H9yzwgqWO3Vmb8OBrU
	 PcvIem/Re/53iUO7GMe1EaBmKKPDH+D2klUAy0BpRcYwjxfLN0c9gAWpkDlD1XCg0GVeO
	 YQVOd3SuqB3xTgE4TUFIjTDTBgWSqErN96XKIXQXjEopuJwsA1ArstJBHSTn09s7DIl6/
	 WbML4lPE7DG0lHVS1doK0XiTqEmwIk6DuIHCsi/x71e3i2CHTTm+3xiAoT3BIS4SJoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
	b=4lGsAid8Hk0zgFGxyt6SlhrbDaaSyb/QVgFIrRjZg9FXtJtZmZZ/yUDTD3JEIXK18XA7
	 Wqa1CwxYth9fLTvh/WDTRqqJUFCUD3IlLWp1PVf5rmLPcZhFWS2Rlft0gSvr2fBneN/Rr
	 VkyuSfBmj3OOYS8/Dn/Bd3JlEgZjS+XbzYVJ1mHcUQLzIYY2G1denQBMfoApBQ9RYxLb5
	 LXrIgcCmaVHpX42cYabZMHei5VlUWMXwwW62M7MebPGwO/JJngRBYrEw4xtZ2/KBMd3yn
	 Sf/1Lttq5FSyRz52Ge4Gl9Rai1rZPDPRnIhM4wmHricloeGaFcghYLtdQLDpTCOzajQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Qc7YhI7G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40F4606A334
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C40F4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Qc7YhI7G
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e608cd460eso3584565ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360084; cv=none;
        d=google.com; s=arc-20260327;
        b=dsXki9UHZFlTtBw4XSg539cMe2rK9h6SiL0JmTVJj7Zlh5RrhRjDVCmtZGrevNMIn/
         KGSQtea+RcmJk5h5VpRU+VWdsYM/zGP1UPiqgwJD2NQkXJqisFml1pYvlLnQzR3oEfCI
         rpwKH+SCwaV2zHrTTSCng1Mq8NJ5pmQDtPSYT+oMQ7jmsuIEDvZAraL4TFTOacKyaGgS
         8s5om6txtYBHcsKMp7XJ5M9D5cxRPYgbz+Pfe2MYALdqqiAPiAP5Np6SFg2GD2CWOgvh
         tAC7/AAf+DflhwUcb7rq2esfaycOVQsnQIhQdubids3Dnm14RIhm5j2Mua4nJ7/hmePQ
         eT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
        fh=eR+Nj59fEtuH5p/R3xvp5Sz2tZF7TB9lUS7fEKLbn8A=;
        b=SAtsnTdPETOHDvPHZTM2ce/4lJ9SrwpR58ajit5s5Tr6eUt+hRi7USYGz+8k3T85R1
         oAyNLqvNdUs1MvLQ1a/Zghk8KBilsg/brcVqzE5AjSc9il1orvxrsdB/NK6QW35mQ7pA
         7E5XimPx6S7e5f1X+ACUZhabw0hzMwpACO21qUPgnWQ2c8YGvQEFg6zjxPaAObyVSgQp
         R9FjBgXsnl0BlBvnh7V0QUFPHhRNB2SAnUUJ7XzX4xO5wh06iR7rm3JsTqRr2cc2h189
         qQgJytsmlUlkeYTJRN9uL6rDQud1vySwKQ/+Ehgm/HZNdcLE3jls/HLfkBPVJmG1uWUz
         8sVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360084; x=1793964884; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
        b=Qc7YhI7GyZx7JSx6q03ldciyyIpnGDZqIj3Q0iDP0b3f6+IVSx7+HnOdpxWYXk2UXH
         D0mux5RIUJTIsCqxy+hBeeC7tHFc8PMNtdYkMCBFvRR2O1PbZz2fjb0xw869cd6dWjrX
         1w1IiC9dzk16afUwDHsEpdrbzfaXCuvKDenTvwhrYNcMaWiD8myb4RlVA4ZNTksBXXVS
         6kDs+m635xpPmmoWcZae357ftgsxvnPBaQppXv8TPeJAW8bmK5KPBRTR66QXvT1rLEPX
         yr6QcL0li9ycEsf41YQjv+Ss4W1Y/9ERDb2doe8u+1wgTWuTU0joOoOo0Go68YYfDLN8
         MxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360084; x=1793964884;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c97+eBSw0JgaFK2XxPHQ2OocTE5xGkKfdIwT0n7EkqY=;
        b=kpxL4MQkhMX4G9QUXAz57cP861pptYjs0gQsYZKccIG6mTaexeiV8wcPpZ6q1n4Ce8
         g+K82XcJM+FuYCDOTIgwf5d3LZ3Y4UW2yw63quCKV5TLyj0R/wCx7trUlA0+IPZhd8FX
         jWioSDVBNjdRaXE4qd3Z6uTYXUoJ/NxUd1MO+7azELEnApWCem7PCTJTD/Q60RzbvWJY
         96W5Sgp8875U968I1kBgZVji//l5l6dONWSee701rB/yrAk5fmLzVkPAXHaTEXfIwxu6
         KHjecxDDxUqVdpwX4Dk9WcSXCquAXftNmu6RtmSnvgdlIl5e7h3pb7d8mWPe+6QM2TYu
         x+3A==
X-Forwarded-Encrypted: i=1; AKwUvBzHb1GFkBrjJBLSr5zmL1pB7W71QrFiLNNbpzR4a79JiS/TrdX7lmtcT3A2gJtXsV7DW0/BTh8Bu3828R0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvbe1GZK/zoLzNyE+XdJhCHNTvkX7wJ9xc4t/LcJkxWlp0kJmt
	6FZhAmxjR5Svap/LC+sXB4wu/IgZnStxiUGW3PkxsR7m5ui31x0B0XNEszzAQxReVhE89ilIv83
	n0JjZnXhJHr0k3Umm3EYWTU7YaFSXD0+AfH0Q8IJWIw==
X-Gm-Gg: AYBFou3yGPOs6SF46V6GsqgKy+aeTy1+C6qv4m92aJd3xu3E0B+Uu8URjpf0Va/cmpa
	0qAgxXfhCGBkhGrhfTo2RNtd0vrQ4YKO6qKMMw4a85PgC3OUC/uT9K4r+7Cr8mRQsSajggL38j2
	tcFgpnmwb/YECi+OuPfv2CN3ZrMbDxs7LvN8yCkXvxulIOMnxV4ItEnzy4eY3rQLjDaEDR4MUUr
	6H1cz8iPOZyTaTuiCwNe7/iiFgEOmT72daTW4U2q1oovT/0c6Dn0/N77JeXmW6N0vekJPnpSdVq
	m2SJqg9USQJ5VURaxThB8ocPCJSBzmqRzospawFVeMHq70n9OfdiKg38DrjiKc6VogXYNGQwKkX
	aeQZTkRSRS/dPxXtvoYUIfDnipd16tqcqQ/I7
X-Received: by 2002:a17:903:384d:b0:2e9:9bac:2e90 with SMTP id
 d9443c01a7336-2eb3650d23fmr19334835ad.65.1793360084151; Fri, 30 Oct 2026
 04:34:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-2-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-2-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:34:33 +0000
X-Gm-Features: AclHuK_tphtpQ4KgZ6QBDW1MCkhoNuUykWSbAiahdSvtWRJxD3fhHMWk1DFCw5Q
Message-ID: <CAPj87rMYHa6NmiwC3DJ30fSLukpyNJdgRa-Ri-TyZTpDu2NkrA@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] drm/rockchip: vop2: Fix resource leak on
 vop2_enable() error path
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
> vop2_enable() returns void, so callers cannot tell whether powering up
> the VOP2 succeeded.
>
> Additionally, if rockchip_drm_dma_attach_device() fails, vop2_enable()
> returns without disabling the core clocks or dropping the runtime PM
> reference taken earlier, leaking both.
>
> Make vop2_enable() return int and unwind all resources on every failure
> path.  As disabling the core clocks is also needed in vop2_disable(),
> factor it out into a local helper used by both.

Reviewed-by: Daniel Stone <daniels@collabora.com>
