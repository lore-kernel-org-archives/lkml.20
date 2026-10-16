Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EAE494299;
	Fri, 16 Oct 2026 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176854; cv=none; b=pF2D3U1NmnSeAFLunQP59MYo3ef1Dg0sP6G1JyZjuRLzqpavkl9Len4F1m1ueZYn611R+41w/ghjcBCFkIFXxk4f+x5e7AiJzY/AvzX/RY+1SEBmSVBC+2p0MPdclKPywOceKWUjZs9407wXA1i0KUWqjyEEdSvlE2yOB1of2pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176854; c=relaxed/simple;
	bh=0EzCt/NyI7mlVl/+OVjffa6iQXOu1ou/HhA/87/h59E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3DJpQfma7xJKbHfAkliGe6tRiNv7bxyAmAqIdbwHiQdrb8eFIdFfzDrsH9vzrR22V8peIJflhpfjD4kfW8eRJ55Ra5PIY2Pq/ZIYCo2fM7iCbW/B3VnVOS6FuUHIxsNylZiPe6H8IibRf4r74aQXQLVTqjmGMncXYIH/S8wA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4Oa1RM9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4Oa1RM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDF11F000C5;
	Fri, 16 Oct 2026 18:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792176852;
	bh=WOU0Y/cF0NuTN/Kd5hnldCn0LnO0sk5D6dj6YPllLvI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=J4Oa1RM9HLZjQfdoYuApSJQiYssc0u5H1Z0veAWa5ZNvcHz1sJ+EGroX30vb91nyw
	 Dt+93SkSfun2aQvPh0RBv/Hx2vxE16EvbJ2poDjJKDBUTLvPiUXmRd/NbF6ZsPQBau
	 T2zV+Y24MJW90i+ecVGOgzrKcKWOH3baavJwudyXuTvyDuf83rsPdPJOXfsgOHFYkz
	 FhSa12qwaR6Gpc44SqWSWNYt0HnYQD0LwUhlJQjebWeQYLqIGg78LigmNciAxrHqgk
	 g4oYw9nqlczQzlMoE1nX/6SC+BLRlBe0r3WBYTAs1/s5/rQvjRzbbZ/bTxGPGatV/V
	 Y2BPYPoL18Jcw==
Date: Fri, 16 Oct 2026 20:54:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc
 output
Message-ID: <20261016205408.5285c26a@foz.lan>
In-Reply-To: <87bj8toh7w.fsf@trenco.lwn.net>
References: <20261002230114.39651-1-kmehltretter@gmail.com>
	<8733u8w6p4.fsf@trenco.lwn.net>
	<20261014233956.605e0960@foz.lan>
	<atIw3EWamd4KN4VP@gmail.com>
	<87bj8toh7w.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Oct 2026 08:25:23 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Karl Mehltretter <kmehltretter@gmail.com> writes:
> 
> > On Wed, Oct 14, 2026 at 11:46:13PM +0100, Mauro Carvalho Chehab wrote:  
> >> On Wed, 14 Oct 2026 11:08:39 -0600
> >> Jonathan Corbet <corbet@lwn.net> wrote:
> >>   
> >> > Which versions of Sphinx and docutils have you tested this with?  I
> >> > needs to work across the full range of supported versions...  
> >> 
> >> The minimal docutils supported is 0.16, and the minimal Sphinx
> >> supported version is 3.4.4.
> >> 
> >> You can use /tools/docs/test_doc_build.py to double check if your change
> >> is compatible with the minimal supported Sphinx/docutils versions.
> >>   
> >
> > I completed the A/B matrix using tools/docs/test_doc_build.py -f. The
> > full matrix shows the improvement without a regression. 
> >
> > I also tested Sphinx 9.0.0, 9.0.4, and 9.1.0, plus the previously
> > discussed Sphinx 9.1.0 / Docutils 0.21.2 pair.
> >
> > In total, this covered 32 combinations and 64 full htmldocs builds: A
> > unpatched and B patched.
> >
> > Successful, with identical A/B output and normalized diagnostics (26):
> >
> >   Docutils  Sphinx
> >   --------  --------------------------------------------------------
> >   0.16      3.4.3, 3.5.0, 4.0.0
> >   0.17      4.1.0, 4.3.0, 4.4.0
> >   0.17.1    4.5.0, 5.0.0, 5.1.0
> >   0.18      5.2.0
> >   0.18.1    5.3.0, 6.0.0, 6.1.0, 6.1.1, 6.2.0, 7.0.0, 7.1.0
> >   0.20      7.2.6, 7.3.0
> >   0.20.1    7.4.0, 7.4.7
> >   0.21      8.0.0
> >   0.21.1    8.1.0, 8.1.3
> >   0.21.2    8.2.0, 9.1.0  
> 
> That seems exhaustive, thanks :)
> 
> I have buttoned things up for the first 7.4 pull, but will consider this
> for later in the merge window.

Heh, likely took hours, as version 6.x and 7.x are really time consuming
;-)

Thanks for doing that.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


Thanks,
Mauro
