Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333050;
	b=PQLpB3aKnsNo6r5vdly1K+QDJFZn83Aq4U3feLKm+titHcg2oaecMoH4R4zBgQHd8Xhr
	 h2DM+XKvBqoBshOWWXqcYB6/0U89WP1NQBZBbLSYEAqbPxxyH0qqs5I9I0TMgf2XQQHkQ
	 Je+0SyFlDaOJkf6bHKdT36W6m80U9agAEaI9MnXbuQoCIh7sLlT6smXhNk0n8XDH5ZTif
	 GlLyRJl1TU8pkpXdVII2v0UucyB+oNA9Bts4mjxsCfm/O/jLN8HNxDlTpbhLWa/bDjclm
	 LFJfFMofHJOG0LylJoIczacWd3HfxShK9HvMQmX21XPLClW4oRp1aikA2srjc/LV0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k8YQrYmaFnJ/bzLv9j3s7TLlYstk/zuxpU418CkuffM=;
	b=V/kk+mPTn4dkDxjxebv6Q59Bq1EYX12k6W6G3grKP+XKR0wqic/T67uo4/b/7rMRA/87
	 M3/+M2ks9SwhDBFK7WkDKr2wSqsb2qX2fDWbKzuflTs3Yy23fOh2T6zY14aO61KT+0hdj
	 sJX35CLVGKbU+7aajvXSldbB7rDq5NVHIprEQsM4bSs+eOZnkNmCl5HoAnyV0CBV8eE2i
	 SV8ir6tbz5BHKlH7o7gRiP6vjH9MX/ehfnssefOZICS/d6xYSukSTa77TjpQzXP8oDVzP
	 8nbji6XhWqDTGSdRB0Z/KnkSQShPCo/9v5EXNzWTRjRxFimVGnBaf5XKLr2U9goCDRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEjorO+3;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71218606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71218606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEjorO+3
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ab37e44643so2091617b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333049; x=1793937849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8YQrYmaFnJ/bzLv9j3s7TLlYstk/zuxpU418CkuffM=;
        b=IEjorO+3I04jCRUyvIACSf5cC1/XMmFdxw/lxIVFoZ5BwEYbvdoGAy7k8B/ZqTVMsK
         rxAYYXa8Jd5S1EXEBZUGymFXifFCpKePF/5j3GEGS3fSajemW7hrnzj2J6LPysGicZs1
         lywdjepBM1MikivSSy/nEAyI6NNla/d14FKGQjIEYGvt74p3Q6pjnm+wnokZlpsIjmDj
         NdMca9uf/A4CgEpFpg2XQZeDxK6wzytFt4ru4aGCuWqyRdvfzmsRXKGTjCYJZ7AwRuC8
         vqg9rBkGc6KzUPM8Pz6LzzUlo+RufI4tuuT100rCu0ighjkerKX59ZY1bXFAeV+bgijz
         pI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333049; x=1793937849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8YQrYmaFnJ/bzLv9j3s7TLlYstk/zuxpU418CkuffM=;
        b=M4z9ZvZzThiVvA6MBUnHHXQ7Scrqv0WSI8RRY27lKyXB/eks3kjnzDmir+DrVGaCo8
         r0lKB9u3p+bz1H2FAwcYQ1yQR8ZsZbChv2FwqEiFtWBxfUjc/AiZGuO5Q0S4t7i1yu4L
         Q4kt7erTd2iAeNehsyclIFFu/sZAVx4TD4uw6xz4o6JIgFbYKgXwtXHo8VOX13S+o1WX
         Wjx+KlBYRVoNexy5APXcb+z7ok5NTjtQK0xpNqZWge+uN4dNXzBqo396oviRCnvaOgGt
         ldEM3MQ2YBYEKQ7CfXZMmgYyOR/hPA1l4LCI2pr6L/4Ntgbwqx2HMqeGnf6lTm6wY40P
         Ic/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwiCgvydNQCJKvH1mKd2rdwkwsUon10dljS55igd3qPYdSYETpXDvCnKs9R8qyOYm5/CqQH/OXhTqjlUgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwsCyfFW0sPkMsqtcM+YWcnt3H/kG2aRYiCpzkrLNjTnHcJlH+
	e5JciYXRpTM4+0s4d2KOTvaWXvPm0yEhNyv6N5ZZEyjXAy2OVEXAIDU9
X-Gm-Gg: AYBFou1ngO3VRivIcSg94lnGCnwOWxEmMYYKqDNB3PXkFd0zos7ygOj6ZXVQqYBA5dq
	+y9o4Ke+stJ9QKtqTSwRJgjz3nMhVvsLAW/yoMEFHhHjqLqvXgR92eGIrXiggvMExw5UzvGXjo/
	NVwV6CG/l7N8kva2Eq4q1kHSAfPeueqzLKzmvFu52Foe0QipqhS0oDOLaFlhkF/2XpbpUEzk9lX
	JKvRjCk35E0yHNbiCz0D2ULc8j3FeYsKPEucTGFY2sWJlE2oEpXCCOjhavBUA82ePnskCeTRnhF
	PJMbB2N68EeQUX/qUWHlEFBllHsy0jDoQuhufV0CnoobACIF3FKG9NUxIbtMZWGBX3tV+z6L2iq
	mNiVW3VaWgVnvxM0tWrMChxHx64nq6Hdnt+pf2s+6fpYRi992JTZ5iLu9noCAJfUZdgm9EnPwWo
	e9UOxZCIS2qmKAvQVV0LBsveZ47go++Lq8ErtjK4Sn5+Jm5mZAonDMNJzzjylocQ3HoptS/OHIS
	imjr46SY5SRUKWInILowRpxqycjwSJOiY39Gq8jNRzO5w/+/5k2PGY6LZQxxkqMXrLLfyuO485L
	u11izqEtf2cT6BrIrl5T448oO/NILU7BUENRMJrqq3xa7i5pQDB79ia6HkyAooc2/YS0jNHfB7A
	Hf5fByT7TRg==
X-Received: by 2002:a05:690c:d94:b0:8b0:e619:7047 with SMTP id 00721157ae682-8b2b671ed55mr5656637b3.50.1793333049437;
        Thu, 29 Oct 2026 21:04:09 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7165ae6sm3471687b3.29.2026.10.29.21.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:04:08 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:04:02 -0400
Subject: [PATCH v2 4/5] alpha/perf: attach ProfileMe status as
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
Message-Id: <20261030-alpha-profileme-v2-4-c702f1c65272@gmail.com>
References: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
In-Reply-To: <20261030-alpha-profileme-v2-0-c702f1c65272@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4784; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=lF+dz+Xc1sLLtZ2TrZNGFNa69QyOYvxydhn2/MxKdd8=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKeiOvzchjcXXP52/5ZvnqGQmbXJW/Yxt6ws3yhe+2Qa
 TH/tE+LOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYamxaGPzzWD9XYd+
 /cKeH4fINg/Ip3Lv1MDs94Xu5g+nXu5vI707gZ/mncPy6oqqJlfqKkl/nn/4hLU5kzTJjlN71u8
 X2yQIq1gxMA
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
index c7f0ccf8ec80..c9d4b13817bc 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -944,10 +944,13 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 				       struct hw_perf_event *hwc,
 				       struct pt_regs *regs)
 {
+	struct alpha_profileme_sample pm;
+	struct perf_raw_record raw;
 	struct perf_sample_data data;
 	struct pt_regs *pm_regs;
-	unsigned long i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
+	unsigned long pctr_ctl, i_stat, pmpc, ovr, pc, saved_pc, saved_ps;
 
+	pctr_ctl = wrperfmon(PERFMON_CMD_READ, 0);
 	i_stat = wrperfmon(PERFMON_CMD_I_STAT, 0);
 	pmpc = wrperfmon(PERFMON_CMD_PMPC, 0);
 
@@ -982,8 +985,8 @@ static void alpha_perf_event_profileme(struct perf_event *event,
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
@@ -1001,6 +1004,19 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 
 	perf_sample_data_init(&data, 0, hwc->last_period);
 
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

