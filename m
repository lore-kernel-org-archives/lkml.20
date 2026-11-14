Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699448;
	b=Wj/0nikWvXBqjnh6119yH4pgTX2kCCfEcQjmuisUzWYhCmNx2rle0iJG67v8sIQb5HGl
	 hZDQB9olzLxatsM6yQ4A24dPjTceV309RoJK0q4BXCUQtb+fBoEupocXN0dyxougJS8ao
	 SE8cLJKKJ1Z2Iy1FSl1z4CM7oMLbIGbtHlFPQDkJ34jCJaIv5DRckHiP32jlNFiunt8B6
	 EnXnCcjO9EaDNjjhx+ShGNOsSX1dZIBhnrTE+ZBLPvPG6A+vQ6OUjkaXtkPPr3QPL5BC7
	 Mqe1C8l829d3ySDgPZ5EXIF19xufFjiWaloOca7E3JK9wL+7fHEaY+Cls3tdm6Pn4MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
	b=AJ9FU8X+oNirU8vetQSFD0j7xEQ24LvnuJz+2Dx5WMGPWqPl1+qaWGhGxhw1fTX0SaNJ
	 Npozk1o/29feVlx41wjwHGHBrXWlFugxxKlsrKdJrbKS4Qmc7/k8sB9ICK70OfcOQ9f60
	 D3xbTFcvLjh0ay+Ht9nubkMMbah1SH/KqJJVqutdSynXDf3Ca2HarkLDzfUbI7H+Ksd03
	 Ch6j0/CDufgmjW8G6C65YeVEXYiDIynI9vBqiN1uv0dT7MEbyjdU6k5w9jmIrMxt2oFTC
	 Tc9lwHeh0Kq9ocJMUxGdK26xe2IXfbkMqmvV8BhaADHsV0eTr5v845psNBvgbYNKfMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIUBClTd;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566FD606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566FD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIUBClTd
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so885908a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699448; x=1795304248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
        b=WIUBClTdxSmsCjNFgZRykFI8qBlFs90zubMVLvHdAEPI0NnJmjEootK/nv4yun3Tup
         e6QBGb8VPaN3mi6fpFVVDaMLWPlObza3U2yXMqx+mXwu1a1GIIPPu0UnJiF9cnQKiO6r
         vxq3sgkSELHUUrf5NkER5QWnv2T424w7QC0V+/K3t8n7rZqnH9ftcbM8z0Ou7lkY+cCA
         uTmwWJ2UFakdP2BlLyfLHl8cKdk/7nBVcoHEckH33RGcu5OpDT1MVPvUVUZSfh3FcISq
         zRacdjJVZVmHWdVs6G3HUMWBHeiibmDY6iNZlJ463Ubo6Gvywxjlh3rzFgGlyL6DQv2Q
         oRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699448; x=1795304248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/05SBYoZ3//tmYEVR+U9kWXjnHi+JJTkJcmENCb0oJo=;
        b=unhS1U5+tMa1ZID88wmBqYdr29QA4+L/YHyMxbvYOSgRy9SeAMSam4WTc4NkHAodxq
         STCpx/80pBkAk/VWOuGlPxEFEsKRR176al8MQb2MyE15UltPyWXBzeXmV7CNjYkBASEq
         aHC3vqCp5IVXfNuZI+hxbY1JUglGjj1oCn/H+QViWVUhlt/HsuYBuWizxIeafBzk+mwM
         PLTpsXPEDaaPyOfWmolrr+mECISKxDyJlDlMRiFFdeIhyKIjJo+GF2GelFSySYXItuq/
         q9YpGq6XshObhix5ygzNG562C3QuOQx3++X1fLgLltyEYyLd7TNFDGRV7tTriRyILam2
         OlBw==
X-Forwarded-Encrypted: i=1; AL+hErGHfBrYWHQtN3kWz8z4EGe1fi+Rcn7QdHU1B5wvs1etxZQ+7Nhdp0OCK0LKP64NJtJ7ByB0cOOllZdQZMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rMYRPVN9JBlFK2aNVb4Cf7CGHCuWL6hpEss9eSmogm7hCtg60
	wh6wWOkTa00Oq0G/V5fV+zKX9kXfnmZypfdSJMPxLnjtWU/Yx4i2P5aN
X-Gm-Gg: AYBFou3NhOzz4bf/7Lypq9UFMEb/qytaDpmgYG1ZMX6hOo86id2EHPy4JYg5/+OQ/39
	KwtrheMan30DcTwMloDTO9X2Ol1Ayahgt4VNMRODakYr/pyML62lIbbkWVEd3+M00aty8MXkwIu
	y9SUIk9x0c3v720W9zfUve/wyOAIkq7dkY565JLMbnMExi+v3DLYVLWPZV7Tlym8nO1AXEL2HJR
	286k4+izN2BvLhr+szbffc8tqqchESFikC1YxluonAYxSbOBqU8uWT9PQViGJqocDDVZ8sSs0vx
	kZKTcdZAfty3Xrv3Nfqw1KP9a3ESbbKIwH71idVZhyhOMY/NP6T/LAHXE+giAFe/HiMU3ThG6Uf
	rEw2sj5D/WWoYvxixh5RT8JSTywa78wkphfhJwRWDTtkHCoglXQBVdEk0nSf84gDDj2u9UtBDVn
	vvnum8vY5ADt2U8bnPox7Wbj//YakVMfHmj3WU019qoQRFo9ftt75cBtvm2NdmCN8wvLNBQFPmL
	o0eGsifbltQNScE2okjVmH9ztgaPqHaeGM0tf0YJaBH81jWtxvcWmEo5O0KBCePBDnRCaJWbVKI
	xuGZHNB29YbOJhasG1fQRZJM7vwlpfNXCEOzb9iExAByVKiJgE0BoO0bvCJNX5ciKyvHoImgrcY
	BRpBVVwcLDXEIk1Eo3iNIuOmaP0K/jlbPgxLx87v5GRwZvkR59U9EsnQmd+sLUq6gBNBqG4JHqR
	ntXA==
X-Received: by 2002:a05:6a00:2346:b0:8a0:2914:5d27 with SMTP id d2e1a72fcca58-8beb714f59cmr6118058b3a.44.1794699447603;
        Sat, 14 Nov 2026 15:37:27 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2d0f473sm2306372b3a.53.2026.11.14.15.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:37:26 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Radu Rendec <radu@rendec.net>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 1/4] MIPS: perf: look up the PMU interrupt when it is requested
Date: Sat, 14 Nov 2026 15:37:15 -0800
Message-ID: <20261114233718.86520-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114233718.86520-1-rosenp@gmail.com>
References: <20261114233718.86520-1-rosenp@gmail.com>
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

init_hw_perf_events() is an early_initcall and asks the platform for
the counter overflow interrupt through get_c0_perfcount_int(). On
ath79, that interrupt goes through the MISC interrupt controller, so
the controller has to be initialized from IRQCHIP_DECLARE before the
early initcalls, even though nothing else needs it that early.

The interrupt is only requested when the first event is created. Look
it up then, so that it can come from an interrupt controller probed as
a platform driver. The boot message no longer prints the interrupt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/kernel/perf_event_mipsxx.c | 30 +++++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index 196a070349b0..4d660952e643 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -589,10 +589,25 @@ static atomic_t active_events = ATOMIC_INIT(0);
 static DEFINE_MUTEX(pmu_reserve_mutex);
 static int (*save_perf_irq)(void);
 
+/*
+ * The interrupt is looked up when the first event is created, not when the
+ * PMU is registered: on some platforms, the interrupt controller that the
+ * counter overflow is wired to is only probed after the early initcalls.
+ */
+static int mipspmu_find_irq(void)
+{
+	if (get_c0_perfcount_int)
+		return get_c0_perfcount_int();
+	if (cp0_perfcount_irq >= 0)
+		return MIPS_CPU_IRQ_BASE + cp0_perfcount_irq;
+	return -1;
+}
+
 static int mipspmu_get_irq(void)
 {
 	int err;
 
+	mipspmu.irq = mipspmu_find_irq();
 	if (mipspmu.irq >= 0) {
 		/* Request my own irq handler. */
 		err = request_irq(mipspmu.irq, mipsxx_pmu_handle_irq,
@@ -1889,7 +1904,7 @@ static const struct mips_perf_event *octeon_pmu_map_raw_event(u64 config)
 static int __init
 init_hw_perf_events(void)
 {
-	int counters, irq, pmu_type;
+	int counters, pmu_type;
 
 	pr_info("Performance counters: ");
 
@@ -1904,13 +1919,6 @@ init_hw_perf_events(void)
 		counters = counters_total_to_per_cpu(counters);
 #endif
 
-	if (get_c0_perfcount_int)
-		irq = get_c0_perfcount_int();
-	else if (cp0_perfcount_irq >= 0)
-		irq = MIPS_CPU_IRQ_BASE + cp0_perfcount_irq;
-	else
-		irq = -1;
-
 	mipspmu.map_raw_event = mipsxx_pmu_map_raw_event;
 
 	switch (current_cpu_type()) {
@@ -2017,7 +2025,6 @@ init_hw_perf_events(void)
 	}
 
 	mipspmu.num_counters = counters;
-	mipspmu.irq = irq;
 
 	if (read_c0_perfctrl0() & MIPS_PERFCTRL_W) {
 		if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2) {
@@ -2044,9 +2051,8 @@ init_hw_perf_events(void)
 
 	on_each_cpu(reset_counters, (void *)(long)counters, 1);
 
-	pr_cont("%s PMU enabled, %d %d-bit counters available to each "
-		"CPU, irq %d%s\n", mipspmu.name, counters, counter_bits, irq,
-		irq < 0 ? " (share with timer interrupt)" : "");
+	pr_cont("%s PMU enabled, %d %d-bit counters available to each CPU\n",
+		mipspmu.name, counters, counter_bits);
 
 	perf_pmu_register(&pmu, "cpu", PERF_TYPE_RAW);
 
-- 
2.56.1

