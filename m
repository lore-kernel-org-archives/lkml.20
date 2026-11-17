Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908292;
	b=WE35Z11taymSEWgK5WOZsLIOnNdD44OBWVJ334Edv0FQaFhl30Cct4cZfph/InD6Kctb
	 0vjoJYHC6AYDoIZRl5/2OfIaD/IkoB6N4VRRPy+dawU0Ix4CacX/Enmjf6esHxG/Imuci
	 YVLlsuxMWDb0ChKfk/1mdH+GpKlCYwg9r0N6syNs5/aKuWt9CLgLgYbwvgcmPGxmjkW4q
	 d31/M+D/3L1iVOSA9lPNScEsqlmi+NFiFP0up7DqM5MczTRN9rOhktthcU4L4lKQffSc6
	 YB2j0G6XWGW+g81Zow7yaDqH3NyRZRbci60Vnyed22uhIAG65NyFeXGhvW21VgGcRsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908292;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=CZ87Wox43t0Jo/dky+kjMqQf6H/f4c/RMbSUMAnICCw=;
	b=4ycxcxWs6KXwSWAVDG3PfbWvZZl4TZfWwSdhSS7Xn3Wd353w0nO/6xKPcBanq+Touw/Z
	 /aDbJlRbBdiRKvNjkzy8GoSPA8Tl9Eb3/Ps6TgEb/EygP1QVec4S02iEClFvrF0xsV4Ub
	 Jd8Ef623qcQ2TESa6VCinCRFzfjVivQSO3sLQyHXTyCKtwC8fKYcxXxLM/XjBO3jOj57c
	 8qZQPT/ka6RSA3ze4kUULEcbKuipA+v2T1atFIHRT3WSf+xGcWl/d4qBBz9g+NPcCqFK8
	 CT3Wlqja6q9ML61ZBfOwvJMPNhHoa+4QJTYgJ4LfCFBaSBDU1neQjuCVlpC+R9RQ0kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iSc8KB3k;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2F606A893
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F2F606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iSc8KB3k
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6BCB81A158C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:38:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C0965FC81;
	Tue, 17 Nov 2026 09:38:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC65F11BC0493;
	Tue, 17 Nov 2026 10:38:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908289; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=CZ87Wox43t0Jo/dky+kjMqQf6H/f4c/RMbSUMAnICCw=;
	b=iSc8KB3kQbTV/BByqc0IPv8ejI7dg0oV1b+7qodf4ShocMFu1pd2p535z93aaGnhsziu0J
	4e8Lu5Ah33hm3y3PxKE/GS2rV1bSiMCtmRGKpu71BXpmR+5UA1f1+wn7rVCAhBq94pNEnT
	c6Uw51Hv1ibeohFGzWQ7Od2OxHJBCsi9QyxvTYvIVQD3z7gHnl3pYFI4KoFrcbuvR9o4da
	QBa/VKg5eNwOKGaZ3U6fl3j7S2V8SBZODzHU2FvmZY7Uwe2sKLkEN3mQU+0e4QTypSH7sJ
	oGL3Zi/ae6UcvhAZ65SgACzbdUDU7PnI3Dt9b4AFlQ5M9WTDOLtvdpPeueWVUA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 04/12] mtd: physmap: Remove #ifdef guards around shutdown callback
Date: Tue, 17 Nov 2026 10:37:42 +0100
Message-ID: <20261117093751.14988-5-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

physmap_flash_shutdown() calls mtd_suspend() and mtd_resume().

Unlike what their names suggest, those two functions aren't related to
CONFIG_PM, and neither is the platform_driver.shutdown() callback.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v2: Don't use pm_ptr(), and rewrite commit message
---
 drivers/mtd/maps/physmap-core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index dcda7685fc99..672747890972 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -600,7 +600,6 @@ static int physmap_flash_probe(struct platform_device *dev)
 	return err;
 }
 
-#ifdef CONFIG_PM
 static void physmap_flash_shutdown(struct platform_device *dev)
 {
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
@@ -610,9 +609,6 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 		if (mtd_suspend(info->mtds[i]) == 0)
 			mtd_resume(info->mtds[i]);
 }
-#else
-#define physmap_flash_shutdown NULL
-#endif
 
 static struct platform_driver physmap_flash_driver = {
 	.probe		= physmap_flash_probe,
-- 
2.47.3

