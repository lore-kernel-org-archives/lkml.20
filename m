Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879323;
	b=2OCgqWQEeWvT9dACtq+rmUG1OSHqn8f3KeQ7BXQgZGDC1x65CBiE/ofZJEkEnMXQ0jeK
	 UW9Xxc20JK/6oCT2rY23dGoP3hCNkHsDJDAZSsWaNwLlr3McSwhvjZfOPFGTQ10C6dAtA
	 QAvQLTdeSTr4ebzYLWqcjiV1ZQTwV70n1RJ47PLp7bx6pL4K1EWQRl2Ny7KuCCORio7Ae
	 Gtp+WsCqZB5utIlKwBRd07Jwune0iqTmUTpb+v9nshQJpYxxn/Ppf8Peoa2NsPV+rjo8Z
	 FYDJ8k/hR7M2lRRl82EjS5S5atS2BkNzd+eoWCWHHQ50FHOUNPaadp+JBP9k/BBzanQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879323;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=VDPNZAab1PM8LOjgIqFcAGmLTyOIwR5dfmB79CXKQsE=;
	b=eZzhR1liHs6alKaUo0NtgTl2OTl4BmL0iy4n3hUr4Qw8WqQ4d6rAohsB2QBtn2o1ormp
	 PSIKcJqnsYOEbs2UZ04r7FYQEgoiqqnduFnIuw+FI8csLE7gW9cL7RezYR7ezN9rjUj8J
	 l+G2ctcFuQdRjoHzfC+k99HsARfgYR5YrG8EH8sj5bgIk07RV6ezSyzM4Q+3zJOXeN7iG
	 zH6EI20yHjzFEppiyzUIj85t9FCrdsn3puQkMyO7Jh8cVoz1pg2TmEDqXQfm01vLQoSH5
	 RkkBSuoIIwwB77dj2nP8rBBXI4LDc+hxYb8EesO5nlKZNs3KLAfvNJbot/VjiroddDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gTUeBLA2;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A5606CE84;
	Thu,  5 Nov 2026 11:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E9A5606CE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gTUeBLA2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C83AB4E407FD;
	Thu,  5 Nov 2026 11:48:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92CCE5FF85;
	Thu,  5 Nov 2026 11:48:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D73E1032928A;
	Thu,  5 Nov 2026 12:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793879318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VDPNZAab1PM8LOjgIqFcAGmLTyOIwR5dfmB79CXKQsE=;
	b=gTUeBLA2N/O/B+wx+ljwmMGwLW3XWpRyBwcJ1LUmbJ7FMJjwGp0PjVnKIwFXVqrf2sYxdm
	/62NVGRIA64/9wvmhAQM3e36EOQXGzXPsq0Pbz4Tvf7HAr3lfnBvVua5pVenkzmXuhytq2
	uk3ENuExjaGLtsdduVRr7OHoQ1rK6OFf0oBSC1tEAl6fOmK+PiP98AyRCRsq9vlYWq1Tvs
	rKjoGBwt/j3gYp47YiBr01OjvqjJJz3WFs0Mp9Tivfx8xcKBZxEiYNIJyi1gmzjVbzdZd+
	U8vxJ3TttmoVX94A1sKT4PQyMI+tje46ghusL5IPcunmBTbv0aPEgrmsjctS1w==
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
Subject: Re: [PATCH v8 9/9] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
In-Reply-To: <20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 12:47:24 +0100
Message-Id: <179387924497.1025980.2920324286398089325.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 24 Oct 2026 03:35:25 +0300, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Pass IRQ_HPD events from the EC to the HPD bridge, letting those
> to be delivered to the DisplayPort driver.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

