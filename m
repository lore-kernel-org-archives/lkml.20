Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879302;
	b=v1NCtaMolZgW/vWQOWtlWvHtIm+YkCuN1HtISC9FUBo0cNOQO8fAwbAUkAHOLwY77rYU
	 VkP57/l6mAVQsrXk8pNWTtDsEPqIZ1aFOcbib59uMVr8YGNyue0djHHeITqQpEC5lNAy5
	 DCea5QU3PnUgVY6CQfA3ZOt4v+Mgflto8rI98jAjLnW8Ue4Q2fICc1remzSbgQHeQ6fO8
	 7ERPFbCEFN+9c3FDrNoPJuD/OpvkBV/xYIY+k68UYQGP3dGABBeh4MK6E27NbG5CWPr2W
	 x9u1FnToSDeCxWDF9zkXmGo0rfj3yFWv2BW5TqsuvE1EdXEbOfjNBdazH5apyDNG7zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879302;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=XUzqzsKgcyoL6M8PVuZWS1pIRiVak4HGA1enwxpKFgU=;
	b=g6smKKCPuOeDigvM/69/E3NGreOM8hq0++q4q3xXz33uhmmAkPH9CVwfgY2RVwTbbcTn
	 WhlrWCrRxVCvODzWwRtn9LciRRT3iXdbZ+SfeyJigQ2/z2Iy7u1Que1kcSCVkVC7wN9CN
	 npjeIhKe0lWcAByhcH4jWvA4sGoeX6/Ha7qkN+jxFLgBRVlrmmu/5G51i5kzNVAU8ri9q
	 xrFHgeXd7337Dt7wN1aB/+Awjgfa+KGA0HRIgD9ZCMerW9SpxpkXkdwXiMrVopi6qlkBJ
	 Zcb1zZ/p4zLNwjK+bE/Fvy0bV1NKhvu+QM/DvB9SdVZgRNwnE98MBOUrSNnHlRYcChA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TfzyPtUu;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CDD606BD73;
	Thu,  5 Nov 2026 11:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23CDD606BD73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TfzyPtUu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8E23C69157;
	Thu,  5 Nov 2026 11:48:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDEEB5FF85;
	Thu,  5 Nov 2026 11:48:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EEB61032923C;
	Thu,  5 Nov 2026 12:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793879293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XUzqzsKgcyoL6M8PVuZWS1pIRiVak4HGA1enwxpKFgU=;
	b=TfzyPtUunkXTXfMbxVM6GSrt3bgzxOaRd+9ROUgEN/9PFfQ/lJQvYeQ0HNnrj0uOEs7h38
	YAMWsq/K+cBpYFLjPPk6S0iqU6GRURwRoL9hjfGRk4mj8XswxSkTwj/bDkQpBgfKSdAwj/
	30FE8aFQUxhL3grGC4PaVGnZXEUgCf6BKafXeL0l7oo0cWdPeFfjlYVW9bEqJxeVoQTjhh
	mG2qG9DEKkobPViVI7zvbc18P0FJ8yHIARYYiz5Z9NP4slBl11/7xFmck16Ntd+1lRrMR1
	eUotg+NbT9ojrx7E1oxrESA07Er+/iip9o9F+4AnJT03rL1lcyvLqeaWatypYQ==
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
Subject: Re: [PATCH v8 4/9] drm/bridge: pass extra events to the HPD
 callback
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
In-Reply-To: <20261024-hpd-irq-events-v8-4-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-4-6ee949e7a384@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 12:47:24 +0100
Message-Id: <179387924494.1025980.10089938981667489796.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 24 Oct 2026 03:35:20 +0300, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Bridge drivers report these events through the
> drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
> callback, specified during the drm_bridge_hpd_enable(), letting
> underlying drivers (e.g. drm_bridge_connector) to receive these events.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

