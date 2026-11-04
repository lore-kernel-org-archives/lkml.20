Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818442;
	b=RWL0ez+dimPNjIifxOX0GzzPoVHP6JkIVVLNpCvDVQ/NbPRS+5VjTp39S/iGWl36yXTG
	 SPNbpQI1QVCYtB1EE2cr8E7QzaJlA6erEMD7PCdx3iS/5FExllscfRO3CW880Ytm3pc4y
	 RuT81Q80NlRtiM+Nzdjc/Y72iLimTBbMVPzOT+iKq0a734S6/2xvPwcCIRxJsZ/auONIp
	 im6jln2GyrM4DPze/eQ0b9DhdAuS1HRmTLo0ansarWZcnksDNhu/cSBvEqfLmC1wEb+Jl
	 tBhnN1G7k7hr+gqduhXvcrxZ0UhUw7QOvKt5Bqgh9Sv8fb+0n73kK2tzAnfnVa0HmFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bG17toEvZh++6oWvbtdtKUsBVX6r9sD7TdpJIvwp2W8=;
	b=0PjJ/gf407U+CUHwymSDtT7Ftl46j9KoW06DNivM4ExsWbbk/jTTT4vLN1Yj32irRF37
	 MVNOXmo8Ob3NMS82Zb2W363SeUdt0g8G/UoyNK5Rfpbwhgl4vm+hWGkS+tpuE3EWsBa2J
	 2eXgQxdcqhMTJly5VYoDrWhgV0G1EgXFEAUqa45LBqurihOHm+quvw6REspuzI5vVBvsH
	 hRWxjbX01j7kTFS0pk5SJcUe/tqr0LCPFjLTVIeE+0SoS522Q8BpJXoq1S6HClLDYsXkz
	 xHd7oJN3rOWRzhHYi93f0uRHAJWxDPuaMw7TS5oBNbGXaUlpMDFNAY4qJjV8Jr9gmpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SI6EEa2n;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19A606EEAF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D19A606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SI6EEa2n
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b10d24345dso10249327b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818440; x=1794423240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bG17toEvZh++6oWvbtdtKUsBVX6r9sD7TdpJIvwp2W8=;
        b=SI6EEa2noK56LZOEvuTiGj/vbhYI+Cae8xlwRgjKig4fhTbIr9UoIwjh6oqZWvB39g
         zRr2B6xRcISCXu8NZvap5bJNIkZUIeIEJyYOceD3/ZgK6fpNOKZOT+QkdbVhWRG2/sF1
         XVSigwBaA/5Espmk3Zrx05eRd0OuNI+clihfvHAHnN5UJSPruNFJC1vqP46ORtsG0VI3
         bN7zsQB4un/IquEUPzaKX8cHzu1bDp/9K9LAelPji7FRyo+XMClNqVvQA75OKMnPMj7S
         SpqTNmuOAmc1W60ULK4MCvEiJMVGS8y19SsUVxiWjNXjj8zfBKxt7+9iXfWvtWM943sX
         eA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818440; x=1794423240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bG17toEvZh++6oWvbtdtKUsBVX6r9sD7TdpJIvwp2W8=;
        b=ZqVX9J4PN4w9C/QtK3Np6LSisshOD4xJR1/S+1Jjgl9Q9EGZ2ru9mQbEjC9EndvtTf
         BMWH+yDzcUvptUVNLBsEBrmgGdN4anj7X1XQOpEzzVAter4KulbQTeJgcP4T+ep7HGd+
         lSM+sIIwHAVSOAgwUt/lC9cCyx1or8cvsbvKnT7hJCVM/5eypwA+oq5gfQGzCykhgzSv
         bMnrWmC7k+uMD5B6vEmhdzYDPnEmllDZ1yeVUAqcU56H2iAdazflrjNWaI6tmH5n7foX
         l7BT+uMgFJ52j5N5GMUWQUhLi2r16+dkRD9USiCMB3eVrIIGv4GaeGrOAY9KoNc0vQVC
         aS6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgtSB0fYs3YFgNU+jkrAvaokGh0VQsDKlMWGIo/gupUT7jmDP0QZC5tO6bSOr7/UgiMCRYI7jfyUZPI8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l7WyCLdK3SjZy/OgMraf4QpTdA+CoHFKnvmUZvTD62tLpfNrA
	kzryY7Oa+wjiIHOUFCxeJ8V0TrJcvxP6PlB0fyIQz1zf70C5O/otkKcE
X-Gm-Gg: AYBFou2HCFnWv4skdKhTNmvpJgbYAt92X4YpRtkbM9BOZl49dEufIRAstJ999XBPFbr
	/u1LQY0dc24YGfXNnIX+EHy4WR6/XrjOz0S6aHh2rAH9y3Y6e3NQ8P1LTz+E/cIzZMjeI0S79AI
	JyGmbo1CGPKgXXA2MOt1Jx9WunVACgF/mW5iYoV1ogz/vo8TsvRTqzXaxmaTt86dlAcsPiW/HOs
	hThxb/CWAUfqglyAEIexkrBVu3YTrk5XID8+a05sEBD8TY+YsG89EWspNZZXa7Cyt/0DpV8m0Zv
	fo03lo0YkAJ3vb3fB3JdbdB7VWecEfTVJUQYpEfqidTwuapC2i4MuQVdwiZfdxud84gLfP8aRmD
	NRXf0gTR6uRt52SmxVRv3S4AAqhxquKpxuxlOFxsse1xohVDAn1VMFPU6S4Ts+kRHM1tvSMo9Zx
	6b9w++VS6UYmt0jH4iNE6kgPbTSKFNBSQ7KVn6cu+Oqz07Bur2QIDvsM6ZDQnbuRmkEq30BafHJ
	TctT+kJsraLU334ZBG8S1FS1nXqbuPrAjpy/p3ZXUff7ISRd3Ebcm4srMyd4MIj+HPngHfwVCBc
	hWABW5JeK681IRv4VHYNAqhRTZ2nXxtFu2ZNxdUX3fYUAUKwPU+IpaaFuUIYNs1cN2V8d2lXBsp
	TIABAw240fw==
X-Received: by 2002:a05:690c:30a:b0:8b1:6e61:513 with SMTP id 00721157ae682-8b2b64382d1mr172025907b3.0.1793818440462;
        Wed, 04 Nov 2026 10:54:00 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099291d7sm24787807b3.16.2026.11.04.10.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:53:59 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:53:56 -0500
Subject: [PATCH v4 1/3] perf alpha: Decode ProfileMe raw samples
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
Message-Id: <20261104-perf-alpha-profileme-v4-1-1771ea02950e@gmail.com>
References: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com>
In-Reply-To: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10228; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=vN2dNodGOzqDv+WTFB0OWLrULDzd2p5lHoMP/25UmAw=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe17uwX58wQVfU54+Npuoam/MJvf1Bi1bpvmV7r+nSc
 vxR+uRdHR9YGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNNlQjDj53s13uZNv
 5f/nFKaVGtbeivgyGHTXYbXrLle68bN1n3LSPD3+Q31XKPV8dEn23c4fq9OM370o+ksOxnX9klM
 utsPjEwAAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The Alpha cpu PMU attaches struct alpha_profileme_sample to each
ProfileMe sample as PERF_SAMPLE_RAW data: the profiled instruction's
PMPC along with the I_STAT and PCTR_CTL status that says what happened
to it.

Decode it in perf report -D and perf script -D the way AMD IBS raw data
is decoded, naming the trap from TRAP_TYPE when TRP is set and from the
PALcode entry offset in PMPC for redirect traps, which TRAP_TYPE does
not report. TRP is ignored for an instruction killed before it was
mapped, as an EV7 leaves it stale there. The payload is copied out of
the sample and converted from little endian, so that it decodes on
strict-alignment and big-endian hosts too.

Copy the uapi header that defines the struct into tools/arch and add it
to check-headers.sh.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 tools/arch/alpha/include/uapi/asm/perf_event.h |  31 +++++
 tools/perf/check-headers.sh                    |   1 +
 tools/perf/util/Build                          |   1 +
 tools/perf/util/alpha-sample-raw.c             | 156 +++++++++++++++++++++++++
 tools/perf/util/sample-raw.c                   |   2 +
 tools/perf/util/sample-raw.h                   |   2 +
 6 files changed, 193 insertions(+)

diff --git a/tools/arch/alpha/include/uapi/asm/perf_event.h b/tools/arch/alpha/include/uapi/asm/perf_event.h
new file mode 100644
index 000000000000..aa0eff5a917c
--- /dev/null
+++ b/tools/arch/alpha/include/uapi/asm/perf_event.h
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
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 531c0e0e84df..de66bb148754 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -36,6 +36,7 @@ declare -a FILES=(
   "arch/x86/include/asm/msr-index.h"
   "arch/x86/lib/x86-opcode-map.txt"
   "arch/x86/tools/gen-insn-attr-x86.awk"
+  "arch/alpha/include/uapi/asm/perf_event.h"
   "arch/arm/include/uapi/asm/perf_regs.h"
   "arch/arm64/include/uapi/asm/perf_regs.h"
   "arch/loongarch/include/uapi/asm/perf_regs.h"
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 2c1f880c4c47..2ab63bbe4a05 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -77,6 +77,7 @@ perf-util-y += sample.o
 perf-util-y += sample-raw.o
 perf-util-y += s390-sample-raw.o
 perf-util-y += amd-sample-raw.o
+perf-util-y += alpha-sample-raw.o
 perf-util-y += ordered-events.o
 perf-util-y += namespaces.o
 perf-util-y += comm.o
diff --git a/tools/perf/util/alpha-sample-raw.c b/tools/perf/util/alpha-sample-raw.c
new file mode 100644
index 000000000000..6ff0566799ca
--- /dev/null
+++ b/tools/perf/util/alpha-sample-raw.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Alpha specific. Provide textual annotation for ProfileMe raw sample data.
+ */
+
+#include <stdio.h>
+#include <string.h>
+#include <linux/kernel.h>
+#include <linux/perf_event.h>
+
+/* -Wpacked objects to the packed fields where __u64 is 4-byte aligned. */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wpacked"
+#pragma GCC diagnostic ignored "-Wattributes"
+#include "../../arch/alpha/include/uapi/asm/perf_event.h"
+#pragma GCC diagnostic pop
+
+#include "evlist.h"
+#include "evsel.h"
+#include "sample-raw.h"
+#include "util/sample.h"
+
+/* I_STAT */
+#define I_STAT_OVR(x)		(((x) >> 30) & 0x7)
+#define I_STAT_ICM(x)		(((x) >> 33) & 0x1)
+#define I_STAT_TRAP_TYPE(x)	(((x) >> 34) & 0xf)
+#define I_STAT_LSO(x)		(((x) >> 38) & 0x1)
+#define I_STAT_TRP(x)		(((x) >> 39) & 0x1)
+#define I_STAT_MIS(x)		(((x) >> 40) & 0x1)
+
+/* PCTR_CTL */
+#define PCTR_CTL_TAK(x)		((x) & 0x1)
+#define PCTR_CTL_VAL(x)		(((x) >> 1) & 0x1)
+#define PCTR_CTL_SL1(x)		(((x) >> 2) & 0x3)
+#define PCTR_CTL_SL0(x)		(((x) >> 4) & 0x1)
+#define PCTR_CTL_PCTR1(x)	(((x) >> 6) & 0xfffff)
+#define PCTR_CTL_KILLED(x)	(((x) >> 26) & 0x1)
+#define PCTR_CTL_STALLED(x)	(((x) >> 27) & 0x1)
+#define PCTR_CTL_PCTR0(x)	(((x) >> 28) & 0xfffff)
+
+/* PMPC */
+#define PMPC_PAL(x)		((x) & 0x1)
+#define PMPC_PAL_OFFSET(x)	((x) & 0x7fff)
+
+static const char * const trap_type_names[16] = {
+	[0]  = "replay",
+	[2]  = "DTB double miss (3 level)",
+	[3]  = "DTB double miss (4 level)",
+	[4]  = "FP disabled",
+	[5]  = "unaligned",
+	[6]  = "DTB single miss",
+	[7]  = "Dstream fault",
+	[8]  = "OPCDEC",
+	[10] = "machine check",
+	[12] = "arithmetic",
+	[14] = "MT_FPCR",
+	[15] = "reset",
+};
+
+/* What PCTR1 counts during the window, by SL1. */
+static const char * const pctr1_names[4] = {
+	"cycles",
+	"retire delay",
+	"bcache misses",
+	"mbox replays",
+};
+
+/* TRP, and MIS and the trap type with it, are stale for a killed insn. */
+static bool trapped(__u64 i_stat, __u64 ctl)
+{
+	return I_STAT_TRP(i_stat) && !PCTR_CTL_KILLED(ctl);
+}
+
+static const char *trap_name(__u64 i_stat, __u64 ctl, __u64 pmpc)
+{
+	const char *name;
+
+	/* Redirect traps leave TRAP_TYPE alone and are named by PMPC. */
+	if (PMPC_PAL(pmpc)) {
+		switch (PMPC_PAL_OFFSET(pmpc)) {
+		case 0x481:
+			return "Istream access violation";
+		case 0x581:
+			return "ITB miss";
+		case 0x681:
+			return "interrupt";
+		default:
+			break;
+		}
+	}
+	if (!trapped(i_stat, ctl) || I_STAT_MIS(i_stat))
+		return "none";
+	name = trap_type_names[I_STAT_TRAP_TYPE(i_stat)];
+	return name ? name : "other (see PMPC)";
+}
+
+/*
+ * Copy the payload out of the sample, since nothing guarantees its
+ * alignment in the buffer, and convert it from the little-endian byte
+ * order it was recorded in.
+ */
+static bool is_profileme_sample(struct evlist *evlist, union perf_event *event,
+				struct perf_sample *sample,
+				struct alpha_profileme_sample *pm)
+{
+	struct evsel *evsel;
+
+	if (sample->raw_size < sizeof(*pm))
+		return false;
+
+	evsel = evlist__event2evsel(evlist, event);
+	if (!evsel)
+		return false;
+	if (evsel->core.attr.type != PERF_TYPE_HARDWARE &&
+	    evsel->core.attr.type != PERF_TYPE_RAW)
+		return false;
+
+	memcpy(pm, sample->raw_data, sizeof(*pm));
+	pm->version = le32_to_cpu(pm->version);
+	pm->pmpc = le64_to_cpu(pm->pmpc);
+	pm->i_stat = le64_to_cpu(pm->i_stat);
+	pm->pctr_ctl = le64_to_cpu(pm->pctr_ctl);
+
+	return pm->version >= ALPHA_PROFILEME_SAMPLE_VERSION;
+}
+
+void evlist__alpha_sample_raw(struct evlist *evlist, union perf_event *event,
+			      struct perf_sample *sample)
+{
+	struct alpha_profileme_sample pm;
+	unsigned long long i_stat, ctl, pmpc;
+
+	if (event->header.type != PERF_RECORD_SAMPLE ||
+	    !is_profileme_sample(evlist, event, sample, &pm))
+		return;
+
+	i_stat = pm.i_stat;
+	ctl = pm.pctr_ctl;
+	pmpc = pm.pmpc;
+
+	printf("ProfileMe PMPC:\t%016llx %s trap %s%s\n",
+	       pmpc, PMPC_PAL(pmpc) ? "PAL" : (pmpc >> 63 ? "kernel" : "user"),
+	       trap_name(i_stat, ctl, pmpc),
+	       trapped(i_stat, ctl) && I_STAT_MIS(i_stat) ? " mispredicted" : "");
+	printf("ProfileMe I_STAT:\t%016llx TRP %d MIS %d LSO %d TrapType %d ICM %d OVR %d\n",
+	       i_stat, (int)I_STAT_TRP(i_stat), (int)I_STAT_MIS(i_stat),
+	       (int)I_STAT_LSO(i_stat), (int)I_STAT_TRAP_TYPE(i_stat),
+	       (int)I_STAT_ICM(i_stat), (int)I_STAT_OVR(i_stat));
+	printf("ProfileMe PCTR_CTL:\t%016llx VAL %d TAK %d Stalled %d Killed %d",
+	       ctl, (int)PCTR_CTL_VAL(ctl), (int)PCTR_CTL_TAK(ctl),
+	       (int)PCTR_CTL_STALLED(ctl), (int)PCTR_CTL_KILLED(ctl));
+	printf(" SL0 %d SL1 %d PCTR0 %d PCTR1 %d (%s)\n",
+	       (int)PCTR_CTL_SL0(ctl), (int)PCTR_CTL_SL1(ctl),
+	       (int)PCTR_CTL_PCTR0(ctl), (int)PCTR_CTL_PCTR1(ctl),
+	       pctr1_names[PCTR_CTL_SL1(ctl)]);
+}
diff --git a/tools/perf/util/sample-raw.c b/tools/perf/util/sample-raw.c
index f5ae9f468983..f765429a481d 100644
--- a/tools/perf/util/sample-raw.c
+++ b/tools/perf/util/sample-raw.c
@@ -19,6 +19,8 @@ void evlist__init_trace_event_sample_raw(struct evlist *evlist, struct perf_env
 
 	if (e_machine == EM_S390) {
 		evlist__set_trace_event_sample_raw(evlist, evlist__s390_sample_raw);
+	} else if (e_machine == EM_ALPHA) {
+		evlist__set_trace_event_sample_raw(evlist, evlist__alpha_sample_raw);
 	} else if (e_machine == EM_X86_64 || e_machine == EM_386) {
 		const char *cpuid = perf_env__cpuid(env);
 
diff --git a/tools/perf/util/sample-raw.h b/tools/perf/util/sample-raw.h
index c8d38c841c8c..8df0bd3d02aa 100644
--- a/tools/perf/util/sample-raw.h
+++ b/tools/perf/util/sample-raw.h
@@ -14,6 +14,8 @@ void evlist__s390_sample_raw(struct evlist *evlist, union perf_event *event,
 bool evlist__has_amd_ibs(struct evlist *evlist);
 void evlist__amd_sample_raw(struct evlist *evlist, union perf_event *event,
 			    struct perf_sample *sample);
+void evlist__alpha_sample_raw(struct evlist *evlist, union perf_event *event,
+			      struct perf_sample *sample);
 void evlist__init_trace_event_sample_raw(struct evlist *evlist, struct perf_env *env);
 
 #endif /* __SAMPLE_RAW_H */

-- 
2.55.0

