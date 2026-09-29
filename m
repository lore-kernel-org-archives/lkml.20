Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99183D45EA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692405; cv=none; b=YAfsKqkX45drQnLI99CVERsHoOywiqSPvUEz5U0d9AW8bpG4WwbQ2KFWMR4iyrCPnyhCe9sZlmn2XcEToEbUlTFOgNSt4XbsBiGonTCRunfO9PZh87MVjmEfsZFCAMJOI7zYsxBPwTjZcuYB9W/OBVSEtOGSg6U6DETn8SA1bPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692405; c=relaxed/simple;
	bh=sqIXHsgjuzSOpBDIveJReY9Pac4X4nNriTQoVEBFmoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc07v6EKrAOr8fHZYFv3aTyMJtAlyxr9HSQcMVSLdzmaWY+1a4GYCzMgcdjfCVnbRq6W8dz8m2CzLJyzvFD5o+3G7PXuKnRT72NAO3NDHMJOiOBYGAom0GgbYUrBaigZyVxMriivaSkBfDt4MjqfM1Cr+kgzIh3odZC5Vf3IP9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMk7n7fK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMk7n7fK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84491F000FF;
	Tue, 29 Sep 2026 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790692403;
	bh=hJHLsnpcNA0uTePr2GlOIQUb3XJZmhtwsyzzBMfiqjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QMk7n7fK582l2SG6gvpFPcNiwSIAWgS/JHPXyyx/xyD9rd4yc0MFOaQ5CHanM5wDX
	 wPHjijvU1QRKT0q7i424r4ppLn8RMpZydfTaEulN5vZAL4Di83V939/W0Z0Ymfpluo
	 p1J9aF+eisnKXsh9pqX1+TLfVhLAoGmsGJnaqpt2ffNiJMwc1fUIUITXFMIcKuY7b5
	 /d0fac8HxoIqoCsGP+3H0M5kN9myuetgA5FEX2IjIif6Eti66NfTkBpSVdclRIHKcR
	 Uqnw5emfULHcHJm9txWntjFpm22TbC6pQ1FjZV0vabEbJfE7LOJAKc9YJKaLQhooge
	 CKfjvxI6LVPWQ==
Date: Tue, 29 Sep 2026 15:33:18 +0100
From: Will Deacon <will@kernel.org>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	syzbot+635d160c0d4133481520@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [RFC PATCH] arm64: mm: recover from kernel-mode SEA via
 exception table
Message-ID: <arvMLr8Mdh6ZKCtq@willie-the-truck>
References: <20260912135546.55977-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912135546.55977-1-ngocthang2710.1999@gmail.com>

On Sat, Sep 12, 2026 at 08:55:46PM +0700, Nguyen Ngoc Thang wrote:
> do_sea() unconditionally calls die() for a synchronous external
> abort taken at EL1, without ever consulting the exception table.
> This is inconsistent with __do_kernel_fault(), which does check
> fixup_exception() before giving up.
> 
> A SEA at EL1 is reachable and recoverable: futex's LL/SC atomic ops
> (__llsc_futex_cmpxchg/__llsc_futex_atomic_*) carry
> _ASM_EXTABLE_UACCESS_ERR entries, but if the user address is mapped
> to Device memory (e.g. a PCI BAR obtained via sysfs "resourceN" and
> mmap'd MAP_FIXED), the LDXR/STLXR pair faults with a SEA instead of
> a translation fault, and the extable fixup is never reached, so the
> kernel oopses instead of returning -EFAULT to userspace.
> 
> Check fixup_exception() for kernel-mode SEAs before dying, mirroring
> __do_kernel_fault(). No taint is added on the recovered path since
> this is a userspace-triggerable condition, not a hardware failure;
> a ratelimited warning keeps a trace of it.
> 
> Reported-by: syzbot+635d160c0d4133481520@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=635d160c0d4133481520
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> Sent as RFC: verified by code inspection (ESR/DFSC decode matches
> the extable-carrying LL/SC futex path) but not yet reproduced under
> QEMU on my end; would appreciate a look before I chase the aarch64
> repro further.
> 
>  arch/arm64/mm/fault.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

I guess this is trying to solve same issue that was reported here:

https://lore.kernel.org/all/apsIH2hDpeiGiazJ@willie-the-truck/

however, I suspect you don't have to try too hard to make the abort
asynchronous and then this won't help. At least, if we want to go down
this route (or having a fixup), we need a way to guarantee that these
things are always synchronous.

Will
