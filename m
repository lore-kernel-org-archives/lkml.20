Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729285326BA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169718; cv=none; b=iW0vQrrPmylvFy5MswHuEkFsgvsTfzxMzNt7/e0HZSLEV6Nkc/DGSXqjwMbsA9vxNn+UvY7/pQdY12OBWsMnX+JI0dAzkrdjDfSI8+JTvFDijrbWJkXuhqyGxXjT00ZsFZDVwZ46phJih/XyZwH5QVFM2U6lrpCdrn8sH3Cj4+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169718; c=relaxed/simple;
	bh=9Vg1KwTsPnGP0rd+0YO3fvy/Cq8edx+YmEonMySYO+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P27zbB2i437a5z98W7HDuFVr4z2ctJjTu0QEj7AYrZjTxaJL6+nfSIJWAKpzvztBgB4+Uc/S9AtREYwLwBCQVV5CMhatQDZpUdPp7aZSZcUit9JqbLKk5Q2XwjN9sSRXW9XKVzqS/q87R6J6sRt0SIlHScfCUt2iVq+RLSPGX20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EgI7HuLZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EgI7HuLZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6784B1691;
	Fri, 16 Oct 2026 09:55:12 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2017D3F7B4;
	Fri, 16 Oct 2026 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169715; bh=9Vg1KwTsPnGP0rd+0YO3fvy/Cq8edx+YmEonMySYO+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EgI7HuLZsApO3MM+ecCNknPLh3fTuUxWvXtIM5632PMu3WaATDGrN3B+V6xTs4rmE
	 6aqo7qsv8R66caTjDSxpyu34cz3zCj7Jf+h7WYgCcNGfKw/l0yHchMSlxmYjHZ202o
	 zH+eKlzy9cH96ysyjq8m72T5yQK1kZEabAp2PoZg=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:00 +0100
Subject: [PATCH v2 02/23] coresight: trbe: Make watermark range check
 overflow safe in __trbe_normal_offset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1341;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9Vg1KwTsPnGP0rd+0YO3fvy/Cq8edx+YmEonMySYO+s=;
 b=MZyhAr29SMEIn2620PIxOjTVLznCFoBunZS90a3WNKuIUkGrCJXlnqPQc4rh+6xwwme9Tir1M
 u7ESq1hhX3VA/7RpczwEgM1o3WF/tuEvnJijQUO6mB1+Fum+YlGPtPT
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The current code checks whether the wakeup point lies before the current
tail by comparing against handle->head + handle->size. That addition can
overflow when the monotonically increasing perf AUX head is close to
ULONG_MAX, causing a valid wakeup point in the current writable range to
be missed.

Use unsigned subtraction to compare the distance from head to wakeup
against the buffer size instead. This keeps the check correct across
potential wrap.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index eca8e13a97447b46a4b383049aacb3fa7ad3c329..02d12445763a86d58c79bdf5143f761827456bc3 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -526,7 +526,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	 * +----|---------------|-------|-------+
 	 * trbe_base		limit		trbe_base + nr_pages
 	 */
-	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup)
+	if ((handle->wakeup - handle->head) < handle->size && head <= wakeup)
 		limit = min(limit, round_up(wakeup, PAGE_SIZE));
 
 	/*

-- 
2.34.1

