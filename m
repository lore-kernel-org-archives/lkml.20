Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8333B308F3C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507762; cv=none; b=I5Qj6sWPHOUiLq+trJnRotPN7QFyu1c2QC5YgDy4Vxoa80RGg38mBfMJkrqPdOH5ZxxO4K4WY4xzjhmOyvMt7KA2odBUe0Od39lFt4khvAt7VuGDmijl2VeLa10I975r9F4gDCgRCduz70IFw+vhCse5VY19ZNioi+tytzbgfIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507762; c=relaxed/simple;
	bh=fsgTk7ixTkswjgeNyhd4bVOqBWwihCnlgaEpiI44N3I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VExxdZPvpaO5b7/CHaTFpTRC6zX8Qzldhy2Ml1FwnJQ4+stpwg4SfAVXQ1LWqS+Ct6+4WAAtVvUvc98RBTB1Kmjd3bp8GRBLYxFLt0zvdPGDoio2KMR/5ePu+00x3qCrikLD/734gan8JPq/gEmP8ceAYeMf7/4LTshkxXDdbIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iwvvIzGW; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iwvvIzGW"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hbpMw41D7zKm7S;
	Fri, 04 Sep 2026 09:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788507756; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsgTk7ixTkswjgeNyhd4bVOqBWwihCnlgaEpiI44N3I=;
	b=iwvvIzGWGT6Vck9Kq/afSN12GD/hUipMRzLvu58DrvWBSnkfhpI7dGplU3/HI+2oadRUOF
	fcZqzCh6w1WK8j3i6152kw75FcGWBmkjrH1bETAWwsxH+BrJ6l/6xta8boKZ5yqTDOZgS6
	yxePNeMAY1wk4xtBgX41T6Q07sxBzWt6L2z851ljeQXR2tB4cZxYlUeRve/tb74wddAy2Q
	e+K2M6IH7Q36zsAant82v40n5ZR4NMvIUB0YiLiZ9aZ3Tmvy7kx/HrAC3d+oHcxY1CYAud
	TyBwaCVpS2NOb8YD15Keht/Np3GBX09ZrXzlm8QCG1VlXuK14iEbs3aULoUtCA==
Message-ID: <9ca6f37d47271653e02b4383dd1fc372fd042e7a.camel@mailbox.org>
Subject: Re: [PATCH v3 1/2] drm/sched: fix use-after-free of the fence
 timeline name
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>, phasta@kernel.org, 
	christian.koenig@amd.com, tursulin@ursulin.net, matthew.brost@intel.com, 
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mdaenzer@redhat.com, alessio.belle@imgtec.com, luigi.santivetti@imgtec.com
Date: Fri, 04 Sep 2026 09:42:32 +0200
In-Reply-To: <20260903180134.950043-1-malhyuk97@gmail.com>
References: <20260902144204.1843670-2-malhyuk97@gmail.com>
	 <611c2624e60ea422229e666480da3e504d126682.camel@mailbox.org>
	 <20260903180134.950043-1-malhyuk97@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: tpxndzjk4y1xiaetwjywbamxpcxkk8db
X-MBO-RS-ID: 6c0ea2f808a5f358b62

On Fri, 2026-09-04 at 03:01 +0900, Jonghyuk Kim(MalHyuk) wrote:
> Thanks a lot for the thorough review, and for pulling in the pvr folks.
>=20

[=E2=80=A6]

> every to_drm_sched_fence() caller. I don't think that is the right trade =
for a
> fix we want to backport.

Would seem so. But then adding an appropriate TODO seems right. Also an
entry in the scheduler's section in Documentation/gpu/todo.rst

>=20
> Christian's point that the finished/scheduled .release callbacks are
> "unproblematic for the problem at hand" matches this: the release callbac=
ks do
> not need to be removed to fix the timeline-name UAF, so keeping them (and=
 thus
> the ops attached, and to_drm_sched_fence() working) is fine.

I think that's only the case because the scheduled-fence is not exposed
to userspace by anyone yet.

But since the entire drm_sched_fence is a public API object, sharing it
with userspace would be legal, although doing so likely makes not much
sense.

>=20
> Given that, I'd like to fall back to the minimal caching fix and drop the
> ops/refcount rework entirely:

I guess that's the best thing we can do right now.

>=20
>=20

[=E2=80=A6]

>=20
> On the specific points:
>=20
> =C2=A0- get_driver_name(): it returns the literal "drm_sched" and never t=
ouches
> =C2=A0=C2=A0 ->sched, so unlike get_timeline_name() it isn't exposed. Onl=
y the timeline
> =C2=A0=C2=A0 name needs the fix.

I'm not so sure about that.

The primary reason why the rcu-decoupling was implemented is so that
drivers can unload while there are still consumer fences around.

The problem at hand fundamentally stems from the fact that we have two
fences, hardware_fence (often called "parent") and sched_fence. The
driver only cares about the hardware fence, and then there's a delay
between signalling of the hw_fence and the sched_fence, which then
decouples.

So get_driver_name() could still run into a code-UAF, depending on
where the string literal is stored.

>=20

[=E2=80=A6]

>=20
> Unless someone would prefer to keep ops-detach and fix the two callers in=
stead,

I mean, that *is* the gold-standard solution for the problem at hand,
because it complies with the new ideal for dma_fence usage.

But it's a bit of work probably, since you'd need to figure out
solutions for the problems we discussed. Christian can probably help a
lot with amdgpu, maybe the other folks with pvr.

Up to you whether you have time to try to fix the problem in this
manner. If not, as mentioned above, we should leave an entry in the
TODO list.

> I'll respin as the caching v4 once Tvrtko and the pvr folks have had a ch=
ance to
> look as well.

Cool, thx!
btw, replying inline at the corresponding mails with the others' quotes
above is preferable since that helps people catch up context, and
people more easily can spot whether you're addressing them. Not always
possible, but preferable.


P.
