Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471691;
	b=HePhDdJr1WBVgPUjah9MfH59zXJmAnUbRvdHtZcYJVjtfoFA1pdDhtDzZZQLjJxx79hf
	 4EE0tlzuExxg/5JziMRKrc/j0mQKEyNVXrX3kPAp9SRouycGTO04lpN3JqLWw+95Dg5rp
	 OyFFXXPH7oDIDZ4pyQ9RJJ7ztZjvzKJReS3e2tDzATOuJTAYro9vYL7LpETDTKWXzhVZJ
	 EU0mz4WFB9LJKALErssCG2Fqp7MzyIixFSbhIyy2uPXoBbEr4qaVEjPvqrB6BwqPUBhlB
	 sbzUPD5TgPS4k9mvFPpv0RUJ8aL4HU0sRWzYFtw1gXARN5TF/IlvpDSEaLUYpF7TL3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471691;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Date:Message-Id:Received:
	 In-Reply-To:Cc:X-Original-From:User-Agent:Content-Language:To:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:X-Lms-Return-Path:
	 References;
	bh=mBIfK3o4iKarK872/zHsbPwNjbdGsJJ2EGo7hkRryuo=;
	b=TKe9ARv+iK5OrQY1tbhnwdqpJG6Twk8WDaYPka1NWbMI7qt11+iKClWZp63ucHAlwZgP
	 r29ecefiTB5WCag7pn9PsMnFDN9uflJK+XkZTP6rtTqqaVeAXS+OOV/eTxbZAbXnkFTB+
	 grkUxjmhoAt7YDtrQW3IplAYtv0QVt5zQ1OpkfQFKq9Me8utz/rXmNvRKz2woGMWZzwCA
	 NmfuR1Lr8KT/xIu0mxvnomIzLaVLeNmsPkmqxqLD2By6mj3rd/lScjPHciww7srKUTy1X
	 l0o6lK5+hyx4VxHZxCxe6RyvaEaIclmFNu7EfVF7onaJMamz4+b8UT9VBoAah61geXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=picoheart.com;
	spf=pass smtp.mailfrom=picoheart.com;
	dkim=pass header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=UKUqcoJ0;
	arc=none smtp.remote-ip=209.127.231.30
Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D5606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 453D5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=UKUqcoJ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1794471684; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=mBIfK3o4iKarK872/zHsbPwNjbdGsJJ2EGo7hkRryuo=;
 b=UKUqcoJ0091Ay+JEFjQeodutzfl8fWK3uOW1wjojV5QHYpB29PbRSwDGswU5SynSs+JacO
 nn0+ZAKQwCKTNBQH1rA8fW1XUGZm9y9kwBt6EnW7nquYm/E7Z13/pwxWN7yEEAprmEhmE+
 OUihlcuOCR6FVL/GjbeWBTRvJthxNYvUUUucKYd3FfxQRl+g7IqjQh6pbehorfuXwxSHNu
 4KMuXcrh3W0RF7zpTBJyvF0hF75fW2OGfTgFy2xpKKOkNQaXYOve+kcS+q0gWiQzvZ47dJ
 wMxlMpHko46x+/+C+8qd07kBDWz+rc9I3YuE08ugBNY/gyaEH6zA5xerwX4k3g==
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH] riscv: mm: Limit per-page TLB flushes for large PTE batches
Date: Thu, 12 Nov 2026 16:21:19 +0800
Message-Id: <c125c25d-c7be-4116-9837-09dd7fa91a91@picoheart.com>
Received: from [100.86.214.79] ([58.250.106.102]) by smtp.feishu.cn with ESMTPS; Thu, 12 Nov 2026 16:21:22 +0800
In-Reply-To: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>
Cc: <yang.yicong@picoheart.com>, <alex@ghiti.fr>, 
	<akpm@linux-foundation.org>, <baolin.wang@linux.alibaba.com>, 
	<wangruikang@iscas.ac.cn>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <zhang.run@zte.com.cn>, 
	<luo.haiyang@zte.com.cn>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <hu.shengming@zte.com.cn>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26af57703+d67baf+vger.kernel.org+yang.yicong@picoheart.com>
References: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>

On 11/12/26 11:05 AM, hu.shengming@zte.com.cn wrote:
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
> 
> Folio size      Before       After     Change
> =============================================
> 4 KiB           116537      113503      -2.6%
> 512 KiB        1431962     1977519     +38.1%
> 1 MiB          1528457     2208209     +44.5%
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
> +		local_flush_tlb_all_asid(asid);
> +		return;
> +	}
> +

could we reuse local_flush_tlb_range_threshold_asid() or
local_flush_tlb_range_asid()? now the logic is exactly
the same.

thanks.

>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
>  		local_sfence_w_inval();
>  		while (nr--)
