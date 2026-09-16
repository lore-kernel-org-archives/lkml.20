Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA003C0A0E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563254; cv=none; b=t9v+jW+nCmWJnTBLhElAsmiXuO+AkNIjShbkH65akd6v4stcI636lRATTYFAmROCw6F8NWxeNGBUw+ByILsObRE+IluKlxF+F8i8YO/KhHShTnlZNsmorm1mzkgx5ejdNpyhdlbVY1x08i+R6BCdvdguP8JNeZf+3xWSt31ubhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563254; c=relaxed/simple;
	bh=moYMiM1SjomqweNe0uspuutzEKMU9N6KeLKEX2Q1sc0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rRisbpSTSJE72QDwmMLz++CoXezXc97PdSOw02lRMZ4mK6/T7Df5iTTMz2OnUY8b9B03oDB5jbHjCmcARtg/2rLxOI28ITte6N3t04rIBT9jx3Z+8+4U2wRZrjchWA/1w8Q2R9F2meXlq4/mN6bBf0fmM+xeyekrhUVlTdqge+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xzJE9iCp; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xzJE9iCp"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hlJjr4MRRz8v0L;
	Wed, 16 Sep 2026 14:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789563248; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moYMiM1SjomqweNe0uspuutzEKMU9N6KeLKEX2Q1sc0=;
	b=xzJE9iCpUdo3/pSwwrNkdTAuMI3OLMS6Qn6CJWOO259NfijuwM0oun5M3Rw71QXUZjlctQ
	9HTwETLM8WcSwZhTwOhdiB5/xtQaYC47XiRF6Pv2tyGBZaAaxv7DRczICTQqPMpxwVMpQW
	1EJzw5jyWYQfpyMXPfgQLK+FSmx4GwhJA5w1nqpF2SdEnazaXmglEzfdP4HAS9AjOQb4FG
	EExSkZUfE2+zir4oqTFP6ggNZIKIN3/p1wx9khuJqjFLGl2czT3rY7Vy6I3JsY/gu5lZZk
	wFggP1IUcDhFMOp/KSrmXNCOlJ1FJHyAEQoQ9sU0k2TV56hkc/aUB3vlemyL7Q==
Message-ID: <47731da478e8801dc9823ecf286e941020e30963.camel@mailbox.org>
Subject: Re: [PATCH v3 3/3] drm/sched: Protect entity->last_scheduled with
 spinlock
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 16 Sep 2026 14:54:00 +0200
In-Reply-To: <f186f871-064a-4f45-8987-fe9f2fb3fa1c@ursulin.net>
References: <20260910075942.2000338-2-phasta@kernel.org>
	 <20260910075942.2000338-5-phasta@kernel.org>
	 <f186f871-064a-4f45-8987-fe9f2fb3fa1c@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 8312574d89f7fefc5c4
X-MBO-RS-META: 8f6gaz4kg16okow1qcgy7fnnh7e3io8n

On Fri, 2026-09-11 at 09:17 +0100, Tvrtko Ursulin wrote:
> Also, to repeat what I said before, I benchmarked this a bit under=20
> extreme circumstances (4x non vsynced vkgears) and did not find a=20
> regression in fps.

Does that mean you give this an official Tested-by: =E2=80=A6
?

>=20
> Here you can compact with the idiomatic:
>=20
> =C2=A0 prev =3D dma_fence_get(entity->last_scheduled);

Good idea, will do.

Thx,
P.
