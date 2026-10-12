Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09787404BE3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813773; cv=none; b=VU7e0oakyzHFydHpd2SYX5kT9L3X1O9ZujcM31SvQH0OFPcOZz9+h1wOvxTHSRQHGkggUlQq5NcKilJGcwGYKiSfGc7LTYpHqix19M4NedrlTyHN3iuHkoxjlukTA86iw0Mrqg8V2lRi2GEpT0SA1Rw9ArJoTJjGPEQoG1STFfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813773; c=relaxed/simple;
	bh=IXy9DdQ8dX8X4dJokEbVSO5P1A9Fal8nKRSa4Y5lE9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KHiL358iinY2jy/cK0aqvoHVTLlIjbR5a8bASqJS8wZIjp96bnanKe7YsAXtyGwwZxqapkeblqrbRW3YdThE2J2h9TtsDX7kGXhjyOSFLH5vpeVZBx9K01gLu0TMkW7ytDrcgjD2DA+MNOWEEVqtBKvB1RHQXG/PMWSQLx0+W1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KM/FmtFl; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KM/FmtFl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62D781A11E9;
	Mon, 12 Oct 2026 14:02:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3479E601A6;
	Mon, 12 Oct 2026 14:02:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D18D011D70B5E;
	Mon, 12 Oct 2026 16:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791813767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IXy9DdQ8dX8X4dJokEbVSO5P1A9Fal8nKRSa4Y5lE9I=;
	b=KM/FmtFlYBFEQqvbbDX3VG/mjniVjEZFj6uNIL+xYX8bIDNYPHYoL8WwARFbHSC0/z0VGp
	hGGJlw5HoMcpfJCsTzgu48qJK+8yjkey8feHZMIYfaWVc3e8Oy7u05ZlwvwZlAlvS9wdpr
	81A9vSYK1POyH4v2nU01duGB/6jjVF1KV8wB/4wn4Tl7E6YEY6AyT5Le9LSt5aVwt+vVO4
	+vF4i6a6H8NunybHRRV8oFPMmGIg2Tj+8/xT40TP/WA5fXWXx21Y92vm7dE40eOUj+Apr/
	ZzV5vmnIZeM0yQXPcUU+Aa8qzpbUImDzupcYoBraVRzd1a7B3tTgSL2NjXveRA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton <paulburton@kernel.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Chao-ying Fu <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 0/5] MIPS: GIC clocksource/irqchip improvements and fixes for
 multi-cluster systems
Date: Mon, 12 Oct 2026 16:02:41 +0200
Message-ID: <Phq99rR9S2iy7CfTiYmYpQ@bootlin.com>
In-Reply-To: <4619ced8-b385-42e6-9c9e-0745a68c62c7@oss.qualcomm.com>
References:
 <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
 <4619ced8-b385-42e6-9c9e-0745a68c62c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Friday, 2 October 2026 at 12:02:29 CEST, Daniel Lezcano wrote:
> On 9/29/26 14:14, Beno=C3=AEt Monin wrote:
>=20
> [ ... ]
>=20
> > Although I am posting this as a single series since the patches
> > are all related to the GIC, the changes to the irqchip driver and
> > to the clocksource driver are independent from each other and can be
> > merged in different trees. I can split the series in two if it helps
> > reviewing/merging.
> >=20
> > Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> > ---
> Applied, patch 4 & 5
>=20
Thanks for the merge, Daniel!

Any takers for the first 3 patches to the GIC irqchip driver?

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



