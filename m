Received: from va-2-112.ptr.blmpb.com (va-2-112.ptr.blmpb.com [209.127.231.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FB930F958
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791179898; cv=none; b=ZXcsHAZ4xsPXxr6P3Sqpd8ixxibxy9ecai4RCJn68fR8CNU1xu9xWQBdE6neg4MNlrLHstB0AKNXnUBjKhTrtkwSMx0xzA7HPlzErigPMLAzEhsRGo8EczXx1YupDHd1B5m3arNr0Q+EFKwL3V2xzwSTP7Fd4+cFkEw/iOWTu4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791179898; c=relaxed/simple;
	bh=gaOIVh/Fbhxf4BLNYgJS6fC6oDJjGRVPE6KET/gbixg=;
	h=References:Cc:From:Content-Type:To:Message-Id:Mime-Version:
	 In-Reply-To:Subject:Date; b=FkPd0POMGiw47QV5evuPuSL7BDIApM/rvk3kpRUmfV2a5bjyQvQRVVOHEw8Jql9nV7TKEInDrgb1VVEHBJRceUCIAnO1ozccukH/5mCkccR5Gnib4yWD5v0H0SR+mGax4aT9XUKBsor5WR6L04HWpS0ZLuBkLg+xoNIWRfZeAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KYK1azOo; arc=none smtp.client-ip=209.127.231.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KYK1azOo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791179885; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=rbcLZB3ZBgbTYA+k7hqZrKu6IQRQyBU0erRYid8vObU=;
 b=KYK1azOonSyerggFDYh8vSInBE/gb5w70EzWjwRC3OFH59MaWN/pGjeS6j5kywMLwoxSqB
 RQ0tSerQCVXsOQGVnHtO2JVTS0sUePaSaKraXCgKjF1eH45l18l8hdGpZgOWyeqiuG225i
 Dal3PbRpPnuhpP9T4Zvt8hGPCzzokNZ17e0/LcaFk3Mw8pJoMHVKc62bgD9uCvFUTKQCma
 1TGVCxZQRMtgqv5VlLUwNF4Pdvxye/kgo5Z3q9PUN/r5jm/xGEmGUkgvGyxqcCSKhl+wBd
 1cszOS1AAGGBUE3PFWuWwFDSVW4LKzR+sNQ4DH1LHRMLr7zk9FFCEOPcD9zz0g==
References: <cover.1791179421.git.zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Message-Id: <de25dfbadc285425aced1103b32456afdc2240ea.1791179421.git.zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <cover.1791179421.git.zhouchuyi@bytedance.com>
Subject: [PATCH v2 2/5] x86/mm: Share the full TLB flush dispatch
Date: Mon,  5 Oct 2026 13:57:11 +0800
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ac33c6b+a554c9+vger.kernel.org+zhouchuyi@bytedance.com>

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
-- 
2.20.1
