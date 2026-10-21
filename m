Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594307;
	b=MoOQbNckNgm5EnXydJbHFn9wcpECJWeVhqs9VvEG0LFwWScAm6v5GWRWBh13fdOIb9Nw
	 qnFwahyB5r75OZ7F+sfQAIxc31TIjfCgoS7/ypk5fo9w8C7dWGWO0mc2xG9K2Qe9LKH8f
	 DxSSFNmY9fT1sDLlqypPGD4YXlRLNlezplpELHVWLRtsCSZ595FeMc5ifbIvzmwQdCBPX
	 K3DKFapCdSxnuAOk1jyuxnYyGooz+VbpaL+NTzqcEbNynyHFRitHQdo+f+U9X73NpnqYg
	 wdQT3LYpG2b26zopEEqM4rkZMNV7InksQy+I2hGKPBK+M1CFVQP8Y20zNJ2bf1MqBHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594307;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=DGd6aOnEcJOvUN3hdKRF/tfW6aTFgWVg+Eu+mllGxvo=;
	b=EuaDXqHYK1Ynodnn56L8OIz77KoBt0i7OkSrWBiaqsKw5z8+d+VcvJfgxjMO92me4uUi
	 o8odtvcdLOFdfrqRRJrxtqAd6Xt4JZl+kjWHI60rUFM1NSl0rAUMCWQbb1k5+77FSAHS+
	 TJ2GDhrSa+xL+XaDqR4gm2jpDqsurxe6D89Qi7xQF/tclVygI+MHCHoX5guqVNqMoN0Cn
	 eeJ5VmF/5ngTUwoksyNZHNs/hm+sGHMy55RgAJRuBaSUOFZTAvSXQAOaMH2c7J+HF5SFd
	 1GVQ85EoNJE35I2iVyukQ1+WLvQGnUoVfLfvfurC+l1NrMKzfMaCuQbsQABRuv7e51g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXGiQLDh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70A606A31A;
	Wed, 21 Oct 2026 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXGiQLDh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266AB1F000C1;
	Wed, 21 Oct 2026 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594306;
	bh=DGd6aOnEcJOvUN3hdKRF/tfW6aTFgWVg+Eu+mllGxvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OXGiQLDhNDZ+iNmdAlHOPNhSebzuHXCsDNW0/WArjfKJVMXR7RjdbahSjFzOVYcIr
	 t/q3nJAujmPQMQbJCF2TswqSVkQ41oP+WiLObDrphfJAzeF5z6gWGxA/1E1wVePIax
	 NGg/Y92smJPP49xNt5nT6vRGomku+sk/ygP+OBFtAi/MNu9FjzGu3sTH/WSnlep3H/
	 QdM0yQvN7wTuqjF/M90gbuAxoE+elJwPZEx8qLa8GRtsmPiU6MZTuJoe3L99QBllkJ
	 Qep+CfooFf0Hi6qtE2X1DTqpCHiMq/tQ1NR+vWOWEmG3YRdMgvz4RfHTccAbR33KR4
	 Nl4ih8U7423TA==
Date: Wed, 21 Oct 2026 15:51:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matt Turner <mattst88@gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with the origin tree
Message-ID: <atjRd2IMZWvLSWVY@gremlin>
References: <ati4xX95dHM-JY3c@sirena.co.uk>
 <CA+=Fv5Q5Lg4pS47Ki=Mnx3r9oEHrx9Fa588y8g6zmgSjjK3N5A@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+=Fv5Q5Lg4pS47Ki=Mnx3r9oEHrx9Fa588y8g6zmgSjjK3N5A@mail.gmail.com>

On Wed, Oct 21, 2026 at 04:44:36PM +0200, Magnus Lindholm wrote:
> Hi Mark,
>
> On Wed, Oct 21, 2026 at 3:42 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the mm tree got a conflict in:
> >
> >   arch/alpha/Kconfig
> >
> > between commit:
> >
> >   0d4c9dd06c364 ("alpha: select SPARSE_IRQ")
> >
> > from the origin tree and commit:
> >
> >   35e340a47888e ("mm: userland pgtable freeing is RCU-safe now, remove leftover bits")
> >
> > from the mm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > diff --cc arch/alpha/Kconfig
> > index 8fafbfabd1e51,9063c7bda4e41..0000000000000
> > --- a/arch/alpha/Kconfig
> > +++ b/arch/alpha/Kconfig
> > @@@ -71,10 -42,7 +71,9 @@@ config ALPH
> >         select ARCH_STACKWALK
> >         select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
> >         select MMU_GATHER_NO_RANGE
> > -       select MMU_GATHER_RCU_TABLE_FREE
> >  +      select SPARSE_IRQ
> >         select SPARSEMEM_EXTREME if SPARSEMEM
> >  +      select SYSCTL_EXCEPTION_TRACE
> >         select ZONE_DMA
> >         select TRACE_IRQFLAGS_SUPPORT
> >         select ARCH_WANT_FRAME_POINTERS
>
> The resolution looks correct to me. Thanks for resolving this.

Ack agreed, thanks!

>
> Regards,
>
> Magnus

--
Cheers, Lorenzo
