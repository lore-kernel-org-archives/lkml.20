Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637380;
	b=fvcTEh/7HX3Sm26WoJ+EZ9SrZrSyiTB8TyNyFwBAL6WPysSGNrUXRnaPYcHlujz6W3ZE
	 fQcYtJZ/Q6U72qe/uxfitCXG9kyVxCnzcoc3oX4NZ+3kW3DJR532NBfKmoqIwyZ+5yDAy
	 IRHukcl7yP3QNL0SwxNJhNNzLgVD+asIZiqsfcl03JRg8WBq7lqhyV8OV3jPi4QY4GUpQ
	 XSUm87Daw/qAOspqhptTWC6u1TdHc0JYkcprQAwmCMjEQzpo246pjcLevmqW+VLFP8CB1
	 pmGXHYWLkkND6uwTnrMOf3OsRTnYQv33h5PsdG+5IZg4fEtpMtxB6qHSZADZrT1K3cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pe+iBCXlfUhGRsNdrQnrE441NaKe3IG5d/wYB6GhAh8=;
	b=sC5Jbnszkgcd0iz4M0RyRsxsHPtR77CfpFQ5AELN4PekaFDG5dQUk+BjF731lEIlNs41
	 79CDe4KKJuDig8+ZMbH9DP+PHdZrJ8piaVost3IGGXgFyQJT8YXsGSaxow/XU48WMU0NQ
	 /L8nQTsc7jdI+KW9dBihQ15PRqMMAXLrdoLIwcdyHOrs9q66i83yaJ7BZBe5GEc46ZYm0
	 /ULquQII27FHXISwBuQ71Y56wxF2MclJckaswFgLWKX3KOXg0H8gEDOKCfrDASAACSnX2
	 +9L/CHwHapNb5MGcfrcAoyV+snWugYegIqbXnQq/MZlGqCgW2aS5nJtHsAE9vBbmwjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xenpjJDe;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C16606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C16606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xenpjJDe
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed58279115so2775505ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637379; x=1795242179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pe+iBCXlfUhGRsNdrQnrE441NaKe3IG5d/wYB6GhAh8=;
        b=xenpjJDe0ho8+4x8JcBSjfM2k3KNYx6zu3h2lOUpllbV34LFWWzeCbW1c2hsyUIprC
         PA1L1P//Bdyahv7XEc8tRKeVTRzbtBcl65LeGh2gS7kCbDy0YaM1PbYSgitXw0bjdpOW
         CfaA3Bj0OS973IP0DiXDB8XzG7UyrmiiarlPo7W/tyjEpEufOIbi5Bwx2GCUHNrNL4AG
         NIMKqUSaBCKQVX8bAUBSX4esi8Ob54iZyI+YfjmywZNW2nwR5XYQ+ymFfi/qfvERt6yG
         YSq/cl+lxGf6AZir4CnglbdKOOQhvmZUarjCiTkWgDn/ZGkaD+j8i7gpuq6o3CpxxJ9R
         pX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637379; x=1795242179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pe+iBCXlfUhGRsNdrQnrE441NaKe3IG5d/wYB6GhAh8=;
        b=2tDBudpxrp2obTlXO0JYYHTtexDwDDAJbY+hr6cszZe8ZzSYRnck1Rvr67R/H5UzHe
         QFON2TRQ3G9gqhNsr5QsJBlCzd7TvCSpMpU0ox6tuCr3j7ZfMWRjZNk7jvQLXrrq14fT
         /qqrQLmRTwSlTXtRQ/awB0BKa+EHPG7PG3rjTu0oTquFHJqI1Z13fbIBvckekcR2LT2R
         AKBshhLGv2c0lOggQc+36t38VZB58AL1ZQzR89uXs56M5e8nB2vQkRm+KNBqP8+7vcpM
         pdQ6HiPb940TdT/+TfYGLSljunh1AdsEBkrlgLeEKcJ/0R5UgLGSKDIE29prVEsdx2qX
         BDRg==
X-Forwarded-Encrypted: i=1; AL+hErGQ8P7tqGloq0yyOP3QmH6fkqIpNb79yFBclqgWx0VsgSf96E+0ZdDYxUyMqoCqGjB3ku+60K97p/VkByg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+PIniHw8T3xIvxhTPEnx/cVO1/cpY7QzI7ip2iMdA4XwVo0f5
	KErU/LCTC73n5H1Ptu5ser2pEO0NzixAo6/EP1/4BYpTuBPA/AnlFcuz
X-Gm-Gg: AYBFou0Jhdkc4fT0a2yyzoKUtsIxrbYkg7ydSQ36Ye21y42FwxE2QORv0qw54M+RM2f
	P0TP5GtfqesXOpSyXHXk8s5BWb89NTNFGyhV48L6TrDSyOW94ykMt2a406GIIMsvhOG/3Pg3nf8
	ktOevW59lYay2deuDxslVIrnM8z7N7TvXApT1jXYlRMEQ5wBawGPicMaeAfyvKxvPTkBTxHL92A
	/GmgnRzrUsOd/msFbMFjiVTOTOQTdbQp8nPFX+cEMrN81E5JMvdFHTG2BNdbTI14JRirHhNWsJZ
	GrJoLFomz7+Yj4EXjkmOWIPgxI5HnQz/Gvm0HAf4SY358OvHB3JfroxBANKdslu5eupdLS/l1z4
	6u9Ia+c4Z+CKMDG8LMJGqriOi5ycDQcJQMB7Np4oNYZTChTU8qGSaw8IO+VNj2bEsXyU5AXc1kd
	R/44ICkG6icyBg0etEvC5p7K7rBtWuyxOytqcO9vNyJkNFo+fLKSPCfsYQMZnGIiMN9pM5MAKfH
	zb0Krx7rmlR7KpFtxB0SuEOj8ORQ78AzWIbaDGxqLYxlqfeu1osbhybl52Y6KiWc+Ak3QRd84XR
	lZ4vt99Qbk16b7OM5nwRVOJB8lXRR0Ex7yQtpXLXq4b2PSlO+nL65aU+TE1B68xXcbozBqdO99R
	j4mI=
X-Received: by 2002:a17:90b:4d05:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b1b05aabb5mr6325337a91.0.1794637379083;
        Fri, 13 Nov 2026 22:22:59 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm12804092a91.0.2026.11.13.22.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:22:58 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kan Liang <kan.liang@linux.intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf/x86/intel: Don't allow extended register sampling for BTS events
Date: Sat, 14 Nov 2026 15:22:49 +0900
Message-ID: <20261114062249.1301-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
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

x86_pmu_hw_config() accepts extended (XMM) register sampling in
REGS_USER for events without precise_ip, and the same goes for the SIMD
register fields. The BTS event is such an event, and
intel_pmu_bts_config() does not reject it.

For a sample taken in the PMI handler, x86_pmu_update_perf_regs() copies
the user registers into the per-CPU x86_user_regs, which is a struct
x86_perf_regs. That is what perf_reg_value() and perf_simd_reg_value()
expect: they use container_of() on the sampled struct pt_regs to reach
the fields that follow it.

intel_pmu_drain_bts_buffer() does not call x86_pmu_update_perf_regs().
It passes zeroed on-stack registers to perf_prepare_sample(), so the
generic perf_sample_regs_user() takes the user registers from
perf_get_regs_user(). That returns task_pt_regs(current), or on x86_64,
when the buffer is drained from the PMI handler, a copy in the per-CPU
nmi_user_regs, and neither is embedded in a struct x86_perf_regs. For a
BTS event that requests these registers in REGS_USER, perf_reg_value()
and perf_simd_reg_value() therefore read past the end of the struct
pt_regs they are given, and use the words found there as pointers.
REGS_INTR is not affected: BTS events must set exclude_kernel, and
perf_sample_regs_intr() then reports no registers, as the zeroed ones
are not user mode.

BTS samples are built from the BTS buffer when it is drained, not from
the registers of an interrupted context, so there is nothing meaningful
to report in these registers for them. Reject extended and SIMD
register sampling for BTS events in intel_pmu_bts_config(), as was the
case before these registers could be sampled for events without
precise_ip.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: edd9aec51213 ("perf/x86: Enable XMM register sampling for REGS_USER case")
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
No Cc: stable, as the Fixes target first appeared in v7.4-rc1.

The container_of() on a struct pt_regs that is not embedded in a struct
x86_perf_regs came up in the review of v10 of the SIMD sampling series,
for software events and bpf_perf_event_output():
https://lore.kernel.org/r/20260824091225.514D71F000E9@smtp.kernel.org
The reply there pointed out that the PMU capability checks reject those
events. The BTS event is created on the core PMU, which has
PERF_PMU_CAP_EXTENDED_REGS (and PERF_PMU_CAP_SIMD_REGS where supported),
so those checks do not stop it.

 arch/x86/events/intel/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 0a34d674df59..88a60d3e4eeb 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4778,6 +4778,16 @@ static int intel_pmu_bts_config(struct perf_event *event)
 		if (attr->precise_ip)
 			return -EOPNOTSUPP;
 
+		/*
+		 * BTS samples are built from the BTS buffer when it is drained,
+		 * not from the registers of an interrupted context, and
+		 * intel_pmu_drain_bts_buffer() does not provide the registers in
+		 * the struct x86_perf_regs layout that extended register sampling
+		 * relies on.
+		 */
+		if (event_has_extended_regs(event) || event_has_simd_regs(event))
+			return -EOPNOTSUPP;
+
 		/* disallow bts if conflicting events are present */
 		if (x86_add_exclusive(x86_lbr_exclusive_lbr))
 			return -EBUSY;

base-commit: 59f1398140869432c7171b9a2a279ca315467c4e
-- 
2.43.0

