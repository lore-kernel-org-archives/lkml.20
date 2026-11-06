Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939443;
	b=lLmvf6conqCJaJbyIDNlgpDq2Y/lbW+QLQb+ptqbpvYKHr3QOUkPVEoi0It5iUGG6eSt
	 Vgh0XOOSXXe/A4jcnJT7I1hO0a2l/93wAf2EedWiPQqHdjgEyvHnH0OTW4DeFWyNJA7Ds
	 wAXzANZNPZPltfjBxzorteXe971j6NL2nVGOfgxUnsKpUEJ0kf9wyLgoDU7K5SeoP6vhk
	 AWmYedE316t2bJw8mWB1mCxKgA6sBiTb60dm8F1tqwnldHb3bzb+GEbIE2dmaxM1rWGzK
	 yW6zfoSpoHOJwwfsWaF1TtIeKv26Iad1WRh5++H7E20k5h0nBwXyRoRsvPe5cCHfe7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AGtyQvYchcVLHuiKxMTc96t0GzZNyu71yLVIJTZaKLU=;
	b=5Qpzj+y5ErNYNJDUEUXsKMaDEBefFKkYBz1M03NNvZYcvwyEFuWM56d/h2yxCz+OOGhL
	 uM8cj8FRhnb/sRFd0au0SeWVB0J9ZLve4epfJGa/8ftN+HEcj8oLUvjNieBMKx76ezcgl
	 g+15gMT2ev8qx6aNofICkzR/qR9RYdMVayC2Yi09fLg7VTLIb2X3kmoyUqeEf5qW/r6Rj
	 EePAyhy2BlBTjF6/LQSXqFavEa9dcaULeNY7CQcWqsoOMpBfxvvd2JSCGAFeZmRqRtu5o
	 RnVNrIQX+c/EwFWd82QNGKi/IGJF+0D8IAw9KPyfa8cwB6Z3rxSCjP4DwlSP50qBOhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0cQ6PtY/";
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E1A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E1A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cQ6PtY/
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0d91601bdso11644767b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939442; x=1794544242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGtyQvYchcVLHuiKxMTc96t0GzZNyu71yLVIJTZaKLU=;
        b=0cQ6PtY/Ob9yBapfFPQEXQfEklybBVUbf/s90Fm55tiwBBRHXcdplmrEg3cyNtHJ5d
         //OXH0yyH83B8/i0I16G7ZvtkizMRfIVK9xGX0UW6RHPiKbGzls3ZFtLRoQ/1Cvf0Cb/
         pAMoe9mrOX4uow2y2oEOX3XoJJRdcS7nVhuolzjtBF/egUtIcB+zvgKfXSdh0amydqsk
         qjpu3kKZedHWsl4Pi2TrEzG7T1uuN8qVmHwBh2VQkgjtja5zTFNCYrkuW3NpxUdPyAOO
         ta/4N2mu1Mn1DRwCnmK1gKomiWbuXgaMlTpEETL/1zjbkZugm8wsnm+qUi4LFLHHrmx+
         1B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939442; x=1794544242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGtyQvYchcVLHuiKxMTc96t0GzZNyu71yLVIJTZaKLU=;
        b=bbZbwHazGG0z1QgIPEUZAFlfxaInzbVPm2B0K9zqN13Dm88m0lp9pCZYByOK+vOTvO
         V6MfMESjCZXIn8hldoR3z5mrCDId5gF912vnER2EmyTonAQCch68LA2Dl415yEPRMZzm
         f0GLFFYYbdh7VOnst0rumWej5l9fSns/wsRSYt6/UKFrlqaQt6vUitakr36n85OFzGVJ
         qob4Ul+Uj8OpKTaUjH+AxANCAXhaKe91tpRnKFI/UZ3q4xgc8SzKUB1OgVYlPBE9Z0pu
         lNyhxUZ5ufK898bjSpPpugZXMDcpG5sMTP8P3MRSRvJdPxemD6VKhCNLGtq7xlKwsvNB
         709w==
X-Forwarded-Encrypted: i=1; AL+hErEWEBwpkHIaWf7ecIZVS7yDxzMj4KkaI2p4MMtU8U8fKwshhfNjfSOQ4V2JcokBgrUGIcxUpAcZ8nn5Beg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oY2uIyJf3xab796fW0dLHrmC3NEYjaO2KJ0Hsxh2bbNs0M9qA
	CI2ZLk4dafQr1Vifoy3GKvJW68B5jMK6aqwRtFaav9QtLn/B8Aw6AWWj
X-Gm-Gg: AYBFou09NuVgSdogD1jVl+jTHOColu5LkqKJRQDsdtsGNeC1o1xGDrDudZDVRUeN/Fd
	jr/wiJsh7/jC1MV89RA02u1s0rT6pPY3GF1r4CktSJrVrgAn9S50TAkjdgLua2NtHqiqUJBWpVm
	hFrniF2KHxobDgFhrKNIfY9RYMw7jnhRH6UzopwiyDvyx5JmTAp/wPzRXySqnszWfLg00H6jH7x
	SXRvoEDHxVjjVm7Y6A9ZrAl6DWXpKoqfAmnd8JKGZ523R8oCuz2HwJzwwJKxmw9WIUyVibTVbJy
	B/RI+x6+wYUeo4xclyaBTqMxNgUaN7JPRF4s+zjLN4dfdwT9PMxh0zO8LnVPAHoNT/zIP01/X/U
	ByPcw05nEbl1JIx3AzNnZC3YsDFaQvoxB2E50fDiUekEoroITSIPc1psvorhubSYEHTgx1ii+My
	57QxVvzvyqoTMbEi7dBb7BCyLbOXTLsgrqq0iAb0j58ekV0xwPOP3RfoC+4lfIwqDk31sFWpU9X
	GL94Am7hPUXuQMBfr4BUxSluff8RJneeJYAzVvSN2LEKBylZ4YmNx85aSrlOmbLh6Q3ECLV1Q9X
	BUg1irnhSycjFMSyDENApVqgJNU2Z6fFKw1KKxZcAUoAIxmO4sn/fg7jRFj6WXjjFCqOg9fQlCI
	epGF1ePuHK1eDwp5e3sb+qM6F+N/nR8Y=
X-Received: by 2002:a05:690c:e3c4:b0:8b0:e13c:2856 with SMTP id 00721157ae682-8b341916a6emr8161097b3.5.1793939441758;
        Thu, 05 Nov 2026 20:30:41 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f865b4esm11354667b3.39.2026.11.05.20.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:40 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:27 -0500
Subject: [PATCH v7 08/14] alpha/perf: attach ProfileMe status as
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
Message-Id: <20261105-alpha-profileme-v7-8-c474e892abb0@gmail.com>
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4974; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=gu5SSWJDMUCdvZK9PnzymhJAkJFCke++KgoN+Qp259M=;
 b=kA0DAAoWrOspdAyaTpcByyZiAGrtV93IEHZwIKjSmbXWks9aUl8TPKrjj4xD8++2kFUigmTlI
 ojxBAAWCgCZFiEEXq8hBJqGuKVMyxv6rOspdAyaTpcFAmrtV90bFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9wZW5wZ3AuZmlmdGhob3J
 zZW1hbi5uZXQ1RUFGMjEwNDlBODZCOEE1NENDQjFCRkFBQ0VCMjk3NDBDOUE0RTk3AAoJEKzrKX
 QMmk6XfF0BAMTVERVSITvvZZatqTi60nbf++dQrH1EWdQB5k9VGmP8AQCmgQBiurLNHVQjE8Dvp
 2IzaEb0OOA8q4/ko8+v0JQGAw==
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

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
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
index a6ef71e7e30b..5f8f948a973f 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -1037,11 +1037,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 				       struct hw_perf_event *hwc,
 				       struct pt_regs *regs, long ovf)
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
 
@@ -1078,8 +1081,8 @@ static void alpha_perf_event_profileme(struct perf_event *event,
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
@@ -1113,6 +1116,19 @@ static void alpha_perf_event_profileme(struct perf_event *event,
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

