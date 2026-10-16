Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C40456E0B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185122; cv=none; b=ssILr5kDX+xfYnh9uowUH6sV4NqJ5Cqezuuf0rTZ+6II0FF9BKAN170qFpYBcvRYgZxQ00HymPwfgCwjD3b5gKGpk0UGA+JZAGxYh+arFnS4cuVg7b5hz1uiAOgQeLisJoxcPfhSgOGWaKiQdwJjxTONxbA2k5Geubofr6DqmK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185122; c=relaxed/simple;
	bh=ExQeQe5rMEnrrEzFDBhCn/rhnjJ0LyHdeLTBAPO2zxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aIZ6RPao7pcsVueu4K1yQE4V6u2Ri69qc5zuVw74rBXRkn9XhFuwmKlo2HE2xk8+weFW4Nhr7CfUMPJBvugT/11jhm8VlG8yU4RJSlsTgHXxBez5JNCRQDwFPWvVFeI6Om14RqirAy6ilYn5IN4zGrXSR26K4I59t7a4/6KgpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=K23x+65G; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="K23x+65G"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55D8A16F3;
	Fri, 16 Oct 2026 14:11:56 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1520A3F673;
	Fri, 16 Oct 2026 14:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185119; bh=ExQeQe5rMEnrrEzFDBhCn/rhnjJ0LyHdeLTBAPO2zxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K23x+65G0j7SYJ9UWUslMt3VfinswDnOd3jQhLtgP2fZjhcUge/4zTNdpb6Pvsabm
	 EMVdN7IK7/MHA5aISNNj44bAqW0q+4FzSiS23X9gHmn4s8m/iVTAG1Pn3TN66qzDao
	 vakNb1KWLduL+nXJ6li4H3Z9fjWUzwL2WNUo7PDc=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:41 +0100
Subject: [PATCH v2 03/11] coresight: trbe: Track trigger count support per
 CPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-3-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=2244;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ExQeQe5rMEnrrEzFDBhCn/rhnjJ0LyHdeLTBAPO2zxQ=;
 b=QQ3StaQhOPPUgEas3xo7KGhtyzKPwXWHnHZHABdoKGB5QO7p5ivdXv9LJVnmCDrQiDQvGDfsF
 0TOsYtkYCDUC8I5PXqlpTUgCeIB7h3BV9PSbPoCfYpfhZZjtY7R0fI6
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Some TRBE errata are not compatible with using trigger count mode. In
particular, CPUs affected by the overwrite-in-fill-mode or out-of-range
workarounds must continue to use the existing fill-mode handling.

Record whether trigger count mode is supported in each CPU's probe.
This prepares the enable path to avoid programming TRBTRG_EL1 on
affected CPUs.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 09ed9bcf4a70479169094697dcc3d445629cfaae..92cd9c28cb4f6d9da7d41aa9eeedf4295a810006 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -140,6 +140,7 @@ struct trbe_save_state {
  * @trbe_align		- Software alignment used for the TRBPTR_EL1.
  * @cpu			- CPU this TRBE belongs to.
  * @mode		- Mode of current operation. (perf/disabled)
+ * @trig_is_supported	- Trigger count support flag.
  * @buf			- Buffer configuration retained for the enabled session.
  * @handle		- Perf output handle from successful enable until disable.
  * @drvdata		- TRBE specific drvdata
@@ -151,6 +152,7 @@ struct trbe_cpudata {
 	u64 trbe_align;
 	int cpu;
 	enum cs_mode mode;
+	bool trig_is_supported;
 	struct trbe_buf *buf;
 	struct perf_output_handle *handle;
 	struct trbe_drvdata *drvdata;
@@ -222,6 +224,15 @@ static bool trbe_is_broken(struct trbe_cpudata *cpudata)
 	return trbe_has_erratum(cpudata, TRBE_IS_BROKEN);
 }
 
+static bool trbe_trigger_count_supported(struct trbe_cpudata *cpudata)
+{
+	if (trbe_may_overwrite_in_fill_mode(cpudata) ||
+	    trbe_may_write_out_of_range(cpudata))
+		return false;
+
+	return true;
+}
+
 static int trbe_alloc_node(struct perf_event *event)
 {
 	if (event->cpu == -1)
@@ -1609,6 +1620,7 @@ static void arm_trbe_probe_cpu(void *info)
 	else
 		cpudata->trbe_align = cpudata->trbe_hw_align;
 
+	cpudata->trig_is_supported = trbe_trigger_count_supported(cpudata);
 	cpudata->trbe_flag = get_trbe_flag_update(trbidr);
 	cpudata->cpu = cpu;
 	cpudata->drvdata = drvdata;

-- 
2.34.1

