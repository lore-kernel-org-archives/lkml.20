Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B837C57980A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882983; cv=none; b=rwOGKZYUBjGW15uYqa2BK3ua8fld9kjGflKlIPEfLF3znzlnwJtfSE3b2gbvSAl+DMRfexq11Sw5sBSvyWklsOFKkzGCeGXMTLoOta8toL6gxSFhnKOA35fP1jSQ9La7x6HVZ/62DSf+mbpaCEu3cPCBAxW2uf1b8QTF3OzgdzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882983; c=relaxed/simple;
	bh=wBdmAizSj2gtwIeAxyghpefUHJbzkJP8OIm1BpULIMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/JvzXqVHpdLzbpMkJ9ifczq3Uqz7Sio6BXPe2VTAPSLoLWwvDdKxMccf5QzsXA7OC+1c7lcylSewJy9pQIEv4yJQWlYSCD868qhucgOUvrbBeTm21zDme5oAPU2rNbkg0y9SvxyZ/AK5qjI0o3j4GYuwDuR/FK5c2boSKAqoiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYxSkOqq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYxSkOqq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2831F00A3E;
	Tue,  8 Sep 2026 15:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882981;
	bh=N9fgGq2X2uChEtYWmFfDevJiLw3yAP3NdTyXSMdqiTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYxSkOqqtRkXROWj3gB+7ReXgoHiyFFrrjnxIz/90YaeJ3Q/oOcXcADEhYVwjqu1o
	 3Fm1Jcwf8SAzxUUpS2kkTUbOxVkNcijIsb5l12Jm0B6zzqWxuj2KMgzZmQqsXor6vz
	 B093oKN0PG5FLcZdSkIgl0IQbhWQgHP/RYNC68D/wm/ba/9vaFD6TCCMAo6S8BiNon
	 M81/HJN1FLDDJjM5Kp0ZX92of4k9tcEImVeiL3r24SHpoKM+M8xf7wKYimg4gZ51D6
	 dB2C/xNmu5FmDsDpegQt03q1fQRF1mUMthr9k7pe0dV50Y21GGAC8FDx/yj2yukz0n
	 OhmCpmb5wEnxA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id CA820198003A;
	Tue,  8 Sep 2026 11:56:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 08 Sep 2026 11:56:18 -0400
X-ME-Sender: <xms:HTCgateyjfYFJdrtV7amQ9wKd5WHkuIUJV1wBimJoVJ08GqbGVDl8Q>
    <xme:HTCgauRae6D3D-6pIsU_QUdZxKrkpC8KEJxo87_2EoODrEVZEnud1qsMmo6WR_md5
    1EtZbxZ7fMswFDzVZemiCkbu6_SrxU56Tr6pehvBO9TqHkEP-MJOIg>
X-ME-Received: <xmr:HTCgakmvep3BQWXmrdY7q7Ef7PDqzQKKi5xj8CFcqCXJYXxmNUGf2cmdoxQ>
X-ME-Proxy-Cause: dmFkZTF3IiLrxKTc6MEEiVzjdeGok30jImMQRh0oSfDm6XFoFRUjHYcV2z+3oyw9IE98S8
    jhHjjVUPmLb8M1epXseCNDEw3g/pBEbeVDnYYxEmv/e8MqjF23LLhO7qB6zOijx3q2TO8Z
    chf+iV/I1x+z9V8/XJ8dR80BupXVG0lg4hH4QLv1WG4+83EGiENMGK0RcO9dEJ8TODIGIE
    8wJi2hmB6J1ep99h6Ir8Gc/c5bfldImT3JKGX8HjLU0BbFWuqm62tA7g6VKS+hvWJGI/j/
    X05+tUfS3Abz/aIZ74BfbklxYyRaMDjdfIMlDmfoddqHWsbbkYh3Ce3RSfpHWut5aet9ZY
    JJiG7gZhGux8ERCOwn6ER5ulGtWTcS3oPod6tev1968K2xCBHQySsRN0r9nXV27kFShhCx
    E+DaEwFCUVqdfyq4enpFO3knr7GakbCY8YHyql2lIo+1gg6DmH21S1PbITefkjVzC/oBDk
    rGivE4sjTsRAbzIfAtHqMU7HMkwAguEDmB5jFTozR0eX8kXCXiL+OBUGkSnAvFP5epOENB
    /kLy2ln2QKxI5D3xfCzdIjX2HzMQeVrkKvXuEZFmemlN9uGAZyYJwBrToCOWJa/Mi7ej8X
    eTwT1SbLxn/5mxYEk+0c314mj2MSpRkoxM6ltRC1v1My0h3nDOfh3HPKUa6w
X-ME-Proxy: <xmx:HTCgaqZ4TNJfpPRLt2blkL-fSGCQUuK2aTJq7fiKRsbRtfQMPsrS9A>
    <xmx:HTCgav2uhd1-UupJDsed_7VsdzptAOIz8jUkNT7xOlOsREgTUg5IEw>
    <xmx:HTCgaiqxkzH_b6CQSua9FpR1ywCgjYVvehT9qgwQzcYeICM97WdDsQ>
    <xmx:HTCgarwbrQIQaiihmQIsf43lSHARzGEj1U0WS3HJMnSyUdg0MbyEXg>
    <xmx:HTCgahjnYxs-rz7p5qLOGW4K36XsgUA_7OcoKvtN0wkE_iE9u5BUGLcN>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 11:56:12 -0400 (EDT)
Date: Tue, 8 Sep 2026 16:56:11 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Shivam Kalra <shivamkalra98@zohomail.in>, 
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v4 12/17] mm/huge_memory: move anon_vma handling into the
 anon split helper
Message-ID: <aqAvPuHUVXvkJmV4@thinkstation>
References: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
 <20260908-swap-thp-cleanup-v4-12-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-swap-thp-cleanup-v4-12-b532a3f20e71@tencent.com>

On Tue, Sep 08, 2026 at 02:12:16AM +0800, Kairui Song via B4 Relay wrote:
> +	/*
> +	 * Unmap/remap needs the anon_vma. The caller does not necessarily
> +	 * hold an mmap_lock that would prevent the anon_vma from
> +	 * disappearing, so we first take a reference and lock it.
> +	 *
> +	 * An unmapped folio needs none of this: folio_get_anon_vma() and
> +	 * folio_lock_anon_vma_read() both bail out on !folio_mapped()
> +	 * before taking the lock, and folio_ref_freeze() below still
> +	 * rejects a folio that picked up a reference meanwhile. Note
> +	 * a swapped-out THP counts as unmapped here as swap PTEs do
> +	 * not contribute mapcount, and they are splittable.
> +	 */
>  	if (folio_mapped(folio)) {
> -		need_remap = true;
> +		anon_vma = folio_get_anon_vma(folio);
> +		if (!anon_vma)
> +			return -EBUSY;
> +		anon_vma_lock_write(anon_vma);
>  		ret = unmap_folio(folio);
>  		if (ret)
> -			return ret;
> +			goto out_unlock;
>  	}

Hm. Nothing serializes folio_mapped() here. I believe it is fine, but the
reasoning deserves a comment, since it is what the whole change rests on.
Something along the lines of:

       * folio_mapped() is not stable here, but it can only change in
       * one direction while the folio is locked. The mapcount can drop
       * to zero at any time, zap_pte_range() takes no folio lock. It
       * cannot go up: swapin, migration and uffd move all lock the folio
       * before mapping it, and fork only copies PTEs that already exist.
       *
       * So if we see the folio mapped, the worst case is an empty rmap
       * walk. If we see it unmapped, it stays unmapped. Anything else
       * needs a reference first and folio_ref_freeze() below catches it.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
