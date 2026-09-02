Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976994AA595
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369911; cv=none; b=RTuVTJJgpA9HFroAIj7dYioke1mfKqT/K8xCl0cn6umIUapT6f5Ooh7gwh17YoTl6Dvp99oTJhvxb+5BQaRsmirns438CCecXqUH5BLruWJ0WGt7BMuvowMifPCT1nSO6TIJ+n8ehy8+pUfI6J1+h737R/2dRlngQygJbY0o74s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369911; c=relaxed/simple;
	bh=o6L/7wD3qo7ZcUb7iPkBUVUTup6Ym9ZdXA/oXcoZdmQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jIBuHWhcvHXxVCPp0YpcKyXQlvzPrAI7o+6qu/vCjfKDQ7oJWWLgQOMuiLbwQ21p0M21QcxTnfCJUnTuRwkxmr5zNsBN8IOrPXKuidtMRPPAEdyIMdwbi6cdywr11apSBt5L0MOxwS2PJ/Bv8+IxSUossJ3w5j0y79aEQzrweXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OfzT7tcr; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OfzT7tcr"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hZqNw4kCFzKnVM;
	Wed, 02 Sep 2026 19:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788369904; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2B5KofvtIGG0Vs76V3fuiSbJTZCJx5QQPNW2Rk/ndw=;
	b=OfzT7tcrMU04IVS9GiSWQFbYPGERWrRJ3oHMz9kX0uO7lVf5sugFQcxRpErK34FBpkoQ7s
	uUXC5VgxiUzHDU9TfpTAkBjOrUhX4iq8x+pE7WSY+sfsjZogZliN40ABYQ4rH5hJ4vbBXt
	Y9nzwiBTZUKXd3RwW04CcIbTmDdu8kdmVS4jJKXjNlJmq+79juAV2SYaUf2VAOjqURi4iM
	k5rvreWSHTrsuVu8dA/jeHXbKEUaVmapQ+69ZTLHIxJKneHIr9Bkk1e7naTaTlGIIxVMW7
	wPoWL17JHe3jgqssuQq20RofzFfWs+WVrIOOOPzfgHJnX+a0KTPzfMYkxE/uWA==
Message-ID: <f9553c0254e22800753a6377d77102e3b66c154b.camel@mailbox.org>
Subject: Re: [PATCH v3 0/2] drm/sched: fix use-after-free of the fence
 timeline name
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: phasta@kernel.org, "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>, 
	tursulin@ursulin.net, matthew.brost@intel.com, dakr@kernel.org
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Michel Daenzer <mdaenzer@redhat.com>, Alessio
 Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>
Date: Wed, 02 Sep 2026 19:25:00 +0200
In-Reply-To: <1b628841e8bb8735f2bcdc79450a49e75433101b.camel@mailbox.org>
References: <20260902144204.1843670-1-malhyuk97@gmail.com>
	 <1b628841e8bb8735f2bcdc79450a49e75433101b.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: pfou7igwk6tczjc5q9hrdxm3rdfnt4xf
X-MBO-RS-ID: 9de1798a2cf9fef0463

+Cc Alessio, Luigi

On Wed, 2026-09-02 at 18:09 +0200, Philipp Stanner wrote:
> Well, that was a quick investigation ;)
>=20
> On Wed, 2026-09-02 at 23:42 +0900, Jonghyuk Kim(MalHyuk) wrote:
> >=20

[=E2=80=A6]

>=20
> >=20
> > Note: detaching the finished fence's ops on signalling also makes
> > to_drm_sched_fence() return NULL for a signalled finished fence. Caller=
s
> > already handle NULL (the normal foreign-fence result), a signalled fenc=
e is
> > an already-satisfied dependency so the scheduler's dependency collapsin=
g is
> > unaffected, and it avoids the container_of() on a possibly-freed foreig=
n
> > scheduler that amdgpu_sync_same_dev() and pvr_queue_fence_is_native() w=
ould
> > otherwise do. Flagging it explicitly since it touches an exported helpe=
r.
>=20
> That unfortunately does look a bit dangerous.
>=20
> Isn't pvr here already a race condition?
>=20
> 		if (pvr_queue_fence_is_native(uf)) {
> 			struct drm_sched_fence *s_fence =3D to_drm_sched_fence(uf);

I looked through the code base and it seems no one touches the ops
pointer.

The exception is imagination, which uses it to identify whether a fence
stems from itself. So if we implement a change such as the proposed
one, explosions are thinkable:


bool pvr_queue_fence_is_native(struct dma_fence *f)
{
	struct drm_sched_fence *sched_fence =3D f ? to_drm_sched_fence(f) : NULL; =
 // <-- ops pointer still valid, sched_fence !=3D NULL

	// race: dma_fence_signal(sched_fence->finished) -> sched->ops becomes NUL=
L

	if (sched_fence &&
	    sched_fence->sched->ops =3D=3D &pvr_queue_sched_ops)
		return true; // might return false now although the fence was created by =
imagination

	return pvr_queue_fence_is_ufo_backed(f);
}


So depending on when the finished-fence gets signaled, the function
could now sometimes return true, then false, depending on how it's
racing. Not entirely sure, depends probably a bit on when imagination
is signaling its hardware fences and so on.

But I'm not entirely sure to what degree we have a problem here, and if
so how we should best solve it.


P.
