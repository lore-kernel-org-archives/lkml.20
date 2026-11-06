Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997794;
	b=35Oxd3AQ6kAdCjlYQ3Ny1pokLL9OO1Fq3sBlLa+mwiliX5hoJWsUjMSU6ZpUWx8f33jW
	 +Uz2QgqLqwwkts17qzvwDHgYUPaUQr7cqNEA0ueET/nm+zUTSUNBWBCJZrMVakV3mmetL
	 NQCeefKipgqHlNfmogkWeiHQfusyApsFGcy7FBl6X5AoQqJK/fBpd9A9l9/FlMJWThg3q
	 Um+Bi/3Z8CU7MyxtC7gAmWH9J3oTK3uhp6uxnCCHGQR8oVZxOkMEJ3dyhKvWAO5KHcU9Q
	 sS831C9QkqSXOPEhI303TG0ERDBAANfRIp6739vW93dI+sAFOcqwJ3GA1sn8MVPfmXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ws2V6VbViJ6cnrlfEDvDEs6KCs0YOuB35XjyLfjvYOA=;
	b=gKK8Z8Z3v+UGsFu46jfVYzCNigjTp2PGZms3scFdNlDh6RsLS2VO45GvKjmUvmEsNPvI
	 IXdtITTbhTEIwmJrUiqaKdw8Y7SwheovzqxP95xRdL2DytLfWbch18oEnX09WUb2ZKNSb
	 cFteFHv69d+tdcwti545uTK4gVu+sjDiEtKZLKjaIj/zXE/BZREBhbx8JUdlvgekLrfhV
	 x5VxVRrnVagLZVU1ZOxaAOBInTZbE9MYgbsGh13U7YZCGjanKKKNNeHae2mWYL1Evf/B7
	 VdjGK1qPvzAwUSOPSmFPDwRpxB6aUNDjJ1mhCBfsa3ydIggUvHIpSzoplf8tYD7A50g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=REFEyl2N;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0C3606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0C3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=REFEyl2N
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91e98301805so11386576d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793997792; x=1794602592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ws2V6VbViJ6cnrlfEDvDEs6KCs0YOuB35XjyLfjvYOA=;
        b=REFEyl2N/lgmfldAVFpxIWxQa8mjfRZ+rZu+VbJlPELmGLoAMssVZsg4Bw+JPUe95Q
         Y/+7TrhaVb742lX5HOvfYl5c8tdB9czfTvg+/vPAkrj9deCRb9o77jvOHMvRN4NFT+Us
         ybtE7N/j08Yo8TizgspuDg/xp1VtRZGq6sUf6uJV1YrIhg2qFP9g5wF57DH9VkfVQStn
         4ZNBdx9BbGLhMDmmTMxt1/LSgHH4HYRUio31WfKrQQRxXVL0B2mrBDJi7luolVdmYxxx
         r+j1ArDIDr+vUF0me32H7jSKSjODetgV3j9jw0TC5pHi0hn9wyRUYJT4xRQMphXho2hD
         k69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997792; x=1794602592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ws2V6VbViJ6cnrlfEDvDEs6KCs0YOuB35XjyLfjvYOA=;
        b=0aDPgSpqbQqW9fd9G6oYXGQJABGT6Wx5HaG6fE4VqBaEKcUeE7pjkz3TQO6K6drOIT
         MiPjiDBZDIsq2y5xnw2/Mm35+iKl0TDgXXIO0YpGHdPMy2GM8mW98+w8d3CALrL1txfS
         EaiNi8w4LsGIboPksw55Mu97+GFKbkNMf2vOJEzZ8llZ3EDMBcsjGN+aIoVIaaYlXNqH
         5BxiFDGreH9XPWJ7ChHj2e5VNBTjgWXWP3dtVRrHguzVCwr0QHZ5wspW7VvwiYiCQLIC
         VU+oKHQupJKz/Fqej7J/OxLSIOlS1RoIHMc/0oRG7lqVQJOjDfh+/YkXgs1ABWE7lKm8
         qxiw==
X-Forwarded-Encrypted: i=1; AL+hErEV94tv/ZsriUxUHLCYfcAp4dodo838lfE/rED3NeqyjrB1730gRm70aFdMRfGJfebjICyB5Sai0+RIQ+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aba/xqGxnjjVzp+oosVyvsgF8M49X35qvBQNvFrjG6glr3MK1
	3IARJm43uZVyKfDWmUFSgWW2PVHgz27B+8o6BtGmX5rq+OcjailBdDwa0leh7zI3f3I=
X-Gm-Gg: AYBFou1qorU58b+WktHak62KeS/4x9jM06knWUbYviSBC4uVTvuDjI6QNKxO6g6jhYF
	u1VYdpPN2IgH1JmNgX/uG2CthThVSfcs1xUTMpwwmJAper9iuRm+ibkvesfedslWbo9ZGiSgbfu
	sIBxqU9dGnjVn1ojPxIceubD7kYVWqG90Rw9HgyUH2qoZ+Ap7lVlK9Xvkx3PEfdgW+EoSnBOXuE
	af9VeVKaa2X7aKPIp3S9L20uHUqh+9d86iX01yDhP+WKvwQYGwbZ05fTpHFZ7TiX4ZpSo9FXXfJ
	R0781tLTsjZioUJAAUsqSyTLno1QY+OO7zPJb5Tm5XycvADecXenxtQ+9NNpA9DHSbJ60sC8PFj
	xXpv4ZbE9+F7ZRvaJIFGSLRNUxDFBQxiH8BauGzZubsNtryBJdNclQhbUh/82TY8sd9C6LQ3y9x
	j/LBobFT+XP+G3tOuu5PN9fCdYCTJPUsa4dOYuUldpu77gS0rXLuoc4kvPqrjwG4opVjBuTx8/p
	OKvDjmLbdxsl3toC9yGj4iB3h4eMTXVny7tmzmvK60gUgo6tkDHLi0oyVrNCKWe2t15mCb5cLUK
	Zx2bVkVGn87GYHl+oBcc+CfK1P11AONTkt+G1bzH7HfOSvsCyZNQ3ZcR8btNEgE/OUzl/tYuzIJ
	9dQlHQkibng==
X-Received: by 2002:ad4:4ee5:0:b0:91e:a5c2:37f7 with SMTP id 6a1803df08f44-91ea97a22b7mr53003846d6.42.1793997792129;
        Fri, 06 Nov 2026 12:43:12 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c742sm29232026d6.11.2026.11.06.12.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:43:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xPQmE-00000007ent-3ktJ;
	Fri, 06 Nov 2026 16:43:10 -0400
Date: Fri, 6 Nov 2026 16:43:10 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
	Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kevin Tian <kevin.tian@intel.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Steve Sistare <steven.sistare@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, iommu@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/5] mm: limit pagecache folio refcount when splicing
 into pipes
Message-ID: <20261106204310.GK663069@ziepe.ca>
References: <20261105-refcount_overflow_stable-v1-0-70b9c655da3e@kernel.org>
 <20261105-refcount_overflow_stable-v1-2-70b9c655da3e@kernel.org>
 <n3l2cnx6d25jovloqyoxiz566mh62janclmiewjvumtmqfezo7@zmsmco5vvssn>
 <23f947e2-ff06-426d-adb7-396871304736@kernel.org>
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
In-Reply-To: <23f947e2-ff06-426d-adb7-396871304736@kernel.org>

On Fri, Nov 06, 2026 at 09:09:10PM +0100, David Hildenbrand (Arm) wrote:
> On 11/6/26 18:58, Josef Bacik wrote:
> > On Thu, Nov 05, 2026 at 02:10:11PM +0100, David Hildenbrand (Arm) wrote:
> >> Similar to mapping pagecache folios into page tables, let's reject splicing
> >> folios into a pipe if the refcount is at it's limit, similar to how we
> >> handle it during GUP.
> >>
> >> This will prevent more cases of possible folio refcount overflows with
> >> large pagecache folios.
> >>
> >> Let's keep it simple and check in the two callers of
> >> splice_folio_into_pipe().
> >>
> >> Also check in try_get_page() to cover pipe-buffer duplication by tee()
> >> and partial pipe-to-pipe splicing.
> >>
> >> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> >> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> >> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> >> ---
> >>  include/linux/mm.h | 9 ++++++---
> >>  mm/filemap.c       | 4 ++++
> >>  mm/shmem.c         | 4 ++++
> >>  3 files changed, 14 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >> index 79ae8fc0d6bb4..a82cfbce18215 100644
> >> --- a/include/linux/mm.h
> >> +++ b/include/linux/mm.h
> >> @@ -2287,10 +2287,13 @@ static inline void get_page(struct page *page)
> >>  
> >>  static inline __must_check bool try_get_page(struct page *page)
> >>  {
> >> -	page = compound_head(page);
> >> -	if (WARN_ON_ONCE(page_ref_count(page) <= 0))
> >> +	struct folio *folio = page_folio(page);
> >> +
> >> +	if (WARN_ON_ONCE(folio_ref_count(folio) <= 0))
> > 
> > Since you're here anyway can you change this to something other than
> > WARN_ON_ONCE, since that results in an OOPS with panic_on_warn set?
> > Thanks,
> 
> If it actually turns negative (or 0) with out changes, we had an overflow and
> for sure want to know about it :)

Yeah, didn't you get Docs merged to clarify WARN_ON is fine if
userspace can't trigger it?

If you use panic_on_warn you *WANT* your system to stop if it detects
corruption, that's the whole point. Removing corruption detection so
panic doesn't trigger is pure 100% nonsense.

This keeps coming up and it's frustrating to go over again and again.

Jason
