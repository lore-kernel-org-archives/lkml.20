Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA943EC830
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814223; cv=none; b=YXHDLBsOM1G1EnhL7FP596wE/eHmWDCPXrxKXqqqAh6fEWEkGXIqMIsndMxGrhz1sEASa/eSUNkEX2Duj7OUAGw3J7YYtc/35caY1DQfjYG/sOgu/NySBJ5m3od1/roAQ937x7EzQosONXmuNkSXOlW1p9LTWykbqeKkNrlW+7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814223; c=relaxed/simple;
	bh=lJ9HeBQvoi7aTD8Fn3TXMGHURAyLMsO99BpjSsTEAOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXe4Er9caNKRVhtaMH3llDXYkm7lQWAzl4v5gpoFHEkPxxBBjzVExVYBCIPIKT0TwT7O42fuhvufHvF7dXB7FTo/g1pAi9oDk710Uklo3agFKKtXSnCzS8gdR/eKUfpPIn9bm2vqywOD7yxDOXhrHudbf4UNIGZd2ehZb1lxiSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCt22NtS; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCt22NtS"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcb3726952so264966e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814220; x=1792419020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2eI8B9IRSkr08wGu9ziy/drqG3G2v7BSelh/3Qqv4WQ=;
        b=eCt22NtS7uuE7Y8UATkEGTDSCmuselKkhBobN0HtZIBeGFxXzpkl58LdjhSjIDwuJB
         LoliuZIbTGW7KA/XqinTYeMBnb3qOTP+5Y8bImBbIJwgEhZvdhE2N6fCUt1/HAKO2LYw
         cA3B2ZRaaMTzHAwHhgc3qtoZo96E4mQsQbOGqu9eIkTtv0DuU0JhRkH81esPEMWJDROT
         Oc6AMmvGe0RCr+ityeNzcLrKjSeOFbixveb52cS5ZTzLxRPQxcQIAPZW/JV8OtmXjWnv
         qS+0J17tjZnc65wz1A46YnLR0Dq9zgYPw9x3twsUdFSZtZMg5rNmN0vfa0vosWD1KRSZ
         z7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814220; x=1792419020;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eI8B9IRSkr08wGu9ziy/drqG3G2v7BSelh/3Qqv4WQ=;
        b=Zd2F8W0ED1P73oB952XNQSnH09HI0X+BS71YpwxQlSGX5Ap1lVAeFrJM4peSIwX45J
         rmy0Qa/Br6igVmDEnkcO1ryyg0rbaSfGLVaNk39uPTIF7Cn5JdOIZR0Eo76HnLEZHjkG
         mpshIwe8R0Ylk7hTyCBzvICG1l9QHly3DD1lu1auux3WNdDjxLIXAh/CUpyQz5bM528u
         machFRLvWfkeIV2GM+yXr8OFXEADIFUtHlvUL3dJbdgScARbX9ROVvNWdlrQWFMgxv8a
         KA+xZvCCW2rim1isHB+AXcHQDsvL5Ol1nn9bPPi92xCmCVjfGp5AswRhpE4CyqHnwBrW
         G8qg==
X-Forwarded-Encrypted: i=1; AKwUvBzf4itNmobGcTVzJonCJnnh5xEQIGpfJBw13BtQU77VCSay/0BtjXnodf/ihRzm5Xa/X/jPPq68yOF8WyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCzHSHT6/HizOQRIpts1EbFBLsXpXME5rgz4Em0bMUW+2hnDeZ
	ZsMJkx50WkJQoRHOO0CjYQQxrXfyMIDOpu1fLUJc4J2iPvi0AKsZVdZ7
X-Gm-Gg: AYBFou1BC71EM6m+rUVRm3KhZfbA2uKAKAmtWlvtn4fado9+0wWjsqHgV4nAQIDZILY
	GhW6Fq+uTnPW5jgaqsnVlD73DGKFIzMXNJ5Px8GJkwShw6ZLl2b5Xj+zu1FhhC1aqAmbE9lbTc6
	NdiYjBQ+NcujMicxYj+EgA6PLGuPvxv34JPrxFck43yeqTXkEQvap0emj7CoZYHGgEMpap5NG7x
	pgXHHEVKFj8jSLHwMsrU9zrsY7xrJi9xVKG0aZdusc4aec60XWyhJaOdoX3n29oxjaK1r5BXN61
	cdc3xgjOUTfcdnEx2Q0PuvklbxU+WQJ+dC8gV8HY3v2rw0qxhoTXlmF9Ube0R5D1JaNhQ7W1JSz
	g6wGoK4u9yV2hz8w06OLiDmNYqDB/JHhO2R4VNvhMBDRGUd0WkQVn1ZdBfixEoWq2X19VxJ/1+3
	pzdbCccxUhOoj5WSAlkks1t+ObO8zf16BlLoEs7IRFCK2SPWwTtwWjrIhNU9rbuUAvzEu+qELvc
	VbwzhPYK5UX2QV+8hsRtng=
X-Received: by 2002:a05:6512:3d24:b0:5b6:1a7c:59cb with SMTP id 2adb3069b0e04-5bcde6d3d68mr3270336e87.37.1791814220153;
        Mon, 12 Oct 2026 07:10:20 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde90fecsm2861974e87.24.2026.10.12.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:10:18 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:10:16 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, hannes@cmpxchg.org, 
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com, yosry@kernel.org, 
	shikemeng@huaweicloud.com, chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase
 I)
Message-ID: <aszb4OgUUCh5JHle@soda.int.kasm.eu>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <asZt7-8mcxqc1a02@soda.int.kasm.eu>
 <asylV5YyyaHs8rP3@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asylV5YyyaHs8rP3@fedora>

Hi Baoquan,

On 2026-10-12 17:16:22 +0800, Baoquan He wrote:
> Hi Klara,
> 
> On 10/07/26 at 06:28pm, Klara Modin wrote:
> > On 2026-10-03 08:31:22 +0800, Baoquan He wrote:
> ...snip...
> > > The only argument create takes is a priority. The size comes from
> > > xswap.max= at boot, so there is one place to ask for a size and one to
> > > ask for a priority, and a priority can be given per device while a size
> > > cannot:
> > > 
> > >   # echo > /sys/kernel/mm/xswap/create          default priority
> > >   # echo 100 > /sys/kernel/mm/xswap/create      priority 100
> > > 
> > 
> > > The default is the highest priority, SWAP_FLAG_PRIO_MASK. An xswap
> > > device is then the first one tried, ahead of any ordinary swap device.
> > > Setting a lower priority is allowed.
> > 
> > Nice, this is now a good default which the user should not have to
> > change.
> 
> Thanks a lot for careful reviewing, and sorry for late reply.
> 
> > 
> > > 
> > > The device does not move once it exists, so the address space cannot be
> > > changed from this interface either. xswap.max= at boot and this together
> > > are the whole configuration.
> ...snip...
> > > Open items
> > > ----------
> > > 
> > > - xswap_create() sets si->pages to the whole address space (twice RAM by
> > >   default) and _enable_swap_info() adds it to nr_swap_pages and
> > >   total_swap_pages, which is what __vm_enough_memory() uses for
> > >   overcommit. That raises the commit limit by 2xRAM for a device whose
> > >   real capacity is bounded by the zswap pool and by how well the workload
> > >   compresses. The question is which semantics overcommit should follow:
> > >   worst-case backing, or the address space.
> > > 
> > > - destroy takes a bare swap type. The type is an internal index that
> > >   alloc_swap_info() recycles as soon as SWP_USED clears, so a value read
> > >   earlier can name a different device by the time it is written. The
> > >   swapoff ABI uses a path for this reason. It wants a generation or
> > >   another stable handle.
> > > 
> > > - The new interfaces (/sys/kernel/mm/xswap/create and destroy, xswap.max=,
> > >   the new type string in /proc/swaps) are not documented yet.
> > 
> > To me it feels a bit weird to have the interface split between a kernel
> > parameter and sysfs, meaning I have to configure this in two places now.
> > As far as I gather, there's also nothing that needs the limit to be
> > fixed at boot since it is applied at creation. If we want to expose this
> > limit to users (as xswap does) it would be nice to have a 'max'
> > shorthand for tha largest possible value, i.e. SWAPFILE_CLUSTER *
> > UNIT_MAX (or whatever it might be in the future). That would I guess in
> > practice give the same behaviour as vm.overcommit_memory=1 which might
> > or might not be desirable.
> 
> Thanks for the comment.
> 
> Here xswap.max= is a global boot parameter, while not a per-device or
> runtie knob. It sets the space space (si->max) of the xswap device
> at boot and can't change at runtime. So on the two places: the size is
> a global setting, fixed at boot; the priority is per device, it is in
> the create interface. They are different things.
> 
> The default is 2xRAM. From our earlier discussion, this is the largest
> size we think is sensible, and in practice I don't think it is not
> reachable in reality. If a system has swapped out 70% of its memory, and
> even more at 100%, it is already doubtful that it can still function
> normally. So 2xRAM is an upper bound, not a target.

I'm just not sure this is the case. An application could have a
relatively small working set but a much larger amount of cold memory it
rarely touches. In my GCC 17 example, I saw even greater ratios later in
the build process. This is from your previous xswap version where I got
around the 2x RAM limit by using multiple xswap devices:

MemTotal:        3966828 kB
SwapCached:          868 kB
SwapTotal:      80232412 kB
SwapFree:       69467760 kB
Zswap:            792048 kB
Zswapped:        6342024 kB
AnonPages:       2072820 kB
AnonHugePages:      4096 kB

This is almost 160 % of RAM in zswap and is getting close to the limit
in practice.

In addition, if I read your writeback series correctly, if data from
xswap is written back to a block device, the space of the written back
data cannot be reused in the xswap device (please correct me if I am
wrong). For low memory systems, I frequently set aside a lot more swap
than they have memory. If I do not grow the xswap address space size, I
could risk it getting full if enough of the block-based swap is used.

Looking at the example again, about 10 GiB of swap is reported as used,
but some of that is being reported twice (once through xswap and once
through the backing device) due to being written back (which I still
think is not so great). In this case, the system has 16 GiB of
block-based swap, meaning that the default limit would leave the xswap
device full if even half of it is used through writeback. If I would
only have a single default-sized xswap device in this example I would
likely have hit this in practice.

> 
> On the max short name: it would set the address space to the largest value
> the format allows. As you said, that is close to vm.overcommit_memory=1,
> and it is not a real capacity, so we may not want it as the default.
> 
> We keep xswap.max= only for special needs. Otherwise we may not need to
> change it.
> 
> Chris suggested a CONFIG option for the size. While CONFIG is not friendly
> to distros, you must rebuild the kernel to change it.

For my use case I would probably prefer a CONFIG option if that is the
only way. I typically build all my kernels on the same machine and send
the image either directly or for netboot. Setting the kernel command
line can be very different depending on the system (Different EFI
bootloaders, U-Boot and all its vendor versions).

> 
> By the way, I remember you mentioned you ever did a test making swapped
> out pages about 110% of system RAM, could you share your testing steps
> or scripts so that I can give it a shot on my testing system? If it's
> not convenient, then never mind.

It's nothing fancy. I just build the Gentoo package for the GCC 17
pre-release on my RISC-V BPI-F3. As I understand, the pre-release
sources will also enables some extra debugging and correctness checks
which will make the build slower and maybe also use more memory. Note
that I do not see the same memory usage on other arches which is I
believe due to the implementation of the RISC-V autovectorisation (GCC
14 saw a large jump and that was the release which added it). I do add
configure options --with-matchpd-partitions=20 and
--with-insnemit-partitions=50 since especially insn-recog.cc tends to be
huge and the default partition of 10 it will still be quite large.

My datapoints are from just dumping some fields of /proc/meminfo every
ten seconds.

> 
> Thanks
> Baoquan

Regards,
Klara Modin
