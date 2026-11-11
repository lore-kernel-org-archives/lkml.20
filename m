Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384331;
	b=MCfJWb/t+h1ZlNdb1RRTszl1YKSP67mPNJjl6FT+TsSJNiPj3QL4SmpKxOE1qH2WhoH+
	 xTZtY77x1FRR2yfXPwju7+Jg0dKyLsWz+wUSjp+8amp7cMCh247NFaQM9UB80TG+NCIma
	 W6cO2ZIbLYLEi3qUdS8ids6yNSaIaIKRvAP4UChh30Rp6d2pg09plURJMFaMAwP4gska4
	 L+5iUVs9VES7P2uq91b2WMmCLHYxqli+xftC+xpbRb5uTzh7C7xHNdAC3EoM5KMVNRQhT
	 MOc1K+sfFjP3xLyzBYKc0rlsiU6tnw2h/uTqJP3HoOL8lBgorYTQjeGSlchFu1ZZekg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384331;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/GSWuUudINQ5InmDwWsy8zWhwr+7Kpnc2mR1mJL4+KA=;
	b=V1l/WVzS5c5eN+N81RM9L6QVTENRmQfcw7YLLWu5qDqW6+gDH59dY2XVYzOkC6Lqtv3U
	 iUgkBQPX3gVG9tTei4XmF84xcFAH1aeF1QEVKkI+DdRr0GyGUWFBsx7nrUsOx/HYDDi6w
	 fveFHLEmlyzUKEpmPhA3HY9i4oYOuzqkpKAGVQQxu6/+dOW9yCAfWYwHVkKdJHxsvJzzQ
	 RjFkg7LwgAbjD0QLw5bw5u25uSTC5osbMrxBkFRLE1GDGqEvN6oqKGWSnBQ3mn6uwKse6
	 V3vP6jzFcurHHh9LwQ/Viff8B8lbJ2GbBPwZULVLLPefTkP24VyndZtE8CU0xd6PKXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QW7MK1KM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D1606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QW7MK1KM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E491F00A06;
	Wed, 11 Nov 2026 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794384331;
	bh=/GSWuUudINQ5InmDwWsy8zWhwr+7Kpnc2mR1mJL4+KA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QW7MK1KMPShmXAzj2tGBuE1vD3/CnUjJJ6qz1x6814x0dF88RS2ylZ3oJGCJXWldl
	 oCmk98Qi2QHSbNYVhnD9ZYNfgT3mhaWRKSEXXHWtCRQHb81g1edSgty+bDEAXPjMXb
	 f2/15FBZNATOuZsxuXJtN7a24+G3vHnH9k0HGG7q62QmKPCjV0zRedYRvAKLUvt1dZ
	 t1UfZbr1OFwF+Fm7gcNyaT99SpdKSLOcF0K4IOG6BELRlA4/pZWDxY+2G264tU/YWG
	 UulKdXOxLH0wx8yH08+Ct/GNXMTPS3DgKrcax3Zgz0oChXeTaigr28d1hsFazZJzf2
	 OT9H6SrQywRUw==
Date: Wed, 11 Nov 2026 10:05:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2] mm/memfd_luo: don't use memfd_pin_folios()
Message-ID: <avQhxo-dVGdvcHK6@kernel.org>
References: <20261103172251.2348370-1-pratyush@kernel.org>
 <179381215936.28814.9050829645096838793.b4-review@b4>
 <2vxzse18h9j5.fsf@kernel.org>
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
In-Reply-To: <2vxzse18h9j5.fsf@kernel.org>

On Tue, Nov 10, 2026 at 06:38:06PM +0100, Pratyush Yadav wrote:
> On Wed, Nov 04 2026, Mike Rapoport wrote:
> 
> >> +/*
> >> + * Move a folio out of ZONE_MOVABLE or CMA, so it can be held until the next
> >
> > "held until next kernel" - here and below - I feel that something is off
> > here, but can't pinpoint what exactly.
> 
> Hmm, perhaps this:
> 
>     Preservation holds a longterm reference on the folio. This would
>     block migration in ZONE_MOVABLE or CMA. Move it out.
>
> ?
> 
> >
> >> + * kernel. Called with a reference on the unlocked folio, which is always
> >> + * dropped. The caller must look up the folio again afterwards.
> >
> > I'm having hard time parsing "called with a reference" sentence :)
> 
> What about this:
> 
>      Must be called with folio unlocked. Drops the reference to folio.
>      The caller must look it up again.

Ack for both :)
 
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
