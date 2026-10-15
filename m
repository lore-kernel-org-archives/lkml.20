Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFBA3C3437
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066672; cv=none; b=VQaooNKdAbalf4j7np48kX32gFQAalNzt5x5aSwVgh6IyOeo/UXm+4n1PlSeQkYzm9N348HQmxLHJeMQSy3svxV+POscpeMUMg9jv5T+AlLEFqAYfaDu3p4CXBLpT06CB+Ql1HBAMRO8BB3tDGzVQPQGIflGBmBmyvDr7MCm8KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066672; c=relaxed/simple;
	bh=xp+OjL+ce1WUu9abuU4YEvmXTyokpnvydSzIBlW2ZNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu6pQ6NFyV1tQ4fPyn2qfldpiKyK6fcfTeA030jZI/D322eH6Zue9oR1dQVF2bDIkDQoqiRqzlIuIOT0pyWoLsxMa6mmHz6EXwnigDT5KYEUQ+xja4enJDJmOKmFIZIvN/GoBICSWv+5bL2JcPXpuaMdvYZXoXEtH34u7OG+UNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id C3414695;
	Thu, 15 Oct 2026 14:17:39 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 9C62160D366E; Thu, 15 Oct 2026 14:17:39 +0200 (CEST)
Date: Thu, 15 Oct 2026 14:17:39 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Konstantin Sinyuk <ksinyuk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Koby Elbaz <elbaz.koby@gmail.com>,
	Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update habanalabs maintainer contacts and
 status
Message-ID: <atDEY4wdfSqdhkH5@wunner.de>
References: <179187884916.468.5557909498363748284@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179187884916.468.5557909498363748284@kernel.org>

On Tue, Oct 13, 2026 at 11:07:29AM +0300, Konstantin Sinyuk wrote:
> Update the contact addresses for Konstantin Sinyuk and Koby Elbaz
> and add the corresponding mailmap entries.
> 
> Set the driver status to Maintained to reflect the current
> maintenance arrangement.
> 
> Signed-off-by: Konstantin Sinyuk <ksinyuk@kernel.org>
> Acked-by: Koby Elbaz <elbaz.koby@gmail.com>
> ---
> Lukas, following our discussion at LPC, here is the contact and
> maintenance-status update.

Applied to drm-misc-fixes, thanks.

Unfortunately I narrowly missed this morning's drm-misc-fixes pull,
so I'm afraid this will take another week until it gets forwarded.

> +++ b/MAINTAINERS
> @@ -11432,8 +11432,8 @@
>  HABANALABS PCI DRIVER
> -M:	Koby Elbaz <koby.elbaz@intel.com>
> -M:	Konstantin Sinyuk <konstantin.sinyuk@intel.com>
> +M:	Konstantin Sinyuk <ksinyuk@kernel.org>
> +M:	Koby Elbaz <elbaz.koby@gmail.com>
>  L:	dri-devel@lists.freedesktop.org
> -S:	Supported
> +S:	Maintained
>  C:	irc://irc.oftc.net/dri-devel
>  T:	git https://github.com/HabanaAI/drivers.accel.habanalabs.kernel.git
>  F:	Documentation/ABI/testing/debugfs-driver-habanalabs

I assume you both retain access to that git repo.  Please send another
update if/when a change to the repo's location becomes necessary.

Thanks,

Lukas
