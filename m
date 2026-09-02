Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A034C46D2B9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365355; cv=none; b=EY+J+zarU86cYTPb/03+sC5QeLnOhpWGaSbs5VDi4hcu8hR2kR6A5q9gibu8WuPB8K7/dvB9jG1A4Up6Z1dJAsvxXGe4CmTGwJUVG/N0q9IiyKOKTYoigr3SkM3pFlfJ1v5ElACGGBf3VneTkGSrCfza7nu2IX4EBKpsC/wo6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365355; c=relaxed/simple;
	bh=VvJKSg7pqVYRw4ydikt4lUWfDek09XrHPFaq3efxsTM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EfOsAnNhkR++EmlxoTb80pJ8oHyYT130eYIczw+QeoGFIQK6c4zU0DfxTbD5tThSoU8K8b06sl3/qp85fZHPe2m1xl4vg68Vlbd290vhtaAjlYcolTU7usAZbQ6HZDpih5xEO4Io5/eBnF66kThXQLcOXeG+ioTwrJcjInwr0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Piyn/e2G; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Piyn/e2G"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hZnjJ0TWVzMlGB;
	Wed, 02 Sep 2026 18:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788365348; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Oxc0XrgMVAryWK6mH7Qx5b/XVnrcy8MnrmYPK252J8=;
	b=Piyn/e2GjfpTfov4FKSO+Qthw6pRCB6y5RUihME78NDO5lBXG1JOFWwbjlp/i/THP6ExZW
	ITxiDMy9600c9bgpZl/Av0xCI3qS5bp4RdiYtGVEqXe5V7RVJM/U8wne5Z7KU3WYzHYl86
	cpeFgB8sGSy472SUmAmrSYEf9Q3iuyLbF7Ml5ZZci3mP3y2UncjV94H/47bRlb0nCALt9F
	c84aa/68fkaEJCnx30yMvuZGw05Dlunpv3BSIC1Jt8Q9F7TEykebNC87LoGy7osH67xmDF
	5Yle2EVSiflhGD83gWH4XeD21v3HpenuP/wcIsVA1xZmIDpWFs/EZ51QLMhTyA==
Message-ID: <1b628841e8bb8735f2bcdc79450a49e75433101b.camel@mailbox.org>
Subject: Re: [PATCH v3 0/2] drm/sched: fix use-after-free of the fence
 timeline name
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>, tursulin@ursulin.net, 
	phasta@kernel.org, matthew.brost@intel.com, dakr@kernel.org
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Michel Daenzer <mdaenzer@redhat.com>
Date: Wed, 02 Sep 2026 18:09:04 +0200
In-Reply-To: <20260902144204.1843670-1-malhyuk97@gmail.com>
References: <20260902144204.1843670-1-malhyuk97@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 464093758d588c05b54
X-MBO-RS-META: f8u8xsn6q7i8h4gmdtzhzr581dxuexto

Well, that was a quick investigation ;)

On Wed, 2026-09-02 at 23:42 +0900, Jonghyuk Kim(MalHyuk) wrote:
>=20

[=E2=80=A6]

> Philipp suggested dropping the finished fence's ->release callback instea=
d.
> That is what this series does. dma_fence detaches a fence's ops on signal=
ling
> when it has neither .release nor .wait (dma_fence_signal_timestamp_locked=
()),
> and dma_fence_timeline_name() returns a static string once the ops are go=
ne.
> So with the callback removed, get_timeline_name() is simply never reached=
 on
> a signalled finished fence - no ->sched dereference at all, for static an=
d

btw, you only ever mention get_timeline_name(), but get_driver_name()
is running into the same issue, isn't it?

> Link to v2 (name caching):
> https://lore.kernel.org/dri-devel/20260902105808.1541063-1-malhyuk97@gmai=
l.com/

That link is dead (weirdly enough. Why isn't it in dri-devel?). Correct
one seems to be:

https://lore.kernel.org/lkml/20260902105808.1541063-1-malhyuk97@gmail.com/

Your help and industriousness is highly appreciated :)
Just be so kind and wait >24h with sending new revisions so that more
folks, especially from different time zones, can jump into the
discussion.

>=20
> Note: detaching the finished fence's ops on signalling also makes
> to_drm_sched_fence() return NULL for a signalled finished fence. Callers
> already handle NULL (the normal foreign-fence result), a signalled fence =
is
> an already-satisfied dependency so the scheduler's dependency collapsing =
is
> unaffected, and it avoids the container_of() on a possibly-freed foreign
> scheduler that amdgpu_sync_same_dev() and pvr_queue_fence_is_native() wou=
ld
> otherwise do. Flagging it explicitly since it touches an exported helper.

That unfortunately does look a bit dangerous.

Isn't pvr here already a race condition?

		if (pvr_queue_fence_is_native(uf)) {
			struct drm_sched_fence *s_fence =3D to_drm_sched_fence(uf);

> I did not add Fixes:/Cc: stable tags: the ->sched->name deref dates back =
to
> 1b1f42d8fde4 ("drm: move amd_gpu_scheduler into common location") but onl=
y
> became reachable once drivers began allocating per-context schedulers, so
> the right attribution is unclear to me. This is stable material as the
> driver instances are live - happy to add whatever tags you prefer.

I think for such cases merely adding Cc: stable and let the stable
folks figure out how far they want to backport is fine. You can hint at
us not knowing since when userspace can access this in a commit

Cc: stable =E2=80=A6 # we don't know since when

What I'm a bit more nervous about is that we probably really want to
backport this, but it's also a bit regression-endangered. So I suppose
we want to give it careful testing. I hope the others can help with
that, too.

>=20
> Tested with KUnit under KASAN (kunit.py --arch=3Dx86_64), matched pair:

Did you test with kmemleak? That's always a tool of choice when it
comes to refcounting.

>=20
> Jonghyuk Kim(MalHyuk) (2):
> =C2=A0 drm/sched: fix use-after-free of the fence timeline name
> =C2=A0 drm/sched/tests: add a UAF regression test for the timeline name

I answer on those soonish.



Thanks
Philipp
