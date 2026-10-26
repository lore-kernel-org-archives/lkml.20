Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038307;
	b=3UgNfYttybb4fXSiTW/pqniMsLZYqvlE0DpLu2OhWkOCIh5l1R0iOQ96YnSJSa9ITv+w
	 wiH2WCDOIL+kycDwHdCSpJyt5jhhhTvDa/v5zm5Num1+G3hbi9/YYoma/7LtkLFb1Zphk
	 PnZdeTt7EHPt/HLdXkbMbkqLbRcNbM/QUpF1//ZRt65vrxo7wPreWEiRc3R7U4xK6XICy
	 suvejIXrQSzUzo/aB7DQpgpB5WYy6fErRunthhhxJ5Z8ygIlHySV39dF/+9JcdtPD4xv5
	 FBUoqepF+mbLy9GbFfVEFYosieeRWNoK4SOR856cQt+1o1p/CgVHu/97DqIuy5/0wnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bOkoHWGuOpgRmWACFRvEzWssB8GJAemNp1/k5sDiugU=;
	b=FvEP/EOrMlmm32aWVFNt30Z1Sr/Bpdv8Su2O/KUXmAW8x5xaP0Kmh9Z/3GdfLxvDoxIa
	 s1Wb5dN5COzHmPAfHIVgwSb4AYHX17Oxw9wff31mU6XBzdDqib5VC/qR4T5QlkKuQw3iE
	 gK9lzgqRoZG8BGs5o9i7LI7QSuxRG7SUZL0zYGezwbXl0EsoDJFaSB9gQXzADrBcL420a
	 1kqAC/7/Imd7DgpqZLFtRWyFSfcHYubRCZXK/EVzj3lAuEwUOdfGPkSTyUIOOUFCvu8EZ
	 4LJoqgfrkq6ex+bbfg2iLA4HmSQEIFUbIne2gE0FwhyBam7OE5uCcOIYWXVYl4Fub3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rHRIvoVx;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1708606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1708606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rHRIvoVx
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-55650fe1f0dso1811331b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793038305; x=1793643105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOkoHWGuOpgRmWACFRvEzWssB8GJAemNp1/k5sDiugU=;
        b=rHRIvoVx8n1PVA4udVrpzyrWFGucX36ATP9DDKkXQ4v8oGM8tdl5k5v/sXnFXWqtuK
         FW7bNPLBP7NpjdSGK3SPdjayzMSxXGwwcmcJ7yYFJcwEU3T8yIp94HF/wzBym814dj1D
         g0DwdVcD+V1RhdCt2Z6+nxLDWR+mhsCeYWDSXFqswsng6zfCdzekUgMeiinY1cAI3ws9
         P/vLudHni14pkiygiD7Zo2gVg0CMKZi9W59SPPZCc3YAE0goWGR8MXL8xKHJEF0PC7vy
         s/KDDO+k9a/+dSxIEXZJagmLXZMgdAg/+quMzASIVOtHIlSLgmxlzqj2ZhYlkrgRiNlk
         XQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038305; x=1793643105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOkoHWGuOpgRmWACFRvEzWssB8GJAemNp1/k5sDiugU=;
        b=rqr9Z+4oEQZ02mUTjfPeOuuAzPtV810eIat7jWz0yL4sCK/6dy63FoXECcBC9u7Rtj
         Lf/HRXa9OPWt0/Y6eOmZr7EcX1wSydeC2vqT+vpUJ+VW/gSwMbshF7khMWc6BWxDEOnA
         ZCFkj8I2CLgEBTQwJGfu8BxuA7OMX3x/fxb6v3VP0Eh0CFMLgsZjQJ9q8cYFuvJYuCxc
         MjbPufzuYoBMHrU+gTGsEPCzjJe+md2IoHOVVI0jRzE9iN4SRJF242gohafd0Kqx+z6q
         boVqknAR2UuhdZxN+/jOjKwy4EXqU1uaZx126KxRAP/iE6OKrk+eptEvorAuikNsedOw
         cQ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTVG5Jy1MlwbozTxen1Sf2ArwXAf6wUINsjkr4RzLjQv538UsLqZUUiK0TZObnF8iy4XrLcBjBGxGoMaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNgg7moSowdFDdM63T7BeDv9Jv4PW7Lkm7ntdHOshJDqJLvY6w
	r5jM6hskBksD9rZ2/cm7OosZGFhSvbXLc+2XVdDLE0Fc/ZLfIRBQt8hE
X-Gm-Gg: AYBFou0ALjo2b3/8r5XuqHFcV2+v/tlXXUPBTnto8KDl+JDk2+BY/DSPP6OqDr+7pXN
	Nn61qHJC7bPl0414EFX0hvXmAPxHTePzrDT4maqOp5Qi662trJ5/ncytO/JxAeIA/HfFXu72Jq/
	BMkON7V7u1AhliUkgV4C+olINLNDZ8b2Gu+wKpMLbC83/KTsLeCBL/8mI2dHbcUYAyWl5ChMVtH
	WSqfXJSL7IWNZdWMEnEx5ATcuvKuCQ72PVs6mq3I26Lyk3QyT9gEStc7bPJt/hPATqYATZjKTZO
	cReFlE5CYi3lxfWqK4zKt5Of9YKGDxGsc6J2SLIyBuS2bjfhxHsWASJN1o6KYJ7GsTkEB64kFSk
	73sYl8SAvGkXsaxsNIY9lPIPjFSJP8k6gXJw22VZwfJoQUmVEGZmmvr8xUNonb/amUtPLOh5ivS
	FTgosDTWLOLqVpt3idIv+2Oa7f7A0ypOYYrYaEYt/MY1tIectoZFx8OHujvIRz79GE+//5ARg0f
	HJseoz2nwWlJ6rewmCoR+uSl2dblhvvugnbXwbLuisUGVikz74hhqxpi3PloiIr2K3PwMLq8VXo
	Xs7Ye7aMEMyTcU62558i+ZStr//5e6OjNnFZ+2IqZIFX2AHEj9YTEwsu+TQMfSDenaQZpqa5pHf
	6FgKFCCxW+u9/GJ5jcjrK+K4vwzJOD5iSPbM1MPFMgx/ABVJzo3zobN/FLNhnKcLkCA1OWvaVDt
	ebcg==
X-Received: by 2002:a05:6808:1b11:b0:4bc:336d:7494 with SMTP id 5614622812f47-55c002734bemr4688923b6e.30.1793038305593;
        Mon, 26 Oct 2026 11:11:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c043115bcsm5795251b6e.15.2026.10.26.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:11:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 12:11:30 -0600
Subject: [PATCH net v6 4/5] ptp: vclock: serialize extended samples with
 counter updates
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
Message-Id: <20261026-ptp-vclock-sampling-v6-4-e705612541f1@gmail.com>
References: <20261026-ptp-vclock-sampling-v6-0-e705612541f1@gmail.com>
In-Reply-To: <20261026-ptp-vclock-sampling-v6-0-e705612541f1@gmail.com>
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
index b97f3a877260..679ae40916f7 100644
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

