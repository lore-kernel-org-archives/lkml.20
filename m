Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B579243498B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832995; cv=none; b=S7Jk817bhmYtcgicu3qp66Ci8w1IpbkshSsz69iZpkgtg8f/zDB7SYX/VRjagR8pHpw3ZFxuDVknRI+Nzg4iPJksrEJ7ec8Huz5jEvGdBu80+G32Mp6+6CSypOispmE0vhd48jwPF5QOtBhu5f68c8jSiIIQryK/b4B0WZzbkTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832995; c=relaxed/simple;
	bh=17IbOXgpu5qvWpe9DfmWVZGYpsQSD8J7hEMJ7OZBgJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rnb+UR1CSfurrbhhs77iCsu3cA6GKkSt0rrX3A97z7hBxJTvTUWdJUazVkQmnr3gpcEBcSOc8c2FFnSIJQZkWB5RVxyF5L5e0X6/afP+SZzBOJa49eZs7c+7WsIh3G6IU/HSwr7LgxmLZOfV5iAHoWOyxpFX7QxVqw9BW3ODmmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApodtGjW; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApodtGjW"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6c8f6a53fabso2025702eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790832992; x=1791437792; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ImG2NcKaeowgbT7GRdQdhpYB5WGVuiPpUhMg0VIHXxc=;
        b=ApodtGjWVsBnPYbVbKbjqd0gc89wGHVHRySRWHW+kpkKA5TwpkT+In8/v2Rowq2AZb
         GM1PuHgbUszsUz+WLSkJZAVyvZBL02Wug0v4XBl+o3gSydrEN7c2nVDxbde8irO9cskV
         i7sX8Fvhn+yENNllGnkXHKHL44cFkyiHawhwNYuRU71QfCU1uL4cMEqB9iEqYpwt5GSS
         51UlhmeTzfKF1pLn/oLy2r15iPd9vzaA9xXSxhzUjE46uN+xkYKWDrSUbRKx1izmNmIS
         Bj7O8kDxvEg9YK9zFYRc3+Qyj7lOzrHoLZosgmytgqpllwiTxrgDY7f+vrtwxBJ2KZYR
         J56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832992; x=1791437792;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ImG2NcKaeowgbT7GRdQdhpYB5WGVuiPpUhMg0VIHXxc=;
        b=AcKptzUzGyfbK3ApuQ+8SGRFoziKLHlEKS27LgYg1Sohp/gC6a6Rkb8TyKFRbVloVn
         fvFsHVA/3EqxMsjxRbH1LNCYNwrHqSoll7hwRPHTmU+v8milW4vOLtpFvz67wBo87A+K
         /+Ai8p/Expopvhgl6aONIi111lRYHUZjCig08Lnz5ibfaOM+D3pWYidUaxAselkCZVMQ
         FN1Y9mxtnBjXwiKVao44VV32qF8f+RchdmdqvS+x3r5937y8QtgT/RUWbkpFTPHHp31e
         X8CExF/2wvLDsP+k8V9LXttpo3v31LHMdr6qKZERgjhlJYvhH+RNvRkBt+O5EkcnMwJw
         +ofQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD4BYN5xXFhNlxixpx1l/ESEvGg34Abd0ljoW/XLvXbNkXUZdfXHrWTpCPNy20ugKCF9eWFxfmsQxY/sk=@vger.kernel.org
X-Gm-Message-State: AFuF++lC+yBOLWJMNP1pBEMRIAcyfykk7nji3zTBkwW/XZkAV52y1oU0
	IKD6Wc4PQMtB/SJVXlaRqPe8+N14Wt706E24KGfA7Ij6XY8fQQKo/ZWX
X-Gm-Gg: AYBFou3YctN6D5Xw9mqUz/zrQPJmiGvHgIrMNb4/QYQeKqlhPs0jfObTPoUmNRfDtOZ
	0febAl8NeeoUiurbbj2EM2lWXMFEgp4imalByHE22EFnTkykhB67s0+ng1IYtwRAxLrvz7Ur3Nw
	OW/NA5/yTXL58tCou7+675Jjd05ktuvDy6kaOkx1FeEih2IkTUtxd2/pqdSPMcC2MS8ZVfHEWvr
	MpW6epyCIS0/xDCIRlvOkH/z8DoDdpgdK6TeyHMVU+o891p46yUPYzX60N2Z7+842w92RIUZaWv
	DYisefFnWpNyw9c0M7MyWT8e5IIRUBQfUy3lK0YfpjhmSmv0wK0do5oyyVZ1/qEr1jQHahQTvyG
	uV4E7xPRoqU6/qpl4ymhnPu28UGcSjKR3qvOwu6+LZWo1g4vxbjm0Yje6wucQDYXSYhgAzWERTe
	E4Qsu7WTj/m7o6CquKqhD0dQ8e3NMTWB2qANar6DUaa5ThA22alJyb+zjCGzJ9NdfieXaSoALhN
	3EczJnhpHFq+gF7j7YPoWH00k8pWoRqQBJ9hbHVhJJoElsTeLWQv9qwEzPK+iNn9AeRTEMVOxCv
	qMBLekD//ip5Jrs7ubdVLF2ylJu9NZMBtbwngUcBFM+HEQPjcUN3HE5u7hu0fZwu+e/ebYCBimM
	1MDWquZ4+NWspTcOKwhA8RQ==
X-Received: by 2002:a05:6820:150b:b0:6d9:5232:1774 with SMTP id 006d021491bc7-6ddbb1b07cemr1677261eaf.28.1790832992092;
        Wed, 30 Sep 2026 22:36:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212a4139c7sm1860223a34.7.2026.09.30.22.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:36:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 30 Sep 2026 23:36:30 -0600
Subject: [PATCH net] ptp: vclock: reject failed physical clock samples
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ptp-vclock-sampling-v1-1-c11bc16691ae@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2w7CIBBEf6XZZ0m2UKH4K6YPsC6V2AtCbUya/
 ruN+nhmcmY2KJwjF7hUG2ReY4nzdEB9qoDubupZxNvBIFFqtApFWpJYaZjpIYob0xCnXliUwbY
 NtmQVHGbKHOL7u3qFiRfofmHm5+t4WP6Nd4UFzeMYl0vljA/Ou6aVihXV+uy9RGzINByCIbRaG
 +nJQLfvH4nkS1i2AAAA
X-Change-ID: 20260930-ptp-vclock-sampling-902f98408c93
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The cyclecounter read callback cannot report errors. Passing an
unsuccessful PHC read through it consumes an invalid sample, and a zero
sample followed by the real counter can add an extra 32-bit wrap to
virtual time.

Read the parent clock before updating or initializing the timecounter,
propagate failures from clock operations, and leave its state unchanged
on failure. Cache only the successful sample for the infallible
cyclecounter callback. Initialize this state before publishing a newly
registered virtual clock.

The initial sample can also fail partway through a sysfs request to create
multiple virtual clocks. Unregister any clocks created by that request
and clear their index entries, preserving the previously installed clocks
and count. Otherwise the failed request leaves registered children that
are not included in n_vclocks. This cleanup also handles existing
allocation and registration failure paths.

Fixes: 5d43f951b1ac ("ptp: add ptp virtual clock driver framework")
Fixes: 73f37068d540 ("ptp: support ptp physical/virtual clocks conversion")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_private.h |  1 +
 drivers/ptp/ptp_sysfs.c   |  8 ++++++-
 drivers/ptp/ptp_vclock.c  | 56 +++++++++++++++++++++++++++++++++++------------
 3 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/ptp/ptp_private.h b/drivers/ptp/ptp_private.h
index db4039d642b4..4ff22adda652 100644
--- a/drivers/ptp/ptp_private.h
+++ b/drivers/ptp/ptp_private.h
@@ -75,6 +75,7 @@ struct ptp_clock {
 #define dw_to_vclock(d) container_of((d), struct ptp_vclock, refresh_work)
 
 struct ptp_vclock {
+	u64 cycles;
 	struct ptp_clock *pclock;
 	struct ptp_clock_info info;
 	struct ptp_clock *clock;
diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index dc398c6b7528..9c25d897be19 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -225,7 +225,7 @@ static ssize_t n_vclocks_store(struct device *dev,
 		for (i = 0; i < num - ptp->n_vclocks; i++) {
 			vclock = ptp_vclock_register(ptp);
 			if (!vclock)
-				goto out;
+				goto err_register;
 
 			*(ptp->vclock_index + ptp->n_vclocks + i) =
 				vclock->clock->index;
@@ -257,6 +257,12 @@ static ssize_t n_vclocks_store(struct device *dev,
 	mutex_unlock(&ptp->n_vclocks_mux);
 
 	return count;
+err_register:
+	num = i;
+	if (num)
+		device_for_each_child_reverse(dev, &num, unregister_vclock);
+	for (num = 0; num < i; num++)
+		ptp->vclock_index[ptp->n_vclocks + num] = -1;
 out:
 	mutex_unlock(&ptp->n_vclocks_mux);
 	return err;
diff --git a/drivers/ptp/ptp_vclock.c b/drivers/ptp/ptp_vclock.c
index 84cb527f59cc..6378e9a8cd80 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -42,21 +42,41 @@ static void ptp_vclock_hash_del(struct ptp_vclock *vclock)
 	synchronize_srcu(&vclock_srcu);
 }
 
+/* Sample before changing the timecounter. Its read callback cannot return an
+ * error, so passing a failed PHC read through it would fabricate a wraparound.
+ * The caller holds vclock->lock, or has not published the clock yet.
+ */
+static int ptp_vclock_sample(struct ptp_vclock *vclock)
+{
+	struct ptp_clock *ptp = vclock->pclock;
+	struct timespec64 ts;
+	int err;
+
+	err = ptp->info->getcycles64(ptp->info, &ts);
+	if (!err)
+		vclock->cycles = timespec64_to_ns(&ts);
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
@@ -76,14 +96,18 @@ static int ptp_vclock_gettime(struct ptp_clock_info *ptp,
 {
 	struct ptp_vclock *vclock = info_to_vclock(ptp);
 	u64 ns;
+	int err;
 
 	if (mutex_lock_interruptible(&vclock->lock))
 		return -EINTR;
-	ns = timecounter_read(&vclock->tc);
+	err = ptp_vclock_sample(vclock);
+	if (!err) {
+		ns = timecounter_read(&vclock->tc);
+		*ts = ns_to_timespec64(ns);
+	}
 	mutex_unlock(&vclock->lock);
-	*ts = ns_to_timespec64(ns);
 
-	return 0;
+	return err;
 }
 
 static int ptp_vclock_gettimex(struct ptp_clock_info *ptp,
@@ -115,13 +139,16 @@ static int ptp_vclock_settime(struct ptp_clock_info *ptp,
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
@@ -174,12 +201,8 @@ static const struct ptp_clock_info ptp_vclock_info = {
 static u64 ptp_vclock_read(struct cyclecounter *cc)
 {
 	struct ptp_vclock *vclock = cc_to_vclock(cc);
-	struct ptp_clock *ptp = vclock->pclock;
-	struct timespec64 ts = {};
-
-	ptp->info->getcycles64(ptp->info, &ts);
 
-	return timespec64_to_ns(&ts);
+	return vclock->cycles;
 }
 
 static const struct cyclecounter ptp_vclock_cc = {
@@ -214,6 +237,12 @@ struct ptp_vclock *ptp_vclock_register(struct ptp_clock *pclock)
 
 	mutex_init(&vclock->lock);
 
+	if (ptp_vclock_sample(vclock)) {
+		kfree(vclock);
+		return NULL;
+	}
+	timecounter_init(&vclock->tc, &vclock->cc, 0);
+
 	vclock->clock = ptp_clock_register(&vclock->info, &pclock->dev);
 	if (IS_ERR_OR_NULL(vclock->clock)) {
 		kfree(vclock);
@@ -222,7 +251,6 @@ struct ptp_vclock *ptp_vclock_register(struct ptp_clock *pclock)
 
 	ptp_vclock_set_subclass(vclock->clock);
 
-	timecounter_init(&vclock->tc, &vclock->cc, 0);
 	ptp_schedule_worker(vclock->clock, PTP_VCLOCK_REFRESH_INTERVAL);
 
 	ptp_vclock_hash_add(vclock);

---
base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
change-id: 20260930-ptp-vclock-sampling-902f98408c93

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

