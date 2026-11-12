Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486021;
	b=VVjZxjoMwl+p8Ybxfm8Miz1cfPMffDIVC2TPokKIxlsXsyFV5hNiRI1dOvPn6Q4BGuSS
	 p6w3VQyrHzPwZkng32ihetGPLHqo+u1P5/JfODbVyNr+4ESZuEtH3+WdLxTzUJYvtoH3q
	 WTY6C3U0E4wb8ef+Nj98h/HI/gc9mt7KBZm5XtLal7GrqMDVgvFy5J9luV687P0GE3hM+
	 /o4BoRQgdsWSJ9jQtCloAbM+GFOUbvpLN1x1H01d6FTNb8/qqcTJ9VGkFXqUMN6qAdTDe
	 +GqZz37JDRq44n4oq466W50EI0xnKQXDLz3gJXINXAOahvSmkrope6PowfchL1o2v9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486021;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VG4ibvh6nxXQ0qIYLiGl4aEGTtxF3L9vWHyMTCZCIEQ=;
	b=aVn33lVaHf7fxmrkSOrBc7Gm/yIp/y9cyXMXhH9aUEChNoyCOlypTM3oOKrlBuiKCkHo
	 Rx6zEL9qifoFqZZ9lceYaoWboP6vY9W/j47Z41Z4xIdsDjJFFkrEoPMi+caob6pegwFux
	 k3EibwzMigSzVTeyrJ0y0z3yJDBLNGjaZMBpJDRezl6dGHyD3qtGn1fblmSmjAyhG2dgB
	 ucWNfFnKwK4I9yNW3wcJPD6QKmDcfTxDZgMngXFSJkCMzDXKDQ/4IEsvO4zMwpDOMjuy8
	 rHTJLHuZni+8QZK+td7vr87ehTOqf8WFuUn5QZ+PylmyHe0kRQv3jEplyBOFpLkRDcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNcnWw8J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DA2606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNcnWw8J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33E41F00A05;
	Thu, 12 Nov 2026 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794486020;
	bh=VG4ibvh6nxXQ0qIYLiGl4aEGTtxF3L9vWHyMTCZCIEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QNcnWw8JP2dYKGfFeDoCDIndoy7/rNnerrfu+gun40tmG2sSLwGEU9mhoYzr2U+EK
	 RftKsXs3JlU4GPq1/eAxOPvBk1NS/9UfjZHnTb7MIXRimM9h9pIgq/hRXGghZdtcjH
	 +QDW1OP1UUEk90b09h/4j/Nf4O/ASSbrbW57jBkytbxBLt05NF7DO9WaafuHQzGTLh
	 9l9mt0hbLZJzZB6gWiPcjZm/EppxzIQESchHyRvRp74OuRu4w1foOR+dGrZIlAsfWF
	 S3uDpySOkQ7sdmlFw+j/nz2Qmwp36uIBUphnPf/klYEnHg/U3oJuq/ec/3DixfpQSE
	 BtUKnQcutr+3g==
Date: Thu, 12 Nov 2026 20:00:06 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: hu.shengming@zte.com.cn
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com, wangruikang@iscas.ac.cn,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhang.run@zte.com.cn, luo.haiyang@zte.com.cn
Subject: Re: [PATCH] riscv: mm: Limit per-page TLB flushes for large PTE
 batches
Message-ID: <avWqRtXhDwSDqlgs@xhacker>
References: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>

On Thu, Nov 12, 2026 at 11:05:25AM +0800, hu.shengming@zte.com.cn wrote:
> From: Shengming Hu <hu.shengming@zte.com.cn>
> 
> On systems without Svvptc, update_mmu_cache_range() performs one local
> TLB invalidation per PTE. With 4 KiB pages, installing a PTE-mapped
> 1 MiB anonymous folio requires 256 SFENCE.VMA instructions, or 256
> SINVAL.VMA instructions bracketed by SFENCE.W.INVAL and
> SFENCE.INVAL.IR.
> 
> Apply the existing local TLB range-flush policy to PTE batch updates.
> When nr exceeds tlb_flush_all_threshold, use local_flush_tlb_all_asid()
> to replace per-page invalidations with a single ASID-wide SFENCE.VMA.
> This orders the PTE writes before subsequent implicit page-table
> accesses and invalidates translations for the entire batch. As with
> range flushes, this may also evict unrelated translations for the same
> ASID.
> 
> Benchmark results from will-it-scale's page_fault1_processes under
> QEMU 9.1.93 (qemu-9.2.0-0.3.rc3.fc40), with svvptc=false and
> CONFIG_TRANSPARENT_HUGEPAGE=y (higher is better):

Can you test on real hw rather than on qemu to get the performance numbers?

> 
> Folio size      Before       After     Change
> =============================================
> 4 KiB           116537      113503      -2.6%
> 512 KiB        1431962     1977519     +38.1%
> 1 MiB          1528457     2208209     +44.5%

Since one page is the most case, if we really regressed about 2.6%, then I
think we need to evaluate whether the gain deserves the pay.

> 
> Signed-off-by: Shengming Hu <hu.shengming@zte.com.cn>
> ---
>  arch/riscv/include/asm/pgtable.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 2ebd5fa5adc5..ebe42fcf35ae 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -571,6 +571,11 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
>  		return;
> 
> +	if (nr > tlb_flush_all_threshold) {

unlikely(...)

> +		local_flush_tlb_all_asid(asid);
> +		return;
> +	}
> +
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
>  		local_sfence_w_inval();
>  		while (nr--)
> -- 
> 2.25.1
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
