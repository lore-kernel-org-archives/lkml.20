Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392515;
	b=oiSPbsSHCvDsdjmAu0EHsADIv10hee8B4QbI2YAJFZBaMpbt+i8UR3fGl7s0motRHkdm
	 DD5ponKwki34SfdFlzrtFfWN/HqJFSw22mm5JYyJhUr/7OuKYPuQqiXjd2dZdBCKiJOKR
	 eJa9+BP9n/7LKllvhGWtbcFcUQWnTDs0PG71/TQrv+1N36rRwlCyGVUue8qNay5k2ZG5t
	 2XboPQz5CAF2JriUdpYe4XlUSoYuiZJ1GJnZ46PT99XFpRSq7ME9gQ/KIeESXEdI3qlyC
	 NnJCgyNcqJL9SzU9IfXG+wx8WecsfeDFMXoToH7Yoz13r6n3wKe689OD6TOi5u5hK8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392515;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=IHAJ9cUkaGN2FveJz7xOzh7H5WecsPhTKQF1RWuJHWA=;
	b=4NrFO+xlTROdKS5SqoqMDYqyoXKLdqge/UuBaxkjLH4278hcAOyJlukDG7vWeN6eSGVz
	 Baw41xKqgQMq6MQp4YAY5vZIJOZDlyFLRN/aRUlYxsAzYOcPHrngJfX766/iQtUpv6eEL
	 hqOtvqWRxMl198Hb4dAZmtRJp6oW1FNGYJ4wdZDEgKqrnn1I2BBdvNSgeDtHBQcoKQ7E0
	 QZz3dL8xBAm1PQm9RdypAOzyauAQyeJQ3gXn146c1fMqAJ+zts0g495lfI8zb8cHIz5x5
	 5i0eNlpXaAX2WqSRCDXrgZUtrDyc10ZR4TikLve5QqG57H+Bd79pu6IeFDz9NSXs5oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.ch;
	spf=pass smtp.mailfrom=protonmail.ch;
	dkim=pass header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=o8LQq9ub;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A84606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A84606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=o8LQq9ub
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1794392512; x=1794651712;
	bh=IHAJ9cUkaGN2FveJz7xOzh7H5WecsPhTKQF1RWuJHWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=o8LQq9ubpri/Y2Qjv1C1uK9ykuOfToXwAtssQ+VDqhP7mmgXzJwKy+DvDeHFS+42e
	 lIhP5uRzFZ61cl07qEbB2CmXBrHLWH7XVXyeQkokuwghPfxOzSH4WA0kBu1oJQygGK
	 whfFQmKBmz4bhmS9jeMaOr2Fuoe8MTTYOQUPqdYkX4DVw5FIC2kXL1XL0I4qCu+EpR
	 oP9lhE+uyWtukJBQA9uqUV7k3MaDX4+qFabOlxwC6EJVOOmOjlKuC0qPZ4Zq/b2kMI
	 5v3eAT7l+AwHtzkYpW3HRrhJCIEseLVgTrq/+wvv+rtGovzCKJ+SVl8FltuWf9Z0LF
	 JWZY0Txhrqkgw==
Date: Wed, 11 Nov 2026 10:21:48 +0000
To: Chen-Yu Tsai <wenst@chromium.org>
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for domain creation
Message-ID: <20261111102143.16afb567@ben-desktop>
In-Reply-To: <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
References: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch> <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: 269b96da12c9779b1ea33301a5cd0b8c5acfc692
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

Hi Chen-Yu,

Thanks for the review!

This v2 was sent by accident while I was testing my mail setup, which
is why the changelog was left unfilled. My follow-up saying so is still
stuck in the moderation queue on the mailing lists.

The patch itself is identical to v1, so I assume v2 can be applied
as-is with your tag. If a v3 is needed, I'll carry your tag over.

Best regards,
Ben Grisdale

