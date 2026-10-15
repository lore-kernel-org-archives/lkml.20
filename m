Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FBB4FC8E9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107230; cv=none; b=eVmaS5oKZgPsPYYxXZPCnnoYvP4h4xW78snFvWs9gDMMkCflTlIK+0JcBdvo+SXmUwIrhL/ldKKpx5k4LGtV/xnlnP6s/Bd/IR+purTw5w3CkoXWF8n05lrE+L2bM4krFj/FAwO36dfuApTORSQQnHKVhjtSgt/Itx61N6Gs2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107230; c=relaxed/simple;
	bh=zeTuem/EFd0e5dPXUbBvOgo4KaTIpTu/O3JnA8vvJ6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=murrvGTYevPz66Ko/tS2lWrIOfmmZ93SXQ6qmKRbLHaXoncCxAHz2tMAG2QhRobw4mKWu4r+as6Y+GEHbKOQo7Ed0CXa1882ynpA7cAKQVou//HaFcoP7qC4JMKw6I1pBpxIXl/JeEWgHdbg1ONwZiPAek+dIK5dtGZPFW2Gwr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdB0OL4Q; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdB0OL4Q"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-701bb8e09c8so54811eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792107223; x=1792712023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWS9GelrPFPg86HBO/QEntBoFChHC1yKG7vt7gVjm0U=;
        b=qdB0OL4Qji2ZU92WJ3gK/VwQLi+4EqSnBoWXLwzXNNDZwiu0yxT6t2QXKqxM9dfFC1
         KWVAjQ34Q1UY9I+NOTAJvYFfpn5vk93u68burPsMF3lhtQRWsNR7Pc4O1d0tIsjfzmAb
         QagOqLJ3iako2Qu9WrVC+qYypxZlwdJaoF0rhQDAuhDLJeMcr/+4SrN1q/iqy0WPV51X
         96IEFT01ytLcZfA3TxiEbtxLChx6WwVF40cHwqO63mMGdUeFGbO4Co28FqhpLjmpS6b4
         N01IvBa+/MEJdQFWIRcbsrz+FlubAvpn7Y1FAuOt9dkpVVp2cKKPxWIjarHw8Rtd1Xuj
         xRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792107223; x=1792712023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWS9GelrPFPg86HBO/QEntBoFChHC1yKG7vt7gVjm0U=;
        b=ESYKhDtI3jfml4oXG2FJI0JS0giGCN+94A+lNK9Uc59NUFLtRFDjPYmsb5rXo1sN2g
         GfMVVlejDg44xpZhGeOQoNSysidFu3yWZOyXjr3mgj0zZUsrkQahsT9Pv6BjE3XZ5Rg1
         1jCNTLGhakr42YySjCR3bwd8XadPVD1Ds82v01R2QLFgTfyAAcu7ybWNjKXYEfXCvcHW
         AF/Ll8Ys7/MlpfHRF2r6m/aqHCtTm5An4K97493QeK+6MDM/sTnFidHkE0zKefJ5E44D
         iHKZi6k6E+qxYk/s7VcDs4d+cTuN2XYLTzkNsM9vWYOpgYgn498yX3PqG81USPmKEFtT
         7OJA==
X-Forwarded-Encrypted: i=1; AKwUvBwvN7wq4/6XzIPE9qAjyAAXZqQ5MNu3Fz+6PCXr7H7CnDpZ4hIkvgVm1X/coSozLw/UVfpCo66Pa+x5fsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA8D842PxktMAe4+zX8W9IUU6MqBL9Bj8r2ZslMR3NUEUfOPqD
	CAEqq378DQs/PDHE9D5UutBVpw0rsyINoKZ1eZt2QJXOEH5CN79VTqQc
X-Gm-Gg: AYBFou2Vbp72A5hOdr74f442L/6/GzkPEAxgwc0E3YGO7M5Z2i15VQ5NgZAaUsty9i3
	4+0A+2wA8Ju8jKUTVosgV0aPEnKskHxENbumSQs3cxfuBozrYfnkDWD8zvftZmV0lmNxIfXVKJp
	fxFixjp8dUCrj/+nL3Dgzst3orVEDMNJzN01XjqDBIpvXpyMprtLpcSfY2DhzLiEjT6AtPiOsCg
	i4979OOMIhuwC4QN5TohnkJ9ewrPX6lf3M23Y9zhd5DnbQmEe1tifd5Dnvy0ICe/OUfFxvS7gEh
	rvr/j2wgl0u22NvhncY9/CbQquLc1GVIGfk0HOzahTHL5n31tsrXRAtrEBP2T4yoANHARYc1jIY
	xledf27mveoQpaz2rVggmCbfDSg2REQcUby/XAvQj10r8/FR6/Q5Nn+DUOV5luCCvYryVOQ6dE2
	+s4vnxMCnB/GQPS3f6QCJU6fcP/3mQ7QuSx088Xk7QooFMqdP3dOUNf1S0coHgPKbb988fJTh92
	dtRycAWY2BODpDsuVqoAyWgRSh0/yQc6L7sH9Ft9Xag+ikOeY7AyV/FkwI87JGp1VktfPPeRrOg
	N0jghn2sdEd07S8d/jvVn/mvX9WL1H3hUdJ74Kolp8GhR3lF6nHyqV+w86VcYzgB2NsdN8FV1Q3
	bzFpFuW8xzY6Fg+J9my1QIXhfRRCwt69C
X-Received: by 2002:a05:6820:c95:b0:6d7:e3ab:14f6 with SMTP id 006d021491bc7-6ef0e6e532bmr14462959eaf.44.1792107222841;
        Thu, 15 Oct 2026 16:33:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70188bd9ecdsm525519eaf.2.2026.10.15.16.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:33:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 17:33:33 -0600
Subject: [PATCH net v4 3/5] ptp: vclock: propagate physical clock sampling
 errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-ptp-vclock-sampling-v4-3-cba6ffc8ceb6@gmail.com>
References: <20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com>
In-Reply-To: <20261015-ptp-vclock-sampling-v4-0-cba6ffc8ceb6@gmail.com>
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

Retry failed refreshes after 10 ms instead of waiting another two seconds.
With the existing 32-bit nanosecond mask, timecounter_cyc2time() can
interpret a fresh timestamp as being in the past once the last successful
refresh is about 2.147 seconds old. An isolated read failure should not
deliberately defer the next attempt until that sample is four seconds old.
Keep the normal two-second refresh interval after a successful read.

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
 drivers/ptp/ptp_private.h |  3 +-
 drivers/ptp/ptp_sysfs.c   |  4 ++-
 drivers/ptp/ptp_vclock.c  | 75 ++++++++++++++++++++++++++++++++++-------------
 3 files changed, 59 insertions(+), 23 deletions(-)

diff --git a/drivers/ptp/ptp_private.h b/drivers/ptp/ptp_private.h
index ec8633126d6b..e389e0653afd 100644
--- a/drivers/ptp/ptp_private.h
+++ b/drivers/ptp/ptp_private.h
@@ -81,7 +81,8 @@ struct ptp_vclock {
 	struct hlist_node vclock_hash_node;
 	struct cyclecounter cc;
 	struct timecounter tc;
-	struct mutex lock;	/* protects tc/cc */
+	u64 cycles;
+	struct mutex lock;	/* protects tc/cc and the cached sample */
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
index 84cb527f59cc..5f49f81891ef 100644
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
@@ -151,7 +175,9 @@ static long ptp_vclock_refresh(struct ptp_clock_info *ptp)
 	struct ptp_vclock *vclock = info_to_vclock(ptp);
 	struct timespec64 ts;
 
-	ptp_vclock_gettime(&vclock->info, &ts);
+	/* Do not wait another full interval with a stale cycle_last. */
+	if (ptp_vclock_gettime(&vclock->info, &ts))
+		return PTP_VCLOCK_RETRY_INTERVAL;
 
 	return PTP_VCLOCK_REFRESH_INTERVAL;
 }
@@ -174,12 +200,9 @@ static const struct ptp_clock_info ptp_vclock_info = {
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
@@ -192,10 +215,11 @@ static const struct cyclecounter ptp_vclock_cc = {
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
@@ -214,20 +238,29 @@ struct ptp_vclock *ptp_vclock_register(struct ptp_clock *pclock)
 
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

