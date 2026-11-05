Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879293;
	b=GCtsNB/Fv1r9OkG07rwolwsgVbE8voLDBUV3KNquwovnzHKvfvM47cm+W/jakDp84LH6
	 Oy189XXmJXy9q8AxpZAVOW1IgxQUCa1u7psdJOx3vGz6LrkZeLLs47jHo9BgB2/6X1x6t
	 BZSFbNAUhQeDuEVWx/YrHXb65BQ7X0XmN3ASiqadx/klY6hOr9WWTcuphn3nk5jJXfuAn
	 9uVpjI3gixdzeMVSMLxqBFf7mz7d6271sfqX6Job+wkjQ+SPxIlh+GJTbUMFNnFJeE3AM
	 v+rQx/8FdIeBs4lkd+TrKcsqr84M/3BbUBbprBpWzK0ZwPYx8vTz6lCrsiNhkaqwsUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879293;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=tMawwfcXVfKsNftH6bqv4dBoqVRkNbGwmeCn0YU/mBE=;
	b=SyA8XgtvLzFjmKd8tMV0qe+NEZnpa5jZG+Nxhl0jmh+efpqLYC7Cs9Z/AyzYWBzbpPxA
	 X9Tj2zTHZhaI6iy2MbU5v2fpax5rOa39UqZ0hTyaN+0zORqzePi+COiNjr+EIWNkmyeK8
	 9C38dtq7Djblax23MYOo3jTl3b0LuhUKUJdQIiDf2zpbwOIlF0DOboc0R257l9HQYv6OT
	 0Ug1x913UGifkoW+b9ZV5wTuG6B3djqTMhl5OQEPmLLruo5HUGTmk0iS1bpoC2AktIlIz
	 kDpd8ggIUzYK2vpKWxRwF2VBtrI+jsoN/90zA+j14XKNGB00w3PmN+5cjl9KVKp8u/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=c0T08sAS;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0C2606B55E;
	Thu,  5 Nov 2026 11:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF0C2606B55E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=c0T08sAS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8211DC69157;
	Thu,  5 Nov 2026 11:48:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65D805FF85;
	Thu,  5 Nov 2026 11:48:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 484CE10328CE3;
	Thu,  5 Nov 2026 12:47:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793879282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tMawwfcXVfKsNftH6bqv4dBoqVRkNbGwmeCn0YU/mBE=;
	b=c0T08sASg4VFEZudJtpXn/e328R0EmQMBk+ce82r7kWoFFtodwOrcHrRLH+DcG8StuYIAQ
	GJ8O24dba+nDh/nRe2LNJBdJ03KoMrmnsHqhEjzsVHKyLOz1xzddgyXmU1JLwE2gji3VVC
	re2QFrwOI0H8HaJLaTNo7t75wZu2xzF4JhcevuPYeI5ahlFS8M/VWG3uOm22fefal4SbHj
	vSJY/PGMCR4vKy7KooO97HhIOaERX0ZtDmbuygGZ3tLXG4/RKllaK7+CZj2rHfQXe9BsoE
	aIPzTyIAGw7SNd1jyAUyrgxW4Wvu83aBsObAA3gi6I9olu4IshmToL46xhVZiA==
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
Subject: Re: [PATCH v8 3/9] drm/bridge: pass down IRQ_HPD to the drivers
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
In-Reply-To: <20261024-hpd-irq-events-v8-3-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-3-6ee949e7a384@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 12:47:24 +0100
Message-Id: <179387924493.1025980.5050079385728779717.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 24 Oct 2026 03:35:19 +0300, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side. Pass down the extra status to the bridge drivers via the
> hpd_notify() callback, letting DP bridges to act accordingly.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

