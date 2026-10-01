Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B36C3D47D9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840707; cv=none; b=sH1hZ2t1Dq96L9JMQmcs/81VuWdDDF0DzpkZ0Dus/v7f2tcKDoIPQKybQrgFkLkM7NGHHD2yrDnhHPMemTIW7oyhdxnK86fB94yAqetMUkVa6cjOryU84r9p3J7MQA5/RFC5ZUU3M+8wGl3D0xOkcAnJO9e5kuji2NGrlVkxI+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840707; c=relaxed/simple;
	bh=7eYnlGrZ3IyNm00U5/vcYvQ/U48ckWtuA2qiBWL25kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTXatGqFqpK1ovoIxiCJeXziKAmdRAz2XAIo3NRaj5Zgyv0/uHCMTcVHKZg1GV2aXpIl8odV7N/PilO9jXpFqV1c2iVuBCGIQAM1CY5XWhZBLERBjabkTDdDUwbs5NKiTWd1sPzWghs9DfUbzqvx/1Kt6YY2wUFmNP7kSKeX/Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fc/RrrcG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fc/RrrcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825DF1F000FF;
	Thu,  1 Oct 2026 07:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790840705;
	bh=rouwnkeWKXgqLu3nIuP1Q7H1nwY+WP7FAWkxJsoS/qg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Fc/RrrcGDCUxYlfeihZzaqYQwrGJNeYiTfH/n7zDP/k7lfTYXQvLvLgLBtuzianPj
	 S5Jop75QzJ0tKyT/43Iz2gxV3m6OCCGAzisSYTAiAJRI70aVq/kkIB48moj723X/EZ
	 5gibgbmcLLqEMQkYdKOhKb9SAqCrv4T5DGFePJhCnQKXDYJUcfPOgc6DJAu/hGQ4fW
	 euAbzkkRsyUKDpAj/AZj2W8lDJdSXr2Lzn/zyZeXgzqAGg3uoJWpowBu1Ojye3wYnP
	 pM3n+6Z8YPn23nW7qZXDl+XLfS94oV8Lll0PWTf4ITnFLCyDRPRhwec7vTZeY/0BbI
	 GyVZqxDDf4Zng==
Message-ID: <2f7a38e0-1e85-4983-9bc5-adea49f44cbc@kernel.org>
Date: Thu, 1 Oct 2026 09:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: Add KUNIT test for ptval_bytes_to_hex_str()
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
References: <20260929120530.3394073-1-anshuman.khandual@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260929120530.3394073-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/29/26 14:05, Anshuman Khandual wrote:
> Add KUnit tests for ptval_bytes_to_hex_str() to verify conversion of 32-bit
> 64-bit, and 128-bit (when supported) page table entry values into printable
> hexadecimal strings.
> 
> Add a new PTVAL_HEX_STR_KUNIT_TEST option to enable the tests.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v7.3-rc5 after the following series
> 
> https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/
> 
>  mm/Kconfig                        |  11 +++
>  mm/Makefile                       |   1 +
>  mm/tests/ptval_hex_string_kunit.c | 111 ++++++++++++++++++++++++++++++
>  3 files changed, 123 insertions(+)
>  create mode 100644 mm/tests/ptval_hex_string_kunit.c
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 604c58199acbf..f68bf26b98c83 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1511,6 +1511,17 @@ config LAZY_MMU_MODE_KUNIT_TEST
>  
>  	  If unsure, say N.
>  
> +config PTVAL_HEX_STR_KUNIT_TEST
> +	bool "KUnit tests for pgtable entry string conversion" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Enable this option to check that ptval_bytes_to_hex_str() is able
> +	  convert given pgtable entry value in bytes into hex strings which
> +	  could be printed.
> +
> +	  If unsure, say N.

That's a bit fine grained :)

Could we somehow pack this under another existing / more generic test? We don't
want one new test for every new function :)

An alternative would be to use mm/debug_vm_pgtable.c to just run 3 tests at
runtime as well.

> +
>  source "mm/damon/Kconfig"
>  
>  endmenu
> diff --git a/mm/Makefile b/mm/Makefile
> index e7245cb88c665..d08b8bd01917b 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -147,4 +147,5 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
>  obj-$(CONFIG_EXECMEM) += execmem.o
>  obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
>  obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
> +obj-$(CONFIG_PTVAL_HEX_STR_KUNIT_TEST) += tests/ptval_hex_string_kunit.o
>  obj-$(CONFIG_MEM_ALLOC_PROFILING) += alloc_tag.o
> diff --git a/mm/tests/ptval_hex_string_kunit.c b/mm/tests/ptval_hex_string_kunit.c
> new file mode 100644
> index 0000000000000..45c203cfb49ae
> --- /dev/null
> +++ b/mm/tests/ptval_hex_string_kunit.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <kunit/test.h>
> +#include <linux/pgtable.h>
> +
> +struct ptval_str {
> +	u64 val;
> +	const char *str;
> +};
> +
> +static struct ptval_str ptval_u32_tests[] = {
> +	{ .val = 0x1234abcd,	.str = "1234abcd"},

Isn't a single test like this enough. Why would we need the other ones?

So I think this could all get condensed quite a bit (including the test
functions, a single one should be sufficient if we really only end up with 3 tests).

-- 
Cheers,

David
