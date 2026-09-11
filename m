Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71CF385D6A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151013; cv=none; b=Ig6wNtfvQJDI0G7/8dG8211oeASRaqr6Xjhkj5mWlZ/CiVg8W2IRT+1IngB0pDOJ803VVJgPgw9y+JuNLunOPzjK+xjtoE24jmmYkmJwtMqeidGSF11cT2l/x04z0l3xuiueb1KYF/9hhTzBWClihpZn5N//oX1TO4F/RQzVzoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151013; c=relaxed/simple;
	bh=D9fNmlG3UVoimVxLdc3dLxDYf3JYl+BkPaMZhikHd3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHIowv4y7mrDjyfUgNHK8Ajstcw7bNllFU9mawgKP8vcum5lZFuGGwU+U6+KEsqBmkhEqEt8Y33hp6ZSa8qRNkg4U3J+D1BphCrobpFa5tveGl672KpO0LhkXz/3Ek6cOGuLnL/GtPi/hQjVKabmjQLWDTx0QDagc5tTfL8qec8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=x6BgLxWC; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="x6BgLxWC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ueyLB1JyHUtq2Y/UkowBo5RWbVMBnY8/2qD1vYiYyb0=; b=x6BgLxWCAVOhLayUQpfUdehKK8
	igmAP7meW+MULZQ9vMTnm/IJEdjahlZhJgPcke1AgsxYFvmDD4e1dJaCaKCpH6wsyAgrfT0eg2wft
	+L3ietLL8CSH/dWgBXKDjZbk4Z45dGMi58UhRIemConj6x8zs5uTQakXcVUU2HmISDMt70S2Bfk/R
	2B248fyJGICjcnquI43qkLYChvTRJpEcmWovtUN29LwVIqVVLjcQHEu1Pfp/f9UsQnfdD/pOwzoEY
	6fWyTkITU1WMJZ5KrPyKB6olE5iPq/6cHgQ9VEmFdMJmZ9gg0dKab+6uecXdM2u5GswL3tR1JeFx5
	ljtYLPCw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x55u9-000000091y5-3ODX;
	Fri, 11 Sep 2026 20:23:17 +0200
Date: Fri, 11 Sep 2026 20:23:17 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context
 save/restore
Message-ID: <aqRHFfR-v8yQP4My@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
User-Agent: Mutt/2.4.1 (2026-07-04)

On 2026-09-08 21:03, Troy Mitchell wrote:
> The standard vector save/restore asm advances datap but declares it as
> input-only. An inlined caller reusing the original pointer may therefore
> use the advanced address instead.
> 
> Declare datap as read-write so the compiler can preserve the original
> pointer when needed.
> 
> Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore per-task Vector state")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/include/asm/vector.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
