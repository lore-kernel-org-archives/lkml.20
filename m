Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857741;
	b=aJVQVaeKWn/4amwWotQG1D9DEeOjBuTjbRkbx9lYqqvGP2wCN+QvJdOqzJ7U0G+KBTrF
	 QUgn/+aCRiU0uHOitjxvwmYzvja0zTHxo2voWmMmSTLenkhREj4n10YmiAOD3QafCu9kV
	 tQUKIsdqdXmii38mlyJWd62I0YJOQr/yTp6YhUtxQUripiKiyqvzXh3f5HKui/vLMd70+
	 9Y0CZL5X8o1tN3vDKYnqK4Lc0CIv40iefvZTCMGqDVRIae/KCtFwBZRywYeTanR4Ro0nA
	 kEVVoPdt+Og+jZv44RZe6acgBzDxo+KIHXNVDCgDBQ4Dlrz86p/LOn0U1a8NKIiIXjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7vRCSNcyZCs3Byo+z/ZAnwu5XcUvruiiG1cQha9Q2S4=;
	b=Cw21FeUmkBL85hGyMt0cIB9UOeWPlzB1tNs6YiAsu4zi+Cauctr86siszncALe2I2uGt
	 kSqPTrb6SbzvsrZV8K6xX9ru25vSS/3Q0Mv2ET7adHM6qEw5JZF3zl7y177FgUNpHfNp6
	 lYzC2pgbNA5iou5nltZFlmqkKRkEav6mYJ8KeV2jvvd5HRGl0MgKdIXITJHfRy03YBxpz
	 r9XCwMG38ko50mFa3bAaf+s4IRGxduLf2gwKFt/oBxlPL23zSfKcmnRwFFIIaVtgohcmv
	 i5E+LCosdgGCstbzwY+jauEi8BNNCzj3qyt+VGF0PfxNqa63xE0kO8J8KZLny6sgT6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VZvLZAcD;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580E5606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580E5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VZvLZAcD
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so141545a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793857741; x=1794462541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vRCSNcyZCs3Byo+z/ZAnwu5XcUvruiiG1cQha9Q2S4=;
        b=VZvLZAcDX/9Zig8n+WP3af6cqSzQ9xFLCzOecmHMvPvnbKelKS6a5KSssA33wAcwKN
         j50Gsh3bUwV1sjj2G+afpF+EDM60oWhRaYs5KbjutXmgsMvk2jhfc1KhsDzksERgp19u
         3NW28rwInhnZH+UvIZF4tJEUtdpw1lPFj8kM8vha7aUQjed0hoVy/xBj240ybYsoAqNo
         Mp83HFdzyU0Apdz3slFknlCMhZOhXXPpEGIdF9G8s3XLHRpIA9dIENA8vtFuiWnaWk+z
         Cx9nKw0tdzy4hzwDa+At7sbQSwkp1Xti+NBUepOyrcvIhlgFvPgODKVIfbTICraghFoj
         69+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857741; x=1794462541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vRCSNcyZCs3Byo+z/ZAnwu5XcUvruiiG1cQha9Q2S4=;
        b=bMnkGdCPTGzQKps2H75DD7zkRkoqfyP0388u+7XKvCw+po/f81V4HXsgpT63WYv1UQ
         gFFqVI0sgzZ+lakoAwduTS/O2i4hT0JMjMAGZPuEPQrKvl3ap/TKlZ/lBZW1OARjdBzu
         C7ksB/MVXEfOJyf6EtocBnUHYMuEaH8NwYCT9cQuZW2dj27CIC0eAjKHQ49gcIH2GwDE
         vg9v/v5G8XtAuMx1oFPFKb4sJwWRO2Yh01XmFRc4nO9+Ax9gxICKtp3sjLc3PoQruJU+
         n0n9+zbnu45UDEVuhcTF7+BjdYreb9SRai6HTL2szga7LkUaT4+UiES3w5ikyb8Su58t
         OYoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdDdH+DHjSLS/FJ5W+QSnVyy46qXds++JdFUOgnctVWui4ugDWUbrKmjKokFu06rUh3Qa2iCKkdTYif5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X0ZydFE/TLMHhOq5a8WBX88qcquuObbcb1IMwjZU7fD0JYItf
	TFTmym2mnSEm8oS4Myr1KkAa98eJ6FXx6tVSIT6sNesXZtTuGX21jQ7vTKpvc9zetg==
X-Gm-Gg: AYBFou3EMhzhlXkaVDmwjqpMDmrPq2mYrYNZ9VgxRIa2DkguZj1wHuQ47EkaOBccHah
	2wAHwW5jVie6B/WTusRzB8ip4IENz1k4dDloyC1QD6cmKK+OGPNaeEhCzoR+L3U2YKX0MD4GYig
	n5VOYhf9VB6sDVD2xhLeI8Ofk96lNpxj5cmQtoKKyDZ9MpgMOOw60o6PVmwJyjsZSFuJbAN21Hz
	crLQUY+eCf5SMt8be5yZUbQ3kfPImyRAA9NwVtEIJKnSmeeI5tL1vRW9G9y2H+jxE/FVz8aqLBs
	zxAtWVREx9/wiyfWNYj5niy5mlMP2hbcdTBz1dNtiIAPX2Z0fWPd4RmYPTYzPdfRRZQVyibzpmg
	2yzt6cEiRHqcLVdpHLMD3DIkLUS83NYWg8tBb18AR+M2+FS1fUUeNe+IfJEC5jqY7SJkglAkcC/
	chVfXKX6W6pp1Rlxe8YokOcP1nbA2K1yWFHGBIug1Gz2OlmUnHAvLIB9tBYVKVC1dUY0c1qwhFS
	8F6LJPp3ikECnIfdeTF6KjGd9dN6dMZvBIpjwtMsvCconfD2btq5irlGncFYE1rsDnB9gX0Z8uH
	SYEn5zAzVLYXfXtvUxwTarrSR4NxZLYc+58gEWQFtj8BTbgmQmfk8P2fTpXAXu3+C4ojpP/gVjI
	yOPT378i2HRnMZsn3C54eDZSxtbOU8x7LiyQ7OwY=
X-Received: by 2002:a17:90b:4486:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b0afbf69a0mr944027a91.8.1793857740594;
        Wed, 04 Nov 2026 21:49:00 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b319f2c9sm1989676a91.10.2026.11.04.21.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:49:00 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Hubert Feurstein <h.feurstein@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/6] ptp: add functions to adjust system timestamps
Date: Thu,  5 Nov 2026 12:48:35 +0700
Message-ID: <20261105054839.2248046-3-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105054839.2248046-1-jjc@jclark.com>
References: <20261105054839.2248046-1-jjc@jclark.com>
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

Add ptp_adjust_system_prets() and ptp_adjust_system_postts(), which
shift the pre or post system timestamp by a given CLOCK_MONOTONIC_RAW
duration. The selected clock's time is shifted by the duration scaled by
that clock's current frequency relative to CLOCK_MONOTONIC_RAW, with
ktime_scale_raw_ns().

An MDIO bus driver can take system timestamps around the command that
starts a write, and knows how long after that command the write
completes, so it can shift the timestamps to bound the completion of
the write.

Signed-off-by: James Clark <jjc@jclark.com>
---
Changes in v2:
- Scale the shift of the selected clock's time by that clock's current
  frequency relative to CLOCK_MONOTONIC_RAW with ktime_scale_raw_ns(),
  in place of adding the CLOCK_MONOTONIC_RAW duration unscaled
- Move before the mdio core patch (was 3/5), which now uses these
  helpers

 include/linux/ptp_clock_kernel.h | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/linux/ptp_clock_kernel.h b/include/linux/ptp_clock_kernel.h
index 36a27a910595..b952744ff696 100644
--- a/include/linux/ptp_clock_kernel.h
+++ b/include/linux/ptp_clock_kernel.h
@@ -520,4 +520,59 @@ static inline void ptp_read_system_postts(struct ptp_system_timestamp *sts)
 		ktime_get_snapshot_id(sts->clockid, &sts->post_sts);
 }
 
+static inline void __ptp_adjust_snapshot(clockid_t clockid,
+					 struct system_time_snapshot *snap,
+					 s64 ns)
+{
+	s64 sys_ns;
+
+	if (!snap->valid)
+		return;
+	if (ns < 0)
+		sys_ns = -(s64)ktime_scale_raw_ns(clockid, -ns);
+	else
+		sys_ns = ktime_scale_raw_ns(clockid, ns);
+	snap->systime = ktime_add_ns(snap->systime, sys_ns);
+	snap->monoraw = ktime_add_ns(snap->monoraw, ns);
+	/* No counter value corresponds to the adjusted times. */
+	snap->cycles = 0;
+	snap->cs_id = CSID_GENERIC;
+	snap->hw_cycles = 0;
+	snap->hw_csid = CSID_GENERIC;
+}
+
+/**
+ * ptp_adjust_system_prets - Shift the lower system timestamp bound
+ * @sts: system timestamps, or NULL
+ * @ns: CLOCK_MONOTONIC_RAW nanoseconds to add
+ *
+ * Add @ns to the CLOCK_MONOTONIC_RAW time of the lower bound, and @ns
+ * scaled by the selected clock's current frequency relative to
+ * CLOCK_MONOTONIC_RAW to its time, and clear its clocksource counter
+ * values.
+ */
+static inline void ptp_adjust_system_prets(struct ptp_system_timestamp *sts,
+					   s64 ns)
+{
+	if (sts)
+		__ptp_adjust_snapshot(sts->clockid, &sts->pre_sts, ns);
+}
+
+/**
+ * ptp_adjust_system_postts - Shift the upper system timestamp bound
+ * @sts: system timestamps, or NULL
+ * @ns: CLOCK_MONOTONIC_RAW nanoseconds to add
+ *
+ * Add @ns to the CLOCK_MONOTONIC_RAW time of the upper bound, and @ns
+ * scaled by the selected clock's current frequency relative to
+ * CLOCK_MONOTONIC_RAW to its time, and clear its clocksource counter
+ * values.
+ */
+static inline void ptp_adjust_system_postts(struct ptp_system_timestamp *sts,
+					    s64 ns)
+{
+	if (sts)
+		__ptp_adjust_snapshot(sts->clockid, &sts->post_sts, ns);
+}
+
 #endif
-- 
2.56.0

