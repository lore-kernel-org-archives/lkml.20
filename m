Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616832;
	b=bf25h5S+m9/YEfq5b6JhJijQWlDipdUwsr33IIxrx3rsBs3+M0qC+I6Cob0kMgV9nklJ
	 kLYKTvVkOrJfCo2ZUViOmMLqU8BJW62t/3q8zUgQ99FArUYhiwHMXX2rqRD68LXVFlKGe
	 ARKBhBLdRzW11QyrAvfpkzkYZtbjG82EkFAax+y/948xUALB1+WSiZqnLhG2SCUVvzCq7
	 Km7t8V/l6YQlpM3UunuAmj5AkgxsexgyodGPcM5EF4HdL1PD1Kt1SWa4XP71xSWxB973m
	 Rt3WZBYg7+lVcSD5LnKiZLzYYVntnav538a7OFshWIfoGTXlXYQBqexL/1DOgRyfA/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616832;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=hIwGhic9aaDhslXB1BlcS2a5aNVnMVxhww6Z0E20VcU=;
	b=Wvnq30pI8kbVkKqx6Oh0fDmUBg26I5+zSh2A7rr89Vq0XGqc1qIwjZwVuzaUJLrxWe8y
	 AipOGbIfMgP2+WGbtEplxV1i3q5+QkFuKGub0gxt2IOjnGO8ZynfJVVnr4jDd69d0piZ0
	 3m2EJo/J7hcfr4HFAWzuoMZOY/VAFeyfLZFZcj+nZ2h9yYL7DwZM15y4ler/5n2uZLjnd
	 MlUtKaUgGCOGEUVA6ZVI8m4YgDSlsAhzx5nS7e69E76uiKFIHjphSCSbYvLZ1YKMMjYoR
	 Way3+1ryLYD+BMaN+ydRO1YWypnXqEutCqplXWYUWqSKRp/gG/TCVoaiGMQOEEGKxTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="YDo/lVhP";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C8C606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C8C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YDo/lVhP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9D9931A140B;
	Mon,  2 Nov 2026 10:53:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6171C60750;
	Mon,  2 Nov 2026 10:53:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3055F10329123;
	Mon,  2 Nov 2026 11:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793616826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hIwGhic9aaDhslXB1BlcS2a5aNVnMVxhww6Z0E20VcU=;
	b=YDo/lVhP3Dm7tO3q2+wJCZaZCE2zgSZgs4MkYq0+w4Qc9kxFdX0fBtHQN3jRm/k/0k79ht
	YPZgvL+waZCSIJ8Bia9aam2Y5msSvgHqSJiYRXok3Dvvfc8NOB/+MCh1NVuSnFEi3ViwVQ
	9DOEOgVUBH4HSmDqw11AinfajC4LCIkC5n0DeECEFue6MlPJYvnCx+J3Rqsf4dnIicatii
	22SDckuf2HGhOhVtnHDjAwElgXiqbJFkiUtzCZ9cXNsXATgL0YU2rygSas5CoY3rfubA3d
	gARBCuk+/GPT9wZWvXDuO7FiFLEsdLeDL1AXKFT9LM+oBG/geFQ0EiqGCr+6oQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
References: <20261012-drm-bridge-every-panel-cleanups-v1-0-0fd272f486b6@bootlin.com>
Subject: Re: [PATCH 0/3] drm: docs: mention currently recommended API
 instead of deprecated ones
Message-Id: <179361681996.195621.6558770131023458556.b4-ty@b4>
Date: Mon, 02 Nov 2026 11:53:39 +0100
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


On Mon, 12 Oct 2026 16:29:50 +0200, Luca Ceresoli wrote:
> This series replaces references to deprecated functions in the docs with
> the current recommended API.

Applied, thanks!

[1/3] drm/bridge: stop mentioning deprecated devm_drm_of_get_bridge() in docs
      commit: 70c53f96dd0167cc88fffb117909881017fac253
[2/3] drm/panel: stop mentioning deprecated devm_drm_of_get_bridge() in docs
      commit: 1b2dbea054aaa424a294309949c288bd31a139fc
[3/3] drm/drv: stop mentioning deprecated drm_of_find_panel_or_bridge() in docs
      commit: ba1019c160cc550c8f2648f0a93e6f556a2a15d9

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


