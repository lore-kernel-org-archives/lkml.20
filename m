Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A793447220
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185118; cv=none; b=hlrKDagINZT1Xyu8Wiejfa7X1esa24mK3z63Y/XOT+zyUpAGEcRpfz6BOU6FjrMWOcJPDVlSwUGeWmeYTEHpffGlAT4gGQpXBObp1QrnpZW9H/Rn3KRTxI4j5i0UDi5ZK4ivY9zSBmZ/Zm52mtDTFH7Y7EgqjiOIc4Wm1Na1wpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185118; c=relaxed/simple;
	bh=6v8UMEXHuka5k9rxoMuSILT2vaa5s7iMzgRF1vhX86w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L43p8Y6NF3c984gqtEDHvvzUlojtHl8fhYUzBFk5JzwradVlCSds3gp3+i6HhuwHJKOINnGNC9OAT0sRODE5wh4QrEnjy9d4UvZRIfU++nTVXUXJM7lN7fzj9bsPQw8TVxgcVGEBMtpptGCxoZ3tjvqPB9gQQoTkwdxGEuGtuZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=il7wfM23; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="il7wfM23"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9EE61516;
	Fri, 16 Oct 2026 14:11:52 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6604E3F673;
	Fri, 16 Oct 2026 14:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185115; bh=6v8UMEXHuka5k9rxoMuSILT2vaa5s7iMzgRF1vhX86w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=il7wfM23w5c+hwRVNzHkkh2L4ZOSKqeTX9E1kGbPsWNs5foeh+ffWtaABS2Sodn/R
	 C8z4bE+oRk6AUZFApFUaNDrmk/quQLsvUjZRnicPd4F9Bln+z3VNo1gAFBPDTpRA2i
	 fPbKuYB2gAxyfgIBP1XPpIfnkWlcy6AYDi/glGTQ=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:39 +0100
Subject: [PATCH v2 01/11] coresight: trbe: Remove misleading comment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-1-383ac26382fa@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=1975;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=6v8UMEXHuka5k9rxoMuSILT2vaa5s7iMzgRF1vhX86w=;
 b=9/hrQ62uFYqwBiE1FyM9+/w9e5H55spZ6D9uPOiLBrqtBwsWarl/MM74ekbObXSN5qtcJd0Cf
 vhUyKNjV0V5AKz2gZN5+57EJsZch1d0NPGrr7DJcEJieajUS53k79Th
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Since the rounded-up wakeup address is always higher than the head, the
limit cannot be less than the head caused by wakeup capping.

The described scenario is never valid caused by wakeup capping, remove
the comment to avoid confusion.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 29a1882b1f3c2eb7166f71eeef37badece67039c..ada4794c51f3eb9142cd62f4209affe308142d1b 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -505,10 +505,10 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 		limit = min(limit, round_up(wakeup, PAGE_SIZE));
 
 	/*
-	 * There are two situation when this can happen i.e limit is before
+	 * There is a situation when this can happen i.e limit is before
 	 * the head and hence TRBE cannot be configured.
 	 *
-	 * 1) head < tail (aligned down with PAGE_SIZE) and also they are both
+	 * head < tail (aligned down with PAGE_SIZE) and also they are both
 	 * within the same PAGE size range.
 	 *
 	 *			PAGE_SIZE
@@ -519,18 +519,6 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	 * |$$$$$$$$$$$$$$$$$$$|========|$$$$$$$|
 	 * +------------|------|--------|-------+
 	 * trbe_base				trbe_base + nr_pages
-	 *
-	 * 2) head < wakeup (aligned up with PAGE_SIZE) < tail and also both
-	 * head and wakeup are within same PAGE size range.
-	 *
-	 *		PAGE_SIZE
-	 *	|----------------------|
-	 *
-	 *	limit	head	wakeup  tail
-	 * +----|------|-------|--------|-------+
-	 * |$$$$$$$$$$$|=======|========|$$$$$$$|
-	 * +----|------|-------|--------|-------+
-	 * trbe_base				trbe_base + nr_pages
 	 */
 	if (limit > head)
 		return limit;

-- 
2.34.1

