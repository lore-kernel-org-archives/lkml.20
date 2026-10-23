Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798593;
	b=3ETCSeBhd+/WEDOj/nMr58Mv3I0gEpTa/vRp5kyzgBfD/AeJx52wIdOaCB90eE+p9Sm1
	 mZsDiOrw3rtOWWBiEz7+Oj7CqTBQsyWf+5dfnKhPFg+7TjUTN8Ky09Pkcaf5VQDbvTT8O
	 0HfOC/3hnFEwmf5qoR5Ct9MtgP6SxMGJtBFoMd82pU+oayUruKjxiDcG2Cw3+v5aaL418
	 hxh/1/FA7q9pcechjnYo7Tph3nV8V5/dExTKphC3BpEtKBAdfnUSFg39AXhzKVUrPczYj
	 XaGE6yDMql69C6qzFHaK4vINBNHTVPcCxMlDORa1CtpI8qhyctSlx9IyBnc9BAEPk/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798593;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I/Zuzgcss+svgkUIXyl3XnDM+vG1fLBLQV3+87i8Mnc=;
	b=HwzNt8WuHHqYD5RlmZ7Zc3PMxnD/WZ9x25a2LoS47YLXTVyleJS14URMpc9OcxsGgpBM
	 J6EepiR+tiTGpWZPkEznnJu5/sv5Juk3wMx1ek9g9GRQLr0bBy30X0pkmmtMsapn028yK
	 +crXpctKMyWKq0j5jof89B9vA6JfY9ZKL6vbOstNDdr8Yu9kYStAbUMGSrPqJpu+JEV06
	 AGuRmj6wzLBGGb8ufBGL/WV1TEBJszo4mDlyApb7EICfzn1Aa7SIDtvV7bvqAgGamqD/v
	 gFzkg07147k9YbSOGWL+S+X8eSpoIw5xMkCuCaGouski4u8LrR2Kf09HNSPRmd6Hycg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jB0OKTON;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3B0606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jB0OKTON
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797F31F01829
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792798592;
	bh=I/Zuzgcss+svgkUIXyl3XnDM+vG1fLBLQV3+87i8Mnc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jB0OKTONgdkG2Ymv8c4ENoQThRe0kQWZFgQIhN34BmS9ejXoT4mjjy1AbVTtkVly2
	 RjdGXaVmWcoJlICJutOp3Hp6+OdfczGTyqBWcP2BfNHbFMXozfElaH7BVwGnJS7FxA
	 eligGEYQdmOJ+qGiMktTc2sRA7inLcaj8mrWSxDSn02Q8XdFrjAymF6titCUW53Ugb
	 68iifeN7Af6Q4D3TmmfHBUlKLbZLldOQve8fvcsBvinxCKjX01sQ0F3GSOsZt1AL6s
	 llREUtBf+g33TCGr/NEI3V/+RdxbF5AVNqgiLZOOHoJmbUooteJzpqSqoPLYVAdR/G
	 MJKVmShnQJ+yA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2099783a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:36:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz9DTQn8sFAKreGeyx/tsJ/kJd0ruyz1ZWQ0Rc+R/q2HHqLoI7p7ip+tWeIIoNr/37p4z8bnB2aTI6XM58=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbJe3v/WCw2ANUg9Lt/pIDpzYn034ctIftogc3aj0giMvziFVk
	lgrreu8+D8TIaNUZUjeCYhM5zMXLbh9kGJ4hgc/CjZTvoRvlO/YROAkqGf7og4cMWXysz9PYA6v
	HUu30Ydy+eZ/HxZZkwZmPy9xCh4xsxro=
X-Received: by 2002:a17:907:9715:b0:c33:ae8b:817d with SMTP id
 a640c23a62f3a-c46bde4b904mr47591566b.46.1792798591415; Fri, 23 Oct 2026
 16:36:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022232734.496064-1-suseendranb@google.com>
 <20261023102607.7635885be12b0b6e7a5971aa@linux-foundation.org>
 <20261023200426.3865221-1-suseendranb@google.com> <20261023162100.41145a57fb91ed1073c24c41@linux-foundation.org>
In-Reply-To: <20261023162100.41145a57fb91ed1073c24c41@linux-foundation.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 23 Oct 2026 16:36:19 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNBX6Oac4nJryEv1U-57JjgzAS+Bbfe=FGV4fH=sZ7PBQ@mail.gmail.com>
X-Gm-Features: AclHuK_H5zlrHTD2kZ5uuZ3nnaWevuLYmwlKdeVczL5o5zYQlHUT2FAtC6qHqWg
Message-ID: <CAO9r8zNBX6Oac4nJryEv1U-57JjgzAS+Bbfe=FGV4fH=sZ7PBQ@mail.gmail.com>
Subject: Re: [PATCH] mm/zswap: validate dlen and normalize comp_ret on
 compression success
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suseendran Bhaskaran <suseendranb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 4:21=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 23 Oct 2026 20:04:26 +0000 Suseendran Bhaskaran <suseendranb@goog=
le.com> wrote:
>
> > > Wht you forgot to tell us (please never forget this) is the
> > > userspace-visible runtime effects of the bug.  Autobot says:
> > >
> > > : The userspace-visible effects are limited to corrected zswap
> > > : statistics and a new warning for invalid compressor results.
> > > :
> > > : When compression succeeds but produces exactly PAGE_SIZE bytes, and
> > > : zswap writeback is disabled, the page is rejected as before. Howeve=
r,
> > > : reject_compress_poor now increments instead of reject_compress_fail=
.
> > > : This makes the debugfs statistics distinguish incompressible pages
> > > : from actual compressor failures more accurately.
> > > :
> > > : A compressor which reports success with a zero or oversized output
> > > : length will now trigger WARN_ON_ONCE(). Previously, zswap handled
> > > : these results without a warning. On systems with panic_on_warn
> > > : enabled, this could cause a kernel panic.
> > > :
> > > : There is no intended change to which pages zswap accepts, rejects
> > > : or stores uncompressed, nor to normal application behavior.
> > > :
> > > : I think these runtime effects should be described more prominently
> > > : in the changelog, particularly the new warning.
> >
> > Apologies for missing the userspace-visible runtime impact in the commi=
t
> > description. I will make sure to always include this going forward.
> > Autobot is spot-on here. I would be happy to send a v2 with an updated
> > commit message that clearly documents these runtime effects and
> > behavioral changes.
>
> I'm mainly interested in answering "should we backport this into
> -stable kernels?".  A small debugfs accounting error is probably a
> "no", but a WARN is "yes".  Is that real?  Can current kernels truly
> emit WARNs due to this issue?

No need for a stable backport, it's just debugfs accounting, and the
new WARN is just hardening.

>
> If so then yup, please send along a new changelog.  Or a v2 with a new
> changelog.
