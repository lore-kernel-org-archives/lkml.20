Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFEE385D6A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789009567; cv=none; b=DvO+H9BjD+TL2r6J+6JQ6soQjZgL30/0ukC0xl0EoFqkTJL5Vfik2SBWuCH7u3Yz5Ywn8PwI71tnP/qjS9KHdOYNJNHpQnnFOmgVZ1us4Kq/+5NT4LBlrOmAYJkO6pHGVSCvT+C++WNwEhsJWDhfTKVtHLMgkG4K+jviI6OLNPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789009567; c=relaxed/simple;
	bh=5GU69xFQlb5YQhnhsV/epfo4YZzwq4RCfzyAoMRLSBc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:To:
	 References:In-Reply-To; b=jPA9c3AxsmqQA8xvhZfFMbII9MH/twT+M2V2+8PumndLpmmSs83OKK0YETMLAiuvFb3VgW23dsiBk+PQjq7UVhWdf6ryXB8aNkfrXH8nGwVpESM9nbN8RAJvil2a0yGWSpeQl70FBWG2mAlWNElu7CE8XcXVTKYQ6jS1EjRpIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U5Ejrm5T; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U5Ejrm5T"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0610C1A1A8D;
	Thu, 10 Sep 2026 03:05:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C03416053C;
	Thu, 10 Sep 2026 03:05:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 535AA11C7918E;
	Thu, 10 Sep 2026 05:05:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789009554; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5GU69xFQlb5YQhnhsV/epfo4YZzwq4RCfzyAoMRLSBc=;
	b=U5Ejrm5Tg+Jg2eYmeq2sCTMRjV+8A1eP5wp+CcZwNml25WHc7SE/BCSOnHN5AA6jZpCl3m
	4xMELjgQFepubLMVRAZn8lyjJn8eBdWgCCtcQTv0dfMepayJvETymWkVI93V6sS0qC7zeU
	viWKmz+e7ox/vlbTAOQOhbPGY2q4/RapNnIkfE3dOyeRHXzjvfyRX496H0k1AJyytxCVqH
	XvTkCFggEK0Kf7x2R7V9XtAyyrabNfTt2wKXz9htzAs00DnW9FrsUHU4bKtF0+X5ZwN/DX
	jRdy4EJ2fEpwv5aqqBl+/ClAJtuq++/+DXzwr6xq46OxdtnUPOdzLUQczW5WDg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 05:05:49 +0200
Message-Id: <DLBAYH9MDSMY.NHHAKEJE7QRQ@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/omap: dsi: print errors with device prefix
To: "Andreas Kemnade" <andreas@kemnade.info>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <kees@kernel.org>, <luca.ceresoli@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260908172213.446608-1-andreas@kemnade.info>
In-Reply-To: <20260908172213.446608-1-andreas@kemnade.info>
X-Last-TLS-Session-Version: TLSv1.3

Hello Andreas,

On Tue Sep 8, 2026 at 7:22 PM CEST, Andreas Kemnade wrote:
> There are two dsi controllers on OMAP4/5. If both are in use, messages
> without device prefix have no indication which controller they are coming
> from. That makes debugging harder.
> Replace DSSERR/DBG macros with dev_-prefixed print functions where
> the device is reliably accessible.
> Also replace function names by %s ... __func__ constructs and remove
> some debug outputs to satisfy checkpatch.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Are you aiming at doing the same cleanup in other omapdrm files? Removing
DSSDBG/DSSERR etc entirely would be nice.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
