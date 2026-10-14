Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F14AA01A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009262; cv=none; b=iZp9K2E/Rq9pH1peCU68utzlCaIP3nze0c8amT8aWbfG+sjjw9wpPoN00TFHXRgsG/pEfp9A0tFbO5S8F481sFZGVhzdX7eiasLieY8Gubx2mITdDHafGk4u493sNuXKVFqKfiF8hiTOw+JnMV6cEI+gwZn+nCP5ZC8zveEOXyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009262; c=relaxed/simple;
	bh=kvxqiaaQ3yMUJswUotgvNDP/++btT3ktUaduZIu1VYo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=mz5/BfJfvP/l7S8WtSw4pVIuKDp3soptIyts62flVrXHJlEqaiBUbFRysl8zZK7J4HPg844oozM5rYz0Sb6/I2SB8IJlYXBrwDrCQ2hyOPTI6pIEZSK01fh9V2UzdW6Ha44XdgtQgANle72ZOcw39g1QwovC64hqLPzyJHjzDLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hA0vFVef; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nBDEdGmo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hA0vFVef";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nBDEdGmo"
Date: Wed, 14 Oct 2026 20:20:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009258;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwrXy4QIzQ2TT+RYenId66Sf4kPvEMpdV23KyUkfC1E=;
	b=hA0vFVefNLEHpPeVkO2DSjGPkC7z95QxhRsNgDU/H7fRBUc8kuwB3IgtlEeu4OHs4AcDdF
	XUWH+XNf7pQByhH3f2BprcrZ5LN+Nr7naVVTSQauzlwUy0IdSHJwSrSdSGp6Rz4tQtW1QE
	mM6D0E0xugefTnr4bhilap57hXXKlQQmwa+yRkBtPJ6iIvHbon8OfEcak7SWz7oCYtoziI
	BkD9i6gq7VgIDsrpJAH3UZR7IJwijTkjGF+AUilwniFfMKh+KuDYFcjRIkW2L9Q3/urC0h
	hrM+nspWdiSe5kUbfcsZyvKJLDAVtmJ3dNwRFNrxcVVRB40FyA7SmlAu46I0eQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009258;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwrXy4QIzQ2TT+RYenId66Sf4kPvEMpdV23KyUkfC1E=;
	b=nBDEdGmo8FFTcdn50acjxkWdX69tJdMkDFu56JYqptc4zRiEij0h+IpykrPWYPgy2N5C3K
	VNqha312VYfHwOBQ==
From: "clocksource-bot for Herve Codina (Schneider Electric)"
 <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] MAINTAINERS: Add the Renesas RZ/N1
 timers driver entry
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20261001082225.125956-5-herve.codina@bootlin.com>
References: <20261001082225.125956-5-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200925663.2666337.1685510726339708655.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     57fb7ac3584c27939a55eb3870be9d46f0b7e7e9
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//57fb7ac3584c27939a55eb3870be9d46f0b7e7e9
Author:        Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
AuthorDate:    Thu, 01 Oct 2026 10:22:24 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Fri, 02 Oct 2026 11:42:48 +02:00

MAINTAINERS: Add the Renesas RZ/N1 timers driver entry

After contributing the driver, add myself as the maintainer for the
Renesas RZ/N1 timers driver.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Link: https://patch.msgid.link/20261001082225.125956-5-herve.codina@bootlin.c=
om
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294dd..7bdacc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23295,6 +23295,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 F:	drivers/rtc/rtc-rzn1.c
=20
+RENESAS RZ/N1 TIMERS DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
+F:	drivers/clocksource/timer-rzn1.c
+
 RENESAS RZ/N1 USBF CONTROLLER DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	linux-renesas-soc@vger.kernel.org
