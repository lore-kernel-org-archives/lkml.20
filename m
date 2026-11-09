Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254004;
	b=YFsa1fpFeXk8My8KRdHv706MMTxGHJtILUIbZMFCUOEqC9NFe7aeF6t9B2bWWFucfH7L
	 sT2ntVCRmXpjMh+iQhaouQYFRKm8Bmz/5faDj7LdD1vd/2ojwL6rgvlCJM5TVxO88PTV7
	 MDCb7KQZ2vD9n7gndYkW3QJWycOau34mWjy+XvTdjBFjgaBTHOAPXwjNF8Ww9JtzdUmdj
	 kmvBBvkNe1Qj+GWX5DvsiU2P0QLnGu5CuDhqi+WR9oyjbnaEqv8w/fRDRbK0J0R6sKo10
	 w7XiG+7YqdC44rUUl2nayOozEcnQeRKeSCrIGvoXEbwfxc/3/jtv9Zf1m9IIcdT1alg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254004;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=wB4wiHLkaY9yq1JOi6AD+Cr8a6kOzq4UmAKlvTJ4aWo=;
	b=aqesDCbr36KSiLvuEdE76YSX0DaR/dx4AWrQYhm+qRv7ibDbitf1h9B3PYq2gIYKxxRX
	 UuccvxNMftOxx/armGT/Kv6zVk15QkX8JjUZjsAD1/zrRNAYxjDiJuclpI9GmRCjvKAt5
	 1Q3jQXsPQ8/TphTZ7xaSTVjwYXAVsa6U0Z3S9a6mpnPfKSmShfNmlqNQ0JzPtqxFSnIMm
	 cU5QQMNShFQL2eQ6oqZ5D6ob92/iquy1mLWfru4gSzqXVCy6cxFvZnV+L/5SL4TPu0X+/
	 LLdnsyGu4S+3iGncF8Z5BVSyozjBF5NYFHVEm23yg2xarix6pSQtBdm83YH6+P/ZT1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="Mm4/Ia6/";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2A7YGH9y;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B00606A336;
	Mon,  9 Nov 2026 19:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B00606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Mm4/Ia6/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2A7YGH9y
Date: Mon, 09 Nov 2026 19:53:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254002;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wB4wiHLkaY9yq1JOi6AD+Cr8a6kOzq4UmAKlvTJ4aWo=;
	b=Mm4/Ia6/cgO/KDF66nvkCGGxX6DEndLOpHS8Nd4pJ4qtOh+Kf5u0CmNhdlVuVCtOxlnwR7
	xiW8rlyqTSFNBhOoMtvlL8DMwve0+As+OdrZUQiGrmvKhv5Y6jA5GBLfEfeCO/Xic8SGK9
	WRiBIqF3+Ibebq8bra2LCxDa2BWmndRCQV8cPjSkSscAwVoMVkjuEa2Rw8aCp/LTY+CLIc
	iH+odi+6x3t0+oQ/i36oM10Nv6inrmITz5kVb2wEis+WA5Lkj1BCF1N1dDLjyjx8j/5BzG
	1UxRrD7XiE+VnAOAOmwmKUu9rXxodnSBE39TFx/+NCteq+Dkqc9OaAlLVQBLDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254002;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wB4wiHLkaY9yq1JOi6AD+Cr8a6kOzq4UmAKlvTJ4aWo=;
	b=2A7YGH9yeGE93XQ3pEBYrhq87X53dqJgg+sV3QHxs6HFoq9XNV4kvUrVSPiyXZka5adVkW
	GZkk4vmeod266hCQ==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] alarmtimer: Drop the spinlock around the rtcdev variable
Cc: linux@weissschuh.net, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261102-alarmtimer-locking-v1-1-3c79a698aeae@weissschuh.net>
References: <20261102-alarmtimer-locking-v1-1-3c79a698aeae@weissschuh.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425400052.2093942.4534090384841095144.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     6d771f75f3761d7c8aaf57b06a2b4ddcb25b4ce8
Gitweb:        https://git.kernel.org/tip/6d771f75f3761d7c8aaf57b06a2b4ddcb25=
b4ce8
Author:        Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
AuthorDate:    Mon, 02 Nov 2026 06:11:54=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:50:03 +01:00

alarmtimer: Drop the spinlock around the rtcdev variable

The spinlock serializes calls to alarmtimer_rtc_add_device(), making sure
the 'rtcdev' variable is written only once. It also protects the read of
the 'rtcdev' variable in alarmtimer_get_rtcdev().

But alarmtimer_rtc_add_device() is already synchronized externally through
the driver core's subsystem lock. So the additional spinlock can be dropped
and replaced with WRITE_ONCE()/READ_ONCE() for consistent access.

This removes lock/unlock operations from the alarmtimer's clock callbacks.

[ tglx: Massage change log ]

Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261102-alarmtimer-locking-v1-1-3c79a698aeae@=
weissschuh.net
---
 kernel/time/alarmtimer.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index d6dc6e8..601ebdc 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -61,7 +61,6 @@ static DEFINE_SPINLOCK(freezer_delta_lock);
 /* rtc timer and device for setting alarm wakeups at suspend */
 static struct rtc_timer		rtctimer;
 static struct rtc_device	*rtcdev;
-static DEFINE_SPINLOCK(rtcdev_lock);
=20
 /**
  * alarmtimer_get_rtcdev - Return selected rtcdevice
@@ -70,12 +69,7 @@ static DEFINE_SPINLOCK(rtcdev_lock);
  */
 struct rtc_device *alarmtimer_get_rtcdev(void)
 {
-	struct rtc_device *ret;
-
-	guard(spinlock_irqsave)(&rtcdev_lock);
-	ret =3D rtcdev;
-
-	return ret;
+	return READ_ONCE(rtcdev);
 }
 EXPORT_SYMBOL_GPL(alarmtimer_get_rtcdev);
=20
@@ -98,15 +92,13 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 	if (!IS_ERR(pdev))
 		device_init_wakeup(&pdev->dev, true);
=20
-	scoped_guard(spinlock_irqsave, &rtcdev_lock) {
-		if (!IS_ERR(pdev) && !rtcdev && try_module_get(rtc->owner)) {
-			rtcdev =3D rtc;
-			/* hold a reference so it doesn't go away */
-			get_device(dev);
-			pdev =3D NULL;
-		} else {
-			ret =3D -1;
-		}
+	if (!IS_ERR(pdev) && try_module_get(rtc->owner)) {
+		WRITE_ONCE(rtcdev, rtc);
+		/* hold a reference so it doesn't go away */
+		get_device(dev);
+		pdev =3D NULL;
+	} else {
+		ret =3D -1;
 	}
=20
 	platform_device_unregister(pdev);
