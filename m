Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B11A7264
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343654; cv=none; b=fC/Anhhb1eyZw/PbqlRiF/kJYVXt4/BwWRJciVkMBNFxkK2mC84XkPM8GTRvbkt5qmy0reCy9PRwMdzWf1UTszRBiZIxkUCLk7nyTEDao3+k/dDe+07AUkzHUVMe1RlvOjOvXM2ZLUOX+8Cojd/Kg5kf4LBOdp7SiLa+7vq7IG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343654; c=relaxed/simple;
	bh=rd2QZHuCqki2/DZSJKeq7TNX1Q38m5J7uP4gfs4WbPI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i0yvq2Dzh1n5u8tlMYJdfG1VHJOo+4hd+z39Em52468c1dFZAt/UBd5xEthJbdz5EiR0I7qctTmJnUXEftE+WuZHjilPX61jxqU0OgWhHTzeHOxORoxAZiR2yo2R1OTTJv4wPRwbnvulBAOIxQ4u/k3dF1y+GGXW06/JeOaY+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SCWmuZlL; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SCWmuZlL"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hZdgv0bBszMlGN;
	Wed, 02 Sep 2026 12:07:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788343643; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd2QZHuCqki2/DZSJKeq7TNX1Q38m5J7uP4gfs4WbPI=;
	b=SCWmuZlLeSiBk56qd6bJ/pnhSxcstWyQicJ7DMbIQR4W3NRXi1Oz4lBTfaoF1i7oIrLWjX
	jcmpWBxn1ucSI9+k77D87Q1I18av1R7OexGzrYkTiHEevmdf73Il/Ljwhh4RE5jLWVFlFK
	KmjcxN/Tedy5WjsQ6MfOGodiw/db79HlYxtwj5k8Bgd8ghEBBNOW77PSzXZ0iCylw9m9Ru
	OdDUhHKrp699WWUFdL++jGbIshR+TZOLcV2t3WB6DR5nmFucRnueCaz5n8J0n6NeK/olfI
	BN9FSk2INdd0Jmeglnl+qIoR8pFpWInL+Z0KzbzvBqQsQKAvxw81Pi/8fi1rBQ==
Message-ID: <b8f98b9e04c9999008bcdec270b14247e3cd18d0.camel@mailbox.org>
Subject: Re: Re: [PATCH v1 1/2] drm/sched: cache the timeline name to fix a
 use-after-free
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: =?UTF-8?Q?=EA=B9=80=EC=A2=85=ED=98=81?= <malhyuk97@gmail.com>, 
	tursulin@ursulin.net, matthew.brost@intel.com, dakr@kernel.org,
 phasta@kernel.org
Cc: christian.koenig@amd.com, ckoenig.leichtzumerken@gmail.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 02 Sep 2026 12:07:19 +0200
In-Reply-To: <CADQRuqtjBu7wR4kKVDcS42KLKQTr+7SBtRn24mgZ+ApettMr1A@mail.gmail.com>
References: <8c2a4df5-37a4-414e-81e2-cd97218e5355@ursulin.net>
	 <CADQRuqtjBu7wR4kKVDcS42KLKQTr+7SBtRn24mgZ+ApettMr1A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ed49uz6hqoh8dm5q1wrh6qcuhpig4cdx
X-MBO-RS-ID: 58e6fea7db5b6a90fe7

On Wed, 2026-09-02 at 02:57 -0700, =EA=B9=80=EC=A2=85=ED=98=81 wrote:
> On 02/09/2026 10:46, Tvrtko Ursulin wrote:
> > It is not guaranteed in the documented contract that the name passed to
> > drm_sched_init has to outlive the scheduler.
>=20
> Right. Caching the bare pointer only works because every in-tree driver
> passes a string literal today - xe's q->name (freed with the exec queue,
> hence 299bc6d50b1b) is the counter-example where v1 would still dangle.
>=20
> > Hm, that might be overkill.. how about we just keep a copy of the name
> > in the scheduler object?
>=20
> The catch is the scheduler object is itself freed on context teardown, so
> a copy that lives there dangles for the exported fence just the same. To
> actually stop dereferencing ->sched the copy has to live in the fence -
> kstrdup in drm_sched_fence_init(), freed from the fence release. That's a=
n
> alloc per fence on the submit path though.
>=20
> If that overhead isn't wanted, the lighter option is to keep the pointer
> and document in gpu_scheduler.h that the drm_sched_init() name must follo=
w
> the dma-fence safe access rules (outlive any exported fence). That matche=
s
> what the already-fixed drivers do and leaves the submit path untouched.
>=20
> Either one fixes amdxdna/nouveau/msm in the core. I'd lean to the
> documented-pointer version unless you'd rather pay the kstrdup - let me k=
now
> which and I'll respin as a core-only series (fix + the kunit test).
>=20
> Thanks for the 6bd90e700b42/299bc6d50b1b context, that clears up what the
> half-fix missed.


The issue here IMO is that we are discussing working around an issue
that actually stems from dma_fence not being consistently synchronized,
notably because of the ops->release callback being implemented.

ops->release is de facto deprecated, precisely for reasons like these.

If we could get rid of it for sched_fence, dma_fence would take care of
the decoupling of the name callbacks.

So that appears worth investigating from my POV.


P.
