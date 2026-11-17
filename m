Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935736;
	b=ExCKQPS8SeXjkXmWDrmpRPxIeziC5QkeK61vd7JzHwsk7H8s9lNiuPBfsT3buBSfPMr/
	 OHokK8iipP4rCIDD4RUVGZdl0deQDkTwdW77EhAd4Jv3Oh41PkTDU2B++qaweFrskAhwG
	 ldsO3fTbdIGtGbdn+C85t5QvFKpwdbaNVA4SToUnYHq3oWasADIU00V9ES3FR4X9a9oWD
	 KpBxM6pY0RdCe0rC69NKwvun/Jm67JKEvPH++aid3dfomnik6inZwu+Qswob7FBohNUf2
	 FIYIHfImCgYxpucAvntRAIG7cYBUJajSELdRlPuByIdzOWnTdRLLgkUal6r8yt3uwrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935736;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UHwO9ps6Cffev/v5N4F4dtFuW7j8oagFrLQV5xbgkoc=;
	b=4IBT5bYrL2cia2xec0QkfUC9I7ivWW7xgAbJd3i9f/nlSlxwAbnDhhF1hGPTe4JSlv7A
	 DYprwM9U0GXmVUyO1I4sGB4PiaQrCxuGUxfcBNwBynCPn/PT7OjukgWnOYiRNsTDPc7h+
	 RpgZvhrP0wCbnht5WoJjVrLHVIDpwNqpQyKmkuPzfvEASdQKtlwPdawQ0kG+oNfYXnYG3
	 vcY7Baru1xanHM7X+GdWkwJoivD4+OTNQSGJmZjfw64cmR1lM939KPcwAiyo4uzDTHRNo
	 kupi4+OupwQUhf3Glu3VkMytKPlDPbZhwTtnVo1Gkw2qIJDKfcowlNLNoaGN1n+93OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CH7mkpsj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FD2606A31C;
	Tue, 17 Nov 2026 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CH7mkpsj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7DD1F000C5;
	Tue, 17 Nov 2026 17:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794935735;
	bh=UHwO9ps6Cffev/v5N4F4dtFuW7j8oagFrLQV5xbgkoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CH7mkpsjRP4JGpRDQfAsaSmd0uO+BhTfNWqzK4HOVIwXRn70PsUCABoQ+39f9K10X
	 GZRNRxzOZm02CmM/wkZXC79kCN8TUJiq3p1P1Vj9ziG4//mTfqjdaGovyghf5KmJMA
	 WmDBrUe5K3CaHO1cChnwZXLkndTRAqSO2Hm2L8e0=
Date: Tue, 17 Nov 2026 09:15:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Chris Down <chris@chrisdown.name>, Christian Brauner
 <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-Id: <20261117091535.39481792f30792e6067a26a2@linux-foundation.org>
In-Reply-To: <avx98jYYXsZAmkDN@sirena.org.uk>
References: <avx98jYYXsZAmkDN@sirena.org.uk>
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

On Tue, 17 Nov 2026 16:16:50 +0000 Mark Brown <broonie@kernel.org> wrote:

> Today's linux-next merge of the fs-next tree got a conflict in:
> 
>   fs/proc/kcore.c
> 
> between commit:
> 
>   6b20f3da3436e ("proc/kcore: allow disabling /proc/kcore at boot")
> 
> from the mm-nonmm-unstable tree and commit:
> 
>   79011a80f0646 ("proc: give kcore, kmsg, the kpage files and profile their own file_operations")
> 
> from the fs-next tree.

Thanks.  I'll drop "proc/kcore: allow disabling /proc/kcore at boot".

Chris, could you please redo?  Against fs-next, I guess.  With the
ro_after_init thing that Kees suggested?
