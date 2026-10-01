Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09247439F8A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832305; cv=none; b=Wk5oJImjVes0D31+gA7Q9Oh52pzv8mgzHiVbJx0WkBqxWgmdDcE2MxxE4xH33txJxGIrh3KJViEeITD8mr/L0FMOBc0EjviuChRa78SpcYDxRff01cqf6KqqLRCsM9vc+g11U1tDJcMuRIZVXDjosUQchzokE5KDrjmByzkmDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832305; c=relaxed/simple;
	bh=tgu3ALA53KDqwVmsL/5swL+KRf8bJEEWm5f6FAhbNkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5kURP31igS7TwL0LKkzDXfomGIWV1VM+CvRjHovXznN98XcI7BgcGhCfnHm/icsKseIxdFedU4Zx91LQpEzNEeFTVbj1zTQYgunyUdZMmhUzfspGTxpsSCErPmau5nB6wj05wRGHbgYRLYWPd74ey0VaObUrOCyQfHId6dt1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=El1A70x5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkA45r41; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="El1A70x5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkA45r41"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6915GQ8h1954287
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TiL1DqtELen
	bOFB6PbnT54f13FVRUjcvw/Hei+VMjvE=; b=El1A70x55BcHhMgQqE7Epri1hAI
	L4eL4Ls7YiLvXOCvFZljauItoN3n2GmGjIojeYzCbFIwtQpUzKxhW0loX6e+wtGR
	4wupONDIbOyf+a/F0zREGoQM30v+90LoiSoWLW4Gc3ZtYL7LA0hux3SqXx3AsXMh
	gOeoBZW8oJuJ1ya00Eb1K1jConcXLgbBD2YktBw5vQFLSKvKXzJ8agES5njDz2mZ
	JPsEwOEsX19vsvO85xFDST+j+B6VTX5H9Sae5PfKQ1ViOwoLxrqh705z6S/8JQSg
	OCPlchnlimQu+pXYV7pcueJ12htea6UMzIA9XOF4oU4wHhWZU2nNIA22ftQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nr1fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:25:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dfb24dfedfso41062485ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832300; x=1791437100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TiL1DqtELenbOFB6PbnT54f13FVRUjcvw/Hei+VMjvE=;
        b=bkA45r411caayEOllphXhvGAf8XbCHdqgXFnJs4byxZgn5XYutObYlYscunOZHbWl5
         yhOeq+1aCBpHRXkQTBS2aOgSZw5M3a5aHWYO0KH3iRO4A6jLsPpydVgi4PKEEgc9dpP+
         VQEv9YUJLr0B1oj4r8AbFhSTXomsbJb6cHqtYp1sPLHvH7lLOL3dJBa7dWx7k7f2toq5
         IY3d9cXH9neplnUDSXOPX33GCi6DNbWf2lDJVAzzf3rgbPkCZqJ7ruCYtIdYZf4otPi7
         s4rBv0L8e2GNgeXu4WuWTFk+kZWDcj3vFsPZ8EaOy3bl5IpVFZGskI07OEJ42riWP3sA
         lReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832300; x=1791437100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TiL1DqtELenbOFB6PbnT54f13FVRUjcvw/Hei+VMjvE=;
        b=NLRbPw69WhtnzpkSgQ8ehvvx38YdVh6S8iba4uOQgsSQyxnhiLM0kv1kxe8kA5GgeZ
         VYn61mP94falFko5A5Lu/sErAXfiGNojchCgQWugqNLE1+avA/tjRPSD/s4V0CRVKqq0
         CeAOKbfeIHbVgsRT2XsgHiDODqoLZG0zQ1B7BEA/42JsuLRIdYqeJ64bkPBY/+xLH9ld
         2gXooOesABR7MVZi1GgIuRNoo+PgATq/GVOpFekLgYmeAQ3MXHCCjKiQaCWUH/lopmhg
         h6strs0W4Nyry2EtD9IxxgLLpSNsU2sCAClerSKIR6M0qKmKRTkJ67386MSnlMgSxm7r
         No/w==
X-Forwarded-Encrypted: i=1; AKwUvBz4RDQRDsRIAzry7FFxHCSIeN/pQXd0Ksgyu1dyRYbM+XN+GMZz0MLf9t/a2Nxc9lEAAyRVH+I83cK0ExU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj6XvvimrJHxheMOwndZAonDHQv44myG31UqgK8qintms6Vxa/
	6KQbZVVEsemwlA/1dhaVPGtHNoByMLgwWm7CmEzeQCWh5C4h4r3VjJOKFzvsT3jEKThrPkHJ1Ss
	6NsyPzSoidQhc8B7O2+Ov5sKrUEzQLjCVhq3TIDwBYs8cmT6W6womcKUMM+wvSWiFq6M=
X-Gm-Gg: AYBFou2F9Woh7H3EcDIHosf+LmY1AOdo7bbGZ+SQ3M587EoJvdXfYSpVWfEuI/Bh/xA
	AS7MyfiA7XTGpujZ0PNNW05pvU0PwSmY9IcrYKJH0FNVZLO5Enf5RVHEBU3e39WgqB67KpPQW99
	VRmYGOenFEiWjFLBukxaIrVRIDQiCOvxvwp75YBKI5/l0YHo9VCxhP8j4bIZijaEe7dWvNbDal8
	WF1tmT65TnhK6paDuJa1y+lKYGvBkcqmTKuBDIqkdwsd8+6wvXY7tf07YRH71UFSPVQbWMbSXIl
	nu+SyH6q2+H+q4Hg1Tu8KFF0st+hCetk8WReduB+21mreswoV7s0deMywIjpKaWsresr7qWhB4y
	bQudhOsC24DbyNa07HScfy9peKukFdQ4+9TL1FLiuaxcD/dir0ZrAy6H/NB011Gns8MxR8O/7BP
	gHRJu6SMt1aLlJU0ZFTjUqt+Sd
X-Received: by 2002:a17:903:234a:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2e2e4bb19e6mr28935535ad.35.1790832300217;
        Wed, 30 Sep 2026 22:25:00 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2e2e4bb19e6mr28935255ad.35.1790832299664;
        Wed, 30 Sep 2026 22:24:59 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:59 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Nutty Liu <nutty.liu@hotmail.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 12/14] perf tools: Add RISC-V trace PMU record capabilities
Date: Thu,  1 Oct 2026 10:52:23 +0530
Message-ID: <20261001052243.3042627-13-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abdeead cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=QyXUC8HyAAAA:8 a=NWcWjgigot-dzQyGZP4A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXza0usJMuulh0
 M+PKFAwkfBCF8JOGL6eHPN6wObBMYrxsU+xXvW9o5rEulmF2OuH6vckp4EWmK8Ad8X6HioqYluw
 xvLP0e1aduYiLuA4n8yIk1QSx0P8aCI=
X-Proofpoint-ORIG-GUID: vEByup63ZaVt_2M3hD50P9WX2itPJ_3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXyxkPJyA7z0n3
 DuT8fgCg0959M2jmmhyj8JZyBcOqUnvuy5OPoOKGuBZvu//4EMYXDsPgJDtId0J8HyRWvPrvfOA
 khSJ7SNfNNpe8JmgMeZWzRLDtGZQuPvwtI4Zt6egRVR6n05oCZnsa4QNn7cZIomOnI/Cee93NUV
 WxDqp5Gm9vIMJeUG1PAviJdzEGXU72AZUv02VR7H9Cp0Br6WL9+1qmxCMNslXp/XxlxpDQj0BHF
 j3bAO7+NpY5SUm/UtoECbMGieY6tkesbiM6lCYOxyG7R7VPUz0viaEUXYPafNeRAF3rTR3y0oLy
 A+5ahYB8mPZrEpdEfInj4dlOxFsIJBS93tJyh6GhKkVuUOV9oCWsdGIghnxDtMfBUfrT4rFgfiC
 mmkE9aRq2/uaYlZz4h+HAdGarCTX5LT/ivfVOdK7GjvR56yY03EjxUgXicRfuCbJtghzeAYDxPk
 woWTzahbPUcCCOUSV+A==
X-Proofpoint-GUID: vEByup63ZaVt_2M3hD50P9WX2itPJ_3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

Introduce the required auxiliary API functions allowing the perf core
to interact with gtrace perf driver. On RISC-V systems the gtrace
PMU uses the RISC-V E-Trace components and optionally an ATB Bridge
component for connecting to ARM-side sinks, if it is present on the SoC.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/perf/arch/riscv/util/Build      |   1 +
 tools/perf/arch/riscv/util/auxtrace.c | 221 ++++++++++++++++++++++++++
 tools/perf/util/auxtrace.c            |   1 +
 tools/perf/util/auxtrace.h            |   1 +
 tools/perf/util/gtrace.h              |  17 ++
 5 files changed, 241 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/gtrace.h

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 2328fb9a30a3..e07d5525ece6 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1 +1,2 @@
 perf-util-y += header.o
+perf-util-y += auxtrace.o
diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
new file mode 100644
index 000000000000..882632511d09
--- /dev/null
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Risc-V E-Trace support
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/log2.h>
+#include <linux/zalloc.h>
+#include <errno.h>
+#include <limits.h>
+#include <stdlib.h>
+#include <time.h>
+
+#include <internal/lib.h>
+#include "../../../util/auxtrace.h"
+#include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
+#include "../../../util/event.h"
+#include "../../../util/evlist.h"
+#include "../../../util/evsel.h"
+#include "../../../util/gtrace.h"
+#include "../../../util/parse-events.h"
+#include "../../../util/pmu.h"
+#include "../../../util/pmus.h"
+#include "../../../util/record.h"
+#include "../../../util/session.h"
+
+
+#define GTRACE_PMU_NAME	"gtrace"
+#define KiB(x)	((x) * 1024)
+#define MiB(x)	((x) * 1024 * 1024)
+
+struct rvtrace_recording {
+	struct auxtrace_record	itr;
+	struct perf_pmu *rvtrace_pmu;
+	struct evlist *evlist;
+};
+
+static size_t rvtrace_info_priv_size(struct auxtrace_record *itr __maybe_unused,
+				     struct evlist *evlist __maybe_unused)
+{
+	return GTRACE_AUXTRACE_PRIV_SIZE;
+}
+
+static int rvtrace_info_fill(struct auxtrace_record *itr,
+			     struct perf_session *session __maybe_unused,
+			     struct perf_record_auxtrace_info *auxtrace_info, size_t priv_size)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+
+	if (priv_size != GTRACE_AUXTRACE_PRIV_SIZE)
+		return -EINVAL;
+
+	auxtrace_info->type = PERF_AUXTRACE_GTRACE;
+	auxtrace_info->priv[0] = rvtrace_pmu->type;
+
+	return 0;
+}
+
+static int rvtrace_set_auxtrace_mmap_page(struct record_opts *opts)
+{
+	bool privileged = perf_event_paranoid_check(-1);
+
+	if (!opts->full_auxtrace)
+		return 0;
+
+	if (opts->full_auxtrace && !opts->auxtrace_mmap_pages) {
+		if (privileged) {
+			opts->auxtrace_mmap_pages = MiB(16) / page_size;
+		} else {
+			opts->auxtrace_mmap_pages = KiB(128) / page_size;
+			if (opts->mmap_pages == UINT_MAX)
+				opts->mmap_pages = KiB(256) / page_size;
+		}
+	}
+
+	/* Validate auxtrace_mmap_pages */
+	if (opts->auxtrace_mmap_pages) {
+		size_t sz = opts->auxtrace_mmap_pages * (size_t)page_size;
+		size_t min_sz = KiB(8);
+
+		if (sz < min_sz || !is_power_of_2(sz)) {
+			pr_err("Invalid mmap size : must be at least %zuKiB and a power of 2\n",
+			       min_sz / 1024);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int rvtrace_recording_options(struct auxtrace_record *itr, struct evlist *evlist,
+				     struct record_opts *opts)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+	struct evsel *evsel, *rvtrace_evsel = NULL;
+	struct evsel *tracking_evsel;
+	int err;
+
+	ptr->evlist = evlist;
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.attr.type == rvtrace_pmu->type) {
+			if (rvtrace_evsel) {
+				pr_err("There may be only one " GTRACE_PMU_NAME " event\n");
+				return -EINVAL;
+			}
+			evsel->core.attr.freq = 0;
+			evsel->core.attr.sample_period = 1;
+			evsel->needs_auxtrace_mmap = true;
+			rvtrace_evsel = evsel;
+			opts->full_auxtrace = true;
+		}
+	}
+
+	err = rvtrace_set_auxtrace_mmap_page(opts);
+	if (err)
+		return err;
+	/*
+	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
+	 * must come first.
+	 */
+	evlist__to_front(evlist, rvtrace_evsel);
+	evsel__set_sample_bit(rvtrace_evsel, TIME);
+
+	/* Add dummy event to keep tracking */
+	err = parse_event(evlist, "dummy:u");
+	if (err)
+		return err;
+
+	tracking_evsel = evlist__last(evlist);
+	evlist__set_tracking_event(evlist, tracking_evsel);
+
+	tracking_evsel->core.attr.freq = 0;
+	tracking_evsel->core.attr.sample_period = 1;
+	evsel__set_sample_bit(tracking_evsel, TIME);
+
+	return 0;
+}
+
+static u64 rvtrace_reference(struct auxtrace_record *itr __maybe_unused)
+{
+	return 0;
+}
+
+static void rvtrace_recording_free(struct auxtrace_record *itr)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+
+	free(ptr);
+}
+
+static struct auxtrace_record *rvtrace_recording_init(int *err, struct perf_pmu *rvtrace_pmu)
+{
+	struct rvtrace_recording *ptr;
+
+	if (!rvtrace_pmu) {
+		*err = -ENODEV;
+		return NULL;
+	}
+
+	ptr = zalloc(sizeof(*ptr));
+	if (!ptr) {
+		*err = -ENOMEM;
+		return NULL;
+	}
+
+	ptr->rvtrace_pmu = rvtrace_pmu;
+	ptr->itr.recording_options = rvtrace_recording_options;
+	ptr->itr.info_priv_size = rvtrace_info_priv_size;
+	ptr->itr.info_fill = rvtrace_info_fill;
+	ptr->itr.free = rvtrace_recording_free;
+	ptr->itr.reference = rvtrace_reference;
+	ptr->itr.read_finish = auxtrace_record__read_finish;
+	ptr->itr.alignment = 0;
+
+	*err = 0;
+	return &ptr->itr;
+}
+
+static struct perf_pmu *find_pmu_for_event(struct perf_pmu **pmus,
+					   int pmu_nr, struct evsel *evsel)
+{
+	int i;
+
+	if (!pmus)
+		return NULL;
+
+	for (i = 0; i < pmu_nr; i++) {
+		if (evsel->core.attr.type == pmus[i]->type)
+			return pmus[i];
+	}
+
+	return NULL;
+}
+
+struct auxtrace_record *auxtrace_record__init(struct evlist *evlist, int *err)
+{
+	struct perf_pmu	*rvtrace_pmu = NULL;
+	struct perf_pmu *found_pmu = NULL;
+	struct evsel *evsel;
+
+	if (!evlist)
+		return NULL;
+
+	rvtrace_pmu = perf_pmus__find(GTRACE_PMU_NAME);
+	evlist__for_each_entry(evlist, evsel) {
+		if (rvtrace_pmu && !found_pmu)
+			found_pmu = find_pmu_for_event(&rvtrace_pmu, 1, evsel);
+	}
+
+	if (found_pmu)
+		return rvtrace_recording_init(err, rvtrace_pmu);
+
+	*err = 0;
+	return NULL;
+}
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index aa749e1c3036..1ecdde597153 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1432,6 +1432,7 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 	case PERF_AUXTRACE_VPA_DTL:
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
+	case PERF_AUXTRACE_GTRACE:
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index 6947f3f284c0..42b1481ec894 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -46,6 +46,7 @@ enum auxtrace_type {
 	PERF_AUXTRACE_S390_CPUMSF,
 	PERF_AUXTRACE_HISI_PTT,
 	PERF_AUXTRACE_VPA_DTL,
+	PERF_AUXTRACE_GTRACE,
 };
 
 enum itrace_period_type {
diff --git a/tools/perf/util/gtrace.h b/tools/perf/util/gtrace.h
new file mode 100644
index 000000000000..343d2e9d4fa1
--- /dev/null
+++ b/tools/perf/util/gtrace.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#ifndef INCLUDE__UTIL_PERF_GTRACE_H__
+#define INCLUDE__UTIL_PERF_GTRACE_H__
+
+#include <linux/types.h>
+#include "util/event.h"
+
+struct perf_session;
+
+#define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
+
+#endif
+
-- 
2.43.0

