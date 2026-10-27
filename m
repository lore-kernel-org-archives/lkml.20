Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103253;
	b=Qo05hlrJaTi/Taa5B9m5MBOZN2Fbjod90SrjPZrimr9uV2tOrLkWjlikMifYNmFzy3QA
	 41zoNPlbarh2lxD3R13/E6VhCer8prrucQpFHF/YnBO1J+gpBMRnIoPKpOfCddGYc3cK5
	 q8yWdHQHKU5p5Ay8UZ9XW0ww1kaiNe836c1xNnpu8tdrsmc/fCOELqfUNQ8U0bCr2MqMe
	 6TME0JvBE18nFD2bkAPpJbzfECD8HQbhiF4k5nDUppHJ5XN0YmyZSutNDsAGQcIxR8Ryl
	 /bsjaSc9qZV3ylMMss43JJ2kJ/WxAcoVl/RwWzWNxQcYvfbxrGvCon16DdtoEYAFFZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103253;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Pct43w36pX1CyxyO5UioTaXSfQeG54+wyQReoWNQ2M4=;
	b=nv/EJI2Sq8mlklyYAUbgTRdC8T9vG8GuAZtSNfmxiekang/kTBOlbuasbr1N7kAM2sgQ
	 lZHhwCaN7sJWKV1e0rcaF4EX/TGs7TIvrrU8dBrIGksud5wxiEPzAssb+7P2ZfUoqx+ER
	 LhvSfIcKuEIXTZbXlgdHUdeBihJWmXnMQ2OC7gYLpde+bEBQFP77o9TognVo4/04V1FNG
	 1+mlKYFfH4OS+Gouh1ItaRVLIvqan/rG2MKgEhWP6IagT8+k77Lwb1j7FFbNaxwlH+GRC
	 6S+8umPiC5hGJV7XR0gWrdz+WlodeNCsmTr6oP/EMyejMeFZmQjAAGbvYHT4mVsaJZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MxbmDdtp;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC5260A3803
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC5260A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MxbmDdtp
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E0F515A1;
	Tue, 27 Oct 2026 05:14:09 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A90893F7B4;
	Tue, 27 Oct 2026 05:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793103252; bh=+x+QJyMjGuwggXOVsXDAKvdIRmr5Q1UABK+FUovZffM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxbmDdtpPfFoeXeefNCv5AG3xkR1QIVMG8IB2ba7p7XsZOR6MnMJ29n3aUtFpTKJ4
	 yLVIhmoqY7IVmL9k2CNn/AA5kywvOq6jfzJC2KXy4+cz9+i2CHledKBbL8gMZYUmmn
	 WxAvzzd5AGHTuf/m4wwpUP+AjJpR9G3NOXH2TXe0=
Date: Tue, 27 Oct 2026 12:14:07 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Detect trailing "--" in
 __parse_cmdline()
Message-ID: <auCVj80cR8LILhXB@arm.com>
References: <20261015161054.357595-3-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015161054.357595-3-blum@kernel.org>

On Thu, Oct 15, 2026 at 06:10:54PM +0200, Thorsten Blum wrote:
> __parse_cmdline() detects "--" only if it is followed by whitespace.
> However, at the end of the command line, it converts the dashes to
> underscores and tries to match "__" as an option.
> 
> Detect trailing "--" directly instead of converting it to "__".
> 
> Fixes: dc3f5aae0638 ("arm64: idreg-override: Avoid parameq() and parameqn()")
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/arm64/kernel/pi/idreg-override.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index acaf56234973..38aa28d19650 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -352,8 +352,9 @@ static __init void __parse_cmdline(const char *cmdline, bool parse_aliases)
>  
>  		cmdline = skip_spaces(cmdline);
>  
> -		/* terminate on "--" appearing on the command line by itself */
> -		if (cmdline[0] == '-' && cmdline[1] == '-' && isspace(cmdline[2]))
> +		/* Stop at "--" appearing as a separate argument. */
> +		if (cmdline[0] == '-' && cmdline[1] == '-' &&
> +		    (!cmdline[2] || isspace(cmdline[2])))
>  			return;

I guess that's more of a cleanup. Does it actually fix anything to
deserve a Fixes tag? We skip an unnecessary lookup for "__" but there's
no functional difference.

-- 
Catalin
