Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96415349CD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169725; cv=none; b=nmxDY3Q2nvVnw4e7zpWPxxRoLqHalI3N0qNipN1fhqyPjkpXTJSCQjkwJPqK6AT67kNGsn27/54Bq3Kj2jcyluRJKvWOcBTSkwzW8iBT/teawoXAB2V5ttzx5Xbt4dGby7d3yahdwZqkiP3lq1AtW4djgExShfL4rtDGzonX9u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169725; c=relaxed/simple;
	bh=BQnVzx45dLwktCWppCQITl2/9OmBRkvh1ThhzFT93O0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8IYJ3CZBvkHd53tzRNWvb4zXzY8YzW0e/i6oIIhLdXSC28y5cwIA9AOFCz4nTeuCFcrl5nmBzXFdlEg8nH1bZzk/heYrEGKQWcrhugdHUCwCB0xSSADoI/bXPZVN9W9rkU0nEUIdJVtrF8TmBF6GhXzp9l3trRclcj41pUvUQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MN7Yxs8+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MN7Yxs8+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14E9D1477;
	Fri, 16 Oct 2026 09:55:16 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C40933F7B4;
	Fri, 16 Oct 2026 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169719; bh=BQnVzx45dLwktCWppCQITl2/9OmBRkvh1ThhzFT93O0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MN7Yxs8+MvNwV9LH6ztqB5TqK2dPaw/993Q+acsgtKYMlIy6qusDbZ6iIBYGgPlm9
	 8xUZTdPdKfXLY1DMnyqCIl1lS0uO/0VKRmrS1SoBayZyXiyzy+xoiPAiNCWN/584UC
	 KLMVciWr8Dt9EgMisZ2bISkv1C8A7Urd5CimOqXk=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:02 +0100
Subject: [PATCH v2 04/23] coresight: trbe: Check the buffer association
 before IRQ validation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1534;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BQnVzx45dLwktCWppCQITl2/9OmBRkvh1ThhzFT93O0=;
 b=59eZUh7H+BmqdJco1rMWNKh0LUP5VH2FLq6f5rtq0E0JBoPE/c0V86QEeHBOek+EzKXMuuj7k
 VtsCXQUuembDslgdY4xavgJybWW1ABVOF6DA//LMWklaD2HVXHjMkv0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

is_perf_trbe() obtains the sink buffer from the output handle and
dereferences buf->cpudata before validating either pointer. A live AUX
transaction does not guarantee that the selected buffer has a CPU
association.

Reject a missing buffer or CPU association before reading CPU driver
data or checking the hardware buffer addresses. Treat these configurations
as an invalid perf TRBE session.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8ec0b4c4987f25d10ee0b2f80c27e10f76357387..91fbdbad3676ffae399df0b4d4ddcd603a40e86c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1111,10 +1111,16 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
 static bool is_perf_trbe(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
-	struct trbe_cpudata *cpudata = buf->cpudata;
-	struct trbe_drvdata *drvdata = cpudata->drvdata;
+	struct trbe_cpudata *cpudata;
+	struct trbe_drvdata *drvdata;
 	int cpu = smp_processor_id();
 
+	if (!buf || !buf->cpudata)
+		return false;
+
+	cpudata = buf->cpudata;
+	drvdata = cpudata->drvdata;
+
 	WARN_ON(buf->trbe_hw_base != get_trbe_base_pointer());
 	WARN_ON(buf->trbe_limit != get_trbe_limit_pointer());
 

-- 
2.34.1

