Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505179;
	b=QQcB5EQL/dwrCgyvIMZtZrcZDp2rmUDMRhLSFqyvkvAje2MxXl5helz7iBqt5wjRS8XL
	 lLQveGF024/+pkXXGB/cRAT5LAfAJE8j5H0YdTi41O+F/aqlU9ynRXjHcZQi9DKoXYXfY
	 064it/n48YDjVy2jVnhBmwMqMv/0zvxCK2tFBdMLnQD9EyM2JKxQcyr10GWLXcrOwr9Tu
	 2/ssBqkjUfQBJF8/fftr3j0GBRGdqPp9sR3wz/BBEwKSfviVtdF5taIb9xioxg4y7ccHn
	 ++C2FEP1470PDXg6OFFuK9lqv3izN5ZaTjbnATZOmi2UVpGGX8xHbWsGaQ5wTCjxPtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505179;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=u2jZcK7Wj9UhBcZRbPziQwkmCc362+R71+IxAnGwCHE=;
	b=14Td0nOdCD1kKHrC9ku36vKN7mUEpVU0eZyaQPZ6jWHGdvJVArKAhYhko6ppqOoQuldI
	 GXMCqkaU7xvJOcNYuTZkddNgrt2o594+CNjE+mCQCP6U/fOb5fFDupNoRtRk+v959nouI
	 yEf6FIBbduk2Kjp5z05DmLhbpze6qoDpcLTqAy8IqKqguPymUCC8Vn5Cu6YAIfa5W5TSd
	 HKCBQ5aCPhDOIW+oUA71D8jNkuJWdj9zT/PLS+C8lHmUM0nU24eDcSa60rThqLc3bAf6/
	 MLTkL8vN44E2yMIaFa4u27mJTp6lnqUZmaCMlUyU2bPpWcPugw+pkoxf++HY27T+aGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OIp+F1cv;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5C3606E974
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE5C3606E974
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OIp+F1cv
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF157C79A9D;
	Thu, 12 Nov 2026 17:39:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8771D601AD;
	Thu, 12 Nov 2026 17:39:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68CF311BC0CAE;
	Thu, 12 Nov 2026 18:39:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794505171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u2jZcK7Wj9UhBcZRbPziQwkmCc362+R71+IxAnGwCHE=;
	b=OIp+F1cv2PtidDaPvQBP2de+3+8Q8B3yCZCdYxXMRGUSQUnS7ceMzjA/pEyjEQ792nA1Ur
	6mkEFUT/ixtfxD7fhpGaqrlrWGP5I4ZD7+Jd2LdCJCWvWWWXxbZxzaQ+3s6J/+aODJmMSW
	PTN5U2SmC+7OncJmY3OQflaqVByjZGUD2e8pi1HISH0YOTlbmDOWPfWLe/Q8vLxId5uLlW
	Znuo9bWwuKoQHjCEQ6oHYsL0hK+JWeVZlHRLXEBWextbGcwHYtfe4I40Dm+VnqHCj73180
	dxO3Z4exklU636ZwWLgLhOV5SEaBGU8eWD/IHlA5FLR7Rc5TpbrrGCSSuS+vmA==
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
Date: Thu, 12 Nov 2026 18:39:26 +0100
Message-Id: <DMTEZOO057WM.1VQK936FVSLQV@bootlin.com>
Subject: Re: [PATCH][next] drm/bridge: tc358767:  make read-only array
 ext_div static const
Cc: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Colin Ian King" <colin.i.king@gmail.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261112162127.1592210-1-colin.i.king@gmail.com>
In-Reply-To: <20261112162127.1592210-1-colin.i.king@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 12, 2026 at 5:21 PM CET, Colin Ian King wrote:
> Don't populate the read-only array ext_div on the stack
> at run time, instead make it static const
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
