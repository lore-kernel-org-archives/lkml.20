Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499045;
	b=0TAzVYvp5ONs/js6UoQvTXvybFqBRfh7nyhbfru/hQm/mimsOpdjhLQN4oJ/WXUMeB3i
	 1DNUuIuGE7vdnW72P2iggIxzXyMjTKXR4fXwHKEfYDZZzFERvq2vPp+clgFHZ6oyqamIt
	 3TwAOUGiFajkpsSpCzCnPXPcxKxdT22Fz1Rjhpo+qed6ak5xE6z6MYu5YVcPehWBFnLi3
	 Owi0Q12XCwPkWYVL8pvR8oQPsd22HiJDwUPsQ+9m+HCPgHboQC7TALhosbGKSs0NXBZ1u
	 6o/CZcnIJUfz3mjIYOh19ZwBt3O3YAXwdYF+G3l6AeywyVq3ZWl5KUlOZnIQB4YN/bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499045;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UUPw/s33/7GOIQXj56pVmCo2a1JAObu2BXLVvpm4deY=;
	b=eXQgFaD6JQeaNCjYVu35IiFDM7doCoPn/86LDhCWP7P6hf7tg2rYPB4oQit0jXUTKEG0
	 8w68O2AOUGNKD1WbbbvJcO6rnGwAkQ++fk+QF3hkdDROa3LB2qa8FwjwfzlO+7FpnG/uh
	 KGuiDEfui5sFD55OjdKOhVd3VzrAWIEvSvUuvJwEPd0Sg00y8gNyC4sw2JGubO524P274
	 dnrsOPtap9e2jBn4tHMLG4G2KGoVx6fTHqx12nGgpt1CjqVB3+YdMMWk3yIzXmUiCXdLc
	 rkePZ/ZwW2JnYb30asG//uiAx2tQeqloQb0oknfYHndwr84YbM6PHWy5IIrqwlIC5KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCAzED+Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C7E606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCAzED+Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A8D1F000C4;
	Tue, 20 Oct 2026 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792499044;
	bh=UUPw/s33/7GOIQXj56pVmCo2a1JAObu2BXLVvpm4deY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCAzED+YqRPe1/kSa35GjlylVG3/cwoP1T7uaDE39aVVXhql4QawqFiVCEijLg/H8
	 lK2s96/1Ybe/VGvrtZPF0tTfULELTjfs+4xNWh/s63oD1w02ofDubBWj58lE3OiU51
	 WyEug0sbodsSc0EGlKc62224Mo33Wk1TyERdERT52Q2KCDLZWFPeLhqogiIyr7BTND
	 IGRkJIYUmzftfKl+zjGGy9CTTxrNnz/sjXmId0GvxUT94mPb+mbuIUU3QFR228icLd
	 cwmajM0AF44Vt7nprvTNUq0AF/SSoUKUmDSQBSsJK/OpM5sXQxw3nDAnnRinvpNcW1
	 BvkAesbHFVg7Q==
Date: Tue, 20 Oct 2026 13:24:00 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Chen Pei <cp0613@linux.alibaba.com>, pjw@kernel.org, palmer@dabbelt.com,
	Sudeep Holla <sudeep.holla@kernel.org>, aou@eecs.berkeley.edu,
	alex@ghiti.fr, conor.dooley@microchip.com, atishp@rivosinc.com,
	guoren@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Populate boot CPU topology on UP kernels
Message-ID: <20261020-frisky-jovial-echidna-2d003c@sudeepholla>
References: <20261012131034.1026-1-cp0613@linux.alibaba.com>
 <20261020-unsent-commuting-91739a882031@spud>
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
In-Reply-To: <20261020-unsent-commuting-91739a882031@spud>

On Tue, Oct 20, 2026 at 11:23:34AM +0100, Conor Dooley wrote:
> On Mon, Oct 12, 2026 at 09:10:33PM +0800, Chen Pei wrote:
> > RISC-V selects GENERIC_ARCH_TOPOLOGY unconditionally, so the topology
> > cpumask accessors resolve into cpu_topology[]. The RISC-V calls to
> > init_cpu_topology() and store_cpu_topology() are in smpboot.c, which is
> > only built with CONFIG_SMP. On UP kernels, cpu_topology[] remains
> > zero-initialized and its sibling masks are empty.
> 
> I'm curious about arm64 since they've got the same as us as far as I
> know. Is the same issue there or are they solving it in a different way?
> 

Commit 4b3dc9679cf7 ("arm64: force CONFIG_SMP=y and remove redundant #ifdefs")
removed UP support and made SMP default enabled.

-- 
Regards,
Sudeep
