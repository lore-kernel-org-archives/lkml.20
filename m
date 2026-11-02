Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599989;
	b=4skzJuPgt9E68ddKDsWfE506f/6/GBRraUXu3VdR0OuS/Ypgrl7LV/6LE1gCGPxOsNHE
	 ZVgZFZP0QjhkkVx4taXiX8/IVkXbnBCtgB45Zhvf+mPZt96uppvsRJ/LH/WMskpjWZdMa
	 YV6FiT3/Gq0jGUOxxOwvtZOBnoQzBB4HOObQ0jYBhmJ1RAJ8PbfLumpwfagB2PUdOtYtW
	 n1dPLmHUleRLp6wy6PaQVvc07G7u6Tf+PnC4gFLGyEc+ycFQcHlHDAeTUGK7qLSfeUmhD
	 AvTpm9222+YN6Opte3ix1sJ2ktzCmVc6J5V8JlOXnBHxqk/YrWyGVf6uqFUieYDb6yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599989;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=EW2iCIJUBhVVx00po9aOWBygkIeSSftWMYllwAemqgw=;
	b=qyaYIXIQQsSBiczbRTE8ejm07Z/fH0L4JWBaXN2q5Z67sW1mv1Y5AjPG2dyF9Otu7cMo
	 ASugothp+WAXathsFyfBcdWU1FqbmMaDBViA9N0LDBPK7vcNFH0HRNGmd6cxjGKmDkUpL
	 2Qw4sGNCWGMgy5j8MP+ekCkn6WXVZH/VKJ9PDiCW85dWBaSnsrh0R6CcBGaLVky0Q2b0j
	 ABOnE3CfiCwkhq5kPfAzqPXKQDwVQxFwLP3SSWuNwoFjaxJ/x+fXL7pq33j3B7ZSZpiKm
	 oW7qElDwAMfeCKWZvjIOWVM8ghTD5ZPB80TDxjHB9CnUF20dF+v332kBdrkMcqEF/lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=liEp+zLI;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A35606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A35606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=liEp+zLI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793599986;
	bh=Lr03X62t/xJ37i52cYV4k8Dm+oL7ytynBSNjWkNhShA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=liEp+zLIH1iEiSDpUvVKrBwkAakCB9PGbvSrM/aA/Ht2LmuNCjV5PeYGFTaiOxllw
	 nmXZPf1pquKOcP7sFWU1oV6xeq1O/7V673VaNgOgkEqaGkANCquC7wSH2bq92Nntht
	 Jvv85SfCExi+XkpKW0WUVfGtO6R8zT4dR0QhNmHM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Nov 2026 06:11:55 +0000
Subject: [PATCH 2/3] alarmtimer: Return early if
 platform_device_register_data() fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-alarmtimer-locking-v1-2-3c79a698aeae@weissschuh.net>
References: <20261102-alarmtimer-locking-v1-0-3c79a698aeae@weissschuh.net>
In-Reply-To: <20261102-alarmtimer-locking-v1-0-3c79a698aeae@weissschuh.net>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793599974; l=993;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Lr03X62t/xJ37i52cYV4k8Dm+oL7ytynBSNjWkNhShA=;
 b=DmqQqb+obRFYbnXjVU8yZIQzCb274SJwyg6xeNAjiyCVX9r8P8GsptqxwzuLD4eExutfcNz+o
 WwzhjYhKmKIAJfY8astvi0pD2BQkye8OI9qy0P/+uBatyAlXTrPRuJg
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Simplify the logic by returning on error instead of having to handle the
potential error in each following operation.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/time/alarmtimer.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index e60c626e326b..9ab1b053a2fb 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -89,10 +89,12 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 
 	pdev = platform_device_register_data(dev, "alarmtimer",
 					     PLATFORM_DEVID_AUTO, NULL, 0);
-	if (!IS_ERR(pdev))
-		device_init_wakeup(&pdev->dev, true);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
-	if (!IS_ERR(pdev) && try_module_get(rtc->owner)) {
+	device_init_wakeup(&pdev->dev, true);
+
+	if (try_module_get(rtc->owner)) {
 		WRITE_ONCE(rtcdev, rtc);
 		/* hold a reference so it doesn't go away */
 		get_device(dev);

-- 
2.56.0

