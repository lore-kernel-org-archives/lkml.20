Received: from va-2-115.ptr.blmpb.com (va-2-115.ptr.blmpb.com [209.127.231.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE04231839
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791179911; cv=none; b=Cxe0tYk3ODATNO8k5WPY7H/qNEw28g1OC/xLun+WFayw1bMZBxWvNb10N8oXC6nusNlrzb+NXym8Q9sO46dG0K3mSgTCDrCi8XREKgiJQynJSKw/5J/sFBrAnytFEz+uFyWghDB7Vr742GWRTi5gpK9Xlrty58fw5pgcI4O2n+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791179911; c=relaxed/simple;
	bh=g9acjeh/xobT0kH6b3VbQoeGTCIvxpYsQ+Uf7nyS3jY=;
	h=Content-Type:Subject:In-Reply-To:References:To:Cc:Date:Message-Id:
	 From:Mime-Version; b=IDpytFSAu7Kjq9Z/EkabUDel2P3d5JBb+T4QHkRbCEehEhfY8HlYm5tAdZDdW23278XX0dUKomxyWuF09YDzuVuuhLcN5y4HLxYVDr5AstRYsOpCCWJMbmb/7J9JXLD7iiWfF31lpcFlSm6BAKB8amfxY6WoiN7msfqhAJEliWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aXwQe5oY; arc=none smtp.client-ip=209.127.231.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aXwQe5oY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791179898; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=s2krXa20oloEYjrGVQhwJuZNjRCQJbPdEr+UoWVuJTs=;
 b=aXwQe5oYU7Od4PFPX/525fsrIY+AiF7IOo8A98LV0/UDt75/basvtS/yEPTKnKU6qxsGSd
 GCIH7p2GwqKP7HbYAwNN43OqwLHNENPpjAMmz6fkN+iBKNyN8Ldibxf8PuExoMg3mbP6fJ
 4vvCACLJWrZzTE5Dx0HTg2oTYBeEFrASjBskvrvABpaFSy2dGI0mGTwl0p2NUoSMcadACT
 fPLsavIv3+9xN1TND00mKzonrjPxONuqIxOudO7rsW+xmtPe/9hxloxT6Lorgzveou+xmh
 8v4hMoJ9tt/RYhDM5X5arBUAI3go6QCk4z6AIrJF8qg1sZ5OiNNm7wojNk9HRg==
X-Lms-Return-Path: <lba+26ac33c78+f6b5b7+vger.kernel.org+zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v2 3/5] x86/mm: Extract the TLB range flush threshold check
In-Reply-To: <cover.1791179421.git.zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
References: <cover.1791179421.git.zhouchuyi@bytedance.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Mon,  5 Oct 2026 13:57:12 +0800
Message-Id: <94658de1ddd0cbde299ab115ce90b5f5c60aa303.1791179421.git.zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.20.1

The decision to replace a range flush with a full flush is embedded in
init_flush_tlb_info(). Both mm and kernel flushes use this policy, but
the kernel path only needs the range and the decision, without the
mm-specific descriptor initialization.

Extract the threshold predicate into tlb_range_exceeds_ceiling()
and use it in init_flush_tlb_info(). Preserve the unsigned range
arithmetic, right-shift rounding and strict greater-than comparison.
Descriptor initialization and both flush paths remain unchanged.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 arch/x86/mm/tlb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 5a1b96c61050..0d03011c6825 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1373,6 +1373,12 @@ void flush_tlb_multi(const struct cpumask *cpumask,
  */
 unsigned long tlb_single_page_flush_ceiling __read_mostly = 33;
 
+static bool tlb_range_exceeds_ceiling(unsigned long start, unsigned long end,
+				      unsigned int stride_shift)
+{
+	return ((end - start) >> stride_shift) > tlb_single_page_flush_ceiling;
+}
+
 static void init_flush_tlb_info(struct flush_tlb_info *info,
 				struct mm_struct *mm,
 				unsigned long start, unsigned long end,
@@ -1383,7 +1389,7 @@ static void init_flush_tlb_info(struct flush_tlb_info *info,
 	 * If the number of flushes is so large that a full flush
 	 * would be faster, do a full flush.
 	 */
-	if ((end - start) >> stride_shift > tlb_single_page_flush_ceiling) {
+	if (tlb_range_exceeds_ceiling(start, end, stride_shift)) {
 		start	= 0;
 		end	= TLB_FLUSH_ALL;
 	}
-- 
2.20.1
