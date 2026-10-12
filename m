Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3664446820
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790479; cv=pass; b=ZxHh5KTEVJACfojQyAsDcKrL7gGoGlK3bJyCgi9qPQcy6u+9y+giTO7V/Ktf3V63xeFtB+mJbXdoXfICWGWI2gNbg1XE9GCm1D0hFKN3qQzRMsasxw/N9HKjCHRocH8h9WnxSecj/urNJ6ziHQ3MibjZdoFwWr2u7NRctS00eZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790479; c=relaxed/simple;
	bh=m+sirvTM/L3rle4xogAWTC5Y7GwKub9KOdjkmZ6bh3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+4btWn16NCVgbm+G+7c0urobPSykxXNJvl4lPMFpMHG9dSFHlRNii4tV2kedysHwukYEKD7TuzfWtQ2+kkJXoRwegzkMXIrBMyWkdAwEURXn4NZKruLmTXheBN0QRnkDcUMHvFkEvdo8B9lUIWCoVIqvpSQdRsdos+qEVcl0Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=UB3xo/Ei; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="UB3xo/Ei"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8acda240937so9757637b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791790474; cv=none;
        d=google.com; s=arc-20260327;
        b=Be4l9yntRXjtdfmJmYzvqvJLc3qayDhJRZ0WTxo884YG4YRolIQ8go5/f9X/qtHWqA
         FPXXOOkCu+beQyKfxjCieRdE1cyZE4HWNwq7rSDETVHPQSdTXjw8ttOLSnTHUJncWMHf
         go6qKGoO6l91fQySTOptW5gqjCudabLyVwUztavZbfud3aCSShjLjRBsO1aPVycxFVp1
         tjx5lcrUbOuLrShIcXXgvXhAl3tM9YlDXkp2WvR/NntH5RdbpM26McvBhY66N+YZdlBf
         ZzS1LY5lLd5wQOLhbo6msCVB5f+oiP9Xj+13GpSjNXvCsJEqhVJt3+XOXMJDxCGM+a/2
         otbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m+sirvTM/L3rle4xogAWTC5Y7GwKub9KOdjkmZ6bh3o=;
        fh=j+DKsS8Crr+w2KJOL94CN1sBnk7BSd4eK0EOu7BhKWQ=;
        b=ic0yy47VdmQEoEWlIaQMueMdZzAkeCaH+NisO/OXSk3AfVdx6f3/u0wHTCurI/VjBI
         JOCMHQw0iFASlmqUd7TrBiQkVFVRlXtaIWiOQ75ABGSK8Vf9KfgKf8S6qSkKPhMRSVPg
         szF1tpj/GUIQ6YF2RbL2ipO0hlUBjLOH/DlmUZQyvDTsWMKIpri42Ymb6ijlfSy/kAdP
         /dFLOkl9sczBtZudYSMGVpKA54kkH8bBwybbGXrG140FAJf8fLk1dT0gcwt9Q/1cJ3MB
         e8vcJP4AfPfJghmQS1/7I8ARBqN9E+dCBzxVx4cY2xx+Nfv7l87mLx2duMoVzJ4aNc0n
         C4dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1791790474; x=1792395274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m+sirvTM/L3rle4xogAWTC5Y7GwKub9KOdjkmZ6bh3o=;
        b=UB3xo/EiyGUFh3xCxrTBpMRZqpRu4BvsRigNlJiROsOSvjddvw16Dn8VRSjYEabdu4
         tAP+Vgh8A+J4eJjgJ8ZxZwDqbKJq8nNmpJu8FojHXwznkiQBFU47dFmYz27ufswxfBJo
         r31C0PhlcpOZCTbUMVEbozAn7uafK/GIv6ICk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790474; x=1792395274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+sirvTM/L3rle4xogAWTC5Y7GwKub9KOdjkmZ6bh3o=;
        b=St1e6FknaBB1yUQEhkxUT5N5FJTxOP31FfTgl6vfteTkU3Oxk56FcjxjAHlmkhhr0T
         Tr4ik2iXY8tObWILB+hGCUb4SWea1JfJRlQYYAblSFgbn1lf775XMuaWHqAy72YRn6sF
         UzpYlrNEAt8b4VXyqjcU7mLa6OwZjqkDb0DtvPWSktyBaFgRsy09ORz+3iBFrTzvgky3
         GwdJ2+N1ioQSYiNNOItFS03aVDqZeYLxxoJKbqVy2hT7QawGdgL60VoWG36BW+Ot4wfd
         I1RnTQCjPqK+qko0SrQFqLyPtkW/RSEKSDcxbI8jAIJIjlEqQulxSmSAuSec1IfbAGwD
         8dIg==
X-Forwarded-Encrypted: i=1; AKwUvByQi76MCAIqyA9GEU7FwSH+5yAWgKckkZRrTyHcKYtbXiyMe5WO0AJIkHSBeJMWL08vxq3QknVJlLpytLY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqvFn/It8S9AqT2H8WiTjwPjSQVFtoMx5X/7MQHcIErTHH15Uq
	z8IZsv77HUtN9Dad0+KrVNUvyBovMjbbLL/VkEgcKuzbXIe/gpUcqMJ5o9+YE4C87BriFbN2IDC
	KBFrm6FInjEiwq+vc5IWoDM09z5vOU/OKlWLGDe4UkQ==
X-Gm-Gg: AYBFou1p7fddYfcffIgIurjIuqkA7keF3HQLupghXyl/16Rlcx54/ojcmLRTaIvq+c6
	utoj2s/oh/IBg1DiXJbCOR3Jaxcpwl0yh6t8cE6j02IqqAs0blQw/yqsQeKAvAQo3IGUXwV51Wm
	RqxExVPFdsJp3w/JJO45LbzvMROsLQvDfpAIOdxFTsRiInR8xhDLgRr51yoC5dlUItJ2QBb0ta7
	GsoLfwbPGzWCgyA75+orsGy+UxoEu/zuSSrjlXOpZ3pnPV5CEwDjvHOGrr3gPLoS/Jnoc+21ACK
	miOeAME+5ORE+IYbjwsbdlGIg+V2PIZjF9QBSWRmNgqaMgXGWrt5lly9aw==
X-Received: by 2002:a05:690c:9e:b0:8a8:6c5f:5b32 with SMTP id
 00721157ae682-8b07edd414amr24425697b3.52.1791790474340; Mon, 12 Oct 2026
 00:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007052914.888956-1-daniel@thingy.jp> <20261007052914.888956-3-daniel@thingy.jp>
 <0d1cbffe-812f-4882-a315-7ad41a3fe1a7@t-8ch.de>
In-Reply-To: <0d1cbffe-812f-4882-a315-7ad41a3fe1a7@t-8ch.de>
From: Daniel Palmer <daniel@thingy.jp>
Date: Mon, 12 Oct 2026 16:34:20 +0900
X-Gm-Features: AclHuK8crvo_9_fsRTvAPqEkWy7kHeqnL4RvnKvtMgdGvwGxN_nOCarvi7e-03I
Message-ID: <CAFr9PXnF7oNkKgaz+aF981C9Z9TXSLmfq_T4RQcYomTo1dk+Gw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests/nolibc: Add test for dirfd()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, 7 Oct 2026 at 17:09, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> w=
rote:
> In general the series looks good. I have some minor requests,
> but can also implement these myself if you prefer.
> Also I'd like to push the patches into the next development cycles.

I'll do the fixes and send a v3. Also not in a hurry. :)

Cheers,

Daniel
