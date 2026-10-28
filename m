Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210980;
	b=c8m0Au0bYOM37/A4WtboM0ToQJx1x7Ekr2FoE+E5up6VvcxCpxxU3Zhj/F4f7og4VbUk
	 XSfxvlwc0W2lr7tTuaaqUYsZOXP2ON6es6kDTcj0R4pvdBZQzKv3byJADfWEqc8Mm5d2F
	 BEVBF7iNy1HZjG3tV8VfqZXCFhE21S0qCAzpt5ICg+2chI3V40xCg1LwQhzMOKqzW1Km3
	 R3xRPs/7Tp+DJ1uKq9o86U6us1TcxPZo4OtX5bTd8PlWpc8V8PN1i53P0IB2i1OriDRe5
	 Xb34JHRIY3IwbDz4ZwOI+5UF4Anb9MWf24Eo3h3e10cP44xYtoWql/vv5C1xGbLuqjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3l4X1y6ZvQw2IOm+n+gX4Yxr8wnNDKSRLi/ap2b0DzY=;
	b=2XvE6gTb1EkalvzgFjc8+SfjHD9TH1EKbRYvbi1gmIrMvkucNFK8rA+UPkLYfffvB5hz
	 VCgfy4fx+Ydfm0i/vN0o98OlLTWlH5vXOpcIu8BXC1H9937lKPRi36OQHgFNysQFtqVE5
	 3Yr8FiQwSJcee4PKrGICxlqiO44hR9x9aLrBj1kwE5pHR0REdxK9cHNH6CkpO7ORhphZl
	 FVHXYRFhyIOAamZrntkOciQOyzsngud5MnZRL5Md+b9Ekx0xWwnD+VghNu/esCdystuJj
	 9TYfbBGyiC6IQZmaW0Onm9wS7zRBGRssTmZy2lJZPd3hC3tEM2UO0T/VcKZg4y9Yw8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRRjJ1Jb;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A9960A260E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A9960A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRRjJ1Jb
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67990a45e02so1573773d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210978; x=1793815778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3l4X1y6ZvQw2IOm+n+gX4Yxr8wnNDKSRLi/ap2b0DzY=;
        b=ZRRjJ1Jbv1TaWd7k+0P9QbYUCBw19T+wjhZCKbN6xSssgJAwIko2td2cd7B+rf/bI8
         V/HRJhrEcoTpefP6kC719r1fCkYFnE0b/SthIkpHYoQGNg+wLlW++E6oV+5nYGYIbNi1
         mPBwrUjmvHMl1us7bcyJcCYuT+HC71cqiAjyjW1E41VIu3Fj9Ir0alqfugijgki4Ff9l
         UL9Crt4nGpBIdCqNhKxmjAfHdd35i1K563spdddXzpN+zMLXsskPRDusb9sp2W1xOq38
         Ej5iFVlHTLF+A3nrTK6fYAz+/Deey+7BHm3KN510yv5PtmT93gr0Lv69M60joI48H8ei
         /O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210978; x=1793815778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3l4X1y6ZvQw2IOm+n+gX4Yxr8wnNDKSRLi/ap2b0DzY=;
        b=dbgEQpj4DpvPlDolpnJhvffKasT3hck0TkpzNkQKkgaqvvrbU+43PUPD+ZmOIIvQKR
         7zrkPWUkrqA48t+bWKY8nRyG+5pPtNHVFR7IieJQKXRK1wg/N6s4k4F3jRf4ZJ/ldxFu
         MHA3ASpQ/Wdd2MY34Xwdhr+WDlVCPE/3CenePSlwVeYtWZPkHzpkN5dDq3spTcwspjia
         qf0GloTh9EJWM0T9xpAv/UNW4/P6dhZhWsWdZRcR7VVCoet5E029dJCgDwlGBJl5bjxF
         N0t1tCaF8zZGyJga1axV5D60snv9u+TdNtjKuj8OaElU1bbMX1d2UO8qsj22zf3EUM3O
         VSQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX4Y9m9Pxefwpcd8truAimEVAwVahDBtyZJbVWyl8YTMj+3LjqrCJC6u+H7wcERe5beNiadb5IVAZKtUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD3jn2OIjGbus3MMlaBI+MYVEfzxozcZCYtEmcNzcHcPcJ+gcu
	WgPX2Efzoi4w9sNdaU7yOw8pTNF5YtEWBF+ZyCRoi+ixn44KSPrfpkqd
X-Gm-Gg: AYBFou3IH+ZlBGA8XKZrSODELOmq7tTx4WH7AOn44wEHyA/0CKe1DaxqKLoy7KFrpPi
	VWiFcqvKlUFqDNYxe+diCSitkqKl7u9erOo6HSKlqDXB3KAshv6fEzfpUmpRzEr1NdWQYRwKDtq
	rMYdfdhA5QE/jTekj/XrFEjBBfmICkclkDHRM7IzlQJPUd8WbBkKOVr7ZTrmCG/lXf03i/B8FL0
	ozVYkpZCqV+0ktGNPgXEPRlerTTznzIo2WrjDB1aWClhQZ7NS1a9rwt52TP66dviXXcyqi4gVXb
	dufKMtnknEZya8dDg8jJcMdvnFuvLmFgj4TBideNEJorTHGrpAohxtxaCm8xDTmipKue+QMwDDf
	hHbDZuaG/A1RLScuuTWpCq0js+CKG449komAfsUwlX9WB/P/gZYrS9zdleBW1DHuiqkpTCaNiV6
	hTZMsjes0NLlIgFRVkz0Tt0n/Z5gmqc3RHW/GWhVz2ocw3Km6erJEBamZ0GGovEdi9dTXmsKeu0
	f03pAb1qqEACiKTAMIUvTIbGhv1qTBDu8/NW1NY6jHLoYF38BJE+F5jSv5hR/1SaR3oP0vBnDCI
	TlRwcSmTWHxROA7wARuqDaQoTF03JKkavxImKLghYjZw1JZf1JLt4T0Okqs2aCAuOqzF3vI8Bum
	W9cw/idEaDw==
X-Received: by 2002:a05:690e:138b:b0:677:bb39:4c1b with SMTP id 956f58d0204a3-67a7bef5c4fmr3025419d50.105.1793210978315;
        Wed, 28 Oct 2026 11:09:38 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a165a95sm2163178d50.19.2026.10.28.11.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:37 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 28 Oct 2026 14:09:32 -0400
Subject: [PATCH 3/5] alpha/perf: implement ProfileMe sampling
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
Message-Id: <20261028-alpha-profileme-v1-3-d44b52bf2500@gmail.com>
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
In-Reply-To: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12948; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=ZW0C+NzwDugqxy2kSzOJOrwA3lCdqIaZU4yqDFtd1xI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWUVpdiq8OzuV55hrhXlOlbPal+Ub09i/iD58e2C5/
 6/XvrYlHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNN2jxGho3NYbIPYs
 5xX3srN1v1Cl+1SATT3seBnxyfnnrAf3tLiiLD/xx1HpaXp6KZmSbwbfHacsHoF5+0IpeyXsfcY
 z2F6XbtHAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The 21264 (EV67 and later) and 21364 have two performance counting modes,
and the driver only uses Aggregate mode. Its samples report the PC at
which the counter interrupt was taken, which lands a variable number of
instructions after the one that overflowed the counter. On an EV7 a
16-instruction user loop shows up at only 4 PCs, anywhere from 15
instructions before to 12 after the real one.

In ProfileMe mode, the instruction that overflows PCTR0 opens a window
during which PCTR1 counts, and when it closes PALcode delivers the
interrupt with that instruction's PC latched in PMPC.

Select ProfileMe with the new profileme config bit or with precise_ip,
since PMPC has no skid. PCTR_CTL[SL0] selects the mode for both
counters, so a ProfileMe event is scheduled alone and perf core
multiplexes it with other hardware events. The event type chooses the
SL1 setting, which decides what PCTR0 samples on and what PCTR1 counts
in the window:

  event          PCTR0         PCTR1
  instructions   instructions  cycles
  bcache-misses  instructions  Bcache misses
  cycles         cycles        inum retire delay
  mbox-replay    cycles        Mbox replay traps

Every interrupt rearms both counters, since PCTR0 stops when the window
closes. The instruction count is corrected by the overcount I_STAT
reports. The sample is attributed to PMPC with the mode bit in regs
adjusted to match, since the interrupt can be taken in a different mode
than the profiled instruction: in an unaligned access test on EV7 that
was true of three quarters of the samples. PALmode PMPCs are physical
addresses, so those samples keep the interrupted PC.

Three behaviors differ from Aggregate mode. perf record's default event
is cycles:P, so it now records a ProfileMe profile. In ProfileMe mode
PCTR0 counts valid fetched instructions rather than retired ones, so the
instructions count includes the wrong path, squashed NOPs, and both
halves of each CMOV: on an EV7 loop with a randomly mispredicted branch
it is about twice the Aggregate count. And instructions killed on a
wrong path are sampled at their own PC, as ProfileMe defines them.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h |  12 +++
 arch/alpha/kernel/perf_event.c     | 157 ++++++++++++++++++++++++++++++++++---
 2 files changed, 159 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index 1fa9bc813263..7fbbfd74926a 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -92,5 +92,17 @@
 #define EV67_PCTR_CYCLES_UNDEF (1UL<<2)
 #define EV67_PCTR_INSTR_BCACHEMISS (2UL<<2)
 #define EV67_PCTR_CYCLES_MBOX (3UL<<2)
+/* In ProfileMe mode, SL1 = 1 makes PCTR1 count the inum retire delay. */
+#define EV67_PCTR_CYCLES_RETIRE_DELAY (1UL<<2)
+/* Set in both SL settings where PCTR0 counts cycles. */
+#define EV67_PCTR_PCTR0_CYCLES (1UL<<2)
+
+/* ProfileMe status, from the EV67/EV68 Hardware Reference Manuals. */
+#define EV67_I_STAT_OVR_SHIFT 30
+#define EV67_I_STAT_OVR_MASK 0x7UL
+
+/* PMPC bits 63:2 hold the profiled PC. Bit 0 set means a PALmode address. */
+#define EV67_PMPC_PAL (1UL<<0)
+#define EV67_PMPC_PC_MASK (~3UL)
 
 #endif
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 70840c05d39b..24c96feda942 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -30,6 +30,13 @@
 #define MAX_HWEVENTS 3
 #define PMC_NO_INDEX -1
 
+/* Layout of attr.config for PERF_TYPE_RAW events; see format/ in sysfs. */
+#define ALPHA_PERF_CONFIG_EVENT		0xffULL
+#define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
+
+/* hw_perf_event.flags */
+#define ALPHA_PERF_FLAG_PROFILEME	0x1
+
 /* For tracking PMCs and the hw events they monitor on each CPU. */
 struct cpu_hw_events {
 	int			enabled;
@@ -145,6 +152,19 @@ static const struct ev67_mapping_t ev67_mapping[] = {
 };
 
 
+/*
+ * In ProfileMe mode PCTR0 selects the profiled instruction and PCTR1 counts
+ * during its window. PCTR0 counts instructions or cycles, and each choice
+ * pairs with two PCTR1 inputs, so each event type picks one SL1 setting.
+ * Indexed by enum ev67_pmc_event_type.
+ */
+static const unsigned long ev67_profileme_sl1[] = {
+	[EV67_CYCLES]		= EV67_PCTR_CYCLES_RETIRE_DELAY, /* PCTR1: retire delay */
+	[EV67_INSTRUCTIONS]	= EV67_PCTR_INSTR_CYCLES,	/* PCTR1: cycles */
+	[EV67_BCACHEMISS]	= EV67_PCTR_INSTR_BCACHEMISS,	/* PCTR1: Bcache misses */
+	[EV67_MBOXREPLAY]	= EV67_PCTR_CYCLES_MBOX,	/* PCTR1: Mbox replays */
+};
+
 /*
  * Check that a group of events can be simultaneously scheduled on to the
  * EV67 PMU.  Also allocate counter indices and config.
@@ -152,9 +172,21 @@ static const struct ev67_mapping_t ev67_mapping[] = {
 static int ev67_check_constraints(struct perf_event **event,
 				unsigned long *evtype, int n_ev)
 {
-	int idx0;
+	int idx0, j;
 	unsigned long config;
 
+	/* A ProfileMe event uses both counters, so it must be alone. */
+	for (j = 0; j < n_ev; j++) {
+		if (!(event[j]->hw.flags & ALPHA_PERF_FLAG_PROFILEME))
+			continue;
+		if (n_ev != 1)
+			return -1;
+		event[0]->hw.idx = 0;
+		event[0]->hw.config_base = EV67_PCTR_MODE_PROFILEME |
+					   ev67_profileme_sl1[evtype[0]];
+		return 0;
+	}
+
 	idx0 = ev67_mapping[evtype[0]-1].idx;
 	config = ev67_mapping[evtype[0]-1].config;
 	if (n_ev == 1)
@@ -213,9 +245,11 @@ static int ev67_raw_event_valid(u64 config)
 
 
 PMU_FORMAT_ATTR(event, "config:0-7");
+PMU_FORMAT_ATTR(profileme, "config:8");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
+	&format_attr_profileme.attr,
 	NULL,
 };
 
@@ -276,6 +310,24 @@ static inline void alpha_write_pmc(int idx, unsigned long val)
 	wrperfmon(PERFMON_CMD_WRITE, val);
 }
 
+/* Write PCTR0 and clear PCTR1 in one call, as ProfileMe mode requires. */
+static inline void alpha_write_pmc_profileme(unsigned long val)
+{
+	val &= alpha_pmu->pmc_count_mask[0];
+	val <<= alpha_pmu->pmc_count_shift[0];
+	val |= EV67_PCTR_0 | EV67_PCTR_1;
+	wrperfmon(PERFMON_CMD_WRITE, val);
+}
+
+/* The counters an event occupies, for PERFMON_CMD_ENABLE and DISABLE. */
+static inline unsigned long alpha_event_idx_mask(struct hw_perf_event *hwc,
+						 int idx)
+{
+	if (hwc->flags & ALPHA_PERF_FLAG_PROFILEME)
+		return EV67_PCTR_0 | EV67_PCTR_1;
+	return 1UL<<idx;
+}
+
 static inline unsigned long alpha_read_pmc(int idx)
 {
 	unsigned long val;
@@ -320,7 +372,10 @@ static int alpha_perf_event_set_period(struct perf_event *event,
 
 	local64_set(&hwc->prev_count, (unsigned long)(-left));
 
-	alpha_write_pmc(idx, (unsigned long)(-left));
+	if (hwc->flags & ALPHA_PERF_FLAG_PROFILEME)
+		alpha_write_pmc_profileme((unsigned long)(-left));
+	else
+		alpha_write_pmc(idx, (unsigned long)(-left));
 
 	perf_event_update_userpage(event);
 
@@ -457,7 +512,8 @@ static void maybe_change_configuration(struct cpu_hw_events *cpuc)
 		}
 
 		if (!(hwc->state & PERF_HES_STOPPED))
-			cpuc->idx_mask |= (1<<cpuc->current_idx[j]);
+			cpuc->idx_mask |= alpha_event_idx_mask(hwc,
+							cpuc->current_idx[j]);
 	}
 	cpuc->config = cpuc->event[0]->hw.config_base;
 }
@@ -548,7 +604,7 @@ static void alpha_pmu_del(struct perf_event *event, int flags)
 			alpha_perf_event_update(event, hwc, idx, 0);
 			perf_event_update_userpage(event);
 
-			cpuc->idx_mask &= ~(1UL<<idx);
+			cpuc->idx_mask &= ~alpha_event_idx_mask(hwc, idx);
 			cpuc->n_events--;
 			break;
 		}
@@ -573,7 +629,7 @@ static void alpha_pmu_stop(struct perf_event *event, int flags)
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 
 	if (!(hwc->state & PERF_HES_STOPPED)) {
-		cpuc->idx_mask &= ~(1UL<<hwc->idx);
+		cpuc->idx_mask &= ~alpha_event_idx_mask(hwc, hwc->idx);
 		hwc->state |= PERF_HES_STOPPED;
 	}
 
@@ -583,7 +639,7 @@ static void alpha_pmu_stop(struct perf_event *event, int flags)
 	}
 
 	if (cpuc->enabled)
-		wrperfmon(PERFMON_CMD_DISABLE, (1UL<<hwc->idx));
+		wrperfmon(PERFMON_CMD_DISABLE, alpha_event_idx_mask(hwc, hwc->idx));
 }
 
 
@@ -602,9 +658,9 @@ static void alpha_pmu_start(struct perf_event *event, int flags)
 
 	hwc->state = 0;
 
-	cpuc->idx_mask |= 1UL<<hwc->idx;
+	cpuc->idx_mask |= alpha_event_idx_mask(hwc, hwc->idx);
 	if (cpuc->enabled)
-		wrperfmon(PERFMON_CMD_ENABLE, (1UL<<hwc->idx));
+		wrperfmon(PERFMON_CMD_ENABLE, alpha_event_idx_mask(hwc, hwc->idx));
 }
 
 
@@ -644,6 +700,7 @@ static int __hw_perf_event_init(struct perf_event *event)
 	struct perf_event *evts[MAX_HWEVENTS];
 	unsigned long evtypes[MAX_HWEVENTS];
 	int idx_rubbish_bin[MAX_HWEVENTS];
+	bool profileme = false;
 	int ev;
 	int n;
 
@@ -657,9 +714,13 @@ static int __hw_perf_event_init(struct perf_event *event)
 	} else if (attr->type == PERF_TYPE_HW_CACHE) {
 		return -EOPNOTSUPP;
 	} else if (attr->type == PERF_TYPE_RAW) {
-		if (!alpha_pmu->raw_event_valid(attr->config))
+		if (attr->config & ~(ALPHA_PERF_CONFIG_EVENT |
+				     ALPHA_PERF_CONFIG_PROFILEME))
 			return -EINVAL;
-		ev = attr->config;
+		ev = attr->config & ALPHA_PERF_CONFIG_EVENT;
+		if (!alpha_pmu->raw_event_valid(ev))
+			return -EINVAL;
+		profileme = attr->config & ALPHA_PERF_CONFIG_PROFILEME;
 	} else {
 		return -EOPNOTSUPP;
 	}
@@ -668,6 +729,17 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return ev;
 	}
 
+	/*
+	 * ProfileMe samples report the exact PC of the profiled instruction,
+	 * so it also serves any request for precise samples. It only makes
+	 * sense for sampling events.
+	 */
+	if (attr->precise_ip)
+		profileme = true;
+	if (profileme && !is_sampling_event(event))
+		return -EINVAL;
+	hwc->flags = profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
+
 	/*
 	 * We place the event type in event_base here and leave calculation
 	 * of the codes to programme the PMU for alpha_pmu_enable() because
@@ -832,6 +904,61 @@ void perf_event_print_debug(void)
 }
 
 
+/*
+ * Handle the close of a ProfileMe window on PCTR0.
+ *
+ * PCTR0 stops counting when the window closes and does not start again
+ * until PCTR_CTL is written, so the status must be read first and the
+ * counters then rearmed unconditionally.
+ */
+static void alpha_perf_event_profileme(struct perf_event *event,
+				       struct hw_perf_event *hwc,
+				       struct pt_regs *regs)
+{
+	struct perf_sample_data data;
+	struct pt_regs pm_regs;
+	unsigned long i_stat, pmpc, ovr;
+
+	i_stat = wrperfmon(PERFMON_CMD_I_STAT, 0);
+	pmpc = wrperfmon(PERFMON_CMD_PMPC, 0);
+
+	alpha_perf_event_update(event, hwc, 0, alpha_pmu->pmc_max_period[0]+1);
+
+	/*
+	 * When PCTR0 counts instructions, up to 7 of them are counted after
+	 * the overflow but before the window opens. I_STAT reports how many.
+	 */
+	if (!(hwc->config_base & EV67_PCTR_PCTR0_CYCLES)) {
+		ovr = (i_stat >> EV67_I_STAT_OVR_SHIFT) & EV67_I_STAT_OVR_MASK;
+		local64_sub(ovr, &event->count);
+		local64_add(ovr, &hwc->period_left);
+	}
+
+	/*
+	 * Attribute the sample to the profiled instruction rather than to
+	 * wherever the interrupt landed, including the user/kernel mode that
+	 * perf derives from regs. A PALmode PMPC is a physical address that
+	 * perf cannot resolve. That happens for ITB miss, Istream access
+	 * violation and interrupt redirects, and for instructions inside
+	 * PALcode. Keep the interrupted PC, which for redirects is the
+	 * instruction that trapped.
+	 */
+	pm_regs = *regs;
+	if (!(pmpc & EV67_PMPC_PAL)) {
+		pm_regs.pc = pmpc & EV67_PMPC_PC_MASK;
+		/* PS bit 3 is the mode bit that user_mode() tests. */
+		if (pm_regs.pc < TASK_SIZE)
+			pm_regs.ps |= 8UL;
+		else
+			pm_regs.ps &= ~8UL;
+	}
+
+	perf_sample_data_init(&data, 0, hwc->last_period);
+
+	if (alpha_perf_event_set_period(event, hwc, 0))
+		perf_event_overflow(event, &data, &pm_regs);
+}
+
 /*
  * Performance Monitoring Interrupt Service Routine called when a PMC
  * overflows.  The PMC that overflowed is passed in la_ptr.
@@ -866,6 +993,10 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 
 	idx = la_ptr;
 
+	/* A ProfileMe event owns both counters but lives at index 0. */
+	if (cpuc->config & EV67_PCTR_MODE_PROFILEME)
+		idx = 0;
+
 	for (j = 0; j < cpuc->n_events; j++) {
 		if (cpuc->current_idx[j] == idx)
 			break;
@@ -888,6 +1019,12 @@ static void alpha_perf_event_irq_handler(unsigned long la_ptr,
 	}
 
 	hwc = &event->hw;
+	if (hwc->flags & ALPHA_PERF_FLAG_PROFILEME) {
+		alpha_perf_event_profileme(event, hwc, regs);
+		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
+		return;
+	}
+
 	alpha_perf_event_update(event, hwc, idx, alpha_pmu->pmc_max_period[idx]+1);
 	perf_sample_data_init(&data, 0, hwc->last_period);
 

-- 
2.55.0

