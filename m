Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7503839E9AC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776559; cv=none; b=XBNGFnJ5FjVlSufO3KrRECEnRC2fTbxD167aAg1YUGtm7oXLDJoWJ4tpKSdGrNHrErJdfKYhlc97WZDezO/gZzUzf53ijMA1hbwJdfzupraG05GxdVDf2ou4lN5f2UNP3SvGzmkOhL2ByIK/CIfxfI8vbxbRRK8jyPAEs+YIigo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776559; c=relaxed/simple;
	bh=FM63RXL8y++svnsRwV6dof37ctJr1Gt8BEAMQz475sY=;
	h=Subject:Date:References:From:In-Reply-To:To:Cc:Message-Id:
	 Content-Type:Mime-Version; b=b5PDtgrx7KqZ2/Dh5ipfPRgik/c1DeyTtjz0LdpazSnb54KJa8+3G+5qAkefFSDgzaQaOpSFyFBEDIzv9tL/NE0k3ZnqyTnLhEW75CAvw+3nhMLkECUkFhEClqAjloycPygCAwpke+XMZhquuukDmJzRrJMsXH8wxO9chOOhBqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hkUDuaSE; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hkUDuaSE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791776545; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=8mkmbXUigGUR76mG58RalfWnENmVpJkOFThNSuRu98k=;
 b=hkUDuaSEkC98Sur/OANknBWdDSm7aYE0KHiMS74cd8dJ5OAeQIywA2bUqRqX+OKHWsnT0h
 YioRblNhQWw7c6Tg5AFW0q6bcKazufdu2ycggklGibQZozRUFhK6K3mGtXVRFy2IY7sq1O
 wNykDqBbNfUUw2Ovn1oP9DMvnLxTGXWGX9q4SAtOyV47G6xm5OiLw15xlbzAJaF+2foxpt
 kg/9YHCD/ui3DR/vqZA8xSqwVdV2qU63B8bwPSTQbWahP9W+ycvxgYF9GHK3Fchh9ULLr2
 2aW5CQdx+1VQg//sAjpqlY7NNAhJpBYhaRB1NBjFKpCuv+gcCHQaQNdqwi0ggg==
Subject: [PATCH v3 1/5] x86/mm: Account for remote kernel TLB flush requests
Date: Mon, 12 Oct 2026 11:41:21 +0800
References: <cover.1791443164.git.zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
In-Reply-To: <cover.1791443164.git.zhouchuyi@bytedance.com>
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Message-Id: <776bab8ca4510f1a3aef86d2bb849cca31c5964a.1791443164.git.zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26acc571f+38134c+vger.kernel.org+zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1

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
---
 arch/x86/mm/tlb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 0c4da320831c..da7c408f921c 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1488,6 +1488,8 @@ static void do_kernel_range_flush(void *info)
 
 static void kernel_tlb_flush_all(struct flush_tlb_info *info)
 {
+	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
+
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		invlpgb_flush_all();
 	else
@@ -1496,6 +1498,8 @@ static void kernel_tlb_flush_all(struct flush_tlb_info *info)
 
 static void kernel_tlb_flush_range(struct flush_tlb_info *info)
 {
+	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
+
 	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
 		invlpgb_kernel_range_flush(info);
 	else
