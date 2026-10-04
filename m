Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305E61FCE
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 04:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791086678; cv=none; b=BCY3B8/lkO1vmFSL0nE8NMenyzwod+dvCsqxGgcO27ETcLWnJWpJzbrefP0jc53Qk/0meXhNuV+bcplG+HMIKDx1UJKH4DBKTtn7k1mcffzqucRqPDmNk2YWpDG3IzHRmjO0P/mJ0v5ZUzmxxf4yHOXrzB2IIB2trRTVlPupehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791086678; c=relaxed/simple;
	bh=GtuRsSFg2GLH+4duwepn3zyNViwAgKYzllznrfd9YFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOh3gUPUDOw1Ffg6TcTZ+34EVRLLLDUxhoBcfvP9dZh00HpeLBFNjDE9rQchw01EQeRZ019VMqovWqpiHlBTuA1rl3Tf3QE0v7IW4j9CZdSZN4e7zT9u8l3jwagCBBGAjB9AE3d3vLToNEI3OfYYaz9JvJLtdYZjYN2x5C6eCNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RT0yjuoW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RT0yjuoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B82B1F0089B;
	Sun,  4 Oct 2026 04:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791086676;
	bh=LFMGNCzQ6VDQ7rTQPtQ7KAL/3enkAsag5RFuwBCEoII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RT0yjuoWgHPCd8TZP7Q7kZXtHH2WmCfPmya7GyowxxUa+BV7z+oAvEU8x1b5Axx+k
	 nM3s7vBcKZJx8gAWVWO+Ls4wXuqOMKvRaOfo6SaKhZCnQxg04eVMIEatLGAmd9BX0R
	 MHGZeu/3Hs7jga97RCmcHPu9Tx1Feg5zMZybT29RXGqERpngy/vARB3xdscR4oogH+
	 EfcPOMW94Qxv8BaxBUnFjC3XSDyIn0tTaFk3KwFSHu0hkfo/I+ue70aAtxN/8yzfEB
	 +VHweB38loOHRBHSjzDUY1kPNW69wVDbBbrW6/mgIJaRQPrV04DRxmftxkMbm4DOQh
	 2OXxsdfcTcabA==
Date: Sun, 4 Oct 2026 11:44:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: fix RVG_SYSTEM_CSR_MASK width mask
Message-ID: <asHLphURjbEyu6j_@xhacker>
References: <20260911194233.3379532-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911194233.3379532-1-aurelien@aurel32.net>

On Fri, Sep 11, 2026 at 09:42:33PM +0200, Aurelien Jarno wrote:
> RVG_SYSTEM_CSR_MASK should be 12 bits [31:20], shifted down by 20 bits.
> Replace GENMASK(12, 0) by GENMASK(11, 0).
> 
> Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/insn.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index c3005573e8c9..ad348d8b8857 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -142,7 +142,7 @@
>  #define RVG_OPCODE_JAL		0x6f
>  #define RVG_OPCODE_SYSTEM	0x73
>  #define RVG_SYSTEM_CSR_OFF	20
> -#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
> +#define RVG_SYSTEM_CSR_MASK	GENMASK(11, 0)
>  
>  /* parts of opcode for RVF, RVD and RVQ */
>  #define RVFDQ_FL_FS_WIDTH_OFF	12
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
