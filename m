Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3294915B4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983224; cv=none; b=XsUn1WC2/ScSOCSJHms4Gqs578rynWX9RZirj4uP6NwB9egufekKH1Cc0IpMsCzDU1ZWBPO6Zqp+pvrzKGrVYBqqwLz/8RqQ8CrA3vPjZrjocgdGHjcyOsrt1/RMkkmH1wZBArmue5FALj59jFaUm4pGRdIdG1LziEynbpc7tXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983224; c=relaxed/simple;
	bh=fc2cITGdbFdsifue250a6pMT8QVpXle+kYTZx409J0o=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NXB4tkUE9MOgn8psXyh+g/M4eu5dkTGFz5Wl5G7lFfdkDrOrEAfpOpnPfDKcH0fEic/iA3OpiD3yOOCwpMkQqMbA+JeCOWii8nPmkafFI3kcwhjhTL4FK9k0A1YpM1wwb6mszMT1rEacFXPXxPOr006BZ0Dl1EJyC8TqbVGYgVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hrLhf1Ru; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hrLhf1Ru"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F13974E40EF3;
	Mon, 21 Sep 2026 09:33:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC4F760339;
	Mon, 21 Sep 2026 09:33:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC4DA1032918A;
	Mon, 21 Sep 2026 11:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789983214; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XM4HQGrBz4+OFGrobuvy0488Z0TdUTFMNFt2LRu3OzE=;
	b=hrLhf1Ru73t9aY8LochvALjZfDluturyQZxYk4k9vHEIPBORNadNTLun13Ur1AXjMSWiCc
	s+WxQh8VBnuTNaum264n9T4ux6ASk60kXbWq+LbpY2vsPX+6zoQ+DB0O+yezTycrc3lJOa
	IZ4MM5kQsy1wFsn/7rr2Cn/Ur9FlLqhhwRLcxQmwnti740tVOpUkMxnD9uyla1v4CegBqs
	wBAXn8rGJmBk5BCKc7dH75gY+zrxeVLwcDnWDpnDsf6tIUBbcLahr3OJ5Lsduex0yqHkjI
	+JbXkXXtukWs0wTTWzz4AYYrGOdL6P0grTSyidzBqkd1HcC4aL/idgVrPcQKQw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 kees@kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20260908172213.446608-1-andreas@kemnade.info>
References: <20260908172213.446608-1-andreas@kemnade.info>
Subject: Re: [PATCH] drm/omap: dsi: print errors with device prefix
Message-Id: <178998320945.177649.15427813145319109633.b4-ty@b4>
Date: Mon, 21 Sep 2026 11:33:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Tue, 08 Sep 2026 19:22:13 +0200, Andreas Kemnade wrote:
> There are two dsi controllers on OMAP4/5. If both are in use, messages
> without device prefix have no indication which controller they are coming
> from. That makes debugging harder.
> Replace DSSERR/DBG macros with dev_-prefixed print functions where
> the device is reliably accessible.
> Also replace function names by %s ... __func__ constructs and remove
> some debug outputs to satisfy checkpatch.
> 
> [...]

Applied, thanks!

[1/1] drm/omap: dsi: print errors with device prefix
      commit: af8296450df7678c94ae03054887639e3d4d35de

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


