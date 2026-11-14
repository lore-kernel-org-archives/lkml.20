Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794688031;
	b=WeFpx6yH5hZ+GDAmbyGXsx6kwbcXTbFi3e7FypIgR2m8feqE9EldpwuRg5ee7g9DPbHo
	 TKeJ2jNGoFrF1B1TpzFg0h4RntoyUVHWDTc4b6BJoxe5h4vEX0O5OPnHyeILPAZooHGqB
	 93o5C1kAYAlfkh6Ba06UuBLKtmkBIm5WLlbZfBSv79iFrJbTpyVBkGlOmL2pONTKWXz39
	 g5gOBmH0hdZS4ceq/Pd8EYHWQtyciS6fjZVYS4tKKFX7Idw7eELY3pP3k77dW4NaK58SV
	 KNBmflIc2Y5fvimzv/BpMR2M9zq4rWTqwKgjG5Y+o++rDuUQrsSbswKtqemWNAWGBCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794688031;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=ypx4hXwAoSBembIh9H3n5W3lgXyJZPIzRQD4Em4Bl4Q=;
	b=laeBV78rDI+Ji5odlxilrYjy9sAgIvYiecuzXUhDw8PnIueHIVfSTJNKOof+SJEX6OF8
	 0pq6/csjf5XZi9wUYI5nXm4s6xQqc6UtmMJjMJtxs2ZnSd4kqNP//+MHN+T+4l2COenyv
	 dRz9VFA90rjk++WvxGGCQ/uIYh006PLgJamRDHMJ7yQNX8jljH9nu1TkRc0hnZ1GX+VVI
	 Pui7gKezi1dqbM2Mkwn61LRr2b/CsW+KTjFQxoPpt0vaym/wT6YebBCoVFxr0BGoTffKh
	 q7uYD9n02iWY6ArBu7EBwHWM0WX5nszcNfG/07igpDAPGl0SYB6WxX2MftJDZjg+Mnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=KX9kBpTj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19182606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19182606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=KX9kBpTj
ARC-Seal: i=1; a=rsa-sha256; t=1794687995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nM7G7lAub3qLv6N0ON7GAAEkyzNgyFgDqRDfMVxOo8CQ541UyjRuERjZm55IYNc0msks91bRBN4Z+/6Ou/F/Ss2BDy3tG5O7+TAD8W864aJNYFz42WuduBBDSO7tDpv7Nuv6zG1MBLGzo4vbh8+OXnmLjJM5ydRj8MwN2NUwmAE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794687995; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ypx4hXwAoSBembIh9H3n5W3lgXyJZPIzRQD4Em4Bl4Q=; 
	b=BjkR4pF2lLOtvrOwWcUmJZgvhonNIOmSWJP2zD+DsbhxaikuOgFayWqM826l+LUOhyIZPu8V2DNoCiSs0+RrlUQCZ3+HKl/p87afEYKn/9m3x9scp7TKOLLndDrMf3wDgLBU+mkPGj5dkysGK80zPTDLihzXygWbeAodzWo6aoc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: a=rsa-sha256; b=KX9kBpTjdF5mEUA15S1iVhx6Nj14gq1WtW3oE11uNwq1JFTsGDT4TtsOv9EFfTJ1uHYiT9SOXKiOfhdesG2I3RQNdp+vJWlRlT1gEMhUBF1wfMEdpzEAmPBgwPwds3ftVpgHta+WZ78bhY9yiylnWKeXHQpKpSybd5JyWKjgji8=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=ypx4hXwAoSBembIh9H3n5W3lgXyJZPIzRQD4Em4Bl4Q=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794687991847956.7695221547046;
	Sat, 14 Nov 2026 12:26:31 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: aiyengar1990@gmail.com, Arun Iyengar <aiyengar1990@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject:
 Re: [PATCH v2] drm/bridge: Fail an unsatisfiable bus format negotiation with
 -EINVAL
Date: Sat, 14 Nov 2026 21:26:26 +0100
Message-ID: <b23U0RxuQmSNURVAsy1U6w@collabora.com>
In-Reply-To:
 <CAEy9hNXoPbWzx=EiOXJwiiY=XJF56g1MfM86cgp96einDbONmw@mail.gmail.com>
References:
 <20261111-drm-bridge-busfmt-einval-v2-1-fbb74905614b@gmail.com>
 <CAEy9hNXoPbWzx=EiOXJwiiY=XJF56g1MfM86cgp96einDbONmw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 13 November 2026 21:27:43 Central European Standard Time Arun Iyengar wrote:
> A correction to the commit message: the DW DP example cannot happen on
> mainline. No DisplayPort bridge connector has the "color format"
> property, so "userspace now hits this routinely" is wrong; I hit it
> with a dw-dp change that is not posted.
> 
> On mainline, -ENOTSUPP still reaches userspace from a chain with no
> common bus format, as in drm_test_bridge_rgb_yuv_no_path(). The code is
> unchanged; I can send a v3 with the message corrected.
> 
> Arun
> 

While you're at it, dramatically trim the amount of yapping. Just
because your LLM wrote a long text doesn't mean we want to read it.



