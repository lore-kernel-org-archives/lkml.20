Received: from mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6223C3443
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886853; cv=none; b=AgINlNBFQjVA698abhBxLFsyxHQeKyBeTYM/YNWGweM+WVwoPTwCodBAEiVAW9IPVFGxA3D3Xu4xzMn8NWDG4HiXrCDEep+5D2GWKL2sJnp1xOGlkp5KR9oSGWyG484NZdNGwnMUXSsKoGIAf5vvjDYmaDxDrVWYVPJfa/wVKCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886853; c=relaxed/simple;
	bh=AYrJ+leTQ8KpmWIlxYCwg5HqHj8C4UZFudPDXRb1/v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfPMbXljmO1oXNVgnLrMJdi56oUibOmxzhhZvfsIbqYvgaMORAhy+fDl+1hVT2wJc+UlD8nW4xlgUybBZhDRYovq8BC0yqyL9iCOT4oYpgZM6IfRCiiv8q2lSfoOwLIV7v66F3DI3aMQNGLWzLptLAkL0pVpIUehCazfUkF/s80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o7VQttIk; arc=none smtp.client-ip=91.218.175.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o7VQttIk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AYrJ+leTQ8KpmWIlxYCwg5HqHj8C4UZFudPDXRb1/v8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791886848; v=1; x=1792491648;
 b=o7VQttIkfFGtLAP8aH6JBlSIUN1W1KdmS/Npcn52x4V7vhrYjGxqN3ZRH32mxtJ7OAE/GGQ8
 G5qNl39G7BamDogkS4s+NveVoyhj/oGZJNEdfShN/0JGUCFK+IyG2dSTYCAHU7B8grj/FyKE7p5
 WiINF71+cer1gAD45HvDyXKw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 51de388346c5e3ae;
	Tue, 13 Oct 2026 10:20:43 +0000
X-Mizu-Trace-ID: 51de388346c5e3ae
X-Migadu-Flow: FLOW_OUT
Date: Tue, 13 Oct 2026 18:20:39 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Klara Modin <klarasmodin@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	hannes@cmpxchg.org, nphamcs@gmail.com, baohua@kernel.org,
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase
 I)
Message-ID: <as4F9wxsMwNsg5_R@fedora>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <asZt7-8mcxqc1a02@soda.int.kasm.eu>
 <asylV5YyyaHs8rP3@fedora>
 <aszb4OgUUCh5JHle@soda.int.kasm.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aszb4OgUUCh5JHle@soda.int.kasm.eu>

On 10/12/26 at 04:10pm, Klara Modin wrote:
> Hi Baoquan,
> 
> On 2026-10-12 17:16:22 +0800, Baoquan He wrote:
> > Hi Klara,
> > 
> > On 10/07/26 at 06:28pm, Klara Modin wrote:
> > > On 2026-10-03 08:31:22 +0800, Baoquan He wrote:
...snip... 
> > > > - destroy takes a bare swap type. The type is an internal index that
> > > >   alloc_swap_info() recycles as soon as SWP_USED clears, so a value read
> > > >   earlier can name a different device by the time it is written. The
> > > >   swapoff ABI uses a path for this reason. It wants a generation or
> > > >   another stable handle.
> > > > 
> > > > - The new interfaces (/sys/kernel/mm/xswap/create and destroy, xswap.max=,
> > > >   the new type string in /proc/swaps) are not documented yet.
> > > 
> > > To me it feels a bit weird to have the interface split between a kernel
> > > parameter and sysfs, meaning I have to configure this in two places now.
> > > As far as I gather, there's also nothing that needs the limit to be
> > > fixed at boot since it is applied at creation. If we want to expose this
> > > limit to users (as xswap does) it would be nice to have a 'max'
> > > shorthand for tha largest possible value, i.e. SWAPFILE_CLUSTER *
> > > UNIT_MAX (or whatever it might be in the future). That would I guess in
> > > practice give the same behaviour as vm.overcommit_memory=1 which might
> > > or might not be desirable.
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
> I'm just not sure this is the case. An application could have a
> relatively small working set but a much larger amount of cold memory it
> rarely touches. In my GCC 17 example, I saw even greater ratios later in
> the build process. This is from your previous xswap version where I got
> around the 2x RAM limit by using multiple xswap devices:
> 
> MemTotal:        3966828 kB
> SwapCached:          868 kB
> SwapTotal:      80232412 kB
> SwapFree:       69467760 kB
> Zswap:            792048 kB
> Zswapped:        6342024 kB
> AnonPages:       2072820 kB
> AnonHugePages:      4096 kB
> 
> This is almost 160 % of RAM in zswap and is getting close to the limit
> in practice.

OK, thanks a lot for the concrete testing data. It truly is reaching
almost 160% of RAM. However, it's a little different than David's Windows
VMs case. In that case, those VMs's memory could be touched and swapped in
in a distant future. While in your GCC build process, it's running and
costing memory, with 160% of RAM in zswap, it was probably close to
hanging? Wondering how long would it take to finish the build process,
and how long it would take to finish the build proces with e.g 20% RAM
swapped out.

> 
> In addition, if I read your writeback series correctly, if data from
> xswap is written back to a block device, the space of the written back
> data cannot be reused in the xswap device (please correct me if I am

Yes, you are right. xswap slot need record which backend slot stores its
data, so xswap slot can't be reused in this case.

> wrong). For low memory systems, I frequently set aside a lot more swap
> than they have memory. If I do not grow the xswap address space size, I
> could risk it getting full if enough of the block-based swap is used.

Got it. Even with normal swap devices, 50% full will trigger swap
reclaiming. 

/* Swap 50% full? Release swapcache more aggressively.. */
static inline bool vm_swap_full(void)
{       
        return atomic_long_read(&nr_swap_pages) * 2 < total_swap_pages;
}

> 
> Looking at the example again, about 10 GiB of swap is reported as used,
> but some of that is being reported twice (once through xswap and once
> through the backing device) due to being written back (which I still
> think is not so great). In this case, the system has 16 GiB of
> block-based swap, meaning that the default limit would leave the xswap
> device full if even half of it is used through writeback. If I would
> only have a single default-sized xswap device in this example I would
> likely have hit this in practice.

I see, so a larger swap space of xswap is expected in this case.

> 
> > 
> > On the max short name: it would set the address space to the largest value
> > the format allows. As you said, that is close to vm.overcommit_memory=1,
> > and it is not a real capacity, so we may not want it as the default.
> > 
> > We keep xswap.max= only for special needs. Otherwise we may not need to
> > change it.
> > 
> > Chris suggested a CONFIG option for the size. While CONFIG is not friendly
> > to distros, you must rebuild the kernel to change it.
> 
> For my use case I would probably prefer a CONFIG option if that is the
> only way. I typically build all my kernels on the same machine and send
> the image either directly or for netboot. Setting the kernel command
> line can be very different depending on the system (Different EFI
> bootloaders, U-Boot and all its vendor versions).

From the actual use case and concrete number you provided, the interface
can be adjusted like these:
1. 
CONFIG_XSWAP_DEFAULT_MAX_PCT=200 
default to 200, or default to the max value?

2. 
xswap.max= can override it. Or a xswap.max=max can be provided?

3.
The sysfs allow people to adjust the max size and priority:
echo  > /sys/kernel/mm/xswap/create
echo max=10G prio=100 > /sys/kernel/mm/xswap/create

Could you help comment if they are OK to you, or what is not needed
actually or not good?

> 
> > 
> > By the way, I remember you mentioned you ever did a test making swapped
> > out pages about 110% of system RAM, could you share your testing steps
> > or scripts so that I can give it a shot on my testing system? If it's
> > not convenient, then never mind.
> 
> It's nothing fancy. I just build the Gentoo package for the GCC 17
> pre-release on my RISC-V BPI-F3. As I understand, the pre-release
> sources will also enables some extra debugging and correctness checks
> which will make the build slower and maybe also use more memory. Note
> that I do not see the same memory usage on other arches which is I
> believe due to the implementation of the RISC-V autovectorisation (GCC
> 14 saw a large jump and that was the release which added it). I do add
> configure options --with-matchpd-partitions=20 and
> --with-insnemit-partitions=50 since especially insn-recog.cc tends to be
> huge and the default partition of 10 it will still be quite large.
> 
> My datapoints are from just dumping some fields of /proc/meminfo every
> ten seconds.

OK, seems it's not easy to copy from my side. Thank you again for your
detailed testing information and suggestion.

Thanks
Baoquan

