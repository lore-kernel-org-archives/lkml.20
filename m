Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204438;
	b=fl7o+rgdcqvJdaNszYmOFD4B0v3hWmeNjlMyip0Tinz237YsdjabNjEuiobhKmeoocWu
	 5Qw57zDcR2XwU5+zryV80qMo1k0m8klo8tTzQnU6CeS4HIGNba71d/r38xcQFG6DvWd7N
	 5JOTInO4M3rfQc14geHRFFj1yVTR0QLQ28+iQGXxG6SVa68ZZ+ZmrsNRI0uDdDLrCmyTt
	 DDOmf6Qrfk+QB85gST4Yn7eJkbwdeqeGf8tsfgEOmYhrycEjURaLfKahw89/luMTcR/HG
	 R6l2C4UG8xSYwFAIUJoHuaYfLl0PmiZdmyyA8eigeF/v8HC13BEwvK6IiiyZ0zw9Gmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2Hx/ir9n6/52Xt0z/1r5+TdJ8onrgSGbL4t23XE1gKw=;
	b=bw3raRAJDPx81xqzwtSJOVZYBzvM+bsnjyEXi6EG1+xEjWHtQRt/A/wz5GXsgPgZH8Hp
	 bIVIQ6KCt9W2+7aA/+AmBcsxj7Wm2G31dcwjksw/i+MDy/qw8ED/1axBZ9+2QwRLHlze0
	 vKGSD/vmQo87YmGFwQ4UQ3FfKC9klQjP8kVYaBzyL1httVse9xCv//ssaH7zLEbakrTei
	 vJXBxxAn6lyyPQ+jR5B0zqqlKctVRMvnxmZN6fcfoND3RJ0FcqxRRV+vaGpFe1YW/hVqG
	 MD8uwWnmPh18ATMjCdlq0sQ7GfY4dTOBb6m59N+aZRSek61UPZAvCqLW7M2OsyuElKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4LV6iJe;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E900606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E900606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4LV6iJe
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1226094eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204438; x=1794809238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Hx/ir9n6/52Xt0z/1r5+TdJ8onrgSGbL4t23XE1gKw=;
        b=s4LV6iJeGf04TyVRnrUEBWfq2NfS9J/UPf/nstbpSmtfW9dsoCj7dYG8cGieq76olq
         UBtxibZRLZrEuyGSej3GSuuaVUDOSYpPgS2pomNyS3E9CepOAEmykyVbAqV/aRRN2vr2
         OAbW3tUkonU/C5o6XhDWkmXqoREh3n7FoqbmKnrQjPL/dGQxW+06hFz83bmpyoSYfx9A
         0H876bNxiOT4xg/6Lk5ZrNkKouz1xfDaEdWhGUVbNbMTdTYKgG5WfxaoBtywj83hapHr
         +LAJ+6FQ1coQX7H2J6cvfrngNV5CcpQMCIF/onOlrAHOGZBR15M1OgrqT06rr5ZQEQ4u
         MuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204438; x=1794809238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Hx/ir9n6/52Xt0z/1r5+TdJ8onrgSGbL4t23XE1gKw=;
        b=gRpQq+WXM9pKrOEzsupNK1ySTO5M/yICcKypGvG3sPOjiDVASQafaa9TdRQ3Xqi0KR
         NHkslzQUuQzVTHsM1oTqry7tFXJ7T4/zC6joulywVIhYFmyUX9x6EDi5DUhBkItsQF+9
         to7eL7hiYUEzZNAx02b3N95FSW1fxcLoNLUada5n6YHq1Q4ZzZcixCSrHcGnh66Pw0UU
         UTfu8d9x7r9t23MpCdU31dcEV02mWzFaNUYZCuti50tCX/cfmQt9TU8Xvcn9t3mAt+ZA
         SdHQzqTTzPxTxxpp8JXHw1q4/EFLUJa11rxW2ISRz75nxpHs1D2UwEIRwmE4Z5vCYvvd
         XEAQ==
X-Gm-Message-State: APuU4Z/hl/KaiQksbwngCleUJl8kWA796h+vBlLbNTZI8OzETDls6Tr3
	sLznc/UhKCX7IUeKf1WxzOgNx8GtDg+qDgAI5zeMt74AU6sF8JFu/dSu
X-Gm-Gg: AYBFou33bdlwY7ZmsifUBlnMxMrR5tjNG63UJBf/xaybm6mTH9zAgqcUsVRJ394kEyp
	XvC+86AbV9O0NOi+4f/4szk8BsLdBYHgcTZCazf8AVflI89sKRRLBMYsYt38aJ3lVJKHhavZ4pn
	xjy8eUdUIFkB9MTrBNNIcrnnN27eWjaGKST+gjSZAUM5adLEzkfukJuXTd8ltuCbmKBMfdsevW3
	1Q6VrYTC9wUPvkXrLuIlUR6IpvM3ALRiB0dgiKIDmgqIK3Ssv6+A5+5lfYFjL1UXbqqrwwRN2Pd
	Wi6zgXQKugpIbF+WX3kVKANZCJhA4Wfhy80XBPT4re75ip0oSFl+nQdQlwVz93VIAex4diHcbBO
	7dg1kpKqSCq8dFBnoOZcEp0OHKSxLbWdfLdRI63Yef/7q+kiKwrUDjr6GpJyKjeVrn0CZtaqjcN
	D8RSC3eScFCIhSTFfbM7N5NMfC4G5i38Tu1kO+mVIDyR7pE5Cao3yhodHVraBFkMvDMWDsEU23r
	jno/Zjwm7I4RA2ipgqVsnNitTorKWpTtFQCi/kff9gR0I8dmh7UzXbEvmBhQL7csvHTqD0XePQc
	4Oe5W+XwX6UGZEov9HLn2aw8vzQylHVP+jPeneTMkCL4jIlZ23SxYL2dILbBXkB31fOhgw==
X-Received: by 2002:a05:693c:6203:b0:369:ff7d:840 with SMTP id 5a478bee46e88-3725e142d96mr8228165eec.21.1794204437459;
        Sun, 08 Nov 2026 22:07:17 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm10728942eec.12.2026.11.08.22.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:07:17 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Niklas Cassel <cassel@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-ide@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] ata: libahci: delete the SW activity blink timer on port stop
Date: Mon,  9 Nov 2026 15:07:09 +0900
Message-ID: <20261109060709.1231946-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

The software activity LED support arms a per-EM-port timer (emp->timer,
ahci_sw_activity_blink) from ahci_sw_activity() on I/O, and the timer
callback re-arms itself while the LED is blinking. emp->timer lives in
struct ahci_em_priv inside the port's ahci_port_priv, which is allocated
with devm_kzalloc() and freed when the port is torn down.

ahci_port_stop() never deletes this timer, so when the SW activity LED is
in use and the port is stopped (driver unbind / module unload) while the
blink timer is pending, ahci_sw_activity_blink() runs after
ahci_port_priv has been freed and dereferences the freed ahci_em_priv
(use-after-free).

Shut the timer down in ahci_port_stop() before the port private data is
released; timer_shutdown_sync() also stops the self re-arm. The timers are
only set up (ahci_init_sw_activity()) when ATA_FLAG_SW_ACTIVITY is set, so
gate on that flag and skip slots whose timer was never initialised --
timer_shutdown_sync() on an uninitialised timer trips the debug-object and
lockdep checks. Sweep all EM_MAX_SLOTS em_priv slots rather than the
current links, so a detached Port Multiplier's fan-out timer is not missed.

Not tested on real hardware (needs an AHCI controller with SGPIO
enclosure management and the software activity LED enabled).

Fixes: 18f7ba4c2f4b ("libata/ahci: enclosure management support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/ata/libahci.c b/drivers/ata/libahci.c
index 001a6f5e4172..3f6844acb413 100644
--- a/drivers/ata/libahci.c
+++ b/drivers/ata/libahci.c
@@ -2605,9 +2605,32 @@ static void ahci_port_stop(struct ata_port *ap)
 {
 	const char *emsg = NULL;
 	struct ahci_host_priv *hpriv = ap->host->private_data;
+	struct ahci_port_priv *pp = ap->private_data;
 	void __iomem *host_mmio = hpriv->mmio;
 	int rc;
 
+	/*
+	 * The SW activity LED blink timer (emp->timer) is armed from the I/O
+	 * path and re-arms itself, and the ahci_em_priv it lives in is part of
+	 * the devm-allocated ahci_port_priv; shut it down before that is freed
+	 * or it can fire against freed memory.  Only slots whose timer was set
+	 * up by ahci_init_sw_activity() may be touched -- timer_shutdown_sync()
+	 * on a never-initialised timer trips the debug-object/lockdep checks --
+	 * and all EM_MAX_SLOTS slots are swept, not just the current links, so a
+	 * detached Port Multiplier's fan-out timer is not missed.
+	 * timer_shutdown_sync() also stops the self re-arm.
+	 */
+	if (ap->flags & ATA_FLAG_SW_ACTIVITY) {
+		int i;
+
+		for (i = 0; i < EM_MAX_SLOTS; i++) {
+			struct ahci_em_priv *emp = &pp->em_priv[i];
+
+			if (emp->timer.function)
+				timer_shutdown_sync(&emp->timer);
+		}
+	}
+
 	/* de-initialize port */
 	rc = ahci_deinit_port(ap, &emsg);
 	if (rc)
-- 
2.43.0

