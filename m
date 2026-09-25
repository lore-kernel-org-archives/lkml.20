Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FAE4562BA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322307; cv=none; b=YGiJJVKNmgWRivvJWsaNx8ZcH7tzGPYpvEKzI9ornvGwsjwImTgIZy+OUaaada7nnJrAvVzEQRT8BeMtTKUwlV536GqCRd+vRyM6kTmo9yf79t6rY66IuamUTzRxw1yQRw98cp2ShZ0CNyTbQNqoRN/O+t2Ejufg84evVbPMNV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322307; c=relaxed/simple;
	bh=heFdcvQGNWUArbNYmzRquOJetzpYllqWGrWAVYi8W20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMU2B15mSUkimxXs0S29aVZENNYF6QeD4Gpp/tT6GgBp/ddfyPyCfMlCmYR8TJm3VuZtm+5GTsP1FLjC5Vd/UXqQPqz4uHmLnZW6qPkvzWsUbRLOeyDD+6gGPeBqCXXJoo6Po2KjyAAdUqCAI/hHkcUAuzryouM0iL8fpM/dODE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VAeTOBMJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lWUk7fOj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VAeTOBMJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lWUk7fOj"
Date: Fri, 25 Sep 2026 09:44:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790322299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtWmTU06YdsuZE+fXiVc9MxOHsMRsrZATbjWp381J7E=;
	b=VAeTOBMJi5I5cGBngoZWkaDq2W7UDhQCJYG9aqiLNCoUDJu3wMD0aYK3YqIoQqwRkrCsX2
	03A9nVglUa7bXADcxHi+wsIOGeBoLDAJaABc3a8uwRz6FglpIToL13nt6yzESy/ATv7Krq
	uUoiXQkw7y55bupw9QtnnHLZqQjLIrTmiQkDyigASMmkjv6pKSXUlHaKr2TJAc3gkVep04
	eGbnUOdaXLsVafICpPyYuvl01K7Hy5xHVR+t3eREW10iTHWiA5F9m8uN8SN0Npubpzw9C5
	f0rtsyppMrFvstbXdwpJ3oq2pHWymTH+jm+ZJDiRCDQQE0OSaoaOu4okylJ1Pg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790322299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtWmTU06YdsuZE+fXiVc9MxOHsMRsrZATbjWp381J7E=;
	b=lWUk7fOjlspfsRCzYOfKGiyXWPo0E2+PTx0bmMIFNI3jT+Kkv9m+KqctMbU0IcUc8OouwS
	kRfl1/pYEvEGEWBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: tglx@kernel.org, luto@kernel.org, vincenzo.frascino@arm.com, 
	david.laight.linux@gmail.com, linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v5 1/4] vdso/math64: Use OPTIMIZER_HIDE_VAR() in
 __iter_div_u64_rem()
Message-ID: <20260925094434-d13d4b84-b552-4a34-87ff-033330213268@linutronix.de>
References: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
 <20260916023252.418473-2-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916023252.418473-2-zhanxusheng@xiaomi.com>

On Wed, Sep 16, 2026 at 10:32:49AM +0800, Zhan Xusheng wrote:
> __iter_div_u64_rem() divides by repeated subtraction, because its callers
> only ever produce a small quotient.  A barrier inside the subtraction loop
> keeps the compiler from replacing the loop with a division:
> 
> 	asm("" : "+rm"(dividend));
> 
> The "rm" constraint permits a memory operand.  clang picks it and spills
> the dividend inside the loop, at 32-bit and 64-bit alike.  The helper sits
> on the clock_gettime() fast path through vdso_set_timespec(), so the spill
> is not free: with clang 18 the x86 vDSO is 64 bytes larger in vdso64 text
> and 112 bytes larger in vdso32 text than with a register-only barrier.
> 
> Use OPTIMIZER_HIDE_VAR(), which is the register-only form of the same
> barrier and the form the rest of the kernel uses.  gcc 13 generates
> identical code either way, and neither compiler turns the loop into a
> division at either width.
> 
> Put the function signature on one line while touching it, and reformat the
> comment, which described the asm() that is now gone.
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  include/vdso/math64.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

(...)
