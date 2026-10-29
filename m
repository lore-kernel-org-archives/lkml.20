Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280871;
	b=T07UD1M044Xxi0OpNfphVaIyFENrSnAs0APWNRxdRLJjr5nksgyBEWducMRKTXcGUVpg
	 hmM5K/NGiTGmbavu9dGSdSLxNYj6sZRp3jKSY39JXEB6hbU2xGZ3FiXwmT2MLSvMOiu7G
	 dOtcvVxYD4U3lS1ZlkwFeUUe8KplotjfJSluz8tvTHitGn8GQKoBUix5okyVaQ7VHJ+tS
	 K5s2gfGcwRKOVomDrq8Rwc4Tw9V0TxrBfbZ8CrqZOV+bn5acrawnxKiE/QKhCUCNnpDpJ
	 uQ2NCjWgQPKUZ+r2qz7ML+zjy7wISBq/bnwA/yu/Jv1pwC2C+xp4QBBExKBEDCZQ8Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280871;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=tiTyn3ATgJNnKgh5hFl7FDhnL41Fqwy+E3sMEhqAePw=;
	b=V2qgPuvaUoxc1twulocnwTPsMrZiPISJeUkpDg0mnDlyAK5lITnffedOJA1qgnFHPTC8
	 /+c2rzCG15LMA2GHBhk2g7eBAylIwmRQqvWOSJutOExNes27x+SRM7Hjl3KeGeN/jyZwz
	 OasF/9JzS6LoD7TpPfzcZY3YEo7sV//1gKxiWZLjp1OcSbePHIfN51yY7+iWsOICow9Y3
	 ahLf6yDzYFcpv2HapWbZgabNHFo+wysXpIKYk7e0qYxQltrnAHywmLggLwaij6oWzFLbW
	 349zD2tGvNuPZI4vYH6vjfcrW4d13jNSCmpMrpkJ9H29yjRrgMb4vwHKdibH0kx1jkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="J2Y/R8+X";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91B3606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A91B3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J2Y/R8+X
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A537AC49F44
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:35:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D6F160360;
	Thu, 29 Oct 2026 13:34:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95EBE1032900F;
	Thu, 29 Oct 2026 14:34:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793280865; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=tiTyn3ATgJNnKgh5hFl7FDhnL41Fqwy+E3sMEhqAePw=;
	b=J2Y/R8+XCfkwyK4wW9+s4UrOFleqwQOyXr9+uBPBmveJPsgtoUMYR0/AQU1l9J7+VB3V4M
	yyeob4oOiduWfWKa7HCr58P3Ms8ydtsUdFytKd25VamE8UEoIwiLYA49l1I0WVpCCdhr0j
	Qf4/i85L/PVcyPGEJfn8EOKkIzWG9ZBxiDgwS/wo7VxENcos2R5ZsL26qvDhC0ixcrZr1h
	wW16wuHvT5t1ycjXeF1cVzd/RjSPohinVrsS/WSBPskRHajk+rxCE7Hmv4pFdiGgAw9WAC
	cn9X8nq0ePlGtFUARMW/ykAnKfX87XEzmzPHrRW7w/F0WDdpo6rjUJlCxrMQDg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] rtc: ep93xx: use sysfs_emit() instead of sprintf()
Date: Thu, 29 Oct 2026 14:23:26 +0100
Message-ID: <20261029132339.925021-3-alexandre.belloni@bootlin.com>
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

Use sysfs_emit() instead of sprintf() in sysfs show callbacks
(comp_preload_show and comp_delete_show) to conform to the
recommended sysfs attribute formatting guidelines in
Documentation/filesystems/sysfs.rst.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ep93xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
index 507c9f22036c..f105aba28459 100644
--- a/drivers/rtc/rtc-ep93xx.c
+++ b/drivers/rtc/rtc-ep93xx.c
@@ -93,7 +93,7 @@ static ssize_t comp_preload_show(struct device *dev,
 
 	ep93xx_rtc_get_swcomp(dev->parent, &preload, NULL);
 
-	return sprintf(buf, "%d\n", preload);
+	return sysfs_emit(buf, "%d\n", preload);
 }
 static DEVICE_ATTR_RO(comp_preload);
 
@@ -104,7 +104,7 @@ static ssize_t comp_delete_show(struct device *dev,
 
 	ep93xx_rtc_get_swcomp(dev->parent, NULL, &delete);
 
-	return sprintf(buf, "%d\n", delete);
+	return sysfs_emit(buf, "%d\n", delete);
 }
 static DEVICE_ATTR_RO(comp_delete);
 
-- 
2.56.0

