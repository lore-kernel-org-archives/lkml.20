Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253763;
	b=sSA1KgCcfYifvnsykbPprG3pNRB8FDnTtvsJaIJstFuBiZqVQdfe3jJkDjDPPsDDzbKB
	 g2jXGr33lQYu5laY0sar+POWSEz/HERbMHs62a7KgvU3pHmS7+nUUu7GOJ9hsHFYY3xDT
	 InmmX+rIFOBQr7HYBRn18fbLHTj3SRD8R9oP1CQNxr2IK7Pto+i17N9Twdyq5tWfqbtRA
	 FhuKFqXi6x9s1NQYBCrBDYX8k35xAmjLLcVtiysFTQDCGzjIjmXnFuykw2z0WQoDUvBPs
	 fOWV7jaZeHuBZW+prdjfGC6D1Nc3oix6NRy9k8iuqhkl+mXNunDs3Z5HIDyF0LS9Z+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253763;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L3HsooW/EIIMAsINS0QppjFHUn5lrBOiUpPyRUrTxV0=;
	b=ziKu8St4ib2YeXMwTYrFqyKO/KsRl3VujjID576oXepgDKUTVv96KA0yPQFqk9qN4Jrg
	 AlALvZmUP+0hKX3GLiXfkecrngrWxBc+bqmdwaLjcttofq82N6oRvew5mCnv0HlZYiZ0V
	 iJdVRydFytQkS25KyP+kBG5AFSeCH00mCEHzI5NnykMYzuDLsUOdzimtiC/ds7z54QncG
	 xgGLPe3WS7zaaAcUxbMU/E8SPR5gp40lY4NlN3fuakeIj9LvIiMDvTUDidNJuDkwy1JSX
	 civr0+YW+qm12zmeMmCeXxa+54AJDXKc8imtQSfGOBpiPqgdA4aFTcm+gbpX04PZu7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WM7nOAW5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A4606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WM7nOAW5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2198A1F008A2;
	Mon,  9 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794253762;
	bh=L3HsooW/EIIMAsINS0QppjFHUn5lrBOiUpPyRUrTxV0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WM7nOAW5ng75eXmFi0BAr3BUr/Q86A/ws+n/uEaITrm+l0UZ0+BK2n/8bYx6X+Dna
	 LE0a5nuzEh6uz8bBsxewSyhI4v5QrNrNNlGoNJ7EGY5KtiKkbtuTikqPFgpoPEZVQg
	 d5lLNmk70CXMNTuyplKAT9+XidNRZAN8UowbjBBca5qBUCvBIdOGtbZfN35AJzUhMR
	 778tjeiissrIU0vbx2gmsLQTaBtIoD3gmusTJQq/x/Rk3lfvrcbTZ2IVESWhtZfo7q
	 u2Jt6VgyYM0+Qd3ZQPwRPJqggGqU6I9HB1YLUt57xH4SgznoGOz9e1uNzGGr1RSPmT
	 Sbuh/ARGi8haA==
From: Thomas Gleixner <tglx@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar
 <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Subject: Re: [PATCH 3/3] alarmtimer: Return early if try_module_get() fails
In-Reply-To: <20261102-alarmtimer-locking-v1-3-3c79a698aeae@weissschuh.net>
References: <20261102-alarmtimer-locking-v1-0-3c79a698aeae@weissschuh.net>
 <20261102-alarmtimer-locking-v1-3-3c79a698aeae@weissschuh.net>
Date: Mon, 09 Nov 2026 20:49:19 +0100
Message-ID: <878q31vl8g.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02 2026 at 06:11, Thomas Wei=C3=9Fschuh wrote:
> @@ -94,17 +93,16 @@ static int alarmtimer_rtc_add_device(struct device *d=
ev)
>=20=20
>  	device_init_wakeup(&pdev->dev, true);

The wakeup functionality is enabled _before_ the last condition
try_module_get() is evaluated. That doesn't make any sense.

