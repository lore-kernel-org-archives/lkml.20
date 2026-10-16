Received: from skyblue.cherry.relay.mailchannels.net (skyblue.cherry.relay.mailchannels.net [23.83.223.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D08E48DB53
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.223.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182632; cv=none; b=Tx1x43mbd+ByBHSttGJKCESOUCn6uoKvrVKf/clvB4LRCaKIwrdqMKkgwtXyeRAIbd24p84YU4lMcrICQUCJZGss4BJv8WqTgSHTn7puHIRC5wC+IOuHqn5UW3QFdQ6WFV5izTrhj+7gZ/YUgNfNcikw6pS/C+CVInd+hd3xV2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182632; c=relaxed/simple;
	bh=Z0uwyNCl4fIEwx7YerFwrVneVzTxcC+eWGEiBfXUULo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e+m1rEHG5zcPtiue8FYBNvFEDDXMw6ihwfY4Q1K87yjGT9f+HkK8c7eb59vowFdmYyilP8SMh8acPYTtxb4vxu3+mETnCYRUROWjmKceDqT+lybJkU5WicghRhvRWyVbDeP59syEtnhYYcqjT200So0jflJzccVC8g/oPhgzwws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=S53ktaIt; arc=none smtp.client-ip=23.83.223.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="S53ktaIt"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5EE2C4031B9;
	Fri, 16 Oct 2026 20:30:22 +0000 (UTC)
Received: from pdx1-sub0-mail-a243.dreamhost.com (100-96-22-126.trex-nlb.outbound.svc.cluster.local [100.96.22.126])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id ED3484036DB;
	Fri, 16 Oct 2026 20:30:21 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Illustrious-Cellar: 1395b1046176cde7_1792182622177_1942717813
X-MC-Loop-Signature: 1792182622177:120948357
X-MC-Ingress-Time: 1792182622177
Received: from pdx1-sub0-mail-a243.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.22.126 (trex/8.0.2);
	Fri, 16 Oct 2026 20:30:22 +0000
Received: from offworld.tailf5af7a.ts.net (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a243.dreamhost.com (Postfix) with ESMTPSA id 4j5xQP2XTNzymT;
	Fri, 16 Oct 2026 13:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1792182621;
	bh=PcS3jqGw1d0uKoVz55H1H+E/WB5a/xueLvnn+JMoeSA=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=S53ktaItaGQ/MfiIZn31sgp5A1GXOEl36B4yumnJZgUD2x76zV6iS0FIDqqKAUnJp
	 RNqEj1TaI22g1i3V2jzNz7DPkDo3fhN+gZhajhSHjcUw7ZsN/Ra5l8GBMoq+YFR3Wr
	 4hkwfbwynxbji7eyGPRh1/+rzS13gbnkte9Rk5KnHOR5nG1X0i4okSeR6H2DS+wQyK
	 d8ope8Soi39MPGN0U1OuNMWV0x38Way5K90KE5CFdjJ0xYbjeEfrbi8keBoUxSBfXf
	 h72PaUlxUhJaZOarOXOOny5SSoF0E0Dqec9g0/WjdAj/3q/qrZGwHQHJg4lUGxwoym
	 TMnYMSPhcd3gw==
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: oleg@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dave@stgolabs.net
Subject: [PATCH] riscv: uprobes: Avoid redundant icache flushes for the XOL slot
Date: Fri, 16 Oct 2026 13:30:09 -0700
Message-Id: <20261016203009.745042-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_uprobe_copy_ixol() unconditionally calls flush_icache_range(),
which has no range form on riscv and is a flush_icache_all(). It
runs once per single-step, as the generic code allocates and frees
an out-of-line slot around each one.

The allocator hands out the lowest free slot and the free path leaves
the slot contents alone, so a hot probe keeps getting the same slot
back holding the instruction it already wrote there. Rewriting it
costs a broadcast for nothing.

Return early when the slot already holds this instruction and its
breakpoint, similar to commit bdf94836c22a ("arm64: uprobes: Optimize
cache flushes for xol slot"). arm64 can compare against the source,
but riscv appends an ebreak after the opcode, so compare the
instruction and that breakpoint word instead.

Measured with the selftests/bpf bench on a SiFive P550, with one
producer pinned to a hart:

                            before       after
  trig-uprobe-nop           0.075 M/s    0.514 M/s    6.9x
  trig-uprobe-push          0.079 M/s    0.425 M/s    5.4x
  trig-uprobe-ret           0.075 M/s    0.514 M/s    6.9x
  trig-uprobe-multi-nop     0.079 M/s    0.548 M/s    6.9x
  trig-uprobe-multi-push    0.078 M/s    0.545 M/s    7.0x
  trig-uprobe-multi-ret     0.081 M/s    0.549 M/s    6.8x

The uretprobe variants gain 4.8x to 6.0x.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 arch/riscv/kernel/probes/uprobes.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index eb177d0ce8ab..44e566f6b75b 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -168,15 +168,26 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 	void *kaddr = kmap_local_page(page);
 	void *dst = kaddr + (vaddr & ~PAGE_MASK);
 	unsigned long start = (unsigned long)dst;
+	unsigned long insn_len;
+
+	insn_len = vaddr ? GET_INSN_LENGTH(*(probe_opcode_t *)src) : len;
+
+	/*
+	 * Slots are reused without being cleared, so a hot probe usually gets
+	 * one back already holding this instruction and its breakpoint. Skip
+	 * the rewrite and the flush then.
+	 */
+	if (!memcmp(dst, src, insn_len) &&
+	    (!vaddr || *(uprobe_opcode_t *)(dst + insn_len) == __BUG_INSN_32))
+		goto done;
 
 	memcpy(dst, src, len);
 
 	/* Add ebreak behind opcode to simulate singlestep */
-	if (vaddr) {
-		dst += GET_INSN_LENGTH(*(probe_opcode_t *)src);
-		*(uprobe_opcode_t *)dst = __BUG_INSN_32;
-	}
+	if (vaddr)
+		*(uprobe_opcode_t *)(dst + insn_len) = __BUG_INSN_32;
 
 	flush_icache_range(start, start + len);
+done:
 	kunmap_local(kaddr);
 }
-- 
2.39.5

