Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043353563FB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139518; cv=pass; b=IxuWgVCzCGlqEx+Sf3jJxEjQ9zRKL+Jyypf1fmZR04sEAm9PeUw/iAsEwvt+xdlvuxdpjiZkCLa/9rtd6u1KxWJ/GsRQcvg/FJbfVjdLZreTj8qceP+BNKKMi6/pA8qzj8P+mRvN+qJWwBkQOoi4IdbyRHBlGpLecau8M3jnw/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139518; c=relaxed/simple;
	bh=a1WAq8z6Lr5iIEubA1slcVW5P1heZAnFuDZolrmXxz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBZQmRV1WN0pjTevxCXgDAByaR4/M+hyLTUfobfsdSw9cToFtKRJo0gztVu/K4bf6CQZZ70j7fA3ZQun/sdRJNDHJ3dLWE7WlIJKOkp9OHf5zFz/Xc2xeoGQerFWQlhhB9kRATGkrnPsyxdipvg3ThxGDOhSwzSqnoX4OZKi3TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BKuu6Wdd; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BKuu6Wdd"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff390a6cso125ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789139516; cv=none;
        d=google.com; s=arc-20260327;
        b=l91elQ78tCv0w80M2iKIz6PoxcfJE9WRlZJAt0sTL0eoyalhXfqSi1K/IxVCBwZeV+
         GpJ/R9mLLakm1ZH6CRyWERcntH4otfNxcBbVuGiMA3CWvxPyoGqP2y06lYTk3ropjxQk
         Z3631ywKnspSbFZTv9hTdQ5TtH4yVO8arE+qEAGEdegrXIaW3cTKT1RraotkHazyi14I
         Wi1qa4MJr6Abl2qd3akHFjXpNaWspoIzyoYlmfzFor5pABB7KVUM5bO+qrUlaeVuetnY
         QFle+zQE2uhLt0PYxRu/BJ4XmMZDnLWeW9OSR3V/Tld7kbWcDCOcymW6z/LB3cj9u7nU
         LkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JwM5Epgg3IOjgygjiEjc2zoeXrLUf/Epju1L3iuJNZk=;
        fh=ckKscOUj/phyI9Ad6AB2PGleggpu73bZlLBHLSe/h0o=;
        b=Kd0BxA8Isz8ifXNmJ8QmYLB1suB3GA5ln2vnpCZwXCembOrDDl7o1WXSFUBf8MH2zm
         b1Ff6Yv3bOZSFjNx92rCDQevioCYcX5Svx4vKfHV1jpTdQDvbls05wnwN8rwHN+be90v
         CejuxKb8+jmr2Gb1ETJcIn6jktdIfkNriPAuVo0aKEpwZScpvzF4GKfiBAO4zUano+eG
         GD9djsVwFuboEct3DNxwgpUMtGj4GRBiVnU8G8YJfUI5MY96CCSFSzwMBbImCuqxLYTZ
         4MnzrBp0r62+kwKjyMzpNVLJic0o7KpunVzI5Yi2yBhTaWeWRVdzejRAKhOTQhtxHiqH
         ap4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789139516; x=1789744316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JwM5Epgg3IOjgygjiEjc2zoeXrLUf/Epju1L3iuJNZk=;
        b=BKuu6WddAtNn13Ezu/myWUrl8wRcirs7lJnORviTmc1pNq3zz8wrOYdnDa7K2cWUjn
         7qIuHQT7YQoVpdZfvYe5Hts8v0BvUZWf2y8Ncz6k/bzDPLJHpU5tPCS6kgo6K1KxYfsP
         RM1s3g2ne7RHDHhc4E3ULstmP4N+Kjg+OgnrmS1AT/+/AARhli0F8jDgJ6QWLfe9beuU
         24obPTwjhfvBcjcNQqwnl6G84hD6UML3GjvxMb9kFRnqQudyKTvO/xMmBgONinhnrLa8
         7oqzOdmbLt8giRI9tnl4yNW2z8EbiYjD1vlBjw2CMS+3WSgOY8iZeZvIZnr6AXfv76CO
         ffZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139516; x=1789744316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwM5Epgg3IOjgygjiEjc2zoeXrLUf/Epju1L3iuJNZk=;
        b=L5Q58lYVixSlJEKx7BmfV6Im+L28QGLOedBCK8BbTrhKZh+FjuGMpIrKrFhmV+w8Mk
         k5if+S7TPGrElG66Viw2p1F0J3khD6TxIyJ7rmJ6m/rpn+cEYhUQ/imF7XSMAOE4Mppv
         QkUupJMmm/VcWBILsN/meRisoJhDhcY2tupK4x6SUpqiDgcxvnOk56Q+Ny7NRAIFU/9X
         2s0E5NWgnLQPddTNVEjQOAJrXXmttFpwZ8IC4mSNe7DTucugb9TnCWKRgfx32jx0Icxz
         rYxv14LyiboG99fYKVTWkxUaiuhFJO5uRTCDKyfEa2M+kbjSncjCPfYPXGFSdQ7Z+YTa
         oVtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkaL3e6agxOZwfKQHWlvDcIsJ2UdOtsjhnfkfOpt0CVsNFXl76duX4i//PyhYrSAdD4iIjPVChiaJHRn8=@vger.kernel.org
X-Gm-Message-State: AFuF++kOJ5NPzXBv8n5d23CzBl4h8lWLEfOX/VnCeOC7J0ZOM0KzC+EJ
	iXZaI3UgoxiV2mDvVmmggm7l9yj6P6hlTiQL3FZgZg/Whg4mdfQdyN9ePgQdbtqG7OeprbVUkv+
	3mSScjkpQBgc1OH+IWHVEGBtwZM32iNaSjOWDknN/
X-Gm-Gg: AYBFou2BoVnamxj8OemqUPIjmDbsH/NyooFDkNiAJHxb/8Tt3hbfzHjpUAP29K8Pbcn
	tfgduOECh3oSUKL1m3TYrgpl14MQfxI56hVxXZk98f0PQi6kn3Hm2eHQ5DloNo4rXedNeoC7Yx7
	wQZiXW6uCL1pEypkaSyiuIae0xUydl4CnIHdE27+V3E+n7mmKllejUotaKY2dvLNjfsA+aQzi1x
	UteaHy3WD9AHA/P2VuZjJgA4XeG9mmV2wQ2OUGrs8Nqa0yQQ9SvFXD9y9tCg7gPws0O6YHCggfu
	Idn5w8jKBH3dOR16VTDEKw7Sq7M793NagYmVb3FUiKQImNfSWqwRW84zhziFZvOx/7SM9Cbn+l0
	N6mOiIhVUOVMRd+2pQ8DQrcPiri5YA+JZ/H6a8GD2Tw==
X-Received: by 2002:a17:902:dacb:b0:2cf:4353:f117 with SMTP id
 d9443c01a7336-2dd2bf06220mr7129715ad.0.1789139515742; Fri, 11 Sep 2026
 08:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-cloexec-before-exec-update-lock-v1-1-8018c201a7df@google.com>
 <87qzj09gau.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <87qzj09gau.fsf@email.froward.int.ebiederm.org>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:11:18 +0200
X-Gm-Features: AcwNN1UfWUuTxT6T6m2fFK9oBs0vwCiHpncLk9iQ0jXOn-ma2wM-nV7MC9jABfg
Message-ID: <CAG48ez3f=-Ydf6rQWRxgeD1jz40LTup3MUmNJgqAaUAgAekDuQ@mail.gmail.com>
Subject: Re: [PATCH] exec: do_close_on_exec() before taking exec_update_lock
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Benjamin Peterson <benjamin@locrian.net>, Jan Kara <jack@suse.cz>, 
	Arjan van de Ven <arjan@linux.intel.com>, Jake Edge <jake@lwn.net>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:30=E2=80=AFPM Eric W. Biederman <ebiederm@xmissio=
n.com> wrote:
> It has always been a requirement that in exec_update_lock not be held
> for writing over any userspace accesses.  Which is why it is taken in
> right after exec_mmap is done updating userspace.
>
> In the original version I missed that do_close_on_exec calls flush
> which can block waiting on userspace (Is that just a fuse thing?).

It's particularly egregious in FUSE, but I think network filesystems
can also block on network I/O in there.

> Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

Thanks for the review!
