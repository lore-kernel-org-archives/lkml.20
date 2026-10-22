Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682221;
	b=O1fc7oS1ofDOCb1MNV+w/eT4fkvChzgTy4zZCv4mCXLB/s2iCYm8YqaEoTYkc4y/7Tlt
	 4IR+tr7cKo50sYknKNX4FSMYAwiA99AI04c2C4nE1up+Yalmg6vwnEa4Us0JddOpL4bkL
	 6e85dX8lTwXM15GdD+xBXJfSdlEOnZN1SSTq6yzgN7B3GcIG+9VDzAEWzAEbo3iskmuLC
	 tRqA/xuCTXKRaCTsaqSPKyU+exhQbRXPwJu9eqAt4WOyt6puHJsyGQP0O7BeeNePE50jb
	 0JhexOdkLIdgz8bDjXnmC5w6SeslMCybCs1yuxR9xFf2K0wMpHPGXv2iXkOC3goW7Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jDEb6h8puAPE3QoM8kSfzOL4afpqMiINRrdEonSGo6c=;
	b=rxprxz5ZTALlmwvCcdkZUWI0pmpAJ2s/4rImW3mASRr+ZNGlyTz6ELSEy07ng6SLhenB
	 /ogtEJbkvqZhuymNGrTrJnhMtjet2O/43wfkEiVb/HhMLAsxbvv/Azy6Eu/SVDgMd/rhs
	 rUk18JO+5weuOqY981qphSTEiJUM5JZ660jWgJtnNy8twhSYzaHmcgpHz34bqKhzB8uQI
	 t9rJwCLGOV1EXJnF3AFhdBEyQCxUpTAaVjXCv8Qg9STDgmdffsAazsU1yCbWJXDfDu6bS
	 Z7GZtLIu9pM4qmBXolBiXKJP0VjGNkyjlyUE1TrmorxRX9FuIOmPBjVXFhq9cb643dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mElLrz1D;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2975D606B3BE
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2975D606B3BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mElLrz1D
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de2f213b7aso847527eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682220; x=1793287020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDEb6h8puAPE3QoM8kSfzOL4afpqMiINRrdEonSGo6c=;
        b=mElLrz1D0tMQTj8eeBUtaNFdVWOi1zEYMq1azUxAqmnnAvs5XpTFgfKlUlOZu3shM7
         7H1rrFEOlcWGvHPIcnOLZ2RXyKpklWvmFPSnagd+TYKMfurUTzANwrM498DKbbOTRYTz
         wHLoBqAcx65ETDcEgIBAoR3IlFHGQWanuQ+RF21DTNlCDIbQTu83W8UIms1khS7LZwVQ
         iRgIrR2Gl3KiEQZLWaMmLV82gZnuGR9zUQjRHCjnOtsM5lsinUpVLjPXVhovcz8AfVbR
         mH+H+GjNgparOncAnS8FCcT+WKec12jDCysFyzbhhqUM5RUgXSCLYDoSuvugB6STkPZV
         gBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682220; x=1793287020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDEb6h8puAPE3QoM8kSfzOL4afpqMiINRrdEonSGo6c=;
        b=qxyHattLQaWGjrj/Ie/fmvjpIXakUIHb1U8nH3mit7agWhkfHRKc3GKAe1TAWuzHNt
         xIm2cEONha6ueup93ux3ewPpHU+ts1QB1oCdD0sfh8ZFOkMgpmEyTRMPOtGuUyQ0i8Er
         uMyGiJLvaO19UUeFRzX/Xlq53vfLsq1uFuaWnObH3mC1qY7zMoJBRnhKtxTB0H2bcW8o
         HY+6wPdcbz0REGiRp61o0JCthm1QYj8UQPZsjmFKA3twosioxQf62QxqM2KLY0qtdr52
         /dNgCc4oJMYTBguW5PKsIiGub8KzqsG+R3yUMSCmnEiQ9ADMC2zv0uvNlXim2YBVBoTi
         Z48Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+1LqAVAKL8yFZ+dg7JQmVbquUYnZFqogj1ue5uDHE2rtA5bEtaQkdncUsqtmjvuN47uY4I36tEgmEo3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHKmRmnX69GZy7h/SVQ5+zpaV/Nsn6lzhzbogVqLvvDa81H0/k
	Ot+E9VItGNMDJwtv/5auawWuF1GK7gfbufr5655aIF9hMMIkiIH/qhi9
X-Gm-Gg: AYBFou0EWGvLjQfUjXiybQvPTevFPqIjiwvofgmkocoa8mtKGJKLB9D+xHdJn6O2UHW
	qYGdZ0wsv+80YnvSaD0f1V71L/Gru/ZRPFc/yHuh2vGh0S/RHZzdcLmM5Llbym8x7wkmtCnBHK9
	NIOME/bBkEXBWtO1KSODYeI9KgzYm0EHCTQC1xQiXnUonmGbzQswmjlBVuqNnpw2pNCxZJVqdHP
	0MbpKa+lWI5g7F2Kn3zQSJW6nEFHBLval85NOvsPmNW/4DaTUnl/QLp/mmle8ocWDAU/fE6BRkc
	Bv1f8Ng4A8xzbF/4uRwQK/rSetGaGAJuV/BWB251KbkCJppwSRrnCPI/pDKeZX1fq7atX3XDNZi
	Yqs1XeAU/CAzmr2P5OMwRaxBoMGXMFhi/qrwqS2zYxo063i6TZvzE4Kei3PINJsfaBBQSMq77E4
	sbKE7CG5QPEFtYe6nQBgRG/tpLjADHyqz59H4rB4Db9LCCki0wwC5wnnUabFmfm0gWvES0YjpIl
	vZ515Je/O6hKecZEMPvhEKIV30KlahWMqLpYMXiRVev7KPf8/KbsjNwbx9YhmJ1egtzYpnhHlow
	PcEfmzhu08pQUhGpvIe7IKeQQAKBjmSrQiJh3p433iqxnK0FIANfX8g4frh5hJefVv6ua6TTM+7
	3EsUeg4cmSHl0vYUIo7dSqZIdZVU3rejzBWotJDwI8LiSCtvSGl7Xcfpg3Vzy4Nxn8o8cfl1w7E
	dExic2UlXI0o4zp27xNGr7LTrr
X-Received: by 2002:a05:6820:4b8d:b0:703:27e0:356 with SMTP id 006d021491bc7-7094283046dmr3279957eaf.73.1792682220019;
        Thu, 22 Oct 2026 08:17:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d5eb8fc0sm4685631fac.1.2026.10.22.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:16:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 09:16:44 -0600
Subject: [PATCH net v5 4/5] ptp: vclock: serialize extended samples with
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
Message-Id: <20261022-ptp-vclock-sampling-v5-4-06ceace17bac@gmail.com>
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
index c10eba6443f9..4e98f119de72 100644
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

