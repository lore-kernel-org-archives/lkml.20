Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872686;
	b=3Tqr15hnPRsTa5HhpjVA1yaL12G9cXipXhjBUcQx7qJL9QFR2j0di0DOugVaQ6Lt7gqo
	 LhblANr6n0c1gXo4zCZpLKb8F6kynRo9o1kEc1sj8VibAGykuIwajk/QWwDtsJw5Vp8F0
	 vsK1odGmPf41mCsBU1JJMsXGgZHBLs9Zy6s+H2L7c+oP6ac+jy/In+oB+SCG+wyLNB6QY
	 b+CLeXNBMSROaHx+bSq/ADg7QJfm+Defun/4QTwoLIWl+AGrBFoarkwCQ7pbVhEtmNEMm
	 y9qayT8+sw4wqswEVxHy0uFznePa5eb17Jg/Jn1PwhvWvXjrM3yhCPWDfaYtzejGuZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872686;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=GGwd10+UV7oF3yQFv28KX3rG/BdRDcdmvcHFRYR63Gw=;
	b=iX9SaYFc6fcndNpG7g7Y5TPRIi/FKiglxEesJs1oMvOg66itRh1f8mcemuPoobm7fARB
	 9r5vW1Pg0/UM8tc38f7UNfYcyFtHDZFoTts6C5Ua20sXvnTLaU7hXQoN8C54qfvKkHPQB
	 IwmVmIZEDjLQsLeQHV4RXvkAIsoiDNuYly/FEAWUtApwBlzAeVtJ0ZkEsCFR6tMuRh/oZ
	 OVMCJ8mDmtr5iX53PfrWecEoG6ivhr8Q4IEgv0kYzRSi2MCnEs2bp4+OyqpiwSD8zYevm
	 sa0HDtSgDhHLENokAW2RJMajZgpqnFME8IwVYOfkRMduGS8gheews+0sQJIo0YtmRTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=k2lqRhYQ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15B5606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15B5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=k2lqRhYQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E87C74E40774;
	Thu,  5 Nov 2026 09:58:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B759D5FF85;
	Thu,  5 Nov 2026 09:58:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E876103291FD;
	Thu,  5 Nov 2026 10:57:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793872682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GGwd10+UV7oF3yQFv28KX3rG/BdRDcdmvcHFRYR63Gw=;
	b=k2lqRhYQYGiir1oyFjpLl2b0S8lmp9L62kTX7RsYNETHPu0Rf4mZM6EjLHqe+9kAMFNqnB
	6WwpR5/iAZtbP3Iovf/lp1cBufy0K9OHNw9MN9eXiITUKm4gViBsbT0t9skOrOZDZxitpR
	sVXEnTlOVz8qosxjU2hZ50UKMzarXH/kTT6ti23csYW4UMvperkeM00LHf9uI20HxbqB9n
	S1HFZh+MyP5cQvt9rThxXVONSrwYMBp6jh0wpG8s6QbK8vc6VhD+dWNOuvE/YcddORBEXK
	g2HGtqEKWoeQS9Vpoge20gnbb56aHVaYIDFm2OeZHGDV9/UG4TmSqac+9Z9SHg==
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
Date: Thu, 05 Nov 2026 10:57:56 +0100
Message-Id: <DMN6SIQLWFK7.2O38VBNNDP1RX@bootlin.com>
Cc: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maxime Ripard" <mripard@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "Raspberry Pi Kernel
 Maintenance" <kernel-list@raspberrypi.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 3/3] drm/vc4: dpi: inline vc4_dpi_init_bridge() into
 vc4_dpi_bind()
X-Mailer: aerc 0.22.0
References: <20261013-drm-fix-of_get_bridge-build-regression-v3-0-0b4c0b65be82@bootlin.com> <20261013-drm-fix-of_get_bridge-build-regression-v3-3-0b4c0b65be82@bootlin.com> <1202bdc6-afde-45e1-8a32-c64f9424a65d@igalia.com>
In-Reply-To: <1202bdc6-afde-45e1-8a32-c64f9424a65d@igalia.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Ma=C3=ADra,

On Sat Oct 24, 2026 at 3:03 PM CEST, Ma=C3=ADra Canal wrote:
> Hi Luca,
>
> If you go ahead with this patch, could you merge it with [1/3]
> Personally, I prefer to keep it as a separate function. vc4_dpi_bind()
> is already a big function, with several initializations. I have the
> impression that vc4_dpi_init_bridge() makes the error handling more
> clear.

I agree, and that's why this inlining was not in my initial work. It was
suggested by Paul, but since there are other opinions against it I'll just
drop this patch.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
