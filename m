Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515134;
	b=Gvb/xBtOZ8G/CLh8j0kXq/ILMoDYLgitc/vtiWOiyA7qFTOsHwM8tkJCpUJjJ0luJHPC
	 FNh5dnrMwcFV0ebYyi+jm6y+R6iBTIMm15TScMIUBh+sMCTk0i/F6E9Vag2zUQzs2V+3Y
	 U2CR+eazMXvPRaBQt28MiXL7dtfqaMWcYumBW8zdXw4XkX4DtOEWYyTR9YszlpKvOLTf/
	 adRXOjraLR2m729eNLo4+c+g7O2QpJMKzWMaEHkwKocNEFFHk+MigknYHyxFVdG1LyTJm
	 UBtdwyidWwuqj0EufQJ9XJNEXeB0ZBk04ZLOcmyZggXO5zVnJU37Xcf20gFztSdy1yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515134;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=La8BSzU6EOhtfkyhIFlJpnRIC4j2c2GRZKQvEm7Ei+8=;
	b=yeWa5sZz68xs9n+n7b2BIPrNTUNCj6JG03WQGA0oLrwlQz7j7/8NROsYdgEqq/uLBNBV
	 WpKtYO3jRJR76tH1nKlkG1yNrxynCJp118Egy0ZfEZ4flSS1Pc93CZN37GqtWMi9TgGdd
	 Skb8lBxvPTR4HGioJtjh43HRV6/BcRswZPiV4SwKjvvwVQGvYblKbxK39qByidqcv5dfZ
	 kiaEPpgBFBnk9SsbUFatOcabik50JvTbBjE81jASyd67P2KrfryQ7d7XyXy+dhxoLTM3A
	 VrdmKFTb2Filau4rHRw+eOkJ2jZeYrJpO/7uxulevuXcmQxjsXzhzuYVaBz5LuxdBQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=k3+Fxa8z;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CEF606A327
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CEF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=k3+Fxa8z
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C9378C6220D;
	Tue, 20 Oct 2026 16:53:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B8EC60393;
	Tue, 20 Oct 2026 16:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27B1910328D3B;
	Tue, 20 Oct 2026 18:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=La8BSzU6EOhtfkyhIFlJpnRIC4j2c2GRZKQvEm7Ei+8=;
	b=k3+Fxa8zo7GnSCkZ0k0esCei06gWxur8ZWyCR7Zg7xc88FoeIGhVldzYe2h/pLuccTCmO5
	vifLPpFUN5nHzS8szl09bh7quVai8bPenBfwaRN580IWtIg/ScDdagziQnNvRcsILOQP3T
	PHYqhsYM1oopfItNe7MBmhhtehQe8nb//XBlYjjPUZor7X9dpZNO5qZZ6Jg+3czHupV+7G
	n19b3h5bPdgk09PZJP7/7LQ7FNaZ89ryH73J1sqfVOoDvob7N0D+CfZefOzAIPqnmldsAy
	wIOKBJTaFvx4vQSXZfFO8MMrlkz2HcC6Y1HNPKpysgyisWX+ztv611b745i+Cw==
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
Subject: Re: [PATCH v8 02/14] drm/bridge: it6505: quiesce work items before
 powering off
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
In-Reply-To: <f9780400c44f9bb24754588503257d6dc86d3c77.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <f9780400c44f9bb24754588503257d6dc86d3c77.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509974.78870.11099004101869522210.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 28 Sep 2026 00:49:45 +0100, Daniel Golle <daniel@makrotopia.org> wrote:
> it6505_poweroff() asserts the reset line and disables the regulators
> while link_works, hdcp_wait_ksv_list and hdcp_work may still be
> running. The work items and the register accessors only check
> it6505->powered, and the flag is cleared last, so a work item keeps
> driving link training or HDCP authentication into a chip that is
> already off until the flag catches up. Cancel the three work items
> before touching the power rails. None of them takes a runtime PM
> reference or extcon_lock, so the synchronous cancel is safe from
> every context that powers the chip off.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

