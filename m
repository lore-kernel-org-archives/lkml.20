Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999107;
	b=1D4NOrysGc52/EL1cZE6K3m+ZLKlFmdeUMPRhvuzxSJQ84FgLKVXvN1e3uvmt8m31TS3
	 E/4jL90pCYSNSxn4P04KKwQ72QP1Ey6ILA+UtbY7KIvEfRT39929SJR92AQE30p+dTQQs
	 ofq6h94hA2C7k/CbLK+3f6u/utICwzKXbPCe/ma9aek+RxuWGXJ8qcl2lCxgaHCichUGm
	 qIAm3wZJGnjU3vce6ZsNprxbI3e8B53uNncoYOWStV8JBJrsuCPa2etnujig7lXVIcpzX
	 ZwaDLKAqCgz9fT1JIfeOmGRZnHudFBfJ8souu2s3vPubrOnmA00HudBp1FTo7VfQCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zEQFtyuBkdyKKBuW0Kh8GMzWm2rOcSjD9Nn36fEIIAs=;
	b=ZtB/RQWwK0Gr/ZwWC7GNOZurZ/Yqqmfe6Cx7MQ4PQRD9pPtW8lXrRgVpYj5uP0c2Mjak
	 oW5m5ep7rZAAxzIIFtAqF1RjO36LulJeC+RvEYiS29yRsLIkZj3ZtbKwxpSsDQLsCzArB
	 K+wwqG8qfxmYRFvoniSUoAHit7Bfr5b8uUurmeHaEk/tQj6PlyFzexp0ZGX/hP18b8AW1
	 6vmGFIhbuPN/+shgx1K0O7bp2Nfbvzmjz93bbYgBbrhAwk3TdHv3bINqxc4OMSohnPNla
	 sa4y+PNHoiAKxBdzB43CYI0K6OVrzw8Z+vqmMAUzrFDLhlYkOUhj16PSr9ZjIZ614RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=DfQ1D8jq;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F54D606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F54D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=DfQ1D8jq
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jLsBn5Srkz1XM0nt;
	Fri,  6 Nov 2026 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793999101; x=1796591102; bh=zEQFtyuBkdyKKBuW0Kh8GMzWm2rOcSjD9Nn
	36fEIIAs=; b=DfQ1D8jqexoyxiIZ07fqtjKqWkBrbl1UTvvzGlpspYlUyLcpex7
	dYkEkcwzcBQJDo9lsvY/Y2rl6+HU8vfqriX+GpT4wcIdjuF9s5XElKULJJ3DRupB
	T7Ty0J08oLMYtGhlkbOykWEELp8nMdbj8+oxHhgjGBgWHcA20gapSLmlj5cNZxeT
	UchkfRwjVcwAtgbaKSSC8UuiByWP+3mh4X5GNUIun9/mhtPeMwRYrOvbeLKhgatO
	foSkIJcQD9U8Ka5Z//Muy5U2BVgECSNIo1fuhGFrlgjgWNBsdzj67x6P2WiwxeBP
	mIC2dUg/KUc9O6/aV/ZAErxIF1h5rxRzxtQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 0IBcUNscV8yE; Fri,  6 Nov 2026 21:05:01 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jLsBj3P2Xz1XM0nn;
	Fri,  6 Nov 2026 21:05:01 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
Date: Fri,  6 Nov 2026 13:04:53 -0800
Message-ID: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In spi_nor_wait_till_ready_with_timeout(), cond_resched() is only
called after spi_nor_ready() returns 0. If the flash is already ready on
the first status check, the function returns before reaching
cond_resched(). This happens e.g. under QEMU, where SPI NOR page
programs and sector erases complete synchronously during the MMIO write,
combined with a controller driver that polls without sleeping.
Consequently, multi-sector erases in spi_nor_erase() and multi-page
writes in spi_nor_write() may iterate over thousands of sectors or pages
without ever yielding the CPU on kernels built without
CONFIG_PREEMPTION, e.g. ARM32 kernels with CONFIG_PREEMPT_VOLUNTARY=3Dy.
This triggers soft lockup and RCU stall reports.

Move cond_resched() to the start of the polling loop such that every
call reschedules if needed, even if the flash is ready on the first
check. Doing this in the shared wait helper instead of in the
spi_nor_erase() and spi_nor_write() loops covers all callers that wait
for a program or erase operation to complete.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 90524c58602e..3e3b727d262e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -653,6 +653,8 @@ static int spi_nor_wait_till_ready_with_timeout(struc=
t spi_nor *nor,
 	deadline =3D jiffies + timeout_jiffies;
=20
 	while (!timeout) {
+		cond_resched();
+
 		if (time_after_eq(jiffies, deadline))
 			timeout =3D 1;
=20
@@ -661,8 +663,6 @@ static int spi_nor_wait_till_ready_with_timeout(struc=
t spi_nor *nor,
 			return ret;
 		if (ret)
 			return 0;
-
-		cond_resched();
 	}
=20
 	dev_dbg(nor->dev, "flash operation timed out\n");
