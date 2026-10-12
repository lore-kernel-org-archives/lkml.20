Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A63537C4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807134; cv=none; b=ulbhUKNVjcMaG1ziWE3DdvZCDwlx/76hNYehUp0tij7poB9vj4YUYYmVJGJds5ZE9OrERq+HOPtRoLR4FkL2CsHQpxWjF4dzM60kHUQUQRjBnCCsUaCHFpUjkDRZMieqG9p4SYKeSXq5Oco9Sc+isrUVaV4d7X5IYkkIGGvS8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807134; c=relaxed/simple;
	bh=gZRgToNouOpyB8HHNFf6dkFYXLHIJD0GpXaTx3+CTNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJXwe4WpP/ol84KyuGWxWpYKdrTYlmMqgLzkcIykxvhtfxP6JaG8iKC4vIaHRUeEPI39KHnnX26gZwZ/3ncoV/dLdkX0k66YJqiXMOJ6F7BssJH5YaDp+h4mjgm8RmIL2SPNpDiQHjtMdxP0QZaJX509m+3Tn/1nQVgzdjCIObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ln5BQaYz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ln5BQaYz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b02a2359aso1691809f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791807130; x=1792411930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HXzuiMJ36ZCZAWHYj2sp9+WXJHPzDv250qRANNhGqJQ=;
        b=Ln5BQaYzaNcVFi8RykG9XR4GVPrHweRhzsi1fG9fF7kP1m7wmHZDNzmDVe3KA2yA6V
         45NQeebh9dpT1WthTZ9eUUnoGIwS6hL+AX2lX/FhGiT9mwd6V6HuH9gvitL3ttTgti3x
         LurnUCh7MKUPa7yRNuMkSzpiwxuXoGsGDGmii3sQhanezWUVXePIqiibyph4Hrtj/c4Z
         6tRGv3gcLr9uqmCzIG1qyH0s2vhDjQ9tO8EgN/1obyzqpRzu8iuZZzX0yfQaH1lAg30B
         j1HvEFGDJHxwi9st8BC0DFrKYcSqHDqzuWYuYUPqOsuBZ30iD8VhC1Zq/y+Og5D3WKLM
         +Drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807130; x=1792411930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HXzuiMJ36ZCZAWHYj2sp9+WXJHPzDv250qRANNhGqJQ=;
        b=0unS8zNonAJed2kiVQShxQiy4x8T3eQXPNUJCuPTdeBtKGK787kEEbLQB/TVl9gmJI
         jZmWJ/Yb+rR/Z+JzjZ82AAeZf7n3NYuYRrwZbWDhQgTErAUnYzy4E8xPWBkkovlx/gEX
         ts2o7GXfleb5T0RxOCPcbRlnXwiZGhGnxRUZaK48amuOQsVzE2SuhA31UdxFgZjk+R+B
         yGEmKL4CcNpIpt9qT/9sk0xCvqvQ1/7W9jGk+vE4h3b0sfxpqPsRFOfn3VjdMDp8tj3A
         NovrxRTXLsydu4HB/6UOHdeAKQZGioA7Hm+6Byr9EDoMYTwjtgCAwkCVxcF7YpXzNLpr
         3rDg==
X-Forwarded-Encrypted: i=1; AKwUvByKya786sO31gy6Rjl0er+0t97L+J41eCGd1kpTptZDplUbq/QoBxhUHgfp9xoP5OwLO8v7/j0ndePSNx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiHZJ8f47XVwouMv+XD+JXuoXw1wkL5UOP9Z4vABku5WimtUpt
	m2z2ItpKEUOgTzxzykKO3/Gv8E5l56zQ18b3llal6Bc866NVFsCfpuqR
X-Gm-Gg: AYBFou1AvTE3GBAgEQKH529wIUDT9fAFtkw4lJB6QeGCSYrQa2XnR4Wez5olsaH+gsN
	m29ReaS31jywHOkBJRaaE/c1nuiajKeiXvABoGQRD0qPYj8bIA8WhdSpdv5EwWnlJiicafdy3hb
	HfdH5ZclShSu83uZe+uZ7NUHEPVn1qzkGbMyPScN/I7Bnrk8Ez6E1QhVlfo8ckF7MTfMBLk8Vxy
	g/a+Bs9wg3zZQu126vDSDo9UGI2RURLWtfTV9yGh2jjelEpul69iV+S2gw2CQKTGf7ZWF7wvmD7
	TE95gLQsQSliHe0OvmAy4tpWP3lO9DwRxDis1/PpQ8c9NKEsphS1JASvGN+FycShNQ4Gy61ZJ3x
	0iEjB+6EZ+jehLeKH8d6xdofvoYk2lRBcxi8CGpwtZJW6Lo1UigNgj4dsu+nn3rlRdXUBA0Uhpq
	CZaJgAxFP6mv26otOrGgoEUNsuBTkLOzk3GXX4T7HoQhkrCdWmXLax9bwMHeU=
X-Received: by 2002:a5d:5e88:0:b0:48d:bafc:a3f6 with SMTP id ffacd0b85a97d-48dbafca4a1mr17578909f8f.0.1791807130183;
        Mon, 12 Oct 2026 05:12:10 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac02cfsm18206754f8f.39.2026.10.12.05.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:12:09 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:12:07 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, surenb@google.com, 
	mhocko@suse.com
Subject: Re: [PATCH] selftests/mm: fix uffd move-pmd test crash on 64K base
 page systems
Message-ID: <aszHXQY7_lHOXKPp@gmail.com>
References: <20261011163527.95988-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011163527.95988-1-zenghui.yu@linux.dev>

On Mon, Oct 12, 2026 at 12:35:27AM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> uffd_move_pmd_test()/uffd_move_test_common() splits the test area into
> chunks of chunk_size and moves them one by one.  On arm64 with 64K base
> pages the chunk_size (read_pmd_pagesize()) is 512MB, which is larger than
> the whole 32MB (UFFD_TEST_MEM_SIZE) test area:
> 
>   step_count = nr_pages / (chunk_size / page_size) == 0
> 
> Because chunk_size > page_size, the test then aligns both areas up to
> 512MB, which points far outside of the 32MB mappings, and decrements
> step_count, which underflows to ULONG_MAX.  The verification loop then
> runs away and the first dereference of area_src faults with a SIGSEGV.
> 
> Skip the test when a single chunk cannot fit into the test area.
> 
> Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index ef9b3956bdcf..2a97ba1d6feb 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -1937,6 +1937,11 @@ uffd_move_test_common(uffd_global_test_opts_t *gopts,
>  
>  	args.gopts = gopts;
>  
> +	if (chunk_size > gopts->nr_pages * gopts->page_size) {
> +		uffd_test_skip("chunk size does not fit in the test area");
> +		return;
> +	}
> +
>  	/* Prevent source pages from being mapped more than once */
>  	if (madvise(gopts->area_src, gopts->nr_pages * gopts->page_size, MADV_DONTFORK))
>  		err("madvise(MADV_DONTFORK) failure");
> -- 
> 2.53.0
> 
> 

LGTM.

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
