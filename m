Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479189;
	b=Kuo6RcI9+1jQ2FBomdgwAkmJ2hXqX5/pT0WortNEddm8i7Bpd7bZAApK/kA2FqBw90Ro
	 RLe8OAhxbXN/2TW13J29UNRmLfenoZ7+rDIDFPCaKQVtOjF7AACTy+mtmfhGWA7MyFE7x
	 DdVAyvZDNj2wOZIT23obsGVp6FKws5eXnPzfTGpaPhm5e9fee63PKwO+iUw59r1ZDMiCc
	 B3iNMo6Pod+u4QzKxEAz96PlmD7lDoT6wHU720t6r/R1tlQ/hshzQ+t64kRGRfZ8JrzWL
	 MLch2U4zx5rybCV+f94NF7lUFoD8+tg+MN2mDx4oY6hqk2/qo+KaLE9lVogRPJJ3mLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479189;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=OK8YGZhCuYN7PjkF61JI9cc9bBceH655VkFL4jhmmXw=;
	b=4rllL/+gAwcqJxN2PPXtGMNPz4Yh8pQx5piqeE1+ZfR0XbaUqmHWOphISBfFhGszeBIF
	 +DFkVOO+LO3/w+UiKwQqdRMAoi2Mot6KsBUQlwoTOpM5a4lwcDfn69aXaO+O41r0QzUhd
	 yGSBtBdr1wNsMXLb8BkkCN36cfGWPQDjwuo0CSLihJ0TDzHfQjktwJVqZ6FuxbZ+KAeM4
	 XpH3MYPoiazaiVASQBmcHlWURMLRmuAGUovDZjs+zVZERPu+B6O3cGIJ/V5owRE3nvdU1
	 xOEA5/twj8kUfgbVgCZGinZZoYLrXfQTlgUIEqmhlMFpE9n7SO9zOgmbD8dvg/5x7LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=EHWfj9NH;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB62D606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB62D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=EHWfj9NH
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4j835Y1qf2z8sXG;
	Tue, 20 Oct 2026 08:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792479185; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OK8YGZhCuYN7PjkF61JI9cc9bBceH655VkFL4jhmmXw=;
	b=EHWfj9NHB9deX+n7KhtMnlThlFB1aq9+79His/G5F0aLioSYXnZkMB6nsw1k0JTWS3fPeY
	KIaBdRW6x/a97/2uIFCtloBGQ7bU0cmSXM1YOszreMvg7zWi+LzFfPk+C62ttkAMMzrjyb
	RfUXS1ZGfRnvKMPjBJBHTY8W6yKCxMdsg0uc3C8yvc/hikCFA5DkFYTIHYsZG5EJQUX/Gd
	JUV6yyUft/oMhcI8kYDb2g2uVHpe7Uu7+O+FO5StWmvt93TmZUq+VHE0cYBsui4XgjYios
	OTW4bQ8/EvOf+PT32VNoqxiRbqSElcNxBd6dnzynfq76IGb1+UQIhOBcUZj9RA==
Message-ID: <30a31088a0386d5f5d53e74632ea9a63566dccde.camel@mailbox.org>
Subject: Re: [PATCH] drm: Don't BUG when a CRTC fence signals during a name
 lookup
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: redducc <sushmit718@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 20 Oct 2026 08:53:02 +0200
In-Reply-To: <20261019161731.2341-1-sushmit718@gmail.com>
References: <20261019161731.2341-1-sushmit718@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: f4f4161e66a53c110e3
X-MBO-RS-META: 7gdsee6ceoberawkpoycxcwqacf7rbuj

On Mon, 2026-10-19 at 16:17 +0000, redducc wrote:
> dma_fence_signal_timestamp_locked() clears fence->ops on signalling when
> the ops have neither a release nor a wait callback, which is the case
> for drm_crtc_fence_ops.
>=20
> dma_fence_driver_name() and dma_fence_timeline_name() load fence->ops,
> check the signalled bit and then call into the ops. If the fence
> signals between that check and the call, fence_to_crtc() rereads
> fence->ops, finds NULL and hits the BUG_ON(). This takes down any
> caller of SYNC_IOC_FILE_INFO on a CRTC out-fence, such as Android's
> surfaceflinger, which hit it on a Snapdragon 8+ Gen 1 phone (msm).
>=20
> The CRTC behind the fence outlives it, so reading the name after the
> ops were cleared is fine. Only warn when the fence carries foreign ops.

@Christian:
We have now seen several bugs like these, which is one of the reasons
why I believe that RCU is the wrong solution for dma_fence.

I present another rework RFC soonish.

>=20
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Assisted-by: LLM
> Signed-off-by: redducc <sushmit718@gmail.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>


The Signed tag btw. states that you have the legal right to push this
code upstream, and that you agree with the kernel's licensing. It's
uncommon to use with pseudonyms and lessens your personal accumulation
of prestige ;)


Philipp

> ---
> =C2=A0drivers/gpu/drm/drm_crtc.c | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 63ead8ba6756..1dbd0e9db536 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -158,7 +158,13 @@ static const struct dma_fence_ops drm_crtc_fence_ops=
;
> =C2=A0
> =C2=A0static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
> =C2=A0{
> -	BUG_ON(rcu_access_pointer(fence->ops) !=3D &drm_crtc_fence_ops);
> +	const struct dma_fence_ops *ops =3D rcu_access_pointer(fence->ops);
> +
> +	/*
> +	 * Signalling clears ops, and can race with a name lookup that already
> +	 * picked our callbacks, so only a foreign ops pointer is a bug.
> +	 */
> +	WARN_ON_ONCE(ops && ops !=3D &drm_crtc_fence_ops);
> =C2=A0	return container_of(fence->extern_lock, struct drm_crtc, fence_loc=
k);
> =C2=A0}
> =C2=A0
>=20
> base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
