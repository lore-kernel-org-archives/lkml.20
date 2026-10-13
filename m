Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78A51814B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901609; cv=none; b=OCuMjNK6fW2/izhtJePf814EK4jXVlnCofLWcJk01v9HdX1UvExK5wWdAmoHIOSFPyOzSz4V36u7rF6d3kx4WjnhN7rMnTPhGyLQnRICs0Wp40C6fjy++h8tgeV+psMoHtkVgd8M55+V1ZcQ1C+tb5zAx8fTQ9qMDxtc5IP1CWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901609; c=relaxed/simple;
	bh=mvMeBhyr5IrF9ZCvsPajWwDyyQmXwIY15nAjWeyh7FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAbn0b4x1sbDLtj+zRkFRmLThntwswBnKApaVj/ICSPF5fYUwOYBq1YQY00+m9kNKxIjb8i8cCvAwPlol/ZcYMbsa/Wv5S6px7dFUsyulVycMjaJoitmKXMNpuDF3C/yn8cTh8aX6By8+XisL1ZpVaqnU7psNEJ8AZxoj2WPREo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6WZFgTj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6WZFgTj"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba357a1929so2663195e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791901605; x=1792506405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GqHJmOrsAscfSwnG9+HOxEdimM/Cq2SN07Uf0WC6x0w=;
        b=T6WZFgTj++/R+9+XU8pxoDF116BDQOpW3UfpJJBKWnIYryVxlKmR6AVi9nVhQDrIzr
         vpel18kfGEduBpT8CtYWB2kEpNreAgw9nHn6moi5cMnngokrRIU5hpxERGDHspwIUr4p
         wRs29C4WY/1C27NpYry73rDVd52LOj66QMunancs0ByDgyntZlSJmSDThlH6LeLlgwIk
         l3kHLLqAY/5VK1iFL4RUHDC7nNEA85nhmyoYPrtXxJN7QL3n5GwI1LEEMGP3fHpY2yM6
         ubczfyxCTHV+gD8focjEBc1bPlF78RXMwD5saufx7fCZ/1izXt9rA3fMvDoTyqHgclSJ
         vwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901605; x=1792506405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqHJmOrsAscfSwnG9+HOxEdimM/Cq2SN07Uf0WC6x0w=;
        b=PbMRtPkxsGh3o130qDq1jQ7Nw0h2EpdS+Y4+lVJ97leQ4KXDy3qmIv4523uh3lX2s1
         9lIT4cxDfqUFiNjcYgYYqvrGcyQ0G1OkRDn7q0fnvjAuN7rrpBPh3vtCMjbuQIc9OWMB
         znw8WK8AtwVGnB2dKA+fk1baCyMQgMUJmyjWABJ1pi6Uz/SwaOWEA5BJhKCJuCQ62fjs
         WLzntKY6CADoS4hXc0tqJNH2RDS9+4LmDBF4zKO2ZLeoHujx3666UHa6iYKeuxqu424y
         X12tbArDAzsdcEg89y4HSQvd/jY7S/Z0N1UgN1nPcKog0Hooez/tbeJffyoi1GAN7Km5
         z0/g==
X-Forwarded-Encrypted: i=1; AKwUvByincPMR+8EdHsSN8I/gfVvyKxdEgVG/M8jYwWMQjk0xuuEG20I8pFpHFFNr/PVgyHyx6gqm7Nbdol5rVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0ZYVuw8nVl+gOyrl0YdYZGC9COq556jbjUuf2PXW0BVW4mxCK
	+CZwa9SGfU5wlPZ0C5SmW7eMPNzQO0EsS1Ecucv8tVDxKILPc4FcViZh
X-Gm-Gg: AYBFou3PjDbJj0suC7r9hN7GaVEtRm4Qs/BD5cIR9U9wgSjGbocrNbCYjSRxjMcvGt2
	NqWvgzwK4p2akdULtr0mkR2OMJ6WpQMwatGFpy7R4bcYxQPm5ZhMyXTH4r83GS1GFAWXwrU6Xrb
	2CDF3NYPzw1copwFxylORCCmpBZrmj+OCMrm15dzZQ+1/mXOXc1Cd0F5k3BINIxI2cBNOR7NdV0
	S8yp+dB6mqsXXLlERQXY/XfMSg4vKkRFmbY+sqsBHWXaYSKU+7uXxo03oIqFtOE1Bj8wiPa6LH4
	8z2wLuHpBc2pdy+MDW+dcZWyOCAhWpw6NssoL/bh0hhnTL5blf/nzHjyfNyWLqlW4upLzj/wvEx
	xlrfwXpqUmqrs00Fv60q8IPOndC9v7+6fh4ECTYVXMU6W3IdBNC1GTqNYj8JMTzLWyisAc9P1nN
	ZXAyau4tO08PgzRP0c/nS2m1C8PwsPv97mPj0iRhBL/nbQMbgEcMtUHrN0mDn9yX46+AQzNLaH9
	cK4PGqjiOw3iPuVTg==
X-Received: by 2002:a05:6512:6889:20b0:5bc:e45b:becd with SMTP id 2adb3069b0e04-5bce45bbfc5mr2303297e87.14.1791901605226;
        Tue, 13 Oct 2026 07:26:45 -0700 (PDT)
Received: from localhost (parmesan.int.kasm.eu. [2001:678:a5c:1204:5508:6e19:c6a3:9875])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912a7sm3574410e87.18.2026.10.13.07.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:26:44 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:26:42 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, hannes@cmpxchg.org, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, yosry@kernel.org, 
	shikemeng@huaweicloud.com, chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase
 I)
Message-ID: <as4gb7BdnFffV4SI@parmesan.int.kasm.eu>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <asZt7-8mcxqc1a02@soda.int.kasm.eu>
 <asylV5YyyaHs8rP3@fedora>
 <aszb4OgUUCh5JHle@soda.int.kasm.eu>
 <as4F9wxsMwNsg5_R@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as4F9wxsMwNsg5_R@fedora>

Hi Baoquan,

On 2026-10-13 18:20:39 +0800, Baoquan He wrote:
> On 10/12/26 at 04:10pm, Klara Modin wrote:
> > Hi Baoquan,
> > 
> > On 2026-10-12 17:16:22 +0800, Baoquan He wrote:
...
> > > 
> > > Thanks for the comment.
> > > 
> > > Here xswap.max= is a global boot parameter, while not a per-device or
> > > runtie knob. It sets the space space (si->max) of the xswap device
> > > at boot and can't change at runtime. So on the two places: the size is
> > > a global setting, fixed at boot; the priority is per device, it is in
> > > the create interface. They are different things.
> > > 
> > > The default is 2xRAM. From our earlier discussion, this is the largest
> > > size we think is sensible, and in practice I don't think it is not
> > > reachable in reality. If a system has swapped out 70% of its memory, and
> > > even more at 100%, it is already doubtful that it can still function
> > > normally. So 2xRAM is an upper bound, not a target.
> > 
> > I'm just not sure this is the case. An application could have a
> > relatively small working set but a much larger amount of cold memory it
> > rarely touches. In my GCC 17 example, I saw even greater ratios later in
> > the build process. This is from your previous xswap version where I got
> > around the 2x RAM limit by using multiple xswap devices:
> > 
> > MemTotal:        3966828 kB
> > SwapCached:          868 kB
> > SwapTotal:      80232412 kB
> > SwapFree:       69467760 kB
> > Zswap:            792048 kB
> > Zswapped:        6342024 kB
> > AnonPages:       2072820 kB
> > AnonHugePages:      4096 kB
> > 
> > This is almost 160 % of RAM in zswap and is getting close to the limit
> > in practice.
> 
> OK, thanks a lot for the concrete testing data. It truly is reaching
> almost 160% of RAM. However, it's a little different than David's Windows
> VMs case. In that case, those VMs's memory could be touched and swapped in
> in a distant future. While in your GCC build process, it's running and
> costing memory, with 160% of RAM in zswap, it was probably close to
> hanging? Wondering how long would it take to finish the build process,
> and how long it would take to finish the build proces with e.g 20% RAM
> swapped out.

Might be close to hanging, I don't know, but it's definitely under quite the
memory pressure (only two AnonHugePages, implying either very fragmented
or that they are split after allocation). Worth to note is that it hits
the zswap default limit of 20 percent of memory for the compressed pool.

> 
> > 
> > In addition, if I read your writeback series correctly, if data from
> > xswap is written back to a block device, the space of the written back
> > data cannot be reused in the xswap device (please correct me if I am
> 
> Yes, you are right. xswap slot need record which backend slot stores its
> data, so xswap slot can't be reused in this case.
> 
> > wrong). For low memory systems, I frequently set aside a lot more swap
> > than they have memory. If I do not grow the xswap address space size, I
> > could risk it getting full if enough of the block-based swap is used.
> 
> Got it. Even with normal swap devices, 50% full will trigger swap
> reclaiming. 
> 
> /* Swap 50% full? Release swapcache more aggressively.. */
> static inline bool vm_swap_full(void)
> {       
>         return atomic_long_read(&nr_swap_pages) * 2 < total_swap_pages;
> }
> 
> > 
> > Looking at the example again, about 10 GiB of swap is reported as used,
> > but some of that is being reported twice (once through xswap and once
> > through the backing device) due to being written back (which I still
> > think is not so great). In this case, the system has 16 GiB of
> > block-based swap, meaning that the default limit would leave the xswap
> > device full if even half of it is used through writeback. If I would
> > only have a single default-sized xswap device in this example I would
> > likely have hit this in practice.
> 
> I see, so a larger swap space of xswap is expected in this case.

Yes, due to the writeback still needing the slot in xswap I would never
want to have less xswap than block-based swap.

Ideally, I would like to not have to take the amount of block-based
swap into account when enabling xswap/vswap. A very high default limit
would be one way to solve it. Another option could be to automatically
create an xswap device with a size equal to the block-based swap device
(maybe a mount option?) on swapon, but this feels kind of like a hack to
me.

> 
> > 
> > > 
> > > On the max short name: it would set the address space to the largest value
> > > the format allows. As you said, that is close to vm.overcommit_memory=1,
> > > and it is not a real capacity, so we may not want it as the default.
> > > 
> > > We keep xswap.max= only for special needs. Otherwise we may not need to
> > > change it.
> > > 
> > > Chris suggested a CONFIG option for the size. While CONFIG is not friendly
> > > to distros, you must rebuild the kernel to change it.
> > 
> > For my use case I would probably prefer a CONFIG option if that is the
> > only way. I typically build all my kernels on the same machine and send
> > the image either directly or for netboot. Setting the kernel command
> > line can be very different depending on the system (Different EFI
> > bootloaders, U-Boot and all its vendor versions).
> 
> From the actual use case and concrete number you provided, the interface
> can be adjusted like these:
> 1. 
> CONFIG_XSWAP_DEFAULT_MAX_PCT=200 
> default to 200, or default to the max value?
> 
> 2. 
> xswap.max= can override it. Or a xswap.max=max can be provided?
> 
> 3.
> The sysfs allow people to adjust the max size and priority:
> echo  > /sys/kernel/mm/xswap/create
> echo max=10G prio=100 > /sys/kernel/mm/xswap/create
> 
> Could you help comment if they are OK to you, or what is not needed
> actually or not good?

I do not mind having both a CONFIG option and a command line option for
the default where the latter overrides the first. I also do not mind
having the limit in sysfs since I need it to create the xswap device
anyway, but having all three together might be a bit extraneous.

However, if this is put in the sysfs it might be good to rethink how it
is structured. E.g. do we want to do so much string parsing when we
could instead have the limit and priority be separate files? I quite
like how NVME target handles this in configfs, where the user creates a
directory for the hosts, ports and subsystems and each config option is
a separate file inside. So for xswap, the user would mkdir
/sys/kernel/mm/xswap/typeN (or whatever) and have a structure inside
with something like:
typeN
 |- enabled # 0/1, which would actually destroy or create the device
 |- priority
 |- max_size_pct
 |- max_size_bytes # where writing to either would override the other

(and only accept changes when not enabled) but this might be more
complicated than we need. Even better would be for the defaults to work
for everybody since we wouldn't need the knobs, but then we would have
to agree on what those defaults should be.

> 
> > 
> > > 
> > > By the way, I remember you mentioned you ever did a test making swapped
> > > out pages about 110% of system RAM, could you share your testing steps
> > > or scripts so that I can give it a shot on my testing system? If it's
> > > not convenient, then never mind.
> > 
> > It's nothing fancy. I just build the Gentoo package for the GCC 17
> > pre-release on my RISC-V BPI-F3. As I understand, the pre-release
> > sources will also enables some extra debugging and correctness checks
> > which will make the build slower and maybe also use more memory. Note
> > that I do not see the same memory usage on other arches which is I
> > believe due to the implementation of the RISC-V autovectorisation (GCC
> > 14 saw a large jump and that was the release which added it). I do add
> > configure options --with-matchpd-partitions=20 and
> > --with-insnemit-partitions=50 since especially insn-recog.cc tends to be
> > huge and the default partition of 10 it will still be quite large.
> > 
> > My datapoints are from just dumping some fields of /proc/meminfo every
> > ten seconds.
> 
> OK, seems it's not easy to copy from my side. Thank you again for your
> detailed testing information and suggestion.

You might be able to do it in a VM, but without hardware acceleration it
is likely even slower than the ~18 hours it takes on my BPI-F3 to
complete. I use the Gentoo package since it's convenient, but for
testing purposes, building from the GCC sources directly would likely be
similar.

Another scenario which could potentially benefit from a lot of zswap (or
swap in general) would be when suspending processes (i.e. ^Z or kill
-SIGSTOP). Their memory would quickly go cold and therefore be swapped
out under memory pressure. I have used this sometimes on low memory
systems where I have started a build process with too many workers and
not wanted to restart it, but am not sure if there are other reasonable
use cases of this.

> 
> Thanks
> Baoquan
> 

Regards,
Klara Modin
