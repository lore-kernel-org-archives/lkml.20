Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A96550DC3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962312; cv=none; b=C+a8PI/pz2YSKk5hQHVw3v0nDfuKxuzFpnKyH0qvta3CMBJ5LoiOfGLVDWDbYa9yvy+BpNQbqebvWNqxZgGgVDgBUc7ryAEHrh7Q/G98wkIfiCUzZlUk0slcWyLzRVAm1iCWCMNbF87j4nwW9FcUdYMc+u5pIKYdx5Uo8LVxCBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962312; c=relaxed/simple;
	bh=d/eBbI7tkaFqTgPC5XF+SK73NVv7upzyDSz2miC4GFk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gnKddMaldnmp8gY5GdLXxxm6g86/B3Bb9ZMP2bFt7k/8OEJFfAP54joNPGtgpvBARlcK6vZ+byVeqCgjKcs0hvdLBQSN6QpQe6YOjhLM9+sNj1Xv1UxVkevq+/L0ewiJrvWhAYOJFeQ9xJ0NkqFKngJ7q/qdkVapfTDj6x3N0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nxe+n/om; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nxe+n/om"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hg2TG6qYbzMlK6;
	Wed, 09 Sep 2026 15:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788962306; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qUrNQ3cA6EZHPhAyCHKqYeA0HtQpB6QZ91fnWn7LXpQ=;
	b=nxe+n/omBhnsVKEjTdrhXy+avFmV3KIxpCIkK4dHzHMLAlc1AByLRem6iAAHD6zTFiVaj2
	VS1ioW9nxjhuKKBRaFuq7atMGX1vkO2sVCfs/PHEceAcZqPXNSK1OzK5y0XFNXjk8yBaLw
	nzI1PVCDaqmcEvqwfCnoPCAieYr4HMPYzDscrg4Esbl3vJQUXrPhKkUyXsdTHe5rowTjPw
	M5gYksivazd1Nj0ElnamwtxNNknhBo/MHqrjfDpasivtDXj7GlSA6CQNm6OhW122L0wivV
	P018OkH7xjgHepg/xXCVeqrDV18YHM1oGDYNaACrNUzVuMXkgkskXqdMsDx4GQ==
Message-ID: <378b2599ada8e62cd772dfc6a751e3e39cfad04a.camel@mailbox.org>
Subject: Re: [PATCH 1/2] dma-buf/dma-fence: fix checking signaling bit for
 timeline and driver name
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: christian.koenig@amd.com, malhyuk97@gmail.com, tursulin@ursulin.net, 
	matthew.brost@intel.com, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mdaenzer@redhat.com, alessio.belle@imgtec.com, luigi.santivetti@imgtec.com
Date: Wed, 09 Sep 2026 15:58:23 +0200
In-Reply-To: <20260909131808.2201-2-christian.koenig@amd.com>
References: <20260909131808.2201-1-christian.koenig@amd.com>
	 <20260909131808.2201-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: fe6mxujrfz1degi3t8978ebusrptjxok
X-MBO-RS-ID: 7b3f6d91a5e071ecba4

On Wed, 2026-09-09 at 15:14 +0200, Christian K=C3=B6nig wrote:
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
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 035219a760ed ("dma-buf: dma-fence: Fix potential NULL pointer dere=
ference")
> CC: stable@vger.kernel.org=C2=A0# 7.2+
> Reported-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
> Tested-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 05090fb0fd5a..e92f9df8d63c 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1170,7 +1170,7 @@ const char __rcu *dma_fence_driver_name(struct dma_=
fence *fence)
> =C2=A0
> =C2=A0	/* RCU protection is required for safe access to returned string *=
/
> =C2=A0	ops =3D rcu_dereference(fence->ops);
> -	if (ops)
> +	if (!dma_fence_test_signaled_flag(fence) && ops)

It's probably a good idea to comment at an appropriate place (I suggest
here and at dma_fence_ops) why this is necessary, because at all other
places the ops-pointer can serve as decoupling point.

Reason is simply to also support drivers that implement release() and=20
wait(), preventing ops from being set to NULL.


P.
