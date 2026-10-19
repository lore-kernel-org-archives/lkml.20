Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56A52F83E;
	Mon, 19 Oct 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420324; cv=none; b=WwijRUdUZA719d4oQtnUks0dEkqfo+V93D/yZdnPD5yJvio4HJ6dUF9ppeYYqDu6Hn4jork2ILlHkPrhab+ZqtBkKBy0Cngcg3HH+o5M7QSllw9cL1oZmjFMZuwxOdUWGt4ksuY5aFOLlTzjEmrVY68L5Q5KmcQgmlg05FGeg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420324; c=relaxed/simple;
	bh=oVvx29ExwvBxWY3UPlYbenI/K+3fI7fjhLDn8OWXWIE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aMjbbioYceOeneF6/KSisBJsAwIwC8u4G5MboK7QTrYDeeG+mECH8CxG0b0YvNxqIDFDUnlyKgDy7+jwE+7mKPnVAXdR6znuKN6D5bvOL4+nQS+sV6lTP5163CIHv90vB/GXMd0tFM0bAAqGjpMFJWT5fweBqQcidZyKImspgbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NbQxnj3/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NbQxnj3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CCD1F000C4;
	Mon, 19 Oct 2026 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792420322;
	bh=ZJgfKZnh+KyHBRkUlFc9hON0UASMOT/JjSHODOYQjQY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NbQxnj3/eQBeNqoeo73Qu4NP8xi/B4Sf3/zzgGqRCrR9TtTqb1srXCyjVPzsptdCq
	 Mdj9cF7/chwDMEvqqytfujGNn2YpdV0wFy+VT6pZ4tX6PTL6SPHBMSSZqmaYp5VNAl
	 Dc6Qc/hmR9nZxdlYLk2bIYE3z9nJba7LfNf8e0ps=
Date: Mon, 19 Oct 2026 07:32:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>, Suren Baghdasaryan
 <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, David
 Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal
 Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap
 <rdunlap@infradead.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Daehyeon Ko
 <4ncienth@gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
Message-Id: <20261019073201.aee381fbbdf2edfdd0a68754@linux-foundation.org>
In-Reply-To: <atYJA7nIu_RwpoCC@gremlin>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
	<atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net>
	<atYJA7nIu_RwpoCC@gremlin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 13:19:45 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> On Mon, Oct 19, 2026 at 10:53:27AM +0100, Pedro Falcato wrote:
> > On Fri, Oct 16, 2026 at 12:34:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
> > > So I think it's fine to just send it (early :) in the merge window.
> > > ---
> > > v2:
> > > * Updated comment in vma_seqcount_is_write_locked() to mention the VMA
> > >   being attached.
> > > * Renamed reset_vma_seqcounts() to __mm_reset_vma_seqcounts().
> > > * Used acquire semantics in vma_start_reads() to avoid race with reset -
> > >   there is another acquire immediately after this one so it should just be
> > >   noise perf-wise.
> > > * Removed stable tag, will do the backports manually (just make the value
> > >   64 bits...)
> >
> > I guess you're fitting this where __vm_anon_pgoff_lo now sits? If so, then
> > this patch probably wants backporting to 7.3.
> 
> Ack.

I added cc:stable to the mm.git copy of this.
