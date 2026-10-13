Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058F053F694
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919195; cv=none; b=Jkb00lLRd1sV/HeiH4qaYav3lQ2fb+QduAyNZfkC7agH0MW/v5jL1jqEnZBPXR/iV14V2+rjxqTb6NjgfC7Zckgt+KD29lTVrHC+EcPdwx61uY4+H7GopBN/9D6+9No0rfINaD1yYABGXFu5yZlKPc0iecEHDZ+4wX2ZkXAp6C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919195; c=relaxed/simple;
	bh=NNOB8km99ksjDrQXiRN77AtsCWuF9D8MDEppTHzofW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVHg+7qPOuJzEMPWEKDjr3gB1PL35+bFslyML423OlNLReBxnz4dbBoXZuE+ofpMbv4IZAwq2KZuxbHGwHA99o2w5nA6OJFZvFQ0C/kx8abb3PBnBY4KBRjhx4U+CZGJAcmVSTRZ1cXtVDlTKhLgAraJREvzuVcwSRpUtZMX6yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWg5H/UW; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWg5H/UW"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-825b40f8a26so1652409a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791919192; x=1792523992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGgu5Q9CBMy31PnvfEMlY3Beff1FqtWYZzk/xM+Mv7Y=;
        b=kWg5H/UW4EdhEIcgrzzVN+G6oP34R42Do6e8D89eWv/1/Ow7yrZxKue1gLNovlzxDH
         aPrDUN+ZStb23ovwX8x3cCG3Xs1xZyP/4ulePx3xS5a6926ME8v4jwU146I6x0kdU7A4
         X+YzWXU2XFPns6M8KvSilK0wPJAgrZtAp7bTwNf1TO4H0BUYJg4Cmpzt269hqlfld7Wn
         px+A9aCsBdE1Whu9W4HFZoN/tT3+3RC08VHx/RRLC7j5w8/lzSvAJ/ZHUF1Y4rMM8f8D
         hhq55y6Aoq6FPqkluiScBD+ZEE8wGUjIXgcL8buEPbskZ1a6ROi8VkiztsVSCMXA53Ud
         iP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919192; x=1792523992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGgu5Q9CBMy31PnvfEMlY3Beff1FqtWYZzk/xM+Mv7Y=;
        b=ZZzdwW4LvCDVYcPJfUglgEWyp7PiO3zH/M0imU6t+egK+R+1SbgoKCiNGP8ApCVEGr
         llFwEHHGJqHlq3VuHcaJp8IAiP+iReIlt40+3slEwT5P2UEyLOFFRrVGFwl+PnlokLze
         Xn3J5x1DHB63zgmPl17nXELIAamb9TRvJff+IqUdF7Hzh89rVsgdHHcTxepe0J7X0j6a
         pHgk08wBnH45UlPRhVcX4xqGTMGFtd1hPQwiejgQdP1jTcglZV5LqTXf9PHA1xfKteUe
         eQ+IayS6VvxGtDrkxSAUpYqMT29C4B8R69mk7fuDwYZgZgJsq7NdTOdYmbnDDuldtUqc
         Vrog==
X-Forwarded-Encrypted: i=1; AKwUvBzQ+0L/KU6NGWUKPaasxa26zOOk6JFqHz3ZuoOMvEwFnj+nEocQf/EsYmi4YFHnBVeHaa863rrG9Yx3eOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu1shOuU/igboy6sHmkGiQxtKHmMiyxQxRJV3xSQCm5fl3rBZY
	1XkkyfizB619LErPFwYdrGYaW0fvw3aw6xxL7j/0ekwVqTSGfXA33lZX
X-Gm-Gg: AYBFou2KSloJD0kZ0qrGzl4pU52oKBkDpjET0hj/QsjKcSBIft1ilzogy2mls6eybxb
	aLFs+j178CYsyWriJLRN7E1NYreClV0IvivAPhl2+XpTCp2z1w5df5E68pxKmhp96uMue3/bGnG
	Zmd+Kj0tn1Az8aZHtEhy0CbbQu6BZOjb/SORiFNHGUFqgfVgakh5zBIQX/ktzWk/81LidXbnIln
	yLbev9TdXLp6JKvZNgcb+a2+ADaE+h8NCrEJ6IkXrBpQCdr18UArzXwSjmlJeKl5s3dek001jfi
	NL7a4+sfplAyYoCYkury+qL3oDPlbWpTYPk8kCjQasbCw/Wswmlrsino0NBWrCkEuUDKXzZqvDh
	DFEBbhMX9NUyOA8fOosBtDehzsjSwpybItxGYtgfWSWfg3kcz74iGTpGvxiS9lj4YneXmqWMeDh
	Dn+pn6+FY0TbX9QLxwhs4rHXbvLK+wuPFAYGC9/ABbgsmSVhySuqLskTQSzAVBT4TLegc+AmZ32
	6N0YYvlJ5tu0D3gszNGLbQdN07iG2GFTz0vpyd1Dv3UD64hXlfRQekfn1Ew9WE+0yNX8O5nEZfz
	sawid9fFVbj7qUeDLX3OoOCmv1anDr39xaIC9h148inHQtlMdQwFL3ymRpw90nRTA2mP2nUX/Nl
	Umkdg8WYZYhPT/3rygJEswYQYMcfnSF8=
X-Received: by 2002:a05:6830:6d14:b0:81b:9d18:75c with SMTP id 46e09a7af769-8309814be8bmr12340390a34.20.1791919191633;
        Tue, 13 Oct 2026 12:19:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a3dfa1sm13280507a34.18.2026.10.13.12.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:19:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 13:19:47 -0600
Subject: [PATCH net v3 3/5] ptp: vclock: propagate physical clock sampling
 errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-ptp-vclock-sampling-v3-3-d3ee4ea62fc6@gmail.com>
References: <20261013-ptp-vclock-sampling-v3-0-d3ee4ea62fc6@gmail.com>
In-Reply-To: <20261013-ptp-vclock-sampling-v3-0-d3ee4ea62fc6@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
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
return the PHC error to the caller. The refresh worker can retry later
without consuming an invalid sample.

Take the initial sample and initialize the counter before publishing the
clock. Return an error pointer from registration and propagate its errno
through n_vclocks, including when the initial sample fails.

Keep the existing cyclecounter mask, scaling and refresh interval. This
does not recover elapsed time if sampling is unavailable long enough to
miss a counter wrap, nor does it assume that getcycles64() exposes a
full-width nanosecond counter.

Fixes: 5d43f951b1ac ("ptp: add ptp virtual clock driver framework")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_private.h |  3 ++-
 drivers/ptp/ptp_sysfs.c   |  4 ++-
 drivers/ptp/ptp_vclock.c  | 66 +++++++++++++++++++++++++++++++++--------------
 3 files changed, 52 insertions(+), 21 deletions(-)

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
index 84cb527f59cc..eea207e5a889 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -42,21 +42,39 @@ static void ptp_vclock_hash_del(struct ptp_vclock *vclock)
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
@@ -75,15 +93,16 @@ static int ptp_vclock_gettime(struct ptp_clock_info *ptp,
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
@@ -115,13 +134,16 @@ static int ptp_vclock_settime(struct ptp_clock_info *ptp,
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
@@ -174,12 +196,9 @@ static const struct ptp_clock_info ptp_vclock_info = {
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
@@ -192,10 +211,11 @@ static const struct cyclecounter ptp_vclock_cc = {
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
@@ -214,20 +234,28 @@ struct ptp_vclock *ptp_vclock_register(struct ptp_clock *pclock)
 
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
 	ptp_schedule_worker(vclock->clock, PTP_VCLOCK_REFRESH_INTERVAL);
 
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

