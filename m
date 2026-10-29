Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291887;
	b=RPl4OovFmKB5RGUXowxKgDlhZMZmHZMlUxKzu8h4EyNKAPb2ou/8fnV2h0jQwbuTddjh
	 CraYMsOjhssRh7es3MJVPNucomQsb2iIfSAzOlw9HCE2sR0jb4QDnC3k7KlTnLRAGmUJg
	 IBV2+QsRvOuMXBZ/CaAtSb4/dxs6e1rVFmXCUS0++6DVzAEoEepnPygGvpq5966Uox0Qy
	 31Tx9IcaXyv+x45kKcjSrsZ05L9iA7vJ0DFE/nQvrrg0fVjtsut/UqDpsBUyGOSNtKTjw
	 vFuxA+2zlH/MMNKtR/HgbAM5PoO6HA4uycFhWu8F02okXjcOwAS3T874DoXUrZLITlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291887;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gLPlt//hCaW3yl8CTKlsKCz4bE7ch+tF1xtuAXdIMsY=;
	b=hSgqi1RvGCFwx48dt/cTSGxaiFbkLxkU9eqCXCutzDlZSbn+ZBFoEQJl2V4jK8fEO0RG
	 NFnzHIHpRmqfnSsu71busGdfmQUtNdI8qEYzL6IDSBGYK2H0w8Laxr8QCS42Pp1d946uW
	 OLtMp9lR6QLQTfSiIuWzwc0G/5gH+c+dznkgiG0UMkIleq/OBLJeMc4+jTqbCmG+wA9C8
	 10K/m2Zhl/YTWOGaMuF6Vlt26tq+ap2PdkyPtqMYjpj8qH9ti9yd0CT7/Py5Bpl2pQa5v
	 vkQB+Tba64Eow32XPEC3g8rM8R1orUY36XrbzgOK6AGNQRETLtTgAmDl9joU+BDPalg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=y+pfeUEd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087EF606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=y+pfeUEd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB671F01816;
	Thu, 29 Oct 2026 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793291886;
	bh=gLPlt//hCaW3yl8CTKlsKCz4bE7ch+tF1xtuAXdIMsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=y+pfeUEdaNV+XdUGp1gYPf9LxEHpgLNdfdVuNmRlmCWYxa5QMqnA+ICugsf4lTNAo
	 2x2inJQsV93EwWtspyS4aE84d97kcM19sG2BGI4UdxVULEVcO6eznk3IsMWNRyoQFA
	 sKFiUVuGr5KZ/QssEkxtGolJvaHLFWP6Km5N6PYo=
Date: Thu, 29 Oct 2026 09:38:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mani Tofigh <mt4022@columbia.edu>
Cc: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, tz2294@columbia.edu
Subject: Re: [PATCH] exit: use READ_ONCE() to read mm->owner
Message-Id: <20261029093805.67d5eb70116fe0e9823997fd@linux-foundation.org>
In-Reply-To: <5537eacc-0884-4b05-9634-16dff0eef69b@columbia.edu>
References: <20261027-kcsan-exit-v1-1-7c0429a29bc0@columbia.edu>
	<20261028235404.2a24aa50c06556eaf77a033b@linux-foundation.org>
	<5537eacc-0884-4b05-9634-16dff0eef69b@columbia.edu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 11:05:02 -0400 Mani Tofigh <mt4022@columbia.edu> wrote:

> 
> 
> On 10/29/26 2:54 AM, Andrew Morton wrote:
> > We don't want older kernels doing this either, so I suggest
> > 
> > Fixes: cf475ad28ac3 ("cgroups: add an owner to the mm_struct")
> > Cc: <stable$vger.kernel.org>
> 
> Sounds good to me, thanks. Should I send a v2 with these tags or will
> you add them when you apply it?
> 

That's OK - we gather up the patch metadata as a part of the merging
process.

I'm assuming that Christian will be handling this patch.
