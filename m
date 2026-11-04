Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766205;
	b=m3nNQ4xak8yy+JQJkthXLK8Ol7b1fnqeN7UgmOdza8/d3+2I6GLKHKJ2TpzIVnNqhEb7
	 gjt8No4sP62aSHHD6osIGNt7iQPLO38F7U89wxqGnF2LjF0u+HlwIMM1EEhgtb6YsJFWY
	 dvKpW7JbQKozofrz2uqiXeQwnI/6NH+fRHMma4Ik/R9ciwuFSpm6/8kcXcUkeBFnQwsIL
	 fNo7yHglwv0EbS82SfWE0FLT7eEF1OhLSgwbxq9zUxtjXP9EJr7b8ST4SOGOhU2qvfP+F
	 JiohASj0cRjedyy3+qXnD9pT4vPM1sWdc/aHWdeZNY9zhKm97AEZuGDN/aKxbo6cDLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766205;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uCAHVmV4ytAMq2LlYEaEh6YDhPAp9jBh4zwszcofGcc=;
	b=5cAoB1W0il1dUBqO3oxXo3AGWCL9rUIQpP+EMf/b6m1kGzvTRwH+UboBWqiZrS5kqKjN
	 NJ00fhxJ/VMvQRL3OVqn3fF8LXZZjgq6lH/F5ZUpHALOmcM8zofc9IzEoEK3DoHaOtCNr
	 HYuBTiH93CUOdcWEL2FfYh/MtDGD84wCeLY6cx23E4s5ya8+fO7MFTpN602hpqG6wF6cI
	 RRldnbVxO+X9ymphhbC3N6EdmT9xXLDgyZUFjd+87bcZYqaLHUKO74D4HbzRQ+R8m1Wgx
	 k9R2V8VxPEO0wh64kYjSC3J/gx5yxvt4+06oIq1xQv9JgL5osfP1agGEAK5j5VPgL2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O/OYjPXR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E57606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O/OYjPXR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BA51F000C1;
	Wed,  4 Nov 2026 04:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793766204;
	bh=uCAHVmV4ytAMq2LlYEaEh6YDhPAp9jBh4zwszcofGcc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=O/OYjPXR2iQmBOSPQgs7xbN6I/kLS9cLV7uBRE9nnAwA+Pc8e13aPQWew+0YR8m7T
	 6UbnzwwKqEPsxd4/dfACqtlZceYMXpilIl1i8hwavYneMBQRAQJoS5jGWRc2sRWScx
	 TNxFZIq4Tn5h8ngaMNoQQQxf6cXdrURQ8ddjXZjn4GZxm3VC4Y/ocjw4yCJ8PD0Wr5
	 4To/MPiJqQpWByY1bjhnHToN0NNp+9mGdN629pmVHMlaDLKlgd2i9tI5TqF+j/iVB7
	 NzDWB8LMtIO7cATdZR7OT2+HZaQ0mgCouKgP1oZQwLShysm+hXY1VjCQoH9vhwo0Jz
	 8Xn37dcftZfgw==
Message-ID: <bba7f6da-82ee-46cc-bd8f-b0e3e027f5e2@kernel.org>
Date: Tue, 3 Nov 2026 20:23:23 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] lib: extract 32bit mul/div helpers from nios2 into
 GENERIC_LIB
To: Simon Schuster <schuster.simon@siemens-energy.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>
References: <20261103-nios2-remove-usage-of-libgcc-v2-0-5fabbedc49ec@siemens-energy.com>
 <20261103-nios2-remove-usage-of-libgcc-v2-1-5fabbedc49ec@siemens-energy.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20261103-nios2-remove-usage-of-libgcc-v2-1-5fabbedc49ec@siemens-energy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 05:30, Simon Schuster wrote:
> From: Dinh Nguyen <dinguyen@kernel.org>
>
> As suggested in 426c73b7-b4dc-4b68-9aa5-6145a13280bc@app.fastmail.com,
> the software emulation of div/mul/mod on 32-bit platforms from nios2
> might be of use to other smaller architectures as well when trying to
> drop their libgcc dependency (e.g., arc, openrisc).
> Therefore, extract and add them to lib/, guarded by respective
> CONFIG_GENERIC_LIB_* options.
>
> Symbols covered:
> s32 __mulsi3(s32 a, s32 b);
> s32 __divsi3(s32 a, s32 b);
> s32 __udivsi3(s32 a, s32 b);
> s32 __modsi3(s32 a, s32 b);
> s32 __umodsi3(s32 a, s32 b);
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> Co-developed-by: Simon Schuster <schuster.simon@siemens-energy.com>
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> ---
>   include/linux/libgcc.h | 10 ++++++
>   lib/Kconfig            | 15 ++++++++
>   lib/Makefile           | 10 ++++++
>   lib/divmod.c           | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/mulsi3.c           | 24 +++++++++++++
>   5 files changed, 153 insertions(+)
>
> diff --git a/include/linux/libgcc.h b/include/linux/libgcc.h
> index 0d68f9d6a6a7e..f5db35a9bc146 100644
> --- a/include/linux/libgcc.h
> +++ b/include/linux/libgcc.h
> @@ -7,6 +7,7 @@
>   #define __LIB_LIBGCC_H
>   
>   #include <asm/byteorder.h>
> +#include <linux/types.h>
>   
>   typedef int word_type __attribute__ ((mode (__word__)));
>   
> @@ -34,6 +35,15 @@ long long notrace __lshrdi3(long long u, word_type b);
>   long long notrace __muldi3(long long u, long long v);
>   word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b);
>   
> +/*
> + * Software 32-bit multiply for cores built without the hardware multiplier.
> + */
> +s32 notrace __mulsi3(s32 a, s32 b);
> +s32 notrace __divsi3(s32 a, s32 b);
> +s32 notrace __udivsi3(s32 a, s32 b);
> +s32 notrace __modsi3(s32 a, s32 b);
> +s32 notrace __umodsi3(s32 a, s32 b);

Shouldn't the 'u' prefixed functions have unsigned int args, result.
It seems libgcc/?divmod.c doesn't but ARC does have nint_t for those 
which is unsigned.
Nios it seems was removed from gcc?

>   #ifdef CONFIG_HAVE_ARCH_LIBGCC_H
>   #include <asm/libgcc.h>
>   #endif
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 1e42f5167c68b..16c2f2008b82c 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -611,6 +611,21 @@ config GENERIC_LIB_CMPDI2
>   config GENERIC_LIB_UCMPDI2
>   	bool
>   
> +config GENERIC_LIB_DIVSI3
> +	bool
> +
> +config GENERIC_LIB_MODSI3
> +	bool
> +
> +config GENERIC_LIB_UDIVSI3
> +	bool
> +
> +config GENERIC_LIB_UMODSI3
> +	bool
> +
> +config GENERIC_LIB_MULSI3
> +	bool
> +
>   config GENERIC_LIB_DEVMEM_IS_ALLOWED
>   	bool
>   
> diff --git a/lib/Makefile b/lib/Makefile
> index a2afe954805cb..352a012baecba 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -337,6 +337,16 @@ obj-$(CONFIG_GENERIC_LIB_LSHRDI3) += lshrdi3.o
>   obj-$(CONFIG_GENERIC_LIB_MULDI3) += muldi3.o
>   obj-$(CONFIG_GENERIC_LIB_CMPDI2) += cmpdi2.o
>   obj-$(CONFIG_GENERIC_LIB_UCMPDI2) += ucmpdi2.o
> +obj-$(CONFIG_GENERIC_LIB_MULSI3) += mulsi3.o
> +
> +divmod-needed := $(or \
> +	$(CONFIG_GENERIC_LIB_DIVSI3),\
> +	$(CONFIG_GENERIC_LIB_MODSI3),\
> +	$(CONFIG_GENERIC_LIB_UDIVSI3),\
> +	$(CONFIG_GENERIC_LIB_UMODSI3))
> +obj-$(divmod-needed) += divmod.o
> +
> +
>   obj-$(CONFIG_OBJAGG) += objagg.o
>   
>   # pldmfw library
> diff --git a/lib/divmod.c b/lib/divmod.c
> new file mode 100644
> index 0000000000000..cc1df6f9978ce
> --- /dev/null
> +++ b/lib/divmod.c
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright Altera Corporation (C) 2026. All rights reserved.
> + */
> +
> +#include <linux/libgcc.h>
> +#include <linux/export.h>
> +#include <linux/types.h>
> +
> +static u32 udivmodsi4(u32 num, u32 den, int modwanted)
> +{
> +	u32 bit = 1;
> +	u32 res = 0;
> +
> +	while (den < num && bit && !(den & (1U << 31))) {
> +		den <<= 1;
> +		bit <<= 1;
> +	}
> +
> +	while (bit) {
> +		if (num >= den) {
> +			num -= den;
> +			res |= bit;
> +		}
> +		bit >>= 1;
> +		den >>= 1;
> +	}
> +
> +	return modwanted ? num : res;
> +}
> +
> +
> +#ifdef CONFIG_GENERIC_LIB_DIVSI3
> +s32 __divsi3(s32 a, s32 b)
> +{
> +	int neg = 0;
> +	s32 res;
> +
> +	if (a < 0) {
> +		a = -a;
> +		neg = !neg;
> +	}
> +
> +	if (b < 0) {
> +		b = -b;
> +		neg = !neg;
> +	}
> +
> +	res = udivmodsi4(a, b, 0);
> +	if (neg)
> +		res = -res;
> +
> +	return res;
> +}
> +EXPORT_SYMBOL(__divsi3);
> +#endif
> +
> +#ifdef CONFIG_GENERIC_LIB_MODSI3
> +s32 __modsi3(s32 a, s32 b)
> +{
> +	int neg = 0;
> +	s32 res;
> +
> +	if (a < 0) {
> +		a = -a;
> +		neg = 1;
> +	}
> +
> +	if (b < 0)
> +		b = -b;
> +
> +	res = udivmodsi4(a, b, 1);
> +	if (neg)
> +		res = -res;
> +
> +	return res;
> +}
> +EXPORT_SYMBOL(__modsi3);
> +#endif
> +
> +#ifdef CONFIG_GENERIC_LIB_UDIVSI3
> +s32 __udivsi3(s32 a, s32 b)
> +{
> +	return udivmodsi4(a, b, 0);
> +}
> +EXPORT_SYMBOL(__udivsi3);
> +#endif
> +
> +#ifdef CONFIG_GENERIC_LIB_UMODSI3
> +s32 __umodsi3(s32 a, s32 b)
> +{
> +	return udivmodsi4(a, b, 1);
> +}
> +EXPORT_SYMBOL(__umodsi3);
> +#endif
> diff --git a/lib/mulsi3.c b/lib/mulsi3.c
> new file mode 100644
> index 0000000000000..6596a6598de05
> --- /dev/null
> +++ b/lib/mulsi3.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright Altera Corporation (C) 2026. All rights reserved.
> + */
> +
> +#include <linux/libgcc.h>
> +#include <linux/export.h>
> +#include <linux/types.h>
> +
> +s32 __mulsi3(s32 a, s32 b)
> +{
> +	s32 res = 0;
> +	u32 cnt = a;
> +
> +	while (cnt) {
> +		if (cnt & 1)
> +			res += b;
> +
> +		b <<= 1;
> +		cnt >>= 1;
> +	}
> +
> +	return res;
> +}
> +EXPORT_SYMBOL(__mulsi3);
>

