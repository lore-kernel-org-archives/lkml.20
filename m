Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521577;
	b=zUQdvcuGZq1sIiycozTYE3cSPtqN1/GdW5NmObeB+xxdPsdaMv47rVHPhKU/kRJekDam
	 ZbW0r3GaGkAivmZDo7bipRFKsCtutHX8XaGCv8eEYe01DTVlbreI2NufcAZY6hae0AQHB
	 +knuXVQdJNfokwZ3cSvipUBCsq3IE5IrS28O9RbAMB7nQ8Nlv85uu1Ron99/sinS3YwfJ
	 4VO7JFCOHUbikZ3xlDrFbqOwQMY8KcXNJcIPmf4Dp7Y3shR4PzkW/O0LWQpZIB7HT3G8S
	 KacSLfFx2C+1fyvqeIRocXtbcvPSNcI2VLIraY7hU/BGJIXEhUtihThLIxdQLEcROjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521577;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KNsJBBBgsxOmM1zuQK6aYuVr+p7Ctuqp4i+1aNHodeQ=;
	b=bwstfatkOP/xtKTSlsXqg8J5Qnpj5ePUImFKBkxhzXhBRWd8xHeHocmgN9vPFY6w3J20
	 P47pC2ou/fue0UwVO7AOGLsjwmDWxdlimj1aQ27nNJNFFQH7yogvXMiv6Agef0IsylCrG
	 ulH/dJzeMvRQ36HP+KS72umQI9hHhgEMY8n2W+02fiZST6/kUIYnchw3fUmBZRKJ6ebEb
	 7fnyGddL5RC6nuhsW+vUkFxZBWB3oSGQT5A9hzT1unii0VvQ7dqyCWxfSw69qGdq1un24
	 FlBko5+67ndG+HjN11LCmUo5q6P4zgK7+4fGJ7WY+WnSBldy7bGGbny9HF0Hr8eT2gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvIAQjUJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F210606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvIAQjUJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFC61F000C1;
	Sun,  1 Nov 2026 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793521577;
	bh=KNsJBBBgsxOmM1zuQK6aYuVr+p7Ctuqp4i+1aNHodeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kvIAQjUJHsI2zMo7gCLMkjddDhJaogUsYHfyK6mHjWnhUcES37ve1U4Ic7IntD1U+
	 nTBKCw0GRaIlUlxkfIWAbPLhLL4E1tFR7FSouSxfzbgcf1kyHwjZQZ5dI81SqJARPU
	 MRFf1k+zG7GrX9S8aNvONy+Otf6y9QlbVM5m9Edqg7NhKfsoL5150rljpLjmWyg6oE
	 dstM+toHdhCMY4PI6FwbIR1rTcmH4CGZA4Kd4c94+YOAds5JGP9YFtDLjWul0wgKf0
	 Ur5vkZpRkyaLhfGCGiMI3E+su8K9kwua03lApNoIh9tBl8gQ2VGTLr8gDFqS+GWX+q
	 sDa92PtrmDtMA==
Date: Sun, 1 Nov 2026 10:26:11 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/userfaultfd: store the child's new uffd context in
 the wait queue entry
Message-ID: <aub3o-i3h2OVcWM-@kernel.org>
References: <20261031-uffd-fork-ctx-v1-1-a837fd576ffc@columbia.edu>
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
In-Reply-To: <20261031-uffd-fork-ctx-v1-1-a837fd576ffc@columbia.edu>

On Sat, Oct 31, 2026 at 11:47:48AM -0400, Tal Zussman wrote:
> A UFFD_EVENT_FORK message cannot carry the child's fd when it is queued,
> because the fd has to be installed in the fd table of whichever task
> reads the event. The forking task has to hand the reader the new context
> itself. It does that by casting the child's userfaultfd_ctx pointer into
> the arg.reserved.reserved1 field of the UAPI struct uffd_msg, which the
> readers cast back.
> 
> That temporarily puts a kernel pointer in a struct that is copied to
> userspace, and results in ugly casts when passing the uffd context
> around. While resolve_userfault_fork() currently zeroes reserved1 before
> it is exposed to userspace, this unnecessarily risks leaking a kernel
> pointer to userspace if future modifications are buggy.
> 
> Store the fork_ctx pointer in struct userfaultfd_wait_queue instead,
> which is kernel-internal and passed around anyway. The casts and the
> zeroing go away, at the (negligible) cost of 8 more bytes on the
> stack.
> 
> No functional change.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/userfaultfd.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)

-- 
Sincerely yours,
Mike.
