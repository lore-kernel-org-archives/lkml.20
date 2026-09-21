Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9F46A5FE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984489; cv=none; b=E3rAOnf886zNMa4JJeJB2uTGNqBYu6D6U9ojUQXmx5k8f750SgVmQHdG4jws7Q/2T/340ACZj2SGrFt01k1ny6rP85bea8X97S8oTROX94G1URn+U4zlcWz1sFdgG0zryQPfpLBAcNF15xgMJMoGHNZ+5XszSVWcHERQUW09aFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984489; c=relaxed/simple;
	bh=D2H32IcNGCfn9AdDj0sZ4KdyUBvOQiBM5LH98Jkhw80=;
	h=Date:Content-Type:To:From:Mime-Version:Cc:Subject:Message-Id:
	 In-Reply-To:References; b=NZD6xDpplwq/0P3BuoYzyrLx0XVAqfRhcpZo4LaC/zWzc3vu0PRl6FWyTByqLZ1w00HWYbtoIQRfcvWov9KjzGzQdo57ZLJVrEAGvntVKYEZn4hpzpu9NMRoQzqit1wK8dsBehDFOL+Wkvs5ppG4GOEvISDGV9N+4PIPuzuOMLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=exdE4D/V; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="exdE4D/V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789984476; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=OcmkMLtMui+Hzv0wD+gl6HVDauRdtJSikt6X5IDzSTQ=;
 b=exdE4D/VHZw4M/99nPnAKSLcZEEtEL3jNijToIp72RMqNCg/7u5pJ3K3BZHT1RLYE33Yw6
 c/Ec5HaBcsp6dpiOqbQv53jtvc8FoBr2Ks+/sfU4rGkjfZ9HGwrt04CNlZaxoy9L2qyHSB
 nrbLdj+uKj5cmrQlybt1yXof+ACAgTCwAiQXhU1vAf/ObY6EiWNF/+mkUIHvyN3eRWy0KV
 BUiy2IzrvBRx/oLi0Ykxn4TCR6BdChcWTWdseNY9Y7TSXuv6LIxciMWebRadsHUkh+RFuf
 1etVBg5tleoV09ckwOtG3v1nEYWEhabRWHQ6FrecIjWxbvzFn5Un1aixdk16kw==
Date: Mon, 21 Sep 2026 17:53:55 +0800
X-Lms-Return-Path: <lba+26ab0fedb+a80406+vger.kernel.org+zhouchuyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
To: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>, 
	<nadav.amit@gmail.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: [PATCH 1/5] x86/mm: Account for remote kernel TLB flush requests
Message-Id: <20260921095359.3784458-2-zhouchuyi@bytedance.com>
In-Reply-To: <20260921095359.3784458-1-zhouchuyi@bytedance.com>
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com>

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

base-commit: e81ee06308379a5f2ededf997bcf17551bce5db7
-- 
2.20.1
