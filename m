Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768464;
	b=Q8wWoHQtVmzhsaJzsp5dwhuVemzdQF7iCcrybWz9JdTBNkRuwlNgFwlQDFGl+XdAk6Q3
	 1KPF3TfOo/3hq4+dApNYjsUJpfVIt3HJid6APbIoVjksQsZc3jHHwH151STfxeDhuUXRb
	 VQjP6cNNBgEdAfrZ+AmXtbcWf35m/aNWLlLEsQT3jp+WXykaWWYlp29S8tlmdwLTKPoJj
	 SlU20PXRmgmKhdAR4+iwcYk2JCl226gsWnIh3WH2mWPCeCA1RjoC33ADAnO3aPneKq3m2
	 NDjsuo64XuoeQBdyhbLTWl5aGgw46AcvRcX2XrKWQaIvfxmlu7BgZdxOJLZpVxFFkSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xFvjmOzUG2PNmNQ/+sv1mBLhWiWW1+1KwXZnJp6bcGc=;
	b=UlZuI00jcpL9zlCN4LufDy1NNRGYl22RDA9t1z9HxPSUDoX/c/shDpcaPoDc0k/SfEkv
	 8WDpm/OfRIu5qtYSML3Fb9YsMM02Eu3Rdnza7+7+cZmZ9lXzxYH/sdaEsUPxSwXZRC6C0
	 hDcoGCWn+s8zuaI7A43FfTx2DVmLH5PgcnKhG+3ZQxFnnPvNTS2lnv0/kbmOfTcroVod2
	 Kx/YCGmw024nghG4gHt0KuTKqJBzzx3dJLatodl+wmRBshE1yf6m5hNlVu7CF5KupGvqR
	 ciPm6Pxj9RgH/FVHLozcvSUfgM+6d7z0m9LIrWwGvvSA3s8MQNJofDKV4oO/Y05VBBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q89qKPfP;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D655606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D655606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q89qKPfP
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso548598a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768464; x=1793373264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFvjmOzUG2PNmNQ/+sv1mBLhWiWW1+1KwXZnJp6bcGc=;
        b=q89qKPfPBy3HHSpgE7OQclSHBpjhcsE2QoE9qKNCUatOqGEyjOnSxFjS20t3O4NQOQ
         U6ZONnnhEvs1QAZP0IjdaaWPTCA2wixYbmbG50rL+kI7HKJhxPPx6891T+MkUGwtoVWn
         KA3qQ1oaZE+c5+okDcARkwkaj04cWvZMMgoy58AaqmPPWeHfwgFSy/h1lYBNfv5kTM15
         B+UVxNMcsi40Zqz7N+1B+eDhKllKz1FSX3wRPlpkNu1UvyLdvemoDcfH52xCnZEAY2QQ
         ni7ABf/lS9GfardBHi3FIOaUjKyKMy28MqzCWToUJz89bunO+LlA/uWu2kYC4mdPR9ZY
         6PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768464; x=1793373264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFvjmOzUG2PNmNQ/+sv1mBLhWiWW1+1KwXZnJp6bcGc=;
        b=wpdmbrI/GnCrBX/LK/P1Z7jcDwmSginp2Tav9rOyjfbpqImMJ4Ak4rRmV47Aj6BQd3
         inguyHVLy1w1O9QZMZIh50V9Pw+9gtX4QPcpUUxRhalJmZaOrgim8lDZTDoysQIVSILX
         U3V2LJYOCH7VCI4R986uJRnxBFQU2h7ugTeuHg6IGvw7WaVOA1vVaPmdDWIh9Byqt3Px
         VGawT7qGkFpsc1RNr6LGCDlOTOUSYgwu76qVj38uxJ9PMqBExTao6z1kQlHf9BQFPKQC
         fouVGT+FhBhRPvrHu6w7A/oPfIOcZ2DQDXkNOi73Z5vbpLnT1HRM4+KcujlK/iz1rLsr
         FBQg==
X-Forwarded-Encrypted: i=1; AKwUvByvQr5OS+uMwNEE/McQ1gI0QpTiKq8dCo6ChgdgZdUq4OP3faKEyNv0KO7zwGJ8HOu9Yqp+eQbJjf0ejyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ5DTkolH1MLqDrUcE7jOZCiWDQOa6xhhuswGyfK+LbSWK54yj
	vUy+yHzV3XvgLH+4MWeiNhXPvWUBzeTbMoh8UEwck+Ta2XiClCuhJfRUZ6lRM7ES
X-Gm-Gg: AYBFou3lPuZbkQ34pgpQmaA7m41RcWaCNcgcypA+QxHtGGH9+DigKkXA6ttXNAjrs9y
	1Nf6KcsVjFmT2Qi8mld+PKiVDeOCJzwKdRbncjlIUY4LjEg5tS94Zem2eLv1+7cvyiIKxB45HpD
	wXKQ3vj7L+L3RvJnoyfC9R5/KDStcuduh1+u4ZU/m3R9u62mbBvo9EwvuQZ3GupSPhm0n00mkXx
	gHSzqhjZOJSjzxDRzjLN8m9UgZqTSzSTulLYcKIE7Y8T0Q0NZK6jZjEInXL20JUWEEFKM52TduB
	UMf1LpNIux9U/7HV4vyD3BV4oGJjQSwMqcDL9OUShEhLJE7T8jN+g8gtD9OkN/0DaVHeU6RXRR/
	V4sq7R6tgCzmX6dxAeRUeve87hiL7Zb3U8jAD5BwAvEroi7snrq9kSf8HTnhw9S9ORO8tMndMK5
	dgSsMGnmHXYBsIIYw51udidaXVtiUxPE0D7jMp8TsRo63n3fUAPYTBkEadZdVxLjW+gUbXdMkSD
	P/QC6LJ9r1ERPlJYyiD1CKjoFuUHAyGaE5q+nsvKOQdaz0GQOzUbGDiB5eL44ZIkO/0mtn6hH/g
	ShZOpDcqm7NozITOarFpIfvb3pmlwNMNK7lR0xqjzKKq36WdY9gjw/v8UJUhQg==
X-Received: by 2002:a17:90b:2887:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3adce5ee37dmr2140154a91.13.1792768463512;
        Fri, 23 Oct 2026 08:14:23 -0700 (PDT)
Received: from localhost.localdomain (111-255-192-187.dynamic-ip.hinet.net. [111.255.192.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd84c87esm590809a91.11.2026.10.23.08.14.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:14:23 -0700 (PDT)
From: Hung-Jui Lin <alex.lin.programmer@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hung-Jui Lin <alex.lin.programmer@gmail.com>
Subject: [PATCH 1/2] posix-timers: Report zero remaining time for disarmed SIGEV_NONE timers
Date: Fri, 23 Oct 2026 23:14:10 +0800
Message-ID: <20261023151411.28685-1-alex.lin.programmer@gmail.com>
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

SIGEV_NONE timers are never queued. common_timer_get() emulates their
expiry by computing the remaining time from the stored expiry value.
Because an armed SIGEV_NONE oneshot timer is not queued, its it_status
stays POSIX_TIMER_DISARMED. So common_timer_get() cannot use it_status to
skip a disarmed SIGEV_NONE timer and evaluates the stored expiry value for
all SIGEV_NONE timers.

Disarming a timer with timer_settime() and a zero it_value cancels the
timer and sets it_status to POSIX_TIMER_DISARMED, but leaves the expiry
value unchanged. As a consequence, timer_gettime() on a disarmed SIGEV_NONE
timer reports the remaining time of the previous arming until that time has
passed, instead of zero as POSIX requires for a disarmed timer. Example
with a CLOCK_MONOTONIC timer armed with it_value = 10ms and it_interval =
100ms, then disarmed with an all-zero itimerspec:

  armed:    it_value = 0.009999000  it_interval = 0.100000000
  disarmed: it_value = 0.008700792  it_interval = 0.000000000

SIGEV_SIGNAL timers and SIGEV_NONE CPU timers report zero in the same
situation. All clocks which use common_timer_get() are affected, including
the alarm timer clocks.

Mark SIGEV_NONE timers as POSIX_TIMER_ARMED when they are armed, so that
common_timer_get() returns early for every disarmed timer. Forward
SIGEV_NONE interval timers in common_timer_get() regardless of it_status,
as they are never queued and therefore never forwarded by the expiry code.

Tested on arm64 in QEMU: after the change, the disarmed timer above reports
zero. Armed SIGEV_NONE oneshot and interval timers on CLOCK_MONOTONIC,
CLOCK_REALTIME, CLOCK_BOOTTIME and CLOCK_BOOTTIME_ALARM still report their
remaining time, and the posix_timers selftest passes.

Fixes: becf8b5d00f4 ("[PATCH] hrtimer: convert posix timers completely")
Signed-off-by: Hung-Jui Lin <alex.lin.programmer@gmail.com>
---

Notes:
    Tested on arm64 under QEMU (virt, HVF), base tip timers/core
    348f54c435bf, arm64 defconfig plus kernel/configs/x86_debug.config
    (lockdep, DEBUG_OBJECTS, KMEMLEAK, DEBUG_PAGEALLOC, ...; the x86-only
    options do not exist on arm64), 9p built in:
    
                                            unpatched         patched
      reproducer: disarmed it_value         0.008700792       0
      posix_timers selftest, existing 19    19/19 pass        19/19 pass
      posix_timers selftest with patch 2    20/21, #14 fails  21/21 pass
    
    SIGEV_NONE timers on CLOCK_MONOTONIC, CLOCK_REALTIME, CLOCK_BOOTTIME,
    CLOCK_BOOTTIME_ALARM and CLOCK_PROCESS_CPUTIME_ID: never-armed, armed
    oneshot (5s), expired oneshot, armed interval and forwarded interval
    timers report the same values with and without the patch. Only the
    disarmed case changes: non-zero before (CPU timers were already 0),
    0 after. No lockdep or debugobjects splat after the tests. W=1 build of
    kernel/time/posix-timers.o has no warnings before or after.
    
    Fixes: tag checked by running the reproducer on x86_64 kernels in
    QEMU: 97735f25d2ba (the parent of becf8b5d00f4) reports 0 after
    disarm, becf8b5d00f4 reports the stale value. v2.6.17, v4.15 and v6.12
    also report the stale value.
    
    Not done: this patch was not built or booted on x86 or other
    architectures; no kmemleak scan was run; the series applies cleanly to
    mainline master a804c5742bff, but was not built or run there.

 kernel/time/posix-timers.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 188dbedbf..5eabec168 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -694,16 +694,8 @@ void common_timer_get(struct k_itimer *timr, struct itimerspec64 *cur_setting)
 	if (iv) {
 		cur_setting->it_interval = ktime_to_timespec64(iv);
 	} else if (timr->it_status == POSIX_TIMER_DISARMED) {
-		/*
-		 * SIGEV_NONE oneshot timers are never queued and therefore
-		 * timr->it_status is always DISARMED. The check below
-		 * vs. remaining time will handle this case.
-		 *
-		 * For all other timers there is nothing to update here, so
-		 * return.
-		 */
-		if (!sig_none)
-			return;
+		/* Nothing to update for a disarmed timer */
+		return;
 	}
 
 	now = kc->clock_get_ktime(timr->it_clock);
@@ -713,7 +705,7 @@ void common_timer_get(struct k_itimer *timr, struct itimerspec64 *cur_setting)
 	 * is a SIGEV_NONE timer move the expiry time forward by intervals,
 	 * so expiry is > now.
 	 */
-	if (iv && timr->it_status != POSIX_TIMER_ARMED)
+	if (iv && (sig_none || timr->it_status != POSIX_TIMER_ARMED))
 		timr->it_overrun += kc->timer_forward(timr, now);
 
 	remaining = kc->timer_remaining(timr, now);
@@ -915,8 +907,15 @@ int common_timer_set(struct k_itimer *timr, int flags,
 	sigev_none = timr->it_sigev_notify == SIGEV_NONE;
 
 	if (kc->timer_arm(timr, expires, flags & TIMER_ABSTIME, sigev_none)) {
-		if (!sigev_none)
-			timr->it_status = POSIX_TIMER_ARMED;
+		/*
+		 * SIGEV_NONE timers are not queued, but mark them armed
+		 * so that common_timer_get() can tell them apart from
+		 * disarmed timers. An expired SIGEV_NONE timer stays
+		 * armed, which is harmless: common_timer_get() reports
+		 * zero remaining time for it and it never reaches the
+		 * signal delivery code.
+		 */
+		timr->it_status = POSIX_TIMER_ARMED;
 	} else {
 		/* Timer was already expired, queue the signal */
 		posix_timer_queue_signal(timr);

base-commit: 348f54c435bf3177baa78201952810b255d44b30
-- 
2.56.0

