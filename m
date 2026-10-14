Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24E233556B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969799; cv=none; b=OJP6R4bpXoJGNLJnWcqLBa+1FezvZRC7jNWQM0lHiT7519lhP6QLEKbAZ7utmsR9yptsPV+3s15bC8c7oyyyQJZ5AODId6mW6EoKqOCf+bkcjXfFZEzEPFbmNH7zx3yrBvztCGCL0Msu3IZc6GecYMOXlhtftYrbiyrL2g/ai9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969799; c=relaxed/simple;
	bh=PJo/30EMwUOBpVKCcQN/QLtqzn1mD7FXBRIoJHgrYK4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MD041op8SIDhj77OmYDKmnpEncpPUq5YJDxen4Nry3Im/ZSbM4ynkv0EXNFfIZLT4m9dHEiM0wso1/KQ66eZOiCw/WfVGHiqN6iZrCBW1QZzDXFphSI9Y/igKf8tw5AYs9zrNDM8DNv6QksE386O/hAfIHzgh5+7DBGWhcVXje8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qlOlzr0H; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qlOlzr0H"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E2604E411E8;
	Wed, 14 Oct 2026 09:23:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD90360368;
	Wed, 14 Oct 2026 09:23:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E694610328A40;
	Wed, 14 Oct 2026 11:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791969795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PJo/30EMwUOBpVKCcQN/QLtqzn1mD7FXBRIoJHgrYK4=;
	b=qlOlzr0Hnljz8yjOgBjceryUsyXl3Gh0Z6EeQ0ORJaJj0bXQEe2Yqrp9w7XqxbrtFvxCOG
	babnMjVN4omvmbk35kN/7BNIr1YZwt5VzqGjXOF4HlVlMZ/Pr9Vv2W8vNJ7EmSM4q4lNt3
	ikXxNNm22HhGK3hJIKj6yNFh/ooknQoo3n+fs+EPkF6hPFOccdBl14lNW41ZB43f1UbIwn
	ee+uAoBaG4fBUWDmRc4uLwemCG3UrKKT401+crTwRuNsSRYuKunAHQ+1XbOwHtki40pk5R
	O7vr4iUaXwu8wCQk9ew2kXyXfL3TLOR7H80D47I1WdP9VEnSNknBx8L4uQzz2g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Kees Cook <kees@kernel.org>,  Manuel Lauss
 <manuel.lauss@googlemail.com>,  Artem Bityutskiy <dedekind1@gmail.com>,
  linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] MTD: nand: Fix release_mem_region() size
In-Reply-To: <20261014082258.33315-2-fourier.thomas@gmail.com> (Thomas
	Fourier's message of "Wed, 14 Oct 2026 10:22:51 +0200")
References: <20261014082258.33315-2-fourier.thomas@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 11:23:13 +0200
Message-ID: <87jynky6ta.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Thomas,

> In au1550nd_probe(), request_mem_region() is called with size
> resource_size(r), and release_mem_region() is called in the error path
> with the same size. Howeve, in the cleanup function au1550nd_remove()
> calls release_mem_region() with size 0x1000.
>
> Change release size to match request.
>
> Fixes: b67a1a02d463 ("MTD: nand: make au1550nd.c a platform_driver")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---

This driver is very old. If you care about cleaning it up, I would
suggest doing something bigger. For instance platform_get_resource,
request_mem_region and ioremap are now a single helper named
devm_platform_ioremap_resource(). The kzalloc could also become device
managed. This will further reduce the size of the error path and the
removal.

The subject prefix btw should be updated to match today's standards (see
git log --oneline -- drivers/mtd/nand/raw/).

Do you own the hardware?

Thanks,
Miqu=C3=A8l
