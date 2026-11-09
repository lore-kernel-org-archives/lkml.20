Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254003;
	b=I+CXf+2t9ZM3n3wakjEoDWgvn2hU03+2njQodNKiDkGrQgvNdCZ9sTccAu77QzNtgYvN
	 fBSaf8KYGYNP+pVbzrWN5U+lZnWsYgI4hIfMAfsHTJ+ySuZmxjTa4itUFLz/JALox3wtl
	 Pcn6d+lbtU/DSVqXkKR1p3OcirBVpn7kIm3xnEQISRNLezS75oGdQT8AirCNp8ciQtDPu
	 F0FNXOPh551SEZsmXzDfzO2Ypx0Wp08hUKTGtKLwB44QCQjWAYzU+e9cXAFdBtyRraNH9
	 NjJlj59XCkaAIGaJqVie0iIloHpoGSs0R0eZGmKxYpTIzPDdNMWSkPhyHh/k8PApbCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254003;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=trWh7b/oaV73RFxc+/uIz5fIntxEntW0xD8Fkcoyd2g=;
	b=qpORojX3ZzfayAr3PuRiKqiHUgccPsZNASnMo3gqDFvfbpoF01LrgAtIBDBbos5DXSZ0
	 wOwFFf+fW4tmXD1VbLp0nDqNh6mCE4sJC22hoe0DDPRAx4nU/KrC6HBiD4XlVUXgWz9p+
	 6TWq0uGL1thNlObVmJ9fF9ZakShkS7L/xdLUI/NsdLQPKkL7goN6IpgWRtbpCEAPdfmMe
	 EPpWA9DUIlA14ap1wAqWPcUg6KnlRDmdbW0AYCQlsMuOAqP5GZIdtSC16AkPvBHZCfXp0
	 zKRMvKN3xJ+8sFOlMkc78GKg7qRJzsMD1KLYVD1zlu80BEMM3KAAdejBthS/p64nSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RbbZEf8g;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FS4x2C4g;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA43B606A31C;
	Mon,  9 Nov 2026 19:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA43B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RbbZEf8g;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FS4x2C4g
Date: Mon, 09 Nov 2026 19:53:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794253999;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trWh7b/oaV73RFxc+/uIz5fIntxEntW0xD8Fkcoyd2g=;
	b=RbbZEf8gZ3qjkVyR3QdD0Kf54m0Leq8zSV15f7Kn5+GzScSdY/GGSoGYlcqIrdE5sRDshy
	fIAEYZZF6xqtIQDdoyltaNVqfz6ScPkpCf+S2eAdQWSlVjs5YSXRtBBVvnL42w+ZJRhjcu
	mHLx9uoj5D5TYRI780kSX9HeNetqkCpa6UeSbyxegRBXa7pbKsl5CFD9f09FiXIQlXwesM
	tIt7muu9u+GbYozrcFm5OhwrXDzs8NkwkxC0XnQYGqqFQzcYWOzD8FdHB3xmaz0L46Qs3I
	AOEg/gJjnU49iBfh5OqOVb2dCCn+EmSBu8k2ij/nABkj0P9XSGtedqK7t5gLmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794253999;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trWh7b/oaV73RFxc+/uIz5fIntxEntW0xD8Fkcoyd2g=;
	b=FS4x2C4gXOkYW1nnt/nNIJS6TZEReMn/E3BB2Q8otzz0bvjehoDB2hZy4hQpBwtpEaq9U5
	tqZmMq79Td0iLsAg==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] alarmtimer: Return early if try_module_get() fails
Cc: linux@weissschuh.net, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261102-alarmtimer-locking-v1-3-3c79a698aeae@weissschuh.net>
References: <20261102-alarmtimer-locking-v1-3-3c79a698aeae@weissschuh.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425399695.2093942.11906446385711241339.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     8c35d628b82dfa883394fa7cbfb9847017ed3d52
Gitweb:        https://git.kernel.org/tip/8c35d628b82dfa883394fa7cbfb9847017e=
d3d52
Author:        Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
AuthorDate:    Mon, 02 Nov 2026 06:11:56=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:50:03 +01:00

alarmtimer: Return early if try_module_get() fails

Simplify the logic by returning early if try_module_get() fails.

Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261102-alarmtimer-locking-v1-3-3c79a698aeae@=
weissschuh.net
---
 kernel/time/alarmtimer.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index 8eeea09..33c35f1 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -77,7 +77,6 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 {
 	struct rtc_device *rtc =3D to_rtc_device(dev);
 	struct platform_device *pdev;
-	int ret =3D 0;
=20
 	if (rtcdev)
 		return -EBUSY;
@@ -94,17 +93,16 @@ static int alarmtimer_rtc_add_device(struct device *dev)
=20
 	device_init_wakeup(&pdev->dev, true);
=20
-	if (try_module_get(rtc->owner)) {
-		WRITE_ONCE(rtcdev, rtc);
-		/* hold a reference so it doesn't go away */
-		get_device(dev);
-		pdev =3D NULL;
-	} else {
-		ret =3D -1;
+	if (!try_module_get(rtc->owner)) {
+		platform_device_unregister(pdev);
+		return -1;
 	}
=20
-	platform_device_unregister(pdev);
-	return ret;
+	WRITE_ONCE(rtcdev, rtc);
+	/* Hold a reference so it doesn't go away */
+	get_device(dev);
+
+	return 0;
 }
=20
 static inline void alarmtimer_rtc_timer_init(void)
