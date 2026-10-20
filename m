Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515174;
	b=ChwxLVa6s8RjZ4ChKgApgp9KuiWXYQObhMz9Jt1iUaoIWr7ZnqWQN1MJsFi2Vb0R0rzy
	 CE47DG/CyScU5xKW6cyUEhHP7t+TFZLRehZ7+iNZyuxA1JG5G0y4uyyKkm4FQvuAY6T6I
	 XEXNZEnFLB8XiO83NonxN+zow7CZLMZHDjfrciGpvQglMU2JgoenSfgcD+epQr0Z1qB4e
	 JC7U+drvQArlnJK8dopc3c/nIVhp8mJHJb+rahB6ijD18zBw/mxIs+cKbm8bdqO4EfLEm
	 934GSCWmASd7l0UDWeNlkQpFQpSDoFdEoElDMD4It4UCWVEfS+VaDb2b4Pi1OLpqBdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515174;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=6XcyUJtIkiO9vvPz7IKkbuTRkju9mP6Fus4ZIhOD+q4=;
	b=f+HbyUyl+pGP3PKKBo2uLDeiKVZLd51ufkXRUgXiolTGfjIVBg1zEgYjqQx3vrowPmw3
	 Lk4ABVaR4JwQNCiySpAJL2W7stLtIqy4eoPjOd/ukYxe7QikGc3Ha5G9ulkGc/KcZEkxO
	 R+5Aw0GQvGckAyrtJ9p65MSTWPEoDMPz9oGuoTcH4kcD3KAe10EFL/GVFndxtW7LQ6qu8
	 iEnMzNdsJ0JQIqb4ssvoIZGCJnNOnoRY5OrkTTeqn72N+AoQ/Q0nZJYCx43Y50hIKeo43
	 yiSqd8q69KKsVkfkOiS9Wsp98Ka248lpu6U25yf+Ohv560ua2ZimAkaqYZrPvvyWc8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BH61s1Gl;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E025460A2602
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E025460A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BH61s1Gl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A70AE1A1299;
	Tue, 20 Oct 2026 16:52:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7580B60393;
	Tue, 20 Oct 2026 16:52:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4571010328DD2;
	Tue, 20 Oct 2026 18:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6XcyUJtIkiO9vvPz7IKkbuTRkju9mP6Fus4ZIhOD+q4=;
	b=BH61s1Glkuc4IxXGejfE6yKzOVXmvtqYAN418w+0wiTjCfAgCoLPyXHjEB3XKx+HNVboKs
	Lql+vfMdKlrL5nJFY8D/KMkV2C8b8UePQAagBAp2uQrZT6smuK0kG0GDcKseWtpMOuoCPU
	RbbLsipSRVXHkIs4d6Ao/o7GEpOxJcANWzb6C6HtNAxEb3Dbkm7IxbNsDs6uiTtEr7/sDD
	/QMO9thr39SGBEJujl4rV+038KKA/68H/1aLze6C4RshH52vFQF5MzsbbOtOIpUsUHhFcI
	472tEUA2/BCueBZEbchM9vtGq5wq/UyMSLkjY6VDzxGCNql0f1S3/9eXog89Kg==
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
Subject: Re: [PATCH v8 07/14] drm/bridge: it6505: avoid division by zero in
 pixel clock calculation
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
In-Reply-To: <4316fa443587b7778d4f135d8656511a11233d87.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <4316fa443587b7778d4f135d8656511a11233d87.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509978.78870.5665512963665107929.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 28 Sep 2026 00:50:25 +0100, Daniel Golle <daniel@makrotopia.org> wrote:
> it6505_calc_video_info() checks the sum of the three pixel clock
> counter samples for zero before dividing it by 3, so sums of 1 or 2
> truncate to 0 and the following pixel clock calculation divides by
> zero. Divide first and check the result.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

