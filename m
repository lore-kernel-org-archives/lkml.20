Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489B44A68BD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745525; cv=none; b=nMIoeZFZwy5dGTZ0rS5InO4Ix+s1vQdDx+X39lMUOMK40eOTPZYFr6qpKjaUKoDQCKTOUoV/EcHolZ0NJzDE14PFJBQme7Gfbb71enLatFeZM6BZ5zlmAnXN9jsaFyd/5pUiPKNxbPIkZWMbe9wh79fuHvY/Ih0PciI8Ewit6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745525; c=relaxed/simple;
	bh=JCkIufQg0u/ra8V1y8ihPJzFPkN8umwAzUGMN7BJhGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IR3ok4oq07EdKDDwoPsYJibdBk6UR6LGhoysG8K7c+oYGkSwjcrwDolwuULDOnmXTKSIler1yHMTdO+9XhZDy1+MFBRttwdt6T+OXnfXMdcJOJ9NWRfds2L+iS7ffJYMy8hA68FKImGQYHJTtguijQGy2ap3FBD3yTWA2fc7Uks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eovGOh8A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eovGOh8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1E71F000FF;
	Fri, 18 Sep 2026 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789745523;
	bh=uOzOdR9Dgb9ug7ABYVlGK+L+i1z3UtyHNtJ++kQhWy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eovGOh8Av9TcbchgCOYIOuOMAYojGlgSXHqc7vxl0rNyG8pgXDhaknNvzG6HRFPBK
	 OKc5SxxVCOfINrNh3b8rXr3i91xuVAvpnUssX0fWe0INOCg66vx21eEuFQWsrap941
	 MKaKp3McYW4mow3ZOfkI0frYIvDw6rumkj7ONHScNv2ow8qzyMMYFsoNgd2+qj74ss
	 oYEO/UwKnHjhMxV5xlbCgSWefKLUbjCqvqP89CF9c55ToRBTeWC8j9wnuXCaHT96PF
	 mSFu01gWQWcSVWr40k2mBKAKKbpquvFEhNEpSs6D4jih6hI8SpK2iQDz00WIhyfVjh
	 Dq8FnAbBqrT+Q==
Date: Fri, 18 Sep 2026 16:31:58 +0100
From: Will Deacon <will@kernel.org>
To: Ya Han <hanya8186@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, catalin.marinas@arm.com,
	liuwei09@cestc.cn
Subject: Re: [BUG] arm64/sched: hard lockup with rq->__lock stuck locked and
 no apparent owner
Message-ID: <aq1Zbo6XofYytAEL@willie-the-truck>
References: <CAMg_TGOZPtzzZviZ+pre=_XMgX5rs0CaaVn3GhvM4qwKr=Kk2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMg_TGOZPtzzZviZ+pre=_XMgX5rs0CaaVn3GhvM4qwKr=Kk2A@mail.gmail.com>

On Fri, Sep 18, 2026 at 12:42:24AM -0700, Ya Han wrote:
>    Kernel:
>    5.15.131-5.xxxx.aarch64

Sorry, but you really need to try something more recent if we're going
to help you with this.

Will
