Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827936;
	b=ktOQBu6RxbwHtU/OubD+VqDMUYjO8kdwZ3hGw815RqGqobMa6j180laj+BQRCBJ3x1ey
	 leRIXxmSQ0UFCkd/zmJ23RDuEiyf9YPDpkNL9MK6pq4vSqyb4qjIpmrsuXuwpJOyfYTGP
	 osD5iNtPsiReorlI32ILRuIxU0Jqft5C4K0yxh83OimRZsl0E9+MFgK1i6Pl4GxNP3Laj
	 ADaQG9llEcum3uclVxiZddfC+jUhdYLTnPv1yoeXM6eNPAgKzzTD9wn0EgobCm0piBupr
	 2/F2h+Wz2W8GNf2QdHqNeqla3qCIZjpO9LCnI582cDWc40nFaTdCBvzwYTG8Yz2wujA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827936;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=dktc9lc+Bf7CsFmPizG4GZLduM0R6qpdkcP/3gu+EEE=;
	b=vHuQ03S/v58WWCsyURzmQkyuNp6m/fFT5YdyPNnCRc64cHC+dDgbGnqyTGZtRRaNJlLK
	 e23zCr8563OrXhij9oe+mK4mR2jzSktJL1HD9uLj7FULR9ebem6T3kEz1x3Y3JV6Nka5G
	 LsP7tqMgKyTL9LlArg9u/7z5nOxxPfnmGmIM5q/yoQgl51087BzkqyvWOxzuaG8OfMFym
	 qXajeOf1UQ7qtKnPNs1V+OlCgQJYxr5VvIu0xutjsPZHYtBgbyxQ38257U1DZr2H4PlFc
	 UXewhRJTml8ajoaWZJC83Gw0THCP682SueX932uC8AkoJJ7wSIQddiylxHOoQSIkaXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SwYez2F7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5AD606FD9F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5AD606FD9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SwYez2F7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 517E61A168C;
	Mon, 16 Nov 2026 11:18:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E2666023F;
	Mon, 16 Nov 2026 11:18:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D9F011BC00CB;
	Mon, 16 Nov 2026 12:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794827926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dktc9lc+Bf7CsFmPizG4GZLduM0R6qpdkcP/3gu+EEE=;
	b=SwYez2F7X4olubYZ3QgDwgCQFJA25xgFhJqRhpBSP4o6vAQJswZtzhTlgXVima26nl2ujJ
	hdgAaKRrYWYUnlp6gQ11CuZdQ2rpg3BhD5TtbJEoPhAkoXwFCxGgNwXrq/2UnLSWYe+Ne/
	ZdUUFg7kM/khXPCOafpLTGx13V/7FWyAS4kFbtKk2C1fC0uG6EFnUFn9f2bBQ6CMgQvaFM
	Z8EC6PAXcds7g/kDLUa1R9IyqC1KTXQp/ECjcJuKgeb0Q+MTFl0bsMl+Y5Z6WCW02/JuI0
	XFLJ+f64DgdLdet2hlBlz3NqBk+2j5PfkODrnsoio3QrjUkmaroJLsvcIQjD6g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030163254.3175671-1-laurentiu.palcu@oss.nxp.com>
References: <20261030163254.3175671-1-laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Remove panel naming and use
 scoped device_node cleanup
Message-Id: <179482792078.118378.10625483248086042386.b4-ty@b4>
Date: Mon, 16 Nov 2026 12:18:40 +0100
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


On Fri, 30 Oct 2026 16:32:52 +0000, Laurentiu Palcu wrote:
> The remote endpoint node is not necessarily a panel, so drop the "panel"
> naming and refer to the next bridge instead. Update the error message
> printed when no output port is connected.
> 
> While at it, convert the device_node handling in fsl_ldb_probe() to use
> the __free(device_node) cleanup helper. Since remote1 and remote2 now
> stay valid until the function returns, pass the selected one directly to
> of_drm_find_and_get_bridge() and drop the extra panel_node reference.
> Do the same for the dual-link port1/port2 lookups.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: fsl-ldb: Remove panel naming and use scoped device_node cleanup
      commit: 16c31b960788c1cee1bf9e8b115cda8b4643cb39

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


