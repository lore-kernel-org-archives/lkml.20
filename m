Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817292;
	b=qWf++26exmlQMg7J6THYZx9LhUWZD9RDF4OgX77n++kI4Luv++0MNBOObNSQzyEg/GE7
	 akCX3d1IbWfBLMWNKG8D8J+AoE6qsvyyqllQhEjIbZBD1+0XQaAIcKjAsv+O+rEGmuEgw
	 ydaAirBSSNTGZ6EdfEV6sqRB/QKttk0+yCRRXh2kPjRoj56ihbF1/9hOq7WEyluUMd9oA
	 F+OBlk+ywG0gfbM4n3V7f9kJjwt+p0fgVi7TNYyBH9tMSCEXYl2bThp3tuPQJQ7CuKoC/
	 kHrLQrWpicVJ8NC663iJpxV9vIf7ItMEbL1pd+kcBDxlx3pAY2bNQaqZzNQB+w9Rs0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
	b=pvx0/pmFsxE6FZPAbvRD0kYH86jCIqHSp+SyGR8R2d6BxTaKUR9PGrcpMm3PGBWZaod/
	 HW//k2dun8av0iKi2ttvLOEYsDeFmU/+AAApgUqRWKZDWkHeHdgyyuc3FFyd2jCpB3smY
	 0CgM8sYzs7wDQs/aP231GM7FGnzfdqzxRVkTvK3LIHx9190UyCBvqNikg3SaDYxMb0KOU
	 pa2loSbXRyF0CL/K3Jiipu0nXpY1PYVuAvk9OC4jjuBBlRa1pWzKO0/AgeouN0kdqjVcC
	 J2fKiv5c0ZDkI4dCNzswmiPXxJDCr8qwxjYL9m2Z9Oh5BGmMkd9nh7xxfHjyBfQ+dkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egi7ts2M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035E606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7035E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egi7ts2M
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67921b515a7so1052289d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817291; cv=none;
        d=google.com; s=arc-20260327;
        b=hFYArf9s04J4OFRWZZ/QLRPAt8J4BqNRw1o39mGu66M3Uy4UDqQy3LXlgcqzX2lMJJ
         JT1ZZsFe2bT9HqPS9OXEuRYxcOaQS1lu3gO3H6iGoZ1Z/18PS0AAjDFm3bm3Ahfbr1TX
         S3EOht7uVHYGJucCBKUBvxpVfxJn6sc9Id6TU5RuxDoJuWiZioa0YxWzVmTXOqoZTWx0
         B/Fg9cES2UmMyeyvZ3diQe5es+GRFDRjhZg8hNqyDeLbpr/XBfTJ8j2mh7kON0NYBADb
         si2D6KWZEiJktCt1PxEJ/RctMcSFCxB5kg80sbohNwgJNxU1j7Qv2PFy2cacWKC34Brn
         dHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        fh=p0Uw09IU1mqXtML3XyMqFrPLGxoXaRJ7masM8iOImoE=;
        b=YbMKFJV4Hwdr3dP1KPNCj6btbbCgHS3izNqKa6lcRiy8YUzhZbShl2CmxpdlLrdEYJ
         fTj+oPdQkS6OjZyrrUuNfXpev+oyFqLHRyv/s80sN8xuptxeurMw94zTOLcmDRNM86Ot
         UlbDpb1+eEatkGft+Gocy+gpjDkHGtbRbc6xF2IeZdjcwcl4C9ff0CXCCyIpItNbsnGn
         duCRYckZOArH4G/IuLNlTPYpY3fBi0/yhycmsEgibcTz6zEAWrCfKU9yABggKhdMGeau
         Pz77O4wPGksTtuMKTZ5C9DqnWzhvMB49q2z/llqvT7u9nCGHeEU9aCtbanEqFKSxWaZG
         WTnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817291; x=1794422091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        b=Egi7ts2Mm5gYef6G6YrcIhLyeLQ0FcMfihrNrb07UIdKTJ8eHPfv9t3z7oclQi5Eor
         JSnv85OEUb3UDDxa8Ts2HhVws1vB3MJuLKjr1TuIMVedDN+7RisPqncEd84019kEFPZL
         LEXXaJcJ9ILG3MgYK/UByVdk5TSnGZwYM/q5wbGvxIwYEF2YoWiJsDH8gwxP4pUghzk2
         3GIf/00Byib45vvrPdb/UeN6BSrlIZAlrevATqcPqZ/Yfmj0X3xuY7Z/vVyrDw1Yy/Fm
         q/kVp3HQGJObFR/Oykctms0Nh/ks3mKkikb8V6orSm02Aj18FB0N//ExLe2PcpH83AbQ
         CzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817291; x=1794422091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        b=1qbJQvajz0As0WcNpYR3lq9WyszbySvZsgCplbmp44QkC+1Si40D7S5Lyur92YMcqZ
         wBPUJyCeaueZmMz65+5DNPcpCNRjJ9QIG7W2TEhKVeuDoXwaoRfbvVttEu8cSbE+msKb
         Y8SC5Jsrq8pcjk4Roi573+fr4T7Q4SwBn9ygNAZHWDvA1n7ifVh32g2+XUnhDJbblBDE
         l8Ap5awpCcNXhUKt+JdTnZc6J1SWjm4NWQoUulwpoIkmGsi9ddNLzD++BwCJ6HV51VFh
         QxNZxtgh7IjUt1mMR1elv4GlZPlCMF78fq/p1aNaaqKqEDe8F6oi5vSdglJa8CkAn+eC
         bUEg==
X-Forwarded-Encrypted: i=1; AKwUvBwaIPp4dWKVbV6WvmoIePyKJmzOFXDAeuW09UMqDhy4aq89t735VrLmcfVQA9DAsrqo2SpoplQwmItfsCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wyA/v1Zr14QDrK2fAZ76f8PMr2hvyiI6W12f+zn5kKkuF49CG
	9dZPazfiqMa2InmdIKv9h6wN0vmptMky/1abbkaDQ1ZEoSe056SrL5tFeNQNEQd/rK4qW4af9in
	3Ct9ZzCjvRkZ6IXoYNwYZowpIlO0I+7I=
X-Gm-Gg: AYBFou3QXzPa7C5wJnhRIjUyTXZXDII6MnK7OgfuAjDFNyhFc7yQvO1Tz2UmkYr13J7
	JkqLUXE3rbUb205kLRnWbBRTNj1K4IS/x2Mjf3Pcv/PFUZIYyfNbd5EJ6iQ+g+WWmsReAYCUh7C
	aNifMyUXglhTV4j5RntBYFSzcZUWaB6tRchbS7r7N5x4j1SNGetmdCNJ/fbY8nDC+RoJ6BrIfgm
	EM1XSOgmptwIjvg24JtqDrFIM4WumSMwc7qq441JvkMSq7aCxSrSrUoyd8xVeMji+dBnxUHIbWx
	rdzIZiy7IXzVxb4n89Z9LaJn/Gmj2SDVjWTGPLaTFTvtv3NwiiFfkiptq5AfLZiv1m7ZN/o065+
	hlrSiNdkSBMZMqeIlgXLlCB9jNI87uyo/mkxegQ==
X-Received: by 2002:a05:690e:1183:b0:677:d419:8a27 with SMTP id
 956f58d0204a3-67ba501b9c2mr13354407d50.51.1793817291284; Wed, 04 Nov 2026
 10:34:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Nov 2026 19:34:00 +0100
X-Gm-Features: AclHuK_BL_NkBC94LItzmxoqmdRwZHsCG21WJll4bbRrLdBM3Wvnf0wDs-TvvBg
Message-ID: <CABdCQ=M_FwJOEG9Lhzahk=qA-qmqMH1QeGg7dfFPWdwT=4J63Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: Add the K1 APB timer
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 3 nov 2026 a las 9:56, Troy Mitchell
(<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
> [...]
> +               timer0: timer@d4014000 {
> +                       compatible =3D "spacemit,k1-timer";
> +                       reg =3D <0x0 0xd4014000 0x0 0x100>;
> +                       interrupts =3D <23>;


K1 timer specifies interrupt as <23>, but K3 uses <26
IRQ_TYPE_LEVEL_HIGH>. The IRQ type should be consistent.
