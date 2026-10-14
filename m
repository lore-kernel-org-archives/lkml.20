Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB54A92E9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009257; cv=none; b=WqNptTLHk7wMjLi1d4rAgQ79XOSqG2QvqOaiIzJqhRmQScItE6xnkgb0/Qu6IMo1RCDenuuHHOqogUzc4IJxOIOmyDWwt7+eg5FzRhe5fwOL1MY3Z90tYEW8eqL0bfzPvHDp/xBgAbvrrzwcVldgaESPAoU3c96aGRwTdGNxk8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009257; c=relaxed/simple;
	bh=Lv1lGOxDLNSWvrGhSQbRvfKhEuMwwPJ8ykNgUliU9mA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=LE7R5VQWMiMWw2D35/kN8KBaKYZqy1f+YdrtaRcrxfgvWwjXOwaPiijeD04GCk7Jet4KTh5sHXH1uDE1fAVgwQnBkW0024zxoZ9MH+wkkNJK/MOuddgiGtPm2zfQfy09tvauuRRzdqgPm6d/ahrCAjiYZudJxxdWVRa1+1t4ZqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0bb9eAu4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aI1DsgCq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0bb9eAu4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aI1DsgCq"
Date: Wed, 14 Oct 2026 20:20:51 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009253;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfuAgyAAmY0buyQk2o7AK8DJfMSkxIYcUhNq2LjFAMg=;
	b=0bb9eAu4ds/kyaIN9rY4cZid0pft5ith2X+BA5O+2B4cH2d8YSwbWOXHViH00ZyFnkGd6T
	zSdImRYed0II+ectFBH6nri6JdT0IVeFxPafCiwKB+oen+0KvBw4728t/QJ5/pZtGJtmw9
	GcYmT26PS6b12DSU+SvpQ4+mT22S1znNSAUMravTMeZ6cqg9O37hEBdauPkATI2CaHFxA9
	aCazWuYOafT/kkCHzhcBO7h3LxBOr5nN5ofe0lbGFVHXX+r5EgLJ0BswId9RLoBjWk+1iL
	IpLJcFul7ljoED1PWSRwRLhm1YyT71PnBci/ZcSFGTyag72+D8NKFPDrFRTS+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009253;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfuAgyAAmY0buyQk2o7AK8DJfMSkxIYcUhNq2LjFAMg=;
	b=aI1DsgCqzxUl+/57W4zLZSAsuWeWzyf4ZZ5voIsyYpAyDkCvjLlLw7upv0/mB3yUBT+fTs
	USdnobXWhywyqvDA==
From:
 "clocksource-bot for Markus Schneider-Pargmann (TI)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] clocksource/drivers/timer-ti-dm:
 Register clocksource/event only for am654
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 daniel.lezcano@oss.qualcomm.com
In-Reply-To: =?utf-8?q?=3C20260828-v7-3-next-topic-ti-timer-dm-clocksource-o?=
 =?utf-8?q?map-fix-v1-1-85f0e4dc6f9f=40baylibre=2Ecom=3E?=
References: =?utf-8?q?=3C20260828-v7-3-next-topic-ti-timer-dm-clocksource-om?=
 =?utf-8?q?ap-fix-v1-1-85f0e4dc6f9f=40baylibre=2Ecom=3E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200925196.2666337.2177155502617662025.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     0d3a67b1954a3988fef20ba7641d33e6085ad313
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//0d3a67b1954a3988fef20ba7641d33e6085ad313
Author:        Markus Schneider-Pargmann (TI) <msp@baylibre.com>
AuthorDate:    Fri, 28 Aug 2026 20:47:45 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Fri, 02 Oct 2026 12:03:36 +02:00

clocksource/drivers/timer-ti-dm: Register clocksource/event only for am654

Registering clocksource/clockevent for the older platforms breaks
booting them. The older platforms have their own implementation in early
boot that is used to register clocksource/clockevent in
timer-ti-dm-systimer.c.

With am654, the timer is much more complex with more dependencies so
doing this in early boot with the other driver is very difficult and
gets ugly. Instead it is implemented in the platform driver for am654.
However the old platforms may not register clocksource/clockevent in
this driver as that would break the boot.

Add a system_timer_capable flag that is only set for am654-timer that
gates the clocksource/clockevent registration.

Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Closes: https://lore.kernel.org/r/2013A99A-0502-4128-ACFA-B04886224393@goldel=
ico.com
Fixes: b8eeeca55456 ("clocksource/drivers/timer-ti-dm: Add clocksource suppor=
t")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Tested-by: Andreas Kemnade <andreas@kemnade.info> # OMAP3 GTA04
Tested-by: Kevin Hilman <khilman@baylibre.com> # OMAP3 Beagle XM
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # OMAP3 OpenPandora
Link: https://patch.msgid.link/20260828-v7-3-next-topic-ti-timer-dm-clocksour=
ce-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com
---
 drivers/clocksource/timer-ti-dm.c          | 4 +++-
 include/linux/platform_data/dmtimer-omap.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti=
-dm.c
index 6787aca..ae8777d 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -1475,7 +1475,8 @@ static int omap_dm_timer_probe(struct platform_device *=
pdev)
=20
 	timer->pdev =3D pdev;
=20
-	if (timer->capability & OMAP_TIMER_ALWON && !IS_ERR_OR_NULL(timer->fclk)) {
+	if (pdata->system_timer_capable &&
+	    timer->capability & OMAP_TIMER_ALWON && !IS_ERR_OR_NULL(timer->fclk)) {
 		if (!omap_dm_timer_sched_clock_counter) {
 			ret =3D omap_dm_timer_setup_clocksource(timer);
 			if (ret)
@@ -1585,6 +1586,7 @@ static const struct dmtimer_platform_data omap3plus_pda=
ta =3D {
=20
 static const struct dmtimer_platform_data am6_pdata =3D {
 	.timer_ops =3D &dmtimer_ops,
+	.system_timer_capable =3D true,
 };
=20
 static const struct of_device_id omap_timer_match[] =3D {
diff --git a/include/linux/platform_data/dmtimer-omap.h b/include/linux/platf=
orm_data/dmtimer-omap.h
index 726d891..b78ee46 100644
--- a/include/linux/platform_data/dmtimer-omap.h
+++ b/include/linux/platform_data/dmtimer-omap.h
@@ -57,6 +57,8 @@ struct dmtimer_platform_data {
 	u32 timer_errata;
 	int (*get_context_loss_count)(struct device *);
 	const struct omap_dm_timer_ops *timer_ops;
+	/* always-on timers can be used for clocksource/clockevent */
+	bool system_timer_capable;
 };
=20
 #endif /* __PLATFORM_DATA_DMTIMER_OMAP_H__ */
