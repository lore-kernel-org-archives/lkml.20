Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D52047140E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984499; cv=none; b=RQrOVNmdGYtO/DSDumYhWs0OiSyW7OyOux6okohmFSXNDOlAM7ZQ/AsOXZIzWyA9N3ppilk7f4vJWvSpskTB13XaJPnY90lFDSlTw5YAECTZek+nz/3kqT29pj/Ebv+Zn6u3vTOrH6HRKqW9oxrMLAsmfZtf6emXGL7nGvNvOyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984499; c=relaxed/simple;
	bh=IVPTkpJIClKUpnACjBCDVcvOd5PdrF+IXOfA9atO/XY=;
	h=Subject:Date:To:From:Message-Id:Mime-Version:In-Reply-To:Cc:
	 References:Content-Type; b=qJi9i/XcvePRTlAPzhpuqJKB7/mWdVHRRaaXPzmBRFoSgu9Mr+4Dd6FLZ/pRuZ4lqLQzpeSvDzRW64n6VZyHmqjt75bfM5MwXLMJ65NxLa9ZhhLaENrECyFvUmwtyscFxZC3yegadIAC5ggno9OxMSPazvzNddK5B5P0NbKG/Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CKXp18in; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CKXp18in"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789984492; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zRismljpTyFugrrIt8llp3KUsGKfOV8Fp0taHktktcI=;
 b=CKXp18inONyREBEfdzQCUKsHwjkL4/gAkfesVcSQR57mETnt/k1qhCF0iR5Kcvv4t+dUlB
 LgVFPwlGA0w6Q77l1EwxYHOYysGnEMedVtRDSIAm/ftLcLiaTZoG8fTycCj6C3KbwVrlID
 v1XgUn8cJIH+/RKA0krlXspA4cOSxNEiAdcfVjvIbFjpWxepvq36Atnz6bCV7vtSOv1xgl
 YnP/fFMNGRqr5xYIK++zwty4HEKuFohdRV5GiJRaQi5WUNHPAuDnlsGDYSgVs5Eh3MnrXF
 /ZMeSAMWilvHKfOl4bIG3viG/H0OHT5PLie0WdRowhq3QgsDMcQlEJ9L20bTcQ==
Subject: [PATCH 2/5] x86/mm: Share the full TLB flush dispatch
Date: Mon, 21 Sep 2026 17:53:56 +0800
X-Lms-Return-Path: <lba+26ab0feea+330792+vger.kernel.org+zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Message-Id: <20260921095359.3784458-3-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8

flush_tlb_all() and kernel_tlb_flush_all() select the same INVLPGB or
IPI backend and account for the same sender-side event. Keeping two
implementations duplicates the backend selection and accounting.

Use kernel_tlb_flush_all() for both the public full-flush interface and
kernel ranges promoted to a full flush. Drop its unused flush_tlb_info
argument and keep the event accounting in the shared helper so each
request is counted once.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 arch/x86/mm/tlb.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index da7c408f921c..5e9d1689f605 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1445,7 +1445,7 @@ static void do_flush_tlb_all(void *info)
 	__flush_tlb_all();
 }
 
-void flush_tlb_all(void)
+static void kernel_tlb_flush_all(void)
 {
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
 
@@ -1457,6 +1457,11 @@ void flush_tlb_all(void)
 		on_each_cpu(do_flush_tlb_all, NULL, 1);
 }
 
+void flush_tlb_all(void)
+{
+	kernel_tlb_flush_all();
+}
+
 /* Flush an arbitrarily large range of memory with INVLPGB. */
 static void invlpgb_kernel_range_flush(struct flush_tlb_info *info)
 {
@@ -1486,16 +1491,6 @@ static void do_kernel_range_flush(void *info)
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
@@ -1515,7 +1510,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 			    TLB_GENERATION_INVALID);
 
 	if (info.end == TLB_FLUSH_ALL)
-		kernel_tlb_flush_all(&info);
+		kernel_tlb_flush_all();
 	else
 		kernel_tlb_flush_range(&info);
 }
-- 
2.20.1
