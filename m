Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F7B4FD278
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792107230; cv=none; b=uAODivsid641wmg0tP3uTWYzpC6tfUkDDkN0K+Pmn3x0LI5qnsPQosrkTaN2xS8ouI6UgpAwZA9HfnwpPKajjyKwUmH1bxHq2YEFxeqd5pOsBOZkoWqTlgY7CnFYihFm0E2UmzelogjvHmWf2MH+rmgtWwdFDdP7yH2kk8GIWK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792107230; c=relaxed/simple;
	bh=8fFNiipPoEYTI9kJgYaXWKF/L91RircxH5iKO4nRQKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zc7GQdSU+KonYyabrWIkIs94GBid+eZBc413NIIx3bTA948wsxJay0C/4zrSoCz5fho+Ej4HklfNZPXJHVJJDhfzqbToAuNDdbdGk7e4gbhn9lZ1GcpwP26w3n5vRgTVRUzoVcvIRjDCHjbUPl5T1nKkrMr0CAo+T+xJ2A5yTNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJeYv7o7; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJeYv7o7"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6faddda49e7so2615144eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792107225; x=1792712025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+fARNsD1Pjz/B72o/CPW4A26RynJA7qBILUXZsof8Y=;
        b=DJeYv7o7HwsWAd4Nhu0AsUfXl/YAqXjXNAl+yxeHvHxWkOZ9OYHeHl0pv4DE8IQj6/
         l8KrWyJBlAjZvK4fAxmI5zxr00LUCWw0SDTdtl93iCp5S+kVH3K63HkHjuLnJKDjXDck
         ZfkOrRxQu4zgpHKtKc+V0g1RYf089vZptJWIZlum5k+iYqXnOINbvKjpXOya5gduUCHI
         qZ1RM465ZBqYy2JcRjKmapA36BWZXytakiBprrlko7Y8muPZrtxFRIPZyQGdAc5OazOG
         fLHNA2HyFyWVt4hPBuVJxcibKr+MaV9m9XtfTNpjR6qnRJjbCxlWnKV0bv09CC+7/o85
         ORjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792107225; x=1792712025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+fARNsD1Pjz/B72o/CPW4A26RynJA7qBILUXZsof8Y=;
        b=i8CDsfzr351cWwM+9GYLqxm1s1t4HwcB23rAWs7i2lKUctsswvFN9WGcNsKI6dEMOr
         po0EjcFSYwgKzs72+JodQgT1Xlph7VC5REvfOvXvWGzWluNUueuMPY1T+BElHXTloAFv
         DuudPE0nPO90n1+drU5+bezV+M9DA2tJD6A0zT6ujYoQ90vMIiZuVrMk2cTo0q5HDlVe
         esT4UxzFjyKCf0L5L4/S9Mejl19p06wFR1ErX2jU2UK1mF5Bo4Hik/qmQeNDEdbh+p9P
         joMY+ajvg0jCWUJSuXlOnS72bY9bYh3Qcqo7uz2rJPpt6cN2ah74F8qBWh5FItcxhzxT
         T/gw==
X-Forwarded-Encrypted: i=1; AKwUvBwYtcdoj3GPE+ahi/jH8LoBEAF7UeJstNZnwdV+LbpWVT0e77t4b+2OJ4+0/F/XEG4fWJ5aDQepvKUHKPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLAtwPYNRx/aon3E3tMXhX2TOQv+QC8fJMGy799fH/g1i+Z0Rq
	iacVGMuvo2piokxhDhywn1t8o+b3XoH8/yA6746oHC3Sbn1fLVZPAzKp
X-Gm-Gg: AYBFou15eQqvFnP57uGRxFQk23yOYaacUiZAn3TBEVrTCRH7NFaiq16ARlDS/8TB/OP
	QYETVtaYbqprAeq68QxpX9NJPxe/HVG4+LlxzzngZ3u9fJyM3E1dWfCSZ35qj9ezjEDtz5DAP2g
	ceVa9PzoF2VO8iuv/15C2HFM3P1IZgRtkUWT7x7IajuMNBiXv6z/dnrF36ChBDVMv3n7fJIHT9e
	QoHhiih72rnUQZJDNGDYPiJEnOmbqFuvtzhsm7mYDC/cho0BroHeFhKO/z+aFG1iZk+gp+37s3L
	/IQbD0hPEXThJEJX/YqZX2uKaC9mKkIphQZiqWhRWo8cNRukV49jAE5l+1B+Yzb7RsATnVJdajw
	cLl+OUy+IQUeQCDR0vwdsJRhMktEX0IZIFPwERCr+QeSE5rfCUQp3hdzWgPr43F99r4U6jwgOYp
	9L851kxs8fpI+5rRWu4g/FSkybYuEBh3Gwjby6XR/Ey5pSo4v5OtPsqYop0pRPypxM6HEKy8txn
	ui+D51MmyMyVPB7BZB233LQzjqblmMVEI5ZgMFCuEhUkN6IJzcO9ptohJm743+dqOpsDF4EuDMO
	bYSduFuTvZqpPpG+PK3zfVdDm3Wf0JdEapt6A6ytk9amZv+47t3trNJiJtLX5BL0keqmipFwqEg
	Bs0+X7ZiDuKAZhI7fH/DIPRZb94sRTAsp
X-Received: by 2002:a4a:ee10:0:b0:6ca:46e:b06 with SMTP id 006d021491bc7-6ef0f1b83b6mr14516002eaf.52.1792107225019;
        Thu, 15 Oct 2026 16:33:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70188bd9ecdsm525519eaf.2.2026.10.15.16.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:33:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 17:33:34 -0600
Subject: [PATCH net v4 4/5] ptp: vclock: serialize extended samples with
 counter updates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-ptp-vclock-sampling-v4-4-cba6ffc8ceb6@gmail.com>
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
index 5f49f81891ef..88161be5eabc 100644
--- a/drivers/ptp/ptp_vclock.c
+++ b/drivers/ptp/ptp_vclock.c
@@ -115,20 +115,18 @@ static int ptp_vclock_gettimex(struct ptp_clock_info *ptp,
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
@@ -154,20 +152,18 @@ static int ptp_vclock_getcrosststamp(struct ptp_clock_info *ptp,
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

