Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642193;
	b=hZhh/Vyqn5aTxZvybrVbVeKt9OC7+Nvdnw8tQpnMrHqqKSbD3+ap6OeYSL3uMMmpoGNU
	 hncu9y/eBEATOdv/kN4m6P5/swDomfvGOGXfQ2Ae3wpuKdOBYwoGJzVV8Tbz6erEScoxB
	 GLu2yug5HKI4b7VbWvpXHGEIGJJmZbVy59Ox0+750OzqVUhvVG0r1zV3U2KrNnqoZrE+u
	 Ub3+FJk0cQ62lU0H+qV8Ad/EqCoy8JjUcYzOZCq4wotZ0CZK1OzaHUBQ40yEjHC5E3aCl
	 tW+Pp0sAlc0lgzXX058rg0G5GKwcpKrLIBQ/T+tUSYTctrW8GR751SVI+2X4QxOanMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642193;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wrXGlUr7f7OVMQEZ1c1YC3FtYl19CS404NXDobfyGFY=;
	b=cB9OxCNlYPqGxWtkL64aJFmk/WedadL+gdmF2yW6YQEQXx0fafKx6xhG33aJOQb/0ic7
	 S/pp8ZBz44Y0B7DSYmaGeMtmm9/DaVqzFtKMVAFnmora64dJMGS+Wqctq+QGXQPQLm37F
	 K7f3oou2q1UWhrbf3pnMnWPwdz9Cwnskk7LRDGhKuxNJlajdP0bWWjyBhT9duyUFw2nX7
	 NI6xCMTZii13lgSJt6TSpWpeuqc2/sU0yQR1DjzkLehfqakXYcGqHKoQGtxlnUv0v3KHB
	 sEKEckr3MP/cJR3JS2Qd+Adck6A7u+0uJJLNfG79/q9bO9VlLUrqusePlmIiNCJJPnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Yz+0BgX0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AFF606D825;
	Mon,  2 Nov 2026 17:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Yz+0BgX0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2641F01578;
	Mon,  2 Nov 2026 17:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793642192;
	bh=wrXGlUr7f7OVMQEZ1c1YC3FtYl19CS404NXDobfyGFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yz+0BgX0f4wJhNXrFkBOp3GppRBPPtLLZwSQcuGHaZ0lpcFXOiaPlLnt9aXPbjbfM
	 RAAeCRnYn7JEmx0JVA+kjBBnIP6nx79e1tVUscPQz2SyUUHnhVzWl3IHk7KRmOELAM
	 tyYhCCPsagH1Bzt+e0jo8cFfe1lPAtDtKw7of7tE=
Date: Mon, 2 Nov 2026 12:56:28 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, 
	Joe Perches <joe@perches.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102-affable-undetectable-beluga-eded3e@meerkat>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin>
 <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
 <87a4nrfgjm.fsf@trenco.lwn.net>
 <20261102150535.6c5689f6@pumpkin>
 <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>
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
In-Reply-To: <CAMuHMdXe1xxk2ZFJ=yr=7z1DUs3oRNfzHw1Ls1hftcGnmoNwrA@mail.gmail.com>

On Mon, Nov 02, 2026 at 05:24:51PM +0100, Geert Uytterhoeven wrote:
> > I certainly scan it.
> > It is also useful to have an archived local copy that can be searched.
> 
> Indeed. Sorry to say that, but Gmail web interface search is still
> much more effective than lore web interface search.

Folks, I don't want this to turn into another thread of "me too" responses.

Yes, I know that some people still use it for a number of legitimate reasons
-- but these are few-and-far-between exceptions. I need this change because
the current status quo is NOT TENABLE. *Everyone's* quality of life is
affected because Gmail's throttling results in (looks) ~350,000 mails in the
queue, most of them waiting for Google to graciously allow us to talk to them.

So, we either unsubscribe all gmail addresses from LKML and prevent them from
resubscribing, or we do something less drastic and revert it to how it was
supposed to work in the first place -- only patches without a dedicated list
end up on LKML.

-K
