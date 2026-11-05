Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880530;
	b=olTIiJRwjIXAeZJjdvovWyPZsXkXIE8v4RkV0hJXIykbM1p+BoAiurzNljQSvw4ja4xW
	 bLo1CusbIQiW5OSE6DurTCc3gQztfg1t6ylxM5UerLxDloP3kUMjzQsEy1g2zLthr7ZFI
	 xa1U7uAbiOoYh/rHUoMgbq1tmLE+CaRuuBa9kSNLCYKVIlsr3sI8kRct75qZYvShILBkj
	 ovQCR+a4wnWhR8GQpMl0L9qIALHgeVk3TicOMem1XDIJTxGKGuCp7ziBywvk4tS5vd80H
	 6E3WBDU8/qZyG1iIAMVhJBKyBcL2q9Iay/Hxe0ztNAS/fEOvv0i4uxTLZDGTCv6bwWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
	b=5gzXUofyg0i37HPxEQQ3qhK4wof+lkBaWljK8661Y7JxcLrq4sr0hO8imjqQnfA1PI+F
	 3K1CPlpTrdWDHCHsAfXT3TOOAUNEJl+Zv6+RQUvaucamZ9G9JZ5tHfq3nyZK6pLquUvTQ
	 RFR/axqmWxrSgvs6ryuKD3H4f+Hc8Q5tWV46M4ERFwm5TLtPzd5nsoVOxmbqGH8iIZskd
	 0RcHgqgnBA/QtfoDUL0kf84Q/XvQDchvNZCStcMbKHDLNfOQinlANCR/C+G/tVTNp6/+U
	 2894T2Ki33EyFjfIZBhLg9Wf4OVeNeXugM/2YtsjqtNGRDIXuf/fmsTlax56R2fAWHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=NI+Tnm0+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1647606D83B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1647606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=NI+Tnm0+
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so656149a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:08:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880529; cv=none;
        d=google.com; s=arc-20260327;
        b=aYDadV9FNsY+adWMEaW704Ytbbx5bkp/W+cWKtQZfNTAzMwAvTp0+6klkLy9G3xO6T
         WX/zJxjpw6CQCO6qHCMUnrtuVxhtjNHYYu3rySQBKVNE/Cz+ycPzPQVrkJJolRWcTqBU
         mr9kE135FAqsTsHLowoGqD8utiAwhfgdlugnANcpflxOnlYYyDlUDR9fT26MLU5h+2sp
         ej1Yf2S5zIJDP4LjgXFgEVr2D3cyBHcxQMOVPWXaEpyIXp0q+5P0mblKIfVDirkLluxX
         jNjmSdcxk4zJg1n6hYmhSgUb+/WVNBsJeTAeEC8MSK3qpsmhxsqsFR6SEZkzSvb7DeTd
         7ZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
        fh=b93fxd6vsKUVX/RUlSk5ga/VV6q8TxQxJzONCF3e1KI=;
        b=spvPHZutL7WrBsCncp24krLG0n2eXKNfXHMc+dg4Y6eujvEBCVNuv6Bsr8GR3tFXgI
         JKlK60MWC7Rjhe4+ZnoN13QDoq8Tw1dDohs7OTMB0ibqjRtLVObLIxjg+CwOknEfn2ha
         +Zxtyq4W3sx0QjJBC7iZ4T0WK4AbIxVRSwdxw5MW7bNRalruchZLwqKtv/TNL8COTMBW
         ALK0lqhNzpNx/7YGbrOzR+0mfBEPGEF8h6lHckmQmClbWusMINVo/Lxjz8sMEztdzgXG
         JTwaT+qqrDJwya+Y11gex+ah5ew9fD9ndlnPiq5d90Qj0eO5TPkdLN4W8DZuYPc55eEK
         x+ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793880529; x=1794485329; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
        b=NI+Tnm0+iB8mmC4dR6qzPqkzbrgseLMU00deWh1JGnVPk0oWXMyXTi/PDOFPhbZFb3
         eVqSqKbVvudM5YXGUGcVRSMqzrmJy4aAoLHhs3tpEkYcp09Ja1qw95hVPXHWkyZvLjMR
         n6LW29D9imLKa8RQc6kAbvXLChjAki8xtlpXVjMAOJtqFHvkKYfSuxVuTqA94aKiTOCh
         +bKq8DluefDVFX5kL/d8uuVoumva9dIu/1DrwA/9JuJONX8qsEFm90Ecv6bcww8bfDxA
         jJBZSpD/Vnx6YHZCJ+Qx+gCIn2t/XzB2D5eU4cdg4wS+JGNEO6wKMJbfjuc12f7KHlCF
         qTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880529; x=1794485329;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/0iceX90IqV9oL5wqkzDxra2XjMzLEXwA9jTMie2zR4=;
        b=ZtrUoKf+9A6xF/IukQyCY4ogkk1BxQiSfzXQhcUMnQivvZwJr7lzni8r34T6ObEbKd
         tm3xReG9wIvbp59f9cR1kjl6qc1MYf4mp87TcYJ9e+3Et6i21ogUcBhcM/Fhf3ZRNtc6
         veVxUGS9EXD/ROGTep+z2qxm/TFmY/RZzRW0SIlDHPgfUsOhgA3CHRZfXHze/4RQ27d1
         DJYW0VZeH9VuNwjdZD9d0rvkFeeGCGOLHXDgctg50fFe5hvEGLNmZ4jUo8Sg/XcB3BdO
         0Ipjz/5BRyh6XyQN9eoNzl5u2KIBWvWW/olyKPdvyQ9yy95oQgNOIpYbJSjQ9EUMPZjN
         ATNg==
X-Forwarded-Encrypted: i=1; AKwUvBy8ccBGjWBMX4Gm6u3LcUFF9wVWPgoJuWJEuw0fkhiSDO2HcKGlsePgV5X+09OtlHkVAmF3Jr5vWvx7LAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z9JWipz+owAmqWmn+e7tO+GsuY1ebMOtz8xVfD7kdx3IdU9FJ
	d+fsuNCFXeLMukqGalqyhF3GQM8mnuZCMLEV48w/FQ6z866v09duXizVngl8qAGJ5cL5zlcoxwU
	GhX7FHy3ZjH4TXh48J5FwRJVhqxamXfGN/fZmGWLs4LZYt/jVgS8l0mzamg==
X-Gm-Gg: AYBFou2THQjVT4xpIy855l7zUqtReKTNsGDLLZ1ufYuLCvmeFOZaJgwGW5eNYwaqhf1
	T9BoguWaGxOOoAt2NAXqeCjot5jfArHwvKqoitbpxIMc89j4feNGSAz3u2DDXq4tQ1Sehnp2U2Z
	k6ihrlUuVr1ouN3O+3icci7cUMeyE4VdDDyVR81fCj/2uaDwM18cV2JuSP+7LxQC+LOPYdhAlRE
	9A6Sx0Pl9Je37qy5cpULFn+vSOYGGuIew9OCa5b+ghnOJML+8LTsgLiUero4HWF/Zd9JgVZyHBt
	bvryaQbv/xgtswXrbeQKq0Eb5ee761+GFyrhmh/+2vx1//kfL8CFefOodDh0Irt8fzbnljhYoho
	Xk19lgebCBasuuAswvOj4OhPXIIQ0Ch2Srp7r
X-Received: by 2002:a17:90a:ec90:b0:3b0:c11a:902d with SMTP id
 98e67ed59e1d1-3b0c11a91c6mr1036738a91.10.1793880529265; Thu, 05 Nov 2026
 04:08:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-13-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-13-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:08:38 +0000
X-Gm-Features: AclHuK9SHkBLRSAoFwhG6L3qgKeNZAN0mhWE5mO5no7yjWFPSRU-9JZ6TzN2VOg
Message-ID: <CAPj87rM=D4h-EfkTdqbumrM159M9Mb89nJt0K1AgcTrqwAqM6w@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
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

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Rockchip DW HDMI QP encoder supports YUV 4:2:2 output through
> ROCKCHIP_OUT_MODE_YUV422, but was limited to 8-bit depth via
> MEDIA_BUS_FMT_UYVY8_1X16.  Add support for its 10-bit counterpart
> MEDIA_BUS_FMT_UYVY10_1X20, which carries two 10-bit components per clock
> cycle on a 20-bit wide bus.
>
> The HDMI PHY scales its PLL output by 8/bpc to undo the deep color
> packing, such that it matches the DCLK rate expected by VOP2.  However,
> YUV 4:2:2 is never deep color packed, as it always transmits two 12-bit
> components per pixel, regardless of the color depth.  From a clock-rate
> perspective this is equivalent to three 8-bit RGB components, so
> configure the HDMI PHY with 8 bpc when YUV 4:2:2 is in use to keep its
> output clock aligned with the TMDS character rate.

Reviewed-by: Daniel Stone <daniels@collabora.com>
