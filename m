Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326689;
	b=MCAskGm7Kwx8QQYc6rzGr7gS4srtF7QBiUJ9aeysLSkNf7X28hZ8QFvJrmn+TGrRwWyt
	 j6mmoNp3gZ+sWDhpf+5kQgsLzpYaZ8HG71vogrvdWb/9DIXQgzWWTZxEzhwKxqjxmfIbX
	 fat4KAs3XCiEMjfezEE1MfNbC8SFuWtGy+Q+u/qy6+2vhQpDiq8ADiaJQ8tsOj1jvbeV4
	 WmXrsdX8ISW6vSRCSnNmDxtXhrvsByNxYT9MQUDEdRBlTYwjmX6iUsWHMGULlQs8oZWZw
	 eSDbMgVyYvO3kNLXp+c1lP2q30DoiKHZ8UGRYl+aKXzZS2zU+jujfBBHIv6/YokeZsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=2ZJ90WMhfR0YfvdBTSjmWuZ2Dnb3Sle3TRFQ/lQ57LQ=;
	b=JXH7tGB4NSe6eLfo/3YUckYj18JpIkWwk8DyoXWZQi8jOByIaAsLDRiIbUydyy3zcFyk
	 9mQalv/Yp5y3M7E3kkT0rN4J7X3EsJqvxtzYRdM3PASuYsY9whij3gdXI2PdAFgel1H2M
	 /zeKwMj1Zw8x67Je38silBuOGMjsAWQ2zbRt9iUx3ar6TUnL2Ul/139E9Q6BfPsbHt7B2
	 NokoaygYt8Rlo7Jc27HZtftJdopsCfa4v/RVZDrri0hFwE8tCOLDx+xOubBwn9EEcHgTV
	 yj3hv8SYMhOASxLi2BGsv+43llHLEN+WZsgLZNE2oESabM2YDe2VuVGBtdMkQ0hdAWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGIZihDX;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F19E606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F19E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGIZihDX
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so83266266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326688; x=1794931488; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ZJ90WMhfR0YfvdBTSjmWuZ2Dnb3Sle3TRFQ/lQ57LQ=;
        b=LGIZihDXw15kVXbJxOKh0GT0iSh5cswwx2O6dja/7t0cDORUIMbtApIblgJVlt/vep
         ZbhaLknz9KMmSm9phjQPzppVeYDTkgj9m0rFUyhHNRzdP5lNMAxF6ZEpeA6pZp6WCQ7v
         uFZOu6Mw61qBAmxILQo8iVY+p7N53H5LQQjEsO2/46tr+EIgZs7MeKTTBHfNPDKyY1sT
         1wNbYdutMvB1ocj0mKs/F6Fo5bbk51WGdTk+OKpBOP+GdZqacryozM/cBr3AKKG2RjXY
         wY4PgVNJltWoYMrzXDWK+zlCvLwC+EVtUDk+CjFH6bD7C7kbvjtXXfAHDSsok5Iik81z
         tQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326688; x=1794931488;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZJ90WMhfR0YfvdBTSjmWuZ2Dnb3Sle3TRFQ/lQ57LQ=;
        b=VCJPk7Tk1dJoty8VBcNMgK/wsaLQ+n+QGWZ3KlWYuRxi8dgzNMGfJ2/Z0j2rbS1vWj
         vVJ1DyNyd3Bb6QAmIhGxQlkEeByGXDLM1UKg+NXAZkJdD3jSGOuIYnpJgIFYau6w7sdt
         RUdgd/RTeE5PGeuWH5eOZqRPkptkAOWGkbTKZx4KfByUHO7m5F/T9w+uBLqRIRswJdkp
         m+LxCoBOsTeqFW2IWdEnPYAu7N9UwFLCSADGk7xo/1bVDzhoyi29L5U+I29Nx3EXsW63
         Z6+OLlWVsEtBYb/ZLVOqFKJPssmZEIwQ/RJsl6osRmbVeauJVHZByABhU8AdI9NI4c/1
         FYiQ==
X-Forwarded-Encrypted: i=1; AL+hErF6VuP6X1CJMEfMLI/e7PgY6sdDbvKar7ByKv89RNwdTdXqG+4b/a5xGRwOYc73kd3RuhbkSdhC+K/uaqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ufQyUqUgw3/O3SdjlRlZz3F+dzkhlYCCkkQbHp4mxvaeruSMd
	BUq369ZFO3xDnZc99D55KnFYwfXfoNtGURU+0LA0UNvcvYC6PkhSognI
X-Gm-Gg: AYBFou1ayi46XdvJSyXhUzsTimZR9qfeo2t2dVcWdP7V6rekYCDSq6bJNAf5uWxLmV6
	d250MSvz+FPad7TE123xhKN94AhEiCCt2vOfP4HwtE+3V9hyhr8p/zuF8G9XFTzgIBLbEkA4xUK
	B8vnkyCsk1ZTnLcrZlqbxC6hODi6LqpGRBtysWr2sh6yUOvfHTKmYlByds5jIAYSGC3rT2ht+jq
	EOEeEjQD79IZpg+VDDyS2WZgzmtVYurmLIpp08OVVpz5LTMTwM5YGH3dt+7Mc7LJVAg5QB4UUgA
	cVWk6X7z7eNpdYn3YfyaTDCsy4gdBpG/8NulbA6fVsdwkuhhqjdDCljDqZJjbPZoTYFlKZLtvzc
	cc3cOTV93iUNsDin+8+JgBca2oDY6D2gOzxfHnKfTrriduyYQq+eDHRAqzzK8TO7gWV9usO1l5Z
	/KXTtfR6inVJNQJ7L7rx567BekXISNFme7fHo/A0QUBkJsFHLx/ITNQcinBcXhu/iR0+8xfTDVu
	2AEgb7cUWqdm9FXYdoUNv18SnFJN0mnacilI0A0tkTWODMStbXhGvfrb+yRy9rWBn0yDcc7hY6+
	PDjKVaWpNNffD9elUaZVUozaKbwZ9xoUE5bw9cFtGtQsI7Goys0vJjMZyDJSWlBQ0dOW3dsRbK0
	4eMMVwxOfqikCa01cq2qO+vxIBpTAlEwCwOrBfHPuPNb+sSRvsUl8jcEaSXPGx0L+zn6o8KbZVI
	BkiY6/OG7oXM2WccwTv2FcGZuMf6NhcbTXhAgIBmcKeASaKVohLvUxzZcfISdiu738prDJ1pfVk
	BTFyooL8BPiTK7bPxpsNvTcZfvkOhTpQEqBPNLx/wi67GTMWHD68Zk1JyCskyc=
X-Received: by 2002:a17:907:6d01:b0:c49:8f1e:af0a with SMTP id a640c23a62f3a-c50491bd4d4mr262123366b.7.1794326687814;
        Tue, 10 Nov 2026 08:04:47 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a643f12sm127127266b.62.2026.11.10.08.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:04:47 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 aiyengar1990@gmail.com
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 0/2] iommu/sun50i: Don't report TLB prefetch walks as page faults
Date: Tue, 10 Nov 2026 17:04:46 +0100
Message-ID: <XuGVSzNrS7KQLWfGI0rB-w@gmail.com>
In-Reply-To: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com>
References: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 10. november 2026 ob 07:05:16 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> On an H616 with a display scanning out, the IOMMU reports page faults
> with master -1 at the IOVA right after the end of the framebuffer: once
> at the first fbcon frame, and then once per frame for a while after
> each TLB flush, e.g. while a video decoder frees its buffers. They are
> failed walks of the TLB prefetcher, which the hardware flags with bit 31
> of the page table interrupt registers and no master bit. Patch 1 stops
> reporting them. Patch 2 makes the remaining fault messages say which
> walk failed and what the interrupt register held.
>=20
> Tested on an Orange Pi Zero2 (H616) with HDMI forced on at 1024x768 and
> three 4K H.264 decodes through cedrus, on 7.3 kernels with and without
> the patches:
> - without: 214 "Page fault ... (master -1, dir rd)" lines;
> - with: none, no "Page fault" line at all, and no decode errors or
>   timeouts.
> Since the patched kernel prints every fault that is not a masterless
> prefetch walk, this also shows that the hardware sets bit 31 for these
> walks.

=46irst off, display engine isn't in merged yet. Second, I don't observe any
such issues with my wip H616 code.

I think it's best to wait until driver is merged and can be retested and
merged then, if needed.

Best regards,
Jernej

>=20
> These patches were developed with Claude (Anthropic) as a coding
> assistant. It investigated the problem and wrote the code and the commit
> messages; I reviewed them, and they were tested on an Orange Pi Zero2
> (H616) as described above.
>=20
> ---
> Arun Iyengar (2):
>       iommu/sun50i: Don't report TLB prefetches of unmapped pages as faul=
ts
>       iommu/sun50i: Print the page table level and status of a fault
>=20
>  drivers/iommu/sun50i-iommu.c | 50 ++++++++++++++++++++++++++++++++++----=
=2D-----
>  1 file changed, 39 insertions(+), 11 deletions(-)
> ---
> base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> change-id: 20261110-sun50i-iommu-prefetch-85cc9ecff559
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20
>=20
>=20




