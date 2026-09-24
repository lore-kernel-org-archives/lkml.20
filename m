Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DF147ECD3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254500; cv=none; b=hZslh2G1UtrkVC4/CfSaOAWQPX9YtWyyMUVOZTQpmt3Eu088Og5MKBW03looAIkpVQNovoXv9y8qGbsBlx+WujIFGbideNIFLJu3+aS4WttH5HQW/M7qb2gG5r7S6IkOX3yipo5393eXxSaUaXNldD9xep6Al9Gj3/5uFd2JAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254500; c=relaxed/simple;
	bh=aWV7PEMYjMS6Fa0gt8KRQnHPb2wOFgC/5kQomSEy/t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RodQqprs8jOc/RhglFDX114dqpkaiv8xpme/fqWssS0D4ADm+yuGFyGguMmHezrZF6DC9rlBUk9aV3uXycjjCUVYjxd62RvDonIiyI/2QJFD6eGS8jdokKJKne3SsKXH6IfNsOvmzsscOBXCfEB2FqguapuY9acHtrG8b92R73c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sE7U6I9h; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sE7U6I9h"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8FDE152B;
	Thu, 24 Sep 2026 05:54:54 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436243F86C;
	Thu, 24 Sep 2026 05:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790254498; bh=aWV7PEMYjMS6Fa0gt8KRQnHPb2wOFgC/5kQomSEy/t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sE7U6I9hopp3qF+bsG556752RndTtqc79LGscXR6qhlL0GRwOUSNviMC2mBGiBnxm
	 1PP6n5OarQPMDA4H1vCHAhAezpby9eImipwm8AeQn3bpBtZe59x4oZfAVUx9q3c+Zk
	 +USydU570tjM5UbJAgsPRCH/K7czyiGjd3bRO29o=
Date: Thu, 24 Sep 2026 13:54:54 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andreas Grapentin <gra@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: Use proper include variant
Message-ID: <arUdntLjLT6BD6zJ@J2N7QTR9R3>
References: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-syreg-incl-v1-1-a3097a8ccc74@linux.ibm.com>

On Thu, Sep 24, 2026 at 12:57:18PM +0200, Steffen Eiden wrote:
> Use <> for including the sysreg header as it is not discoverable from
> the current directory.
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

I'm surprised that happens to work today, but evidently it does.

Mark.

> ---
> This is just a spin off from [1]. There is no in-series dependency for
> this patch and it fixes a minor issue. Using " for the include file does
> not break anything (now) but it is not right as well. For [1] we need
> this to correctly transform the includes to a new path for the
> s390-generated version of this file.
> 
> 	Steffen
> 
> [1] https://lore.kernel.org/all/20260918133107.1042730-1-seiden@linux.ibm.com/
> ---
>  arch/arm64/include/asm/sysreg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 7aa08d59d494..4bfdac9401bd 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -173,7 +173,7 @@
>   * come from here. The header relies on the definition of sys_reg()
>   * earlier in this file.
>   */
> -#include "asm/sysreg-defs.h"
> +#include <asm/sysreg-defs.h>
>  
>  /*
>   * System registers, organised loosely by encoding but grouped together
> 
> 
> 
