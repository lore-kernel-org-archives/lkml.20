Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717698;
	b=PWNmAO8THzJhp/A18mhQYeWXbtrJEYcj/V0frXb3By3Z6BICG2kP+/hfZ+M6KENs40EJ
	 /BiRXWcbELEd0o7M6BKyvU8wA2NMTnCg3T6pdlCo83Z2VjqMmXZ/SyRxF8S1HlFrE17Yq
	 W9cv1Tzn+7Cj0d3gbGpKzNpAgY9jtAYByXDLtvn4YLSuD55UoZykiYvwG3ZmTKMxOlptx
	 yC9DH1ciNskGUOz+pZh8mivbpTt1mbKjrw+Lw3S9e6s1Pt7YR0p7dMfvUuCNNdaFQMBxq
	 ELDR6VJzG5EY51O6naPSFJkotxYNXxxCrMRPzGW7V4E3RPoU7tvUAqivyp+b3QDMfaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IgQ05NbEx4CjJRtb6GmYnk00OGmK1qIWhCn9DM7D2rM=;
	b=eoCaoVBAH7rINygLkloV2kYEd5P/GusG3EycnkgHBODR4uoIHjhb2aS8s/8uRen0sotP
	 +fCtfJdKPj9cH0+Jqaun6ofkKKFMnZwbu1Ye3onj8sFFBrCD1PPTHwDvQwxpgAKI9RXl4
	 pkeYU1kqEKRP8d4HtYCAgmydrfT7kYnckopBibFe/e0dPObKHnJC4JrjsbZqE/RlAg9lf
	 9h3/LAgmS4PyKJj7XxTu9EO5EQd8qXuAnBLZNXWp+e2IM3Sl48e+KheaPw/n6IG9WZlu7
	 5/pvltrv/4rXQSuaihcEQyxbPAsQExovcCsGRgprfd9Wn7coThJrZ+3/n3NNSsQlo3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJTHeByh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.74
Received: from mail-ed2-f10.google.com (mail-ed2-f10.google.com [74.125.228.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9477606D823
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9477606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJTHeByh
Received: by mail-ed2-f10.google.com with SMTP id 4fb4d7f45d1cf-6a14f2e937cso3104655a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717696; cv=none;
        d=google.com; s=arc-20260327;
        b=QzsYOe4gTYBE2LMu0NSFwtQ19C0jZmCVom7Jf6hFbwuYlxIvd5MPUHNS21LlzbsZvW
         ppJ4MgzK/wuJt2h9PgHaHRVmDPgaHcYh+lkoCJzrA82dPx9lRkcKcDSyFjQ/dpSddzni
         bjJYkX5c9OCco1GOAeBMQz7r77NU1VOtVjpXo9mnlMRNbvkgkl+ItjMCvpwbzWXVrp05
         or45uFEL+C9SGTvzXMavSGT6Kl0s+/HGs06MJ0vvY5IzoYjqk1v92l20OIv0cmwodA1P
         cR8Wt0kbIkQzkzKaCdl0hcRCaAeOiAUYpJxZ9hu5REZSZyF3bzpMWv/1FXwoS3Sn9w79
         iJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgQ05NbEx4CjJRtb6GmYnk00OGmK1qIWhCn9DM7D2rM=;
        fh=nFbOlMo/ijxJ/Mm/lvGCRo4foUWBFmNsH7RIbaYc9p8=;
        b=Eh8HGLOeNDr+6wvGmQEOnqFUAggBp4/Hu4wK8b2qE7DHnf6/0mZorAcMdLUs94f+rc
         g0LAV6HoSySMgMNI3zm/A3Bpxm0ifbX8xL+5cuvH9WviEm+K/DGC19SqO2spjduqs0jR
         TlWlQS8YaTwUdfTtaQd2rKF+/qD8OssNcK2aS2L2GTvnurLpQJIJgkK962+U6G2htzBH
         kbJYjnEoiqxM8BWoU7uFP8SAK4CvikjXqw1mNtJj83mz4tMLYLdeqPnI858SFD6VISkM
         VrYN6LwIdZ08yfAgaXzDIqlvl55fB0kc9YJoK5o57lkJx5E2RNeJoM2AQwAWVh7dm/EV
         VHtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717696; x=1794322496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgQ05NbEx4CjJRtb6GmYnk00OGmK1qIWhCn9DM7D2rM=;
        b=lJTHeByhvUsqmNthJzka8HI//cTRrFzmipR5IMxMyAxoF6ts3LUAFWrILsyTik1UmD
         2MeTsZQSE/GF5OCnYjiEhQQY96ukTa2Zfdm9XJj8qncVyf9L+q0OAkg3L8FfHcbo6l/A
         GLJdxlI7SPbxK+62d2NCDYfz7/v5tTD3HJuB8hKbfhVuKXQaLRdszKY8SSp/v7fahQyl
         MokP4a8V3Cw2R5dRVS4PpBM2nkGqTtUQdZXXz5Qd2Jpr4+Qh4K/z/Qs5EtBZDZ+YCHjs
         u30BwD1FvpNrWpljxKFTQQG7S6hFxbddzd8zz4HEpyteF92F5sAIqcu8sF3iXmvOar7n
         xHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717696; x=1794322496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgQ05NbEx4CjJRtb6GmYnk00OGmK1qIWhCn9DM7D2rM=;
        b=qxikK3LIOko24TbFpgep8xZXp8g42VIwo7aHVp6Eddw67TpDKZfdy82VATBzCf9qZK
         5wkOzqrnp3t++y5D5cSLwApQgBzmlYrIfAuQgvceyYo9kNDhRH0NkWVXBU91MbA31OCt
         Lpy8sXnHbJkBWSGi+h9XYqpEhBHJBRotu884z7z60yScpl9xiNkAM9uPZdPRyWH1IB36
         kcgUsHg7kKTR4c0KzfWo17iWSjveB7mBJE6tAms4W6Xsz8ptE2nj1XEW9KSRrMQ0Lk+D
         P49h+MV9IjkkqK6df7rez9RYP2FupvkW6GejzsoiOlhj+prBiQ2S4XBAeeV3ZLzuIIow
         Tuwg==
X-Forwarded-Encrypted: i=1; AKwUvBypp7fCYJkbtGZDqyUKY8pUFGms6VR+fsvEiDvIh19eNjgJ8q99z9qFRDXwwCVEVHye5mk6vg1oCz8Ouj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v4nMjUBNpcwkyn3jaVfuA0Ar47X9RXhbKxVMJRIHmbeMjD3dX
	9+pBIbDHDY95zRIfHtXFRYZg1QuN0iok3bWuCCOiwa3+pw6JvbfqiurgEBiTMWBB3obEYjDJ1ak
	jLrfxGW5Vmcwh85suzvMiZL2WxVdpfWc=
X-Gm-Gg: AYBFou3TlQStIMtjLoi0MCIhHB41hdk7f3LJ5o/LCQh3ETQdDPvMB0Tme077MCi09hk
	sPVAjceR8YNgb2edn1ETLFzEEoh4ec/sA2dJ/4ZHB9nd/Lv/vsyLTE0Fw81KjaO5vJV6ZZjkeHr
	sD08O1cQsQzsOtnzA80trgzL0KZBHvbQWDqZU5fd22S4xbhSFjikkgtkHsR+qGi6y+8rKex79n1
	4yhCXWBtBGZcqoHFzTyXjjt/o29ow5glepp0CpeLWgUdguolU5SyHy15qffZLxatgB5K/Fj1PxT
	0kRIpPXeOuwbGeegVHkEAEdJw1YoMN0upfRt8sFDX9p97ZHzJGUGuCz1m8GbjMl2rmLPBNQOUvr
	HEfxKT0r/fw8QzEMR3fIe93dxa2MgLPxXrzh8Eo4=
X-Received: by 2002:a17:906:8346:b0:c4c:d6a3:f4bb with SMTP id
 a640c23a62f3a-c4cd6a3f756mr402146766b.10.1793717696122; Tue, 03 Nov 2026
 06:54:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029094916.3127193-2-coiaprant@gmail.com> <c5fc86f9-3c43-4aee-8d88-92e8f88c6d5d@bootlin.com>
 <1B8D463D-1295-4BF0-972D-859C342E49F5@gmail.com> <48cb8a9d-622f-497c-a13e-bc679c764ce0@lunn.ch>
 <27E466B0-72FD-47BA-B952-68BF4A817A04@gmail.com> <f554dcc0-14ea-4721-9517-dc0337c47426@lunn.ch>
In-Reply-To: <f554dcc0-14ea-4721-9517-dc0337c47426@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 3 Nov 2026 22:54:43 +0800
X-Gm-Features: AclHuK95KHd0dj6_gNrX9gHZCv0l52s-Y_iZ0--uZvsX8IoRCF8VNkN1cmNSy9Q
Message-ID: <CALj3r0hfBj_-ZGsAAvGC5FYeFDtxiWcYDsmZA5fEeq_chhvfeA@mail.gmail.com>
Subject: Re: [PATCH net] net: pcs: xpcs-rk: limit advertised interfaces
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B411=E6=9C=883=E6=97=A5=E5=
=91=A8=E4=BA=8C 21:09=E5=86=99=E9=81=93=EF=BC=9A
>
> > >Are there any registers which describe how the PCS was configured at
> > >syntheses time?
> > >
> > >     Andrew
> >
> > Hi Andrew,
> >
> > Yes, looking at the `xpcs_identity` code, the core does probe different
> > MMDs to get the rough type: PMA/PMD MMD for C73 and VEND2 MMD for C37.
> >
> > However, even if we determine it's a C37 or C73 block, that only gives
> > us the rough family, not the exact feature set.
>
> You might want to try reaching out to Synopsys. There are sometimes
> feature bits in VEND1/2 which list the exact configuration
> synthesised.  And since it is a core part of the licensed IP, it
> should be safe to trust it, independent of the platform it has been
> integrated into.
>
>       Andrew

Hi Andrew,

Thanks for the suggestion. I looked into reaching out to Synopsys, but
it seems the original maintainer is no longer active in mainline.

I also tried registering on the Synopsys website to look for the
databook, but the registration was rejected with:

  "We couldn't find your email domain in our records. Please verify
   your email address and try again."

It seems they only accept corporate emails or existing NDA holders.
Without the databook, guessing the VEND1/VEND2 feature bit layout is
risky, as it could lead to silent misdetection of capabilities.

Since Wangxun (Jiawen Wu) and NXP (Clark Wang) already have their own
XPCS PMA configurations and quirks in the tree, they must have access
to the vendor integration manuals that document the VEND1/VEND2 layout.

Do you think it would be appropriate if I post a query to the netdev
list (CCing them) asking if they can share the feature bit definitions?
Or is there a better channel for this kind of vendor coordination?

For this v3 patch, the glue-level intersection remains the safe
interim solution.

Coia
