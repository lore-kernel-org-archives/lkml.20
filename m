Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B618A4A3F16
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009244; cv=none; b=R3Veg/JWUDJK+mD8qLo+ff6+PbXJkFbrjusUzQkQuDM8kOsEC22ZwX3wrzZX4yRISaz6W2qEGpazcYXD8V4wIzZF27+oWqR1951kWzaLcJMhuXcV3Fb0m/EZXgotBEgihrgeRs69CTQ+/2tqVnUDW1vMiFB+Q7f2oIIT0kKLU80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009244; c=relaxed/simple;
	bh=5uDZ6SRghIn38UgEG6r7RO3dhzDv6KxoPnnNksS6yWc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=XtQc8rKADYryJzLA3HVXpZMa/Jqg9zW+oL9WxkYfH240+NQC2nLGEOF+JGqlarXkCazxeEf0msli9wC+8F9lpTcUDLrXCCNf3Bek2Scr3TyhxJMOZIB2KyIZmffb/47WpUVwF6gDwx50Ysvx+4IoX2MRjcmYJ8O5EpQklqi9eVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gZMPkp4A; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ajhlmvWz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gZMPkp4A";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ajhlmvWz"
Date: Wed, 14 Oct 2026 20:20:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009241;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UN7dLmUdqAnMdqeLXpyi3MUmnhJSlOEG7CejjKMOqMo=;
	b=gZMPkp4AEWgNa1msQaH53tlUalXVLBqB7eiteJ+q1DZvZhYVuX0cmdz1tBk2vohvEzCACB
	tIv/O6EM2MYzR9m7a9PhI4ZLbpjBgLKVMfQka50+oJ7CL2b4cyebi84iq2DyexIRbL9ztb
	bMH8I0IYz64DFi0vmACue9DGcpHodRCNO8F55klzEGtkyG+VmmJmdYC3qKXoWQfuMGBgTj
	Z5u56WAFbdgOAewrzajhmgn+VF9JXb1FkczE7akaAnTAGJ2vgBdKG7zcOFfiIf3LWy/idT
	iybeByhmugw+Oks8LIpA4Z2YhVS1c1Q2gfEqINvKb6WH+OcvnBvy2QlK6EN0tQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009241;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UN7dLmUdqAnMdqeLXpyi3MUmnhJSlOEG7CejjKMOqMo=;
	b=ajhlmvWzMwrEMMUHzDQUOCP4vVlAlAQI7yYg3ladm8SJHFRRgWP6XUI0rsdSKmob5RPuLC
	SlnHTbEsUjPpclDQ==
From: "clocksource-bot for Jiale Yao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] clocksource/drivers/timer-ti-dm:
 Handle runtime resume failure
Cc: Jiale Yao <yaojiale02@163.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20261003080812.429386-1-yaojiale02@163.com>
References: <20261003080812.429386-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200923993.2666337.8332727429186741572.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     c40b76c8cf580466d9e56223f7f74beecc165480
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//c40b76c8cf580466d9e56223f7f74beecc165480
Author:        Jiale Yao <yaojiale02@163.com>
AuthorDate:    Sat, 03 Oct 2026 16:08:11 +08:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 14 Oct 2026 20:43:56 +02:00

clocksource/drivers/timer-ti-dm: Handle runtime resume failure

omap_dm_timer_write_counter() accesses timer registers and updates the
saved counter value after requesting a runtime PM reference. If runtime
resume fails, the timer remains inaccessible and no reference is
acquired, but the function still writes the register, drops a
reference, updates the cached value, and reports success.

Check the return value and propagate an error before touching the timer
state.

Fixes: 0494fc345b37 ("clocksource/drivers/timer-ti-dm : Capture functionality=
 for OMAP DM timer")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Link: https://patch.msgid.link/20261003080812.429386-1-yaojiale02@163.com
---
 drivers/clocksource/timer-ti-dm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti=
-dm.c
index ae8777d..8012d3f 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -1095,6 +1095,7 @@ static int omap_dm_timer_write_counter(struct omap_dm_t=
imer *cookie, unsigned in
 {
 	struct dmtimer *timer;
 	struct device *dev;
+	int ret;
=20
 	timer =3D to_dmtimer(cookie);
 	if (unlikely(!timer)) {
@@ -1104,7 +1105,10 @@ static int omap_dm_timer_write_counter(struct omap_dm_=
timer *cookie, unsigned in
=20
 	dev =3D &timer->pdev->dev;
=20
-	pm_runtime_resume_and_get(dev);
+	ret =3D pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
 	dmtimer_write(timer, OMAP_TIMER_COUNTER_REG, value);
 	pm_runtime_put_sync(dev);
=20
