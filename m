Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738268;
	b=TAObbb/iO4BGz39Og1Ma57nhjjdUHqicis8poYFClaoYkXMNJgSbY2N/a03gpy98/glo
	 xjO0HVJNkcDmP0vGeHRyikTz4x85QHh8rJsAYzr1yE+bJJ2YB7aRaNFe5OgZ/cQr2WzK6
	 cQQi2V5T8pvHBdJeVJ9dplDibZSWo+K8zWXj4+HIu9KXyvgdu2v2DGxMseBxQN2zKziI8
	 VHVGoQJuhGwwoWuJk7XJ4OmPTb8zKuuJKKDW5hj+COzts7lhfaaEEQPFMaeQNQs4O8zF+
	 Ss09t9q7bxgnre1hy16UBQMRdrl0pHdEfoPqbXqoH+b7FYaW1vDQyKWCrONaJdqIhRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rNN8tSOURgpYLom4XqxqTsVvbfBQF/r5pd1Fw7zXsMg=;
	b=i5SfXNMFWfWzG8TKvG3AFeZ8OMUxGSKSwnRR55/vCLqoFneWzkwzJFGcWDk+S4WCO/vX
	 CIdfBJJ1IoSxQpinFYXfraFy7qhEjdSO6dRZU1zsgQcibxkFWwV9qzyKkNdfCvlQiGR5E
	 ZtYkuUqeAXRRhyuuKznUr5Dko3vorPqAzYKlYR/FWlEMUv6y9z4rteKy4ie6JncoSxrjY
	 qpEc3tadAhp1rVNo1CeGPSZ4TPtkLJ4w4tlI9bfAABHhCP7O+UVahtiXsA4IsJenj4HJ+
	 RxL04u0+DLkPKDLTTMryaqBFrensoWkkGPBawwl9OVOTh7pflq77lrQG5lofs826AeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpxthGdN;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8961F606D837
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8961F606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpxthGdN
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0d126f631so39697b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738267; x=1794343067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNN8tSOURgpYLom4XqxqTsVvbfBQF/r5pd1Fw7zXsMg=;
        b=gpxthGdNHxqpkVQHrpD+0mgQFPkYM8eop208LwiOwmzxLd3/HrmYuuOWy5c/CcHjYT
         T5BfB/8NlqDG6ZusT/ZH74NwjeQBTI83VFQl9WYE7RI4Kz2IE+qWPNv0vQrj6e55/ttd
         KeMc7IBTpT0okldH3C+5WCNCJdAyz6WGakSY6vIkEZIM+KCwDxWA6dHZShAOkrkNbjIc
         wVXURCOMeYc+8MmDhO4XjlbBJKmEb7sGOLlGKjdctmkFxtcTvo4RvMyocorN2nKVtGsK
         9svih9JrWTk4P49lVdm/ClhqhmjY4wGFAkNgZ5dy+H5blBXR4O6dvwB7bYCtDWFoR84M
         XfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738267; x=1794343067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNN8tSOURgpYLom4XqxqTsVvbfBQF/r5pd1Fw7zXsMg=;
        b=I4RcdzH1eyLoRiOWLHa7joUuFqJvl9kXCdpobY6QaGvRBftplY6v68K1KcdIuWv/6K
         3HNmlTGXAY5Z5tsV8ZFL7KY3R7GEDPJpkxGUNhJCicub0sieuJcI+2lHuBBQa+p+wOE5
         qkKJLfMpigdKQjhtJzE1q2WMjPt7sl4czeqUn6gT1txdvMDxVaPSnK8nCfzoVA5yhIXl
         Q806jN/7SlVFqi/3sc50MddYL//bIL/7SgLdR98Z4Z8931Nx0KMfC+/Xk0DEEBFZW9PU
         PNFBNwoy83VI9af5Yfi0MAD3yCtXaGYNOxA0m5upW8hnP0C5i9BVENbhELPX3rV+fJ8o
         jwXA==
X-Forwarded-Encrypted: i=1; AKwUvBx5fdV+u55IyWTOwjtiJZc8LrG/Ta13m/NROal108DqX4RpRVctHvt058OY0liYTp/WdT72nmGHOk3V0r8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pEj8EyFPmEpTIeps+HLq5TEj89wt8tv+WlaB8y42gETfdbKA0
	28XAAIwJ4ssz1I21+dRK91R+Ks0/99KPGYqM0cLq44O+ddQwmIpDqsk8
X-Gm-Gg: AYBFou1qNmTs6BMPlm38u3cgJiffmwvKICdH+7N/ISR5YHS0DXXNd9cFji9qexLI4pi
	oSY1JVzPFWHsjPFAJDxcm0SQqCCCKUvmaQOQ9431fuJ1LzvaMGwUjdBOKPs9DcikZKFlIOtpZQl
	DQ9AF1+TsJ8/zeDwiX89kjNkb5z7puPoD5tV1XwUx8mSIua6EEtGVfnvqk2cUvm1vyDaxSN3ZO6
	SCA1FsRMCaBpGtyjcqrism7/mD8AqZvsEQK+yr1qqVsEXLFcdJVvMdTI0pFeiMk11AyruNCPGph
	XJEuJFhd8EF7ovdEV1x+d5IbE0uW7CUoeXvOlbb5/Z4+Fp31c8TtS/IChe7DNJPR5sGPqMUE3JA
	/QwzDvQGL6h1FbdEy7L+uBMNz7C/REx4yVg3zEnjN7qxueqB8LxspkX1YEBzVwSF6FyT+r4qhTL
	g5tUmTZfKJzofstxNCQ/hhdo+MM0kOuhHS6jEfSoJ9tYYD66DIDwIPOU4fqkp2GFGwTnFbklw56
	YjOdIGYIgcaDlC9GpCAWbrPp/rM/BXEhKKeIPFS3/HmSxe5jYOBV2W8MNcwEdANoDhq/9kjrFgW
	Y8gCfTE5YaxPzqOjJfo7X8bw+P5lURMtdEejHODY+4HenKYToCPNCD5dLx9RI5JWEBuAxTia56z
	pgCAUNAL2Ig==
X-Received: by 2002:a05:690c:82:b0:8b0:eb6d:d887 with SMTP id 00721157ae682-8b2b678e12bmr105577467b3.56.1793738267565;
        Tue, 03 Nov 2026 12:37:47 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c313esm4737977b3.15.2026.11.03.12.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:46 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:39 -0500
Subject: [PATCH v5 06/11] alpha/perf: attach ProfileMe status as
 PERF_SAMPLE_RAW data
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
Message-Id: <20261103-alpha-profileme-v5-6-bbe3937fbf3a@gmail.com>
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4962; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=ZV482/QHFdSnsb263M/i5NQY2A3wZCf5oaJiuwzRPb8=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufFFLmFUU+ThmvBb3VRh8ZekDsnzWcsCepbl2u1Vt
 5lTXtbV8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNdYH2D476VdayW98c
 u5Kw3uptLbRF5O0bDq4Xia2zQnraijiLm9k+GfnuDmebLLX19/OTlh7SbbW7yXVr6+9Jz7XLu8z
 r+tPHf1+QA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A ProfileMe sample's PC alone does not say what happened to the profiled
instruction. I_STAT and PCTR_CTL do: whether it trapped and why, was
mispredicted, stalled, or was killed on a wrong path, and what PCTR1
counted during the window.

With PERF_SAMPLE_RAW, attach PMPC, I_STAT and PCTR_CTL to each ProfileMe
sample in a versioned struct alpha_profileme_sample. PMPC is included
because a PALmode PMPC is not the sample's IP. Killed instructions can be
told apart by PM_KILLED_BM and VAL. The 64-bit fields are packed after
the 32-bit version, since the payload follows the 32-bit raw size in the
sample record: they are then 8-byte aligned in the record, which needs
no padding.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/perf_event.h      |  2 ++
 arch/alpha/include/uapi/asm/perf_event.h | 31 +++++++++++++++++++++++++++++++
 arch/alpha/kernel/perf_event.c           | 22 +++++++++++++++++++---
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm/perf_event.h
index 72536566014a..f498c1d47c07 100644
--- a/arch/alpha/include/asm/perf_event.h
+++ b/arch/alpha/include/asm/perf_event.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ALPHA_PERF_EVENT_H
 #define __ASM_ALPHA_PERF_EVENT_H
 
+#include <uapi/asm/perf_event.h>
+
 /*
  * Software events have no trap frame, so perf_fetch_caller_regs() fills
  * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
diff --git a/arch/alpha/include/uapi/asm/perf_event.h b/arch/alpha/include/uapi/asm/perf_event.h
new file mode 100644
index 000000000000..aa0eff5a917c
--- /dev/null
+++ b/arch/alpha/include/uapi/asm/perf_event.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_ASM_ALPHA_PERF_EVENT_H
+#define _UAPI_ASM_ALPHA_PERF_EVENT_H
+
+#include <linux/types.h>
+
+/*
+ * PERF_SAMPLE_RAW payload of a ProfileMe sample from the cpu PMU.
+ *
+ * pmpc, i_stat and pctr_ctl are the values of the PMPC, I_STAT and
+ * PCTR_CTL registers when the ProfileMe window closed. i_stat holds only
+ * bits 40:30 and pctr_ctl only bits 47:0. See the EV67/EV68 Hardware
+ * Reference Manuals for the field layout.
+ *
+ * In the sample record the payload follows the 32-bit PERF_SAMPLE_RAW
+ * size, so it starts 4 bytes past an 8-byte boundary. The 64-bit fields
+ * are packed after the 32-bit version so that they are 8-byte aligned in
+ * the record and no padding follows the payload.
+ *
+ * Fields may be added to the end in later versions.
+ */
+#define ALPHA_PROFILEME_SAMPLE_VERSION	1
+
+struct alpha_profileme_sample {
+	__u32 version;
+	__u64 pmpc __attribute__((packed));
+	__u64 i_stat __attribute__((packed));
+	__u64 pctr_ctl __attribute__((packed));
+};
+
+#endif /* _UAPI_ASM_ALPHA_PERF_EVENT_H */
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 546e30d46c61..54f90fdeecdf 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -991,11 +991,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 				       struct hw_perf_event *hwc,
 				       struct pt_regs *regs)
 {
+	struct alpha_profileme_sample pm;
+	struct perf_raw_record raw;
 	struct perf_sample_data data;
 	struct pt_regs *pm_regs;
 	bool pc_only = false;
-	unsigned long i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
+	unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
 
+	pctr_ctl = wrperfmon(PERFMON_CMD_READ, 0);
 	i_stat = wrperfmon(PERFMON_CMD_I_STAT, 0);
 	pmpc = wrperfmon(PERFMON_CMD_PMPC, 0);
 
@@ -1032,8 +1035,8 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	 * happens for ITB miss, Istream access violation and interrupt
 	 * redirects, and for instructions inside PALcode. Keep the
 	 * interrupted PC, which for redirects is the instruction that
-	 * trapped. Do the same for a user PMPC in a kernel thread, which has
-	 * no user frame.
+	 * trapped, and report the real PMPC in the raw data. Do the same
+	 * for a user PMPC in a kernel thread, which has no user frame.
 	 */
 	pm_regs = regs;
 	pc = pmpc & EV67_PMPC_PC_MASK;
@@ -1068,6 +1071,19 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	else if (in_entry_save_code(pc) && is_user_task(current))
 		alpha_profileme_set_regs_user(event, &data);
 
+	pm.version = ALPHA_PROFILEME_SAMPLE_VERSION;
+	pm.pmpc = pmpc;
+	pm.i_stat = i_stat;
+	/* PALcode sign-extends bit 47 of PCTR_CTL. */
+	pm.pctr_ctl = pctr_ctl & GENMASK(47, 0);
+	raw = (struct perf_raw_record) {
+		.frag = {
+			.size = sizeof(pm),
+			.data = &pm,
+		},
+	};
+	perf_sample_save_raw_data(&data, event, &raw);
+
 	if (!alpha_perf_event_set_period(event, hwc, 0))
 		return;
 

-- 
2.55.0

