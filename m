Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.209.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975264;
	b=Qh3GiMlufZJA9D3pOcFLd+H2bRTIey3ubhyrM2rk7twUpJCHcuIU0GGiwkAoOaHy05OG
	 iQE/JxcqcV1t9/pEDQLOA8rSRTTCrSjr9bze7WhcJDrcKX13jtI1GEZ4cuFkqZMai/biq
	 TchyvQbUZbK1uFkOT3sUkRZtXUSmPQ9FucPI3dKoe0xeu4Ty3Pxn+Nt0rw3TKAgNm5TJX
	 12DrxH/u9FFrXAKGbZeWBBZrIZ9HakYQAQsaEe5wWzImaHVGju1N160o8qx4bk2oZQVIl
	 B6wdpRTFLaaLsq+FZ46c0EJ3FTDqZlNHRSVfe78cWj18b1aLV539V3KKwO3D2Sq53eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975264;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MailChannels-SenderId:X-MailChannels-Auth-Id:X-Wipe-Society:
	 X-MC-Loop-Signature:X-MC-Ingress-Time:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=pGouYfVjyKTGZXnLB4H9BJgc3JtVSKN70c+jj0mxOQI=;
	b=BVx007kV8UvBETkMtLftXi6OEaUEOwRt1y+ZocwQxCkI6HmHJWaBX1Nm6BEDsDYGKQHA
	 aWUk2MMooM+tTpUtfvkfmh5AcwhgGHjtc9IVujPmZndhJSx0uu5cNmE06l5bAVpAONkRG
	 gWSxsT18SlN+HToAWsUhPxWR/2GucMcfC5s/LZJnbXpoctoOh3kybFClXC/YwZkhKeKBm
	 nZNBJ+LZV51LRhLNT8eFGgN6fcqVOz/1EVcfnvvlKpmdhmfluANEb36WxmSvuCn2qp24r
	 R5qZgERDKzhNqxMU0KpDdoSWf8rNjhzO/iTAhVESQ6mHM76zKvv5g4qzblG8SzdYQWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stgolabs.net;
	spf=fail smtp.mailfrom=stgolabs.net;
	dkim=pass header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=MxBMYSkC;
	arc=none smtp.remote-ip=23.83.209.14
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FD2606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89FD2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=MxBMYSkC
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3DA64721BE7;
	Fri, 06 Nov 2026 14:27:37 +0000 (UTC)
Received: from pdx1-sub0-mail-a256.dreamhost.com (100-99-200-173.trex-nlb.outbound.svc.cluster.local [100.99.200.173])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id CFF82721D76;
	Fri, 06 Nov 2026 14:27:34 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Wipe-Society: 7e13525769cfa6b1_1793975257071_335491123
X-MC-Loop-Signature: 1793975257071:91848556
X-MC-Ingress-Time: 1793975257070
Received: from pdx1-sub0-mail-a256.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.200.173 (trex/8.0.2);
	Fri, 06 Nov 2026 14:27:37 +0000
Received: from offworld (unknown [172.58.167.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a256.dreamhost.com (Postfix) with ESMTPSA id 4jLhN46Fm3zymb;
	Fri,  6 Nov 2026 06:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1793975254;
	bh=pGouYfVjyKTGZXnLB4H9BJgc3JtVSKN70c+jj0mxOQI=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=MxBMYSkCpvxRollmdthtjiAEFtOMzSCECzxuM40nrv86EzrMh2O3+Wjng/C6xknGI
	 RT67iuYMxTgTVKOOyXsSyFiObPakJJiEwYc3Qwmcro2bphqGzipJOPG/Q44Wo7X76q
	 7x1zrUPVjaqFUQ0DaT5pqrJqCqk9a0aSNgsqon98q/nLr07SDkRKPJZ/qbNJwAfbpT
	 D9/CSbHuVNQp1PONYKYpwND9Rv8HrcFjKax6KtXDMSCqMDa3JgMnSq2UtuHEnMUKxL
	 qkPX8S+VTXN2Owd1aX2S8SmVgsXKy6t4HP2IzK1efKDs/AasxPUp3huPH7OxhmZBJ1
	 Cqh0KGaTqPCSw==
Date: Fri, 6 Nov 2026 06:27:27 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: oleg@redhat.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: uprobes: Avoid redundant icache flushes for the
 XOL slot
Message-ID: <20261106142727.eccjk5h7xbeheruv@offworld>
References: <20261016203009.745042-1-dave@stgolabs.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261016203009.745042-1-dave@stgolabs.net>
User-Agent: NeoMutt/20220429

ping?

On Fri, 16 Oct 2026, Davidlohr Bueso wrote:

>arch_uprobe_copy_ixol() unconditionally calls flush_icache_range(),
>which has no range form on riscv and is a flush_icache_all(). It
>runs once per single-step, as the generic code allocates and frees
>an out-of-line slot around each one.
>
>The allocator hands out the lowest free slot and the free path leaves
>the slot contents alone, so a hot probe keeps getting the same slot
>back holding the instruction it already wrote there. Rewriting it
>costs a broadcast for nothing.
>
>Return early when the slot already holds this instruction and its
>breakpoint, similar to commit bdf94836c22a ("arm64: uprobes: Optimize
>cache flushes for xol slot"). arm64 can compare against the source,
>but riscv appends an ebreak after the opcode, so compare the
>instruction and that breakpoint word instead.
>
>Measured with the selftests/bpf bench on a SiFive P550, with one
>producer pinned to a hart:
>
>                            before       after
>  trig-uprobe-nop           0.075 M/s    0.514 M/s    6.9x
>  trig-uprobe-push          0.079 M/s    0.425 M/s    5.4x
>  trig-uprobe-ret           0.075 M/s    0.514 M/s    6.9x
>  trig-uprobe-multi-nop     0.079 M/s    0.548 M/s    6.9x
>  trig-uprobe-multi-push    0.078 M/s    0.545 M/s    7.0x
>  trig-uprobe-multi-ret     0.081 M/s    0.549 M/s    6.8x
>
>The uretprobe variants gain 4.8x to 6.0x.
>
>Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
>---
> arch/riscv/kernel/probes/uprobes.c | 19 +++++++++++++++----
> 1 file changed, 15 insertions(+), 4 deletions(-)
>
>diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
>index eb177d0ce8ab..44e566f6b75b 100644
>--- a/arch/riscv/kernel/probes/uprobes.c
>+++ b/arch/riscv/kernel/probes/uprobes.c
>@@ -168,15 +168,26 @@ void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
> 	void *kaddr = kmap_local_page(page);
> 	void *dst = kaddr + (vaddr & ~PAGE_MASK);
> 	unsigned long start = (unsigned long)dst;
>+	unsigned long insn_len;
>+
>+	insn_len = vaddr ? GET_INSN_LENGTH(*(probe_opcode_t *)src) : len;
>+
>+	/*
>+	 * Slots are reused without being cleared, so a hot probe usually gets
>+	 * one back already holding this instruction and its breakpoint. Skip
>+	 * the rewrite and the flush then.
>+	 */
>+	if (!memcmp(dst, src, insn_len) &&
>+	    (!vaddr || *(uprobe_opcode_t *)(dst + insn_len) == __BUG_INSN_32))
>+		goto done;
>
> 	memcpy(dst, src, len);
>
> 	/* Add ebreak behind opcode to simulate singlestep */
>-	if (vaddr) {
>-		dst += GET_INSN_LENGTH(*(probe_opcode_t *)src);
>-		*(uprobe_opcode_t *)dst = __BUG_INSN_32;
>-	}
>+	if (vaddr)
>+		*(uprobe_opcode_t *)(dst + insn_len) = __BUG_INSN_32;
>
> 	flush_icache_range(start, start + len);
>+done:
> 	kunmap_local(kaddr);
> }
>-- 
>2.39.5
>
