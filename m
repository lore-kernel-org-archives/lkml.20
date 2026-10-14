Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A2B5581E5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003255; cv=none; b=ZupoDjJVVuxdhRcr2J2cOeoJeQxwR397ttmoVugJVZ3jCzBPqjAOJQPMbVolKv+hGyeL+aT3+FMA9guknM9OXl1HkCoai/5hwNqmOIfNRgIOB5a9gxRYx50iUCbeS3PrOKTyCDiC4ZsAlSEVFcDhEoOJ1/Zb8G4JUJTFo7qLl4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003255; c=relaxed/simple;
	bh=Eakc5P+atJed99vsTRV6pg1nJISJyM38DYaHGxoQrDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL5i0gMk6G03LNXysVCssOH/4O7mKrLg5KEDTzVtZWUX8Wgbz/C2Dvu9ynZelER1BcFgeV3zjP7CjaWty214Fekdkq93SLw1rFjXo2o40KZXz2VVbmsk5D5tePytzd+rCrKwjRvdylLsbXC/iVQIy+wNpsFRdBZ2MlcxMPPQNXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSR8/3DS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSR8/3DS"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso3087088e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792003251; x=1792608051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5XehtWRHe4CRZCUlTIf4w4Y3AhoUdGKPHSw8atLC5qs=;
        b=KSR8/3DSxf4ChJ4PfGhznBFBUd/4/HDCzLHj4w8XI3vMbdtLGWfd78fImrgQA6aOQf
         oB5kupR0Th3/dkOmoJiDKIQqMzfX991lpT5B4fwETGIbqlcNDjvRupauXykZg59TM2ev
         MCk1Zc7nZ0OiVyWxwE1Pu+yVYoUmmAy3ZSeOfpL1aZYhKZEmWiEpABusB8XtcNdqaf30
         Sovy6gH/v+cd31Hq+QSKJJEtvOKd0Fjrh1Oig/mPiJwgJf3c08Bw51s2MsQwyzk10DXB
         4PmuJGgHni2Yl0NiwLrxo/f994Y3C5BwPMljBk6D51YewWo1GYsUf2D6tU7KOEq9thlK
         RMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792003251; x=1792608051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XehtWRHe4CRZCUlTIf4w4Y3AhoUdGKPHSw8atLC5qs=;
        b=e/Vu2ZFpkpp/bwXSuqfPQ1RpaUBMuBATctLQI6IhgVm3hE9ySxhmpJx/jr0+ivqkpj
         8Ut75MlQ+WwVulSJlmYz7J9KcGnp0+ShHGCOVEIMoZswHOI7lw2vUeS+4wlhSKJZqFrp
         JZ1oDBpuCuIfyZ3VV1xXEvHICmq8adoLEdpn4WEYnZcyPBOQA1sSOF+obx6Lm5ohgC+v
         Egj/B5TnwX/kiQOGStobMexi21hB5wR8Yi4QI3vGEAI5rI4P5SP3jxQT39yW2RPGZqHj
         YU1Ik5j2xmBuv5/JMz+Ml3zSmfe4E5X5ao2k3dppBiwsnHZMyU5BRq7ggS1XO/zsVq2b
         BWTQ==
X-Forwarded-Encrypted: i=1; AKwUvByaEA5EZ3HPKCh0VbtxsaeItLQUQKugY/OC9uoSglPpYvwW8oUkOqvBvwna4pLyOyyoY69iXBHvkF9QU5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaTaA3B40nZOBlIUGTWTsJARMYkzPglc4slXC/7ooYBHWT1jiw
	XMxX+r0aptutD0QiXFh2g5DpzRPFVhZk3MDo4BQ8i9PVTARmQq/orIWl
X-Gm-Gg: AYBFou2jj78I4k9zibATEnDEAufHyJkn1FiFiMlWQstGRTFuccKsCnd6LtyuQtw4+iX
	xiN6fWOQsDZ/8WPt/98EisPSy48vppf6WHwKTghRlBZZAJm1PC6jJNlam+cupejUB4pt4xXUG4f
	BG7ZdKTmssZXcyyer6hBkjX1Ab8SjEYndrqI8QwgSlJB6PzJKNWt5werL3cuRPbVnh3b2lqnHeY
	1c0X0aT/ITfeQCJoDGsv5Qn2pscxxjyIJUB0KjeK1x1L4kq9PQgDvepOQTJyeAjnJDblVU+R3Km
	OAd4NzbHk/PEU07C1YW8NCmKkpZgVeCKfIN9bKauMxEx5penYhfGT/E+1VIuJxNdPr8M5P1cMCN
	AOiYag1ldjpeYfARlNHChCxKF264ZEKDaM3mxdBka54jXv0Xdr4YWawGrMc/QEXRzPjswe0NaSh
	iRvmNP5TQAJGacK+R1G6bIYE9ZVHdRqptQys5Wbt+N11SwQnauhC1EJ62fk8DJmMDgkoQz+T3nV
	hJtdLN7Un8i1q+eaI2JSJFEYtpq
X-Received: by 2002:a05:6512:31d5:b0:5b8:c763:67f7 with SMTP id 2adb3069b0e04-5bcde6c0076mr6508273e87.24.1792003250860;
        Wed, 14 Oct 2026 11:40:50 -0700 (PDT)
Received: from localhost (parmesan.int.kasm.eu. [2001:678:a5c:1204:5508:6e19:c6a3:9875])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33feff92sm785393e87.0.2026.10.14.11.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:40:50 -0700 (PDT)
Date: Wed, 14 Oct 2026 20:40:49 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, hannes@cmpxchg.org, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, yosry@kernel.org, 
	shikemeng@huaweicloud.com, chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase
 I)
Message-ID: <as_MPhc4HcXdgUTe@parmesan.int.kasm.eu>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <asZt7-8mcxqc1a02@soda.int.kasm.eu>
 <asylV5YyyaHs8rP3@fedora>
 <aszb4OgUUCh5JHle@soda.int.kasm.eu>
 <as4F9wxsMwNsg5_R@fedora>
 <as4gb7BdnFffV4SI@parmesan.int.kasm.eu>
 <as-jZpQBQ9mMNqlH@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as-jZpQBQ9mMNqlH@fedora>

(Resending since gmail rejected my original message. Sorry if anyone
gets a duplicate)

On 2026-10-14 23:44:38 +0800, Baoquan He wrote:
> On 10/13/26 at 04:26pm, Klara Modin wrote:
> > Hi Baoquan,
> > 
> > On 2026-10-13 18:20:39 +0800, Baoquan He wrote:
> > > On 10/12/26 at 04:10pm, Klara Modin wrote:
> > > > Hi Baoquan,
> > > > 
> > > > On 2026-10-12 17:16:22 +0800, Baoquan He wrote:
> > ...
> > > > > 
> > > > > Thanks for the comment.
> > > > > 
> > > > > Here xswap.max= is a global boot parameter, while not a per-device or
> > > > > runtie knob. It sets the space space (si->max) of the xswap device
> > > > > at boot and can't change at runtime. So on the two places: the size is
> > > > > a global setting, fixed at boot; the priority is per device, it is in
> > > > > the create interface. They are different things.
> > > > > 
> > > > > The default is 2xRAM. From our earlier discussion, this is the largest
> > > > > size we think is sensible, and in practice I don't think it is not
> > > > > reachable in reality. If a system has swapped out 70% of its memory, and
> > > > > even more at 100%, it is already doubtful that it can still function
> > > > > normally. So 2xRAM is an upper bound, not a target.
> > > > 
> > > > I'm just not sure this is the case. An application could have a
> > > > relatively small working set but a much larger amount of cold memory it
> > > > rarely touches. In my GCC 17 example, I saw even greater ratios later in
> > > > the build process. This is from your previous xswap version where I got
> > > > around the 2x RAM limit by using multiple xswap devices:
> > > > 
> > > > MemTotal:        3966828 kB
> > > > SwapCached:          868 kB
> > > > SwapTotal:      80232412 kB
> > > > SwapFree:       69467760 kB
> > > > Zswap:            792048 kB
> > > > Zswapped:        6342024 kB
> > > > AnonPages:       2072820 kB
> > > > AnonHugePages:      4096 kB
> > > > 
> > > > This is almost 160 % of RAM in zswap and is getting close to the limit
> > > > in practice.
> > > 
> > > OK, thanks a lot for the concrete testing data. It truly is reaching
> > > almost 160% of RAM. However, it's a little different than David's Windows
> > > VMs case. In that case, those VMs's memory could be touched and swapped in
> > > in a distant future. While in your GCC build process, it's running and
> > > costing memory, with 160% of RAM in zswap, it was probably close to
> > > hanging? Wondering how long would it take to finish the build process,
> > > and how long it would take to finish the build proces with e.g 20% RAM
> > > swapped out.
> > 
> > Might be close to hanging, I don't know, but it's definitely under quite the
> > memory pressure (only two AnonHugePages, implying either very fragmented
> > or that they are split after allocation). Worth to note is that it hits
> > the zswap default limit of 20 percent of memory for the compressed pool.
> 
> I see. If so, it may not be a real use case, but only a corner case within
> an experimental environment. Because in that situation it's hard to say
> the system is still functioning normally.

Well, the build completed successfully and the system was at least
usable afterwards so I would still call it a real usecase.

> > > > In addition, if I read your writeback series correctly, if data from
> > > > xswap is written back to a block device, the space of the written back
> > > > data cannot be reused in the xswap device (please correct me if I am
> > > 
> > > Yes, you are right. xswap slot need record which backend slot stores its
> > > data, so xswap slot can't be reused in this case.
> > > 
> > > > wrong). For low memory systems, I frequently set aside a lot more swap
> > > > than they have memory. If I do not grow the xswap address space size, I
> > > > could risk it getting full if enough of the block-based swap is used.
> > > 
> > > Got it. Even with normal swap devices, 50% full will trigger swap
> > > reclaiming. 
> > > 
> > > /* Swap 50% full? Release swapcache more aggressively.. */
> > > static inline bool vm_swap_full(void)
> > > {
> > >         return atomic_long_read(&nr_swap_pages) * 2 < total_swap_pages;
> > > }
> > > 
> > > > 
> > > > Looking at the example again, about 10 GiB of swap is reported as used,
> > > > but some of that is being reported twice (once through xswap and once
> > > > through the backing device) due to being written back (which I still
> > > > think is not so great). In this case, the system has 16 GiB of
> > > > block-based swap, meaning that the default limit would leave the xswap
> > > > device full if even half of it is used through writeback. If I would
> > > > only have a single default-sized xswap device in this example I would
> > > > likely have hit this in practice.
> > > 
> > > I see, so a larger swap space of xswap is expected in this case.
> > 
> > Yes, due to the writeback still needing the slot in xswap I would never
> > want to have less xswap than block-based swap.
> > 
> > Ideally, I would like to not have to take the amount of block-based
> > swap into account when enabling xswap/vswap. A very high default limit
> > would be one way to solve it. Another option could be to automatically
> > create an xswap device with a size equal to the block-based swap device
> > (maybe a mount option?) on swapon, but this feels kind of like a hack to
> > me.
> 
> Chris ever suggested this way. With it people can set in /etc/fstab and
> make it take effect during boot. Not sure if people like it.

That's not exactly what I meant. What I think you're referring to here
is that xswap itself would be enabled by doing swapon on a specially
crafted swapfile header? What I suggested here was that when a regular
block device is swapon, it would also swapon an additional xswap device
with equal size to the block-based swap device.

My reasoning here was that this would alleviate the problem where xswap
would become full because it had written back all its data to the
block-based swap device.

> > > > > On the max short name: it would set the address space to the largest value
> > > > > the format allows. As you said, that is close to vm.overcommit_memory=1,
> > > > > and it is not a real capacity, so we may not want it as the default.
> > > > > 
> > > > > We keep xswap.max= only for special needs. Otherwise we may not need to
> > > > > change it.
> > > > > 
> > > > > Chris suggested a CONFIG option for the size. While CONFIG is not friendly
> > > > > to distros, you must rebuild the kernel to change it.
> > > > 
> > > > For my use case I would probably prefer a CONFIG option if that is the
> > > > only way. I typically build all my kernels on the same machine and send
> > > > the image either directly or for netboot. Setting the kernel command
> > > > line can be very different depending on the system (Different EFI
> > > > bootloaders, U-Boot and all its vendor versions).
> > > 
> > > From the actual use case and concrete number you provided, the interface
> > > can be adjusted like these:
> > > 1. 
> > > CONFIG_XSWAP_DEFAULT_MAX_PCT=200 
> > > default to 200, or default to the max value?
> > > 
> > > 2. 
> > > xswap.max= can override it. Or a xswap.max=max can be provided?
> > > 
> > > 3.
> > > The sysfs allow people to adjust the max size and priority:
> > > echo  > /sys/kernel/mm/xswap/create
> > > echo max=10G prio=100 > /sys/kernel/mm/xswap/create
> > > 
> > > Could you help comment if they are OK to you, or what is not needed
> > > actually or not good?
> > 
> > I do not mind having both a CONFIG option and a command line option for
> > the default where the latter overrides the first. I also do not mind
> > having the limit in sysfs since I need it to create the xswap device
> > anyway, but having all three together might be a bit extraneous.
> > 
> > However, if this is put in the sysfs it might be good to rethink how it
> > is structured. E.g. do we want to do so much string parsing when we
> > could instead have the limit and priority be separate files? I quite
> > like how NVME target handles this in configfs, where the user creates a
> > directory for the hosts, ports and subsystems and each config option is
> > a separate file inside. So for xswap, the user would mkdir
> > /sys/kernel/mm/xswap/typeN (or whatever) and have a structure inside
> > with something like:
> > typeN
> >  |- enabled # 0/1, which would actually destroy or create the device
> >  |- priority
> >  |- max_size_pct
> >  |- max_size_bytes # where writing to either would override the other
> > 
> > (and only accept changes when not enabled) but this might be more
> > complicated than we need. Even better would be for the defaults to work
> > for everybody since we wouldn't need the knobs, but then we would have
> > to agree on what those defaults should be.
> 
> Yes. I ask people around, they are all surprised and say how come 8PB
> is needed. And mobile phone people care about the swap amount, they only
> allow several GBs swapped out to zram with RAM of tens of GBs.

What drawbacks does having a 8 PiB address space for xswap actually
have (besides that with your current implementation it would essentially
mean vm.overcommit_memory=1)?

I tried to look in the other thread, and from what I could read, it will
result in more metadata, but only if that space is actually used?

8 PiB for me satisfies that I would not have to care about e.g. the
amount of block-based swap the system has.

> So how about these:
> 
> 1.
> CONFIG_XSWAP_DEFAULT_MAX=
> max; 8PB
> size; e.g 10TB
> 200%; percentenge of RAM
> defaults to 2xRAM
> 
> 2.
> xswap.max=
> can override CONFIG_XSWAP_DEFAULT_MAX=
> max; 8PB
> size; e.g 10TB
> 200%; percentenge of RAM
> 
> 3. 
> echo  > /sys/kernel/mm/xswap/create
> defaults to 2xRAM
> The sysfs allow people to adjust the priority:
> echo 100 > /sys/kernel/mm/xswap/create

In my case I would then set the config option to max so I would not have
to care about it.

Regards,
Klara Modin
