Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB0635C69C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402324; cv=none; b=L078yd5b3Eb69lLu+R65jFYI5062Tg9+MeMHr6lLaHMLXKbxALrmJPYaVwLPc5OUhQYWIDzlWN5U9cny8WpmYOYKoTo0BZWyJVVPsv/Q0YdLuFASo0Q5/6zQBcjwEirxKvsjxmFhlT3KyjvnSCNgSnamlrEoxSOTYPT9+7SggQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402324; c=relaxed/simple;
	bh=whWzBLS2wmRxWDNqkKlLcdLwgrG1sbnMZySXUAFc6a8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kkxadif4Kh2kST0ZbAyZNWr9akeBnm4jjatztgja+1OliFTU/eBEuw/22vBxC4MZkz1RY8+zKDggU/M4g/27bsfHcr4dAH+v8ziNrtx+NPbqvLyvzQulqPD+2jddAB9mFTrQylccgFivGsvTAS/uiLClS5wQuxt8HM2mEPz/Gxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ToHrbJEE; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ToHrbJEE"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hk9Bw0QDVzKmJK;
	Mon, 14 Sep 2026 18:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789402312; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1UfaGhIpy5Dvplr02p7iGkuX5llX7tHIRnfdWIDMHk=;
	b=ToHrbJEENCgOEfJyfWdKXB2x30h/Ie7TMrCCZLnvGg8S26C0ge0xgGj34jlVtppfGRR5x3
	gnb5OMHMyf9r1Bn8vE0UGyfZZbTaKwbdkRZLf7X1ChJbM1cR4Iijq7umCFum5FLIfgBRvd
	5m5yjU2NHtFOa+BYdHZs+JC3o1KsUj3KODXdpQKjy01mYjR9FHntDXBJit4mUdNT3lSm9i
	PRHrwCdK7RAUY4gzrIGCbu3GNWWOONpDBIk5ruC3Rx/RrgIfYVDzmHDWwwNSKrRTVSi31y
	mssjCHaSGx4QiJjcO0B9n7J0/22p2wXygz5FpmV5Vcok/OKXD0aFvmJ5ZkSz5A==
Message-ID: <c57cd3daf458e1868aa468f6e426ac0220c615a8.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Remove useless BUG_ON()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 14 Sep 2026 18:11:48 +0200
In-Reply-To: <20260625120151.1757146-2-phasta@kernel.org>
References: <20260625120151.1757146-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ui38oy8szfpqbw8udhqb7fyzigdkn3ph
X-MBO-RS-ID: 47d6b421d68e00cc370

On Thu, 2026-06-25 at 14:01 +0200, Philipp Stanner wrote:
> BUG_ON() should not be used anymore since it crashes the entire
> kernel.
> Its remaining usage is in drm_sched_job_arm() to check the entity
> pointer. If that pointer is NULL, however, the problem will become
> visible through a respective NULL pointer exception anyways.
>=20
> There is no advantage in crashing the kernel as a whole.
>=20
> Remove the BUG_ON().
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Can someone review this?


P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index d2ca01b31ee4..4e1b6e79ae19 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -637,7 +637,6 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> =C2=A0	struct drm_gpu_scheduler *sched;
> =C2=A0	struct drm_sched_entity *entity =3D job->entity;
> =C2=A0
> -	BUG_ON(!entity);
> =C2=A0	drm_sched_entity_select_rq(entity);
> =C2=A0	sched =3D container_of(entity->rq, typeof(*sched), rq);
> =C2=A0
