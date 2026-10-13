Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE3153F6AA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919195; cv=none; b=PDaIo4meYqlhi2TkRBGNAuToinug9Eydz+X0GXTcfphmEd0KaaPRLwiKtVHiXMi/pacPuHcxY+DytnmxjZ7erm8CTJzcHJ6xlhc+i+na2jCCgaxJYbJc98ix+1sfk2mggCe/IM01X1oEU2Ra82oP+IAf2Dt9Xwg24vebJ7cKkAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919195; c=relaxed/simple;
	bh=hLB9iIREQdRTkxWuZOfXaelUczjECboBhQUK9ZkYEUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maZKc8Qbd+czLloLrODe4HBG/j+K/0+utkE5KCNG20CmIR47lNQ0gvoBME1JCivWXQxY2JYfMGjx5JPQaZpfvarHB6qbzn9hhbfcxPZbV87lrbkAFzvRvDjtepF+fSI6l1NRnXd5jPalGpGSjqsklaoLJvaNk1PmumjhOoROB5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arWQXYwA; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arWQXYwA"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-81b54d0cb17so2614222a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791919192; x=1792523992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/M/UZry9pC3NdQaj6klwezszkFb09P0aYrxru7A7Vc4=;
        b=arWQXYwALKwVTSY/cFB0wzfvCEr+fcuR4lyGngU14kEp4keDpOy1+bfUP925b9BiG2
         Uf+f7EdoedNpuYbn0aaOR3ZzGLOqvbLD73Qqs0q4lr8Q9U/NyWPMXly9ZQQwQnvysVro
         T70wszSGyTyphrxDOczwqiQ+AU3zt8GBVm4dUHnTVAEJtQiQYo6eRqIFRS2LMeGKPfkq
         WgzOwK2fjf/Lz25A51I0Ug3kyZCTzCbfCmE0PC5wpQ9xOObBusZQjH8GnpPn3JlcYCw8
         OWO9vso2Q1E61kMYHK3gHedQieMAQ2a7g/mU4qnblhvwik9pleqNdOByzXp+4ORg/2D4
         oN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919192; x=1792523992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/M/UZry9pC3NdQaj6klwezszkFb09P0aYrxru7A7Vc4=;
        b=P+o18M6fNtdEzQskJkAhgmilamYXzn6sGcv8jlShu04CfP3hXMy3WDgy6AVv1o0e0V
         SLaiwzGOS44X+C/RAXNNZF2qlMOtspg/IvgZ730zPzAxRCLS5I1ukzt9YQP3OKuA7B6f
         eLZz1IULwD+lQ3i2iTJw3xXVzFmRfdJ4QUlbb0lXl28imIPKCUyNUqLU9j4GczbjIKVL
         JOdp65SONtjQD3z5ttQr88pNGA3BedH5V3AKp3OkS3jhPuj32T6BcSiKWIE1TPwPYi20
         +jf6cSXDiaGVOB4nXuno1p31WzmkHzHmFma+JT78GAgNUEkPgrXMVeDGn3RAImOJ+gGn
         NmMA==
X-Forwarded-Encrypted: i=1; AKwUvBzo0bEinbkTCldX9krfPDgaw2rS9DOlJBFUDtoYzsrbD2kP/ufUVBHr0itWlewrInTYuHhtqgCMszvci9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUqPPzwafk3CBK1NjJ2eYsxTxI6jXh2hsjon8mMB6cpfiLhSO6
	eijYk1ToeTNWBVtpL+IWumI9LggTYYUx72g+Ip0gSaLaDPbbqsv2HiAI
X-Gm-Gg: AYBFou3nD2azQuAjGzsEx0p4pIoN92cL4LXqrYur7ROo62nsDy3RHxdrmN131cTsov4
	EbQEqN9pNV8xQJPfszrj/S1RwuJ0XUgmB5k/gApgW6DmyW5uMpbc7JqfAJrhAXawMtH/R71Mqe8
	KdjoHrMLQmRHsEIoORY+zpqbum+5d/2EA71xdFggMG257VJ3FTIRD6adgy0QBMUzeC/CbhNrqa8
	XHp++1exfAGhCrRuLdri6wp7awdNBUGRL+BJi4slpKMos3Kw3bj6cjR/AgNzJ8o00vkKKlwnxEz
	7zoAX0LBGbLFrnEwBjDQyt8IyynDAe91DEgrq+CmzP8tnU8uPsIOpeHV1FPp7grsaO3CYwPZ4xa
	/T+7YpEAy9UncU7LgDCC8F96SfLnIKncB9mfE8/s54Lf/7fURcmDQqASzEJKHdjdW08W8xgIuvL
	WQE1K47YdGkc+iAq6lMjPQvRZuFGv3bVV4dHTXHLyv6UicBZc1zLpon44xqgQoFz9/UwaZdecsG
	KQxpkG+CsvptoJzjfuabuW6c91TZkxPRiq0+QPiToSIzX++nNrvDwWZuQxJRyY1pGdgiQGief3w
	+g2X0/5HEFr4Dzgn+PSlm/M914PM2dVhzP1NC4Ht+r6bgJjQPqlCKedruvSXXegRCdprhOGZO/A
	57Ytxz/vecQsp5bidxoHl
X-Received: by 2002:a05:6830:6aeb:b0:7f6:705b:ffe7 with SMTP id 46e09a7af769-83095a338eamr12524842a34.14.1791919192556;
        Tue, 13 Oct 2026 12:19:52 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a3dfa1sm13280507a34.18.2026.10.13.12.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:19:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 13:19:48 -0600
Subject: [PATCH net v3 4/5] ptp: vclock: serialize extended samples with
 counter updates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-ptp-vclock-sampling-v3-4-d3ee4ea62fc6@gmail.com>
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

The extended and cross-timestamp callbacks sample the physical clock
before taking the virtual clock mutex. A concurrent frequency adjustment
can advance the timecounter and change its multiplier in between, so the
older sample is converted using a different frequency than the one in
effect when it was taken.

Take the mutex before sampling and keep it held through the conversion.
Retain timecounter_cyc2time() and its existing conversion window. A PHC
sample need not advance the counter: for example, e1000e explicitly
allows non-monotonic SYSTIM readings. Treating a slightly older sample
as a forward delta would instead advance virtual time by nearly a full
counter wrap.

This race was found by code inspection of the virtual clock sampling
paths.

Fixes: f0067ebfc42b ("ptp: add gettimex64() to virtual clocks.")
Fixes: 21fad63084c2 ("ptp: add getcrosststamp() to virtual clocks.")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_vclock.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/ptp/ptp_vclock.c b/drivers/ptp/ptp_vclock.c
index eea207e5a889..6675466bc307 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -113,20 +113,18 @@ static int ptp_vclock_gettimex(struct ptp_clock_info *ptp,
 	struct ptp_clock *pptp = vclock->pclock;
 	struct timespec64 pts;
 	int err;
-	u64 ns;
-
-	err = pptp->info->getcyclesx64(pptp->info, &pts, sts);
-	if (err)
-		return err;
 
 	if (mutex_lock_interruptible(&vclock->lock))
 		return -EINTR;
-	ns = timecounter_cyc2time(&vclock->tc, timespec64_to_ns(&pts));
-	mutex_unlock(&vclock->lock);
+	err = pptp->info->getcyclesx64(pptp->info, &pts, sts);
+	if (!err) {
+		u64 ns = timecounter_cyc2time(&vclock->tc, timespec64_to_ns(&pts));
 
-	*ts = ns_to_timespec64(ns);
+		*ts = ns_to_timespec64(ns);
+	}
+	mutex_unlock(&vclock->lock);
 
-	return 0;
+	return err;
 }
 
 static int ptp_vclock_settime(struct ptp_clock_info *ptp,
@@ -152,20 +150,18 @@ static int ptp_vclock_getcrosststamp(struct ptp_clock_info *ptp,
 	struct ptp_vclock *vclock = info_to_vclock(ptp);
 	struct ptp_clock *pptp = vclock->pclock;
 	int err;
-	u64 ns;
-
-	err = pptp->info->getcrosscycles(pptp->info, xtstamp);
-	if (err)
-		return err;
 
 	if (mutex_lock_interruptible(&vclock->lock))
 		return -EINTR;
-	ns = timecounter_cyc2time(&vclock->tc, ktime_to_ns(xtstamp->device));
-	mutex_unlock(&vclock->lock);
+	err = pptp->info->getcrosscycles(pptp->info, xtstamp);
+	if (!err) {
+		u64 ns = timecounter_cyc2time(&vclock->tc, ktime_to_ns(xtstamp->device));
 
-	xtstamp->device = ns_to_ktime(ns);
+		xtstamp->device = ns_to_ktime(ns);
+	}
+	mutex_unlock(&vclock->lock);
 
-	return 0;
+	return err;
 }
 
 static long ptp_vclock_refresh(struct ptp_clock_info *ptp)

-- 
2.53.0

