Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814300;
	b=S7dDKvz18JxdlsAGLzhXUl+TFl3Jnf6kgaJ40DPpi55SbT/8fkS/0yJfBfKu4xCLUAxn
	 lJsvJi+y7SjMiIE5TyeGGy/zlPZcesgEChxU5V8koqX6HSUzdBu42U+T4dxYaErbWc/HJ
	 kSDTg5q+BYkPchac5gpf9KPIptOeyzvXPcsDTVzU5fnCLCkxCmdCxahcR9sc1x1+Dytej
	 9jTHpUdhSXxSk7m/AqBoVfcL4A/IFNy2RuQtDc4rmDoLJe6U6xHp5p6LdojFxlJwXxqAl
	 j2N11iuPGhmIXFU7V4NNXvx8SUcFQrLJ0wdUfcKDicmTZCBLkaMQoUuUZr5h6eLfqag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814300;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=2OZGfbXAgtd+w2idgiB8GoPuMMh0i+bVPHx9lPE1lZA=;
	b=4SLb1aFhWLE5kcZf4B2hgoXF8mDPSR7dW6jL2zBMsUmxPLfy5njBQp96vey/98gNrxwo
	 0ztNPpHsiBzoJdwaX1NP3DGHG16AGGLhbcpgEyoqJYUd8tPTBpkmtHXTzrVPIHp9W0gZk
	 U5KpcWYAD88NPPs3xda1/rO5h9POvGR/6TJ0T5To889Ycf0ihkNencCiL1j5f2HSY9jAA
	 CZXHnBCiLHjCgHnJwGIjLjZ3GIe1ecWrFW+HZPOpLLXNlBrhv2CR5A9kq5yfOTG5/2f9V
	 szR/bLvJBedJuzBFT3WIAE8PH7Iv9mqXpPpybRR8khJ4cg8nz3AUpeOH1Ky4PhjSy9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kTHHYk48;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF64D606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF64D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kTHHYk48
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 141C7C8F46B;
	Wed,  4 Nov 2026 17:46:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E826B60770;
	Wed,  4 Nov 2026 17:44:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 946C410329205;
	Wed,  4 Nov 2026 18:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793814294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2OZGfbXAgtd+w2idgiB8GoPuMMh0i+bVPHx9lPE1lZA=;
	b=kTHHYk48A0LYy1x9rjVQdFvmO/rOU1MWiXaAvFQaqKzoNuq/1r0GEMb/3YJ+ywpnpi2/Vi
	sfPb7vit5c2vInGRjx6C8xDwUJjDEMUMl/QfyQpznpRKWelUb8I3FvOt8SlNj//m0/DDiW
	uJZ2p+7LH4UIXmje2dnM4FS/N+cTWvZCIsRNNxztFqiCmrN+7P6I5nFPPgHYsj0VgZ3dFS
	onRzwv4sCJvDKtqY1Rc4scdqXGcZIIejJEpc1PxWi9qFVV88oWnoBr4wAVGHwbQfzt78Pb
	tU8kbOLATbWMPeypsPtWPBOqDiKXFuOsR1a0z8PFJJLOzg03aZuggl6SnPgceQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 18:44:47 +0100
Message-Id: <DMMM3FFSQC5C.3PDA68QJ6WR2Z@bootlin.com>
Subject: Re: [PATCH v2] drm/bridge: sii902x: validate I2S data lane values
Cc: <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <luca.ceresoli@bootlin.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Pengpeng Hou" <hppiscas@163.com>, <andrzej.hajda@intel.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260920034833.18874-1-hppiscas@163.com>
In-Reply-To: <20260920034833.18874-1-hppiscas@163.com>
X-Last-TLS-Session-Version: TLSv1.3

On Sun Sep 20, 2026 at 5:48 AM CEST, Pengpeng Hou wrote:
> The sil,i2s-data-lanes property reader bounds the number of entries, but
> does not bound each entry's value. Those values index the four-entry
> i2s_lane_id table when the audio FIFO sequence is built.
>
> Reject unsupported lane values before indexing that table. Report the
> property name and invalid value with dev_err_probe() so the diagnostic
> identifies the faulty configuration.
>
> The issue was found by our static-analysis tool.
>
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
