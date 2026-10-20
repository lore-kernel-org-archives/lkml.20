Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515143;
	b=cnbFGZf6HdMce0RLrFPODD3TbIYvt6Kc1xeKJl3FkGHwTnzM4jqoUg9LqWjD3Ul/7GOA
	 X2U0LLNvtWQjhIt/mGJ1yW4iXCF5B+KfgOR1w0Xv3SX0lHl2Ti2KSz5tqOpCLhelQglHh
	 Dbpt4Ee4GT9Timo8wngR770ILB1Ge87wfDIuzN5yxaPfZCAmcZz7S4skjnBTPxgQi3N1/
	 xFkXZq2ZWzQyQ8IY3xfiumzRDtMhSONTE2Xrj5odxxJ7n9lTr7MrncCr8nJMQAdz5nRlm
	 aHlEgcf+RWQfz+vuhzK28ywxH6vtqT12iPgRApBPfeIIV22JTw77ncubR835tloRS0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515143;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=LVEh3gnmjMCOZtG0jYsrPGvjcEg6BmmePivPcjrSTKM=;
	b=v7R040NCaVUVq6yEGpXwoi0ecpgDWwaD5MVCcVwR1bpcS/8oYs5bJr26o5W3CN6mpQgj
	 wVZIpdZBuvsnXsXDHCAWcBpHIlY5G4geiLv3mAJfL6lAT1Yi6S7N5QCanBio72o4bnmdw
	 ZWH4DvBGLLEvCHZGEcPUlnj1ai75+53ESzTh+HBmLbgtGZCvjYfmCFhikkx7E0lA/zIwG
	 G+wPwscnJB5Mh0XknwGw0C5QDH7DLVhc7k4YAUy6H9Sfcosw7dR2CLnqnY/LEXQpq3mWf
	 LqspAPRtmiNAIYtU7FRQKpi7tV7NIef+CwyTQz3lCckuLgiicls/DjpA2Z/2OuVAXmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0pt+d0KO;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC601606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC601606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0pt+d0KO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 157C61A1294;
	Tue, 20 Oct 2026 16:52:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D80DA60393;
	Tue, 20 Oct 2026 16:52:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA8B810328DD0;
	Tue, 20 Oct 2026 18:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LVEh3gnmjMCOZtG0jYsrPGvjcEg6BmmePivPcjrSTKM=;
	b=0pt+d0KOP7v+af1AEM+4HLq1rwl5H8zrXsX3C221TSUBZciN7OSEJtlTHx0NC44oclS8C9
	OIjLwvgNDBfHJ79OD8MIxuOx7LiIrpqBnXhvlMnHYKYyIVc5Sc2T5hKwHIYD23yppahRbq
	r0thPNaygG3A3fY6D4sIzCDAOm4dBsAslYoBjwPcvanvuimzWtugNinjpbtnqIxk1xL2aQ
	KFr0sHQcSPRzY6DPzs4Kv01Kj1pQIMnXbvrgGkCvOXcOjaJJas6c82uY4Ak+Ri5bGN05n6
	mrmyj5kFnZbcX0Ow+HioAHdQYQ6N9NV9hay89858T8ds5nYpdIZ3W+7ESCrkgg==
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
Subject: Re: [PATCH v8 03/14] drm/bridge: it6505: balance and disable
 runtime PM on remove
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
In-Reply-To: <aa94f192ee4ac67bc51d0809fdd4a0e675050fef.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <aa94f192ee4ac67bc51d0809fdd4a0e675050fef.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509976.78870.15886930993907247858.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 28 Sep 2026 00:49:56 +0100, Daniel Golle <daniel@makrotopia.org> wrote:
> Runtime PM is enabled in probe but never disabled on remove, so
> rebinding the driver warns "Unbalanced pm_runtime_enable!". The
> extcon work also holds a usage reference while a display is
> connected, which unbinding leaks; the count survives in struct
> device, so after a rebind the device never runtime-suspends again.
> 
> Drop the usage reference held for a connected display and disable
> runtime PM in remove().
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

