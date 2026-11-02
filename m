Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661737;
	b=HIui8shO3giQKk5KVH0Ux2FXW6gdqmVVKo9Bp2RYsNBaRa75VfkCxaw+YptNWEx5W1RI
	 U8drx4288grkQ1Ij+MzscXFsUXYhyLB4UhcMJOfYSTkswTcXiHWtPSjQkXulrAvbkQgxv
	 DvvQmuJ7XUUdNgbwmak3aNHrZJBmDMeaB+vIETcfjLtp5qo4V/SDYcNdgKm63Cr5ccrVq
	 5R7v9SPSkAn/sEccQl17+dxCudiMA+htacoeEx+nd1pA4D8XRM0HqmYb9mvfLR0NjAhGk
	 0MaN0jnu0pyEKwo/sh/F1y1HXEMBxrwZqC4rfav2KIUhYtul9oloRXxwYzFYCplYAZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661737;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=bsHjIeC+QzYEimr0/KoDAV0tILVzzGUPOXG8bTQnrHc=;
	b=zD67fBnw6r9/lxRFjWAkZTzw9XAbmun6bY7Umwsh8lLdDQ3TmH3IdRsTtT0gycDu+Fhc
	 vbQ2NyEGwQwJPS5qT0Kjx9Odd9qrpzolPzWMJCW5gVEHcA06BYTnMpqR92PPXS3jXQbBl
	 ExsGvRDVlHWZIw9KLD0kqt1LrxlTNlK2q05NpSTLZeV33744t3C5LMGWbdAAvRtUG/7MK
	 exqnGGn3Qyx/UBPQ32bLwjRl9/m7eJWOLutr646VBOwn1kdlwho0mqwG1zxt5mUCVsAm0
	 ha1un9T43Jw+16u2Vve2L3jFLYhrUMKRpJWZT+vWXzFOF1usEXCtamvqtmTLAIBFcZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePd83+K0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6D7606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePd83+K0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B3C1F00A18;
	Mon,  2 Nov 2026 23:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793661737;
	bh=bsHjIeC+QzYEimr0/KoDAV0tILVzzGUPOXG8bTQnrHc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ePd83+K0OjyIgucg/GFm8mW6KoJtPt1D1hvW8rXDtO813zS3T5bF2ZAGZD+4sCay/
	 /xIUWWpfViySEz5phlAbpFDqH9Mr9kJh0W1yxXJ0l8B7uYjIYpMly0tvBR/ptAFFeB
	 ubTdVXchLSqhb7JhhuF5SR4kM6dcZCx1+Lu5Mm+3b5HbtV7Kp16h4t1+tvk/0yPsV9
	 GWmhFoiStWsgmruZZQfF5h/NTqm1/B5Df9b+MGBBhad/tY3Qk4TsB0rcqiZWuHFGOZ
	 Kdquk/A1oLEmwF3QU96vhK6s7xlVWo34+uxa0ARfwKp9bnMsowdhfHpEas2jbgNYqV
	 aVD1ObMBuJ9kg==
From: Thomas Gleixner <tglx@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: radu@rendec.net, linux-kernel@vger.kernel.org, Avi Weiss
 <thnkslprpt@gmail.com>
Subject: Re: [PATCH] genirq/core: Fall back to a static default affinity mask
In-Reply-To: <20261031133851.181601-1-thnkslprpt@gmail.com>
References: <20261031133851.181601-1-thnkslprpt@gmail.com>
Date: Tue, 03 Nov 2026 00:22:13 +0100
Message-ID: <87bj86yg2i.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Oct 31 2026 at 15:38, Avi Weiss wrote:
> With CONFIG_CPUMASK_OFFSTACK=y, init_irq_default_affinity() does not
> check whether zalloc_cpumask_var() succeeds. If the GFP_NOWAIT allocation
> fails, cpumask_empty() dereferences a NULL mask during early boot.
>
> Use a private static cpumask when allocation fails, keeping the default
> IRQ affinity mask available and writable.
>
> In a QEMU guest, a test-only allocation failure triggered the boot fault
> without this change. The patched kernel booted with the same injected
> failure and allowed the default affinity mask to be read and written.
> Normal and irqaffinity=0 boots also passed.

If that allocation fails the kernel won't boot at all.

Aside of that the fallback mask defeats the whole purpose of allocating
the mask at runtime.

I'm all for defensive programming, but this is just trying to "fix" a
problem which does not exist to begin with.

If you really want to do something when that allocation theoretically
fails then panic the machine because it is going to die on the next
allocation anyway.

Thanks,

        tglx

