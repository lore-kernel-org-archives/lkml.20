Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D32F492E42
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974097; cv=none; b=i1niGw9y9NB1bh04Q8gYrKXzg5T9BOWCS1O8YoaZKEcb+b++xqhDipD/RxRP13HE7fR+4PwjCmHhYkbjVXo+x/mgf1aGKWZC5Ti8nwd+DN2hGQpPhPF9POBuRpDBQq8s+nPQlNTeP/uo/nDZEvxHDfZJi6sRPOh0wp81/n3zV8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974097; c=relaxed/simple;
	bh=jX36b/0m50lPNbdXFsUJPDjGHtKBzQtOZC65XB8IpLs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=G92kPxmVvVgU517fq/2+/qYZoLf87Eg1B4wbq2Jiq4ytQ1oieSgC65lJLzkRXPXdg1EQ8MKHtpovDh1NpBcC7JMnMF8H0yb+H5F2WAiJlqfh2u+7uZl6o6fTt8/eJPqi3Ka0kkCa6FPeCu1yX4coMuDxpWxjXmA/XbGBY96NDxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmB7O9lr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmB7O9lr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF2B1F000FF;
	Wed,  9 Sep 2026 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974095;
	bh=b3vZjZsk+GN++tvViwRlo0oHYVyDxomGvHO319w0GOQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nmB7O9lruhIGjS1BiDxF6ZJyB07xHi0GGmJuIWVfaEcmIhD/hXeiuTRQkzVUgS3tN
	 OK9XESiMepItDGhH6AG4gkdIYIqREa+3xy0IsPhMu52Zh0+A/oSpw5dznMz2ju+Die
	 C6ktbkHMvAuQUyOOS6KhNjaRRzDsUlYtziUHBAbSUqttIApmYOoL3PcWHmPpZbomz7
	 bKjmWE5YczMdZOF4h+6Zrz09AzuUJwm/Av0kANlBd2JrFqYy3Qz3XOTMp/sbwxlpuE
	 GRm93WOrysD2J1RDWmtQv4JzahkIavyGPEn04IxBPSJDHIZoZc+hKAovvelR7A289s
	 Yu2TluvX+7FPg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] memblock tests: model the low allocation limit
 within dummy memory
From: Mike Rapoport <rppt@kernel.org>
To: Tianyi Chen <hi@tychen.cc>
Cc: rppt@kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <178874362959.1415955.9346611507889046159.memblock-v2-1@tychen.cc>
References: <20260906144011.848898-1-hi@tychen.cc>
 <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc>
 <178874362959.1415955.9346611507889046159.memblock-v2-1@tychen.cc>
Date: Wed, 09 Sep 2026 20:14:50 +0300
Message-Id: <178897409075.1489479.13793114752511118505.b4-review@b4>
X-Mailer: b4 0.17-dev

Hi,

> The simulator represents physical addresses using the address of its
> allocated buffer. That buffer can lie above the default
> ARCH_LOW_ADDRESS_LIMIT, preventing meaningful memblock_alloc_low()
> tests.
> 
> Use the architecture override in asm/dma.h to place the limit halfway
> through the MEM_SIZE region registered by setup_memblock(). This leaves
> registered memory on both sides of the limit. PHYS_MEM_SIZE describes
> the larger backing allocation, rather than the registered region.
> Resolve the limit after allocating the buffer. The production allocator
> is unchanged.
> 
> Assisted-by: Codex:GPT-6
> Signed-off-by: Tianyi Chen <hi@tychen.cc>
>
> diff --git a/tools/testing/memblock/asm/dma.h b/tools/testing/memblock/asm/dma.h
> index 13ff8e5d22ef6..6607408dcf25d 100644
> --- a/tools/testing/memblock/asm/dma.h
> +++ b/tools/testing/memblock/asm/dma.h
> @@ -2,4 +2,10 @@
>  #ifndef _TOOLS_DMA_H
>  #define _TOOLS_DMA_H
>  
> +#include <linux/types.h>
> +
> +phys_addr_t dummy_physical_memory_low_limit(void);
> +
> +#define ARCH_LOW_ADDRESS_LIMIT dummy_physical_memory_low_limit()
> +
>  #endif
> diff --git a/tools/testing/memblock/tests/common.c b/tools/testing/memblock/tests/common.c
> index 3250c8e5124b3..17b95af216b2c 100644
> --- a/tools/testing/memblock/tests/common.c
> +++ b/tools/testing/memblock/tests/common.c
> @@ -118,6 +118,12 @@ phys_addr_t dummy_physical_memory_base(void)
>  	return (phys_addr_t)memory_block.base;
>  }
>  
> +phys_addr_t dummy_physical_memory_low_limit(void)
> +{
> +	/* Split the MEM_SIZE region registered by setup_memblock(), not the buffer. */

The comment should not address the review comments ;-)

It should state the universal truth, like "low limit is half of the
memory registered with setup_memblock()"

-- 
Sincerely yours,
Mike.

