Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927237;
	b=WscxAJDUhUOpMATkMbRvWAPdhw1b0v7urCSHv7QU6X2U3uWce3xIhC5BRQObeatmGbQm
	 6uJOxSbAWUYM86oWdW2xQ2KFDJrJnTyWq9twEoxOkiPL4+ELjd1dzNxPZ5A6Z/Q9rLA9W
	 k2nepDZWnkKoV1krD1RrTB3+EL3NjMYIz9+JP8JvNHb1zW6l44SBR9SXAnWsyoUid0hIQ
	 LJ3Sjp8DD87LzljsSTpvMNmH2chLSoDC66fHasnnQPopGi2nWQfFQ4MsgfxQP8YlQ9LPl
	 Poc38VRc2RLkNbhIS9IhjQ/8MJWGWRn8ERYKCRq5894lx65fqjuKdRhDDYS6QQFg+AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IcxkjBHup5sZEhtgWmpJfXaRSSMGBc6DzJDbIf6ZHew=;
	b=kkaf/S7/4XOKIGK0wCKMKj7Vb4FZp6E95owGoj6U+SIOX0BJG5RpjK89zzJ+jVLnnBcC
	 3k0OQK4I/UEjUqAsyR9GQmBXvbig8BzFBycQoU7kcYWj5XLJTIKNOWtBnVIGK6phPheMh
	 uVN0Km+LXGZCg6H2dLdvb/TkT5Ij4H4EC99ts3dk8KSClYXbuOIk4c85Ou9FITD2o25eF
	 7Pf05zKkuHepdujgpZAyYJGmQ+H/FriK8ZWK95MvvXHzQOGvag0NDtEt46KJrZzKmbU7/
	 7g4MY+8u8CrKg5PkZg865W/FuYJkSm1AMGNaFHEIYqrMGrtw62J7xSGbtEaZoJOEWzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dBr/0Bb+";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2313606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2313606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dBr/0Bb+
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so3465353a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794927236; x=1795532036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IcxkjBHup5sZEhtgWmpJfXaRSSMGBc6DzJDbIf6ZHew=;
        b=dBr/0Bb+hdm5ZUT3xp4UZz2XLLt/WRlAAT5R1y2ZnVq7W4/jwNXoayAVMZ2SCj4iBW
         b4V2Q5LCCw10lHqDFL+hd25tjoM79SokWeW48mSt5kk5Dh8FJPjESuaVXOzc0EX38LM9
         jo7/7Hh0lxoYOGIr7nfHu8RY9/sDG6CxojsYr+cn8r+qpW94GETsCOPURwPllE6TanA8
         ii4dTsS5fL/q0NKMr3OYIt2CulS316B+6cY5mX/cEz6PjotIBYhiNrW1uNhVhe8Iqgdu
         /dAsn6EOZY72xwHJD2dffY1fon+W7qRRscBsi0wa/XwyZ9u/K/PucgBsD04GwtrwDVMC
         Yvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927236; x=1795532036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcxkjBHup5sZEhtgWmpJfXaRSSMGBc6DzJDbIf6ZHew=;
        b=PqJib26LL3hlQBCpaIZA8G44dTRkFDP4vvB2CbWEqioxjbLfHM7svF1DCdnKVD++/H
         KCiI7OIFz0SYu0mLnq//aZdeYTSa9HkB+UB0bc1XSDeq2stbkIo1cS5wlcmruHVAAJYM
         kAczFMd8WFZP6jOziPcsTF3ufvG8xcbXbfw/KUffOccJdbPA59eUPXz8XtbLIFNQqtSt
         4+90VqjAz6ysfYE1GaEI3SwQGd2tWlMjg5WQ3LUGv5P2pwMjNrc6u83b0zHhE9tt39QI
         QwvK1nwZaJIPbPDos+unO0JTRl7aJxBmAZHNEYq9XLUb+XlWScygutG1wIBBRukDWgp5
         n9tw==
X-Forwarded-Encrypted: i=1; AL+hErGHMB/r/emr9c9lUINjQ2xGut3p8gjAejz/zzoxQQ+TJ9eEaCmYjAZeXc8CcdT00dLZR0ZjweEg39Zf1bs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SUmr9BEjPeHcQ5JYA2/usLkQjdp4VOtoiYyJHAnq7Mt8WWdYB
	pKORTsens6j6/fcE3EQh033kagb74jkYXfwpTyvcf4DGXSqeo/y3LIK4
X-Gm-Gg: AZFdTZeYdrH8nfvTWfw1/YeMHp2zx9jmD4TKz7u+joYkmMzoKfyyamQc0SFwFhQ4d+/
	HfSRicjrorx1SSO3RXz055vUPKU2QqDSAGw8d8ysjq/ur4+2fEtUHEJqYPVmhOtXt74kJYsi39m
	34YyqdcRd5NHaYs4P/89SeKeauy4jEdaHKPJsnz0uvqmqi0HysW8mDZTwcnvgPVd1xqC8kzbFtL
	MDRIqy4Fd73Y0o4Cb2mVae9QGIhw54f6bvdUKIxzyWOXdhHkAJhOTu7ytqPbMxD342XBEpLjDAx
	IInEbLm9EH9aIbotCXDOFyyne0m4Rd1ocpCcE+l6lnTdSM4Ycix13MfbdQc8/E5Il17xPhetZAU
	szQAUnVybjpUlMlZ6EUjBYfuJCNxlAgXPlfJvOxiP+glD1XUjOJHK0BbYa5GWfU7RxVHm5kT9tR
	Ak+/ImlxbPPSxCPbpGP5AIM6Ztu4ismT1yR5kkpkfPK6QEiSjZ3F2iI/4KB0xMXrF+3EWwW48vb
	NjJCLCooxxE5cBi3jcKL3SG4Tjj/r4XatlG/XFQla+Oo9VoS9zFTaBNT82+P04wzklOb/wAMy8/
	I83YplrwxlHxycQpmkGAv4rNni30z/nAlkREHKWpPKM6bJ6+njuBUljoT9KC6gd1BRaevEBDXxh
	eOPJ4U9o8Ce/aNxWY7i++qSf3rfTWRbL+8cHO/xWJ
X-Received: by 2002:a17:90b:4c0f:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b1b0b63d19mr13435372a91.47.1794927235946;
        Tue, 17 Nov 2026 06:53:55 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm11910657a91.1.2026.11.17.06.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:53:55 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: niklas.soderlund@ragnatech.se,
	rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: rcar_gen3: quiesce the interrupt source before releasing it
Date: Tue, 17 Nov 2026 22:53:48 +0800
Message-Id: <20261117145348.1092528-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

rcar_gen3_thermal_remove() only drops the runtime PM reference.  The two
threaded interrupts are left to devres, which releases them after the
TSC objects and the thermal zones have already been freed, and the
device keeps raising interrupts because nothing clears REG_GEN3_IRQEN.

rcar_gen3_thermal_irq() walks priv->tscs[i], reads REG_GEN3_IRQSTR
through tsc->base and calls thermal_zone_device_update(tsc->zone), so a
handler that the hardirq has already woken can run after those objects
are gone.

Disable the interrupt source for every TSC first, then release the
interrupt handlers, and only then drop the runtime PM reference.
REG_GEN3_IRQEN is only ever written by rcar_gen3_thermal_init(); a
concurrent set_trips() writes REG_GEN3_IRQMSK alone, so it cannot undo
the disable.

Remember the interrupt numbers that were successfully requested, so that
the partial-probe path, which also ends in .remove(), only releases what
was actually registered.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

This revision also clears REG_GEN3_IRQEN for every TSC before the
handlers are released.  rcar_gen3_thermal_init() is the only writer of
IRQEN; set_trips() writes IRQMSK only, so a concurrent trip update
cannot re-enable the interrupt source.

Testing: compile tested only (arm64, gcc 11.4).  No R-Car hardware was
available.  The partial-probe path that also ends in .remove() was not
exercised.
---
 drivers/thermal/renesas/rcar_gen3_thermal.c | 25 +++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 9c64cbc2ee67..35bb49915a75 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -110,6 +110,8 @@ struct rcar_gen3_thermal_priv {
 	int ptat[3];
 	int tj_t;
 	const struct rcar_thermal_info *info;
+	int irqs[2];
+	unsigned int num_irqs;
 };
 
 static inline u32 rcar_gen3_thermal_read(struct rcar_gen3_thermal_tsc *tsc,
@@ -468,7 +470,28 @@ MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
 
 static void rcar_gen3_thermal_remove(struct platform_device *pdev)
 {
+	struct rcar_gen3_thermal_priv *priv = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	unsigned int i;
+
+	/*
+	 * Disable the interrupt source while the device is still runtime
+	 * resumed.  REG_GEN3_IRQEN is only ever written by
+	 * rcar_gen3_thermal_init(); a concurrent set_trips() writes
+	 * REG_GEN3_IRQMSK alone, so it cannot re-enable the source here.
+	 */
+	for (i = 0; i < priv->num_tscs; i++) {
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQEN, 0);
+		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQMSK, 0);
+	}
+
+	/*
+	 * Release the interrupts before the TSCs and zones are freed:
+	 * free_irq() waits for an executing threaded handler, and the handler
+	 * dereferences both priv->tscs[i] and priv->tscs[i]->zone.
+	 */
+	for (i = 0; i < priv->num_irqs; i++)
+		devm_free_irq(dev, priv->irqs[i], priv);
 
 	pm_runtime_put(dev);
 	pm_runtime_disable(dev);
@@ -504,6 +527,8 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
 						IRQF_ONESHOT, irqname, priv);
 		if (ret)
 			return ret;
+
+		priv->irqs[priv->num_irqs++] = irq;
 	}
 
 	return 0;
-- 
2.34.1

