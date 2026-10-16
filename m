Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50844423E9E;
	Fri, 16 Oct 2026 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162542; cv=none; b=ebBUrK+R4oN/a1pYQDKpX5xSLa0suIVLlC8X3lBABQ15lSdgmTPebfwk/1ZuEOnBQtx9gY/s4oFePyg1PbW5uQo9xm8m6otrbentGZYmu1yn9COhz5yB8xG0iFk/yz5wmwagXvxTArmju2/zDAcG/Lzx5HDoFbDvTZ98XVaEri4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162542; c=relaxed/simple;
	bh=iLeQksrkUZZ+B8sSmI4fp0bRW5ub3nkmSkvKdHG+Nrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+lzG1V7g7J3VK1fZbEo4JuQia135M1eTC69BRz/3KSzAmRQ7LwODNDpeGQd4sRqBzdfqXqtqzgJNgYx90tKm6IYqJFuRjdukAqAwW0ENgDEMb7bTzM/w1nnlUYnsfB9WduhTHooOZzij0weUYHDtDGPFAQPmn+HkViFoyJSmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkSh6Q45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkSh6Q45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC601F000C4;
	Fri, 16 Oct 2026 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162541;
	bh=iLeQksrkUZZ+B8sSmI4fp0bRW5ub3nkmSkvKdHG+Nrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XkSh6Q45CXdKP4f/MlT06gpZoQtRFOEr1GPIl1D+oKexhnlPzCOvISsD3+KFc1DKb
	 gQKjYGZPFT3ghwdBY3EXfZNZHJR5CfURYFKUwfPN9XmxPNmQSN4fkvRCRma1x0UmTN
	 NKQDoFg9MBSTzOFeiFng365VCs4WOi0OLN0/2ZuOpmc8lT6YJrSzwp61OrYoigbYdg
	 y7aeiTaaL0dwdlTk/v0Im3RIsfw9fgF5mdmKvj+4ax6ti1uWxH8bTitLWlsDr7qW4V
	 Ol6ez1VGT5bHelyfkLv9wsqeEFODJpiEs/cUN2WFiFUMdxIAd7cD9IIylWaTFwXv58
	 HwI15cQGOkSxw==
Date: Fri, 16 Oct 2026 15:55:34 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Daehyeon Ko <4ncienth@gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
Message-ID: <atI6TVqoOhv0XMQ9@gremlin>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>

On Fri, Oct 16, 2026 at 12:34:33PM +0100, Lorenzo Stoakes (ARM) wrote:

> Care must be taken, as resetting the sequence count at overflow means
> changing the seqcount of VMAs which are already attached and observable.

For the record, Liam pointed out the overflow as an issue on more than one
occasion in the past, and I (and I think others?) wrongly dismissed it at
the time, so full credit to Liam for raising it, and mea cupla to me for
not seeing it :P

That saying about assumptions etc. etc.

--
Cheers, Lorenzo
