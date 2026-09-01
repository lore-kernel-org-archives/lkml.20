Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10E3845DC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304877; cv=none; b=H3fZv9r20MN/Ts7UzEoZkIh0IX8nxkbFmbhJQnqnDm1gWfj+N8MkksyCm/zrT9vi7olJ+TCTr+CnSU/W70nBFppckcuPRrhZWEXiy2Rv32CcRvGqpbcnLzFrZjQt/zHtDsAAR9Zf49aGizpzaMYMQKw6g+ACO3uATQpQKXmwWOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304877; c=relaxed/simple;
	bh=7fznNPBk82MFTw7J7VdyvQeSjCjxJvT4NbeH/sezR60=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JunhmSCTLOe/oYzpAZD3gJRaBvPY8TSL64Gf7ZB/nqSnJX53Wwbz/8eeayrgkGxjWZTno6vhKjmQZDsu4ca3GkivxFrfysa6XwPqkn129VRQ4sZya+ekxQ90XK1Yz/HECLfHokPDzh8c6QQ54w8UN7na2VcvOdT/YVhEk74fA8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCC9iU6a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCC9iU6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2E41F000E9;
	Tue,  1 Sep 2026 23:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788304875;
	bh=fg8HYCic2KvD6ERFxLi9YLdZaM4AaREOJ+wz6dO3tRI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=fCC9iU6aAOY4JY0zSYKbNrEJsY9OQa2tu5LBsjyKnn0CiSrtYX90J6Z0+eylTWVLb
	 LRUyJvMmzt+GsS7mk4lX5ias2MHl+nEp+RTDzmyP2OwyLKxmZ2MhrANfEMDSkga8t1
	 vwsdJiIQqsRFbg08FCyO8NDpfFI6vHdG+62vlSjESFQ97t0+EYfk3QdoXWS3B0DzOA
	 WJEU4LN6ymUsc3yagGOTvR8pISEUYJdhosGuX+JIKxnRkGdQpxB5AJqohzM5Qit/oI
	 T0Lquxe6t9JSfpN5W94+4PkeH45fRTZ+A+zZ8dXSWcBwY5CFDpb8rh3sAVj4n+cHuN
	 K3lotUhdaIljg==
Date: Tue, 1 Sep 2026 17:21:12 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Ivy Lopez <skunkolee@gmail.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    conor.dooley@microchip.com, schwab@suse.de, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: hwprobe: simplify has_fpu() to check D extension
 only
In-Reply-To: <20260901013746.19386-1-skunkolee@gmail.com>
Message-ID: <43f90c0e-239b-7b8f-2359-ee72bf2ecbd7@kernel.org>
References: <20260901013746.19386-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Aug 2026, Ivy Lopez wrote:

> The kernel never supports D without F, since D depends on F. The
> D-extension flag is cleared during devicetree/ACPI parsing whenever
> F is not present, so has_fpu() checking either extension with '||'
> never actually produces a different result than checking D alone -
> F without D cannot occur in practice, and there is no observable
> impact on RISCV_HWPROBE_IMA_FD or userspace.
> 
> Simplify has_fpu() to check D only, matching the expectations set
> elsewhere in the kernel for this dependency, rather than relying on
> a redundant OR condition.
> 
> sys_hwprobe.c already calls has_fpu() and needs no changes.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221874
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Suggested-by: Andreas Schwab <schwab@suse.de>
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>

Thanks, updated to apply and queued for v7.3-rc.


- Paul
