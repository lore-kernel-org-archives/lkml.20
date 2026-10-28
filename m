Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210981;
	b=PECj5lE5gQMbjutd68IqQdXFdGjVmIK/+PYP8xZUUvKKzZstCzFIXQaJ9ip2WaEJOJXr
	 UV1wydblGq5N35fbYGRcRr1RMNb6eTVHrUFhHj9RpN+lYSyx2yLWTNPd/OLpNppk+4ts0
	 jDH88YrZc6/GTTT6Dce1OwQHCj4Ky8Q0GusHJBCxHmWN7/iPONmLzNx3aYv/VoxCPeQPn
	 efBwDurT4YiXbiCpnbyBLTiB5KU0N0Nc6M+FVxCwU6ulUjpzbG1zsoC/qqJhTS3MH8jZM
	 V5FEV32OR8VR3Hng6GJPNpxqjPNefonh62NSDVna3bG2Y6SAIhhwQo/xPN5y4NifyKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=eTiF3ZOoRMevJy8G0lJueb0eugxecJaxzWbg0xO9GVE=;
	b=mehzP7BPSYK6UMx2jvl6c3fCJchkOxr7GgCnlV5hH851RzNxPJ/cpSphHTGjlS14uylP
	 yCab/5GlDoEF05zuiLEt9k9CSm+3ICEV179x0h0Er+FpJezYmfRKO+DwuU3XLtcxJhl3p
	 f4peHMYDl6ZzbBZBs9KTrfR4FP0dBMDovnT0rdyKiQZAFKggPtYZQpc0pfELeldiQHScG
	 gpvTkP5lcB2QdcOnUbXj8QIEnDOa1Op3sd+KyplM9xidITlzT7Z0Yk4DqBBqT1vYLvpPT
	 JJ3a0ueDT8SbunWWD3QsmPsUnmQPWESmdhiMWnD4akxc6TNxpao7ReuybbNBArXR8bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Orlf0dtM;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7490F606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7490F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Orlf0dtM
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ab432273c5so13182607b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210980; x=1793815780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTiF3ZOoRMevJy8G0lJueb0eugxecJaxzWbg0xO9GVE=;
        b=Orlf0dtM4pljxRPetv8jQkRempsnLqe68HnzyZJezG0yP+8EUTyK7QFRV2WOCRzc6U
         0AEPYGYbGvqBPQVegNI7Cg2ciiLmH+06QuxFzHSsxv6ypNxk+TTpTWkAOglZnje5cpOl
         IiZc8yAnQk+cb61rweM5LkMz7MOyLkgRg/+iIzWUI4dy2+qqe3nT5rL6t4B821OfFL3T
         N3FZUHCFgsF02OVrBLWdfs+Uo7d7Nqn6QMMmsTcqMFbWbhiaop2oVd/RvxbliI5Esndw
         nA3yA0aSBpjxJhFv1DuoLUrW+8fX+X3cfmFOcl3hBagh7aHjcGaO+1udTQmqa9qLWVJO
         dw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210980; x=1793815780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTiF3ZOoRMevJy8G0lJueb0eugxecJaxzWbg0xO9GVE=;
        b=W8z60jMr1uOTEJuE3Xu8dVO1J2GYyzEA3Eh7imSpHYnayqGGZRTplbqjxTIMjVt6jL
         uWcjAXntYPyjqe9nJx5qAx0LE381QMHFPOalXUzLaAhJEmPgZw/FU1fsN4upilOgq6kX
         g+SlzfyUPKYyD3h/qrJ/VpzJdTWUtPvb5AUNbEc77irbxcehfH50sGHZa2YBfGisKImx
         AaHXEmwOs5zvIkcbxDXM4iEYqUz7cDeT/eycDIky+MlRGZ6sOG7hL3V/iO+XI5Fg9lzR
         0nng8KQbSDnZIph1jKgvcqUtCPiwFrzhJ7CeJIsrrzwAD/5xTm1DG5amMCFWe7pPV9Kq
         FRSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhSzA2SV0BHVScJwYTOIofBOK4c2ocjvCsX8mk+C5lJzRnZxHlwZNuXxaW6DUDteH4LGt1mYzmjJY+ok4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe5bvg79hGDizaocSD9Bt6Lu0wbe6rNrzsP27vHHV8xRmUtHnU
	yAjtvkB7zrJSpacD8dWOZUocbgauXmpTz4YcfZVw2ursYOxguOwrdrTX
X-Gm-Gg: AYBFou1LIV1upZnRznPuf8bEUNchcleU/KJK64vQy1PMOdzMDrxmKBdGrZezhG8GESc
	ubVJC8t+eC6Lc5dQqevvLvKwORseTNon4W8ES10wk78pUoTH446MvO2vek88Nd5euM+3HqvNNrr
	8L/xQHhAu77PH2juo97uJTcHYrE2Vj0BmQxgGKva0P3aYERuNTF6pmX213oBcoiznr4/fHBluBm
	I05MZFoFYcS2QrbAONwUSHASb1ldC9JQ0ca31GrSGhZlX40S1yjC1l61WpeLn+rtAeEJexg7SgF
	Hi/SdBLglRlindaCT2IoIZQC9Ti1vAof3jkOSyGNNRGrkpuP/xtmq575JzM0wBBABjms0ih2FHp
	8BgGblnddHfSt747kKI5Rb2okOukqNkLLTya5OfhiCbghzWnPrj+QYUmwMM4r2ZzxUUm7jSBife
	k423uBIC1udOer+lrzYZyVz+/iunL8SUnpyFxnH2ZPEWfq+JF43xnlSMAoQR6y6K6Nq7m7OKhaJ
	fuU4HNuvJ7VBH95VqQ3XNVXKdD/kLeRO7fwK70/Wc9iOX0osxab58BZZxgBvVhKqDNxrymWGq4O
	pePQn6UcPJ7eeM+JjEu8MmY60dt+sonXNxnFzqXEYTOLBcdmUcprFA978EL0JuKrzd19QZAxKqb
	bEI61phsF9g==
X-Received: by 2002:a05:690c:a:b0:8b0:702f:2a69 with SMTP id 00721157ae682-8b1b5cb6a1dmr28674397b3.39.1793210980244;
        Wed, 28 Oct 2026 11:09:40 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e597080sm32648127b3.21.2026.10.28.11.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:39 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 28 Oct 2026 14:09:33 -0400
Subject: [PATCH 4/5] alpha/perf: attach ProfileMe status as PERF_SAMPLE_RAW
 data
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
Message-Id: <20261028-alpha-profileme-v1-4-d44b52bf2500@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4143; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=7lfzYXP8HFajbcWjdtNJAnU6E+tudpSNerQEXfAgV4w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWUXJls1vZWrqeD9f6zXnqkMb2t4s5HNIZUp6cuUgw
 1S1Rf6mHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHMNnwnD/2xnr7t+q0
 QmNa7T93GWWsD2oovfJdpiv3jcAe2Fa4+8W8Twv2bZzGl262YpXeUpyD757/fFc6dWioRNa9PU+
 7lbRPw3OycA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A ProfileMe sample's PC alone does not say what happened to the profiled
instruction. I_STAT and PCTR_CTL do: whether it trapped and why, was
mispredicted, stalled, or was killed on a wrong path, and what PCTR1
counted during the window.

With PERF_SAMPLE_RAW, attach PMPC, I_STAT and PCTR_CTL to each ProfileMe
sample in a versioned struct alpha_profileme_sample. PMPC is included
because a PALmode PMPC is not the sample's IP. Killed instructions can be
told apart by PM_KILLED_BM and VAL.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/perf_event.h      |  2 ++
 arch/alpha/include/uapi/asm/perf_event.h | 27 +++++++++++++++++++++++++++
 arch/alpha/kernel/perf_event.c           | 21 +++++++++++++++++++--
 3 files changed, 48 insertions(+), 2 deletions(-)

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
index 000000000000..0cb7d6f3cb15
--- /dev/null
+++ b/arch/alpha/include/uapi/asm/perf_event.h
@@ -0,0 +1,27 @@
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
+ * Fields may be added to the end in later versions.
+ */
+#define ALPHA_PROFILEME_SAMPLE_VERSION	1
+
+struct alpha_profileme_sample {
+	__u32 version;
+	__u32 reserved;
+	__u64 pmpc;
+	__u64 i_stat;
+	__u64 pctr_ctl;
+};
+
+#endif /* _UAPI_ASM_ALPHA_PERF_EVENT_H */
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 24c96feda942..06c9afeb7c05 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -915,10 +915,13 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 				       struct hw_perf_event *hwc,
 				       struct pt_regs *regs)
 {
+	struct alpha_profileme_sample pm;
+	struct perf_raw_record raw;
 	struct perf_sample_data data;
 	struct pt_regs pm_regs;
-	unsigned long i_stat, pmpc, ovr;
+	unsigned long pctr_ctl, i_stat, pmpc, ovr;
 
+	pctr_ctl = wrperfmon(PERFMON_CMD_READ, 0);
 	i_stat = wrperfmon(PERFMON_CMD_I_STAT, 0);
 	pmpc = wrperfmon(PERFMON_CMD_PMPC, 0);
 
@@ -941,7 +944,7 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 	 * perf cannot resolve. That happens for ITB miss, Istream access
 	 * violation and interrupt redirects, and for instructions inside
 	 * PALcode. Keep the interrupted PC, which for redirects is the
-	 * instruction that trapped.
+	 * instruction that trapped, and report the real PMPC in the raw data.
 	 */
 	pm_regs = *regs;
 	if (!(pmpc & EV67_PMPC_PAL)) {
@@ -955,6 +958,20 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 
 	perf_sample_data_init(&data, 0, hwc->last_period);
 
+	pm.version = ALPHA_PROFILEME_SAMPLE_VERSION;
+	pm.reserved = 0;
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
 	if (alpha_perf_event_set_period(event, hwc, 0))
 		perf_event_overflow(event, &data, &pm_regs);
 }

-- 
2.55.0

