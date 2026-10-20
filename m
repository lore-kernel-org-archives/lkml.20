Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515160;
	b=UeVseEH7rB5M2LvFe6dcXxJIO7iBz8mz9zmAm1QjZvLxzfyQWxv+CaTOz3mwG7sRLycK
	 Exuby9nJxVCpRTMzAz5pFNKM4w62L94JDd6Zta9llxlB+CnANNZ+azbtsFOn451RPxjLa
	 cHbfxzJadKbQCcAetuN+L6RrUUxYLax8ulAWFSpQvq1ClectSEyvqk0xfcciROSvq0L5k
	 BkHdxUxCvWvc4rAKJOYKFLiWJD+DvQa9WMZMum7vmWC+Pt6hvaT5RCK8l3FfUvPzTbD4g
	 gOc6ZPHXkBY6c2YJioQDbhnPi1mibEdKQyIBnxpfDiM5C+uJaUVAGSujEhRalL+7pLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515160;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=V3lBDfIe7IPx+fVGzM7Ta3HhcKvhZuUi7zb60B5W+JI=;
	b=UWt0QIRuUxuCoCH2LyMRQNWHrHM3jeGa1EzkM/60cJWJ2eb5rMQJFVZKj9N3CiwAmGsc
	 GsTZ65if1Ych8px9gv2jMQmeMgTkZHWGSyguoYQZR9o/Lp1/0lMhlf+l0yuKFytwYWvZS
	 Kcpn16xmDUSFHyIoOlMFFg4C64CpLeB5hYggrhYQ02Ol/klO/vZQw73eQMgnubtgb8ON5
	 /NB1ejOcpJMyatUJEmgdq4vbvkHTHioErzMzRzy8C4p503YyFw0tm9XOBYLiDmaq98jCp
	 XyOf80syx/mySRQxUv5PKVAezdTCGQoVioeaymx+KqY//MvTNR29RSpPUHbk7SYK1kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dJFL0Zy8;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788E760A3816
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788E760A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dJFL0Zy8
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EFF5E4E4128B;
	Tue, 20 Oct 2026 16:52:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCCAF60393;
	Tue, 20 Oct 2026 16:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD03E10328D3B;
	Tue, 20 Oct 2026 18:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V3lBDfIe7IPx+fVGzM7Ta3HhcKvhZuUi7zb60B5W+JI=;
	b=dJFL0Zy8azXfiqvY/WRgiT8WQotmB1KAuidILhoUdNPBv769NTqgbNd19lLAIGUdWLwVhp
	rTXLpvD2CPSoGBjTtriooq24ujx0+Bkz3SJooa0HMOZ51JBjDId0aglWz5oVSoUqi6lfhK
	3kFFcSD4NlTFi6lTrMjCozeRdgFCvnpwtPrdCy/mO2Y7dqTLWMMpTe7zqf7lKqfU2VFG6w
	xqsDEir8UAL1ceWpFFI7P2sHoK9gJzEVeGuZ2ORgFK37/NvKZcYgHJbE0jOrRD2IM7zipa
	CFC4WxxGm8Fef/yONhmlerfvxl9w9AKMQyrOr/yWbqn0QEF6Tb0/x1dv1C6lYQ==
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
Subject: Re: [PATCH v8 05/14] drm/bridge: it6505: complete poweroff even if
 disabling regulators fails
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
In-Reply-To: <94daa219c80275afc8d2dd85df72c602f0d3e646.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <94daa219c80275afc8d2dd85df72c602f0d3e646.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509977.78870.1985601064843306523.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 28 Sep 2026 00:50:10 +0100, Daniel Golle <daniel@makrotopia.org> wrote:
> it6505_poweroff() returns early when regulator_disable() fails,
> leaving it6505->powered set with the IRQ already disabled. The next
> it6505_poweron() then takes its early return and never re-enables the
> IRQ, leaving the bridge deaf to hotplug and link training interrupts.
> The regulator core keeps the consumer's enable count on a failed
> disable either way, so bailing out only adds a wedged bridge on top of
> the leaked reference. Log the error and complete the power-off state
> transition instead.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

