Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725380;
	b=lFJZfgx+AXBBSLIe6i+iab6wU2F0GX1gqbTh1Ncs4pArLFhVRDd28sRriwz1qXWjoRNc
	 SeCFAjAxAbCGs2Shzo2Qd/6hGi77p3OeLbsqcyWy7cekTB+0dEAxd7xybxAcljqPFjNjt
	 9/OdwFpoRETrkXvyOE0DEzruGCblF2ZFt91wupdZ8Xh9aNcc/j8alATBAxJ7Sl57e4A9b
	 eS87E2FU8GxnxUi0dtPC2t0Ujjx42PnlfYD45gKmGuivYJfOy7c2fkAxLiWQZUMcKMExS
	 HRDNMuyiwZVmVZH/3CGaQzqgfmJpFFI6XYxb/ZaHD6be27A04OZwgq1P3Sia5BNXRBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725380;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=1lKL4WwRnDOqfNfYSGU9cmx6yk/pVYFWkgr7HmIHhnw=;
	b=vy/e+hqGDPQmDhOSGmy7GvQeSTwiTZJwfPzqwTrQDNOndsfIJlwA0GBAwFWIHmUtDpo2
	 ChRi+WudamLCK2EeDXwsq0EuioitQbNVq2vU0eVe4Tf8OmgvbKExPcaw9nvRo4NrdH+KY
	 AB/hY3Sc8uWZD/pcSsHpdQV+L3aoNiqmslph9Exr2aAeaj2ocxuCEuuohdCJUT3boPVGf
	 yPmJUlzyzhV2u7sqAnHSBnKQtq1sfJY0yumEW1FTmwiBFtlIe4gzmGJyKxH/FHlS0vxAN
	 UMVj+z7dJKYumYXHbx5U/ZEJ3hgbnsBSFZ/SX4E1L8IRBSwQ8APvXMQ9CzoQIW9Ut6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=GZDnLFY3;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F222C606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F222C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=GZDnLFY3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725335;
	bh=1lKL4WwRnDOqfNfYSGU9cmx6yk/pVYFWkgr7HmIHhnw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=GZDnLFY3XUwuVaAEPgG9TuFrDk4fetBziIWppgKllKy8Ey7okyyuqa0Y5N4pKyZKn
	 DQKDrcyUhfEEyNAq5tpOMMPcUMoPzgTz5LbrXNaaWzOigkB5eFEc37k289+jpiluLV
	 QXncMU94wAga8ehISZpm9bVNqVVCMjcLmb3xFlRU=
X-QQ-mid: esmtpsz11t1792725329t9f807f66
X-QQ-Originating-IP: t/ie3yyWrwAf9jrS8pPLtnApkqn64E5F59vTX0WOT1Q=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5328409807779775751
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
Subject: [PATCH 05/24] gtrace: Introduce some PMU format attributes
Date: Fri, 23 Oct 2026 11:14:46 +0800
Message-Id: <20261023031505.2020925-6-liangzhen@linux.spacemit.com>
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
X-QQ-XMAILINFO: NELwyfGakffP8fr5nYpnUWJxLojO7HtyipzXUaPYlxfTKOit4mVsgbGi
	HGrRN8XIW9YjuS1vLU33iZlU31peJ+LQK8KhspItfxLDfKRMusVIUj/Ro9oJxEOjUS8rtDE
	t8uR8v09pmU5eEq2kq7aNs79gzLKYz4JJ6g7z9yWPW2f2Bbig/ckbm/zEj06ow+FCysP1ow
	3VLwuzmnFQtWSoKa6cba+jRKbtPBBswTy/qxSxCiYh40CCq1jSEw5Siiy5TRCCKcS6mKBMv
	aJvkE7EzNO6F7RhP8TynYP0Pn7uwI7rTdoZSevAL6b7Nz8PqRSMJm963z2Clms6ox0lIx7A
	ZcPWiS7FEm3eh074hB1ENjUEG7XgiULBr3q63mVwIWbYYpmcoK4TTGuqID4EKWAWI2lA9JI
	uO1guKoo9pimOcnOHq+qQPMpJ9QR6JIU1viCzc4MSCIAzapDbmm38U7wtJmWqpqV4cCgAsi
	VE/BQ723qAh/HtVyyUHX6SZpdjXlQHZS20b7jhHHxpHIsb9bbgt5J9MNZ6NFzwxL+NdKjh2
	5wMDVQaESyvlXTLJaztccfX6fpZTYzoUDoxR2UKKB/O3ms8mXqkgG7+kXsYgue0ROquoTdz
	v8Pt+EKMat13vJq2f50uR7qRB2YCFfFgQO5R1DJQUXnGzbHxfkw6Xjd8JIR8vSUUJ3KHI8X
	t5eAbc8+70jkBsSCrM5laKp7Lhk9L4wTaTC50XBb4nifDJQr96ntkfb6/y7LWnRp97pUygo
	lq0cKZVtfxdk0i+J0RGlPG0GTVLTkuAkIa1AeRVl9kb0SOAYHsmlG9l6QLKXMaOobJcJJgp
	xiZo9IgKduPlxDaPn4OnFUW5Ce/3yPLXVu8vS1cE1B1HFH1E9Peo2o/I4TaxZBsjMUaXWBE
	morCt5uSnoJDEwRowz3a1le920lCXcPOsEEXSi12bpIZUGvwYWw5rAWxeL3ToUXplFGAOVu
	7YJ2kryxGU/TZTqjHHLiFSuTOzQOrgIM3iGehacZmSSDjUfY5Y3o0zLt1AFjxQYDoPZnTPI
	Od89KEp1/JU6xzBzazSvAGxb+MBrOQaf+s8LtxFJmfHosxDaizJfEmIxFyibwqL39B+xnsw
	uEWEL9lLqSKThO7e291sbU=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Add new PMU format attributes to support timestamp, context, and
synchronization controls. This allows userspace tools like perf to
pass detailed hardware configurations down to the gtrace framework.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-perf.c | 12 ++++++++++++
 include/linux/gtrace.h                 |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 56713c8ee850..703c12b95665 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -323,9 +323,21 @@ static void gtrace_event_del(struct perf_event *event, int mode)
 }
 
 PMU_FORMAT_ATTR(event, "config:0-0");
+PMU_FORMAT_ATTR(context, "config:1-1");
+PMU_FORMAT_ATTR(syncmode, "config:2-3");
+PMU_FORMAT_ATTR(syncmax, "config:4-7");
+PMU_FORMAT_ATTR(timestamp, "config:8-8");
+PMU_FORMAT_ATTR(tsmode, "config:9-11");
+PMU_FORMAT_ATTR(tsprescale, "config:12-13");
 
 static struct attribute *gtrace_pmu_formats_attr[] = {
 	&format_attr_event.attr,
+	&format_attr_context.attr,
+	&format_attr_syncmode.attr,
+	&format_attr_syncmax.attr,
+	&format_attr_timestamp.attr,
+	&format_attr_tsmode.attr,
+	&format_attr_tsprescale.attr,
 	NULL,
 };
 
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 0a017f1f888d..76b1aa9cfe79 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -14,6 +14,13 @@
 #include <linux/property.h>
 #include <linux/types.h>
 
+#define GTRACE_PMU_ATTR_CFG_CONTEXT_SHIFT	1
+#define GTRACE_PMU_ATTR_CFG_SYNCMODE_MASK	GENMASK(3, 2)
+#define GTRACE_PMU_ATTR_CFG_SYNCMAX_MASK	GENMASK(7, 4)
+#define GTRACE_PMU_ATTR_CFG_TIMESTAMP_SHIFT	8
+#define GTRACE_PMU_ATTR_CFG_TSMODE_MASK		GENMASK(11, 9)
+#define GTRACE_PMU_ATTR_CFG_TSPRESCALE_MASK	GENMASK(13, 12)
+
 extern struct mutex gtrace_mutex;
 
 /*
-- 
2.34.1

