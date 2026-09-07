Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694553BBFCF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793067; cv=none; b=nNKr1QGR0JSotyGj46pzD/gX7+83ENaCtwkJU0jUZitukBGjgqEQ8a8pFB85IIoTNqxaEDtL7s1Z16VIoggNQV5lS/cL0PfRkulWKXUJbwAAYBhu5p2doKre4xvxQKA1ASy9tTaGuEXsF3ex7NgdjUH+WXbAa/Yxo0QxjnTvvHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793067; c=relaxed/simple;
	bh=gbehEEdOEBuU3HHxuQ6NSXa8DS14VTlpX5880xHhcCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbaoCUSjpvpZXbIY1N3lDBjohzWJe+8HkMvmylb2SAl9koDqkC/aFzG6GXccDgPWfjoV3ZNBpAiQQ19hpkHJ+ic6Q/qOn/pYGJTjWgGhlreyd0a1xirfjD13X1lgYTRIINN9qNSk1UYj6hcv5kLOSy26WM8nns3uRu2Mv0t9cOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Oe+bokNH; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Oe+bokNH"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9399daa3d43so125502485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788793064; x=1789397864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKmfltuahHibleolgFqoLkoM/YklChy1LcLNAOhU3Vo=;
        b=Oe+bokNHNe/HImO/aGgXCxRhqjQPHB13UpTfCeBV+/tmCki99R6DiFxw7plKkLuB9A
         LiGcTKwlViMCe5dBh/zHvvqd37Ch7enS336pveukKQH3DNM4Nk3v5p4tPBa/+jKFsosn
         5hugnxuLKQ+h24mwAEzWY63nv1CqzETrdZlJspPh4LspkzFmiEI0xqybV9Ed9F6e3YOx
         H5q3cCaw52waPs54kVKKhJ9U/3BflkuStFbltvgQl8nqhprSqMqpOZGTnmZAg6C/nAhR
         teFFWcmhwfEVecpKzoALShR5CNYK1vxfPO6jUGIr5yNq4OD0XysxdMGSbqj9QoG6yr/B
         9K1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793064; x=1789397864;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKmfltuahHibleolgFqoLkoM/YklChy1LcLNAOhU3Vo=;
        b=bd5HpsfMRcq36EiV0rOAofI3O2gZKqIA1Hf5rGHZsUy2SxCnjayK/CFdRNL/wJIo3/
         eCGdq3q4VoeuSHBtixp9QvWxkIuTDxBoUvgl3xXv4E704nlujaqFdrVY50ESDKo2ubJH
         1gri1JD+BeJy1YntXLcGAZpxV+icWWE4hG8vc5uyiRb8/ia4vxa+anKYkwh9pCKl1ShS
         SHF/hAgAGe9t7BVcizeO/oK4omTS6XRnluHecu9HuJipis9Ful4e0E/MQ6/G9AIVVv/Q
         2NtfZ5/2Mw+Genm4Ykp6b0s61+UYUzFIoVbsz9TJHyxRlfwROwvVE7cJ2hvwiV4n19vN
         4uwA==
X-Forwarded-Encrypted: i=1; AKwUvBxOpxsAigIs7Whks0EOGJrD1ZsE74IkbPKrszmJk+h7nNE08w7TaKorn/0Qg5rCVFtYGtCP1IoVpU64e6g=@vger.kernel.org
X-Gm-Message-State: AFuF++kuFYbnX1hjQ86xta3acPjy0hgU8SnZAlNYyuacFtPBQbdJNhy2
	igBAhbHbD/hPw4pPZ4F/bPjP2NKcdqV7RnE9U/NNyxPHpr1PRxcDhQDo0JWfHRVprWs=
X-Gm-Gg: AYBFou2G5vQniUY4fivDcaoJhx05owCU+IcS0oCSFK1i3R4pl8IY2YWzVMf87EOUZ+l
	ciOJeRWOQxvyMfJT4zrrHiOoj6SSu1LmpE0LBzN9UY28ncBzvpfPg/Or3sNbUt/J2s0C3TMWeK/
	MeyDEBLycwQy3uAXjU6e53EN04Oa1HgKQpuNpQpvoNRrLo8YanJpDQjK/a1I71z+MJWBn82scDl
	AVL476YdiKA2cfUKvQa055FWRZsaZxhyeHrBlwGj/8pqd3rYTREQFx3vJc9Fm3jewckDgxB9n6n
	H/OdmLj1ViSHumAfu4LgTU3d3VjVjgKMQ1fIQvj8VaMN1xKR9FaqQlXj6yLdpoVJKfCS9rLOQor
	PKZUGQJtBPiuuWniaSOT9x+Fx/lppaShzZYGjXToqbGQcabL+P/7XRS3Fyod76SioUGsEaVz8jY
	hTlmJ8YqiFi3Hm1PrxS7Bzri2EIm7/0kDvjxafM6TLolfen5tKDx5UbbMERbCEy27Vg3INFIIbi
	/BShgP71I+vUu1nfiy7MEJuaS6T67eXFwJMJznU9TXSgpi57qbzS/E=
X-Received: by 2002:a05:620a:468f:b0:939:6db3:6cad with SMTP id af79cd13be357-9398035a913mr2267757785a.12.1788793064205;
        Mon, 07 Sep 2026 07:57:44 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb380f8sm905137785a.23.2026.09.07.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:57:43 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:57:42 -0400
From: Gregory Price <gourry@gourry.net>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH] selftests/mm: fix size truncation in pagemap_ioctl test
Message-ID: <ap7Qza32A-MzxBU3@gourry-fedora-PF4VCD3F>
References: <20260907135613.68692-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907135613.68692-1-zenghui.yu@linux.dev>

On Mon, Sep 07, 2026 at 09:56:13PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> On arm64 with 64K base pages, the huge page size is 512 MiB, and
> hpage_unit_tests() builds a 5 GiB range (10 * 512 MiB) for its tests.  This
> exceeds the range of the int size parameters of gethugepage(),
> wp_addr_range() and pagemap_ioctl().  The implicit truncation to 1 GiB
> makes gethugepage() allocate a too small buffer, while the callers keep
> operating on the original 5 GiB range, resulting in spurious failures or
> SIGSEGV.
> 
> Change those size parameters to size_t.
> 
> Fixes: 46fd75d4a3c9 ("selftests: mm: add pagemap ioctl tests")
> Assisted-by: GLM-5.3 OpenCode
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index eadc7159ca5b..48cbea3a33c9 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -44,7 +44,7 @@ const char *progname;
>  
>  #define LEN(region)	((region.end - region.start)/page_size)
>  
> -static long pagemap_ioctl(void *start, int len, void *vec, int vec_len, int flag,
> +static long pagemap_ioctl(void *start, size_t len, void *vec, int vec_len, int flag,
>  			  int max_pages, long required_mask, long anyof_mask, long excluded_mask,
>  			  long return_mask)
>  {
> @@ -152,7 +152,7 @@ int wp_free(void *addr, long size)
>  	return 0;
>  }
>  
> -int wp_addr_range(void *addr, int size)
> +int wp_addr_range(void *addr, size_t size)
>  {
>  	if (pagemap_ioctl(addr, size, NULL, 0,
>  			  PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
> @@ -787,7 +787,7 @@ int base_tests(char *prefix, char *mem, unsigned long long mem_size, int skip)
>  	return 0;
>  }
>  
> -void *gethugepage(int map_size)
> +void *gethugepage(size_t map_size)
>  {
>  	int ret;
>  	char *map;
> -- 
> 2.53.0
> 
