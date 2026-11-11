Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391367;
	b=Ydg/6KB7iR+GnM4zL8XKRWSlARg7QEWK5psoP26ImZV+MmqwjS9/YNCQq6QLUpRXzc9I
	 ugN3lXpKKHuRAiwIckhfvjeJdkLrRG5ej7cnnUW6INOXttEdQTKCHXc/fugLUlTXCoZj3
	 pq5hCx3jYx0btxEgs+e9WihmQ1jl0E5iXfiASLQXI57+Z0PhS5B2g1E/fh8qMN81jJ1ZX
	 e9C9mLPb6l8nbauXksikSxu0Tp5TLl+VYFZFHbAtC3d8kPXesOFWhh9HsdBpj4dZTI3ih
	 KK5xzVrzgig5C884lB8M9EpGIJ9OYiIzUXeQ1GpqrjzvtA0PwudOWdMUtr01mLIcVHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391367;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=C/ZzCoSTLGLL9NNSJn3WeO3M+A/iJcirek8/MKvgyvM=;
	b=00qxvlf6D77STSKtEoKCja6ItFht8kO34uCWlZjS6gouggSsM+uJtGxJaIftIfIZWhoT
	 oFB3+bYRNEdFdfQGloUNr10Nn9PvzDwVkc65bB4UXyhex76YYmTZAfiPXgJJLYTk5cdYq
	 LT7YW8M2WaCIG2rsb3UQT7yc+WeOUiDpYAK6CS24onxhGoIvNPIqMVJsmW8RKuSLTxIvi
	 Pwd9eqaOGC4MJ8w9Mru1dv+tDOr+sM1DSKoKXcj1Vcf4zK+daCXHu5THXQexZ9/LSxCaE
	 1nNRFxdz7PHr+qTgMk0MYdfPWTw9i1Yo1agI/tljUlL8n0JaWlAGtrzv6JxFAEctMEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X4PPoGho;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A773606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A773606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X4PPoGho
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DC8FA1A1609;
	Wed, 11 Nov 2026 10:02:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A34686017E;
	Wed, 11 Nov 2026 10:02:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2702111BC163F;
	Wed, 11 Nov 2026 11:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794391362; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C/ZzCoSTLGLL9NNSJn3WeO3M+A/iJcirek8/MKvgyvM=;
	b=X4PPoGhoRxeBJW+5FTCNAMpgxfexvQDcRK0yPdZCyLxFpEFdOlo6WTX0v85qWELsJbC9dK
	AM97nlZkzwYTAeb/QWUdnR1ilp7LEO3E9SRnoW5EVIDWrdNo9TJHumngf6dEfyP9jJHMya
	nzl33y9p5PqsER+qUnx7BroWvm48Z14thRsFi1J58OlOyLiY9Y6sqHQ49G1Klrc71X5iRf
	SO/wnY58NyhrFoiIASHZoUWJf3j34R+Kpj1irK2be5+KyMww0ubAA0+XW4RIjhqpdgqSb0
	cDZgjnts7kTzGirOVnLrdZQ+cw6tqHhyeH3W7F+3pQ0Orv7O9EZCZ6i9vlscPA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: andrzej.hajda@intel.com, Pengpeng Hou <hppiscas@163.com>
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, 
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920034833.18874-1-hppiscas@163.com>
References: <20260920034833.18874-1-hppiscas@163.com>
Subject: Re: [PATCH v2] drm/bridge: sii902x: validate I2S data lane values
Message-Id: <179439135576.1435014.6150001319087782287.b4-ty@b4>
Date: Wed, 11 Nov 2026 11:02:35 +0100
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


On Sun, 20 Sep 2026 11:48:33 +0800, Pengpeng Hou wrote:
> The sil,i2s-data-lanes property reader bounds the number of entries, but
> does not bound each entry's value. Those values index the four-entry
> i2s_lane_id table when the audio FIFO sequence is built.
> 
> Reject unsupported lane values before indexing that table. Report the
> property name and invalid value with dev_err_probe() so the diagnostic
> identifies the faulty configuration.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: sii902x: validate I2S data lane values
      commit: 444b7116e7ef1fdb5f7db3bc1f74b20098d062d4

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


