Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788582;
	b=YkqGYgBNdHdWlrJNW8B68EX4zoxGP5ieeOmFV6zvkFvUVH1MMnPiucvmXAWAT2zojJrb
	 pr0PDw4fgbQVBNx3DZ4zcp+aRgw1zaUA3hEUsZuCWInvOButisLBNSkynTZZnlpfj5cTt
	 ymKXyIc67V+wk+ZilrJtQHvUL7dNMgaiT+b+Ve6e6xgXruJzY/+BMxtCjqGbnbWnvrnga
	 CkJL9JNhzScakkZu1yxTB28yopsZD6RLQp4K/+Vp3RzQTTNFdC81igYul02eBdJknH5nk
	 O3pCak4ciwQFUAjmDiVWx8v4fM2EmWDXjR2Ovt2dJ+juhLUhQhvLqjrfiK+32p/QOkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788582;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZDTsHuiAv0ENOV6p7ACwagdR05GZdX+BTzzukNMsj1g=;
	b=SCC/0LGIK1+4Qv8qt7YLj4/y1CYsDss2khW+YuOUJ40zfb5zZTZlqyHFtJsDH0Kku0sZ
	 CAT1xVPdUaPfOpDOmKXPT0jxJnKJEhmVfHxGmMPBAvHBMKLFmMPk45ARssOi5D9urjQd8
	 NpgJBApqNCZVWsftlGPcuOmqtj3MNUM9egJ5xsjMqU7+ZHsWX139zx77ObepQ/3T8Gw/Q
	 BwbW4icqPJ9VOIoJMhCA9lnHtZH8cC5zPIS1DjEbxT/Q5Rs9cmSd4qcjNNG6qKywVIGB8
	 lnqV9P0VK78WmD3gJoyabms7zZXFnSPhhMtX4KC6FAzXIBqIbnPa75PxBGt3Yv1pBvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+8bQFjL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3F0606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+8bQFjL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E025E1F000C1;
	Wed,  4 Nov 2026 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788581;
	bh=ZDTsHuiAv0ENOV6p7ACwagdR05GZdX+BTzzukNMsj1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G+8bQFjL7lxx+pyw4QKAW5rgfbkD1o90fVKkvCGhJPsO6ytTD6MJ3dfMybU+IGw8w
	 3PoetD7C7O8HEFJFRa61BnUjgzvQWp4zWSKZzIPuGvUtvppVH2JtGHgKXfy4ecZ+iZ
	 n7DAyc+/eJvurYZVEQ8VcBS/4dC9PrrkcaE/09xs93zv+EN9VDqDEYXKqBS3iq+6+N
	 EcU7/ZApz7ubZFjimkX7Vz5u6biu5H2Hn3cgTwfm9O8j0ASJI/1M8gtN1LbG32r636
	 IkZ+N0qxtbkd/ngXQ+pp7c3lhhOz/e3uaGyhMe/c0hv5rHKs/KiNp3s7gtmwXNqqud
	 p1CyW+z+yRW7g==
Date: Wed, 4 Nov 2026 11:36:14 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Lance Yang <lance.yang@linux.dev>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/12] mm: hugetlb_vmemmap: move
 alloc_vmemmap_page_list() next to its free helper
Message-ID: <ausKntv_nc_ggUNY@localhost.localdomain>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-9-songmuchun@bytedance.com>
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
In-Reply-To: <20261104023510.260766-9-songmuchun@bytedance.com>

On Wed, Nov 04, 2026 at 10:35:06AM +0800, Muchun Song wrote:
> Keep alloc_vmemmap_page_list() together with
> free_vmemmap_page_list(). This also allows the folio-oriented
> optimization helper introduced in a subsequent change to reuse the
> allocator without a forward declaration.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

 

-- 
Oscar Salvador
SUSE Labs
