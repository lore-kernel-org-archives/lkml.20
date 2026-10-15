Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B974C1510
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064935; cv=none; b=H8NIeA/gyyurIcLqR8wPfWwDGxdhXURjtrmUvUybLbQiXiLk50V8jyiwM9dgg8o/29mO0BRKf8LOHUefcLLlwKcxzmnJV26xuLuqwUmX76L7hio2r12w2fZ60aRAjM5tiKJSDLb2tXZs9ai3Frk7ldhkV72AE0S3h+X/rCHtTK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064935; c=relaxed/simple;
	bh=qujcZQYVUUXNKswNN+DfV4riqBKD5kX360EA1+xz4LU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TILJuups7pb2H8PhcPuAm85HG1p9C142PDklenVioOHt/clHKU5UCaDrEcoFIDvBCPKrlfLJtr4uWgJXmkmiKww0TfqJvKEd6SntafdC7xyvso39ZSbP2ML8gdqs8ge0Gm7YGu33mKdXNu364xQQ1DdrtlAR7FHHrBcGJZ4Heys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k0XwEo0r; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k0XwEo0r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D262CC63455;
	Thu, 15 Oct 2026 11:49:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6320F60360;
	Thu, 15 Oct 2026 11:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0176010328140;
	Thu, 15 Oct 2026 13:48:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792064925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=smGVRYkYdnmDVo/2i+sOKFmQ+byIW1pUk9kwI9T/rNQ=;
	b=k0XwEo0rKEQVFkouD9BBa1Ld3P6phThadWYWsf37KLa7pe3s0ZuSmb+IDyF8hwn88V2kts
	snsywukWi//JOG791J2T2qWzHT2RAk2BspZntBtqo/Dg5erx43l7zCcHoeI75JcCvJb9el
	DOm0b5UdtEEUXNIgnsLfc02RjY/1eQeNm8YQNX2c1q59HH+CJomqNqlYLgzdFNmmWhCYA9
	ZfiCN1eSy+QKIMeaWQB6YrhRIfCU+dXoi+Sk642By6dJTt8M5fjVnwR1qNlhnj3dW+mY1h
	T98rL1f3hcJ4mWAHlL4qWIqf0q31Yn9Tk4rJRgVHfQewDjn4USsJCPd/KdIczA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Arnd Bergmann <arnd@arndb.de>,
  David Laight <david.laight.linux@gmail.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: sfdp: reduce stack usage in
 spi_nor_parse_sfdp()
In-Reply-To: <20261015113209.975641-1-mwalle@kernel.org> (Michael Walle's
	message of "Thu, 15 Oct 2026 13:31:52 +0200")
References: <20261015113209.975641-1-mwalle@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 13:48:42 +0200
Message-ID: <87tsmnuqud.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 15/10/2026 at 13:31:52 +02, Michael Walle <mwalle@kernel.org> wrote:

> Two large spi_nor_flash_parameter structures on a function stack
> are really too much, and this can exceed an otherwise reasonable
> frame limit:
>
> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
>
> Allocate both rollback copies on the heap and use structure copies
> for type safety.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into the sfdp module")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> v2:
>  - don't use the cleanup helpers to not mix them with gotos as
>    suggested by Miquel. I didn't carry your Rb over because there
>    is quite a bit more code change.

Would have been fine.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
