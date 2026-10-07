Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0804A6CFE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791387552; cv=none; b=jiYp4pulPXIIQ8/m/egngWZYCGR5soquwlQk42MUvKXaAu6ScVrzF/cuhKdGThacuaJKEejg2WuH/V+SLGTPp2Fy0PZFbb18AzZYZtUsN4brhuje/lt1dSDO7MKZ55LifTRAD4HXFy21vQCPcCWFM8B92tO47FoikKVYQJ8X2wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791387552; c=relaxed/simple;
	bh=lEndefRMOrzgL5rc55RfuNGOZwWs47iEdpn/+KJMZzM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OTm/CkprUKw3VOybipJheHYgqK5XWT2KHUrZu3xEUXi/dq3xRnZuUjkg/mxRiPvFILLezkHAhzDkbrJ3HhFNSkBVGHlh5KjPXU7um+SX9A8RcHPMiRwAPnrHagzjA/5LChrxe2XI78Fl+BDvxczYah8fJ/EY5DFkMuCbwCp6cK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S171WsZr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S171WsZr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625CF1F000FF;
	Wed,  7 Oct 2026 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791387547;
	bh=p346DBewhLxeZdx36JJxUf8JaJdqjbbB8zICG+z4Gag=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=S171WsZruMhmWqVUT1wEsBGoQpcCiOreN97b5RnO44HrFGwuJt4tgcLEPCjvdWpyF
	 P6w29UIbMaRvnLv71WcHBrQizbGaspuHyDyvGO0a6ysTKA1lU4SnaV5GdcA9u7lTyK
	 c1VqW/jSGg5ZU7mUwMRs+dnJjTKlKZUzHs64+3/OLGDgkFB/RQSFozUX9nK+lAIe17
	 +CRoj7/bGyw3DLnyiNx9xVKGOq2wGBrRiDlo6YPNSxz9KLqT7ekvQl1szSkeosregV
	 6+ULo0OUxxvSbokkGjG2ww/ooA1gvFgAsfn06tUbThUEQIoAXyBeXH4/EzF5KLVogp
	 PYylQg+sbjZFA==
Date: Wed, 7 Oct 2026 09:39:03 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
cc: pjw@kernel.org, oleg@redhat.com, debug@rivosinc.com, alex@ghiti.fr, 
    guoren@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ptrace: reject CFI regset access when extensions
 are absent
In-Reply-To: <20260820063233.2567-1-cp0613@linux.alibaba.com>
Message-ID: <8a340efc-d50f-40b1-698e-65bde2cc0660@kernel.org>
References: <20260820063233.2567-1-cp0613@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Aug 2026, Chen Pei wrote:

> riscv_cfi_get() and riscv_cfi_set() do not check whether the Zicfilp
> or Zicfiss extensions are present. On systems without them,
> PTRACE_GETREGSET on REGSET_CFI still succeeds and returns a zeroed
> user_cfi_state, misleading debuggers into believing the register set
> is available, and PTRACE_SETREGSET silently accepts writes that have
> no effect (e.g. clearing SR_ELP).
> 
> Reject the access with -EINVAL when neither branch landing pads nor
> shadow stack is available to userspace, using the same availability
> helpers as the prctl path.
> 
> Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Thanks, queued for v7.3-rc.


- Paul
