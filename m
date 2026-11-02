Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599989;
	b=zh8G8kdPPPa0NU8hk2nzB8pmvFPHt0yEnhkkL1UPNmqqByyIoFzowUc+PZ2jHnjS3muI
	 mHDIsn5r60fEWTt5ZUAzXpmhxilAuWINFbmGRVb/8IZb5Toq2Aw9SIdLi7Dz6m2q8VORn
	 AQqbjctWV2OM8L4q9bmj4Atqkgli4GRgHQsCpj0vWCNAz9q7ncoqZ7oYPWzuv/xzf6HOz
	 YBVNIwlcw5PK1xCogTfn0xgrnM6IM9E9f/WvCoSCcYWSoT3zv/GK0VUo9mneZQQ7Gtphi
	 gSfzgjdIQ+L7NTMNxSSt3UZM6X33qVHGPQe7oZBHHof45MywQtpPKAJagDiQuA3Ewkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599989;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Lf3wNA9Z47AIKUDlzQL7ruXMTQdj2cnIltudDlQJmEw=;
	b=04Jbaq5JevOTKEf9JMBTpVUO3F6jRp6uwOBdike0BiJEDsfoTeEoe9L265FBZh1Mm5Yt
	 9FXo5wp7OkYzdlijcs0A1tup8ksaI7ibu1u2neX2qCnPADP7d5XL+QvTvxjNThYNwvfeo
	 19RJulJgfQpKbraI4lQeAZHwXjHnYOxAWx+857M89feAZR5VU2B+1VwWhOGPwPsLJtcla
	 YrnEUJ4HlE2XPlCtgtDe3SeUdzK7xbaC6glZTrVZEeCAX8Hi0nrk6kQzQyKJDruqjaz56
	 znB/qKhGNAuS2I73ALdHf38sIeQU1IOKBynyFOkrsmEkiaOnTbG3NWJCnyKg3gTdo1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=JWRMtX1+;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5E606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE5E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=JWRMtX1+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793599986;
	bh=yZFBgntFsdk1WQsA4ifL7l/9a4JbFvZKU8/j1ttMnQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JWRMtX1+eF5qLsjAKk1MSzjxAbQvCUntBGKxdfvOj3rJTiMCoVsschWYmGV8h/lP4
	 i1cW/OirRjh3U9pUcNXxAFNkAafWpOjA/oHJAb7ykC5l8vQi/HrFU/OtrwNhGoHW+m
	 BW0744AO8q0c/vr9pIEn7+EJFnyayQoWO7rUgeNM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Nov 2026 06:11:56 +0000
Subject: [PATCH 3/3] alarmtimer: Return early if try_module_get() fails
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
Message-Id: <20261102-alarmtimer-locking-v1-3-3c79a698aeae@weissschuh.net>
References: <20261102-alarmtimer-locking-v1-0-3c79a698aeae@weissschuh.net>
In-Reply-To: <20261102-alarmtimer-locking-v1-0-3c79a698aeae@weissschuh.net>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793599974; l=1261;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=yZFBgntFsdk1WQsA4ifL7l/9a4JbFvZKU8/j1ttMnQg=;
 b=0/ZeaTLl84aSGgsseyYcXv78kq7g9zU4kMfu3XOUNLYEeg+5WBmw5zo5346UUcnJEqfvVI8w+
 aB1ZhJeVoT9D461LbDzapmHQwHYE+7i8eA4dDb3C0cO2P7sZ7j1zA1U
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Simplify the logic by returning early if try_module_get() fails.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/time/alarmtimer.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index 9ab1b053a2fb..b1ae0d2c6a7d 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -77,7 +77,6 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 {
 	struct rtc_device *rtc = to_rtc_device(dev);
 	struct platform_device *pdev;
-	int ret = 0;
 
 	if (rtcdev)
 		return -EBUSY;
@@ -94,17 +93,16 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 
 	device_init_wakeup(&pdev->dev, true);
 
-	if (try_module_get(rtc->owner)) {
-		WRITE_ONCE(rtcdev, rtc);
-		/* hold a reference so it doesn't go away */
-		get_device(dev);
-		pdev = NULL;
-	} else {
-		ret = -1;
+	if (!try_module_get(rtc->owner)) {
+		platform_device_unregister(pdev);
+		return -1;
 	}
 
-	platform_device_unregister(pdev);
-	return ret;
+	WRITE_ONCE(rtcdev, rtc);
+	/* hold a reference so it doesn't go away */
+	get_device(dev);
+
+	return 0;
 }
 
 static inline void alarmtimer_rtc_timer_init(void)

-- 
2.56.0

