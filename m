Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327522;
	b=J+fdgWdzqupTNbiM4wChWhNi0tnt28ytczONUH7wg3MjqB2Mj5e9GPYz/5jk4rYIhlTU
	 Umk1RykOzqLF8iaxw1mkE5cpYm5sEhBSkp5V0vDgaAfHV5Gh2o4yCAJLIG5sWIfEusgDS
	 pgAxxwCTfrw+w9naCtcVHvpieM/bzwgPai0cLqM//ee6zr+Ke4uS9IaDW74CuARPU6N1h
	 sFQqgFWmICGm2Swy0fHSKTWNKT3kj97yySRygjEZwrGabK+dX50V4ck0RwC2y9MPqqpoX
	 EeXxXgW0ZOYBhmcyU6Df6NjG1m9QKiuoHtiTqxTAMyh/M1zIxA/vg1OMABG+92MqbrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327522;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UCECkq6v4+9D6kK3ah/nuf5WbScQfy10bXlUvhxbr5Q=;
	b=UnR79RUqYA3g/k+Q7UMVg+tNqaXfUPwipRB49UxORVQDZmdq4dgVpPuDc45QvXJyFRIs
	 lHu0LEeMSJZdL9/q7iSHrnYVI4iWxVbEtGk2ygsl7I1WhMMf5BaotkrZt1kN3Lo2awSTP
	 mQP3HXLDYSzSfHYA+90UAmTsxrwDYL+Q9+u57TrY0LvlXAjfQZS/UWRYH8ZRLUuWYURh9
	 Ki/X5rvGgm1KogwS9Du3oa3HcFqepCU72KR6iZ+udbbVI+qmuPFo9gh0KXKN9MyQ1T6Vq
	 XdEBUC23znbIMWdxKpI+4Kl1AcKaDCCbBj1GNClrw/WGbw/iP0MtxjGk4o5OH4cfNiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNfQ2j5T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E22A606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNfQ2j5T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1219C1F0089F;
	Tue, 10 Nov 2026 16:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794327521;
	bh=UCECkq6v4+9D6kK3ah/nuf5WbScQfy10bXlUvhxbr5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SNfQ2j5Tt1wcgoESjEHsHrd/7ffBl6iai388sz/sKf9upCOfDKpqrXm5O6lQvjLqi
	 Bgg5psXrozdaS7TIGnK/xbMVHtm+/Qf6O0YRa1ZbYvCwcf7HPguiACb9lPo10jqakN
	 Sgo7UItp/Ws6HwcRU4iT8BAm1cu0JVevjrj1C4HOpFlg157gYI5kX+EMQ/ejcvOjIb
	 DdZyFFMlrQuOx/z6qQdbP8sdEKL7q9+P1Dn4LIjOvyQkCeVyuVvWNVIJz1r9zfVv/p
	 8gAFyY4uoTWyyra/7FoloqMDaf6pMbmsvqKlKFHZRh65q/OZ6aj0h2WoZl/CMj98m1
	 OQxOwLEhzYfzQ==
Date: Tue, 10 Nov 2026 16:18:35 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Lance Yang <lance.yang@linux.dev>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Seunghyun An <san55@wisc.edu>
Subject: Re: [PATCH] mm/vma: predicate vma_assert_stabilised() on
 CONFIG_DEBUG_VM
Message-ID: <avNDjxZ9jeYiwdVh@gremlin>
References: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
 <avNAgtDzM0MYevV8@gremlin>
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
In-Reply-To: <avNAgtDzM0MYevV8@gremlin>

On Tue, Nov 10, 2026 at 04:07:48PM +0000, Lorenzo Stoakes (ARM) wrote:
> Andrew - could you update as below?
>
> Thanks!
>
> On Tue, Nov 10, 2026 at 03:10:40PM +0000, Lorenzo Stoakes (ARM) wrote:
> [ ... ]
> > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > index 9ccbbcbd7aca..9c3a9c6525c1 100644
> > --- a/include/linux/mmap_lock.h
> > +++ b/include/linux/mmap_lock.h
> [ ... ]
> >  /**
> >   * vma_assert_stabilised() - assert that this VMA cannot be changed from
> >   * underneath us either by having a VMA or mmap lock held.
> > @@ -418,9 +423,18 @@ static inline void vma_assert_locked(const struct vm_area_struct *vma)
> >   *
> >   * With lockdep disabled we may sometimes race with other threads acquiring the
> >   * mmap read lock simultaneous with our VMA read lock.
> > + *
> > + * Assert only if CONFIG_DEBUG_VM is set.

Also this should say:

'Assert only if CONFIG_DEBUG_VM or CONFIG_LOCKDEP is set.'

> >   */
> >  static inline void vma_assert_stabilised(const struct vm_area_struct *vma)
> >  {
> > +	if (!IS_ENABLED(CONFIG_DEBUG_VM))
>
> Actually I think this should be:
>
> 	if (!IS_ENABLED(CONFIG_DEBUG_VM) || !IS_ENABLED(CONFIG_LOCKDEP))

Sorry this should be...

	if (!IS_ENABLED(CONFIG_DEBUG_VM) && !IS_ENABLED(CONFIG_LOCKDEP))

(I have a bit of a fever today, can you tell? :P)

Thanks!

--
Cheers, Lorenzo
