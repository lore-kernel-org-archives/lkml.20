Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB874A498E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969140; cv=none; b=oBy09wGmMEi/4AlKL8FkmCgwp5JFMwMQf7e6jKmp91b5T0Q9rO+4wF8gveAFXXLJSPpWtnEX6YPGqzTSXnidkuj2z4AgUv9ah/pPaJM1luRkFAlS8/F2YM2C73+BNAFEQcLVlWiVhRaPO+Flz4Z2kMuPZFa2HoDC6UM3bO/554E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969140; c=relaxed/simple;
	bh=lRP4bJl5SdVNOJG+y1WwkVlB28FaMO41Z/f5pWVsxLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c9z0E5K1fM5Yj3KQYEVne70PQxQpULQVnx8UWg9rn0KUohakpeeHZpN7NFw/WIJ3xQScaU8daCFddjvj7P7jpJHuuihT/FJaidgOkJBgxgWfkw7A15rFfEBpVmNA7MQbF2kzUwUkT/FfWcHcJzhJVUKa3bWcamH21VKwrd/avDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E79CjDLi; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E79CjDLi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C4BBA4E4120C;
	Wed, 14 Oct 2026 09:12:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9906560368;
	Wed, 14 Oct 2026 09:12:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95C041032898A;
	Wed, 14 Oct 2026 11:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791969134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lRP4bJl5SdVNOJG+y1WwkVlB28FaMO41Z/f5pWVsxLM=;
	b=E79CjDLifyM+hr0VPaPwWud3S3QF+ZaBXPZha/6kMq+3dU2x6jTvJWDPM+hKYK7d+2f6lP
	MsZHFh3ofjvAvKLVyTn1IRLygxgpskwSzD8IHFyPq4te/UJkRmjYze6d9ks+jU8W9j4N0s
	l8o046kHUf2i0kDliC44D81GUez9tGv5uGimbmVPHl+RwqQSPNWVGmEtgFXtD4NJaeV5vB
	QCn9ZU23hLlRfY+zgOqJVxb/Kk0lt20Fpai9yxzgDSUOckEL4v6JGDuOQoIlqBiF3KRBCk
	m67Hz6G2Sp0GcNEPjYuhbfwk58PAkj2bimGpXfz6PowOlZ+DVjKQ1ynTrZ/EQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/17] mtd: spi-nor: winbond: Add support for the
 W35TxxNW family
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
	(Miquel Raynal's message of "Tue, 13 Oct 2026 18:33:50 +0200")
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 11:12:11 +0200
Message-ID: <87y0c0y7bo.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Michael,

> First patches are misc fixes.
>
> Then there are core enhancements to support ODTR chips.
>
> Last set of patches is Winbond specific, where I add the bulk of the
> changes for supporting the new Winbond Octal-DTR SPI NOR chips in the
> winbond manufacturer driver, and then sparkle the ID table with the new
> IDs and their respective testing logs.

Just to let you know that I considered the reviews from Sashiko on
this version, but I discarded them both. I'll let you do your own review
-no hurry-, let me know if you disagree or require more details.

Cheers,
Miqu=C3=A8l
