Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734591;
	b=qh3W7zysjo7QH6/d35WB67YSwVCIYRmsTT+wzp63dOIRJ4qF+quOuExQtK6RLXlgeX34
	 r/GQuWkM7PL4QJlQRPL6rHb/30vN3dXGJNOCuEpo0YL0+yVxB0Ow1Y/0tqJLSdzvMH4ns
	 8USFkfCLlhH2Ie9FNjYfetDoxtZ+ksBiPaC04F9Wc64f9koIKEd8Ljr91+fBGaBtBpwa2
	 ipIG0l+SEzhfX+dtJWuUdHpJ6JGffEg2w5s54MkfvBsKJk8ZcPkJ46J8v9gvu6DoVwwlJ
	 lQPb2h7jr3WSrPONZzLSywEctjiS0rZUqoyvGGgIpXAF4LQGOmU3mZ9sLOtmoCIJdQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uq8YUdEumE4c58BERrSl6Gv5Qqe1I7TfJJee/dW1I8E=;
	b=qhz29BBNO6oLinml2QvjlpWT7SXPVw28EyYlkkZKe6RQmfQHwoLpEg992jjS6WMMiAo6
	 Ygjo9aHvlJpgQYAdNZdGuVcOt4YsQUr4HQhBO+PkRrxugLRUI9WX7Q4I6I9DpJ4ljWl9Z
	 NhiC/9UAVyBHW9ccKRS1R7qqaE86SwOhQLhTJ1yLmM+PGDyQZ5IbGP3ATbDJzAMYB4v5D
	 UJL8jRlUWVpGknM/Ys0BNazcQbkNQ5QWMpJbTKxbv7aQiu3gPJx9G/NBLe1HPFty8Cuje
	 Tk1Gy8scuJirzh8eXU47OKG7j5fCdAei1jjXeiBXOkmHl+Loaj6OyPw0JW+4V1gR/Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YMW4bIJV;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADD9606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADD9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YMW4bIJV
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-930c0f9c1b1so464138685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793734590; x=1794339390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uq8YUdEumE4c58BERrSl6Gv5Qqe1I7TfJJee/dW1I8E=;
        b=YMW4bIJVKmfZNUHQkJBFPSiXdQPboccJarQXWNJzHuIeQFVmp3tDQVORVYvJhFFPmQ
         /OWUpRRQPUEwdVF++8yaDOdDua/wZ6JHhu0LVhI6Ruhe6Vcf9r2Qr0zVNOipsXfAmqf8
         XA0q3tNuhyld4TPZ+Wg0wzf+H5/RX2Iw3KiAnUze1F3FG3WrQT3bXlR7RNEMuBPy4DTs
         NLfKdlvlIlnSF4QE4vS4oHRUSQ2AqYLVK0Y1IhFtzBD+B2TLGyQ+t6QyclvjsPEtvr3s
         aoGcSpiE0eAxPQFf1bfPcdtgcf0lQo6eL3E/2jOzXrhRZlIUzb+5jG8ffUGF2ZROi9lw
         HAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734590; x=1794339390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uq8YUdEumE4c58BERrSl6Gv5Qqe1I7TfJJee/dW1I8E=;
        b=n/q3xEZNMrQXQpqCFWQ8Fv+b6n+ZngcyMNEpU8/mN4mpgNo7RWhg+2fxye0oeatwKJ
         QmTKvRN58fyfXaXamjJbLzT56rfg9FNBFpX9Vr41E8eqNySCgxWQgCbbBy4jGpkaESdc
         GN/HKI0h3RbRGMG3d3d785yy7zg9KB064sfSyvp8ZLtDVqb2fWw5c7jhiTC31RnujCf1
         quoRiemiRd6iWo8OlPgq7qgzV7edgA1zaL9Qbge5juIOU/usmDBYuQTUdox7V80BIOWp
         gRlhnkPeLvUgwl1fFqDi/NR0nyqGZ1Nu2kiuWXUQquSXhlUKlGiTmnoj15wk5jfcMk/M
         F7XQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2xQbr/eYQJMrvT803CB3/SOGpJC0zBhX+nLa2bevW2UiKo3Bj3+p9Y1Bbr+1ueyvI3E0jT/lYL1fUOyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dUQF58vy96ykW2CW741Xu82Zz6c0COv/OlyvwnIe0WiWCmwue
	PtY5JeL6zbxsBad9zvGEG3pybMIYdNtRw2/rorZ2j7Ubuu2ChMvg175GCfmnkceNbA0=
X-Gm-Gg: AYBFou0xp6OvrkcIIVQRS8qXmg8HP/3b5jVBv3JbADF6UsVUOrq6/Ym3KPhOSnW2R02
	+oBKsTIkdMja3KDQBZnjs/u1RZbzyoTcsdFa2mI84DSlBHsspsiBgxbeo3ay9exLTjqWnIRvEHu
	xbM2KBqJ4WIDdN4cvw2YWf8X0aFksrOU035zYUAKfJxEOcMb8cQMAyckqO0m8Pvl3vQGuI80r/A
	zSB860rXcaVAmum4H13omkC5ZStTgRvh5k1hxw0MzGlXDOy20UFcQ4ZYEgGn+ROvrdYlISgEwMO
	dfJxhDsvbZFzhMXt+cjd1X32791icuBJ3z32jzUxtSrM1ur7EE5f9vn4UoXCBro/Lp4HuqXwqOl
	YDy7pE3JpW/F7+DSTR6suDDHeNNQfUv1EqpBbgh2JGQoAYePoaBxZIagg9Esb+xk9Doq6/zI8mW
	uhTaeGYQQUR3corz2f+ZvYkBD1YWp6Ds0ZIVz7Obf1xvUuviarTFe3tku03S+sFDJkYbB6SxJYl
	Yf3VQuEcd73H+3XKufSA6ghjGHnrjNh1d3USpUtOP7OUyLKK71l9BLc9IqVbuFJxykwwhNjn6/c
	mdaG6SERnMRvZ1QUpi/TFuv4IvuuPRFLHGTeHOUL6Dr7jD8OW7o5G30SD2ArRigb3LqWNyANf+y
	fOngUN7nmOg==
X-Received: by 2002:a05:620a:8013:b0:93c:2726:77ec with SMTP id af79cd13be357-944214cba5emr2106461085a.5.1793734590511;
        Tue, 03 Nov 2026 11:36:30 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4852ba3sm9839685a.31.2026.11.03.11.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:36:30 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOKJ3-0000000Dn4k-1aHz;
	Tue, 03 Nov 2026 15:36:29 -0400
Date: Tue, 3 Nov 2026 15:36:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Kevin Tian <kevin.tian@intel.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jean-Philippe Brucker <jpb@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iommufd: copy to and from folios in batch_rw()
Message-ID: <20261103193629.GO3889730@ziepe.ca>
References: <20261031-iommufd-folio-dirty-v1-0-2cef66d2d6d1@columbia.edu>
 <20261031-iommufd-folio-dirty-v1-2-2cef66d2d6d1@columbia.edu>
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
In-Reply-To: <20261031-iommufd-folio-dirty-v1-2-2cef66d2d6d1@columbia.edu>

On Sat, Oct 31, 2026 at 04:33:19PM -0400, Tal Zussman wrote:
> batch_rw() copies one page at a time and, for writes, dirties each page
> with set_page_dirty_lock(). Walk the pfn batch a folio at a time
> instead, copying with memcpy_to_folio() and memcpy_from_folio() and
> marking each folio dirty once. Convert the single-page copy in
> iopt_pages_rw_page() to the same helper.
> 
> iopt_pages_rw_access() rejects dmabuf pages, so only pinned user memory
> and memfd pages can reach batch_rw(), and those are always folios.
> 
> memcpy_to_folio() also flushes the dcache after the write, which the
> open-coded memcpy() didn't.
> 
> This removes the last use of set_page_dirty_lock() in iommufd.
> 
> With ftrace timing iopt_pages_rw_slow() through the mock driver on a
> non-debug kernel, slow-path writes to THP-backed pages drop from ~1310 to
> ~930 ns/page (now the same cost as a read), and writes to 4K folios drop
> ~9%.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  drivers/iommu/iommufd/pages.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)

This looks reasonable to me

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
