Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F224457AF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455763; cv=none; b=Q4F2KjZIe3jgIOnwD+KYREPdS4hOVI9qa3gQxsUudNUUlAGtbj9+SKOtPHgLimOGA/+K2Q1i0ov1ONi4nK5NUHk1YfiW7Be6pmAlOEa97TtN7GYf386Opp5Nx2b7xhhcBDap3libc1byaVAK7EWfXVWJponUUOCSBfZQCYuSvZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455763; c=relaxed/simple;
	bh=xc0GDA97QCq8wemAf9VBpl49z3GJ5ePcH+ySKJEyeTM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lmGwh8ue2+B61kdbjNOQyMrPD9ZiMzR6CwWP3QIBj48wtdaKYjBQ/SwP5gTqFenwd1rzrgzMdjMpgTb0RpiDoHNBNmG5yhp1jV/boUzXfOoKevHplV3zRU99OHLyz4uojCkkoCLxlEBMG6daow5zkK8bfOEyoPiBh5wNrot+apI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TGF9eXsH; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TGF9eXsH"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hkXyh60FwzKmLQ;
	Tue, 15 Sep 2026 09:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789455757; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbg3BtMVbqaxsbsMd5F1ZFrzrzZ93PsiV9IrV9o+Gkw=;
	b=TGF9eXsHWYgqqIwAndc9WiDAEVCnd9Ln5NMvm+l9F3auEOMQxyVWdFOnNXx37eG/ciBKIs
	vJYWzvbQgiermtzGKuxlIRoQBd7muThquAwe08tMr/RwYIWWjGmg7tGqMV02kNSZFHeJS5
	5ljeZ3N9KT+UAVxbrr2kuf16YMLLXcHX9EcIPXD6KS32dAolhJ0r588b7gOa39QhJQGPoM
	GC70QvLP3CQPhH1cusW67oDsuIlVGMD4KOz92AWTwC+seTiMbVLs8ntaOXE+y+w2JGXLuK
	sm9xekN1IuJHOHHsf5EZ3B5vyL5X7fDOXj7+LjdZIYqrSH0vc5t9QFLAyXA6gQ==
Message-ID: <b81b997db594e257bc15fffc8b2aad8ae7de7ca1.camel@mailbox.org>
Subject: Re: [PATCH 1/2] dma-buf/dma-fence: fix checking signaling bit for
 timeline and driver name v2
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: christian.koenig@amd.com, phasta@kernel.org, malhyuk97@gmail.com, 
	tursulin@ursulin.net, matthew.brost@intel.com, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mdaenzer@redhat.com, alessio.belle@imgtec.com, luigi.santivetti@imgtec.com
Date: Tue, 15 Sep 2026 09:02:28 +0200
In-Reply-To: <20260914182740.1587-1-christian.koenig@amd.com>
References: <20260914182740.1587-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: a5d148c3a37057ef1a7
X-MBO-RS-META: xak74pntb63q3zmutakbmg64y5sc7h6p

On Mon, 2026-09-14 at 20:27 +0200, Christian K=C3=B6nig wrote:
> The patch "dma-buf: dma-fence: Fix potential NULL pointer dereference"
> changed the check to test for the ops pointer instead of the signaled
> bit to avoid a potential NULL dereference when the ops pointer has been
> cleared.
>=20
> The problem is now that the ops pointer is cleared only when neither the
> release nor the wait callback is implemented and this isn't true for a lo=
t
> of dma_fence implementations yet. So those implementations lost the RCU
> protection after signaling of the returned string resulting in potential
> use after free.
>=20
> Add the signaling check additional to the ops pointer check so that we
> have both the protection against NULL dereference as well as the RCU
> protection after signaling for the returned string.
>=20
> v2: improve comments to note RCU protection and explain why we check
> =C2=A0=C2=A0=C2=A0 both signaling state and ops pointer
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 035219a760ed ("dma-buf: dma-fence: Fix potential NULL pointer dere=
ference")
> CC: stable@vger.kernel.org=C2=A0# 7.2+
> Reported-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
> Tested-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 16 ++++++++++++++--
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 |=C2=A0 6 ++++++
> =C2=A02 files changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 05090fb0fd5ae..f52675f3ba03a 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1170,7 +1170,13 @@ const char __rcu *dma_fence_driver_name(struct dma=
_fence *fence)
> =C2=A0
> =C2=A0	/* RCU protection is required for safe access to returned string *=
/
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> -	if (ops)
> +
> +	/*
> +	 * Check both signaled state and ops pointer, we don't know which one i=
s
> +	 * loaded first and ops pointer is only set to NULL on newer
> +	 * implementations.
> +	 */

nit: "we don't know" doesn't give the reader confidence that the
ordering is right. I would more say "Load ordering is irrelevant
because =E2=80=A6".


P.
