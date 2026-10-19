Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F46491B16;
	Mon, 19 Oct 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420828; cv=none; b=MsxHCUogYB781RygEBOF2mGwne1NTUGeFO9MfXh+ddgL57VbGLu7yr5NgBkUW7iUKwQ0RWhvXxIh41r+YpnOXBY0+a5Prg2kp1/W20ZvwTMwZFi28HVVEO7bYpLwisnJPB5kkEAk4e+uG3aj1/Hf2r/yIsNqscgpnBvac6QT+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420828; c=relaxed/simple;
	bh=grbMMayDZ7AfUlhp6lU9LvTmW/PhQ8Ok6Mqphz7bbx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/q/ukYr4FRxKBkV2D65jOVOtxEd30wzf/JfvADB7piparkJUGBKDty5DxuSi+49FL1joQ2n3K4jxV6TZEyfj8XqFM4/ct2aeZVFCrEGKSo5Mw0C/E5OuQEwiRZzkNuw5Kk+25+CEuPegJkD9y+xTIW6qqkN/+WG6Jq31qie+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeVZuzya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeVZuzya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE69B1F000C4;
	Mon, 19 Oct 2026 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420827;
	bh=grbMMayDZ7AfUlhp6lU9LvTmW/PhQ8Ok6Mqphz7bbx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MeVZuzyaJB9brvMUdTtBCNfWn8pmzehSBGLdpXeBYLYBiQZ+eSLGCrFPU1gbCNdOz
	 eEdBaOCNJgTESHwT7bBNHU1F4fXhVcZWYp6SVWh3oucgTTIqfhEBgDXo4zvDk2fhfV
	 1Lwk0Nz0uCrEmCJtYMrTUgoqRaBcl63bXnr7Fnv4JvYaxP2xoR5L8avgGxk1/YcOMf
	 kI0p4gdb1hsJAkZd/pf0qzLaM9p9KkLPE9+f+ClGePBgi5XqRQGcZTuTekSmbvX9+Y
	 NziN1Xn9N5PIsvAHbydyXRNehbRxeVxxT8TmF27eirOvfGrYDy0gQyEmWTfcyLRXxT
	 PffbUDy7ppa0g==
Date: Mon, 19 Oct 2026 15:40:21 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pedro Falcato <pfalcato@suse.de>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Daehyeon Ko <4ncienth@gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
Message-ID: <atYrwiHPc0GU3rGn@gremlin>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
 <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net>
 <atYJA7nIu_RwpoCC@gremlin>
 <20261019073201.aee381fbbdf2edfdd0a68754@linux-foundation.org>
 <atYqIrlyW1tgZJIx@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atYqIrlyW1tgZJIx@gremlin>

On Mon, Oct 19, 2026 at 03:39:27PM +0100, Lorenzo Stoakes (ARM) wrote:
> Could you update it to:
>
> Cc: <stable@vger.kernel.org> # v7.3.x

Sorry... no 'v'. So:

Cc: <stable@vger.kernel.org> # 7.3.x

--
Cheers, Lorenzo
