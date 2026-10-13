Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616B1246774
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909281; cv=none; b=TI35utUOJoB53+2s5z7QDYNky4Q5Ph3k6pOFzmgO42m1ZH72A0cg7wZVxOzkozEsZNYVCJ0tz5xAYO28GPf/wX//38SRpgphAtRROQHcazNkXLuVtcQYXoHfgl92hoJ5PqREQW5LvYjbv9C3dxBAeS67/927v4dzsu2a+/JPDYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909281; c=relaxed/simple;
	bh=0uG/QAY00mH5RLxPwgYJVKaylNg99Wwq5xwv5ymXOcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqN+KJf5utNuPQ0UbtqTbpRScC8sdvLxuKpEvji4Uxc3CSAeTPRlZhKsg1iuuFpb75Eqy/3GW5p5YLKzN9Y0mViH0eMpeVsj6D8GqG1ul7+iwlFD5iH7XBOMNvBouFoX9tdC1BQ2rbEoRvjag1+Bjo8/1ybyCv7exZ8H3IAa2pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WuyHtFaT; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WuyHtFaT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27888C653F7;
	Tue, 13 Oct 2026 16:35:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CFA060362;
	Tue, 13 Oct 2026 16:34:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F8C311D717B4;
	Tue, 13 Oct 2026 18:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j/cXexyZ7T30AM1csq7xc9wIhMFboTJ8migmpErDMkQ=;
	b=WuyHtFaTySo2iv/SBA20f+Gtj11qdNir8FeHbWfBtcbrnNt17uBbzXJBOU+HCVK5PPkYxT
	nrzBQaT/d9N/Otm3iiiPCRA/DAH3Jx+HvNXZwm+K3vfetl8LA+ESiS/kgAtsuMYtZ1bc0V
	TmQS83IT00p+LksJWzNzofPxA0WxpAWeN5T1z1zkxG8d0ZtKQcUV3Fe7GIvPYaXAlw/obG
	upGx/wzQL2cVluImdIQ7ElyGMOvp43fRmuPy+x30wMW8Ne1p7gBmq+zsoqlYgKNNo+qroH
	VsViiDS0n34iMazGKgmYZaW6Mv4Bjnm0KJKqzS0nEc1D2UWbaXI1k/bTBaigUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:52 +0200
Subject: [PATCH v3 02/17] mtd: spi-nor: swp: Fix SR2 initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-2-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The purpose of the original change was to make sure the SR2 buffer was
returned initialized. One of the goals being to be able to compare
it. While iterating over the implementation of this function, I believe
the return -EINVAL that was initially there has been turned into a
return 0, which does not completely make sense since we already return 0
just below.

Just make sure SR2 is correctly initialized when returning from this
helper.

Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 7e667e4ca84d..6c56fda3913e 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -223,7 +223,7 @@ static int spi_nor_read_sr2_careful(struct spi_nor *nor, u8 *sr2)
 		 */
 		*sr2 = params->qe_mask[1];
 	} else {
-		return 0;
+		*sr2 = 0;
 	}
 
 	return 0;

-- 
2.55.0

