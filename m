Received: from mta0.migadu.com (out-161.mta0.migadu.com [91.218.175.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055EC562619
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992691; cv=none; b=OWoZQqNvhpDqwbY24TnN90KtSRSTqsy5NuMqzOrL6J9YaBgqe8FfGvTTKXmitgGLxB9g+4lKCjYY8Ho226Gw2k99pgELFdb8O088/SMBX9ujCTQXbAVKppJ93Ls5FB+VJR5N5lXgyzlDOpMN9FfV6eptUrlK3+u+gz/oif1WGj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992691; c=relaxed/simple;
	bh=IWz8TrA14wXCf8RgDJH9LfVZ/eamPEvc/gsSPc9D0Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJgUID8fruIkJaepShVJzcx/FiUuuxdx3DxjHxKf6S36YTpkuo7CjXx8jpwbGtalNvz3JXMYqusfSEoEBrkvXDtuE0zxf97ayoQMabMvaDMpG2ePRL4LFG7QjPjxSJQSm68pD0BBdm79oSP1YDLd6u4hOCAW8OtAzMN1WeFEwEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fyHfYF9H; arc=none smtp.client-ip=91.218.175.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fyHfYF9H"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IWz8TrA14wXCf8RgDJH9LfVZ/eamPEvc/gsSPc9D0Bo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791992686; v=1; x=1792597486;
 b=fyHfYF9HnChCb6/0k2VjEefs6pLGzzdYX3jaYS7wCIxRvKNz3VOSjXq5e6aCp6lTnLWuXDJp
 4WsKBn7S6wlen5GF+AcMNHubAMsH9lqQBtwMUdwZJMSqNOg3xJ+/ots1ipSenUeyfZqGcCaa4IP
 15hFAk7XGU91PIxss8lOo1xs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e2f26255d9a7fbec;
	Wed, 14 Oct 2026 15:44:46 +0000
X-Mizu-Trace-ID: e2f26255d9a7fbec
X-Migadu-Flow: FLOW_OUT
Date: Wed, 14 Oct 2026 23:44:38 +0800
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
Message-ID: <as-jZpQBQ9mMNqlH@fedora>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <asZt7-8mcxqc1a02@soda.int.kasm.eu>
 <asylV5YyyaHs8rP3@fedora>
 <aszb4OgUUCh5JHle@soda.int.kasm.eu>
 <as4F9wxsMwNsg5_R@fedora>
 <as4gb7BdnFffV4SI@parmesan.int.kasm.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as4gb7BdnFffV4SI@parmesan.int.kasm.eu>

On 10/13/26 at 04:26pm, Klara Modin wrote:
> Hi Baoquan,
> 
> On 2026-10-13 18:20:39 +0800, Baoquan He wrote:
> > On 10/12/26 at 04:10pm, Klara Modin wrote:
> > > Hi Baoquan,
> > > 
> > > On 2026-10-12 17:16:22 +0800, Baoquan He wrote:
> ...
> > > > 
> > > > Thanks for the comment.
> > > > 
> > > > Here xswap.max= is a global boot parameter, while not a per-device or
> > > > runtie knob. It sets the space space (si->max) of the xswap device
> > > > at boot and can't change at runtime. So on the two places: the size is
> > > > a global setting, fixed at boot; the priority is per device, it is in
> > > > the create interface. They are different things.
> > > > 
> > > > The default is 2xRAM. From our earlier discussion, this is the largest
> > > > size we think is sensible, and in practice I don't think it is not
> > > > reachable in reality. If a system has swapped out 70% of its memory, and
> > > > even more at 100%, it is already doubtful that it can still function
> > > > normally. So 2xRAM is an upper bound, not a target.
> > > 
> > > I'm just not sure this is the case. An application could have a
> > > relatively small working set but a much larger amount of cold memory it
> > > rarely touches. In my GCC 17 example, I saw even greater ratios later in
> > > the build process. This is from your previous xswap version where I got
> > > around the 2x RAM limit by using multiple xswap devices:
> > > 
> > > MemTotal:        3966828 kB
> > > SwapCached:          868 kB
> > > SwapTotal:      80232412 kB
> > > SwapFree:       69467760 kB
> > > Zswap:            792048 kB
> > > Zswapped:        6342024 kB
> > > AnonPages:       2072820 kB
> > > AnonHugePages:      4096 kB
> > > 
> > > This is almost 160 % of RAM in zswap and is getting close to the limit
> > > in practice.
> > 
> > OK, thanks a lot for the concrete testing data. It truly is reaching
> > almost 160% of RAM. However, it's a little different than David's Windows
> > VMs case. In that case, those VMs's memory could be touched and swapped in
> > in a distant future. While in your GCC build process, it's running and
> > costing memory, with 160% of RAM in zswap, it was probably close to
> > hanging? Wondering how long would it take to finish the build process,
> > and how long it would take to finish the build proces with e.g 20% RAM
> > swapped out.
> 
> Might be close to hanging, I don't know, but it's definitely under quite the
> memory pressure (only two AnonHugePages, implying either very fragmented
> or that they are split after allocation). Worth to note is that it hits
> the zswap default limit of 20 percent of memory for the compressed pool.

I see. If so, it may not be a real use case, but only a corner case within
an experimental environment. Because in that situation it's hard to say
the system is still functioning normally.

> 
> > 
> > > 
> > > In addition, if I read your writeback series correctly, if data from
> > > xswap is written back to a block device, the space of the written back
> > > data cannot be reused in the xswap device (please correct me if I am
> > 
> > Yes, you are right. xswap slot need record which backend slot stores its
> > data, so xswap slot can't be reused in this case.
> > 
> > > wrong). For low memory systems, I frequently set aside a lot more swap
> > > than they have memory. If I do not grow the xswap address space size, I
> > > could risk it getting full if enough of the block-based swap is used.
> > 
> > Got it. Even with normal swap devices, 50% full will trigger swap
> > reclaiming. 
> > 
> > /* Swap 50% full? Release swapcache more aggressively.. */
> > static inline bool vm_swap_full(void)
> > {       
> >         return atomic_long_read(&nr_swap_pages) * 2 < total_swap_pages;
> > }
> > 
> > > 
> > > Looking at the example again, about 10 GiB of swap is reported as used,
> > > but some of that is being reported twice (once through xswap and once
> > > through the backing device) due to being written back (which I still
> > > think is not so great). In this case, the system has 16 GiB of
> > > block-based swap, meaning that the default limit would leave the xswap
> > > device full if even half of it is used through writeback. If I would
> > > only have a single default-sized xswap device in this example I would
> > > likely have hit this in practice.
> > 
> > I see, so a larger swap space of xswap is expected in this case.
> 
> Yes, due to the writeback still needing the slot in xswap I would never
> want to have less xswap than block-based swap.
> 
> Ideally, I would like to not have to take the amount of block-based
> swap into account when enabling xswap/vswap. A very high default limit
> would be one way to solve it. Another option could be to automatically
> create an xswap device with a size equal to the block-based swap device
> (maybe a mount option?) on swapon, but this feels kind of like a hack to
> me.

Chris ever suggested this way. With it people can set in /etc/fstab and
make it take effect during boot. Not sure if people like it.

> 
> > 
> > > 
> > > > 
> > > > On the max short name: it would set the address space to the largest value
> > > > the format allows. As you said, that is close to vm.overcommit_memory=1,
> > > > and it is not a real capacity, so we may not want it as the default.
> > > > 
> > > > We keep xswap.max= only for special needs. Otherwise we may not need to
> > > > change it.
> > > > 
> > > > Chris suggested a CONFIG option for the size. While CONFIG is not friendly
> > > > to distros, you must rebuild the kernel to change it.
> > > 
> > > For my use case I would probably prefer a CONFIG option if that is the
> > > only way. I typically build all my kernels on the same machine and send
> > > the image either directly or for netboot. Setting the kernel command
> > > line can be very different depending on the system (Different EFI
> > > bootloaders, U-Boot and all its vendor versions).
> > 
> > From the actual use case and concrete number you provided, the interface
> > can be adjusted like these:
> > 1. 
> > CONFIG_XSWAP_DEFAULT_MAX_PCT=200 
> > default to 200, or default to the max value?
> > 
> > 2. 
> > xswap.max= can override it. Or a xswap.max=max can be provided?
> > 
> > 3.
> > The sysfs allow people to adjust the max size and priority:
> > echo  > /sys/kernel/mm/xswap/create
> > echo max=10G prio=100 > /sys/kernel/mm/xswap/create
> > 
> > Could you help comment if they are OK to you, or what is not needed
> > actually or not good?
> 
> I do not mind having both a CONFIG option and a command line option for
> the default where the latter overrides the first. I also do not mind
> having the limit in sysfs since I need it to create the xswap device
> anyway, but having all three together might be a bit extraneous.
> 
> However, if this is put in the sysfs it might be good to rethink how it
> is structured. E.g. do we want to do so much string parsing when we
> could instead have the limit and priority be separate files? I quite
> like how NVME target handles this in configfs, where the user creates a
> directory for the hosts, ports and subsystems and each config option is
> a separate file inside. So for xswap, the user would mkdir
> /sys/kernel/mm/xswap/typeN (or whatever) and have a structure inside
> with something like:
> typeN
>  |- enabled # 0/1, which would actually destroy or create the device
>  |- priority
>  |- max_size_pct
>  |- max_size_bytes # where writing to either would override the other
> 
> (and only accept changes when not enabled) but this might be more
> complicated than we need. Even better would be for the defaults to work
> for everybody since we wouldn't need the knobs, but then we would have
> to agree on what those defaults should be.

Yes. I ask people around, they are all surprised and say how come 8PB
is needed. And mobile phone people care about the swap amount, they only
allow several GBs swapped out to zram with RAM of tens of GBs. 

So how about these:

1.
CONFIG_XSWAP_DEFAULT_MAX=
max; 8PB
size; e.g 10TB
200%; percentenge of RAM
defaults to 2xRAM

2.
xswap.max=
can override CONFIG_XSWAP_DEFAULT_MAX=
max; 8PB
size; e.g 10TB
200%; percentenge of RAM

3. 
echo  > /sys/kernel/mm/xswap/create
defaults to 2xRAM
The sysfs allow people to adjust the priority:
echo 100 > /sys/kernel/mm/xswap/create

> > 
> > > 
> > > > 
> > > > By the way, I remember you mentioned you ever did a test making swapped
> > > > out pages about 110% of system RAM, could you share your testing steps
> > > > or scripts so that I can give it a shot on my testing system? If it's
> > > > not convenient, then never mind.
> > > 
> > > It's nothing fancy. I just build the Gentoo package for the GCC 17
> > > pre-release on my RISC-V BPI-F3. As I understand, the pre-release
> > > sources will also enables some extra debugging and correctness checks
> > > which will make the build slower and maybe also use more memory. Note
> > > that I do not see the same memory usage on other arches which is I
> > > believe due to the implementation of the RISC-V autovectorisation (GCC
> > > 14 saw a large jump and that was the release which added it). I do add
> > > configure options --with-matchpd-partitions=20 and
> > > --with-insnemit-partitions=50 since especially insn-recog.cc tends to be
> > > huge and the default partition of 10 it will still be quite large.
> > > 
> > > My datapoints are from just dumping some fields of /proc/meminfo every
> > > ten seconds.
> > 
> > OK, seems it's not easy to copy from my side. Thank you again for your
> > detailed testing information and suggestion.
> 
> You might be able to do it in a VM, but without hardware acceleration it
> is likely even slower than the ~18 hours it takes on my BPI-F3 to
> complete. I use the Gentoo package since it's convenient, but for
> testing purposes, building from the GCC sources directly would likely be
> similar.
> 
> Another scenario which could potentially benefit from a lot of zswap (or
> swap in general) would be when suspending processes (i.e. ^Z or kill
> -SIGSTOP). Their memory would quickly go cold and therefore be swapped
> out under memory pressure. I have used this sometimes on low memory
> systems where I have started a build process with too many workers and
> not wanted to restart it, but am not sure if there are other reasonable
> use cases of this.

Got it, the build process seems not easy to copy, while the latter one
sounds doable, I can give it a shot sometime. Thanks a lot for providing
these valuable information and your patience.


Thanks
Baoquan
