Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28074503BDD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543497; cv=none; b=r3NcoACsEPQUvLsU/JH8IqKlrjZ7l7wW6wQfe4V3AEABmnk23Szz02q3bet/rNAa9kgxzpV+8xiOLweZ+QqnRGmcMm/71afMttTD/T94wMN9cRt36mtnWf8/irXkICmbCHhn6lY/EOrY+rhuHvGWfNxcLQCVdGEWQM1b9E4iA5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543497; c=relaxed/simple;
	bh=f/z1LnWkI2Tm5z1158GeqvMG5agOGyNjR3dMDSbWBgc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MhYt7jPdPKwyD84YUs2utjEWt2zUQ7Rd1F9mHd0WjryXHK/CITQnt6oLfjcvtN7GoSjVm/ezl8SYLDMp00Yvn233Ylja4mVXIl17eql6H6ss6f+Xsmx9gxG7J4zDp7bhADjSqhQuVaQyqKx0n3G539hqnuDYcFCyzmwsKo7ZN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UNBT5PBE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UNBT5PBE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 96F6D4E41519;
	Fri,  4 Sep 2026 17:38:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AFD66057F;
	Fri,  4 Sep 2026 17:38:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF24711C78767;
	Fri,  4 Sep 2026 19:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CDyJM3GgcirGUlvc2OehHFFuIjQ3S1Q0Gvy7Y0TkA+Y=;
	b=UNBT5PBEvWETxL6CwcZIRR0jB4GTM8CcK1TOkeuLan0DYVE5dKYAZ0tdzAtMh6wSZzovPT
	VQQteFeyxONphELBCu2Xr5C1Z0Ws2/EAQRogp008niyV5UeL/gMY2DD99AmnXrzcScjEf3
	9HeE3I81Xxd0Ynec+JbD+fuiIR7sMfAsiaOIPKEesoTmnBJsHCGrISFRsuLz6GINAKaioq
	QyXYu4f1mMUHNcYG5E3JOlZhenjOH9t5EOZoaRwg8Gk3AOhi5Nd+/gFCX0gGYAyg28n7DN
	7nBY6Ut5nn/9IGBMJgvm+KXMWt5GyOxIM3Kp5tUh2r6TcOndXt+UflOnjdhmZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 David Laight <david.laight.linux@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260824014703.56502-1-kmehltretter@gmail.com>
References: <20260824014703.56502-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: shrink do_write_buffer() stack
 frame
Message-Id: <178854348831.1467647.15564851148664734231.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 24 Aug 2026 03:47:03 +0200, Karl Mehltretter wrote:
> arm32 allmodconfig fails to build with gcc:
> 
>   drivers/mtd/chips/cfi_cmdset_0001.c:1883:1: error: the frame size of 1296
>   bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> With MTD_MAP_BANK_WIDTH_32 a map_word is 32 bytes, and with KASAN_STACK
> every temporary gets its own redzoned slot.  do_write_buffer() builds a
> map_word for each of the twelve commands it issues, and those temporaries
> dominate its frame.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: cfi_cmdset_0001: shrink do_write_buffer() stack frame
      commit: 39b975ff208610301bc400460ec245caeffa4ee0

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

