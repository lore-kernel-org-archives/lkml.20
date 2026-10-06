Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FC3217723
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299958; cv=none; b=AZnACnTWqQWFFBZ/ydPvXQLOWg/galqND2e28b0YZm4tywuUtESAYn9R9/fqgtpGX1lMdIDPuPLOHOOPZFwOc+ZsyTUmmcWcmAsPCQIOYPPFZRk2cqrWG3WQNyavxRnAxNczJsXMzC5Do2psnCUcmT8l69jm6OfJ2jZHRr0NaNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299958; c=relaxed/simple;
	bh=Weov/P+/p0SLpGeOdCKZ0hPSh/5P6GsNL1zHwTxrXD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMDLc5URoyko4tFIBTaPPT5jnGa1lzYZcaiOpFxsNH6pY5g7hyeDtIyl6g7vz7h21swmO3zKm/5Zv0XZq4IqsqAoR/YPA8zRNLFtF17zqZZZoMU3nr42UEF3O8Tn8Lw+LqJFsQZjbD0P2nimklwZW2qnCUWgKkkv+h+q6vkFgYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=T4rRGkfl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="T4rRGkfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04441F0089C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:19:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=T4rRGkfl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1791299952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Weov/P+/p0SLpGeOdCKZ0hPSh/5P6GsNL1zHwTxrXD8=;
	b=T4rRGkflwwu37nc3SE56s5aXMFNq1Sd7iW4cWzK2tAYnvPhnH1j40GDZVnFwwLI0KGvv7Q
	PJughyNC8CBlfidR36wp9qFjdnU3/WaR95BTCQDoYMMnXMRA5salV54V8Qa9XyGuA6nCfq
	k1qsihynzbgngPpUsholmOlL4gFI33U=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 0c1d1af2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-kernel@vger.kernel.org>;
	Tue, 6 Oct 2026 15:19:12 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e5e801487so106445866b.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:19:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwouOTtfNIZ17Z+JTybvS3K4HJd0PBBTV6aI/Oq2/qO7qQnZPdrpLmuhglYfc+Uwltg/84vyE3xEwTabt0=@vger.kernel.org
X-Gm-Message-State: AFuF++n7BLoS0Z5QUrry/TbKmIwF7nItWwf/pRatQkdjGlxneWcsIjtq
	6PsJZljDu3A3+I3HxzsBDCh4VGFgEXJNn4LaMJWi59VwEzyjQXbpJtYlGsCuH6J+JJ4xmGZQxqg
	yn6vssWkkJGmqpn7/edBc5x+NEXKvv9w=
X-Received: by 2002:a17:907:9303:b0:c2d:be57:f73a with SMTP id
 a640c23a62f3a-c3169fcb966mr205695166b.13.1791299950007; Tue, 06 Oct 2026
 08:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005203555.3552816-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <asQUKTOiEn6GB5sy@zx2c4.com> <asSo7kefA3IQFpQp@zx2c4.com> <fbeae2e157e335504157b6a6683fb505@oss.cyber.gouv.fr>
In-Reply-To: <fbeae2e157e335504157b6a6683fb505@oss.cyber.gouv.fr>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Oct 2026 17:18:58 +0200
X-Gmail-Original-Message-ID: <CAHmME9pgEFwtj2sCvJTcYHSo1P8PG5Kq3d69Qse6FZ2NbN9=mw@mail.gmail.com>
X-Gm-Features: AclHuK-mqDh7kqqib3p4GuIAljgLgEirJ4KIrhrG3xAzndDfPZnbYHtxqYInJtE
Message-ID: <CAHmME9pgEFwtj2sCvJTcYHSo1P8PG5Kq3d69Qse6FZ2NbN9=mw@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: noise: reject responses for replaced initiations
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <jeremy.jean@oss.cyber.gouv.fr>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=A9r=C3=A9my,

On Tue, Oct 6, 2026 at 2:40=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<jeremy.jean@oss.cyber.gouv.fr> wrote:
> Thanks for your quick reply. Sorry that I could not answer in time.
> Your analysis is indeed the scenario that I had in mind, yet, the
> second thread does not really have to block, I'd say it can just
> be slow?

That's right.

> As for real world feasibility and impacts, I must admit that
> I have no idea.

I've been unable to synthetically reproduce this -- even with adding
sleeps and additional synchronization primitives to the code to force
it. But it does seem like a real issue in theory. So thanks for the
patch. I'll add some detail to the commit message, and get this
upstream and backported and such.

Jason
