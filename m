Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515129;
	b=kT3oDT4o0apZacChoLXIu7He6LPxEr3Q5kXQy03VkylF45XBF3ffKh4KcnstzZjiha8t
	 r4NjUr8/w+LCTkxVjIxfnjITuicoCwo3/0R3efv5zzNGUC/+EN0sxwiEqft4IcaGB5qzF
	 FOTiPCUb1jlOpuKWW7yVUeZpGfiuWn6fIpdK/m8ZzMcCjNKKvuwoHI2za1uMU1ZgEJ5Ri
	 R64/Y5rqZMg1/igrTzG1mvDk6szolSz7HorZKMzRDkCOpJdaGDyaLOzT7laCTa6jwJ7IS
	 o4I1UxaSZzj0drTkvDuMlgY8KFPf10w7O122/pcYDrT5k7pRFf5IdGLsN8b8GjyTkQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515129;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=oSwcbatNs/0w1ybzYQUcJ96P49RIqvbDSPb+DvWsh68=;
	b=WdfOmsUyZMm1zauX9AlLEq9law+P9qE+a9OAmAHznul/nhYlFDMBRtxlf2OKAYUNzrLW
	 Fgel71i9cauUFF7Z21/b/OsoBpnnk+uUp3FkNHb7W6vgdbRXGBHUDpaygg8gJLz2Do68e
	 QRR4q+mcXEkK4UOLmnmxUq3nglNDyVg6Wohd0kwKTcTKcANqdPI5vQJ/0ac7hCwoya9hT
	 BMJJr43gqzHkluvFVPmzJM9o6X71pighwKkRC8RWP8dnN6rbrfJOt0FJ0gBVecZ0JucLv
	 pC1I6xW9mgAov70q0ZqDh5ZRek/coGB6iGj3TKjRrKt84qGW8JV1l9LfIYdPuhfdzVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Bequcv+J;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F265606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F265606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Bequcv+J
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0BF6BC62200;
	Tue, 20 Oct 2026 16:53:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 317CA60393;
	Tue, 20 Oct 2026 16:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8C5110328D20;
	Tue, 20 Oct 2026 18:51:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oSwcbatNs/0w1ybzYQUcJ96P49RIqvbDSPb+DvWsh68=;
	b=Bequcv+Jg52fBKJhrJ+2pPNgXW9jgM3F5Dw/WyO4tABcbekj85upeLJnZiyaBvB/ZHjBLF
	KZZRwL+zYFedV4RXGhj24geCAZHpUyXOpigdOvjHH7QmBThF6dQUS6gGgTxLEVLd42VLYw
	IF5yqtwsXSPyQ1vawmEa8b3SLSXZLZQJ3WJCqMCWqhPZhNCw6Ms0fhV6n2BaD8uJY4e+9b
	A1HVp7ER6JVY9qzJo0bxRskh5dpH5yw3hSPzViWu2ix0QBXiYHAZj2MrMi7lUn5Dg1P2OE
	wMu2NvCb0hTuT2VvDJKvEHo4KwocXunLgMPBqmuM5VSM2zd9hqfygVuN3bP6JA==
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
Subject: Re: [PATCH v8 01/14] drm/bridge: it6505: quiesce event sources and
 work on remove()
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>, 
 Pin-yen Lin <treapking@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <3f7ab3881c9dc575da02ddcd9b110a834a11f2ad.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <3f7ab3881c9dc575da02ddcd9b110a834a11f2ad.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509973.78870.17205773072726643371.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> struct it6505 is freed by devres right after remove() returns, but
> remove() cancels none of the driver's work items, so link_works,
> hdcp_wait_ksv_list, hdcp_work and extcon_wq can still run afterwards
> and dereference freed memory. Cancelling alone would not be enough:
> the threaded IRQ and the extcon notifier stay live until devres
> teardown and can requeue the works.
>
> Unregister the extcon notifier and disable the IRQ first, then cancel
> all work. Make it6505_remove_notifier_module() idempotent, tracking
> the registration in a flag under extcon_lock, as both .detach() and
> remove() call it now. The notifier_call pointer is left intact:
> extcon traverses its raw notifier chain without holding a lock, so a
> traversal racing with the unregistration may still invoke the
> callback. Also initialise extcon_wq in probe: cancel_work_sync() on a
> never-initialised work item trips WARN_ON(!work->func).
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Looks good:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

