Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714182;
	b=ba3pgA5bJ3v9WsTpCJSlVS8VdTEI/G/9RAnj5WZ8vo6vlyTOKadvTg506KB34ez2LQ5l
	 GV07G0lN5sqBvmlDzPW1aB3I8aMEEIDqcW2/rcIzQV50qP65oGeGOIELfqleABAkE3crj
	 QomZLny+XKieqJOnZ2aR6qP0lzCLxHhtdoTS/cf0TmolgyqitjxzhFoTrieALoeZCt/OJ
	 KDhnnxPoG4MVcWw3XKF5NUMYoIAO5qMRcgDpZ0O7RaLde7S5wJEHLkPfF5RZo1a57jwfr
	 teOrDFW/dMpcBYHXAKrv3rxo/c350Mw11IMn4kKRVt7jXMjZjvsRPt2S1RxOR1EVEXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714182;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=IWTHRSzeGW5fpCXVav87N82FYLK03Zsl6ESEIn+XvdQ=;
	b=FYg/eym2nw88OteDneKetbpi9X73kUF7MjZ1Rthf+iiAPl8TqLNnvmB1sMBW2g6rrDf0
	 GjKd2lBtFBnE+guQWo27/Fn1Lr9hFQcWE23LPDcUjxUHrP4t1L7tGWeR7W+tHD0ha4itN
	 mRuMhJpS6/MgBsj4vgW8vaw9YuVvb6TrYr3uDElgX7k73cpgg+1aJ0ldWR5gbcfyvq5XL
	 LSmMjbjEZ/eg8t5UtompZ6IVuWo+gsXT6f7my2HbUPYhSqcWU3gikGUZ8ziAZ5azYQDsG
	 EWUt+SFxyBz2bn60quS9AtxPXxMV8wVUKh6r1OcfTsJg45x5XG0JiZhKwHO3nDMSIHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2WprqqPW;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789C9606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789C9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2WprqqPW
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 129D3C8F463;
	Tue,  3 Nov 2026 13:57:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 721F86046C;
	Tue,  3 Nov 2026 13:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9856103291E2;
	Tue,  3 Nov 2026 14:56:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793714176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IWTHRSzeGW5fpCXVav87N82FYLK03Zsl6ESEIn+XvdQ=;
	b=2WprqqPWwIE4yMtpFdjcdwLq29XhBfaKpiYIEBYic/gByEZ+zv06NYLU+a5QT47FTvvXw0
	B4tzlkM4QQu8XwHRvp5uyInplg8m64tUM32MzDmXxc1a+aFV4DbT2pcUJ3v4gFAwIaOq7H
	JzR7FzHplqg4p53/K9IZCWjljox1SwLknQErThZkivVwvstHC7JSJ2uQFPt8ly3bKLd5F4
	sVwlQIPReYAvCji0ZfBLwqg+zMbCBjkSNf5XAPVZMUgymzjCjGXa1ly4+jnX0up9SKKRMF
	7kI+GWt1lAdr3JBtQ6yrECS1EBVtaExy9TtMr07qQGl9JNBw4WyPJx7Kl17MgA==
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
Date: Tue, 03 Nov 2026 14:56:09 +0100
Message-Id: <DMLMLTKB2QCE.3MTSUFWC3G8WQ@bootlin.com>
Subject: Re: [PATCH] drm/tilcdc: Fix suspend/resume drvdata
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Julien Panis" <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>,
 "Francis, Sebin" <sebin.francis@ti.com>, <stable@vger.kernel.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Kory Maincent (TI.com)"
 <kory.maincent@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261103-v7-4-topic-am335lpm-tilcdc-v1-1-b7f91f9c9a05@baylibre.com>
In-Reply-To: <20261103-v7-4-topic-am335lpm-tilcdc-v1-1-b7f91f9c9a05@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Nov 3, 2026 at 2:15 PM CET, Markus Schneider-Pargmann (TI) wrote:
> drvdata contains a pointer to a struct tilcdc_drm_private and not a
> pointer to a struct drm_device anymore.
>
> Note that this breaks suspend/resume at the moment, it hangs on
> acquiring a mutex.
>
> Interpret drvdata correctly as struct tilcdc_drm_private as is done in
> the rest of the driver.
>
> Fixes: 3301302060da ("drm/tilcdc: Modernize driver initialization and cle=
anup paths")
> Cc: stable@vger.kernel.org
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
