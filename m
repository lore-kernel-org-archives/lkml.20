Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C7357D0B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788839764; cv=none; b=KgwKYalQRnKhCIOQP8HTuEzV0k9Db2cZFXMZHb/c1t8RFsX6hk5Be6ajb99pccPq0vOu9dpqkQHVJdZjN/A0wnxG4mi/hQ3jojk6wb3wU2g8KQDRFI2rWJ067wqG1NhMIrzZpqAj+WIA//38AFXpdsvdZ8kynozC2EJI/IO3fPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788839764; c=relaxed/simple;
	bh=+XFEwQ3kI1ngJ+wfUxxFlSph3TOVCYG8HfdnCFic6NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxWSAvHMdp8CpANHeRZ0rR1Nj+rC28b99oXPfhvkCEa4pmlgCUOlBT3X3k1wVIjuqf08I3A3sjpyZ5/G+Q8JD0JWgKxRDqgdQwibc111rIIKZKU/tZJmDMqPVIUnTr5ukT/+FYq9DJwgRnLl2zVnhizRtCOstb82ipRgy4a5T5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNos+MKc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNos+MKc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F4C1F00A3A;
	Tue,  8 Sep 2026 03:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788839756;
	bh=R0ctmnURbfF1jhA+WdoNmvVL13yO/rBUKyBio3eC778=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LNos+MKcLezGnUD2SYPmGwoSzWVCG2L6wUaryMRgXYcoZXan2cPQawTc25mB8jhEW
	 waNvgZlZhvn1C7xcWyz9domfw7U3n92IiJ/4mdgp/KqG6eL6QlMEdDTdNSCKkkPg/z
	 1Xbs3NaU7dtnSVaojJtpL7bkD1TG+BI8ctzFle/KRoTvgdWvwXIVRtOfS9WO8sSbgq
	 ulqybM65fXy/cSv65BFLpa3JVbYzc5mAMAoBjIMMe0YwVunaBHdbuOKKw7IFiLx0CL
	 ooRU+mx6ZhvIKXJFIEgZ8jaX4zDJxdLW4Z7mVmDJTq0zmjtYQnpWHK8v20Fwd1tinS
	 LR8Z5reatLAWQ==
Date: Tue, 8 Sep 2026 11:36:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix load_unaligned_zeropad() fixup for RV32
Message-ID: <ap-CqOtyN9qvWHOb@xhacker>
References: <20260907190750.26303-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907190750.26303-1-kmehltretter@gmail.com>

On Mon, Sep 07, 2026 at 09:07:50PM +0200, Karl Mehltretter wrote:
> The fixup for load_unaligned_zeropad() runs when REG_L crosses into an
> unmapped page. REG_L is lw on RV32 and ld on RV64, but the fixup assumes
> an 8-byte load: it rounds the address down to 8 bytes and derives the
> shift from three address bits.
> 
> On RV32, a load starting in the last three bytes of a mapped page selects
> the word four bytes earlier and shifts it by 40, 48, or 56 bits, more than
> the register width. The caller gets earlier bytes instead of the string
> tail followed by zeroes. This affects RV32 MMU kernels built with
> RISCV_EFFICIENT_UNALIGNED_ACCESS=y, which selects DCACHE_WORD_ACCESS
> and lets dcache name hashing and comparison and strscpy() use this
> path.
> 
> Derive the alignment and offset masks from sizeof(data) instead of a fixed
> 8. This makes RV32 use the correct source word. RV64 code is unchanged: the
> complete extable.o is byte-for-byte identical before and after.
> 
> Fixes: d0fdc20b0429 ("riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> Tested on RV32 QEMU virt/TCG with a KUnit guard-page test. Before, the last
> three offsets returned fill bytes from the previous word (0xa5, 0xa5a5, and
> 0xa5a5a5) instead of the string tail (0x44, 0x4433, and 0x443322), and the
> suite failed. After, all three cases and the suite passed.
> 
> Built full RV32 Images for both sides with GCC 15.2.0. The complete RV64
> extable.o is byte-for-byte identical before and after the change.
> 
>  arch/riscv/mm/extable.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
> index dd1530af3ef1..e252eba55ede 100644
> --- a/arch/riscv/mm/extable.c
> +++ b/arch/riscv/mm/extable.c
> @@ -68,8 +68,8 @@ ex_handler_load_unaligned_zeropad(const struct exception_table_entry *ex,
>  
>  	addr = regs_get_gpr(regs, reg_addr * sizeof(unsigned long));
>  
> -	offset = addr & 0x7UL;
> -	addr &= ~0x7UL;
> +	offset = addr & (sizeof(data) - 1);
> +	addr &= ~(sizeof(data) - 1);
>  
>  	data = *(unsigned long *)addr >> (offset * 8);
>  
> -- 
> 2.53.0
