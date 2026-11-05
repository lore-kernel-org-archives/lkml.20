Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895486;
	b=o4WXw0krR5YL9bYTUIVSIh7d0VVMLVSBm74ttuEhb46pSEGH+oBtgdt7NWIrQBMVnNLa
	 yvvf3ak6eju3yUpOtFNyM+FZxxQzj12De9CoBG+dk/4EgPUCR//Qm+56WFtk7cPku2XEF
	 jV4/aeidx/cxB6UPnZb6fGlRLT1zyX39s0/zjjIuliLeUrCZOsVpux9HYHyPCNpzzGpy5
	 uxuMkrzYxBO+qpuTO12TpkCdp5FdFrDJfZ/An+kKVShPV2HrpwZ5q3b67pZP39PlWXCWp
	 p7EnkQJNl6Tfs8oDNi/uQ2gwZg8PvqoNR3KGOtOIqKFYtTYewomPAvCtsCs93ZBWxtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rcpn9+uSzInsVdObsHDfzPAAeCWQb6QnmPjXwJKGazg=;
	b=39flqhqUFQ+fkmpAShMiM5CjDAdmfJVXLYKfuIA6OCMob5iXrQwNa4yudPvCtT0X69S+
	 +4fyKAaZZkWD5Ty1F2H0Y4Wn4orerq+C5A/gNV0HzUhgMCs237/94kJvKTnYYxcJ03Me6
	 LxsDGkYfa+rv/4Gh6dUhjvaLqISw7wIdr7NK706Q5MaDXRV0i3+OA2L64pvLUKbr1xVhC
	 bQ9thhcYvK/6SWxziWlttVHYi19aEzGfzw8E6/u+MgPF/w5DvMhynwPqkwxHtYVMsrkVb
	 EZtWTeofAuw6TCdM/bdDGwbG/AE0EZtBKFowHFGZA2uKNaB5ULJ0rkVALxC+choJ9hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asasNPyl;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AD7606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AD7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asasNPyl
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so231699a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895485; x=1794500285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rcpn9+uSzInsVdObsHDfzPAAeCWQb6QnmPjXwJKGazg=;
        b=asasNPyl4ERwIZk3xdEGAOzUkhG1EHELGFa/rvqDri+osKFvYDFLAe9uYVQn8VQjCM
         M0TQNNhHJeE+IymqoVCYd5zbBO9DH4EGaZSbSayINiFGPoE6LLuNkTK4cBQh4XQHH4KG
         kQELqrMmLnVEFt0VioBYZFIBhOrmLIXyY5ylVeqLZ5siBsn21d4BwVQhUKVBXKt8pNwh
         Ih8QVxC4i/FSYLTq5JUzJhjiuXkJoADrnSkuRwvDh5TkFfDTNEYL49wNljWXM3AscSod
         Uzk+pqRymmWXoFkMiClU66Wj3taJTo9N/hqZjf2sUySzkk3DG5iDgKvTpVTA7043sqoD
         gGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895485; x=1794500285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rcpn9+uSzInsVdObsHDfzPAAeCWQb6QnmPjXwJKGazg=;
        b=lYCWK+RldY1GSm+kthU8iyY6wKTq0AbVwNTX/q0nu6aCLG0A/C1fT66m+o4ot2kdhJ
         sVE85WTxJorJZh8I4h4o6KXQGEHmxed1TFJ+BXzbLlxpyM1gOje8r1hXHabhDRf6rA8d
         tYCHrccN58QmCH2tErolrOWum5+4/h1C50EH9iQhAzschNRz1u/6aQKYWaFdJX4prtLe
         X4lCbCCXU9jLLJMVn2hB80jMAodOZuMngk962M0LfTK78313xkuWZPo21QllQwEWXQb7
         oT3OiWf7/2sACXBcVSRUbyKFHhZLi7zjbT23KQ/xEwsE44SLZ1CCnPfW4qmnfOu0g/vv
         CdwA==
X-Forwarded-Encrypted: i=1; AKwUvByov+C/P6EGi8dp1nRAZLw+220Gh5UXKKo0dFbSbWk30hMzYye5MVD50wCBjOv6MIApKX0KCc7J8QTY9xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TMq6gG5BB4rIN/bXQA9JRKhVQDJHv1sH1OXSjE5rtYOQeEkaP
	ztrDjg1ARw6TrhTpf7TtbjTte1jf4hjqFC2G5xnx2LGz8qzrI1AVuySA
X-Gm-Gg: AYBFou1blrpyWkWbSJRX5XjQepsGzC6zamis9jfmSjg0Zqhtf3zOgiy8YOqmqka5ftI
	lmxMjswjhi2efr+7c9SWZOAWdkEl/hp3HfhqYMJ/O+tW0tHIIzJVVrj5Axd+6OjXULdZaQmQ3Rz
	DPak4sHQwpvrr03Ua8tUjQilPcplg4HRPzH485cKMZ3OosalHwbHm0K2ZYNceeajsrMPAPrOBvY
	lqfRm+SUUcP2q8RS84ABaPQ9KAsWfO2Ssw8OMwvLDawDNBmSyo28y3huCsmNP/pqiGqvhdk5qHZ
	FvRG+YBSsuYDj/evth4HpchVFz7crBwcQ1keB1HInwoThZgH+N/YYRyrrxC5i48qEr2Fh3eJLJJ
	X7N2WdsfLb26JWD3VV46NacrqSLVuodD+ta5Pd2iFC7cJzAEaQRxHTo9CR8a1UKphc5qriV3sjC
	Wyt09xE0NHn64bk+POM4zrCm4rVomU26sKJWbf01ReFWKvOYkxM8Xr8hqEIHd3sazu2htLlvwe9
	YtrVvmU/Ifgmst33NdqXx71PeKEB7NVW7w1Pvf6SAw6R/CVBZ9afJk2wL61/6dFA3qHvIVVeaPL
	Kfzj4YPw9VwjqZksj/Sw7yJ647rxNoVBZlUVXH3T1uEut5siJrgdAWcZd1AARhy41KLV4Bnnk3S
	twmJDJH8zWRSAN1bj7IqJ4Nw=
X-Received: by 2002:a17:90b:184c:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3ae897c4ea4mr15905533a91.55.1793895485124;
        Thu, 05 Nov 2026 08:18:05 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:04 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 6/8] clocksource/drivers/timer-goldfish: Set clock_event_device cpumask
Date: Thu,  5 Nov 2026 16:17:00 +0000
Message-ID: <20261105161702.3515900-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
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

Leaving timerdrv->ced.cpumask uninitialized triggers a warning in
clockevents_register_device() when num_possible_cpus() > 1.

Initialize .cpumask to cpu_possible_mask.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index bac84e0f9b7b..208b80c46193 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -117,6 +117,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
 		.features		= CLOCK_EVT_FEAT_ONESHOT,
+		.cpumask		= cpu_possible_mask,
 		.set_state_shutdown	= goldfish_timer_shutdown,
 		.set_state_oneshot      = goldfish_timer_set_oneshot,
 		.set_next_event		= goldfish_timer_next_event,
-- 
2.56.0.398.g882cbad275-goog

