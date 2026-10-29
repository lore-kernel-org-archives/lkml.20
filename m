Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280891;
	b=HBIjqI8yAmcHeCHhtMR8LqEJUnMg/RHU6Kern1n7RLPp0r5DbqmC0xu+QGcORuTf7cUN
	 T4hX7fvzIt057IVs4izOdDY+r4OTLinVYCBhBIzEITE2k7qcj4PhKvSJyCmYyeUdDx7ZI
	 qfP/nFp8H9gy40YgwnHlQ63JWygen/IWk7+NQPfkQG2uwc/ovMb84Dpw5LIrkdHIGLPNd
	 BwrnISdgqoo8wi27oEdVDgqcxpZoOMKXdc4+ZH7X5XJTjQT3OMrLvNfJBcBttfNnBzUl7
	 LJ3gixoWNirRaxei89dBnMZMEqVoFA1Z8PNs2CVjoLcj4D2aoIp77mNVIy8ZaZbmE9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280891;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=nNOo9ztPq2H1V9K18/duaVRD55SEQg7q5xZq3bqGz2Y=;
	b=tYLatfUEyd8L/IAGaj7dYbFUEDOCW7Hxgi0zWLDKwYJCDnkjuYYvc/BD3nQ+yRnVaxyN
	 ccp9qcoA+77s+Nrwcjo9+3fQvygQhWEyqHjF7jxfihZ6oWDbIce8XnaHkbFwYmKg2yAco
	 j4TKb+WNP4Oy6aiTKrsFWF0TFa5OLXN+EmSJs4jo3/dMfAFWy0nVJCHGs4ITQLrX7C/uq
	 x+u1akMcJZu0O4dKCgCC6Tl7PfF3bRj0iJ90eqLPETvjRqMEWJa3hAwbvTMeUgNaKb4sz
	 rHHdgQljEg27w1hWcSDi/ZbMBvCd6FpOXZfkMrqaxFgeuj7YOwpzSQee5MJeQd4VKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DoogYOgx;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B93B606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B93B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DoogYOgx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 18968C49F44
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:35:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0EA360360;
	Thu, 29 Oct 2026 13:34:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8ED31032900F;
	Thu, 29 Oct 2026 14:34:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793280885; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nNOo9ztPq2H1V9K18/duaVRD55SEQg7q5xZq3bqGz2Y=;
	b=DoogYOgxvPvZsXRXiki1NVQmA1JmsUoDXuKTcP+1epCe9qp9fguE0SPcIcTFdR7Na2qN0E
	r2M/tnmmF12pYcmHrFTbiAaVun8nToKbYx6At9pMotgwCgQ5MO8vOJCGqYVwP/5KiQrw1Y
	ll2z5jwSJDep5uzGKTxAoRWPwiXBQe/MH2AGrJtYnqS5Ym1rF4R249hw3uG9OLyfaIC461
	ryWoKygSyx8dCbpx1+YRlkHq0lk8zZvP/cFIrfw16aXBgi4+1oG8vIrWGg9h8/sXOCfauC
	krlafdJ2RrI7ZRH0nS00MHCPPfij6ZGzqMNsLy7UA75bAuq4ZglpVtmHsxLhfQ==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] rtc: rx8025: use sysfs_emit() instead of sprintf()
Date: Thu, 29 Oct 2026 14:23:30 +0100
Message-ID: <20261029132339.925021-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029132339.925021-1-alexandre.belloni@bootlin.com>
References: <20261029132339.925021-1-alexandre.belloni@bootlin.com>
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use sysfs_emit() instead of sprintf() in the sysfs show callback
(rx8025_sysfs_show_clock_adjust) to conform to the recommended sysfs
attribute formatting guidelines in Documentation/filesystems/sysfs.rst.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rx8025.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index 2f2deb59cbee..96a04c977d0f 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -486,7 +486,7 @@ static ssize_t rx8025_sysfs_show_clock_adjust(struct device *dev,
 	if (err)
 		return err;
 
-	return sprintf(buf, "%ld\n", -adj);
+	return sysfs_emit(buf, "%ld\n", -adj);
 }
 
 static ssize_t rx8025_sysfs_store_clock_adjust(struct device *dev,
-- 
2.56.0

