Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793881536;
	b=wwXuUJu7xody1UWB7IB7e+AgpW5cxXGSkDo/ISFaW/oVUfldZG2HkR1myri0dDxYd2aQ
	 GHNeo/g+4L4LvlXXeChF6LNQ/52EH1uo+lCUpcbIYtHpoqQLJ+KPpklA+El8r3YNV/gf2
	 O68kbpdVvcR54S1wnP7OZLZVOY6xot6mBfia+atflvBxXkzU528dY1in9HVJrx/mvGekc
	 DtBCW8Eh9+r2det6uYWqIPGroeEmqxyw/D7CLKvvBSQLF0zht2jyskxdwCPau7IU+LENS
	 QWU0wiCKOY/U2KVUfZvLcIVb6ies2T0AOQ68obHdbmB75xdUfVERGyi9sWyBBfzMpPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
	b=CiPGaua6IZE/YF/hirnhOE5QvUF4A73DMs5LZ1dppbSMqEbTgktWOylyj+ZfmNKZlyjB
	 nNN0MoxXoFZDXTQ4nO0Q9BvTr8sE2xupTCCNSr0Be7j4J6SquG/2TKmJHWu3oVmbwCB7e
	 3qqPNJyDDfyVQKKmPS0HwuGTLuYzs3pnljlL9tUVX56XetfZW6hV11ZSOlqP/LgprgeLl
	 JdSEw5VB7X7E97nFgl5w2OxeZtkRD0/do2pejuZd8bG64GykMfDAuTQSudbSdUwxgoIo7
	 Fv3BfyVIYYqhw1tlurF8rtmfWtq/1ufUvfaVMwfe/n4IrUM9ZW8b+5RcOIdzzyi99Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=QhTzZ0CJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0E1606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0E1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=QhTzZ0CJ
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1328839a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881535; cv=none;
        d=google.com; s=arc-20260327;
        b=JGT17P7A7C2XhC26fNM1ThA8yuDaa/9vSh5adTeNL3SIzSQpRH+WTI7B17+DRxNvUB
         qBPgO/4Z1T5N17sIfAjegodrhX+QZ7ygc25OPAamT4TXlf4GSmGIDXlFXo+s+/9Y+Nyx
         +VRC+3k0PO1Hce2IXZJLMwSz4Kv//wGglIGY2ZkI4Sl6+dZzAHX7lw/IHFjhMtHlGCuA
         8YK2zOm5iTEBUo+/rsovDFf2vVhYpXcA6K8bkeG9COQX9IXcEeyTlbfRk6FVs3AC2RPE
         ECMjqKJPFeOTyErTeI9QzPkyAQfijyyY2EITBFLlv754tiJ6NVyvtD3LX8p3FzBxHo/e
         YD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
        fh=g9fMbc5QkztpxB3ISSN7R8TUqn1j6yI8KNABVI6fiyU=;
        b=HRz77/QLi3aiQAVhkKLraU1Jqymovaaal/h2HlNIPo68cyYyItdVxTtOKzOLxowJNr
         WPPorRWzweEvUFk9/9dxEOxgDdxni2F9MwLGXB3g/1Bi4EZgkWJfxC9nvEu9fphWiu1X
         FkJ3uyNjnIM/hBrzz/t1zO3/mXAC9YwKTOLlLN+iaa5Yf498JFz9Xk4nJUGvATELNdux
         oTz+0iHrS0evxhbQ/rwXv61ELN/P9JN/tCgRCjNkEDn+5von6tABE6vXmRgzvvUYS+3W
         XrgnEDtR/ZW9EWnAbxBE1HJcv7nsR3JE6UeFQAxdegYZW9YG4RcmYN04ZaSgDhUl5uyv
         bVNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793881535; x=1794486335; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
        b=QhTzZ0CJ18vLkaz4/b9eNpbTjjpIWb9eEpQqby32E8VHoWNkwTPt+qDR0h41DHaAj1
         POjjjYtwWjlLaHhuiQ/2WdyQ8dv+GYBSuE8dBSrjlUc38TP1EpV+dBNgtJtCu7fmcAnj
         P19c59+AldDvwORTc5My9TKoCDgosWl1WIXqBWZjtxGv/yz7ZPGmBcVUTWLOkCgHa15F
         Of0Mh7EjLxGdfKiJxSAeMdhj+RVwrHCqTEyfsHfR+jPETRA6BTbpiXo1yjfVoXaZv6DH
         U9PSoFomXerEqFFfkmLNRUK+7mf94Y9AE6/yqYiROD6uuQFJyQCtfYOAIBtLSLYjfQiE
         g2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881535; x=1794486335;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZvGn0TWxKmoxK6KM44Y6QgeDgPYc9rdxIcbth936aAY=;
        b=qNlhFSOHeHlliFMXywVTMiafiUdqqAmYCXfW5g2mUARv0DcdoGPO/rELbA0Nni+dIX
         aRD9rThP1z5BnMIMz8P+vjVROI/q15naBhdmnBkCeApeX/sqC6lYki9T/VaOZ1s5MZ//
         5J/0EwcerBqzplk1k4fLrU6/oZuXwmj43naPqJxJcbFeCiHQ3k928+08JABDZxDMnVUN
         qU9jNQmxWXfGbu8T4hN6RUwrbWCliIWQyJSzkmrAEf5v0cyu2rJUSc+pt4MTHGOU2m7R
         R64LcIbKRNLop1QhhKR0nJbW7VBgGAf5lXZl/3LbBCTb3GTIDIIrFxRiABvLBfqAKsCy
         81dA==
X-Forwarded-Encrypted: i=1; AKwUvBzGhAhUtz6KQ33/Zh2Yh1fI92hAdmjd5b0L2I9sGRkRc33lQkrZKcwN2wpRcvS06kYZ5dnep0SwkY2RxeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ur/Vii13OEAPc8BE5B/oVW9zbm0wLx4cX7iei2/OTBoUvr9On
	EA10hQpMjBpr9YlfhdTAr8XS9My+mrEStbWC05dIpaFq5JV70volJycM7VA+5YeOZavLISP5UQ8
	Hkoe7hUYdp3hRUANCw4/hJD9KgJChdcP21UazxPwyqQ==
X-Gm-Gg: AYBFou27dhKniytY1ESviioSlTY5SCnHmDdJ81oBrmjr+WCtVrQZBK69DaTbEk8yVp0
	RerqJ9mzHzdAH7Q9Ea2EkmZyXEf0OdfsUBRYLo/8FpxBfptKm+9Wc9+47n6de6cxG0AgiAj2+ip
	kf5ivAwxEt+TlYLkzd0t/kk6iPS6U2SG/IOymI6iRM82ZYaSmLYS2NG+tRe/AkkNZ8LRRsjSPj3
	akNtWvHW2nwHlKAlbnFNNxp2wVuPsYlp5jZX9uhv99jkHcxZSyx06vKgkM6zze2ZlshIIdBQMV0
	icEMeqboqjLw5fCGYdJmGLvm8+Sn4hOXfWNWgCjgcbPzJVj6H5FWgO/xAFDcMbgi4K7AtP6FcEW
	xaKcUyiVOHWHJjtMH1xkpSYtC0egeIomyt7Fz
X-Received: by 2002:a17:90b:180d:b0:3ab:2d46:1dd2 with SMTP id
 98e67ed59e1d1-3ae895a5c46mr17306949a91.6.1793881534904; Thu, 05 Nov 2026
 04:25:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:25:23 +0000
X-Gm-Features: AclHuK94D60Hc87aFX4xe_hS9QfUHnTA410grumPTEjY5dxN4dgYm-_Kh7IGrsk
Message-ID: <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
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
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sashiko <sashiko-bot@kernel.org>, 
	Igor Paunovic <royalnet026@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cristi,

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Changes in v6:
> - Added new vop2 patch "Disable core clocks before dropping runtime PM
>   reference" (Sashiko)
>
> Changes in v5:
> - Added new patch "drm/rockchip: dw_hdmi_qp: Do not mask error code in
>   atomic_check()" to fix a pre-existing issue reported by Sashiko
>
> Changes in v3:
> - Updated patch 3 to skip any hardware programming in the callbacks
>   gated by drm_atomic_helper_commit_planes() after powering down VOP2 on
>   an atomic_enable() error (Sashiko)
> - Ensured VBLANK events are sent immediately when atomic_enable() fails,
>   hence preventing userspace processes waiting for the page flip
>   completion to hang indefinitely (new patch 4, Sashiko)
>
> Changes in v2:
> - Addressed several issues reported by Sashiko
>   * Reset AXI before detaching the IOMMU domain, to close a theoretical
>     window where stale or in-flight DMA transactions could fault or
>     access memory untranslated after the domain is detached (patch 6)
>   * Fixed resource leak on vop2_enable() error path (new patch 2)
>   * Balance state on atomic_enable error paths (new patch 3)
>   * Avoided division by zero when computing max_dclk (new path 4)
>   * Fixed VOP2_MAX_DCLK_RATE overflow on 32-bit (new patch 5)

I think everything in here should now be solidly reviewed. But if this
series keeps on collecting unrelated patches until Sashiko decides all
of VOP2 is bug-free, we will never get this series merged. Could we
please keep this series focused on the useful bits at the end, and not
keep on adding speculative new Sashiko-pleasing as artificial
dependencies?

Cheers,
Daniel
