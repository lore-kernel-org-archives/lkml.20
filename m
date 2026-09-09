Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86BB37C11F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788995406; cv=none; b=LbScfbWXArxvFRW8qo1zgE3H05DNMmGWLzSPG9mq5Xf8wZ9Geu4cTSyWdBXvVgga44rNgyFC2d/vqLUCw7iqU6VhwVCFfe0jsu/1jPpgoU7Ndjx9hi4R1/dgMaz0haUc2gmXlyaWn4021AAJXPLNiI9yNEEe2mNfVACjdli+iGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788995406; c=relaxed/simple;
	bh=Dnqdq0KdBdyxtlGkgMFhZDK9zFUHuwkPUPX8VZQ7/AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgBnbVkMhLOBJHHiOTZ5nUsOxTYjhhjBk2v7s5MtGW3IpRNfyBCMa8K0M/nYPCRp/jNqjJBE1zb9bcjYCYJdFHFRyBIvjSrW8lvvto6vRBtTNYODhAP1QSUqiVSyDPj+sSZZTs2ikmIXjYpwmtg71oF8KO5a/MhEBXbqjS8xW7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Ai7+jP49; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Ai7+jP49"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90e7c71f86eso46295116d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788995404; x=1789600204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OyXsyrmwPWpvNEMluPgrbmkQBcP1ZphCbVgRL1lfY6U=;
        b=Ai7+jP49pnrXVZ9ubbln4mlm7gZZmSh85/NbrauvAzTWvU8w/ggGPkFilBB0jBOHb6
         PLANKX399COwmqYqdMsf/UW2x5l/kAQveEEQ6WOaEev9zTYDF7XIKginIjXGcxt9pGvX
         BdRZUpX3/WtOST8iGUosCVvMjzqbwulI3cqmH5G6nVMm4EVBQ/yrbAEHADZ9i2dvQ5Fu
         MHGKJp06r/+2eJzXT9RL6xBInuRouzXWOdPV8MSXZPrO41hs2Awv7ytQRV4mrh8d+xsl
         uHGlTuhx7wJW9sFwVam2ridtbXUBoOUpm6raVKONVXFQURoz26hYq4bem/76S0RWGi13
         E5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788995404; x=1789600204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OyXsyrmwPWpvNEMluPgrbmkQBcP1ZphCbVgRL1lfY6U=;
        b=LdS4ZHH4lk4tx5qM15Vt4rW20sLGdgby/WNak6Snk0zzY+NyWxDV9A0p7r/7yiHwfd
         1XF2bmwzTbdb6MZTusFDEzJ7VK7LIG9zjWnWncIrf9c71zSSUMLvKjE6hFu35I/1B+IM
         w6GbIAovQhMqtV4cMAO/Bn/8GoywhdXLG7wz3sDoRFmjxdecFAXUX1tkthbGjYyL7Wt0
         T5DUozzHqG1Oop47k/FYf5RB4M4W5usp0yrpIbBuVcLl4ELjoJPV8p8oakE/W7E4cnED
         83LnswIERLd3PNTP9ieb7DE5GuqRzBFzEbJKv7Z1VK3RYYDBJMKHh4d95HBZzU9ocm21
         JfUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMyH1qWlMjSAUMWoCD+PQbJzPtxY0hNG7BrFJ3N4m/kbqsqou2c9OmozYH1pbwoFx8+qwHJd5HDmf8TsA=@vger.kernel.org
X-Gm-Message-State: AFuF++noH95RCyXB0I/S/ZifaKmbQ1ttKclhp6CIsW0vH8SQFRn1gADO
	dvCn9Dmxbbf501o5a7pNbrcst4o88SJucH9QjMf536Usj7WKgeXmJ4esyX9SlrKDLwI=
X-Gm-Gg: AYBFou1xxbPZekEWdfr19EJ92q4uVgQ7AQNzjDrWNaIZXQuggjIUsZVnR166Dtd8CQ9
	smY1Qjk5BdFqTnrsuXvgVqCezV1eBjVLtNaEKYh3wJxDtXDeGjgL5PiMrUiIJHeHFHygps9zBCl
	C9LAfP23lsslA7C7Eqq8RNyfvP7z+7SJsw0ecMgADi8RZN8wNxtXLLoS+i99ciTlbzvmiA5+y15
	IH/5n5aRSPGAdU1LX+0qzBEWNM/Ta3lV8o7bRI3rj750uxQelvctyKRgTn2HVhW5NvicI/dV/7U
	R+nAUWoZPw7AxOvLaL2ttyd/VHu59wqm30rApr8dhoDNOKojlED4HfJVVlLrjji1ZvHvdurQNoc
	UHqDsZXFO1OfIaIlnLEQnrB4Pel2J/Mb2nXuf8bOzXlJyEfMrqmLDzf1M/uA2wf4h6Q7aUnm9qG
	upIMUE+8RARSulbvmKzQDPLVCHEezsq0NZMXbFjE6YSJWBNk2o2rPZRCKt1GA7+NNr23Cazrj/X
	fEL3USad1qlj3/vHVCmbreNUpPqtgPcDxEL2naJJlerRmuD+8xHq/k=
X-Received: by 2002:a0c:f206:0:b0:910:6432:b201 with SMTP id 6a1803df08f44-9106432b31amr201020706d6.21.1788995403591;
        Wed, 09 Sep 2026 16:10:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406af144sm155519616d6.40.2026.09.09.16.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:10:02 -0700 (PDT)
Date: Wed, 9 Sep 2026 19:10:00 -0400
From: Gregory Price <gourry@gourry.net>
To: Ackerley Tng <ackerleytng@google.com>
Cc: linux-mm@kvack.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	pbonzini@redhat.com, seanjc@google.com, akpm@linux-foundation.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, shuah@kernel.org
Subject: Re: [PATCH 0/5] KVM: guest_memfd: bind backing memory to a NUMA node
Message-ID: <aqHkVKvons1tBs1O@gourry-fedora-PF4VCD3F>
References: <20260902194657.79075-1-gourry@gourry.net>
 <CAEvNRgHWyBaBpZ4Bem1Eu86b-cuEA7NkyjxTJ4D3FnpGe1B2Yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEvNRgHWyBaBpZ4Bem1Eu86b-cuEA7NkyjxTJ4D3FnpGe1B2Yg@mail.gmail.com>

On Wed, Sep 09, 2026 at 03:41:35PM -0700, Ackerley Tng wrote:
> Gregory Price <gourry@gourry.net> writes:
> 
> > guest_memfd allocates its folios through a per-inode shared mempolicy.
> >
> > Today that policy can only be set after the fact, with mbind() on a host
> > mmap of the fd. That requires the fd to be mappable, and it cannot reach
> > folios that are only ever guest-faulted. Neither holds for a
> > non-mappable (confidential) guest_memfd.
> >
> > Add GUEST_MEMFD_FLAG_BIND_NODE and a node field to struct
> > kvm_create_guest_memfd. When set, KVM builds an MPOL_BIND policy for the
> > requested node and installs it over the whole inode, so every folio is
> > allocated there with no userspace mbind().
> >
> 
> Instead of a custom API to ensure all guest_memfd allocations come from
> a single node, how about these options?
> 
> 1. Using cgroups/cpuset to constrain allocations (could be troublesome
>    if the guest memory is not preallocated, unless the vCPU threads are
>    running with the cpuset config)
>
> 2. Process-level NUMA policy
>

for 1 and 2:

the intent is to put the guest memory on the target node, not all system
memory for a given process.  so the scope here is not the same.

in fact at that granularity, the desired node may not even have eligible
memory to host the task's memory.

> 3. Why not request the guest_memfd to be mmap-able just to be able to
>    set a memory policy?
> 

the eventual intent is to enable this for fully confidential,
host-unmapped guest, isolated to a particular memory device.

Requiring a mapping to get node-placement is quite defeating the point.

> 4. How about something like fbind() that takes an fd and offset range
>    instead of mbind(), which has a prerequisite on mmap()?
> 

This was a consideration - although it has other limitations and larger
complexities associated with it.

Where does the policy live for random fd's? (inode? address_space?) 

How is a reclaimed inode's policy handled? (lost forever?)

figured i'd start by reducing the scope to the narrowest and clearest
use-case, but I did expect to have the fbind() conversation.

I'm open to it, but it seems like over-engineering.

If you look at tmpfs / shmem, you'll see there is the option for a
default filesystem-wide mempolicy that can be plumbed, but i'm not sure
there's a real usecase for per-file mempolicies that isn't literally
guest_memfd.

> This doesn't exist yet, but I'm hoping to discuss this at LPC 2026:
> 
> 5. What if you could pass an fd representing a mount to guest_memfd at
>    creation time, so to make all the allocations come from a single node
> 
>     Step 1: Create a tmpfs mount, specify mpol for mount to MPOL_BIND
>     Step 2: Get some fd representing the tmpfs mount, hand that to
>             guest_memfd at creation time
>     Step 3: guest_memfd allocations will always come from that tmpfs
>             mount, and abide by that tmpfs mount's memory policy.
> 

This i think this is more feasible than something like fbind, but devil
is in the details.

I definitely think it's interesting and would love to chat at LPC!

> May I know more about the use case behind this new feature?
> 

see above - confidential vm whose memory is quarantined to a particular
device, without placing that same burden on the host memory.

~Gregory
