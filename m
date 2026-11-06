Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984759;
	b=g3IYFU+ogwQzsT0DC3cNGAcGL+wksWdZbKn0a+zj5O8sBN8dO5383BGlCJou55z9p6Ih
	 VFyCI4dCP/2INtyZfa4nLkVubL1McrVqsK/+KCxY/MOTBouVfG9MeEJvqbi9FeOs4cii4
	 3vrw7Dsl+Ka4oOATACZdHVNR4H105ozL0f4McoVdIVYcmeKWU+kN0bXOhKG7zw90yukge
	 qlYgQA0nGgZqdQ4T1F2xjY+KAKc79uZ0dUPd/jhTCW1Hf3NCKu2/6KyYQ+/DLxWX8ii0e
	 ZLhK6pNyl24q18aIrrxBnDSKH1oEYIEeflAtv3SmadtaOhLoVyZQY9Pm1Ni7Y3bWuMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984759;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=/PEI2oIc4mMwtb7zmvNQaJQdzbux11a3bM6llbnSv/Q=;
	b=QLezmnrU9t9OiDCHd/0uKiBxJjsgNN5EqS5u3RZmeBnZ9F5C3pPf59IwR6zhY+SCXLZy
	 02EujyLossDiR95Rmw7wikrgqp+7D9IzyPHLcE5U/F7cPZwTD9oqaQT+k8sNDRBzFCMpL
	 duKiVKgoE1QmqImqwxvbbWM5UK/d/2NWE3dSV7X3/hN0DCnPVWk6aebPQLC/eYiTt828q
	 GMtWcyHoEhmOCFZeCgabtdktABiO8cUfJia7jGR2j6QXW5Nlj+faGYLNAJs2HkSxUgi8Q
	 ImoUSOaq+q/vrP2lyvO4ygJGcCWWudrgAna9AG1fGkYmSN71P6umKatv4zb9varxOyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jreWHA1+;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93865606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93865606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jreWHA1+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0299C1A1426;
	Fri,  6 Nov 2026 17:05:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE1A05FFBC;
	Fri,  6 Nov 2026 17:05:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29147103291BA;
	Fri,  6 Nov 2026 18:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793984750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/PEI2oIc4mMwtb7zmvNQaJQdzbux11a3bM6llbnSv/Q=;
	b=jreWHA1+3fmEtiYod9TgBtP1CemHbyDLgWzjWCyz8cBoHblECxeVS3IQXUv5+oSLWPNqWE
	z5IUkFsbwjXA9h6+L2Ux7xBBB9AYPw4kIEFiyvu866BxfA+xisOZ6WbK845XmowyScxn+g
	bnr7kOvOg3m6PXgUpIxUbPGWjxIHapIwnhHlbESHq0bHUU1icQzIMhHv/V5p/CW3Xa5jX6
	jswLVrLhpGDZxShjiqF7FCM3PWpj09bvQ26RE3E8HTw6K0JOpgGMVErDkqKjL0/APZa0/N
	Wm4r+dtjEeZgLesoHEkgfj/ux4imxRR7CJJkntvJGBagXhA19HooKj4Rbb3+gQ==
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
Date: Fri, 06 Nov 2026 18:05:43 +0100
Message-Id: <DMOAILVQDY3B.14KEVXYVAW0HV@bootlin.com>
Subject: Re: [PATCH v2 1/1] drm/bridge: tc358767: register DP aux bus even
 in DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>, "Andrzej Hajda"
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
References: <20260929130701.1029644-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20260929130701.1029644-1-alexander.stein@ew.tq-group.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Sep 29, 2026 at 3:07 PM CEST, Alexander Stein wrote:
> Even if DRM_BRIDGE_ATTACH_NO_CONNECTOR is set the DP aux bus has to be
> registered. Move the flags check after registration.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
