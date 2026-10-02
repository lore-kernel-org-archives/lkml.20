Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590F73254A0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943705; cv=none; b=n6sfVty90se/IFTl40a+vjOaxtjBGY4xevWU9qnLOgFrqAYIkLZDUkac0VfyZQdcZ8TVjNyOYlIQnWDwL/x0ZUpIgvJEW5jpGuunggJpXJHk1HMdKD5JZaU9uL/1YruL5IhSr2HFAUfcTvtk2NOgYYLXncANpHd4T0I0AdJhcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943705; c=relaxed/simple;
	bh=Tpv6NiR8EjbK7Lgz6VBBQZAoGS1OqILUdrcTlWdYjd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KvC5Om7wBxlXNRSviOjbBdfYO7z+fv2KW+uyU4B2tHQI8u8f8UEAtuHrIjdRpNoeoUWHh5+fOez/Yir3ScVidIyYJdPSXWbpcy3Noc6zUjc8Sxml0dGlVTtv4UD+Nm4kaug92WVX2tJTLQAZG/SX9rY6PH8XC0lj4YLPrXl95Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fL2fj/g1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fL2fj/g1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 60AA64E4110E;
	Fri,  2 Oct 2026 12:21:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 343B4603DC;
	Fri,  2 Oct 2026 12:21:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E383103281EC;
	Fri,  2 Oct 2026 14:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vOHz17WNePLEEE9OMB3edY/QK4xTISPUZ92W5KwmCK0=;
	b=fL2fj/g1CyEa8LiaAYYCKkHqQZ2AhkLho0RfRr7ceXNAS70OR0s9yiVp9vrDa87/QujGMb
	nMb3sUeUoBv1gebsz5ihjmRB3jrHwuN32YQXf6+3U58MEGxS+ePHXcANtjdW1ZLMyzBs/c
	YSWoHITqO4pXubQdc3fuG2SdNWe79MUqZ38waFU5eED0KWoAm8HNeZB+MaVnuGKbYsVj8S
	O0G1kGq81ktsZp4Zq+h2B3LFWysSr+NryYEs66TAZavEp2DWRw2YBg2bMkpQ3/ttjtHXId
	09M/BVbI2D5sDmr/Iccy1dXqswAT68c+Nbpu2paGu0s5fJc72He4zK/RRjBaYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:18 +0200
Subject: [PATCH 05/15] mtd: spi-nor: Drop stale values
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-5-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

These apparently Micron-specific flash opcodes are used nowhere. They
are not exposed by a UAPI header either, so just drop them, they are
stale definitions.

I discovered them while working on Winbond VCR registers. For a
moment I thought VCR registers were wide spread (but, no).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spi-nor.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3e3c6b10186..1a2f15d8426a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -89,10 +89,6 @@
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 
-/* Used for Micron flashes only. */
-#define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-#define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
-
 /* Used for GigaDevices and Winbond flashes. */
 #define SPINOR_OP_ESECR		0x44	/* Erase Security registers */
 #define SPINOR_OP_PSECR		0x42	/* Program Security registers */

-- 
2.55.0

