Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299348;
	b=3PZysKgHho83JUi2Q+Rxd3HdnBH3osP0c2q7IKQev2lDdDbUCZXf/yD+l10D82qZMshb
	 B/ENXt/SR7dBn95Rnjieh8qc1BNi3Mm0qqN7LutWHlxdPq+UcyxKNbw6z1+dN+FoN+QUC
	 IrjT61XR5oV3VzLAj3fbqzwDc6IN0DsjWJ9GERhThwyw/vHhfnv5zeI3QhbO4ld1DGup9
	 swBqN4zVSQeu90NpehyHHWo/iuMcwAY+zDueiOlD6fX8NO6nROpfWQfeosaey+WYspG++
	 qIicuutbRBBN0thGmU4buNod8Ma6KOdWtil7HpyqwQ1Cij5xHGMY9AWGnSUNinI9m3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299348;
	h=DMARC-Filter:DKIM-Signature:Date:Content-Transfer-Encoding:X-Mailer:
	 Content-Type:From:X-Original-From:References:X-Lms-Return-Path:To:
	 Message-Id:Cc:Mime-Version:In-Reply-To:Subject;
	bh=9BmCx7b509FJE3Vm/yz8oJWHEyXZl8OZ468REuznepQ=;
	b=R1imgk1mlciAVbQzU3EB9/Jbe//p/g/QtN/lHbP8JEhjUgUdHmTx9/tjPEei7IpAjxzo
	 8lhc8Ov81b/RX1TOwM+hcpMaKtGDM3h9FoBNdaCrmBCbdAkWMPKVCk7gwmoYLcP3HeLv0
	 gthUNGegaxIceIoKyU4XvOzw5oqCL1sFSe52vPj1I9JaSpqPzaR5DhC7q/j7KB4/nXO5L
	 JMIAoPYVgsJz6ncrg1QztZZI/pb/1ZNG4Ns/EldD9FXfaAv4E3Q0Mdt2X756d+cym3Zjv
	 s5Hja9EFKtzjTZIwXR8znpii9iWGMmTj50XTGFdNOyXwAt0PNBPu2wUZF8ctRO4VHhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Uex3SIDN;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC282606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC282606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Uex3SIDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794299343; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=9BmCx7b509FJE3Vm/yz8oJWHEyXZl8OZ468REuznepQ=;
 b=Uex3SIDNngLGG6C9cAwqgghVGk2PHjSKNqM2p2fUZck/ZszYNhpVD0zHtNjznnCSSkmlLm
 +sD21Bp9YpbS7fUgywXuUUJ4wXm6NYbZVUVG/6YxdoAq4M2GbC7X7oz90hsDQT4BbqSej4
 T0u62Qkd51sjqNyW5L1CWFbeICck+H42AHUC6FIiFKqVIeSzBEFYz+Yja7eDNh4O/2cRfa
 bLJ11eq0QF0etInDzHiJ90ii/1rdTHOUBFpdb+WOWCwzSYa16PsKoAub3DzVakwddZlaY9
 PgaeTRgISaNfv+ueAXmX+kgKTjRueKaWjzFi7PC2vsPL3k+BGdtX+wAvoMvu0Q==
Date: Tue, 10 Nov 2026 16:28:03 +0800
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
References: <cover.1794235715.git.zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26af2d5cd+01739b+vger.kernel.org+zhouchuyi@bytedance.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Message-Id: <82007208d7f0b0098b6b0c6d791664fe92b40639.1794235715.git.zhouchuyi@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <cover.1794235715.git.zhouchuyi@bytedance.com>
Subject: [PATCH RESEND v3 2/5] x86/mm: Share the full TLB flush dispatch

flush_tlb_all() and kernel_tlb_flush_all() select the same INVLPGB or
IPI backend and account for the same sender-side event. Keeping two
implementations duplicates the backend selection and accounting.

Use flush_tlb_all() for kernel ranges promoted to a full flush and
remove kernel_tlb_flush_all(). Share the existing backend dispatch and
event accounting so each request is counted once.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/mm/tlb.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index a3c0f94e0451..9a7465a0065f 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1492,16 +1492,6 @@ static void do_kernel_range_flush(void *info)
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
@@ -1521,7 +1511,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 			    TLB_GENERATION_INVALID);
 
 	if (info.end == TLB_FLUSH_ALL)
-		kernel_tlb_flush_all(&info);
+		flush_tlb_all();
 	else
 		kernel_tlb_flush_range(&info);
 }
