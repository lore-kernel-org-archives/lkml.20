Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544130;
	b=wZYMgzqq5iEx6H/vYUO99R2rsxCnm6av+uION5tIuqwhfXula7oKQm0PStBtVYp5xvVP
	 3sY3FNcumLNEqE9KSysVsvUH9MtA5X40gWZtE5iV+JP6yZbti/QyVtLXReVMXLH3bJVls
	 /aqVTn8lcChVsD+UqhkRod6EHrnX1y3KicpmXvGtYvmQjadJRuBXIMYJco7w+VAOfD2vb
	 7gR5otZC2dD81rzAdJzLeRVcWpUreQnrBaEmjDtKPUyUYn9UjJaiHDs/3I2n5sv9gZNlM
	 6BCsE0D49YX81Mxuq9KQMrF1GurapaF0jsaliaMcQwyE4xEfV+qLDIP7FsCwcijFr6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544130;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yTv+63IoiSC/7HIqnxNmdXMmP57cJFHvG785xwiYPN8=;
	b=KTwbNvNzrfnn23+yeCCZlJ6nWXgp51o0NRnFokie43VfRYZGOzHKEEO0UbFL0jUroe4S
	 iJaZyAWEKaX10SMvRMyhsS5zbh/B2qk7GcYuKrTQ9I6LgTiyyKiK3pc9+yhS+zs8IBKBi
	 ZeRpBpF/LzqZuo319Oicbr4K1WLq6eC/LDIVYpSwD0K/bJIFwvJG70n8W2KNiF+8Jjx00
	 nbCkCbacB+HN07nE6eqfFEZorL8mlVnuNQr/VwPns71qQR/TWjWrQMPLzJOcZtN33YWzP
	 FuWsav0bwRUq2yjSmnfPg05kYahfIxBAIgT+Z0KQlD/iuJ5ttp3aOJ315RwyCK2VpnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=beV+ex6L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F20606A324;
	Sun,  1 Nov 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=beV+ex6L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280351F000C1;
	Sun,  1 Nov 2026 14:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793544129;
	bh=yTv+63IoiSC/7HIqnxNmdXMmP57cJFHvG785xwiYPN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=beV+ex6Lh6FjU87SePRwRs05RQgLV+nB3zrqE7MkU83InoxEa2WkfHIfg5BXqJ0Ls
	 5QtYETGurRbjzNPHR1f3PTsZZ3tbRFVewLRmITMy3adl+I/UiDFWt5hkHL+R19yja7
	 tV+eqBpWR/xPietij14U1Bod6VlSaRd7nAgT9ngE=
Date: Sun, 1 Nov 2026 09:42:08 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261101-inescapable-vivacious-shoebill-5b7ebb@lemur>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
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
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>

On Tue, Oct 20, 2026 at 11:35:24AM -0400, Konstantin Ryabitsev wrote:
> LKML has become mostly a firehose of patches that are already going to a
> subsystem list. The reason is THE REST: it matches every file in the
> tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> single patch. During the week of Oct 1-7, 2026:
> 
>   - LKML carried 13,641 messages (~1,950/day), 90% of which were also
>     sent to at least one other list;
>   - with ~2,100 subscribers, that is about 29 million deliveries per
>     week for LKML alone.
> 
> This issue came up during the 2026 Maintainer Summit and the consensus
> was that "always include linux-kernel for every patch" was never the
> intent.
> 
> This series makes THE REST a fallback as initially intended: it is only
> added for a file when no other matching MAINTAINERS section provides a
> mailing list that get_maintainer.pl would actually output for it.
> Patch 2 updates submitting-patches.rst, which currently tells submitters
> to send every patch to LKML.

Linus, it looks like everyone is on board with this change, but it never made
it into any pull request. Will you consider merging this one directly for 7.4
rc-1? This ought to do it:

    b4 shazam -S 20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org

With the ever-increasing volume of patches sent in and Gmail's obtuse "you're
sending us too much mail, back off" attitude, this is becoming urgent.

Thanks,
-K
