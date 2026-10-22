Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682219;
	b=jMmVYp1Ac/F2DkyTsMhTFxJyaFrNJNjFFGM2zxDwUKPyxXsdPhmyN2HL0/FMIH5LXuZX
	 oYjBSdKfzi/FuxqB3dF9RyYV4Sc8e8jhwJSsGMSwzv4NbOLhS9V+mp3c0DXH1cOhl17t4
	 qlJTtBReHzHue7heYaLFsmQh1B0hHDeujcfOgIiei4RpOpGZF6G4dgDDiteym6zD5Tz2z
	 pfgQG524r0Ld5kQOZXQU7TqOh6mLEyVc0DsQrHTHN4iepfGmNrTEDwJtdlSEgkrkMK7pM
	 clAauWJ755Y8foUJuOyQrd3UEOpCCENQ47ssZUOyhYOwNRWkMyyDfkNTA6RX5I6qYkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ArZTwUoXYzov7eHPXGfSS3R5PEo5sgxcCtm/GX7TEww=;
	b=xZaVJ/sCOpw9sMP156Nbkr7YmJuNCs9WPQU9v4/C8LLC81670Am/Bj2FenZz5iVLr8ps
	 j141oBlOD3iPbsXLAeDDxC36Y5ZJ9ai8PMBcu5w/QuLdEKhZwCVG4IyR5LK10sRClAS7V
	 akq4CDqfDHYSnIcXWdyXm3yRceYk/1uzFu/uu/5TV+p3JrpqE/5OrGR2QwhWLcFIokqFh
	 J2fQD2jkeoZznYEnxrXQthTJ/1p/ZGImUeF1HrowOGw+daVcRdRn/WWyBLw9HAHx6S/b4
	 wuMZKqxzJtdnIwAw7ZUNLfKgU56apk0o6DAHMxilN+bwsU4tLrF4e/+1uEV2G3j4TTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pxAnD+jc;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752E606B3A3
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8752E606B3A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pxAnD+jc
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-49e5f85ce89so797742fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682217; x=1793287017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZTwUoXYzov7eHPXGfSS3R5PEo5sgxcCtm/GX7TEww=;
        b=pxAnD+jc1lOVkSXjBuFvtopiKYPsS54zOLQbTxN/OOJM6oBZiH2/s6AOqwjfvltOX3
         v57BjOSJk9hYe4bHqvTDMjnEKuN+g9vBhVZ77RRgqa5l4HFRzWNASUW7HMK+9hrNgZeR
         GcAd3xpxqlSLBLl+hgXOhXzdzZgN0nC+v+iJxt9OHWZ4B2+AtAKl7Q3F6ga7IJJqh0lx
         HnEYhCnD06A3OmR1Da3DldTC9YbFg9JNLlCVoPsMm+zNcXG5nQZwGaiknf4OV5aeHudo
         is6kHqdhSjHcQg8PdsJYJNyFmbLzcpomOo51GE3NNh54Iw06Io1kVpNT56q12e8Z3Nbd
         C2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682217; x=1793287017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZTwUoXYzov7eHPXGfSS3R5PEo5sgxcCtm/GX7TEww=;
        b=B+oZ5NPur2A4SMXzKPdK7TK82wo+kBepgi/zVdTGwIR1OQ6UhAl+Nx0X99tuuiOuwV
         vRcy7ZW5/ettUILWLUCE220uhJGSB5Z41nyEgwkFNT0UfwbYSWvB2ZBOSmCt4SYvNHJc
         XWZEqsGqyryxz4n9WemP/PfFXMQ6g0ac1q/RAswe/NEv8IgEGUW45DfEWC6aXIw2HvMh
         fF4X1uptdCEjKujoZ8Ph6mWDFLmPl1+pezqiFszWI4Vc8j2W+Po9iHrNvkZRW9yHMEXp
         GKAOnG/fjNg5ps/MF8AB1YCWCTyoubzwg9eH1Q2BYzijMofgCOS5e11JnQmXOUuFhnkQ
         t4Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwC+4vyb1/5K4FZvdicCnhN4B2hGBPl3BaNLa7OuRQBlK3uCHrZFM6CkKVbdPrvWVO107y01OD55jpy8JU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6nDhSePYXVXP8fXdEpm0fI0UUNZsfCHAnjygML5Pe19u0DL1e
	XjT83aGw6b5X/pb80CIFSsZ7wRpybr8ma/xLIrJMS47oGdVAa/LGGNMj
X-Gm-Gg: AYBFou33s2fRwKHG18qTc8Br+8SKhh+OBMbieQRYPkHNLX04ncJhvC8nuEVPuWEPXUV
	O1v+/cZ+g/Ir5gNjT99vrhLEgYKrpkaqCrgSn5Up+zqpMbd6sRBzlAJPgnx8ps8DmrBWiY/LoVa
	CZsBcQ4wMJLbmkSgMoHEWa/SwMGqAVFTLKGNYlyE8bwtfxT+0X/0Pk01Z+ef8rYbHie8W7ad8X/
	LgrHfd0Xl4rvUyCv2jryXRRwFNGy5zTQVCI76mYu9T8hPRZlwmytIVpqQ7qzyfccmaUXK+2qbNE
	wnN63U3k+Z+iPr1ZsKufG0Ua+H/R96BKv3aH5s9NH1skqY/BiJhm9lNsIylqn6cdrdNZOpwnxqe
	cJLBspJXwKP3wXzpvhETloQanZfBqS0SSq41bh3oe61Vkpw+c6KJOrkCu09gs3nIUcJuqxoAwHZ
	fr1ML6e8R3eGK4k7qnpxZMRk8wcNsYUWcnpaUPIEoUX+le0A0tWG0STu7Lvc3XosvZ8vRNurL2S
	UYx5mf2lqtf8iM1boEbDthOBJHr5pj80N5px+JKifECdIHDcJIjmVlEYSJu2k7RYjLSd+isCLNG
	YokCoKD/UeRBqppGNw8mVzLYTFcbAH+YI/0kFvaQ+LX80Xcr+qzVMpemAMWAr6hTbEJypl3WEGc
	W42hnBgcp0REvZWBFF5e60iQ6CFdswdo23Kp/eec6aMwPZEDPVyeuBzPdYO4j4PhOfs5EUrfPGO
	Ve8aQ=
X-Received: by 2002:a05:6870:75cd:b0:48f:e3d4:d45e with SMTP id 586e51a60fabf-4a7dc2bb1aamr4035590fac.61.1792682217381;
        Thu, 22 Oct 2026 08:16:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d5eb8fc0sm4685631fac.1.2026.10.22.08.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:16:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 09:16:43 -0600
Subject: [PATCH net v5 3/5] ptp: vclock: propagate physical clock sampling
 errors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-ptp-vclock-sampling-v5-3-06ceace17bac@gmail.com>
References: <20261022-ptp-vclock-sampling-v5-0-06ceace17bac@gmail.com>
In-Reply-To: <20261022-ptp-vclock-sampling-v5-0-06ceace17bac@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The cyclecounter read callback cannot report errors. ptp_vclock_read()
ignores the return from the physical clock and consumes its output even
if the read failed. A zero sample followed by the real counter can add
an extra 32-bit wrap to virtual time. This was found by code inspection
of reset-time PHC access and the virtual clock callers.

Sample the parent before calling timecounter_read() or timecounter_init()
and have the cyclecounter callback return the cached successful sample.
On failure, leave the counter and frequency adjustment unchanged and
return the PHC error to the caller.

Retry the first failed refresh after 10 ms instead of waiting another two
seconds. With the existing 32-bit nanosecond mask, timecounter_cyc2time()
can interpret a fresh timestamp as being in the past once the last
successful refresh is about 2.147 seconds old. An isolated read failure
should not deliberately defer the next attempt until that sample is four
seconds old.

Double the retry delay after consecutive failures, up to the normal
two-second refresh interval, and reset it after a successful refresh.
Each virtual clock has its own worker, and a failed parent read can involve
bus traffic and error logging. Backoff limits that repeated work during a
persistent failure while retaining a prompt first retry. Keep the retry
state private to each clock's auxiliary worker.

Take the initial sample and initialize the counter before publishing the
clock. Return an error pointer from registration and propagate its errno
through n_vclocks, including when the initial sample fails. Queue the first
refresh immediately after registration so registration latency is not
followed by another full refresh interval.

Keep the existing cyclecounter mask and scaling. These scheduling changes
do not guarantee timely samples: prolonged read failures or worker delays
can still exceed the half-wrap conversion window, and a gap of about
4.295 seconds between successful samples can lose a full counter wrap.
Do not assume that getcycles64() exposes a full-width nanosecond counter.

Fixes: 5d43f951b1ac ("ptp: add ptp virtual clock driver framework")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_private.h |  4 ++-
 drivers/ptp/ptp_sysfs.c   |  4 ++-
 drivers/ptp/ptp_vclock.c  | 83 +++++++++++++++++++++++++++++++++++------------
 3 files changed, 68 insertions(+), 23 deletions(-)

diff --git a/drivers/ptp/ptp_private.h b/drivers/ptp/ptp_private.h
index ec8633126d6b..9c458c2d50de 100644
--- a/drivers/ptp/ptp_private.h
+++ b/drivers/ptp/ptp_private.h
@@ -81,7 +81,9 @@ struct ptp_vclock {
 	struct hlist_node vclock_hash_node;
 	struct cyclecounter cc;
 	struct timecounter tc;
-	struct mutex lock;	/* protects tc/cc */
+	u64 cycles;
+	struct mutex lock;	/* protects tc/cc and the cached sample */
+	unsigned long retry_delay; /* owned by the auxiliary worker */
 };
 
 /*
diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index fabc1c9b1752..026220b112c2 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -224,8 +224,10 @@ static ssize_t n_vclocks_store(struct device *dev,
 	if (num > ptp->n_vclocks) {
 		for (i = 0; i < num - ptp->n_vclocks; i++) {
 			vclock = ptp_vclock_register(ptp);
-			if (!vclock)
+			if (IS_ERR(vclock)) {
+				err = PTR_ERR(vclock);
 				goto err_register;
+			}
 
 			*(ptp->vclock_index + ptp->n_vclocks + i) =
 				vclock->clock->index;
diff --git a/drivers/ptp/ptp_vclock.c b/drivers/ptp/ptp_vclock.c
index 84cb527f59cc..c10eba6443f9 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -4,6 +4,7 @@
  *
  * Copyright 2021 NXP
  */
+#include <linux/jiffies.h>
 #include <linux/slab.h>
 #include <linux/hashtable.h>
 #include "ptp_private.h"
@@ -13,6 +14,7 @@
 #define PTP_VCLOCK_FADJ_SHIFT		9
 #define PTP_VCLOCK_FADJ_DENOMINATOR	15625ULL
 #define PTP_VCLOCK_REFRESH_INTERVAL	(HZ * 2)
+#define PTP_VCLOCK_RETRY_INTERVAL		msecs_to_jiffies(10)
 
 /* protects vclock_hash addition/deletion */
 static DEFINE_SPINLOCK(vclock_hash_lock);
@@ -42,21 +44,39 @@ static void ptp_vclock_hash_del(struct ptp_vclock *vclock)
 	synchronize_srcu(&vclock_srcu);
 }
 
+/* The caller holds vclock->lock, or has not published the clock yet. */
+static int ptp_vclock_sample(struct ptp_vclock *vclock)
+{
+	struct ptp_clock *ptp = vclock->pclock;
+	struct timespec64 ts;
+	int err;
+
+	err = ptp->info->getcycles64(ptp->info, &ts);
+	if (!err)
+		vclock->cycles = timespec64_to_ns(&ts);
+
+	return err;
+}
+
 static int ptp_vclock_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
 {
 	struct ptp_vclock *vclock = info_to_vclock(ptp);
 	s64 adj;
+	int err;
 
 	adj = (s64)scaled_ppm << PTP_VCLOCK_FADJ_SHIFT;
 	adj = div_s64(adj, PTP_VCLOCK_FADJ_DENOMINATOR);
 
 	if (mutex_lock_interruptible(&vclock->lock))
 		return -EINTR;
-	timecounter_read(&vclock->tc);
-	vclock->cc.mult = PTP_VCLOCK_CC_MULT + adj;
+	err = ptp_vclock_sample(vclock);
+	if (!err) {
+		timecounter_read(&vclock->tc);
+		vclock->cc.mult = PTP_VCLOCK_CC_MULT + adj;
+	}
 	mutex_unlock(&vclock->lock);
 
-	return 0;
+	return err;
 }
 
 static int ptp_vclock_adjtime(struct ptp_clock_info *ptp, s64 delta)
@@ -75,15 +95,16 @@ static int ptp_vclock_gettime(struct ptp_clock_info *ptp,
 			      struct timespec64 *ts)
 {
 	struct ptp_vclock *vclock = info_to_vclock(ptp);
-	u64 ns;
+	int err;
 
 	if (mutex_lock_interruptible(&vclock->lock))
 		return -EINTR;
-	ns = timecounter_read(&vclock->tc);
+	err = ptp_vclock_sample(vclock);
+	if (!err)
+		*ts = ns_to_timespec64(timecounter_read(&vclock->tc));
 	mutex_unlock(&vclock->lock);
-	*ts = ns_to_timespec64(ns);
 
-	return 0;
+	return err;
 }
 
 static int ptp_vclock_gettimex(struct ptp_clock_info *ptp,
@@ -115,13 +136,16 @@ static int ptp_vclock_settime(struct ptp_clock_info *ptp,
 {
 	struct ptp_vclock *vclock = info_to_vclock(ptp);
 	u64 ns = timespec64_to_ns(ts);
+	int err;
 
 	if (mutex_lock_interruptible(&vclock->lock))
 		return -EINTR;
-	timecounter_init(&vclock->tc, &vclock->cc, ns);
+	err = ptp_vclock_sample(vclock);
+	if (!err)
+		timecounter_init(&vclock->tc, &vclock->cc, ns);
 	mutex_unlock(&vclock->lock);
 
-	return 0;
+	return err;
 }
 
 static int ptp_vclock_getcrosststamp(struct ptp_clock_info *ptp,
@@ -151,8 +175,18 @@ static long ptp_vclock_refresh(struct ptp_clock_info *ptp)
 	struct ptp_vclock *vclock = info_to_vclock(ptp);
 	struct timespec64 ts;
 
-	ptp_vclock_gettime(&vclock->info, &ts);
+	/* Retry transient failures promptly, but back off during long outages. */
+	if (ptp_vclock_gettime(&vclock->info, &ts)) {
+		if (!vclock->retry_delay)
+			vclock->retry_delay = PTP_VCLOCK_RETRY_INTERVAL;
+		else
+			vclock->retry_delay = min_t(unsigned long,
+						    vclock->retry_delay * 2,
+						    PTP_VCLOCK_REFRESH_INTERVAL);
+		return vclock->retry_delay;
+	}
 
+	vclock->retry_delay = 0;
 	return PTP_VCLOCK_REFRESH_INTERVAL;
 }
 
@@ -174,12 +208,9 @@ static const struct ptp_clock_info ptp_vclock_info = {
 static u64 ptp_vclock_read(struct cyclecounter *cc)
 {
 	struct ptp_vclock *vclock = cc_to_vclock(cc);
-	struct ptp_clock *ptp = vclock->pclock;
-	struct timespec64 ts = {};
-
-	ptp->info->getcycles64(ptp->info, &ts);
 
-	return timespec64_to_ns(&ts);
+	/* The cyclecounter callback cannot report a failed PHC read. */
+	return vclock->cycles;
 }
 
 static const struct cyclecounter ptp_vclock_cc = {
@@ -192,10 +223,11 @@ static const struct cyclecounter ptp_vclock_cc = {
 struct ptp_vclock *ptp_vclock_register(struct ptp_clock *pclock)
 {
 	struct ptp_vclock *vclock;
+	int err;
 
 	vclock = kzalloc_obj(*vclock);
 	if (!vclock)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vclock->pclock = pclock;
 	vclock->info = ptp_vclock_info;
@@ -214,20 +246,29 @@ struct ptp_vclock *ptp_vclock_register(struct ptp_clock *pclock)
 
 	mutex_init(&vclock->lock);
 
+	err = ptp_vclock_sample(vclock);
+	if (err)
+		goto free_vclock;
+	timecounter_init(&vclock->tc, &vclock->cc, 0);
+
 	vclock->clock = ptp_clock_register(&vclock->info, &pclock->dev);
-	if (IS_ERR_OR_NULL(vclock->clock)) {
-		kfree(vclock);
-		return NULL;
+	if (IS_ERR(vclock->clock)) {
+		err = PTR_ERR(vclock->clock);
+		goto free_vclock;
 	}
 
 	ptp_vclock_set_subclass(vclock->clock);
 
-	timecounter_init(&vclock->tc, &vclock->cc, 0);
-	ptp_schedule_worker(vclock->clock, PTP_VCLOCK_REFRESH_INTERVAL);
+	/* The initial sample predates registration; refresh without more delay. */
+	ptp_schedule_worker(vclock->clock, 0);
 
 	ptp_vclock_hash_add(vclock);
 
 	return vclock;
+
+free_vclock:
+	kfree(vclock);
+	return ERR_PTR(err);
 }
 
 void ptp_vclock_unregister(struct ptp_vclock *vclock)

-- 
2.53.0

