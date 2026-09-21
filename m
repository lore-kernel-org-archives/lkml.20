Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51135012A2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017202; cv=none; b=JedTV3PhfuJ9GQf8LpwytznekhEbmTNh12xQUUglSRVvoBFpp9ZrojlxgQtme4GgF4C3MrYcYtPTHsia5rGUrb8jJgVYBGztOWgmjTaytZJDUAuOA4FiBEPbtQxmULrdJOaxlJaOcDfVTwLd6JFJDBw/QgTLeEJhtXmUiRxU3SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017202; c=relaxed/simple;
	bh=/ZkqrmpM4CxMXRQHWMajSNcKQyTTrfktt6Hn4TwwVsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REP+u19Tw9GJkgRWiPJFC5Kr8Rj8M2asqvirindjmCCGmzf4491abvL0bussNIXwFjQozR9W9ExUrC0olHGrXAJ5XMtaoi4D7yN3NVf7IN/U0K/JfqpOjZbqgsOWKgfmA1uBkIQIb30qeEcum7antqp3CS22we/OLG7RT0lRdr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akEmkLS7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akEmkLS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022971F000FF;
	Mon, 21 Sep 2026 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790017200;
	bh=BowEjN3QHu7cKrFM2s4WvhKI/ELZmnQl4hyHemGhzeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=akEmkLS7ZDQTu8lus8F9aGBXvZ+PK9spg1Au2o6EZRbCw2Hw9awxVv2IXe4he/g6H
	 O0WpKNKWzEzJtVnVJK1PDdyTE5P61zauMxJfsTJvY3TUgYj+trQhakmg4bH11KFZnu
	 FEICOjEawjwjjNk/khAhUy6+LffID6T30hh5ePDNQkbnV2LGRpbf8h2YzYDybssBBz
	 w1jUbXibQ+pkh6m6yhH5JT++qvuHb/fxKe6Dtek/VEB+ij0Mj1/dPLSbRNLURc7MPg
	 ZMxBOsKKOsCdx/Go6/W49CkMljZ5xb1jm6aIqhjAb2dzC9mhfjU1d8Oqe8oC2Kuev6
	 svSPcC3Q5p+mg==
Message-ID: <4de1dfb3-b349-4916-9fe0-6b9697583ac7@kernel.org>
Date: Mon, 21 Sep 2026 20:59:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm: selftests: Adjust the MADV_COLLAPSE uffd-minor
 selftests
To: James Houghton <jthoughton@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Yang Shi <shy828301@gmail.com>, zokeefe@google.com, hughd@google.com,
 Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260910023411.514987-1-jthoughton@google.com>
 <20260910023411.514987-2-jthoughton@google.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260910023411.514987-2-jthoughton@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 04:34, James Houghton wrote:
> The behavior of MADV_COLLAPSE with uffd-minor VMAs has changed:
> MADV_COLLAPSE will no longer install PTEs where none existed before.

Misleading: MADV_COLLAPSE installed a PMD not PTEs?

> Update the selftest to demonstrate this new behavior.
> 
> On an unpatched kernel, the test will hit "unexpected memory contents
> after collapse".
> 
> If the selftest is left unpatched but the kernel is patched, the
> selftest will SKIP when it gets EINVAL back from MADV_COLLAPSE.
> 
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 75 ++++++++++++++++++--
>  1 file changed, 68 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index ef9b3956bdcf..6f2360f9b75d 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -518,19 +518,34 @@ static void uffd_wp_fork_pin_with_event_test(uffd_global_test_opts_t *gopts, uff
>  	uffd_wp_fork_pin_test_common(gopts, args, true);
>  }
>  
> -static void check_memory_contents(uffd_global_test_opts_t *gopts, char *p)
> +static int __check_memory_contents(unsigned long offset,
> +				   unsigned long nr_pages,
> +				   uffd_global_test_opts_t *gopts,
> +				   char *p)

Two tabs look better ;)

>  {
>  	unsigned long i, j;
>  	uint8_t expected_byte;
>  
> -	for (i = 0; i < gopts->nr_pages; ++i) {
> +	if (nr_pages + offset < nr_pages)
> +		err("overflow in memory check");
> +	if (nr_pages + offset > gopts->nr_pages)
> +		err("out of bounds memory check");
> +
> +	for (i = offset; i < offset + nr_pages; ++i) {
>  		expected_byte = ~((uint8_t)(i % ((uint8_t)-1)));
>  		for (j = 0; j < gopts->page_size; j++) {
>  			uint8_t v = *(uint8_t *)(p + (i * gopts->page_size) + j);
>  			if (v != expected_byte)
> -				err("unexpected page contents");
> +				return 1;
>  		}
>  	}
> +
> +	return 0;
> +}
> +
> +static int check_memory_contents(uffd_global_test_opts_t *gopts, char *p)
> +{
> +	return __check_memory_contents(0, gopts->nr_pages, gopts, p);
>  }
>  
>  static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_collapse, bool test_wp)
> @@ -539,6 +554,8 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
>  	pthread_t uffd_mon;
>  	char c = '\0';
>  	struct uffd_args args = { 0 };
> +	unsigned long checked = 0;
> +	bool bad_contents;

Through in an empty line. Or better

struct uffd_args args = { .gopts = gopts };

>  
>  	/*
> @@ -564,24 +581,65 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
>  	if (pthread_create(&uffd_mon, NULL, uffd_poll_thread, &args))
>  		err("uffd_poll_thread create");
>  
> +	if (test_collapse) {
> +		/*
> +		 * Read just a single page and try collapsing. The collapse
> +		 * should either be rejected or be a no-op.
> +		 */
> +		if (__check_memory_contents(0, 1, gopts, gopts->area_dst_alias))
> +			err("unexpected memory contents before collapse");
> +
> +		/* MADV_COLLAPSE might return EINVAL for uffd-minor VMAs. */
> +		madvise(gopts->area_dst_alias, gopts->nr_pages * gopts->page_size,
> +			MADV_COLLAPSE);

Add an explicit check for expected errnos?

> +		/*
> +		 * If the above collapse mapped pages that were not explicitly
> +		 * CONTINUE'd, the below __check_memory_contents() will not
> +		 * fault on some pages, resulting in incorrect contents. The
> +		 * PTE for the first page may get retracted, so avoid checking
> +		 * that page, as we might take a second fault, flipping the
> +		 * contents a second time.
> +		 */
> +		checked = 1;

I'm not an expert on this code. But a trivial check to see whether there is
something in the page tables that shouldn't be there is through the help of
pagemap_is_populated().

Maybe that would help to simplify things, not sure.


-- 
Cheers,

David
