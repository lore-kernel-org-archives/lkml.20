Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511605;
	b=FbEcScqIioRJwQST4P5U7LzIyVnrQRI0IBlGr0odqfOZaGViEErug2ShBhLR/k1Fzv0l
	 t+o3JQQIbo+lX+tqIoyPpE3Kyf2nq7WlIz+rElkhJ4lQZ0IVzzYXWPn3J+rkNyhf1r1uC
	 qLaUQHBk5S/g6zt0no8r+ABRBEyedMLpY7GFVhB2tNFzC3tNYlQ8XlXy8lv7d2spH4l8O
	 785wpE70MBh/u6oyMWFhpiVv7hCqEgXJvPYqdEA+xB12LTHYKo/tZePiyEBpp33rpSfeS
	 gQt2SilG/rnoDqIdC6Ig9PfYglPvOcRWAQpG1pANLojo9mOGcQUSbHpHX14p4lJtxGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511605;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BzgQNQSaPtQ/zQPgk48qsuxuxyCm4I4iIwepuAvnRZ0=;
	b=NlDm1Ce65POZV6CVB6VKVDK8CbiA1Yz2x16xox6n8jBhEn36DX0BMc+aoSV4RrMm4SnZ
	 oeO8pqSuM0ikpW7hhWlPnNbaV15RO56TyrtQP3DVfkliayHJ0qRRUiDlUwyHZRTMJwDva
	 uV0c0BjDnFPjBwo6HiAoDmwdW0CLXlkBaRIZ+p/Xpm2PXG6a7H+Zb0Bla7qae1v2H0rP/
	 8Y5n21GyDaA39lMFpGHS6JrXdttUyDMxIC/OvCrSRCDgvl/mgGZOZTfTEfi2tmkEb4LZK
	 CMw4pxpiaJjfxx9bMYZlcyXeLf7ZFO/+FhR/GuaCcBQxpqHxmJUJ7QxGTrlYS7CPSJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8C6606A321;
	Tue, 20 Oct 2026 15:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6FA1F000C4;
	Tue, 20 Oct 2026 15:53:24 +0000 (UTC)
Date: Tue, 20 Oct 2026 11:52:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, 
	Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Weijie Yuan <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] get_maintainer: only use THE REST as a fallback
Message-ID: <20261020-witty-proud-coot-89ecd3@lemur>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261020-get-maintainer-the-rest-fallback-v2-1-162aea473488@linuxfoundation.org>
 <88c5be32a371b5d73561a82a63426485@perches.com>
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
In-Reply-To: <88c5be32a371b5d73561a82a63426485@perches.com>

On Tue, Oct 20, 2026 at 08:47:01AM -0700, Joe Perches wrote:
> > Only add THE REST for a file when no other matching section provides a
> > mailing list that get_maintainer.pl would actually output. Lists marked
> > "subscribers-only" are omitted unless --s is given, and lists marked
> > "moderated" are omitted with --no-moderated, so such lists don't count
> > as a destination in those cases. Files that match no section, or only
> > sections without such a list, still fall back to THE REST, so every
> > patch keeps reaching at least one known-public mailing list.
> > 
> > Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> > ---
> 
> I don't disagree that this is useful but v2: no changelog
> 
> Perhaps there's a simpler and more generic mechanism.  I'll play with it for
> a couple days.

It's like to convey the sense of urgency -- with the amount of patches,
automated reviews, and follow-ups being sent daily, having all of them land on
LKML and delivered to 2000+ subscribers... is not sustainable. At this point,
I'm very close to outright banning subscriptions from gmail, outlook and yahoo
addresses. Not sending every single patch to the LKML is a better way to deal
with this.

-K
