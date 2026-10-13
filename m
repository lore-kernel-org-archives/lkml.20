Received: from mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542563F4DDA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883109; cv=none; b=CFA7uOLKoBZYRY52GMVtGwACHvYEUsjV7uHXGnPP0UkzLBGojKgk1nEyFsAbXwJiPvgBbm59WBgBIQPCY9wF0Ov8Jaik5VW3oRBGDqU9oYQwu7IXeZGtUkvfFehU0lMI/J8UgYEUpbng6fa0Cd9JVMiZfSvVp2rYii/wzqNXe2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883109; c=relaxed/simple;
	bh=7dij7DFyP1tg1HaqF4OFWcRn8VL75Z8/Hg9V+AE8H5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYwq8FiJ4Z3FzHsWVI2sAslzO40BL6jQx8hMDtR1sZFiICOqiqc9/r0d2YIpdPBucX2kG6HyqMs5TKzq9KQmWnTGZjybGw3r5jJlWybHwA70Xsz5L10UNaipoyDQQ+kE3n6skpCeD3vsW51HYJTsuboF45YwMidRk6A1zi8K364=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YUgDSoIe; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YUgDSoIe"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7dij7DFyP1tg1HaqF4OFWcRn8VL75Z8/Hg9V+AE8H5o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791883103; v=1; x=1792487903;
 b=YUgDSoIethYq286Zvzg34gTVTwPGi7uZ/y7hmda6IVPJKlK/WQMgL0hpnjkzpimdd8V4UCFq
 a4s/4Nj+B60zfsoX8izuAS3cMrgjFQcYUBeNU6kLBeENJ6/VL3J0D8AMsRtyX9BVYqUj3KR+MAs
 I8dStXdl9P9uapFjyRUBs7lk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 6e95fa5eb5e92f1b;
	Tue, 13 Oct 2026 09:18:21 +0000
X-Mizu-Trace-ID: 6e95fa5eb5e92f1b
X-Migadu-Flow: FLOW_OUT
Date: Tue, 13 Oct 2026 17:18:12 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Klara Modin <klarasmodin@gmail.com>, Baoquan He <hebaoquan@kylinos.cn>,
	linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org,
	kasong@tencent.com, hannes@cmpxchg.org, nphamcs@gmail.com,
	baohua@kernel.org, youngjun.park@lge.com, yosry@kernel.org,
	shikemeng@huaweicloud.com, chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase
 I)
Message-ID: <as33VMjNRIZOG5Ua@MiWiFi-R3L-srv>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <asZt7-8mcxqc1a02@soda.int.kasm.eu>
 <asylV5YyyaHs8rP3@fedora>
 <565e1744-54ff-4daf-ac14-7b6c49fd3fa2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <565e1744-54ff-4daf-ac14-7b6c49fd3fa2@kernel.org>

On 10/12/26 at 03:44pm, David Hildenbrand (Arm) wrote:
> On 10/12/26 11:16, Baoquan He wrote:
> > Hi Klara,
> > 
> > On 10/07/26 at 06:28pm, Klara Modin wrote:
> >> On 2026-10-03 08:31:22 +0800, Baoquan He wrote:
> > ...snip...
> >>> The only argument create takes is a priority. The size comes from
> >>> xswap.max= at boot, so there is one place to ask for a size and one to
> >>> ask for a priority, and a priority can be given per device while a size
> >>> cannot:
> >>>
> >>>   # echo > /sys/kernel/mm/xswap/create          default priority
> >>>   # echo 100 > /sys/kernel/mm/xswap/create      priority 100
> >>>
> >>
> >>> The default is the highest priority, SWAP_FLAG_PRIO_MASK. An xswap
> >>> device is then the first one tried, ahead of any ordinary swap device.
> >>> Setting a lower priority is allowed.
> >>
> >> Nice, this is now a good default which the user should not have to
> >> change.
> > 
> > Thanks a lot for careful reviewing, and sorry for late reply.
> > 
> >>
> >>>
> >>> The device does not move once it exists, so the address space cannot be
> >>> changed from this interface either. xswap.max= at boot and this together
> >>> are the whole configuration.
> > ...snip...
> >>> Open items
> >>> ----------
> >>>
> >>> - xswap_create() sets si->pages to the whole address space (twice RAM by
> >>>   default) and _enable_swap_info() adds it to nr_swap_pages and
> >>>   total_swap_pages, which is what __vm_enough_memory() uses for
> >>>   overcommit. That raises the commit limit by 2xRAM for a device whose
> >>>   real capacity is bounded by the zswap pool and by how well the workload
> >>>   compresses. The question is which semantics overcommit should follow:
> >>>   worst-case backing, or the address space.
> >>>
> >>> - destroy takes a bare swap type. The type is an internal index that
> >>>   alloc_swap_info() recycles as soon as SWP_USED clears, so a value read
> >>>   earlier can name a different device by the time it is written. The
> >>>   swapoff ABI uses a path for this reason. It wants a generation or
> >>>   another stable handle.
> >>>
> >>> - The new interfaces (/sys/kernel/mm/xswap/create and destroy, xswap.max=,
> >>>   the new type string in /proc/swaps) are not documented yet.
> >>
> >> To me it feels a bit weird to have the interface split between a kernel
> >> parameter and sysfs, meaning I have to configure this in two places now.
> >> As far as I gather, there's also nothing that needs the limit to be
> >> fixed at boot since it is applied at creation. If we want to expose this
> >> limit to users (as xswap does) it would be nice to have a 'max'
> >> shorthand for tha largest possible value, i.e. SWAPFILE_CLUSTER *
> >> UNIT_MAX (or whatever it might be in the future). That would I guess in
> >> practice give the same behaviour as vm.overcommit_memory=1 which might
> >> or might not be desirable.
> > 
> > Thanks for the comment.
> > 
> > Here xswap.max= is a global boot parameter, while not a per-device or
> > runtie knob. It sets the space space (si->max) of the xswap device
> > at boot and can't change at runtime. So on the two places: the size is
> > a global setting, fixed at boot; the priority is per device, it is in
> > the create interface. They are different things.
> > 
> > The default is 2xRAM. From our earlier discussion, this is the largest
> > size we think is sensible, and in practice I don't think it is not
> > reachable in reality. If a system has swapped out 70% of its memory, and
> > even more at 100%, it is already doubtful that it can still function
> > normally. So 2xRAM is an upper bound, not a target.
> 
> I remember some overcommitted hypervisor setups where people swapped out
> significantly more -- without any issues.
> 
> For example, Windows VMs initialize all VM memory when booting up. Afterwards,
> you might just have plenty of memory that was touched once but will not really
> be used in any near future.
> 
> So I would consider some crazy hypervisor scenarios as well where people
> commonly have significant cold memory that is currently not hot (not in the
> working set) but might possibly used in some distant future.

Hi David,

Thanks a lot for the valuable input. This is probably the first first-hand
information I have heard about a production environment. And Klara
measured about 160% of RAM in zswap on her RISC-V box, so the 2xRAM default
is reachable in practice, not just in theory.

So I see 2xRAM as a default, not as a cap. xswap.max= already overrides it.
After your comment and Klara's numbers, I am open to a larger default, or to
a "max" value for the address space. The real limit is still the backing:
the zswap pool plus the block devices. The address space should no longer
be the limiting factor.

By the way, in Windows-VM case you mentioned, is there a block swap backend,
or is it zswap alone? If it is zswap alone, the knob that matters is
zswap.max_pool_percent, because it sets how much cold memory the pool can
hold.

Thanks
Baoquan
