Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15BA3EB104
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427998; cv=none; b=Fs8P0T8wZD9psCOxHEaDi966VZbe5wduttojBnH0TOQzEutAVGlMH1MbBDFOaXnuXYgTH8e5qi1B8ujVt6lIEICu9kfVyJMNiBBJ/ua0uG2N1zD53MEOjlUBmN7rsRcpUGUeZn1bZHNKa5lLMVsbiVXyzmbfPlDwfY6Bj7X4FDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427998; c=relaxed/simple;
	bh=uaPMukZM29DUPOLoFf9OMfBsXPcZTZ6jF8H01MrSHTg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lHN0oYjLhtFaZcsDYGHsX6f0jzV3S9RC8+aGHGZ7r/232NY4Skt2JzzD3YoRnLv17wiM7PLyQTwq5yatyZOGg7YEKLu76IU0JXci+9TG/3wVdSOC4bjILlNwoLgUfnnbqFYDks9wP0E9ANQrrJorxGVV2K1Jcj4jdSJgs3vo6C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fGocsu5w; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fGocsu5w"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hbDsx3BKmzKvtc;
	Thu, 03 Sep 2026 11:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788427989; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yfeHUrWXbmTmlR2tQBN/VW8zgSXE4jauar5OH20Fibk=;
	b=fGocsu5wjuLUI2zEq3IoMVsLwDmq78NNjUmneZ/Yyl/z741Z+uW3jrD2BAgnSSgK4gwLve
	TePsv6iqOK/1JBwdocdxUP9P3UL+soaifcY+l/54GX4RQaJ9/OMZlBNc98F7DQdjEUS0gr
	oEQTU7uCp3HyDv/W/c1Q7IZ80xBlZIn0BWkHDk5wW2QOg+h7FwaQitK5C/7YUM9ZD/909o
	T5UXUGYvahwxyXCSghFpCKJ9ixMdOxk7igsdzZfuATRsgFRas8lHb5dKJTNKzSb2sqnsgg
	pJVuebMh5a5Tjtf5e+HnDm2Do2w/kvtqD1MKWM+kQZUOwNtjfZoOiXgC2F8Nng==
Message-ID: <b9d46dbb2f84d0bb601d5e0586f2e63f618d416b.camel@mailbox.org>
Subject: Re: [PATCH RESEND] drm/sched: Create faux device for KUnit tests
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: oushixiong1025@163.com, Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
  Christian =?ISO-8859-1?Q?K=F6nig?=	 <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Shixiong Ou	
 <oushixiong@kylinos.cn>
Date: Thu, 03 Sep 2026 11:33:02 +0200
In-Reply-To: <20260903090256.552317-1-oushixiong1025@163.com>
References: <20260903090256.552317-1-oushixiong1025@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: uuqo5a4chxgw66oc5c5dmmdqxp5a5p6x
X-MBO-RS-ID: b2c58434078d8a0c136

On Thu, 2026-09-03 at 17:02 +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>=20
> The DRM scheduler KUnit tests currently pass NULL for the dev field in
> drm_sched_init_args, which causes a NULL pointer dereference in the
> drm_sched_job trace event when it calls dev_name() on sched->dev.
>=20
> Use faux_device_create() to create a fake device for the mock scheduler,
> so the scheduler always has a valid device pointer. This avoids the
> trace event crash without requiring the production code to accept a NULL
> device pointer, which conceptually makes no sense for a scheduler.
>=20
> An atomic counter is used to generate unique device names, since
> multiple mock schedulers can exist simultaneously across different
> test suites.
>=20
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

Didn't you address a fault / bug with that?

Cc: stable =E2=80=A6
Fixes:

?

> ---
>=20

[=E2=80=A6]

> =C2=A0
> +static atomic_t drm_mock_sched_instance =3D ATOMIC_INIT(0);
> +
> =C2=A0/**
> =C2=A0 * drm_mock_sched_entity_new - Create a new mock scheduler entity
> =C2=A0 *
> @@ -296,11 +300,20 @@ struct drm_mock_scheduler *drm_mock_sched_new(struc=
t kunit *test, long timeout)
> =C2=A0		.name		=3D "drm-mock-scheduler",
> =C2=A0	};
> =C2=A0	struct drm_mock_scheduler *sched;
> +	char name[64];
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	sched =3D kunit_kzalloc(test, sizeof(*sched), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, sched);
> =C2=A0
> +	snprintf(name, sizeof(name), "drm-mock-scheduler-%d",

You could use args.name here.

> +		 atomic_inc_return(&drm_mock_sched_instance));

Couldn't that atomic be a `static unsigned int` inside this function?
Is simpler and limits the scope. And I wouldn't expect that we'll ever
call drm_mock_sched_new() multi-threaded, or would we?


Besides looks cool, thx

P.
