Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378847;
	b=IDXHrcGN+0uO+JDE1l1maFbsQWrMfjagx9iweYnK9yEmqkYQ8YZQfWnjpMqbhxs75h9k
	 4BMtMDIehAKmANcXnwTlhsvvx7B06683v7CPr1OtD2g138UQVzLn+sdaCgYxlLrZg1cf9
	 a4+ITympJ7MUzkVBIoEkxssyg1e3SkQFniXKUDWUgT6wR26U045MHBp3CHBk0fsjJIJyW
	 41RLDU9qWRg+DEdDyAAF3m0ZvVA0uOyGNI3NNLSu9iLB3SlOL+eQs7zwRUTzo4mRTiWQD
	 wCYAB/6zx/P9v7na7Il3A1O1s4KtujkO7ihK2A91nAofTOUJvnfqg1IENJb2XsXIhYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378847;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Wf/iTe9pX4L/jZu7Xph7OgCfAvGN68jDjp1bp7bfRVM=;
	b=bcWD6wAmkfL6WQpP+Tyo6XpD8JwKGrtAp7vJe8m0LO8kSotDXtawWWyIJqScurgyW20L
	 dWRFODt5oY0dqQfV7jaPprr0n50ZBgiGruLD03sLKo9uA3M2B74CllBEXFhdUr7Os+2Pm
	 bWpbFaI4G8FHl4IrPKPd+6Ebw6q9cGLg6nrKHzgl/P25AzJ6cpI/raBmVgEPACejATlU4
	 3liS/ya3C7bylEgHsOzTuST3Sgl8HEtV1btO59zZk7zoc/Y94+UEGMpOv0HkuB9aFPysl
	 GLC0ohq3YVzCqpyzOcE0UoWPHZlhrlFuwU+9SWyzw4ChHow+XVd/lmR2AyOrlIwiuNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QLoCwMfp;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A172A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A172A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QLoCwMfp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794378844; x=1794638044;
	bh=Wf/iTe9pX4L/jZu7Xph7OgCfAvGN68jDjp1bp7bfRVM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QLoCwMfpM9LRKb7MQE1nR0jsr3FKwsjAJJkDEmpXH44Yp5YJOABhzzW3CHtCNEaxr
	 M2875Gh7Sx4tQAAOZU1FrTb+IrXDBPLfWD/z7wdiYxd/uzq8cFTdfEC66ujV7SKLc2
	 SJqxOLHWIvRDPxXIY07N8wJOwHOoscmtuqBkmN5Kk/jlgO7Hz11raFiVWXxncDDP/g
	 gUHDa88w3i4fJRcRem6mbb3Q+N1EUfm8GZW2ZVn4WX1wnySRlcV/OYDN0if3i0GOHx
	 2wTCzKge9lrmtZfNXFtP1a5Y71fJBWIwth8rhIhAa6yV22ZLXgDigU+0uLJcTjTN5R
	 bX3p7Kujc/RWA==
Date: Wed, 11 Nov 2026 06:33:57 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] platform/x86: int3472: Map the VD55G0 supplies to "vddio" and "vana"
Message-ID: <20261111063351.96951-1-lsa.uz@pm.me>
In-Reply-To: <20261110195454.48176-4-lsa.uz@pm.me>
References: <20261110195454.48176-1-lsa.uz@pm.me> <20261110195454.48176-4-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 6879e178a9ed61d0489c95e0d779dae40845883f
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

This patch is on v7.4-rc1. On media-committers next it needs a change:
Hans's series, applied there on 11-10, renames type 0x10 to
INT3472_GPIO_TYPE_AVDD, and INT3472_GPIO_TYPE_DOVDD is now 0x0f:
https://lore.kernel.org/all/20261020142243.25072-1-johannes.goede@oss.qualc=
omm.com/

The patch still applies and builds there, but its "vana" entry then
matches 0x0f. Tested on the Surface Pro 11 with int3472 from next: as
posted, the sensor's 0x10 line becomes "avdd", vana is a dummy, and
probe fails with -121. With the entry on INT3472_GPIO_TYPE_AVDD, the
sensor gets vana and vddio, binds and streams.

v5 will be on next with that change, and its commit message will simply
say that int3472 calls type 0x10 AVDD.

