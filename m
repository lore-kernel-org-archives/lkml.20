Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394118;
	b=WUrtPF1CcUooNKi1d8O2P/wKLB5utD6PSnulehkYfYKvKg0tXhoB9tl76N9RLdvHSThW
	 rESGGr31qN7lnBQOqZwPkI4sINUwxzQozDCeVpkvXb55cSBpj/VfAdPKCk3jMeSxZ44j0
	 YcPLpCMc7lhYCjLBSPJlXh4pULG9aTZROvz8jI9Ed7T4V+z6zAEYFU7JYndRbuS+zoqbl
	 Is+rR/BXZaSiClVk50gtDblzU92AeghqFUWX+tl0DbiVhu19TkqiiCk2gD8KFQkhmqadF
	 DZ41CYj8pWxsV88TgL33HPs2+iQJWIcI9L++72hL5nAJuENutKJ3mT8dbGliSEFPXVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394118;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ad6FU7Y+CZOMr0uGpGArGMy8cMkHauN05AxVml3ZXXU=;
	b=dJOKC/q0xVetYrTZjIjRKRnH3Wk775QL6qNTu5nrXHzZVBzO09Nvi1N9A5znRQyeAhP2
	 cIOwam4efkqOJuAh8dzVejxKGxjrtQbTILjq8DUfUJOV5wPzH9Oh9zhbVPuUMua4BnbO+
	 ptOe8/ZmUA+YlFIQy0UaOah+6JZxvcbA1tgI5ZkI4wIrZ2VbIDOD71jCwu4SKjlZulimX
	 6p5cRWBncQrnTI3VF5ceROniEfLd2g0JqFfIFT9A2q6kdAG4Lr9q8ake5L05R0pjxSHaH
	 kdakkcFKNsB78kF7CclBxzF2p/ByRviWHtb8T7fzhgn8Tprj9fLWqkZXENCoMFe/tOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QsUaCyk8;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F07606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QsUaCyk8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 25B591A1609;
	Wed, 11 Nov 2026 10:48:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC46B6017E;
	Wed, 11 Nov 2026 10:48:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12B4511BC0CA6;
	Wed, 11 Nov 2026 11:48:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794394115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ad6FU7Y+CZOMr0uGpGArGMy8cMkHauN05AxVml3ZXXU=;
	b=QsUaCyk8oHaVG6a7PrFLh8ya9RivlvgLKDf2efvlwxiDM1cbG8CQ+35C+E/kufAQl4XO2s
	nlcq15mOHMHECSLLYyB2L6jpB5UoRNZ3+KNo42DvuJDHWA5hmVVeiBVLNXQ5aJdfoiPJ72
	rVCAjN6lsZ61ELKlbHCfD2Cyj5Y+WzklegU7MG+8M77lDG0kq2okUjWrK67kQVRBqMZtw8
	Ggx5NTO8vIeJ3Iv79nOqdIOB7U4Lsrcyh5FHRUH5dPeFPpmiawX6bvf+uoNjg8SgFoVtfO
	5SCCo08BdRPi72MeUsdc3u9RGj1VLc4dr5FF3Xjv6G2/3xxYF5YrjkRg7iMUFQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025133636.253505-1-clamor95@gmail.com>
References: <20261025133636.253505-1-clamor95@gmail.com>
Subject: Re: [PATCH v1] drm/bridge: ssd2825: Fix panel enable sequence
Message-Id: <179439411041.1683659.16967386126317635129.b4-ty@b4>
Date: Wed, 11 Nov 2026 11:48:30 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Sun, 25 Oct 2026 15:36:36 +0200, Svyatoslav Ryhel wrote:
> Currently, in the case of a single bridge and a single panel, the DRM
> framework calls panel prepare() > bridge pre_enable() > bridge enable() >
> panel enable(). While this is fine for most cases, the SSD2825 requires
> the last two steps to be swapped. There is no meaningful way to achieve
> this using standard bridge chain configuration, so the bridge previously
> called panel_enable() directly at the end of its pre_enable() hook to
> gain fine-grained control over the sequence.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: ssd2825: Fix panel enable sequence
      commit: 8bf8cda54c08ee3693f4dd1e2b7607fe5e466c79

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


