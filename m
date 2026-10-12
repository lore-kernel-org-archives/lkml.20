Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2880937F31C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776573; cv=none; b=bbs2QxaBaQWCVKfbuyxWqJ6EsFnVTzUlI6icFnh2TdjDtuh7/4Rljqt/gytdlLwQ4AqAy6EsKZZRA3xkPsgtWoOTjtGh6fPWZcudi4OKsZtiRYastoe7TPSBR5gPlZEtlChKztvmNRlNTXzoV9r1AZ4Sb18Q0c/q9IznNGkfMXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776573; c=relaxed/simple;
	bh=fiY7AndvzPzxFsWibR0n1DXPfBUqVHVp/0QX3wThhI0=;
	h=To:Mime-Version:Message-Id:Cc:From:In-Reply-To:Content-Type:
	 Subject:Date:References; b=JZuVX3zV9TdLSE/4PAKoYyAf96fVY8oqLmsVOsQ9iMdRc8kZMi3+kxmaHXFgVvCWgL2vK9pt/sCABrch75YFPCjIvCFEz8RwwYLvGKJemG+1F8PlmhdcP3I38grXeUFEZSr1mCMsdnzlGd4d+OQfod83gweG1a3W6afaAYeGFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FtcjAf27; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FtcjAf27"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791776560; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=alFBhqZPa4XHbqyEs6HOJPk7g9WY2BEpyJpOxkWFNf0=;
 b=FtcjAf27xdlA4nYiq2qU1MRCQ+Ruc1WAC2iZAE/bHjbfmjwbZGQ2C1AAhgpo15zmmJu2wc
 jP0f7oolNQJoH6KkOeecIENlWlLF/dme1x4mkDcmCBefxqRXyLIEYYiyvradACdIsJA5OU
 XO6x936QJhFGvK9dsuhF425jpDk4ICyOVofzFYIBnjc3aL5pFetpWd8J46g/6ldyhAIbDe
 Luu874ZLrrKv25ctb6sApYNkfRCVZb7K7tiZ28tmuvETBYmXEWfhwWE3f0dhKfPo5T+mHE
 SMkM/NWhFa5Qwg3U6jxW5HpMjxyZH5teYQkg//ymFgxUYMxsiDTLlIPU4mArmA==
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-Id: <de25dfbadc285425aced1103b32456afdc2240ea.1791443164.git.zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 7bit
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
In-Reply-To: <cover.1791443164.git.zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v3 2/5] x86/mm: Share the full TLB flush dispatch
Date: Mon, 12 Oct 2026 11:41:22 +0800
X-Lms-Return-Path: <lba+26acc572e+04d559+vger.kernel.org+zhouchuyi@bytedance.com>
References: <cover.1791443164.git.zhouchuyi@bytedance.com>

flush_tlb_all() and kernel_tlb_flush_all() select the same INVLPGB or
IPI backend and account for the same sender-side event. Keeping two
implementations duplicates the backend selection and accounting.

Use flush_tlb_all() for kernel ranges promoted to a full flush and
remove kernel_tlb_flush_all(). Share the existing backend dispatch and
event accounting so each request is counted once.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 arch/x86/mm/tlb.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index da7c408f921c..5a1b96c61050 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1486,16 +1486,6 @@ static void do_kernel_range_flush(void *info)
 		flush_tlb_one_kernel(addr);
 }
 
-static void kernel_tlb_flush_all(struct flush_tlb_info *info)
-{
-	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
-
-	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
-		invlpgb_flush_all();
-	else
-		on_each_cpu(do_flush_tlb_all, NULL, 1);
-}
-
 static void kernel_tlb_flush_range(struct flush_tlb_info *info)
 {
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
@@ -1515,7 +1505,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 			    TLB_GENERATION_INVALID);
 
 	if (info.end == TLB_FLUSH_ALL)
-		kernel_tlb_flush_all(&info);
+		flush_tlb_all();
 	else
 		kernel_tlb_flush_range(&info);
 }
