Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.154.54.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725509;
	b=3WRJmo+afp7J4Q5IiY30Valcd2u6z01p/yC9vtkFQGEzyt4jh/qm3Ohj7C7fJqFkgP/o
	 CditBcsSBEaxFO9l0PZvBR1T6vaQzu7ObDUBzNR+z870/wqUldv4MkZsYz5E/ZabPir2v
	 6jqJPjAjzNfVYUnXMU0Iqp+pVoxQNAlQfPaUUPz7h6BL+WmvzSrgRsDH9r1K95rukz4zD
	 PXAgPFdJRSO5gb3VQMfO7Q4EnMj57/MuZ1XsoLTKId6huePzKP5o69ehiO0rXhM7XnZkS
	 BGxif6RZGWdyzTemMAiGNsbKJKv1CFcdB7090jHce5NblMfIZNBecKonvDPOXPBTz8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725509;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-SPAM:X-QQ-RECHKSPAM;
	bh=+WBQ3KUrxVlusen205hCCYNtLvRYypDOARxrViWC5DQ=;
	b=kYqpcLxJXg5cwAwCI6UwouipvvHmOXnQnEOnFAUxSqOlN5+yGrP3Pkrrc1M1qursEflC
	 dD33mOu4xqZ4AxjHzHvlIKQZF01d0pNLLImydaFNWnZkX+ecVYCu9nNx2CZaXKk1gug/u
	 Btwk3dR8SqMVrzIyS3BCSe1y3ENRj2fLrFEo+AZ9eqUfkoYgdjDgs3WRBa3XcDOgE9ts5
	 gzXFUcoJly/m/nFbYyHXMmcnwxLtPjuRDzVb8gP2xShoUU/Wj/55tRviIzCc077XLELua
	 2dx80OsR0RhtkPNNwc5+PNjFrsel4Nd6hDLfvWXNsWEIvII5XCrvSFes0vAP/n6+enw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=d8oBdGKt;
	arc=none smtp.remote-ip=43.154.54.12
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A543606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A543606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=d8oBdGKt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725393;
	bh=+WBQ3KUrxVlusen205hCCYNtLvRYypDOARxrViWC5DQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=d8oBdGKtmiMnZHxUM5wFQrLvP23inNM1263LR9g87qEsA1Mtz9j248eFA312xWHFL
	 3sZ8dnahcdRKxDt04COTnyNtFSXjLLCRLPESzqKfLjieFBBqdvfYKaqsphOAJk7xv1
	 sPzrkvV+O78BTD2iw+laaLBzyUo4OZB5O9Aol3FA=
X-QQ-mid: esmtpsz11t1792725389ta2bde7c4
X-QQ-Originating-IP: 46XquNWinBTzsa8GMzaLVwRLdipfJiqT94mCzdvABSc=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3631083015316415151
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/24] perf tools: riscv: making gtrace PMU listable
Date: Fri, 23 Oct 2026 11:15:02 +0800
Message-Id: <20261023031505.2020925-22-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MXNnc0XUtjsrYwJSL7AFMyOfgp/OFf1V3HU3uAgUiqG8/H87fbVLJWpO
	BjKDlhDW8QRdCDnSlL0QHaAxN6sy+Tb/Yit87uEDV/hSa9fXsbCkooyqseOE3/HBYG2Tkl3
	mLMAn6k+aAC6sxUtuWPC2SOD7eiD+3MmYms1eaSkJFlcSWJtQijc2lzPsIFmOiTUVVsHw5c
	ryWoAQtAsnrHTD5yhbMEoc5V3gnIg7dhc8bbjJHqZi+/BuXss+ftAUk3Oc8R1gPTJ1Fmbtb
	2ij111HUPT8OSdiOJPfpb8i/G0Tqyf8M0wHfhbB67N4e7PwlemjndCV9rpUuzg5nDWq2z4n
	9nkrJ08HnjLkC7cxaj/wpvxl/jPGxVGsLL9qUEliyt5S3mxqf0n8AaIEMpaRwViPBi+ZMXS
	o6Q6/zxlOznHWZ41QmrguiyTt/Czm7uyNXsNSYPAVoxjsiC9irWsCpTyxMqSXEyr4jBOCS8
	bIw/TWUXcaMzOkZzIcQAqokkBxYJiMzX7RMrPGyZLr7wBqMQAYD2/7UXButEo3FrS77Bf4C
	j7znzM2J0fQZS1t6aMGr/te2tbtY+PctCg+d6KRfYRBcU9S5WihyhHAExJrF6rJClUZ26zx
	v5D/UgEvWh/0JPWkhMcP1eX6le3AoqyM0hragPVTKLZjsdaBGJTNcZlS/+5Zm6Gq0qval/i
	WPeX4q20EyoKoNMSmt5zJoF1rB85VtvFN0PayGrV5WUVVjGzg3txaqkPxiOXa3zyduHdh9z
	dVOF3hXIRUpW3dX7/u8JVi8OiLH4ddAutzz/77nR9davcR9rCgovsLduLAd/ZjPqk+oqDmS
	9TTdSpQLBcQ8C+LKSCx9FDmeXQIGUznD+EB7MIku4DTECYnzAgpFCObM5E6RNZ8nP0FTckS
	BKVhAQmeBOofxuE/21jmLPHzFhpUWObsrkvs5K/MA7emxW2L3vwXBuTHpJBbTlhhcIiLyA1
	9rV646b6eOJbyuAZ/YlhQV/QAxi23ovoqykcQW9W7pYKZjV35chYnIl1J787m0IHrPsHqtP
	p8UjYE+j8dwFKqq3PdqW3xNdaN4C/Rafw2I7a/Jtt8ry8ZwCHiKH0y4plWLb/aUAI4cAphS
	yo3OEJAH2JMvij6zcQxwK9qFd1+kRN/8SxIBvHpOS1yPUTlhMXwY44Xec/PDKOUdg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3

This commit enhances the RISC-V performance tools by allowing the
gtrace PMU to be listed and selected.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 tools/perf/arch/riscv/util/Build |  1 +
 tools/perf/arch/riscv/util/pmu.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/pmu.c

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index e07d5525ece6..57991c43e8f0 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1,2 +1,3 @@
 perf-util-y += header.o
 perf-util-y += auxtrace.o
+perf-util-y += pmu.o
diff --git a/tools/perf/arch/riscv/util/pmu.c b/tools/perf/arch/riscv/util/pmu.c
new file mode 100644
index 000000000000..8cb8c82182ac
--- /dev/null
+++ b/tools/perf/arch/riscv/util/pmu.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <string.h>
+#include <linux/perf_event.h>
+
+#include "../../../util/pmu.h"
+
+#define GTRACE_PMU_NAME "gtrace"
+
+void perf_pmu__arch_init(struct perf_pmu *pmu)
+{
+	if (!strcmp(pmu->name, GTRACE_PMU_NAME)) {
+		pmu->auxtrace = true;
+		pmu->selectable = true;
+	}
+}
-- 
2.34.1

