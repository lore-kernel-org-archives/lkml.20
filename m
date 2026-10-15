Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C82857F0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058710; cv=none; b=Pa18+oJCC6FzWtOLzYDcTfZ62Gb7btku3gO2OnOSdR2s/mfhJn1I5WCJhmUfyxNrKnNxf5mOJnEFfzq3cwQqFL92cKDailBc8ExJScS98/0XmvWhyFVjn9NACyrieguQqVir+osGrfDSKGxG9Uic56eJT1SzpQl3sbLl1XWku1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058710; c=relaxed/simple;
	bh=N+bPWR+4JT0wOolmGTQ5lWK1vSjEtataR78WtgevHkQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OLWNWmilf4ExJDmOlRWPs1paLfkWBTY08tJ4XCHNpvc1+zhH87ruh5AEaNFV/UGYNIEEMTkkJYXIGHdPpK0bhN4J2kVgD402yyy4Hj1E1GhtTSTt0N+rK2p6FtnEIexzSHYnPNttVqWjwxjKSbwOJkY9i0uzd90oGSbSCXAZOOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bdYhib9n; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bdYhib9n"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A46441A1236
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:05:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71B8760360;
	Thu, 15 Oct 2026 10:05:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2934210328BCF;
	Thu, 15 Oct 2026 12:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792058701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=N+bPWR+4JT0wOolmGTQ5lWK1vSjEtataR78WtgevHkQ=;
	b=bdYhib9nAgYakXGAbzFG3N4OE4pGn1h6KWLSZUU9zwP0QYzE8jxmMFQgeSIV2PnpdVuckp
	iSeeGlj37C+Y+XPioT5QR53AWnVmSqSBuJ1U9bT1ZwezeCMeDO+/q21wmcnbQ+6PZRzxy2
	S7e6K85LwDQaxD8yo97/97NgGGnOEgJAvF6q6EIReatWmRIAw1uhg2EIErkXUcePSGSnfl
	cEv6UqDa2L/yA0KiZ72Hks26WZ+j7O5NaE9GTPgB/4JTS8nxtlYAQ1aHpIyYcXQsrj+EIw
	TE2oS8+SG5h6kw8e5enaTWkcly28hSDpcbpDrCpBe6UkMijcNRdD5DxFA7qAtw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Arnd Bergmann <arnd@arndb.de>,
  David Laight <david.laight.linux@gmail.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: sfdp: reduce stack usage in
 spi_nor_parse_sfdp()
In-Reply-To: <20261015090516.924703-1-mwalle@kernel.org> (Michael Walle's
	message of "Thu, 15 Oct 2026 11:01:28 +0200")
References: <20261015090516.924703-1-mwalle@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 12:04:57 +0200
Message-ID: <875wz3wa7q.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 15/10/2026 at 11:01:28 +02, Michael Walle <mwalle@kernel.org> wrote:

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

Sashiko is correct about the need for not mixing __free and goto's. With
this fixed,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
