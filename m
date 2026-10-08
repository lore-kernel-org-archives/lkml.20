Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C49547054
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443257; cv=none; b=JygVO3Vw49bSAev83F8OlpoHOj8cmiecwXghPWeBIj9UtjHHggCicS2lZcWOsQ06IxOyAZC/7ePEPtXBbQafdPVXUNtOhOep9gsHUEC2RW84/Uxdptc+1E+PVGGdcWTQJlD31RGf3QaNN6/3d/aT4U6aJQd4KuYicSqAPbDFppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443257; c=relaxed/simple;
	bh=J9erMPCqC7xifCWhqvYUzMlKCIPwz8WZ6JUsgCpgm3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oVWy2dnC2x4KjfFeAphzdUSpf5yyXQh9S8Tk6cpjawdJz/X8iPSPHGp0lvaM5DW32vUrynW/VrVccF6gkJEX3sv02cgDWkN7NTZb9t8TI8b1GeHAFzwyiAHA6HkPnfehON314lfS1VdqmzYAc/1crMoyt9cKIOhnXv7jeTxprBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=yIBsPu/x; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="yIBsPu/x"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0ww36d7lvRgL2utdgp0HYz+PlDtTfH54SleiAfqBREo=;
	b=yIBsPu/xFBl0IFbXnRxjHpIDRhVx5Eujlk04HEvl6gc8FLhRkbMrUYP3XM71VGxdCn7Iufk+D
	jmUYjpNLHcc3Bi8yV7MncHhAnXQJPDOcpR9iHW/Ck6HevFTDLPh7vH6Q/wUh9fu8Lm0BFGxGrjP
	1FZVTG4cE8XZpL2hiP0+nq4=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4j0gjc686GzmV8f;
	Thu,  8 Oct 2026 14:55:16 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9746140572;
	Thu,  8 Oct 2026 15:07:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:07:29 +0800
Message-ID: <a3e6fd37-41be-4dfb-917d-c3e906bae56c@huawei.com>
Date: Thu, 8 Oct 2026 15:07:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/21] arm64: bpf: Add support for generating reads of
 TPIDRRO_EL0
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-5-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-5-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> In preparation for storing 'current' in TPIDRRO_EL0, add support for the
> instruction encoding of "MRS Rt, TPIDRRO_EL0" to the BPF JIT.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/insn.h | 1 +
>  arch/arm64/net/bpf_jit.h      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index 1ce75a442638..0e739740513d 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -136,6 +136,7 @@ enum aarch64_insn_special_register {
>  };
>  
>  enum aarch64_insn_system_register {
> +	AARCH64_INSN_SYSREG_TPIDRRO_EL0	= 0x5e83,


Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0x4684,
>  	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0x6682,
>  	AARCH64_INSN_SYSREG_SP_EL0	= 0x4208,
> diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
> index b2fe6e6dcf44..df469a005373 100644
> --- a/arch/arm64/net/bpf_jit.h
> +++ b/arch/arm64/net/bpf_jit.h
> @@ -331,6 +331,8 @@
>  	aarch64_insn_gen_adr(0, offset, Rd, AARCH64_INSN_ADR_TYPE_ADR)
>  
>  /* MRS */
> +#define A64_MRS_TPIDRRO_EL0(Rt) \
> +	aarch64_insn_gen_mrs(Rt, AARCH64_INSN_SYSREG_TPIDRRO_EL0)
>  #define A64_MRS_TPIDR_EL1(Rt) \
>  	aarch64_insn_gen_mrs(Rt, AARCH64_INSN_SYSREG_TPIDR_EL1)
>  #define A64_MRS_TPIDR_EL2(Rt) \

-- 
Best regards,
Jinjie

