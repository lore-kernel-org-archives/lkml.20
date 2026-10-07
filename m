Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2569B3D6497
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393484; cv=none; b=c0J8IXwo3B3QoXStXcQixtWscnvuyl3eV9hsmFkX6T6x+ak1YK53sO0g1PluFtcA5ytiK3GxwfqytgvG6beeK4wJfKeu5ufdAPg6/RihBUnXjDrT7JBj0Bs04Isvb7K/z448xmt1ggqZ980NjVRyNw3OpximLAqQpnTOWa5l15E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393484; c=relaxed/simple;
	bh=VWBXBeCAOlu2+bUY6ppq5y7Zps8qvmwXRX16Nv8sC/0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pFeBWhXzRz+aETuL7txeChJLhOWsU2bNrWnNSaXgye4li0+FYsdiCBgLObrgs3n0APF15JedyOUhgbL0ciIDqOIl6pDgfyY24GICYEGy1onHGBLczr5KrIL4npGo6yFv/n6TcYtwv0WUZgQzr7dd0SUEo1xhoXwpeRYvJj3qx9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=nCoC4BTa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="nCoC4BTa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5049E1F000FF;
	Wed,  7 Oct 2026 17:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791393481;
	bh=0LzZLCBZAwnFCQRD6C+T6iKIcbWqnM1Cc+hDqPL1/OQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nCoC4BTa7Y2Fwd6snmgAAdaRSpLP1XQB6onKnUBkDcFVGUmC+eV/z5mPHcPBhnEGd
	 paof5LDn0411OEnunMdpowPIEh5CaexGFGMxncyrxmFbTuHwaIkpBfEzIuRX6RPa9s
	 f7NndyKR0pQLEO1igol06p/bUx20z8f+fR0kusI8=
Date: Wed, 7 Oct 2026 10:18:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Oleg Keri <okerixx@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vma: clear vm_file before unmap on mmap hook failure
Message-Id: <20261007101800.58d50b1b20a10738e630bfd5@linux-foundation.org>
In-Reply-To: <20261007070913.3923-1-okerixx@gmail.com>
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-3-a1f052500fd7@kernel.org>
	<20261007070913.3923-1-okerixx@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2026 09:09:13 +0200 Oleg Keri <okerixx@gmail.com> wrote:

> Since commit 2ceb21171dd9 ("mm: consistently validate VMA state after
> mmap[_prepare] hooks"), the mmap error path clears vma->vm_file only
> after unmap_region(), so free_pgtables() unlinks the never-linked VMA
> and drops i_mmap_writable. Once it goes negative, every later shared
> writable mmap of that file fails with -EPERM until reboot.
> 
> Clear vm_file before unmap_region(), so that free_pgtables() does not
> unlink a VMA that was never linked to the file.

Thanks.

Sashiko thinks this fix might cause a null-deref:
	https://sashiko.dev/#/patchset/20261007070913.3923-1-okerixx@gmail.com

> Fixes: 2ceb21171dd9 ("mm: consistently validate VMA state after mmap[_prepare] hooks")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
> Seen on next-20261006: one refused PCM mmap probe from alsa-lib left the
> device unmappable, so PipeWire could not play anything.

Not good.  I'll add a note against the suspect mm-unstable patch.
