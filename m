Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857735;
	b=vigChZ6MjPomMc31kQyB5Delvyx8lkb+m7oOSr7xpJuhKro+T0/ISekRjLFyv0iWVGDT
	 WHdm2k2aXkinhKz+/JBhHezW+o+f04y5WTJJ6L0scyPwGGlvrm8S2OKBu38G4sB3l/aTf
	 G2H/x+nhnGNYXt20hxScLO5S5uCHTfv+RFlOk+3QYfW059sgoXna5S7mrwpjja07sLCP5
	 W3NJCQRW5Xy/S11m4zv4z9qW/pV3XpOKfy89JuNaNIB8bP+zc1Y9WQfmeNKeds1oi+Tpe
	 Xpp4Bma17JwfI5v2jl2wmk3t9TP7PZQX7ror8DOmZ96hqaJdEXxZ80dDWY1PHXAjzUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/tLj2CYL+xeFoB/kDteydYBzhpIqHWBZsG7xgIdv21w=;
	b=j2biy+I7JzL6QXuLNqWp19r1bfa3e862BNa7r1ccbneNw04RFZrwXtIOdMnaq0qkQ1F6
	 MtQFVrHFrGPi3zVfUntDix4klSdpu8EVJvaGYRTQU+HbBHbBZsMYAOU/fO8htZmAVvuTn
	 /wpXjijByxznJJzp5y1q2tCyIc6tq7yE3sY67ssPV8ofadDwfKo689IBzJzF/bsKRX2B3
	 I3RSgHFxh/gwm7PAFIgq+a+llNtz1/hJtim0TdMiJVOyJqsHRqw4GAsRGrVyvJkSvRyvk
	 8a6c3qJergGzQihG40hFl11qQruEKRyyWjbGZ9dZ9qWfOeJLO5ShEKB9MkBnpYmNO9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hwQcSTB1;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124CC606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124CC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hwQcSTB1
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so644373a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793857734; x=1794462534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/tLj2CYL+xeFoB/kDteydYBzhpIqHWBZsG7xgIdv21w=;
        b=hwQcSTB1rtvVSsJLuT5CEar20rpGeR11znLLq/8YGPN+em4gayJ5i8tJGd+z3PzTaT
         VJwbrWgZRcFsGpYhTN1I5ZcN3Xnlv7DLr9/qnboc7riIvUyvtKGIfsqLlbly85galEJy
         N8aW3KLi5qbMK4baEwzLU+hCIyj4fPPfXmD0NF6Fj+7K6fsv2+5J71rm8lDFIo3iAtJ9
         LzFBdTi9DX51vs9FJ0IpLuriTPCo68E30aE4JUo3c+JYgpMLRzRTN4hY07gk1IFYSS7p
         z2OS8uVrIRx2xZI2iYqFWcvQgGZJU2hJIQ/TsllEi+Dehg8/QL55Ja58ivX6FBTeOOAO
         AZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857734; x=1794462534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/tLj2CYL+xeFoB/kDteydYBzhpIqHWBZsG7xgIdv21w=;
        b=q2WQqctXLhO62PfhK+Q0cTVP82f1BtFY7AEzA1Xr+QvF2Kx5c0t/u56T28UbnjisH5
         dHEOfEFQsZcQWD5vY/qSVshUN3DiezhK2BRIQqdlE8xAF3J2owfSjVyL41FN6DKeQfrD
         M2KZkrRyxMIIxKvhrodXu9lN8Ao0p0t482MCeO0ve6wWq7uckQiE5X9UsSfKGtb6hv8y
         Y7kJBU7Idlx7DLFPsCAdwNP+2pp91InbwoYpVgKa3SLealwMFA0i95qP9vDwZcQv6Ayz
         9Gr37S/ni194hu/FELiyiub55nuz5r85CJy7TxIIs2A+rXX46At2FxjiGxFuEty0RZ/i
         a5uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL9VBthvR2Ju/Z5abr/fSo0iCzi5Pb0AkxdL1rf335/XOCeUOhN/dJseFOAvziT/Z9TGaPeRxFHF5M0D4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SZhCth88l6iEtb/NHdE3BC85ltoI7CWCs6oIP0l91P+cN3d5S
	pyz/CVakWNAi4OCfX23g4lc89QA93t2Qgpk2lgKzhSrW6Duw2Zya4EoxUwqisXEz/g==
X-Gm-Gg: AYBFou17MM5rw4643gjg3P+3MOs9NrcaXj5YfwpIh8WRuNzRCpGPq3OxDAxEsU7YABy
	N2zDX5+c1KkiSNiZouXA+vIG1yUrtcJme9ohv4XnIoY7BTroQ05Q16SK2eJJZf0BhkFHdEHp0DE
	k+n+eL4fD9oH1Lsgo/WpCc78VLLi4EPw5eIMJpWuwhaLdiXtIPNSutVF4OEZVeY+mH6vnUrk79p
	xFL9NXAYkwPxsb37g0+3WGQYnfokafGZ4c94FZJJrwMtFmLNimMcUAueBhuZ1t0SCUQ3WFFpz+q
	ZFzT8jlmUw6Bobxl72bPULpFc1SmJgor0UymBUA119xZUhrxDsgkXhKipQdpEQQ6KWmKwWVqyUy
	3jV056W1PmfZMJx73tUUO3mXEbhkkirOeIBwM5gHXVcDPQkxFnpXvTqIPgQWbYJ/W//cQt0ARdp
	HsWxqxmylJ2Cg5kq3ZSmblcbwpQEp70P+H8ASOQV9ifXcMnpQnQtioD2PeUbE0BYffGThK/r+x0
	EBo1EOoVpSCBJ8lQtk21Ec/KI3ZaOCnfR7eULWCS2nmkeNUnM0EEF+Op55UYhYBCm+AgaM5LK5T
	CkBQblH8NrVCxoeGSO8ajpETSNt1vUgjUhCy/LiotLXyy3IYgtwBU50dmu6WHJhAJx+qJ73vi3e
	/EFZ5XWEOcvfnm2aXJrPRrkLE/tv1ar+JNbGcsAA=
X-Received: by 2002:a17:90b:57cb:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3ae897f6192mr15189506a91.26.1793857734239;
        Wed, 04 Nov 2026 21:48:54 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b319f2c9sm1989676a91.10.2026.11.04.21.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:48:53 -0800 (PST)
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
Subject: [PATCH net-next v3 1/6] timekeeping: add ktime_scale_raw_ns()
Date: Thu,  5 Nov 2026 12:48:34 +0700
Message-ID: <20261105054839.2248046-2-jjc@jclark.com>
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

Add ktime_scale_raw_ns(), which scales a duration in monotonic raw
time by the frequency of a given clock relative to monotonic raw.

A PTP driver that takes a ktime_get_snapshot_id() snapshot around a
hardware access may know how long after the snapshot, in monotonic raw
time, the hardware event happened. To shift the snapshot's time of the
selected clock by the same interval, the duration has to be scaled by
that clock's frequency relative to monotonic raw.

Scale by tkr_mono.mult / tkr_raw.mult of the clock's timekeeper, as
adjust_historical_crosststamp() does. For an AUX clock this is the AUX
clock's own timekeeper.

Signed-off-by: James Clark <jjc@jclark.com>
---
Changes in v2:
- New patch, used by the ptp helpers in the next patch

 include/linux/timekeeping.h |  6 +++++
 kernel/time/timekeeping.c   | 54 +++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
index efa9442aaeef..c3737aa844f8 100644
--- a/include/linux/timekeeping.h
+++ b/include/linux/timekeeping.h
@@ -366,6 +366,12 @@ extern int get_device_system_crosststamp(
  */
 extern void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *systime_snapshot);
 
+/*
+ * Scale a monotonic raw duration by the frequency of a given clock
+ * relative to monotonic raw.
+ */
+extern u64 ktime_scale_raw_ns(clockid_t clock_id, u64 ns);
+
 /*
  * Persistent clock related interfaces
  */
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index dcf47f1ffdcf..a6e2d2b8642a 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1335,6 +1335,60 @@ void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *syst
 }
 EXPORT_SYMBOL_GPL(ktime_get_snapshot_id);
 
+/**
+ * ktime_scale_raw_ns - Scale a monotonic raw duration by a clock's frequency
+ * @clock_id:	The clock ID whose frequency to scale by
+ * @ns:		Duration in nanoseconds of the monotonic raw clock related
+ *		to @clock_id
+ *
+ * Multiply a duration measured in monotonic raw time by the current
+ * frequency of @clock_id relative to monotonic raw.
+ *
+ * Return: @ns scaled by the frequency of @clock_id relative to monotonic
+ * raw. @ns unchanged for CLOCK_MONOTONIC_RAW, or if @clock_id is an AUX
+ * clock that is not enabled.
+ */
+u64 ktime_scale_raw_ns(clockid_t clock_id, u64 ns)
+{
+	u32 mult_sys, mult_raw;
+	struct timekeeper *tk;
+	struct tk_data *tkd;
+	unsigned int seq;
+
+	switch (clock_id) {
+	case CLOCK_REALTIME:
+	case CLOCK_MONOTONIC:
+	case CLOCK_BOOTTIME:
+		tkd = &tk_core;
+		break;
+	case CLOCK_MONOTONIC_RAW:
+		return ns;
+	case CLOCK_AUX ... CLOCK_AUX_LAST:
+		tkd = aux_get_tk_data(clock_id);
+		if (!tkd)
+			return ns;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return ns;
+	}
+
+	tk = &tkd->timekeeper;
+
+	do {
+		seq = read_seqcount_begin(&tkd->seq);
+
+		if (!tk->clock_valid)
+			return ns;
+
+		mult_sys = tk->tkr_mono.mult;
+		mult_raw = tk->tkr_raw.mult;
+	} while (read_seqcount_retry(&tkd->seq, seq));
+
+	return mul_u64_u32_div(ns, mult_sys, mult_raw);
+}
+EXPORT_SYMBOL_GPL(ktime_scale_raw_ns);
+
 /* Scale base by mult/div checking for overflow */
 static int scale64_check_overflow(u64 mult, u64 div, u64 *base)
 {
-- 
2.56.0

