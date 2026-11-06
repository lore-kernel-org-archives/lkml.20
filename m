Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978666;
	b=2g8I5IdprTJhecWtUk9HxnRasO9jzt/6uraD6qj8YAprTkY4WltjKviy8C7/FunP4Qzl
	 7ma+Jf3VvQ0sPlFoe8sm2S4IZK4LhbkXPgweYIHaijlWUCg4RV7tG54R5dt3bpQcbwq0/
	 gYHHtZ1/TbEVg17cgnhsPF0wT2EuS9B2PvZHSDI6zAXPuS/Z2JvRNrJUzDm2g7I68Hh0k
	 pGR65lZLb573lsanlzf76VO0awOLWPlrbkEZkhV7vHR1gYfopV943O77xWACJXMl4t8g5
	 9oLIJktQ9OcKOp0OSpdjE90RPcEC/QYsC8EMqj7sm7ytqeLz9VrRbF8ZZfX2rpm12Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978666;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TLgNyXFrGS0TryALTyECIzzY5cEQxpys9ixb+i595LQ=;
	b=NrcZK3qauMCBMJQ7ueSpiwcan6f8Zydol5azxPNGbbTZ3uJjj58dqrzOJzCTx3FFKW7i
	 6/+XFhIDd0+X2XxrHClby9q5yfUeGWNRZUxzjjdKkUoHP6Adu6t4kPCNU7xu2B7MNVCPX
	 pP4wah9ZLHxP6LTeVJvmL5obVKrhYL/gtxOxRR0x5LWE1Ni1/zlmP84NTgEdZf1W/BL3T
	 BSWDt5i+0HSg/QsSa3ytDTDDhZXkFqHBvfns/ZAGzkevvU4ModYdfC/5F70UuNzYUVEfE
	 P3YhAfrW+6ts7VCRwP1J3xzw819ngcaEeGsoW1xjU2izLW1VGjH6nKbBxz9Q8tWH4og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9dNbIMv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A6606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9dNbIMv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D538B1F0089F;
	Fri,  6 Nov 2026 15:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978666;
	bh=TLgNyXFrGS0TryALTyECIzzY5cEQxpys9ixb+i595LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E9dNbIMvKrV4r7KYAGyHcAcgMkbVi7NVeGv74QZS6YsZpCAawM3rJyKrzu0kGUmoR
	 Bj/DAcnTvVZR1djvBU9Lg3QVTY5LCV5uAawidByHA+Ke5JNXq5LeZ6zopldNKKlpKo
	 QZKc90oVLJgkOm0eDLkALAvGz2ocxyqEugxe5zKZc550TuDT6jOZBCOdFNbPijdy+f
	 HJris1dK2k20jvpzqMEVCuPzLq3CWHKZYiqMDQvvlOhke4+5fCFu8sT++gBEPE6aj8
	 tCdFDNSeX2ABRCxwuoO3Pm/1oR9uq4MerdTgx8flrWHgSzBy7gvU6RusFUM85qyq0D
	 Z0TJT2KFPERkw==
Date: Fri, 6 Nov 2026 15:24:20 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <au3xEVu-SGXZYfyi@gremlin>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <au3CUJO9zBMHLx-B@gremlin>
 <798cd192-9ec2-4f37-9cba-44db275a269c@gmail.com>
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
In-Reply-To: <798cd192-9ec2-4f37-9cba-44db275a269c@gmail.com>

On Fri, Nov 06, 2026 at 09:26:01PM +0800, Vernon Yang wrote:
> On Fri, Nov 06, 2026 at 12:07:53PM +0000, Lorenzo Stoakes (ARM) wrote:
> > On reflection, I think this would be better implemented as something like:
> >
> > static void collapse_scan_mm_slot(unsigned int progress_max, ...)
> > {
> > 	unsigned int long lock_start = jiffies;
> > 	...
> >   	for_each_vma(vmi, vma) {
> > 		...
> >                 if (time_after(jiffies, lock_start) && mmap_lock_is_contended(mm)) {
> >                         mmap_read_unlock(mm);
> >                         cond_resched();
> >                         mmap_read_lock(mm);
> >                         lock_start = jiffies;
> >                         vma_iter_set(&vmi, mm_slot->address);
> >                         continue;
> >                 }
> > 	}
> > }
> >
> > Which avoids magic numbers, and means if we hold the lock for 1-10ms (depending
> > on HZ), which is a long time in the kernel to hold a lock, AND the lock is
> > contended, we drop/reacquire.
>
> Looks good to me. Is the test result of this solution the same as the
> current one?

Thanks! I will update the commit to reflect the changes.

>
> --
> Cheers,
> Vernon

--
Cheers, Lorenzo
