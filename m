Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925398;
	b=37mXjfaccR+nLaNFh3fjypfsua5UtJIj5VA5UTWDUtmpRV246ZARdgpEFhRrMdkabqsN
	 zcJpZlj0TuxNkyS6YhD00A6p/DW1P2DWp6izIMvyqmUMEMTvfZw4LjpIhBml7dJlpMGbC
	 j4spnsUvcwQRI/ZnyQ4vb2XipxL/JfiHN0qPcx3AkU/Xg1QN/USSFY9h0gHNqQ/14/9Yo
	 SSg3GzK0g2MVI1ygC9K0DWB6Kd+xbgnkVMMJsc2BhEPYJjVeKWVsrVx9VRxHCw6iM4pfn
	 0cMdmcKXVT+gBuoTUNdZDBGzZANsqn752k8sbFQwkGuuXg3xBeq+ISMIRc4MrhfIWzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925398;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=LuOwRO1LqZUb1EtFSIvMS114v6L0kisi/Eq+ywdpFfU=;
	b=L2QpyDrcf+2Pm5R+O1qY0uHoTMYufwb1AVlyIvleuaNlQQHA1ji7oG+jjokeIIymPLPj
	 g5CjglMjYp9mOzmHztQRcGlsp/9SRvQnnU0GDJ37759jXH32ROSMIA0BFiiNu3yZEN5Gh
	 U5FPyImatt4+WQL/L0d5FEe910MfO8ViEl/EycaMkvvS8FTWU21XDDzO3EMCD5eI7F2Ui
	 HeqhM67cxscg3MHo7/oP+fYdzp/kmqo70o1rMWoKcZmqJ1UHOdZ+7xKg9I4cAGpMuujSD
	 fK/SuUVdh5TzFHkagFMx0Taes9nbTK3LBBTRBX4I70JZeiOcak76WCi+lY0sxGX5r0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SvBi++mX;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07658606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07658606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SvBi++mX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E95EC4EDBD;
	Tue, 17 Nov 2026 14:23:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A2D15FD6A;
	Tue, 17 Nov 2026 14:23:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F57E11BC0039;
	Tue, 17 Nov 2026 15:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LuOwRO1LqZUb1EtFSIvMS114v6L0kisi/Eq+ywdpFfU=;
	b=SvBi++mX0W+qtXvY00DztPlEGaA6qFGdlfT2lGA0PnWg9kkqX8ApU50+AngF46u0GIwec5
	9lfxc5t06SPgfw7HdVZZp4wICPy4/Pu4tCs4M2p8D+qVJAHV7jsJou057H9QINRMh5+wE6
	j1x1vHgk9Gn+nRX+h2HHVfdJwkmkAT3mj6Rl/ZB0s3/RWNBDpQoF4U+yPUMXgmZKAuH5h6
	p4iCVc/jsagc0JxvE89FZySXVmvuxkW4Nqls4gZ7cPQ9x5+VvR7kUw9zbWJgMSP0jiqYXd
	7XH4uiLccjiO+nmmsHFrEpdnWgQreUij+xPntKjDydVMSXb1hQNCkjpAwFGaRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tal Zussman <tz2294@columbia.edu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
References: <20261016-nandsim-nofs-v2-0-f705c8819d11@columbia.edu>
Subject: Re: [PATCH v2 0/2] mtd: rawnand: nandsim: stop pre-populating the
 cache file's page cache
Message-Id: <179492539419.2259780.11974509644960716429.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:14 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 16 Oct 2026 14:31:18 -0400, Tal Zussman wrote:
> nandsim runs its cache file I/O under PF_MEMALLOC and pre-populates the
> page cache before each access, both to keep reclaim from coming back
> into the MTD during kernel_read() and kernel_write(). Use
> memalloc_noio_save() for that instead and remove the pre-population. The
> pre-population is the driver's only struct page usage and one of the
> last users of find_get_page() and find_or_create_page().
> 
> [...]

Applied to nand/next, thanks!

[1/2] mtd: rawnand: nandsim: use a NOIO scope for cache file I/O
      commit: 385a54bf78fa5ac8d6bb02864afa4097238ea208
[2/2] mtd: rawnand: nandsim: stop pre-populating the cache file's page cache
      commit: f4c7bdafff51b5e0d6aa7e3525d05b8305d4696b

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

