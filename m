Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793457681;
	b=Y/9xVlE4KNxc4wDVTW0uB0EMwr4+MFwUMGeWsNZniG+smzBKMTtPvggGn7r+c95vaTJp
	 5tcmsSyB9HTWMK8vytPQ8068gkvzqrGCnyuMMS/A10VMcKgDjxZqfmqGPpostTpI4Lx62
	 jF2Q+Z/fiR/XM2RQynj3Gku69o3zgEqQs4P/B7D9b4KfzDoGR4OptkIY+xhdipM1T9j3G
	 ci+dMdWc4B4t8/utQHzfM3zTBoN1Y5CSHLqrLy1k5nDl8lW86W6k2jtxOdj6vox86nP0c
	 KEbHM0A7V2g2fJxWmbi/Vgc5tq7YSiqTfoqBR1CMADOT2tAt8A41t+POhsfF5NBfjrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793457681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oCTOQEu19vJBXJZSzplSgZ0tLJZz7jYyxcdF5qx0J8A=;
	b=CMmncW2R70rxYtzjwz+czqIafZvG2Lsh783mf+QI1kls1riphpMs/UGOAh5ZX+xzoTji
	 /1BDKTtj3LxMddAedwbFjh7U3SKWakJLCjJejF4IebwVGNILeVVYoTWrVCE8CjTxedqZn
	 XCpyY0YTfAr9mH6oAY73JFtFEEcGMC6JOnsTzuhaWdNLK/4J5MTaF5bqILBnw2UJ6aYx2
	 /4LaQaup2Df0CwqHcVbVax+qPVrdexfOuLdAtHKJ1BiULzo6lKZ6DmaNpd40SFqQRA2rG
	 R8VWNEx04d9beomv0MA4tcVmjLO+pYG4VqwRKnzChA9rnUZ5wIfBAt2OtFBA+Ukf9Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+0Zn6Lp;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DFF606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+0Zn6Lp
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so18477065e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793457679; x=1794062479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCTOQEu19vJBXJZSzplSgZ0tLJZz7jYyxcdF5qx0J8A=;
        b=F+0Zn6LpVJkO0s9itSEl6vzhKyFlbNanlpwhwgkV95PMhEQYnpfvCMwa8aXCaV7/C2
         b2s6hpnG07tyt6seYAbyNM7h4of6LC+dOWMG1XfIs1uoPUlRa5/WUtxpdyk+1hcqZJ6S
         yo/cuiIQ82FH2/MzEkAoq1BGGhXsws1Tsva85OiEYDyl1sm4cs2IFxBQ6QqkLJldCAcM
         IGGP3zyq8IVStMNZ2+ETWO0g8XNRdpo4inmSaGgNahygeF+nOnfqfGTudVtt6iVv6ocU
         YAzS9Dfj5uPrio9CTuKUOI/AY74t3jIeiqw0wbRT1d+KjM0K9WOKZi7kv7J8gVojnZmn
         xo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793457679; x=1794062479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCTOQEu19vJBXJZSzplSgZ0tLJZz7jYyxcdF5qx0J8A=;
        b=CXKJOb9pdSyN10oqOIMm80e9Z+wK/UJWRyVyqloqq7NiCtxSVmpaZkfnW98V/AfxKc
         waXOFNxMvtyQ/EfcalL94ejJBHAJhVK4RC/0IUQomyxb+EsACpY3bQv9U3Enp7KVV5DJ
         /4kGeVbid5WOtm9fN8YR+G7uoUPKHyab7oRCJgWeV7wNAyzkJSDE3mLE5STY1AxP/C6t
         KjYO8F7369gidtbZmZRDUQBc0IwrWrqPK814/xJs6yho2PobVFkzGpBwKbF58W3zsau2
         Q57I4Xv/kYWPKzT8Xy7NWGwRu2VpPozQdfYOJ/d9J2V608hK+8V+RoyYvrEhF1iqrYjz
         O9aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmc2CbeJUNlNYtMxgH+YTVPeV5bghXyVlRDZb+gMsyLMz9gN+SLS3LavJ4QFaEr4BxJVbMQI3XW4QgsIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuk1xJ3tWEI7V3rvt4M3/aEORTw63q+yCP7Gkq9A6iRXnXKsD2
	U4LCdVPGLAryxVu28DC0I+YAHHmcuNNhBfIwQAoRUJ73L8xIZfQ1wYMh
X-Gm-Gg: AYBFou0U+pa+PGGQ+z8jsD3eiXhmVGLe8nKre3WH3wXs1T43JFqk87ZZS8FQmvDQ4XQ
	7t+CDhWLEBUWF7gnSmzXmyU7YSv2BmgQqacye0f0adHrnRGh0bstXyPX90jGgKnOakX0nznV99q
	E7Rjdw/9697R6HB8kphPggivhxlPfKAT0hSQb1PjqB3FCU4qT1SF02hS2TXKpSt49RNXAGdFPN+
	r49zXczH25W5+Ss5Kt9hyQeNyTMEZDS1MpgJmhUjZJ57dX10LISxvN68ZO8UO1weeUaIhhyyFKe
	rzhhP0XcILf0FBwy1bmv1sYFx/s8a6VwNjKJzN1rS/KlsktUpXX7uraeHrYJl7cffn8t/KyAymu
	G51j65PNBdOOdn2p/0CYajGbH4vOvMwB+KMXX2y3eaRAV2zRFRSaW8XmtmLipQK+5UGP9ueHaRe
	qaWnjuzhBjpAelczgK0shrjb8zvpEHiI2O/DeHgzW4b6dRgYrrxe38zzD1j7TQeywwPVVwXRdnB
	xksvMhPA7HyxEwFzEbNp/tCEWTc1KDkBCJcFU4rg6p9UpGV2TFWIxMdOABlKW7niJvOsexd/x5D
	E/QVvVBA7og5cQs6Eq8ZXOKqCThXyIL6imzyk81agaRC
X-Received: by 2002:a05:600c:4e12:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ac1765cf2cmr129879855e9.19.1793457678846;
        Sat, 31 Oct 2026 07:41:18 -0700 (PDT)
Received: from localhost.netbird.cloud ([94.242.199.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm132090535e9.9.2026.10.31.07.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:41:18 -0700 (PDT)
From: Andrei Galiant <zakat1984@gmail.com>
To: linux-acpi@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Galiant <zakat1984@gmail.com>
Subject: [PATCH] ACPI: resource: Do IRQ override on MECHREV GM7RG7M
Date: Sat, 31 Oct 2026 17:41:15 +0300
Message-ID: <20261031144115.4189-1-zakat1984@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The MECHREV Jiaolong17 Series GM7RG7M (TongFang GM7RG7M, Ryzen 7
6800H) describes the PS/2 keyboard interrupt in its DSDT as
edge-triggered, active-low and shared:

    IRQ (Edge, ActiveLow, Shared) {1}

The keyboard controller actually asserts IRQ 1 active-high.  On AMD
Zen systems acpi_dev_irq_override() skips the ACPI IRQ override for
GSI 1, so the IO-APIC redirection entry is programmed with the DSDT's
active-low polarity and the interrupt is never delivered: the embedded
controller still scans the matrix and places scancodes in port 0x60,
but atkbd_receive_byte() is never called and the internal keyboard is
dead under Linux, while it works in the firmware setup, in GRUB and in
Windows.

Add the board to irq1_edge_low_force_override[] so that the standard
edge/high override is applied, matching the already-listed sibling
GM7XG0M (Jiaolong17KS).

Fixes: 9946e39fe8d0 ("ACPI: resource: skip IRQ override on AMD Zen platforms")
Cc: stable@vger.kernel.org
Tested-by: Andrei Galiant <zakat1984@gmail.com>
Signed-off-by: Andrei Galiant <zakat1984@gmail.com>
---
 drivers/acpi/resource.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index 56df459..0a944ba 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -553,6 +553,12 @@ static const struct dmi_system_id irq1_edge_low_force_override[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "GM7XG0M"),
 		},
 	},
+	{
+		/* MECHREVO Jiaolong17 Series GM7RG7M */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GM7RG7M"),
+		},
+	},
 	{
 		/* XMG APEX 17 (M23) */
 		.matches = {
-- 
2.56.0

