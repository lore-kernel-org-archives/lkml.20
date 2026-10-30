Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360688;
	b=t44Roxw8Hbv//ALCplRES9dOG7dQLPWBZGqhrOgQO7sjQ8yx7gbHf9v/9YlJk2462DcC
	 J1Tpi/ACedkauehpJ/Om4b8lOygJcO3uzt0gos0S8OfKBuBhzOQ5CpW50uNzmEXTuM5lb
	 a0k6ChbBR8cNmRZOdj69wqFl5v5jlvVwJ5pEJgDPiGsqRpjqvPUknz7hVL3F0Act6uXZ/
	 ta+AHwDG/H7mI8Ks4CbgmukZpyI/zbHMRQ2XHHirZxXY3x+MgYm/7n0pRVsNX6BE1ljkF
	 CGTQJVNmZM+5bb+BhQHTaQDPLKEZBnR8NCs5bkHTBvJibwdkNhNB0a9qp2wzHOS0VNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
	b=HHgdtCFOvwaoDdxekjpi7S2ok54X/qHoX+sYYwXWDu6aCmsLJZTqPVJXaqE0yHKOsphS
	 D8sfrAS/VXbquD7LE/2mxlp0m//nym62poNQD1l+MwAjcB3KaZVeedTWKanEmBKYIMfNr
	 ugjM+lSXFCDL2pgp9RQINQVztuwOb2pDwYKtMKo2JMTxUHGUaUnSLzRiyKRq2hUHPzFp+
	 mjO2bVGGUka9hlk8xQKQQxQiVIUBjfYa/5GeYpXmGhtkwRKeLeg7ajBxkSvvW+i0IawYN
	 il9k22LlOBv4ifaFwlDAoJDJWA9Si1af9CwESY01xxqH8GaQVFuoi8MqVGAqyJ4DonQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=GAh88GJw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB3606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DBB3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=GAh88GJw
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8246b13cbso5100945ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360687; cv=none;
        d=google.com; s=arc-20260327;
        b=qET6BzT+mlvIBYy+f821Aw54j7iQg3VmhEoVZFPWLuNHrim7lmdkEar8TRHFxJ0pfl
         fWg+1aEq3L4bIRzTc9vqA+n2suxu5vc1MgafKHfnM/schPX5uOQ6feLjTv3/BkJc1aOz
         iqfQFRYeRaY1UjUEfb86BAuJ0ik0Gqe9cfKaOz1yct8fZyo7WlqA9Se4wh1V3IHdyT2W
         P/v6ThgLnXzkp9wR+ZivLw76W8xAyFp0iRhQPZXAjphoZfjMkLNyyNHNiKNcHUseE4tT
         0qwvPdsUozntxUTuBMN2HUN9YoKcj3dz/6hIy2Yi9MUNoP6QvtcdSKehgtl7MRYsGAaG
         FdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
        fh=5eXpO5QLRoCla2UqQuOIohZ7ZOk1zBtLvqqM6mdiEY8=;
        b=Dx0tnU5zQMOzdxokfmsQUcbrTbOLvqRI8yru+KwtpvEIFQ2OaE3G+mYmNfIJGB1JmL
         1k3TjB48S5+uWFUDitkmUOp70dAGwk7f3VwLRdkK9zBij205sDozoZAt33YqBBwTio/h
         HYyduU7cjmYwCyZPdgXUjxr/VlT24WjPqS5AUMYDIq2bjAec5b1nXKZGo6hcZ0/xH/bD
         MOoEodCE+uozNA+BZqCIJewHlgiMa7DeTd2ZYddIwgW6AusE/ALBtRqqvlzubVjaLwcv
         v+Yqi3jtEkERv87JukuBVSaxynDRRXHrweHASl3AI76IbFW0WOy/vP8PE5BF5uC9yUNV
         rEkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793360687; x=1793965487; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
        b=GAh88GJwQN8NKkj9foR5zmReCQEkwgJJ6OE8L2/dYYFWjcjtaoE7T+TJKPTlRXv6em
         I524efNvsDKUnOHNoSreO+XJ/Jho9cMqLvi2xucn7t/bmmwY5MfWd7dLzdyRxTpnreRm
         NcXTcY/0WsUa1J4o8Z3sUR+3rswBzee/0NTQgqeSG3cbg6AGU0H8LDsx58GE34y6aNRh
         0JhJsHewnmuF/+p+cRG4ox3fr9NrNgFjIfVoXvG7xkHakQvIt4RvCVKHndexJ2iTAcxj
         SfEvGsT1EFxnr2Ax/KfQZDy8dpjePngDmSfq/zMLjg3tA21BpA1lWHpfsqVfwa0BlBUh
         7C+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360687; x=1793965487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gj1ttizdUersx8xsUhnFSQQTCr6CuiJthd1Zca2e+6c=;
        b=tFpJ1xu0vC5/Clr7NJ/7QMzKWQK8cR3PcE7HWCCzYiQ0yLpiv8/gNCaTToEVOwlWhG
         bWksNkE4zFXxKDsHJfiPl93HlDyee9NdwKzDKHL+i0a2dhcjIskWIgjFr0SU+5H6N/jq
         1eTcJFfsjESp4DPE67FxjL7IDWQJBkLR1cTD93X521i3EEKvkLUMSvCp5WkyCBQ3p7lC
         ti55KKVhmXEpMgnTpXqeDuVgj63Gc4Qe9cVlfb1gmPgsaWAZL6LwjiaRfALjRVE37yrV
         goU4TWW+rpiELaHQjqP8fo3xJlrHZjuNQDRkGJnCIDq7Aii8L0qOn1RUgcwScW0xe5E0
         WLgg==
X-Forwarded-Encrypted: i=1; AKwUvBy7UHKAqkX4+P9JBBd3MAuoICqy/nlA8ukfvBL3UUaMxQYcR0BWCCcONBbfLVHcA+YDM0k9LK67mO/JreE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoGHLFodxqcTHltwjyGb9K26kAYcZLiaBzo5B+G3zTqPRbkgPm
	R+RHUgey0P5tkvYPVttzzjVjuPaajTtrPma9csPz4YuLqh31imhDP4YNiiVhaoHJhvqsUzWlMLq
	yJW0WfXrt9WJx7XINl3mKbEv5Yy55TUfC3vTZJoVL+g==
X-Gm-Gg: AYBFou0ZlnJO2hfAzVjFJJ7BHkJjhddGEKG3m2UsIJVLbI43PStck10sZ3CYmFCMVBT
	sZgy+6/H7bkEOu5eb0LiDVlO0Dsho/ZFSy5mlQrhrVVab3O2qgjvGGUOYOhtDbZdypFZ+SqiFTk
	58O34AvC5+j5ReaAvFlUFZVbRq4gArbHx4yVd9FHmnwqwlfWFppmPeTKTRymi8AD6CIhgshGd3o
	mxbzDdCYvez0hQYysplEoLFGshxukC11JHdoySOb8Ok6Kx9aUpkBOMSgfWvpbjYxOyf5oQDigfF
	ihEO2NULAAHJzUaACLuwf90bQhLliFb3SW2m6A2L56RZs/MGw9xuYV9Klgr/d0WZkhn1ksAStxZ
	S273KV9uqP0sWYRrEc75gGex15RJgDXT3YB03
X-Received: by 2002:a17:903:37ce:b0:2e9:6333:fbb7 with SMTP id
 d9443c01a7336-2eb364f49fcmr22277985ad.51.1793360687631; Fri, 30 Oct 2026
 04:44:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com> <20261014-dw-hdmi-qp-yuv-v5-9-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-9-6fab0fe43a9b@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 30 Oct 2026 11:44:36 +0000
X-Gm-Features: AclHuK-Q06xdaUmiDGoTsq9LRujvtZmp-FKJhNsOOxfBrNNarZ1Qbmr7JOv-ovk
Message-ID: <CAPj87rPEz=Y+dZayouddZRn2ZHSVNk9BAjBqz34PJyjDRba5=Q@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
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
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 13 Oct 2026 at 23:51, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> +                       if (!vp->dclk_src)
> +                               vp->dclk_src = clk_get_parent(vp->dclk);

Why not do this at init, where we setup the rest of our clock tree?

The rest is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
