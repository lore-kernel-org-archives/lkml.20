Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818170;
	b=o+LzWi1L17RCAUe09zQgDYA/TIHdxrISmbZEinuKjY8KYSL3prSRC8C1M7nHzsYK3VfK
	 mmQ2IF1mZrs5vsJ5UNejeXsEtu3SjFHJK0jxz08y7KHGVlGWt27mgppshWKutJvJ+wDiQ
	 UvDdWTnAvHdONwPhQ1Q/qfFmqwSUXbXwTI3EYhPsANuqjYbJqdzScA/tXGIrrFE4eWmjj
	 H+bPn7HIjz3Y13lwWgbMW/XHURnKPuuXjppddxAWCGFx6bc0oqBXDYI/Rm3MFbdL/u80j
	 LVEou0wAMMhril/EIFmd0sC0Fl+v2UMUWLpHlN0o/UyL9u3mzWi4NhnXkVXzWADVDJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=riqSLG47DBpUBgQW8AAaT/g3ULyVVHsszie170OGjBE=;
	b=y1msP3x/nthfrSWXpMSWa3/7b+uP6S/KO+c3Asej5+uG+mJf3hZ8WJsEImVVEWB5tAwv
	 XxFZV2D6pa28esqDquIQMkCPheo4Q721jBBByOt3swyovKehIFKBigHBEPnYsil9tyqiQ
	 PugNE9EcUIGIveVqeAhbPoYrkQJAWUjzWJ8CzOVrdfOpGfG19SpkZOrVj/g9tD/eWE/+S
	 rIJSaerew98K7mZTTgiGOUmDhbFNewEm28+7/8jjUkL0iQ8miZun9yzHzAJfjxLwM91ak
	 Ii9NFExZ03e+KkvHalpGbnn/Da8PSLNodt+jELL1oUlIQYI+L92HwWOx3j9MDhoD6gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CvJvRoP7;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319DE6083611
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 319DE6083611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CvJvRoP7
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b306bbff8eso8486117b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818169; x=1794422969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riqSLG47DBpUBgQW8AAaT/g3ULyVVHsszie170OGjBE=;
        b=CvJvRoP76mc3wsUJy4G+yy/daDITJ6KuKU/oIqv7dFPajWDOthe7ZwHY/pRRzLqR1d
         7WO3IAsnmX60Ldl9tjeYhUvAvV8FRvgopQFwDR6j0+tnltepz7sjZnC7BGIXW/4yjTes
         6xB8awDrfq4MGNuOqe7kVcdEQKcLSx1BRBhrMf927cG4JFcnb4QZLJTrXwflAo6vfTwZ
         7NjnkYMkGvPO83eP6+ZvhIBVPhnRlQ9aOb2o/297QAuLcex3kObP4ODc7n85I21m5tYT
         v7Nk3CMDOGjIo03DRs0f5lFstwvI3rAux7nUh763NbZQqgzmGSEGRb+1eWqZel0IhDWE
         tzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818169; x=1794422969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riqSLG47DBpUBgQW8AAaT/g3ULyVVHsszie170OGjBE=;
        b=r/n/I8t1/jWWH/cATz+W+ZL5Z1SbKiRBQ2vf6CMs7BC5HYe6LKOdhvT4gp2fVOnIqk
         o1/lJZ68kEw5hJ/qeV5l/DNjRpBDEyo+no10GGiqgPoMX4S02L4BUn2vGN4vgFPaPYGg
         3oEEo1sTBAjV6y3oJ6tcYU6V7/eQ3LK1VyCZkjmJEu/ikOnuJqYegOhKO9qjB9VnAJVe
         xd/qYigZ0FLGarYmZ/sX67z5YJ107rwBFP38An4XjVKY6Ejkf8hkD/gOtzzLbgU+AmZ+
         LLcQWnVMA0rfU5spFZSakZmpGh9/zX1AAQuh+mmGP0KZ6z03yMWHUhwix1kYZraqQRdw
         rZ2w==
X-Forwarded-Encrypted: i=1; AKwUvBwmcEVb8aj/1n7YV/eoW9CdIAdgT6BVn5msNLMOM+cKifViTxwCF8QVajr7kuTDhNIu2vakUjz1yGx3Uu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i2ikBa2DTZzGFGO/v9Jilpt3ZQnOoWQnV6wfkxCLpgGGKU9py
	FGZukS4kqqbPtPBs3J1yTRFPR5/yonxOlH/GkWIBxhkyBgFZ4BOhV2Bu/xnaIQ==
X-Gm-Gg: AYBFou0600nMozg0/Ohkh8SceT83HKzeDuqoX3PVEzbnpguu0aK8Hpwy7/K6kAbmpnt
	kmxiyRwQrXiiw+BI0bMOt+Az/5GHFJR2qsW0bA99Y++JLEQe778Ic2luSocAYsXUTTVLpJ6Nww0
	1wcsjAapCkL0XvljkK2UoCTgR7Q13qSzquG/AG9ONueI36SluvTV062K7l0hSjIHcgsqc5nuxgT
	ddDCH2/21+iyP7FmQ5nen6OQq4bhDAKYqXiZwKaSY30Yn8LySdpONmjgUdsAAG7iww9QjIWmSbt
	W2wU4Men7C7iia/+0ANrt7S/xtEcbC8n6qdHm10VGV5cpxJ9MADHBSY26nD5AJvsFH13E+mPirh
	6yRSYBVX/gUHLrHU3Wnrl3PIqGiX7nqmqA+N0XgEpRfX4IOoJIKDsqPSo0U3LH7yuwg712VVNO5
	/Gr/adeTeBXr5GmiDysYStlJCwfvYld42uvoAe8k7KDbf0i8TQYa2w79lYgzZs5i/YCdzQ4xazu
	YSi7zztuVliD7AfOp7b0J3KWfJGeW8xp6htAQk3EyB5pPUMxGXpNaG5BMrh19CUTN/VMtAW6E4o
	oJejSm33HpXzh0scYumGfUBYZPDoI1jFaGePVXTBu4WVbVJ+eLtmw5xdun+TGO34WrgoqiykFH1
	1h3kpoFpzsQ==
X-Received: by 2002:a05:690c:5309:10b0:8b3:141c:b6c4 with SMTP id 00721157ae682-8b3141ce0aemr9210747b3.12.1793818169043;
        Wed, 04 Nov 2026 10:49:29 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bdffedsm24102797b3.45.2026.11.04.10.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:28 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:18 -0500
Subject: [PATCH v6 11/13] alpha/perf: add ProfileMe sample filters
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
Message-Id: <20261104-alpha-profileme-v6-11-63362e9290a3@gmail.com>
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6417; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=WgG8JgSK7g8zKwjFulxW+a2fSaUJQ60yH6Sk4JkofgA=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16luviRjXc1w99JHxy8cv70/MFW0t66NcVW1eM9ZV
 TTt/xzFjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlmtw4jw7xH51nvHF
 q21zB8/6mGmwfZ50a3bb3AsfNOEOfvFTk7VWYxMlzSVGMVU3t8gDsxyvhPSI1KWUtLyFfdif/qp
 6+0/e19kQUA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

ProfileMe samples any fetched instruction, including those killed on a
wrong path, and what happened to it is only in the PERF_SAMPLE_RAW data.

Add three config1 bits that keep only the samples of instructions that:

  retired     retired. VAL says so for an instruction that did not trap,
              and the trap type for one that did.
  mispredict  were mispredicted conditional branches.
  trapped     trapped, mispredicts included, or caused an ITB miss,
              Istream access violation or interrupt redirect.

A sample must match every bit that is set, as with Arm SPE's
event_filter. The driver drops the samples that do not, and they still
count as interrupts for throttling and frequency mode.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 10 +++++
 arch/alpha/kernel/perf_event.c     | 83 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index dc24c7cb45db..6526438e73ee 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -106,9 +106,14 @@
 #define EV67_I_STAT_MIS (1UL<<40)
 
 /* I_STAT[TRAP_TYPE] values */
+#define EV67_TRAP_REPLAY 0
 #define EV67_TRAP_DTB_DOUBLE_3 2
 #define EV67_TRAP_DTB_DOUBLE_4 3
+#define EV67_TRAP_FEN 4
+#define EV67_TRAP_UNALIGNED 5
 #define EV67_TRAP_DTB_SINGLE 6
+#define EV67_TRAP_DFAULT 7
+#define EV67_TRAP_OPCDEC 8
 
 #define EV67_PCTR_VAL (1UL<<1)
 #define EV67_PCTR_PM_KILLED_BM (1UL<<26)
@@ -116,5 +121,10 @@
 /* PMPC bits 63:2 hold the profiled PC. Bit 0 set means a PALmode address. */
 #define EV67_PMPC_PAL (1UL<<0)
 #define EV67_PMPC_PC_MASK (~3UL)
+/* PMPC[14:0] of the redirect traps, which do not set I_STAT[TRP] */
+#define EV67_PMPC_PAL_OFFSET_MASK 0x7fffUL
+#define EV67_PMPC_IACV 0x0481
+#define EV67_PMPC_ITB_MISS 0x0581
+#define EV67_PMPC_INTERRUPT 0x0681
 
 #endif
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 0723e1042145..32a8b5c98381 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -39,6 +39,13 @@
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
 #define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
+/* attr.config1 of a ProfileMe event: keep only samples of these insns. */
+#define ALPHA_PERF_CONFIG1_RETIRED	BIT_ULL(0)
+#define ALPHA_PERF_CONFIG1_MISPREDICT	BIT_ULL(1)
+#define ALPHA_PERF_CONFIG1_TRAPPED	BIT_ULL(2)
+#define ALPHA_PERF_CONFIG1_FILTERS	(ALPHA_PERF_CONFIG1_RETIRED | \
+					 ALPHA_PERF_CONFIG1_MISPREDICT | \
+					 ALPHA_PERF_CONFIG1_TRAPPED)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_WRAPPED		0x1
@@ -258,11 +265,17 @@ static int ev67_raw_event_valid(u64 config)
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
 PMU_FORMAT_ATTR(randomize, "config:9");
+PMU_FORMAT_ATTR(retired, "config1:0");
+PMU_FORMAT_ATTR(mispredict, "config1:1");
+PMU_FORMAT_ATTR(trapped, "config1:2");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
 	&format_attr_randomize.attr,
+	&format_attr_retired.attr,
+	&format_attr_mispredict.attr,
+	&format_attr_trapped.attr,
 	NULL,
 };
 
@@ -819,6 +832,12 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EINVAL;
 	hwc->flags = profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
 
+	if (attr->config1 & ~ALPHA_PERF_CONFIG1_FILTERS)
+		return -EINVAL;
+	if (attr->config1 && !profileme)
+		return -EINVAL;
+	hwc->config = attr->config1;
+
 	if (attr->type == PERF_TYPE_RAW &&
 	    (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {
 		if (!profileme)
@@ -1060,6 +1079,62 @@ static bool alpha_profileme_trp(unsigned long i_stat, unsigned long pctr_ctl)
 	return !(pctr_ctl & EV67_PCTR_PM_KILLED_BM) && (i_stat & EV67_I_STAT_TRP);
 }
 
+/*
+ * VAL says whether an instruction that did not trap retired. For one that
+ * did, the trap type decides: these faults abort it, to be replayed,
+ * refetched after a fill, or emulated. Other traps, mispredicts among
+ * them, are counted as retired.
+ */
+static bool alpha_profileme_retired(unsigned long i_stat,
+				    unsigned long pctr_ctl)
+{
+	if (pctr_ctl & EV67_PCTR_PM_KILLED_BM)
+		return false;
+	if (!(i_stat & EV67_I_STAT_TRP))
+		return pctr_ctl & EV67_PCTR_VAL;
+	if (i_stat & EV67_I_STAT_MIS)
+		return true;
+
+	switch ((i_stat >> EV67_I_STAT_TRAP_TYPE_SHIFT) &
+		EV67_I_STAT_TRAP_TYPE_MASK) {
+	case EV67_TRAP_REPLAY:
+	case EV67_TRAP_DTB_DOUBLE_3:
+	case EV67_TRAP_DTB_DOUBLE_4:
+	case EV67_TRAP_FEN:
+	case EV67_TRAP_UNALIGNED:
+	case EV67_TRAP_DTB_SINGLE:
+	case EV67_TRAP_DFAULT:
+	case EV67_TRAP_OPCDEC:
+		return false;
+	default:
+		return true;
+	}
+}
+
+/* What the profiled instruction did, as config1 filter bits. */
+static u64 alpha_profileme_status(unsigned long i_stat,
+				  unsigned long pctr_ctl, unsigned long pmpc)
+{
+	u64 status = 0;
+
+	if (alpha_profileme_retired(i_stat, pctr_ctl))
+		status |= ALPHA_PERF_CONFIG1_RETIRED;
+	if (alpha_profileme_trp(i_stat, pctr_ctl)) {
+		status |= ALPHA_PERF_CONFIG1_TRAPPED;
+		if (i_stat & EV67_I_STAT_MIS)
+			status |= ALPHA_PERF_CONFIG1_MISPREDICT;
+	} else if (pmpc & EV67_PMPC_PAL) {
+		switch (pmpc & EV67_PMPC_PAL_OFFSET_MASK) {
+		case EV67_PMPC_IACV:
+		case EV67_PMPC_ITB_MISS:
+		case EV67_PMPC_INTERRUPT:
+			status |= ALPHA_PERF_CONFIG1_TRAPPED;
+			break;
+		}
+	}
+	return status;
+}
+
 /* What the memory instruction at pc does, or PERF_MEM_OP_NA. */
 static u64 alpha_profileme_mem_op(unsigned long pc)
 {
@@ -1170,6 +1245,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 		local64_add(ovr, &hwc->period_left);
 	}
 
+	/* A dropped sample still counts, for throttling and frequency mode. */
+	if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config) !=
+	    hwc->config) {
+		if (alpha_perf_event_set_period(event, hwc, 0))
+			perf_event_account_interrupt(event);
+		return;
+	}
+
 	/*
 	 * Attribute the sample to the profiled instruction rather than to
 	 * wherever the interrupt landed. perf takes the sample's mode,

-- 
2.55.0

