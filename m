Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979549;
	b=n9HWBJGWpsaqB15007Gw/mzZVR+9G0ilbjHeE7XHgs6cjVtJ4tKlBu47/ZH+OMIjgIgw
	 aX+8PXsuqDme1vIMZCvC2Lr4WSYfw4duPb28hXgB8w+e6brDOlxnrnky8IFoo7k9crwz1
	 19yY16sJzsmBLXXKsV5IjFbhTeJYfoWQJk2MioCy60TO1j/fFtFceBClCfGA55NrlOayR
	 +8IZvfC7EYLlqDClXXvoNC4uHxpKtBVrlprqDS0dTjfX9Wf/LM3hnyefYPcrrWqq2whu+
	 iJB2arOIa2UHq+qSufuOtfpm2j9DENwBH8bOCh6qA30wGTt8d5upocfZxnjd/PFECew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979549;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=343eayTvifkkMlrwy/xdVN6F48t4446WEUYad6Mst4M=;
	b=R2oxt4VDloB2NA5b3sjc+luv4YVyJ+ximeq3+G6AzftmoFKw+cDDdTfzr5TATC8Mg+jO
	 K5bcfoyEdkIi30G6y0ROFLIU9RQ3HEuV+/57hZk4IMivSKxIQNFlGtGDMkQPlArekfeRN
	 jeBS5acegi0cBCSswkVHHmhHoppztv9ImzCql0T6XjWQuzroUDyVXfXK/grjjD2+XbLD7
	 WTcJKFZBu4XHxPN+HDW3ftBdd3H2Nm0eUuW39OxnrDaJdYCI2IMwupZdy+TznJ/NSgfLV
	 kfWi68HOMQNO+sguLadGhTy9XWS4bygIkzXKDR9wUQngZcjewG+q0Ov1qOlRgwEBlDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RhNUG8v3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE969606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RhNUG8v3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A10E1F008A5;
	Fri,  6 Nov 2026 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793979548;
	bh=343eayTvifkkMlrwy/xdVN6F48t4446WEUYad6Mst4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RhNUG8v3jLxEuKfkjzjh2O3hzkT/GXHoHwjFXad+jlqrHMmoroWCSEGOJ0whXTbw2
	 xSujptrJUOFXO6gYslpAoW99b5HL12/fyBJuJOuhsieu3ICH/oxVleEoAIkh7RcG6U
	 SIwdwG+dP6IuacVdo+ipywY41G0+dKBsxkxgOtACZ7bUEtTcEo4MTSd+nd3GadPzyU
	 bAeFw2ZOH3g8/lu99jX2UxMQ9VF/cEMNnaOpzFIGQfKnsGek3+2LNwGgETaY9PfRiY
	 DwG+UpF2w89nS7IKxvChsEE0SCP5nqnZ8YrJWZEf4Pf3/iugNsee2VmRdh2bUVHvqT
	 DatnXZ2gE5+og==
Date: Fri, 6 Nov 2026 15:39:02 +0000
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
Message-ID: <au30N0kjlIRfxMTx@gremlin>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <au3CUJO9zBMHLx-B@gremlin>
 <798cd192-9ec2-4f37-9cba-44db275a269c@gmail.com>
 <au3xEVu-SGXZYfyi@gremlin>
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
In-Reply-To: <au3xEVu-SGXZYfyi@gremlin>

On Fri, Nov 06, 2026 at 03:24:20PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Fri, Nov 06, 2026 at 09:26:01PM +0800, Vernon Yang wrote:
> > On Fri, Nov 06, 2026 at 12:07:53PM +0000, Lorenzo Stoakes (ARM) wrote:
> > > On reflection, I think this would be better implemented as something like:
> > >
> > > static void collapse_scan_mm_slot(unsigned int progress_max, ...)
> > > {
> > > 	unsigned int long lock_start = jiffies;
> > > 	...
> > >   	for_each_vma(vmi, vma) {
> > > 		...
> > >                 if (time_after(jiffies, lock_start) && mmap_lock_is_contended(mm)) {
> > >                         mmap_read_unlock(mm);
> > >                         cond_resched();
> > >                         mmap_read_lock(mm);
> > >                         lock_start = jiffies;
> > >                         vma_iter_set(&vmi, mm_slot->address);
> > >                         continue;
> > >                 }
> > > 	}
> > > }
> > >
> > > Which avoids magic numbers, and means if we hold the lock for 1-10ms (depending
> > > on HZ), which is a long time in the kernel to hold a lock, AND the lock is
> > > contended, we drop/reacquire.
> >
> > Looks good to me. Is the test result of this solution the same as the
> > current one?
>
> Thanks! I will update the commit to reflect the changes.

Hmm, actually the poor granularity of jiffies makes things measurably worse.

I think I have to just use a fixed constant still, and explain how it was
derived.

--
Cheers, Lorenzo
