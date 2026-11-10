Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299333;
	b=Rmr147Ig0QI/Waiq9beRZi3dymJU6QB5yxtYZjz8+6IeiVj6b2Mkj+e12+sVh082ul4Y
	 9hFdfRw4IkWd78dp2Ukol5QguxOojNQAUEs98DqvR3GHMwLswwY+OUx3HyFERR+EaQiL9
	 ozzn1YSzBec73W3t3uOSkkumf+zAkIFIcw10pafTYGYgKA8HR4z/w6pn9m5N13I4T9w4V
	 SKu3YKAa9klxmeuPizHim7R4NmamP90FQtve44BvFm9kIiOTXfhsG/Jk5MrVkpPgE/mJH
	 FQcR3d4mu466b3Qy9kcOPO6QNiM2eHhVozlGCR/tnm8qkZpT8nFgOMl/rp8ewEXWHJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299333;
	h=DMARC-Filter:DKIM-Signature:Subject:Mime-Version:X-Lms-Return-Path:
	 Content-Type:Cc:Date:In-Reply-To:References:Content-Transfer-Encoding:
	 X-Mailer:To:From:Message-Id:X-Original-From;
	bh=Tb1DjT925ZtKsfqRD+RIip4klwOaKLP3SVGds40jm2U=;
	b=rsnwN2Q69ZqtDenh9lIGgmSmIWqCXb3IkdMWHrKYua8msPARPhb1d1B/+MjcSLxa1zmf
	 wf9viMN3Zyail42uknS9APow+oXb65e2gKFQEcxegW3GYLD5zV3vAltNrO/sbUy2GWcLB
	 9nh5kTOrIx8JqfXUCCPRLiK+KeImnJEVLHNsAomwKa5ckp/FDkLPr35ZfcXYda9EfkNOi
	 q9m9a5UymuB0yIHgv68sBiOopibSMcFQKRAqfxOdDAwLz6lIK+QF8TObVwUAeLJSklTaO
	 WrgTkdVjkuUG6gCrNr0SL1HLjWf64xGReLACD8PwzQaaA/V7/kmpGJJmf0UBcQCs8fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=YMLLp5bb;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEDA60A2608
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEDA60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=YMLLp5bb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794299326; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Tb1DjT925ZtKsfqRD+RIip4klwOaKLP3SVGds40jm2U=;
 b=YMLLp5bbvme20Thy62WbB0jX5fadZUraytxfwHujJNsVK9Y4uecAveGdm264kQHcvkLEhX
 Ph4EWmTKJxrYTf6H5l6lgilOpWUZ17my1qay1RsT8GbK32XwaMIQn73+QjeDoH9QABUT2S
 HBskTwT5yMrqHxc1Scz22gqPpLMtSNgpiDf6kVZVyxOebG1fu/Sq9ZSGIqf8256Ux034Kv
 4ZcB7SQcY6ZSAPCyjQefFc48MpwkT0Ol7cMie9brHz7rEnHaJnPOI1BzQ71Ad2bTohQB36
 q3Mx13d7FcEIdm8ttf9jcgYvfpW719gpkywou3DNUBGYjYOOaX9AiLPHwNLhJg==
Subject: [PATCH RESEND v3 1/5] x86/mm: Account for remote kernel TLB flush requests
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26af2d5bc+d0f265+vger.kernel.org+zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Date: Tue, 10 Nov 2026 16:28:02 +0800
In-Reply-To: <cover.1794235715.git.zhouchuyi@bytedance.com>
References: <cover.1794235715.git.zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.20.1
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Message-Id: <d192b9b8288ad0a4460254048209b1414a136220.1794235715.git.zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>

NR_TLB_REMOTE_FLUSH counts requests to invalidate TLB entries on other
CPUs. flush_tlb_all() and native_flush_tlb_multi() account for these
requests, but flush_tlb_kernel_range() bypasses both functions and does
not update the counter. Kernel range flushes are therefore missing from
the sender-side statistics, including ranges promoted to a full flush.

Count each request in kernel_tlb_flush_all() and
kernel_tlb_flush_range(). Account for both IPI and INVLPGB backends, as
flush_tlb_all() already does, and count once per request regardless of
the number of target CPUs or invalidation instructions.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/mm/tlb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 53dcab39566f..a3c0f94e0451 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1494,6 +1494,8 @@ static void do_kernel_range_flush(void *info)
 
 static void kernel_tlb_flush_all(struct flush_tlb_info *info)
 {
+	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
+
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		invlpgb_flush_all();
 	else
@@ -1502,6 +1504,8 @@ static void kernel_tlb_flush_all(struct flush_tlb_info *info)
 
 static void kernel_tlb_flush_range(struct flush_tlb_info *info)
 {
+	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
+
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		invlpgb_kernel_range_flush(info);
 	else
