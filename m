Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4784D526A90;
	Mon,  7 Sep 2026 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810695; cv=none; b=PsM+kdnlMDgcgOq/RYAkHbYVDZNoMcnULnqw4JDcjMVDrVrPotV9pH/N9cjnAgQ2NGyllHiEa7EvWbA60dGW73zqZy9Em9sAT78fUqLstgR7qUhI1slqmLrJJosmIvFuGweEbs89ZQFKuFtJ10pxwOr/peO3qFO22SWYExsemlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810695; c=relaxed/simple;
	bh=/o5+79amWJP1LRhidTQLO/S9U8toSWD91zIia5DHIj4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=BzE8gNIjEH7BCSPIkNowAtA5SZZBUB1qqwnyx8YB1GW3Gr8fSBtOHlZ92tny8O8d22/1QZ65MDcIgRliUE0iP2SMYu5E8b/X4IS1R/KMpat7lj2QKq/WdX7khFubGaB61RRU8UF2rWze+k849raAAZucBXxhTdU69FsdTJ2J3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g3LCrhR1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nreiyfup; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g3LCrhR1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nreiyfup"
Date: Mon, 07 Sep 2026 19:51:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788810692;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0ImsePTuASwBS8AC3XL8Q1o+mA6lhFxodoWsdFejoE=;
	b=g3LCrhR1CYQ9wxG2CZewtXESKhmsDlgmcTNNhCJvyi9iAd/xYnIoNNVBtgr0d82PYkGBqV
	ivbNrky7YQyPlSNCqHRpplmGV566CCHsD5DZn/85ng1R2Jxdcbl9pfrNNgH6ajSuMHEoHF
	seMCKgzH1oBDnvdPhRjyWFY3h7HpLtJP/AMYpxPr4lj4VW/OFcRrVLkLV8umlQKE0nIYNv
	cBUmJWX7FTaK/LEXzP9KJST8nrXaUbcoRsC8jRZj9haaMpUFOQ2IHDvTIj4rnljb5xuj5l
	O2cPUkvBGi/N6OPp2Kj63O7oHxeMd2zOswEVXd+QBrKecejREtIc84bB4sqAmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788810692;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0ImsePTuASwBS8AC3XL8Q1o+mA6lhFxodoWsdFejoE=;
	b=NreiyfupWCycyw+aJpKfQAj+1qpjsSjbokslRrJmX928IsRMYnLLEPMYOAZg+68ExSVzP3
	8pB2MNRoluj1HLBA==
From: "tip-bot2 for Andrew Davis" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/pruss-intc: Use scoped lock guard and
 devm_mutex_init
Cc: Andrew Davis <afd@ti.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903185220.2014861-2-afd@ti.com>
References: <20260903185220.2014861-2-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178881069105.623050.11750229050053182460.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     c23c3a1ec322f8bb9ed73bc1262d1083e76df23b
Gitweb:        https://git.kernel.org/tip/c23c3a1ec322f8bb9ed73bc1262d1083e76=
df23b
Author:        Andrew Davis <afd@ti.com>
AuthorDate:    Thu, 03 Sep 2026 13:52:20 -05:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 07 Sep 2026 21:47:51 +02:00

irqchip/pruss-intc: Use scoped lock guard and devm_mutex_init

Scoped locking simplifies the return path in a spot, and removes
a couple lines in another couple spots. The devm mutex init will
call mutex_destroy() for us on remove, which only really matters
when CONFIG_DEBUG_MUTEXES is set, but it is nice to do anyway.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Link: https://patch.msgid.link/20260903185220.2014861-2-afd@ti.com
---
 drivers/irqchip/irq-pruss-intc.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-int=
c.c
index cc3a7c2..5a3e9e5 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -181,7 +181,7 @@ static void pruss_intc_map(struct pruss_intc *intc, unsig=
ned long hwirq)
 	u8 ch, host, reg_idx;
 	u32 val;
=20
-	mutex_lock(&intc->lock);
+	guard(mutex)(&intc->lock);
=20
 	intc->event_channel[hwirq].ref_count++;
=20
@@ -206,8 +206,6 @@ static void pruss_intc_map(struct pruss_intc *intc, unsig=
ned long hwirq)
=20
 	dev_dbg(dev, "mapped system_event =3D %lu channel =3D %d host =3D %d",
 		hwirq, ch, host);
-
-	mutex_unlock(&intc->lock);
 }
=20
 /**
@@ -224,7 +222,7 @@ static void pruss_intc_unmap(struct pruss_intc *intc, uns=
igned long hwirq)
 	u8 ch, host, reg_idx;
 	u32 val;
=20
-	mutex_lock(&intc->lock);
+	guard(mutex)(&intc->lock);
=20
 	ch =3D intc->event_channel[hwirq].value;
 	host =3D intc->channel_host[ch].value;
@@ -251,8 +249,6 @@ static void pruss_intc_unmap(struct pruss_intc *intc, uns=
igned long hwirq)
=20
 	dev_dbg(intc->dev, "unmapped system_event =3D %lu channel =3D %d host =3D %=
d\n",
 		hwirq, ch, host);
-
-	mutex_unlock(&intc->lock);
 }
=20
 static void pruss_intc_init(struct pruss_intc *intc)
@@ -376,17 +372,15 @@ static int pruss_intc_validate_mapping(struct pruss_int=
c *intc, int event,
 				       int channel, int host)
 {
 	struct device *dev =3D intc->dev;
-	int ret =3D 0;
=20
-	mutex_lock(&intc->lock);
+	guard(mutex)(&intc->lock);
=20
 	/* check if sysevent already assigned */
 	if (intc->event_channel[event].ref_count > 0 &&
 	    intc->event_channel[event].value !=3D channel) {
 		dev_err(dev, "event %d (req. ch %d) already assigned to channel %d\n",
 			event, channel, intc->event_channel[event].value);
-		ret =3D -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
=20
 	/* check if channel already assigned */
@@ -394,16 +388,13 @@ static int pruss_intc_validate_mapping(struct pruss_int=
c *intc, int event,
 	    intc->channel_host[channel].value !=3D host) {
 		dev_err(dev, "channel %d (req. host %d) already assigned to host %d\n",
 			channel, host, intc->channel_host[channel].value);
-		ret =3D -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
=20
 	intc->event_channel[event].value =3D channel;
 	intc->channel_host[channel].value =3D host;
=20
-unlock:
-	mutex_unlock(&intc->lock);
-	return ret;
+	return 0;
 }
=20
 static int
@@ -550,7 +541,9 @@ static int pruss_intc_probe(struct platform_device *pdev)
=20
 	pruss_intc_init(intc);
=20
-	mutex_init(&intc->lock);
+	ret =3D devm_mutex_init(dev, &intc->lock);
+	if (ret)
+		return ret;
=20
 	intc->domain =3D irq_domain_create_linear(dev_fwnode(dev), max_system_event=
s,
 						&pruss_intc_irq_domain_ops, intc);
