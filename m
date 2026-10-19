Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE524DE717
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406794; cv=none; b=qrCCAcFb+VkU4xRMwaNhIqyvTIoi0NF0LzwqLrly9NYUUQeNmfMUSIwGJy355nVOOG3XHYPJa1xJbpMFfZ6mrcvScGOv3W+2MmUlmpYDKK+3k1F4UJVaifgRKG1i0ejabkD4oReAHeXmrBFROUgUack4SRyBw6HIzXW64F+G0gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406794; c=relaxed/simple;
	bh=p2LblvAfj4QuM2SpSPtTxOVssoEiFV65yPhBUEuKTzI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ojp+2c4zoGtmmDLyK1TyeWgZBWrkJO94G/3VCDpQRrtUj15inEhPitu1nza+jdvF8I0LQmsavlJ26TPgoaldnNT42tWFtUE5rLNb/DdMtvAU15nz1R+GCvQDgwEt/Ary/ByWeOq/C5N8TI+qPenxlixVcqBaaMAiU6KZbKWjzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSYA73yM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSYA73yM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFA11F000C4;
	Mon, 19 Oct 2026 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792406791;
	bh=sXO2/1ZLYjpyHDjT93fi/BujL9M5/NL5FbbRDOzOStI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lSYA73yMQyL4lLb4kPx0Zs3lLN5hldyzT3bd2envsgGUGVBvQEPWXtcmMckyJUUWu
	 8cZlXxgiJFs10A9wmhW7ZoJ3+cn5Sj8EAzUajflfgdSJFDA/5EUbftljxJ1W1sBT28
	 Ebr1W9F8TAOa95buU6O0qAHHExPX47+hbcJz6yGdaqvQjBp20HfbqrP+mN1qgsqhen
	 Jkwm4CCcW3ldfORM667zxYEiF5EMmbbgsf+z9ygLXnP8I9+4wEEGfarhlVm2SOemLW
	 Htv/UWXBk98wmVc0EwCUeHXTyQLw+Ja6IA7QaTIt051iJQPq4C3InOk5isPktjkx3Q
	 6kEab0XFecCSA==
From: Pratyush Yadav <pratyush@kernel.org>
To: BernardoGV@proton.me
Cc: rppt@kernel.org,  sourabhjain@linux.ibm.com,  pratyush@kernel.org,
  graf@amazon.com,  akpm@linux-foundation.org,  guodongtai@kylinos.cn,
  pasha.tatashin@soleen.com,  ritesh.list@gmail.com,
  kexec@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kho: fix global scratch size calculation
In-Reply-To: <d4c253f3-d36f-0253-f22d-43c9f397f6ad@proton.me>
	(BernardoGV@proton.me's message of "Sat, 17 Oct 2026 16:19:31 +0000")
References: <d4c253f3-d36f-0253-f22d-43c9f397f6ad@proton.me>
Date: Mon, 19 Oct 2026 12:46:28 +0200
Message-ID: <2vxzjynege7v.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Oct 17 2026, BernardoGV@proton.me wrote:

> On Mon, Oct 12, 2026, Mike Rapoport wrote:
>> I mean more fundamental code refactoring that takes into the account all
>> cases (and I could miss some)
>>
>> - NUMA vs no-NUMA
>> - systems that have global scratch containing lowmem scratch vs those that
>>   don't
>> - and of course fix global scratch over-allocation
>
> One more case for the list: reservations made before KHO sizes scratch
> that are never served from it. HugeTLB is already excluded. crashkernel
> is the other big one. Sourabh mentioned it in the powerpc thread. Here
> are x86 numbers from a machine that never asked for KHO.
>
> Ubuntu 26.04's generic kernel (7.0.0-38-generic) ships
> CONFIG_KEXEC_HANDOVER_ENABLE_DEFAULT=y, so scratch is reserved on every
> boot. (26.10 has since turned the default off. I've asked for the same
> in 26.04 [1].) The machine is a single-node Ryzen AI Max+ 395 with
> 128 GiB and no hugetlb. kdump is set up the stock Ubuntu way, which gives
> crashkernel 2048M high + 256M low.
>
> Three cold boots of the same kernel, KHO on by default:
>
>   kho/out/scratch_len   crashkernel   no crashkernel   delta
>   lowmem                   760 MiB         248 MiB      -512 = 2 x 256
>   global                 8,510 MiB       4,414 MiB    -4,096 = 2 x 2,048
>   per-node                4,338 MiB       4,338 MiB         0
>   total                 13,608 MiB       9,000 MiB    -4,608 = 2 x 2,304
>
> "Memory: ... reserved" goes from 18,849,832K to 11,771,924K. The
> difference, 6,912 MiB, is exactly the crashkernel plus 2x crashkernel of
> scratch. With kho=off it is 4,915,232K.
>
> Both problems show up here. Without crashkernel, lowmem + global is
> 2 x 2,331 MiB and per-node is 2 x 2,169 MiB, so on a single node about
> 2,169 MiB of reservations get counted twice. That is the over-allocation,
> and the total comes to roughly 4x what was reserved. crashkernel is
> allocated with NUMA_NO_NODE, so it lands only in lowmem/global, at 2x.
> If I read Sourabh's patch right, it would count NUMA_NO_NODE only for
> global. On this machine that leaves crashkernel as nearly all of the
> global scratch (about 2 x (162 + 2,304) MiB).

To remove crashkernel from scratch calculation, you'd have to allocate
it from outside of scratch, like the hugetlb pages. Crashkernel is
usually allocated earlier in boot, so we'd have to call
kho_extend_scratch() before crashkernel allocations, and I am not sure
if something will break if we do so. I suspect we at least need to check
efi_init().

Not saying it can't be done, but it isn't trivial.

>
> The cost is not only boot memory. Scratch ends up MIGRATE_CMA, so
> anything that pins can't use it. Here that is amdgpu GTT on an APU. A
> single process tops out at 107 GiB of a 120 GiB GTT limit with KHO on,
> and at 117 GiB with kho=off.

Well, my pipe dream is to have KHO entirely without scratch. You would
use the same mechanism that kho_extend_scratch() uses, to discover all
usable early boot memory, and not pass over any scratch at all (or, a
very small amount of scratch). The only problem is that it might fall
prey to fragmentation. If preserved regions are spread apart enough, you
might end up with _no_ memory to boot from. I am not sure how to make
this idea reliable yet.

>
> Happy to test patches on this box.
>
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2171297
>
>

-- 
Regards,
Pratyush Yadav
