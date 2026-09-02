Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D9D49505F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354444; cv=none; b=Mr7d2BKozDGjK5e5LJ0rkbvrrCLdZnjUhsQAcuZS21RMyZrGukHWayJkkQ2/RrmrXZPdLpdROLcQlp2cWqMNV4rRDK0/99WFC2oFE+Pbs3oC+eh7uIUi/9k+6dP1LXPRMJ4Cwh8tcbjdE4o6+5zU/McuhbUhZXBH1Q/IaI7JgtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354444; c=relaxed/simple;
	bh=+t9sN4LSyRGw93rnNyg1v4R/ipYdpl7x/UgrrcH7gJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzNbEmZX1pPcPgUpmQxK6uOZYi5nnmQhJ82vPswAbblBAjkReHJZyMROig9CpjO1nfc9w/V0a9Xh60xZ0keBc5/PsJwPWzsKtzAVhZjNHA8a7AyAgDOedzr5AGbAyX+gqUQMRX2dL5mVn2eYVWP3ieQRPwRFAd99RhusWICCUos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pUh63RT4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pUh63RT4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81ADE165C;
	Wed,  2 Sep 2026 06:07:17 -0700 (PDT)
Received: from [10.1.34.165] (e121487-lin.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F4B63F85F;
	Wed,  2 Sep 2026 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788354441; bh=+t9sN4LSyRGw93rnNyg1v4R/ipYdpl7x/UgrrcH7gJ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pUh63RT4V/KPBB2O88F3YMOGtx1JdWvSj/QqmaJhB2Dh1R0LEM2yxJgti11F4tlKD
	 VjyoK1EM1DGgjvYFEW2m4OcN165RFcHiXm/tdxOC3doeLbPfpm9+hdC9RHqRnXJ03e
	 dVsghQvw8nk6GylnkSTuazEKzneEDBg0Swpideho=
Message-ID: <5058854b-6e68-44b2-b4f7-6e2f666c4caf@arm.com>
Date: Wed, 2 Sep 2026 14:07:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: hibernate: pass HVC_SET_VECTORS args to the resume
 hvc
To: Will Deacon <will@kernel.org>
Cc: Bradley Morgan <include@grrlz.net>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maz@kernel.org, james.morse@arm.com
References: <20260809213615.11646-1-include@grrlz.net>
 <anr28wUlKjci8JPn@willie-the-truck>
 <463DA5C2-C933-45EC-A200-21AAF6258418@grrlz.net>
 <anszjQ7jBeYDqesp@willie-the-truck>
 <7ca33f92-2ded-4749-ab67-2fb564919b99@arm.com>
 <aoxl1ri43eEAsxlR@willie-the-truck>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <aoxl1ri43eEAsxlR@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Will,

On 8/24/26 16:40, Will Deacon wrote:
> Hi Vladimir,
> 
> On Mon, Aug 17, 2026 at 02:06:20PM +0100, Vladimir Murzin wrote:
>> On 8/11/26 15:37, Will Deacon wrote:
>>> I think I probably need to spend some time understanding how all this is
>>> supposed to work. I can't currently tell how we end up with the stub
>>> vectors installed to start with nor why we can't do all this from C code.
> I finally got back to this...
> 
>> Here is my understanding of how things work. Assuming nVHE mode, we
>> restore the previously saved image X from the currently running kernel Y.
>> I’ll use the suffixes _X and _Y for addresses belonging to the respective
>> images.
> Nice, thanks for the walkthrough!
> 
>> On the resume path, KVM teardown sets VBAR_EL2 to __hyp_stub_vectors_Y.
>>
>> swsusp_arch_resume() then temporarily (re)sets VBAR_EL2 to trans_pgd_stub_vectors
>> while transitioning to image X:
>>
>> |        if (el2_reset_needed())
>> |                __hyp_set_vectors(el2_vectors);
>>
>>
>> Currently, swsusp_arch_suspend_exit() attempts to restore VBAR_EL2 to
>> __hyp_stub_vectors_X:
>>
>>
>> |       cbz     x24, 3f         /* Do we need to re-initialise EL2? */
>> |       hvc     #0
>>
>> where x24 is resume_hdr.__hyp_stub_vectors (in other words snapshot of
>> __hyp_stub_vectors from image X)
>>
>> However, that request is ignored, so VBAR_EL2 remains pointing to
>> trans_pgd_stub_vectors
>>
>> We re-enter the kernel X.
>>
>> During KVM initialisation, we call __hyp_reset_vectors(). This is
>> handled by trans_pgd_stub_vectors, but ignored since HVC_RESET_VECTORS
>> is not recognised. We then call __hyp_set_vectors(), which is also
>> handled by trans_pgd_stub_vectors, but this time VBAR_EL2 get set to
>> __kvm_hyp_init_X.
>>
>> From that point on, __kvm_hyp_init_X handles subsequent HVC calls,
>> including the later call that redirects VBAR_EL2 to
>> __kvm_hyp_host_vector_X during KVM setup.
>>
>> The memory containing trans_pgd_stub_vectors is freed later by
>> swsusp_free(). That perhaps explains why we do not see any crash.
> I was trying to figure out if we end up initialising VBAR_EL2 before we
> "return" from swsusp_arch_suspend() and free the reserved pages.
> However, it looks like we run _cpu_resume() instead of cpu_resume() so
> I still can't tell why this hasn't exploded. AFAICT, the active hyp
> vectors will have been freed (and possibly poisoned) long before KVM
> initialises.
> 

My apologies. I managed to confuse myself (but hopefully not you) with the
order of operations. Indeed, swsups_free() happens *before* KVM initialisation
which eventually happens later via syscore_resume().

I can now reproduce the problem with CONFIG_PAGE_POISONING=y and page_poison=on

# swapon /dev/vdb
[   55.330849] Adding 2097148k swap on /dev/vdb.  Priority:-1 extents:1 across:2097148k 
# echo test_resume > /sys/power/disk
# echo disk > /sys/power/state
[   62.534444] PM: hibernation: hibernation entry
[   62.578411] Filesystems sync: 0.021 seconds
[   62.579550] Freezing user space processes
[   62.585909] Freezing user space processes completed (elapsed 0.005 seconds)
[   62.586835] OOM killer disabled.
[   62.588332] Freezing remaining freezable tasks
[   62.591318] Freezing remaining freezable tasks completed (elapsed 0.002 seconds)
[   62.593983] PM: hibernation: Preallocating image memory
[   62.972326] PM: hibernation: Allocated 25745 pages for snapshot
[   62.973119] PM: hibernation: Allocated 102980 kbytes in 0.37 seconds (278.32 MB/s)
[   63.011607] Disabling non-boot CPUs ...
[   63.021633] virtio_blk virtio0: 1/0/0 default/read/poll queues
[   63.025486] virtio_blk virtio3: 1/0/0 default/read/poll queues
[   63.035080] hibernate: Hibernating on CPU 0 [mpidr:0x0]
[   63.039859] PM: Using 1 thread(s) for lzo compression
[   63.040459] PM: Compressing and saving image data (23314 pages)...
[   63.041558] PM: Image saving progress:   0%
[   63.247947] PM: Image saving progress:  10%
[   63.455279] PM: Image saving progress:  20%
[   63.619264] PM: Image saving progress:  30%
[   63.785097] PM: Image saving progress:  40%
[   63.924669] PM: Image saving progress:  50%
[   64.018580] PM: Image saving progress:  60%
[   64.116893] PM: Image saving progress:  70%
[   64.286410] PM: Image saving progress:  80%
[   64.490785] PM: Image saving progress:  90%
[   64.618506] PM: Image saving progress: 100%
[   64.621388] PM: hibernation: Wrote 93256 kbytes in 1.58 seconds (59.02 MB/s)
[   64.622108] PM: Image size after compression: 32298 kbytes
[   64.622702] PM: Image saving done
[   64.624592] PM: S|
[   64.777608] PM: Using 1 thread(s) for lzo decompression
[   64.778448] PM: Loading and decompressing image data (23314 pages)...
[   64.779237] hibernate: Hibernated on CPU 0 [mpidr:0x0]
[   64.877435] PM: Image loading progress:   0%
[   65.172066] PM: Image loading progress:  10%
[   65.273214] PM: Image loading progress:  20%
[   65.345142] PM: Image loading progress:  30%
[   65.454007] PM: Image loading progress:  40%
[   65.521889] PM: Image loading progress:  50%
[   65.595804] PM: Image loading progress:  60%
[   65.659942] PM: Image loading progress:  70%
[   65.720256] PM: Image loading progress:  80%
[   65.788729] PM: Image loading progress:  90%
[   65.851162] PM: Image loading progress: 100%
[   65.852057] PM: Image loading done
[   65.853050] PM: hibernation: Read 93256 kbytes in 1.07 seconds (87.15 MB/s)
[   65.900987] Disabling non-boot CPUs ...
[   63.012805] hibernate: Restored 0 MTE pages
[   63.012805] PM: hibernation: free pages cleared after restore

... hang here ...

GDB shows that we are executing code that looks like it came from the poisoned page.

Program received signal SIGINT, Interrupt.
0x000000004d158000 in ?? ()
1: x/i $pc
=> 0x4d158000:  orn     x10, x21, x10, asr #42

With the patch applied I do not see hang anymore so you can add

Tested-by: Vladimir Murzin <vladimir.murzin@arm.com>


> Speaking off-list to Mark R, he pointed me at some old rework he had for
> all of this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
> 
> one of the patches there is very similar (identical?) to this one, but
> his series gets us to a point where we _do_ resume at cpu_resume() and,
> tbh, the whole thing ends up making a lot more sense.
> 
> If somebody could dust off that two-year old (!) stack, that would be
> great.
> 
> Will
> 

