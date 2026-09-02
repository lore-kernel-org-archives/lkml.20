Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1454AA3FE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365662; cv=none; b=NhloZ/Jb8iPnpAZiFG0oGJ+XBqCQnIUcVOvOtpzhr8fAZbN8nLWOvQY+DiVXNlFCxbDe4ko+5ZV+0TpE9vvaDbVSJ7iOOyG+8LEDJ1XieQPDQqlUTokBjwv/9Ztc56DvBQwHqrF5moRpHS8YmldBvQucNNxZOGPwyUSp9Sr1btk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365662; c=relaxed/simple;
	bh=8PcyBYgMXhR1SOemexk5oU4NDpsV5O8crEpM4yV+7go=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XOSNG6wW4JFadLTXra7dxjNnRzQ8P8KG3Lz49vodegi7HiVf82KXXtcdXK2cJC9XA8K9ypNHF7rGSeHee02Owy0f2RaRb3NSg6pqw84JhVUOyo8gqc7PH3+Xp3NWEAZggWiLGHGCJwnqXR+FjxSgHmUtxqUesekJEmCXLO7SoqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xYZ0O0nn; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xYZ0O0nn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 444F84E414CF;
	Wed,  2 Sep 2026 16:14:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14F106053C;
	Wed,  2 Sep 2026 16:14:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D60F11C79A58;
	Wed,  2 Sep 2026 18:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788365651; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A0csWIqGOewpZKchd0iw7mpPiYpYawh6k/Q+FjJLlmc=;
	b=xYZ0O0nnR55u59mUc55xCDmzi0nrO6/HZ7cP7O6W+rmH/QeShjyT9/j/GFGVQcauW1W2Wz
	W6bpBcgzjgiq/AFq9fOiRSwyXExvT8h1LfF77pEOe9Y9+pucpUzeeKFic5pbDn4Dw9nJ4n
	yCnUdF5SkaLtZA3lB1VqA2bWcVGUO58QM6fwILE7Tdh4RkxR1hCefMVbsPFv2XDJDb47pt
	0gqAT9hGglxuXPxr70hl35OpkrjHEn9hu8KZ4ZLpdcqgfbdfsnWPfQI3sw5YsMcEbmq/52
	R4nOC64//tjEyvUMfZbd/C3VKGJaaCY7bUxq+5MCP7CM2/pTeMcLZWiL09wtnA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Artur Weber <aweber.kernel@gmail.com>, David Heidelberg <david@ixit.cz>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Osama Abdelkader <osama.abdelkader@gmail.com>
In-Reply-To: <20260812144426.62074-1-osama.abdelkader@gmail.com>
References: <20260812144426.62074-1-osama.abdelkader@gmail.com>
Subject: Re: [PATCH v4 2/6] drm/panel: Use managed helpers in Samsung
 panels
Message-Id: <178836564734.768820.7845356788129681721.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 12 Aug 2026 16:44:21 +0200, Osama Abdelkader wrote:
> Use the managed MIPI DSI attach and panel add helpers in Samsung panel
> drivers and drop the corresponding manual detach and panel remove calls
> from remove paths. Also, switch to devm_backlight_device_register in
> s6e3ha2 and s6e63j0x03.

Applied, thanks!

[2/6] drm/panel: Use managed helpers in Samsung panels
      commit: 180acca3b7f0248634c0a504486e22eb3e12e28a

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


