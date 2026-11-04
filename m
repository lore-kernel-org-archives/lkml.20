Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815017;
	b=qi8A6rqteC//pjn997ZzGB8IPs0Men01cJK0y1fRNazJMuEBF8LYtbRr/+RQShSZFgry
	 vtB1pnCZFh+ic6dwGcyaAjsPB73Gj58X2/fkhfCLZy/3SDTsB4lf4+o+Ecg1g/MRAkShD
	 fTpx69aEcWhgK3aW6ANMKNQL67dHZkxKJ6HahBufTs6SYm11pOuFn95/xaZTM4vTDGyAg
	 HNalB2fAXV4TjXpxwGOqNhBQOysv3yrZHP6BhAWfd8/L5O7PWmBQW6m/e2vjmQsyJpwFO
	 b1kba1NPjvn4JaJUvNhSUjt76k4SPR3QRQr5RqmtoQLkn6vuxEsbZO7NMRtajzZPB8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815017;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=pomOHAapQUnvxNXGyGq+ejBOj6+SbEhIie1BBI6hGCU=;
	b=g5bxybq3mxSKKkmtMGvfjEB9WWJBWGKnDvHCZuWxue3sCkBjEkHuHob9YBMf2QdNFQ8c
	 9oupzRNrjm0ZY5RlGxtNyayPY6NT3QBYzxFBgpO9XS4c60VWzcZL9fbww4StQ53Rjk2pa
	 HZoYS+zyXxrZNxTE9imXKJhEY8iv7ca5PJg22NF8lBozFPuaFYXhEwnexmaYb8UT4JM2w
	 xZglF5/QXxAQm6KUDmxGqJOaCdQdVQTy+4fnyDI1lvalPrugXLL02CVrNzyunI92Bjjgp
	 X17E9A0EaxNLQg4J2KySfTADU8rpuEue4sNHuvt4QJx5N6Y17IxDh/aMMM6P0ZaeZtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wbGQOm3k;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD547607A3C1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD547607A3C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wbGQOm3k
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C1C14E41403;
	Wed,  4 Nov 2026 17:56:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3F2460770;
	Wed,  4 Nov 2026 17:56:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA09A10329205;
	Wed,  4 Nov 2026 18:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793815008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pomOHAapQUnvxNXGyGq+ejBOj6+SbEhIie1BBI6hGCU=;
	b=wbGQOm3kU4XlqaXfMkG1e3oCPliNudbNeC7c8QJJrIVQE3yNuu4nf7/aKsBgokmzUv5Z6a
	t4Hhl5QJdio4PV9FwUAk1dQhLisRTb6M42a1/DXvIDqSoegKlYK+HxO8FlIAnZV+LkNVn+
	G+TJxn7X3hF3B6DpnE6Cmcxhd5oAq6n5SDLxB/2Ys+PrvcCXvFpAXDZIwsuymr93HmSgb4
	7roIicJBWVoE5Mpc/poKxuuJ7+o9BfIr3iru2jXcYrY/41WRTW8/FZe1rqLi2kxhSbl1NU
	qjXos/5K6rnlme+Fnf63NZh/TZJ9qLsCpc/mh3yfHi65MJdhTlmqyTqaUun+Kw==
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
Date: Wed, 04 Nov 2026 18:56:41 +0100
Message-Id: <DMMMCJHUT8EL.1L6VS1X1K2BQE@bootlin.com>
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Remove panel naming and use scoped
 device_node cleanup
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261030163254.3175671-1-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20261030163254.3175671-1-laurentiu.palcu@oss.nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Oct 30, 2026 at 5:32 PM CET, Laurentiu Palcu wrote:
> The remote endpoint node is not necessarily a panel, so drop the "panel"
> naming and refer to the next bridge instead. Update the error message
> printed when no output port is connected.
>
> While at it, convert the device_node handling in fsl_ldb_probe() to use
> the __free(device_node) cleanup helper. Since remote1 and remote2 now
> stay valid until the function returns, pass the selected one directly to
> of_drm_find_and_get_bridge() and drop the extra panel_node reference.
> Do the same for the dual-link port1/port2 lookups.
>
> No functional change intended, other than the updated error message.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

I wanted to test this patch but it does not apply on current
drm-misc-next. Can you rebase and resend it?

BTW the content looks good, so if you only do trivial changes in v2 you can=
 add:

+Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
