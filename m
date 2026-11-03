Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674921;
	b=qZG/xIVRBirSh+2WqHpTptZq9HnRs7Yc1765jEpMBeND2YetxPiV1xC9pJEA6tN7rDYs
	 o4MIJbozz4GERPmaOZdQtpkUp9REc7h/a+dP5QMQX5wIDSEJJsYuCRCsqCItFFKC9/mAO
	 KMEgL9gMbFxDdFM2q1E9zRkLwrpnuS2T1iP5SyZuRp17Qxd1Pm0xubBDi3Hg9TIhL+ApP
	 5d8v47Dvy1YlihNR3Hrt42wpEdJB0itgQ1lu10z7LbXmgsOD8+FO4yMK5s46XE3cF0owA
	 cs6gPHfjXWae6r3NnR6uxkyTLr9nqbeJqatY6y5wNpTJKdDSTkqu5ZSNk4kf6nJEP/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
	b=RVSXdQCvdZZyyyIwQ7dzNFdwO9uNLjQolSq+MjDuwowY6z46N34cC0PcouoetkjgMQPw
	 ge4KejHW6HfW/A88pYfM5h4BBhwUz2ZtUp0B1l9mc8EtyYk2KZdFGKcwfCvI5MT89HRmU
	 AjVq3UPuDTM4TAc68R6ftm6OQzJ7gR4Ilo1dG1PxeQ6mFSrEbS7b/eldV+zF5uVOK5ZyN
	 2yrnnPOQ3mmnitq4MldiWqPfO8fKoYi7LN2456hs22JD8kIgZdHt6/RrcgJLMKTmlG174
	 5Yj/4cD7b6v61BPtlbHZP+uSRs21qpIt5+bK8hL5mvn3SaKR/IkfhzHQM5/74XfCjng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOYl4ogd;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AB9606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AB9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOYl4ogd
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67990a45e02so3320394d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674920; x=1794279720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=TOYl4ogdb19rrTANhULj+eFN1j5OWn/vev6rwdTNBzNkBSfH8SmL0aFxsrTDTjvKM5
         Ql5a14gxo2XfSne196JqzBJyTiOAUOlvPY6Jy3vG7jagqQWoWK4dhDF77N4cJE1TWmdt
         eQAEmWFjRzle3VIt+5an5Vgv2U9cTcMXnJ6epIOUBnLYrWNWZ0WNYs0listXU+3PbrIv
         Q91rbui3HqYJpn2WCbQVNIAyP9K7PWsGtSa4FwvLNiVUH7QaIO8BQ4KbcjKc7lqtkWAD
         MxXbiC5NRK9I+/W4tSciCrrhTchsjw4x6cp7V4/syYSI362SA8AnxHN6hNs8OXPfQh9D
         jUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674920; x=1794279720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=GIghOi+ZWEETmf4pyHwTd/+m69Cd7qcz9oZRud1+SddWM7224+2aaAp3B3rI/JybR0
         xtTzrOejZIqYpM6HGcFvmwTOgEyV0cmqPWzXNdx0yQLiKbACffff7Q6TATnXH1Re4KUD
         Nw5+wbxFCk+4WdDeW0c0ZhV6OWsQ3lKtojM0hy4ILl+qzdCFZLsj+LozWi66EptxvNP6
         1Mkmzfii9+sjgg1avPfkZi2zms7HBy3s+I77Yu5LbiM+ZLAojM7xPTbpnNE6LCsQY6O2
         VvNchVnz0hFeCto5HZShIq6Kk5+/u9iQiMq3m60g/rULfH23HAfwvc0chmQXWogn2gz7
         iGDw==
X-Forwarded-Encrypted: i=1; AKwUvBxaiDD9AO/T6lECkMwQdsCPMFSUOYobptlzq5HDJeKJqBIBIZhVbGcxfh03XBCmgSMCtsyGC/friCvylvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5djWd/mLc2Hd6EiNjz+qT+FENpiRgQ9CM1zJgF1FcQO+NXv9H
	opJ0cNsa+KM7XoKfSc1c1/R50J2ZUToi8PDkoF3TmXUrnzuGzdN+y3Sh
X-Gm-Gg: AYBFou2LBayydbimoRy0GGAW5JMDCZRVLxmT4Bc2kvv7+LeX7+5fRqUnyQ3/lZEive1
	sxAuUUnwY6eFtZQN5euEdFzNoUbh5roxPC6Sd0KVBjDa30uUicDVfhjpVtipWOVIeC1nvpkXrBa
	grnvNYRZ/CVrtvUbjelI9g8f1LT40SBIsBhyB9rlIzQcbmX4nLOEDV75ZclX0hOsAV2Q2Up83Vn
	tTqKlH3htbz9PpdMb08rVpEkBC26fomgjaB/BlNQKQP52/0CSpZoZDPBGth6zFUGrx90xkEhiXt
	0CcBJ0z2sEZJjNspEhlrgAvDDPvqr8QZ12r7nEtsD4ndMAQDdohuqu2niyXHk86dlm3hjHD+1aV
	p/qQovVqCGr8jS9UxUbjxRro4Ww+JDizsrAJW1twq+rPiQAhIOtPCkX6/a3ACo/lKcTXR674ItJ
	QoeGBveqBWnSyLDqVYhEwqHCWcR3Xzb0nEKx0XAYTKOUG/cTh5ox43d2NdZ3m4ETPQ25VlryPvt
	fE1LrlPlYrLHZWhkCGTKpA9opMbTsN1J4tJP6WXyup6MYlgfxt5b+HMJoEb6GJUppNOVfKP+QPs
	7NfF/IqTOqd3Ic+23qvlS3iC6qFtGybTypw1rDF/fcQrkIgzytC0p3NMgr3l7LiDGBl2swMrRq/
	KcNGf6XlGbQ==
X-Received: by 2002:a05:690e:4399:b0:679:cc49:55cb with SMTP id 956f58d0204a3-67ba50628f4mr7001226d50.99.1793674919694;
        Mon, 02 Nov 2026 19:01:59 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf26d91asm6227179d50.5.2026.11.02.19.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:01:59 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 02 Nov 2026 22:01:56 -0500
Subject: [PATCH v4 1/7] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
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
Message-Id: <20261102-alpha-profileme-v4-1-61e00f5e1da8@gmail.com>
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
In-Reply-To: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=IGfq8dWu2iMEFoz3MC34tYu6sOJyy2DqaUpgqZ45fio=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i2WrHbee/vB7LPJ3dovXkyYGH9pM2v+5y8RCbOS6
 +78TMqx6fjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhr9ncwMqzbOam3NY
 QnSNto4YqX7Gv50+z9XT1+d77n2RbjUPy/JJqRod9QW0rOu3GC6uxDX1e81rd2bPrH/DwnbOpHc
 fmnLBtd2AE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
logging options call takes a flag in bit 0 where 0 means "count all
processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
0.

Table E-18 of the Alpha Architecture Reference Manual gives bit 0 the
opposite sense, but the PALcode in the ES40 and ES47 firmware agrees
with the above: it sets I_CTL[SPCE], which enables counting for all
processes, unless bit 0 is set. Linux never sets the PME bit in the
PCB, so if 0 meant "selected processes only", nothing would be counted.

Add a name for that argument and pass it instead. No functional change.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 2 ++
 arch/alpha/kernel/perf_event.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index c97b82a1f7db..1fa9bc813263 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -23,6 +23,8 @@
 #define PERFMON_CMD_I_STAT 8
 #define PERFMON_CMD_PMPC 9
 
+/* PERFMON_CMD_LOGGING_OPTIONS arguments */
+#define PERFMON_CMD_LOGGING_ALL 0
 
 /* EV5/EV56/PCA56 Counters */
 #define EV5_PCTR_0 (1UL<<0)
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..2d9383425357 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -728,7 +728,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
 		maybe_change_configuration(cpuc);
 
 		/* Start counting the desired events. */
-		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGGREGATE);
+		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGING_ALL);
 		wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 	}

-- 
2.55.0

