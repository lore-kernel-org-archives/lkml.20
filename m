Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879275;
	b=hJwdqOfxasXQJfnZ8A9p6A95iv8KBmq3HnR+SvHKjdRdb40hoq9r7AgJ/tMx+o0wKe78
	 ztoTJXHTd0eJs2S/pGE6lvT31QOtQNmLaGg6/0vIeoBd9E4Og78A549GRPQaqXtcRn62C
	 Di0Mt/cNYZ9tzp+DeAONX1j1WIdgvphqvkPGhQj7g7L96atkXO1rDyoOnEXhoJXkIKTtS
	 Dg+on0bIg2nUIDzpkyQXA7gto3MTmWiZ2GrKCKc0s7zF1lLnYodRyKFSQKKiqlS9uh3iP
	 PPZ+Rk5QWognbbMORXdDOC+4nBZCRPX1WruXbR2UmAR0cdhC85sTAwf7swwuZRhnN3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879275;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=5jiuSYWr/X4Yj8yrZR9utlC8Rdw8fQ7cuQ21H6LtP70=;
	b=eBR8KhUR2Q1BkZPx2vdv7Lx5ZfFXj0Ljv2PNGUAMyei15kkgCjY+CCnJUi08OVaJFvNj
	 Tiit/8U89a2p7XL0KUF1Ku3azCSdJm37yF28DlmaUmnHw8Iie6HDqJUJ+FateoM7zGRC6
	 ceuIXc7nmHOfbxZrC/Uwlprrdog5IUfH1EwfNpyFtqm7X/9I94X60HEpeJV4Lsa0UWavI
	 Aky+giLDgq/DNH08vDJD69wMIklQbvN2LlLNZ9Sj+3Qvu2YuMCpPyyIJQ9xlZagYcZbu3
	 41vBAhe3vJFzUQuFZiHCe/VQmCu00qKDm1nsAzpgfJrcv8/H7yMCEGm5qykTh/hMSQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oEAl6rSn;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD6606B546;
	Thu,  5 Nov 2026 11:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84FD6606B546
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oEAl6rSn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C4B64E407D8;
	Thu,  5 Nov 2026 11:47:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BEA05FF85;
	Thu,  5 Nov 2026 11:47:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16F1110328CE3;
	Thu,  5 Nov 2026 12:47:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793879262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5jiuSYWr/X4Yj8yrZR9utlC8Rdw8fQ7cuQ21H6LtP70=;
	b=oEAl6rSn/0Yk4SEMdJ+UAoZyhj4Cb8QKHfvLkq5DO9ySBTIiJy2RjhH0LRJSeDNBpZoqgI
	cMz32xkW8TQBpiui7fCtQuRqEBg2qMvwOpcK92uqsIB20qIpG6nPNTTbdHtCEz5NYJTPOL
	WX9Cawg49OL4gHKkmsekEg6p6R6AD6EeuXJLmWDXVw7bx+m3+5Fmh4Aa+IfzZPYlzQHrdf
	UL01ujuPaGgXrXHKtQwrsOaGoOnM/62t5JVq5V8wNdPasKaFv9q1QyxtkWRN5vMyeTf5fp
	HW6Pf9FaEyBPyEXRg5W1HNgGzi/FhDd2nKvsi6fd4epoj7kfgm7Wec6UMDO1zQ==
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
Subject: Re: [PATCH v8 1/9] drm/connector: report out-of-band IRQ_HPD
 events
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
In-Reply-To: <20261024-hpd-irq-events-v8-1-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-1-6ee949e7a384@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 12:47:24 +0100
Message-Id: <179387924490.1025980.16294467387972507446.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 24 Oct 2026 03:35:17 +0300, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> The DisplayPort standard defines a special kind of events called IRQ.
> These events are used to notify DP Source about the events on the Sink
> side. It is extremely important for DP MST handling, where the MST
> events are reported through this IRQ.
> 
> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> events are reported through the bits in the AltMode VDOs.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

