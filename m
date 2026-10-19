Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DFD4D2ECC;
	Mon, 19 Oct 2026 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405709; cv=none; b=m8GI/AjBuqKgxne/I6DPlVxyYYhv3so89byO3Jmcjuxhsxs5xtq7zE4vcMxmvq63ukzSAhqN2x3GOAyPuZ51jr7umWRxFd625ebYviU7+F6Qtvr6d3iP0fvhBl6c9HkzyVSvBdUGk4L2RWUTkUmx+NlkqgrERZBIZO5aHrBYOyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405709; c=relaxed/simple;
	bh=4qz8eMfz+Jo1KHqS+s17rqoQGTMxaqrvVFecgZkRitY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mt6cTg3Y4X8PRUWNrR5so7RezW4ps50OaEFPVLAohsJ/mBYfbjfEWn4H21Q8Wn4K9g0n0thrOhlRB9QkfXhye0ywoTi/K5AM2LM0HF6doCUGWcRFJZ5F3uXUKsYaqQS5hTSFu+r9s1LbmfnqN28kGbaN/DWGk1AzoEouk/yaFTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UC8edqst; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UC8edqst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD15D1F000C5;
	Mon, 19 Oct 2026 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792405707;
	bh=4qz8eMfz+Jo1KHqS+s17rqoQGTMxaqrvVFecgZkRitY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UC8edqst7rNXAAiHSudn8cE0SpHqwN5mu0IRB3MwqLGkD4KLbdFBkbNH+63YAa1y7
	 aB2CGqfzuNLYUEeT7JZIUtNoEZMBSJ6iyAPTMSCQsYF4/AAHox96ASbSzDYTJW1dmf
	 r4yHjsTqITpUsaDtORjeVdJGfu02BatGj4FERcrGXxT/BNOIPjhqDBMeYE5HqSf9ZC
	 MJyzB67rq1gV2S1IuV8mXA0njjcPsR/nrwLbdxzV/KFU9Z0RF2UCMM20X0AkfD/c+L
	 zCM4jmT0i+R+hEmaGK6bIQEJ6Nn9LUGG32qhCE7uUShFSd3ABoWIUuoqKSaHcuh9H4
	 PhldKIEJMV43A==
Date: Mon, 19 Oct 2026 11:28:23 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: David Carlier <devnexen@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kazuki Hanai <hnkz.64@gmail.com>, 
	linux-mm@kvack.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 16/39] mm/vma: only allow mmap to clear
 VMA_MAYWRITE_BIT if not mm-managed
Message-ID: <atXvrWt6kpQDPy8y@gremlin>
References: <20261013-b4-mmap-prepare-vma-flag-sanify-v6-16-1aa3c9b139f9@kernel.org>
 <20261018025905.201296-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018025905.201296-1-devnexen@gmail.com>

On Sun, Oct 18, 2026 at 03:59:05AM +0100, David Carlier wrote:
> Hi Lorenzo,
>
> I think one site was missed: usb_stream_hwdep_mmap() in
> sound/usb/usx2y/us122l.c clears VM_MAYWRITE on the read buffer since
> 71c610aeb177 ("ALSA: us122l: Prevent write upgrades for read mappings"),
> but sets neither VM_PFNMAP nor VM_MIXEDMAP (pages come from .fault via
> vmf->page, like the PCM status page in 13/39).
>
> So a MAP_PRIVATE mapping of the read buffer, or MAP_SHARED on an O_RDWR
> fd, now hits the WARN_ON_ONCE in mmap_validate() and fails with -EINVAL.
>
> The VM_MAYWRITE clear is a security fix, and the VMA must stay
> expandable for mremap(), so converting it like 13/39 or setting
> VM_MIXEDMAP seems the way to go.
>
> Found by code reading, not tested on hardware.

Thanks. I will check it. Somebody doing something broken as a fix is fun.

It might be better to fix that with a separate patch, I don't think it really
makes sense to add a brand new patch to this series just for that.

I will follow that up.

--
Cheers, Lorenzo
