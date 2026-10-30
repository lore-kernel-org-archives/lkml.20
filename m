Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361734;
	b=gRmWhGnorFqS+qFper1zD6pB7jGULxsaN7EIyHlAcNJUfe5w+pA5RAcGM75LalYnQlQT
	 DPXUFaEHcnb3HTvrW2hfcmaCij+tU5/IuD5a+m5VMhP5XnmUCr1P0cDNtqVFYOCHCK6Q9
	 DHg4W7IUOIQ/960XvB9/6drrK1N2WyDNXtEBp3L7dyhEnfaaiLcJer+evbnkBZEzkjG4l
	 9MaDR88aC0MaQYmbBTLX1JfC4aUjMhO7Zh7mYYeKMFo7rtzVq7TzLaufLiENb+UWOo2Vh
	 Y/Md6RA2jvsDT7jvwnAqupzV8R+UjvCH/JqsIO84GIURFb4azM3DSnHyRokecSx2UQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361734;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FhCL0UjvfajLF9Td29Wetjv7XPgfVonqSvJL0PeGZ4I=;
	b=bXlT1PWcW8KBqqB62MpHTHWoqo8sKTrm5gAdhkV/HEtiyD56JM1HU8cWIPylLXKcYp8x
	 V7mwbU95IkHJ0lm/7iq7spLN9OPG4Im4kJRP4vAGIf2RxiDqbFpusUOEtloxH5GfyJ8ci
	 wauPAizYq/akxt4seB3PzyiR67d/3irzhYAHaxnGwE8sNTysJfptUNc/SrML5mxG2+jNd
	 Rs7gL9VVIWOYsaSunYVA882PUbxxMnHIWgn+QY65FTZ6ZGoYuQNmfepxxmEm1J7AemuM+
	 q+e6iVd8EMjJj/Xt541bcJqyTcvymWl5bHaTTmx0Rcs/c/w140y1fjWVMfVc/nnOSQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Z3wC9bLf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE99606A31A;
	Fri, 30 Oct 2026 12:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Z3wC9bLf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D341F000C1;
	Fri, 30 Oct 2026 12:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793361733;
	bh=FhCL0UjvfajLF9Td29Wetjv7XPgfVonqSvJL0PeGZ4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z3wC9bLfEjcjChsPlQIyDqkssx6yeCKQrt1FPWLXmDD4JVx2VhMhj+yQ1iyrRsWtW
	 47taIsnQ0be0orFMlNcshfYcOO8NIfAJk8bCtmISkoM3G0vKPtPmKYjTNCH8HT8koj
	 pNfKGiWFEkg2ctG3QwVfaK3GrMzbyGpl7mVxL7sk=
Date: Fri, 30 Oct 2026 13:02:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: mathias.nyman@intel.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: usb: xhci: unlocked secondary-interrupter/virt-device teardown
 vs sideband API users -- use-after-free/double-free (remove and resume-reset
 paths; needs CONFIG_XHCI_SIDEBAND)
Message-ID: <2026103022-ovary-cloak-f017@gregkh>
References: <35c7c41b.1ae57.1a18c9d1018.Coremail.xuhx@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35c7c41b.1ae57.1a18c9d1018.Coremail.xuhx@hust.edu.cn>

On Fri, Oct 30, 2026 at 07:41:05PM +0800, 徐晗翔 wrote:
> xhci frees its interrupter[] and devs[] software state on two paths
> that hold no xhci->lock -- xhci_stop() -> xhci_mem_cleanup()

<snip>

These are all pointless, sorry.

Please just submit working patches.  Doing fault injection of random
failures is an interesting research project, but doesn't do much for us
without a working patch to resolve the issue.  I've just dropped all of
these "reports" now.

thanks,

greg k-h
