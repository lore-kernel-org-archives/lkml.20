Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498687;
	b=nyOQt+v/a3q+1ha7pjHFvpHg5XBezcONr+VfxVnTsbGoK9w5ZC438WEi3PKv8cDu3iJ1
	 rZvpKi6xpm9NcJQpYIXUg9Cn3z2A+vrJ3vmVTDwIfh+R/WhmbR78I5W6I4bbeopcZK8gx
	 kGOO8jrQsVrhqaFhJStrmX/IisvfBTqqTUU50F6Sr820Cvs2g9Hc5ArYRl4VbeKgpMmL2
	 0h0XZrAY6i9e28QT2dv+9DwSp3A/tpjDnLKTtPw/eBu67LNl0g6CxE5M4figYhAPb1c7I
	 EIGp4nJo3q4ysoimDAARPoqQMPtnnrbNo0i/RCxuFoe1fQoudjiPMJPyL4Dt8CcoNsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498687;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UxBkeTu2DJirZGWSp/mREpz7BgJGoSDfzOYmt9Hxv20=;
	b=CkCci8w8Y0rtJ4G2HUsT7YO+Hxmh3mp+B+RYr2dcR1w79kq7/fj8Btxvmk/tW4bvLHyN
	 01i2qbR1W4t2VfzVJ/gGPBjZP8RaIWYhkmr4lCz/U0GqW9jcWMUpn9KCtaN5/lVQlteut
	 0hEUar/jDVOITKiqgRb0EWMJkPBZNUM2+Yh5gUvHzCzz2iunIn24QSvGcuCmJ51+JpSDi
	 FOp87dsSiLnZho3KGtzcQNewGAK2hLKic9hxWSy1JRQMlq+Bgt1rBN65sqGJRjjF/0Id5
	 kK0s0MVn0cJkJOVUgnjHtxMmAMoEeD57IIlVJ51PGtlx+hpvFAxL0Ex6ULEVQtRVMkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oUjcnM5G;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F6D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oUjcnM5G
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48F331516;
	Thu, 12 Nov 2026 07:51:22 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CCA13F632;
	Thu, 12 Nov 2026 07:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794498685; bh=jPK6Mju/7uxku40iuWsPgD5FdGQZ3PgDxQ5h5XG1PXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUjcnM5Gf8YQG1taf3fYwINVsbWZUaLEgU5uqHHesHdt6Vd/4eFvFI4mAzQxS06Hz
	 KycnaOiVhow+nOf7GwJ1GPHykbRwuG4HjEfy8ghNtN8Z+/wrW+iBViJ3EjENebROeV
	 ykKfAeFA8BzZZnIqn16AxxVBR8Prp2xtY2VvWfLQ=
Date: Thu, 12 Nov 2026 15:51:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, vlad.wing@gmail.com, harry@kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] mm: kmemleak: drop kmemleak_lock in scan_block() when it
 is contended
Message-ID: <avXgd-aE8QazfR1G@arm.com>
References: <20261112-kmemleak-scan-lock-break-v1-1-95808108d03c@debian.org>
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
In-Reply-To: <20261112-kmemleak-scan-lock-break-v1-1-95808108d03c@debian.org>

On Thu, Nov 12, 2026 at 03:48:01AM -0800, Breno Leitao wrote:
> kernel_lock is a damn hot lock, used on allocations, free, NET_RX, etc.

Nit: s/kernel_lock/kmemleak_lock/

> It is also used on the scan, so, while scanning, most of the system is
> mostly waiting for the lock.
> 
> On meta fleet, this is, by far, the most contented lock. This is not
> a big deal, because very few hosts run with kmemleak enabled, but,
> I think we can do better here.
> 
> scan_block() takes kmemleak_lock once per block and keeps it, with
> interrupts disabled, for up to MAX_SCAN_SIZE bytes: 512 words, each
> needing up to two object tree lookups. Every allocation and free in the
> system needs the same lock to insert or remove its object, so each of
> them can wait for a whole block.
> 
> Keep taking the lock once per block, but in auto scan mode, check every
> 64 words whether anybody is waiting for it and, if so, breathe (aka
> release it and take it again so that the waiters go first)
> 
> Releasing the lock is seems safe because it only keeps the object trees

Nit: s/is//

> stable during each lookup, and scan_block() does not use an object found
> under it past the word being processed.
> 
> Tested in an arm64 KVM guest with 48 vCPUs, KASAN and lockdep, running
> stress-ng sock, fork and dentry workers on 8 CPUs during five scans.
> The kmemleak_lock wait times of the other CPUs, from the lock_contended
> and lock_acquired tracepoints:
> 
>                    average     p99     p99.9
>   no scan            3.7us    <16us    <32us
>   scan, before      15.8us   <256us   <512us
>   scan, after       11.7us    <64us   <256us
> 
> The cost is a slower scan, as the scanner now queues behind the
> waiters: the five scans took 179s instead of 118s.
> 
> This patch does not change interactive users (echo scan > kmemleak in
> debugfs), given current != scan_thread, and scan_breathe() will not be
> called.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

I looked in the past of getting rid of kmemleak_lock on the scanning
path but I couldn't find an RCU variant of rbtree that guarantees it
won't miss lookups.

-- 
Catalin
