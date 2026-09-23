Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE4F56B86F;
	Wed, 23 Sep 2026 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177241; cv=none; b=JPCBAx1U1m+QneeWgiEDaJtLQaznwdWSQM3zTpJaE5tzQA+2cCNyom70xEFY3bjhSx4xMhtzpLvBgQQDhVHwU7lOlRF4RXjZS9yBkKcTdBHCBDCOpRuk8e7QOSYpC7q5h9y6fhn9DhLzP/o/rST0jC64bTePOsKAS/dZd2gfTSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177241; c=relaxed/simple;
	bh=b6Ta219PQBPYcOufST9mbQh8rV89nYKfobEEF5TPPt4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=irqifAYGeL2d/WffqXxFjeemyEBZuOeITdbl5EjVDi3MAVC7HUZ2U/HXIQQuDroVDT/FQZOZp/zD85+z9w0SFIfrQXXqXxEhSLF9S3Esp3KRFBwJptX2/LHBDdCc0ei6YgxNccLVGkL5suFbwSJVam9wsEuYhwMsXkJa4Iv/sww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eoqXCRsb; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eoqXCRsb"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hqgn84GcfzKnDg;
	Wed, 23 Sep 2026 17:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790177228; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyKF4/6NTMMn3I867npjUmJjWdb1bsW7lxCFL1zlTZQ=;
	b=eoqXCRsbGPuSwKbg1nn6FsdVWY2BADm4ICEKPIwfNJ98Uxxe+rbPI1HKOdPx3HhuZbGUgN
	Kt8FEmpjaN+HlrfHq7BrJf9fnvW46pJliV5Hgxb0bQPYLUlI2WHmi1jm+Da8jk6/d/Fb/D
	wucOisDRVaiH85yRzzlObjP4MHfRq31II46j549XD5yop9NtK0ai15t1ay/ERczNE/1kz4
	2e1LYBldjKC9eE3TblwREY/IM/Nbv6PQd/1an0VhoFk0M1wPrxefeidEruO8f92vpMK69w
	KCDPFVh07QoQ9oXQVN1vEfjOUS4vvS6JsWmfm5JX2BnUxowUgRwn9cXX/iMQZg==
Message-ID: <469d5deb2ef644b5d77d21bc2d700443f00c0b4d.camel@mailbox.org>
Subject: Re: [PATCH] dma-buf/dma-fence: Mark two callbacks as deprecated
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 23 Sep 2026 17:27:06 +0200
In-Reply-To: <3983b2de-b6ee-4674-be22-9ecb2525a055@amd.com>
References: <20260923150308.1294592-2-phasta@kernel.org>
	 <3983b2de-b6ee-4674-be22-9ecb2525a055@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 1f309f0964af6ffe465
X-MBO-RS-META: rchzwudec8q3dxj84cuk1no43fcd1hxp

On Wed, 2026-09-23 at 17:13 +0200, Christian K=C3=B6nig wrote:
> On 9/23/26 17:03, Philipp Stanner wrote:
> >=20

[=E2=80=A6]

>=20
> > 	Consumers of a fence can instead notify themselves by
> > +	 * registering a callback on the fence.
>=20
> Mhm, the wait callback is transparent to consumers it's just that impleme=
ntations used it for quite a number of different hacks.

Right=E2=80=A6

but doesn't the question then become why dma_fence_wait_timeout() even
exists? IOW, shall we deprecate it, too?

It seems to be a reimplementation of waitqueues. The driver could get
this functionality by using a waitqueue whose event gets triggered by a
fence callback.

dma_fence_default_wait() interacts directly with the task state with
__XX_task() functions which looks very.. deep to me :)

>=20
> I would just drop that sentence.
>=20
> > =C2=A0	 */
> > =C2=A0	signed long (*wait)(struct dma_fence *fence,
> > =C2=A0			=C2=A0=C2=A0=C2=A0 bool intr, signed long timeout);
> > @@ -243,6 +249,8 @@ struct dma_fence_ops {
> > =C2=A0	/**
> > =C2=A0	 * @release:
> > =C2=A0	 *
> > +	 * DEPRECATED!
> > +	 *
> > =C2=A0	 * Called on destruction of fence to release additional resource=
s.
> > =C2=A0	 * Can be called from irq context.=C2=A0 This callback is option=
al. If it is
> > =C2=A0	 * NULL, then dma_fence_free() is instead called as the default
> > @@ -254,6 +262,12 @@ struct dma_fence_ops {
> > =C2=A0	 *
> > =C2=A0	 * If the callback is implemented the memory backing the dma_fen=
ce
> > =C2=A0	 * object must be freed RCU safe.
> > +	 *
> > +	 * Deprecated because it prevents the producer of a fence from
> > +	 * unloading. No new users must be implemented. Parties with a
> > +	 * hypothetical need for this callback can instead simply and directl=
y
> > +	 * perform their custom release operations one RCU grace period after
> > +	 * they have signaled the fence.
>=20
> Yeah that is a bit problematic.
>=20
> We need my patch set to explicit signal fences instead of returning true/=
false from callback for that so that a backend can properly implement this.

Well, what I'm trying to say in this docu is that the driver can kick
off custom operations that shall be performed once everyone is "done"
with the fence after signaling it. Any driver data that might still be
around cannot be accessed by fence consumers after signaling anymore.
So the driver could trigger cleanup work after a graceperiod, as long
as it does not involve kfree()-ing the fence itself.


P.
