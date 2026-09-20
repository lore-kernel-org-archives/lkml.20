Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D453A875E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915091; cv=none; b=ag0Zb8xYY49trYsqx8y1g5hxK+5rYKCMAkfQvc0e3DVpSrcCkr7oraipECnRPSXSEftqf9dZ5RqY/Fea2+4bHRHbhcAdew2YLjQ07h/943tOfzE+Md4Y4PfUUG9SOqA8wK1jhsacMYjPln5DaZfm8FGMUJok96wPu9U//S68Ly4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915091; c=relaxed/simple;
	bh=JFhAMpKcqCT9uHzVU/MN32RuRVXPbT7jg55CNNemccY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QTtipBSqzSs5BZDCmrSy9zIytIs3hagrNVUOyp60kjv6Zer4fecVJh0sqSgtE2zZ4EBaw07fEJ3Vd2A+ceq2517hPN+PIs2ZFf2Iuve+lqHosIrfv54TTz7GLWKviXEa6BZotaU/5TKSYyiMBrkU1LWQLzOR2BUVhPPjRlGNXlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X5si8/Ro; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X5si8/Ro"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7DC1C1A0997;
	Sun, 20 Sep 2026 14:38:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CCDE6033F;
	Sun, 20 Sep 2026 14:38:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBB9210329078;
	Sun, 20 Sep 2026 16:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789915082; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JFhAMpKcqCT9uHzVU/MN32RuRVXPbT7jg55CNNemccY=;
	b=X5si8/RoJbehh1U3mj+MRrx07ioronomOBnutvN1smWVPL8VkcNSM8GnmgF9L8eMD8OT3F
	IqL68/FFiEzGqVthEZFFUCCHfODcEI+qBh2gN4/iphZ4U7Y5jRjQDBB7p7wpWu+CEXCVAG
	VkYhb6ENHqms+RzMaOInRIVVjyURw7uotXhp9g30fKBz4UQDHbzaQ87kkPUI80JUCL4BHs
	W5dMEA3q0UXUqX6jY2+1FnmyKg2IIn6U1YCG4tsRfSV9cQktXTqmHbSe2POT78rV86FGoU
	m01qfwHy5ZUS4f/hnduLwv18awRkiEU/pEIPbZnOzIYbJTtBAioFmXE//oBd8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Michael Walle" <mwalle@kernel.org>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Richard Weinberger"
 <richard@nod.at>,  sashiko-reviews@lists.linux.dev,  "Steam Lin"
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 17/25] mtd: spi-nor: winbond: Add support for
 W25Q33PW-Q/N
In-Reply-To: <20260920141210.B32B51F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sun, 20 Sep 2026 14:12:10
	+0000")
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
	<20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-17-ab9c9688d071@bootlin.com>
	<20260920141210.B32B51F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 16:37:55 +0200
Message-ID: <87zexc6la4.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 20/09/2026 at 14:12:10 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] spi-nor: winbond: commit message claims ECC support for
> W25Q33PW-Q/N but code excludes it

The commits are indeed inaccurate, I will fix them both and send a v3.

Miqu=C3=A8l
