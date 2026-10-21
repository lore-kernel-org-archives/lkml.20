Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565587;
	b=K7mzH22a5tNXV+nAhRVkjP4BEiHRBFEAeiCW4ttaw53isjwk8C3PDE44J4s476siqoRG
	 ecd5Mfm7JShOHnQa6GWB7ofCKN51z0eJv0KKKrqXxpl0lvBhs++oadfJIvrK8jb40fXOH
	 kakVfDmFfl2Ndy0VfQG9eTYxLxtVX6wTCe1F9N/y0yjrmtEj8WQCc6+fieqqNq9tTqfWV
	 JzBjG/+wOWBAnmPq15uFCpFflhuLHPnDsDLk7niD0s659ytUIF8PX+EclOvalC7FJHu8Z
	 35K/VXhwD0hWOwibPu7U1VBt99xYJa4lSbCfjPOOmVH2hsxFPYpg07VLSJ/IJDWMFpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565587;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZXswQmPkQHrbX1c4l2ohaW+AstYKB7ekLJny/L5XdpQ=;
	b=t8a3OK3rXzlOp8qSe1/WlgH+C1KXrX4jUH7T3c6pQ67LR81KdL4pA0bLMIlEPse1st+2
	 VUd5XLNJtdkOF1AtMcJU1MMJ+RT59PAef4YoP7YLH0LYHskR5lPA0aaZu9/kTVaIAqItA
	 A0EgHgkPjzKXJjGUMSwy3T3demgecJJMAOf/2shGM729W/h41Ni05TZvGKGthZWuPGKqC
	 V6BDFHZnQJo0GbKN5LF0/nP5Mm4b0ZDvIfjrO9yTyUdQaKuvDSxzhqingU/gRU2Hc7+21
	 7qz5rP1Ur44tzn7yZ9c9h4k87A0chIOTboHpihFZmQ7X5Cy9n5uRQM/ccEeIbUIDipA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A441606A31B;
	Wed, 21 Oct 2026 06:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2D61F000C9;
	Wed, 21 Oct 2026 06:53:06 +0000 (UTC)
Date: Wed, 21 Oct 2026 08:48:21 +0200
From: Greg KH <greg@kroah.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 2/2] docs: submitting-patches: make LKML a list of
 last resort again
Message-ID: <2026102112-skating-freebie-ea2d@gregkh>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261020-get-maintainer-the-rest-fallback-v2-2-162aea473488@linuxfoundation.org>
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
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-2-162aea473488@linuxfoundation.org>

On Tue, Oct 20, 2026 at 11:35:26AM -0400, Konstantin Ryabitsev wrote:
> Commit 77167b966b7e ("docs: submitting-patches: clarify the role of
> LKML") changed the documentation to say that all patches should be sent
> to LKML by default, because get_maintainer.pl always suggested it.
> 
> Now that get_maintainer.pl only falls back to THE REST when no other
> matching section provides a mailing list, update the documentation to
> match: send patches to the subsystem-specific list, and use LKML only
> when there isn't one.
> 
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
>  Documentation/process/submitting-patches.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
