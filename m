Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775517;
	b=ZtIjHtLJBjWcKxi0Hx+WGYohM+nogwkptxR8AxotAiY/PZJcOv7gerMl/Q2+ajGIyfJD
	 yPheexHDaaNSxyi2FK4iXqVMvF+tr1RUxdWDjYJtv+gzRkYCn6BRytEg9DWPwILbcv9jN
	 B94rjCQWBf+jNZq+JILTao85XBUAZAbfdzERphKk9XgEqZsVwiNV7nGV8/yMuq9SO86rx
	 KN5enRlWObUtueyI/3MZ9hnYpxTfz4Id8u7OqHy4noH5u2Ww+/OemMPRAq9Adq0zbfk9n
	 eNtglv2BaEs44olQ6MR63iqqkIXvCbcwzR4Qu1dV0HMnWF43XxAm094VYDaNbjpeq1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775517;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=MTTA+YbrbBMm9z50z75gsdicdlYW7qnqLdRemdmWzl4=;
	b=i7B/98Ib9OHe0z4UamULxDBJGLX+6Wcb6Ju2v5LQwLkPdV9jwcalG0OxtgflZa5MYUY5
	 0KovfxH2buTChSJmq+g/znU3Rs53UtUPrRGnJhQjFKsF0fBSmURnQh+klJY0u/iuH5Tc4
	 YJZrJ6tT+MybxjhiQF34Iy01gEnKVjSosrgWtBq0qkcFy36CcaXhanedQOcK1hZ6N+Rlj
	 NIPSn8VdB294geDYSh8hGfwj6/ZgUt4LMyn6PLEZsHXCiJvbEw81a+60LXpUpv6TK2orv
	 lWaM6878NV/wKA81BRXT8OK1F/n8pExMc59OQVgMvPrP1AINNQy41KxdnIhCtbvjQWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=oLAMtts9;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B3A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=oLAMtts9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792774952;
	bh=j3lnnu+XwJ3IxgiQhhhYJRK4pj38bqA5bxE8+qnusw4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oLAMtts9sWUtxc9TQq6u5hWDNCmmVutWKxG6+JOk28oNqzJJQu+zjTjPyYIRq2CCx
	 zmttuwcM4oIMy3Lo1batINoIfXpF8n1NfIBOB/AT9ZbZja46SOPFkkDVcdr6ww9VaG
	 dUz+80CNt++Md3IzWWxo/7SoIauw8QyW4e3e4M0A=
Received: by gentwo.org (Postfix, from userid 1007)
	id 66FE2406D3; Fri, 23 Oct 2026 10:02:32 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 64795401AE;
	Fri, 23 Oct 2026 10:02:32 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:02:32 -0700 (PDT)
From: Shubhang <sh@gentwo.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Uladzislau Rezki <urezki@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
    Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
    "Christoph Lameter (Ampere)" <cl@gentwo.org>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: reject overflowing vm_map_ram page counts
In-Reply-To: <y5yuwnmvq5nouoitqj6lloz6hepha6cf6vmh42rer2zhgv32au@vbvr3ohn24tf>
Message-ID: <a8931158-460a-9ec0-28d2-44f3a4956153@gentwo.org>
References: <20261022-vmalloc-reject-overflow-v1-1-5fde0042ffb9@gentwo.org> <y5yuwnmvq5nouoitqj6lloz6hepha6cf6vmh42rer2zhgv32au@vbvr3ohn24tf>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Anshuman,

On Fri, 23 Oct 2026, Anshuman Khandual wrote:

>>
>> +	if (count > ULONG_MAX >> PAGE_SHIFT)
>> +		return NULL;
>
> Could vm_map_ram() ever be called with such a large number as count ?
>

Yes. I checked the direct callers while respinning this.

udmabuf can build such a count from userspace-provided, page-aligned
ranges. It stores the accumulated count in ubuf->pagecount, and its
DMA-BUF vmap callback passes that value directly to vm_map_ram():

 	vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);

On a 32-bit PAE kernel, the default udmabuf size limit permits a count
in the overflowing range, subject to sufficient backing memory and
successful pinning. For example, 1048577 pages with 4 KiB pages is a
4 GiB + 4 KiB udmabuf request.

There is also an in-tree import route which invokes this callback.
DRM drivers using DRM_GEM_DMA_DRIVER_OPS_VMAP call dma_buf_vmap() while 
importing DMA-BUF through PRIME, which reaches udmabuf's vmap operation.

The same overflowing conversion makes udmabuf advertise a one-page DMA-BUF 
size and build an SG table with a one-page byte length. Therefore, this 
establishes that vm_map_ram() can receive a userspace-derived overflowing 
count. However, I have not found a current in-tree importer that then 
accesses the returned mapping as if it covered all 1048577 pages.

The v2 using check_mul_overflow() is here:

https://lore.kernel.org/lkml/20261022-vmalloc-reject-overflow-v2-1-0db7a20c53f0@gentwo.org/

Regards,
Shubhang Kaushik
