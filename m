Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794124091;
	b=ZoLi93xGF5uuDjyBHQFRTpkz2jYGGFq0AIrmLPhIssp0VYpygz47TvnvT91ra9iM5R92
	 DiUAyFvSrpuT7Zr++WAR9yt/YakSq8uYFeNKuPQv5uKa3wy+GIM76xRojfX1CduDfmsRv
	 8FAWsveEbnQZERWcW+qB1K5APYLcJ6M/atHqlDCcTcQeNA9rsR37+fTQhhc9mpgCUZsdY
	 nsxhPkLkPBtTvH0ntUvoaJ36Vfl/r1NzJ44IPsiopi1uPtwtJze66+LDC5clNNa00Vxn3
	 34DFYJrIZ3SxAj6sSWDbUabgaERUVqjDog5odA6lDu8fj99kAbDmVlVRtVRvUdWNLUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JKSjiFFNXoaRnbhFm/6WIkvX9c59tRmnSx3Vjc7t68U=;
	b=OKD9Tgvx01eDFRMqqquiO+4L1Q52cIB4L91USFZhq3Vq7bveP/LXHFdBFK1RX2ppbK5l
	 aEbZy3lOJ7iCCvWGY5WiH2vEMRnm6scy0yzyr510SXslbvPDRa+GeZEnV1ubFmCKKc/sK
	 RzEM9GQiwbL+++6NbSaHi2/1nHHoGq1ihCWZHQohxEx7MjA/qZT6YgQqsTFpRjrXRhbL4
	 IDNdTpN6Dz1R6Wdq2U/ld1Ri7+a/xHHd/uAuzMS0wYDE8HguXKlrcSQptMkOsV3Bu6TDo
	 RZq/3FXd93g9oehZIKF864n/m0QqJS0aIb1GmCWFBlMBwh5xs/4FtYE+ira496GLtrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0tMJity;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA2606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BA2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0tMJity
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37000e7234bso864013eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124090; x=1794728890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKSjiFFNXoaRnbhFm/6WIkvX9c59tRmnSx3Vjc7t68U=;
        b=M0tMJityayCM/igtdIf9nBzhrM3HlJ/aJ/7XwK/aldu8s1aOBzsOCkKK0GXqc3yMgr
         1lCuKnQ5ZTWPHUm8/LrhEcYHG4JtpY1A5QiLGQ17ASWhwRfqfUxLhA9KUooswmsEjHGc
         VH2VCgapOb2jV/CN1Xaw1TRWayzyHGpPuQNKNJem/R60wsQWcJa6Lng24AAyCe32czO9
         sLzcgoz8cwxUBE9tKfmtqK+HcI26vQjnLSkendoyYTO7wmMZ5WXznN/cNfg/HeuvXDXX
         WT45b8W8nLWitPX0REKLKIKiu2VXIRDKIhkuglUq6B4Z0uH9/cRui10LYgA01jVaIfmg
         2Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124090; x=1794728890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKSjiFFNXoaRnbhFm/6WIkvX9c59tRmnSx3Vjc7t68U=;
        b=rTPZaUHic1vB8hnR81jJm+DHVpIc1BwxM9wjgwk03kcvxwH3Vvv1th2FT/XTakCnYX
         ZQ2j6aJVuY+5LeghBwQ2VQdFM4XvfZo1lbbrQJjYfmkI2oGXIfyX7UY0s5knfVB0RO3m
         mraPwYXz7Kshx+P8PgaorMAzGC9dZYUt1dY0Ibl22ESlqHx4NuyRtUt+ePbWu6npnNnP
         xzDpN3JT/qurMRgjW/oLirl1wtmpeHzLHwEtFbdIPloDlovHRiLi7wRAD+yQX7HCGUKa
         JCBv+nSdOHg3nFrKe6w2F/LoiwqY5vzMN/Ef0eJRtL62CK6OUuMpHWS7Df9rLxdFvoQN
         09lg==
X-Forwarded-Encrypted: i=1; AL+hErHo+whsL1nmMDIRw3+KRXKEBLHp/Groct+7MkuNJpJnpUtKjrQYnBhpD7utJBfknWKFgrA6CJDjqIh00iA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fRoSzTL+gEqcKABd3QxO/91M+sv2D5fhZ2FNg3dkLy6+R9WUq
	uDUht4GM/HtyaP/hPJM47Bu6jCEQ171r68wDfO/WQIhzfDUht76QSJI/
X-Gm-Gg: AYBFou0+oY/FLkYFqtwh79VwG/1YKJIN5wSuAFYXzolL7R7v41VLXsWW0xA/MGuLizJ
	vrRXWqgEzFy9e8VH7WZzRVSVvxtMpbIR9augdJ715pCDz0sHvTqxY9CciB/vtgeBuGI6HQ9zV/t
	IJPGLhSQ6qiwzcv86Azww0N1O3TJL84Dd+P3fzr2uZowE5WGYeDDzc1cUEhZmzEj6jRtqiRO+eG
	Kd4R+Yzpprq/OAo8bGF6bATk9sy5Aywf2TGtEIdOq1ab3ZOQl22GLWiU9vbOlaSRXoDoYCoBzS9
	N2IVDck/iefjQjCxTKxVY8d/GHrAgFBUso0+kETraNor1+/obZ2rjjMFx8a+AVSLGIrL867SMom
	xTJ8WpTZ6JwX2AZqgGvf/KyuoFE48JYe2AfIqOxsyg1akn5qsZoDl8N6vKddVV2Mge1EmhES1sK
	ro6UJmq7nrQz2aKBB1yzZc/c39vSC/7YrcN8CtvIQM/h9KgKtZF9dHa+QlW0warYTIqLMpwpnZL
	4zcSIjRXP2E49Ggb79x3iLn1pkXxJ5f2/brcK47xjIlyRTaeBO/PjlrE3J3NuCFDaviIK14Lm8R
	SeghTNYe2HT2YZhWl/F7/xFe58laiba0uNB0Ar1WhyCI9IFN
X-Received: by 2002:a05:693c:65c6:b0:36e:53bc:4681 with SMTP id 5a478bee46e88-372569fae2emr2198944eec.37.1794124089700;
        Sat, 07 Nov 2026 23:48:09 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm3795527eec.4.2026.11.07.23.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:48:09 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH net v2] net: ti: icss-iep: fix deadlock when disabling PPS
Date: Sun,  8 Nov 2026 16:47:33 +0900
Message-ID: <20261108074733.248784-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107063726.3388730-1-hj351016@gmail.com>
References: <20261107063726.3388730-1-hj351016@gmail.com>
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

icss_iep_pps_enable() holds iep->ptp_clk_mutex across the whole function.
When PPS is being disabled it calls cancel_work_sync(&iep->work) while that
mutex is still held.

The work handler, icss_iep_cap_cmp_work(), acquires iep->ptp_clk_mutex at
its start. The capture-compare IRQ (icss_iep_cap_cmp_irq) schedules this
work on every CMP1 event while PPS is enabled, so a handler instance can be
running when userspace disables PPS. In that case cancel_work_sync() blocks
waiting for the handler to finish while holding ptp_clk_mutex, and the
handler blocks trying to acquire the same ptp_clk_mutex -> deadlock.
lockdep would report this as a possible circular locking dependency
between the work and ptp_clk_mutex.

Unlike a teardown path, the capture-compare IRQ is not disabled here, so
the race is reachable at runtime simply by toggling PPS off while the
hardware is generating CMP events.

Drain the work only after dropping ptp_clk_mutex, so the disable path no
longer waits for the handler while holding the lock the handler needs.

Dropping the mutex before the drain means a work item that was already
queued (or an IRQ latched just before the compare was disabled) can still
run icss_iep_cap_cmp_work() after PPS/perout has been turned off. Guard the
handler so it returns early, under the mutex, when neither pps_enabled nor
perout_enabled is set, instead of re-arming CMP1 and emitting a stale PPS
event once the event source is gone.

This was found by a static analysis tool -- an in-house shape/pattern
checker that flags cancel_work_sync() calls made while holding a lock the
cancelled work's handler also acquires -- and confirmed by manual review
of the PPS enable/disable path. It was not tested on real hardware: I do
not have a TI ICSSG/PRU (AM65x-family) device, so the deadlock and the
late-work window are established by code inspection rather than an observed
lockdep or KASAN trace.

Fixes: f18ad402cd8b ("net: ti: icss-iep: Enable compare events")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2:
 - Guard icss_iep_cap_cmp_work() to return early, under ptp_clk_mutex, when
   PPS/perout is disabled, so a work item that runs after the mutex is
   dropped no longer re-arms the compare or emits a stale PPS event
   (addresses the late-work windows raised in review of v1).
 - Soften "lockdep reports" -> "lockdep would report" (not an observed
   trace).
 - Record discovery (static analysis + manual inspection) and that the
   change was not tested on real hardware in the commit message, as
   requested by the netdev commit-message bot.

v1: https://lore.kernel.org/netdev/20261107063726.3388730-1-hj351016@gmail.com/
 drivers/net/ethernet/ti/icssg/icss_iep.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index ec08589..3b2a88c 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -534,6 +534,17 @@ static void icss_iep_cap_cmp_work(struct work_struct *work)
 
 	mutex_lock(&iep->ptp_clk_mutex);
 
+	/*
+	 * PPS/perout may have been disabled (and the compare hardware
+	 * cleared) while this work was queued or waiting for the mutex.
+	 * Bail out rather than re-arm CMP1 and emit a stale PPS event once
+	 * the event source is gone.
+	 */
+	if (!iep->pps_enabled && !iep->perout_enabled) {
+		mutex_unlock(&iep->ptp_clk_mutex);
+		return;
+	}
+
 	ns = readl(iep->base + reg_offs[ICSS_IEP_CMP1_REG0]);
 	if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT) {
 		val = readl(iep->base + reg_offs[ICSS_IEP_CMP1_REG1]);
@@ -579,6 +590,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 {
 	struct ptp_clock_request rq;
 	struct timespec64 ts;
+	bool drain_work = false;
 	int ret = 0;
 	u64 ns;
 
@@ -607,7 +619,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 	} else {
 		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
 		if (iep->cap_cmp_irq)
-			cancel_work_sync(&iep->work);
+			drain_work = true;
 	}
 
 	if (!ret)
@@ -616,6 +628,15 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 exit:
 	mutex_unlock(&iep->ptp_clk_mutex);
 
+	/*
+	 * Drain the capture-compare work only after dropping ptp_clk_mutex.
+	 * icss_iep_cap_cmp_work() takes ptp_clk_mutex itself, so cancelling it
+	 * under the mutex deadlocks against a handler instance already running
+	 * and waiting for that same mutex.
+	 */
+	if (drain_work)
+		cancel_work_sync(&iep->work);
+
 	return ret;
 }
 
-- 
2.43.0

