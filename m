Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837222;
	b=CmoAkYwyanudYcEIUuyv/jAV6eiy9QLXE4tze8jEl/ZUloufBYmC7AmfEZs4PjH8Q43S
	 DRWgrR39dszgp2Qayg9cV9KMQcut+XTjkkbJA6roWvcl8t0SqUQiSRR9b7qAre03hzyMR
	 KjrgwODbBLAQj+ve4LuadC2+LsK1/kunAClnnjE216/5nq4tDh+P+atVE9iDs2XBbAHOm
	 chwbwUqeMusLWHVAgPZDNlEYTviLPpI1FNQCLNP2lpBRt0r32OIsxBV0fCTX23h8Zgu8P
	 vmmFzajC11BoFsSU3LmWDMwyblqCc+eq1Q2vlvrDIhmHSaJunALGhFBTvyXDPc5LQLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d1p/rD6sTNhuzYzSDYOdeVCwAUdWvLdNAWonA3aBGkk=;
	b=RxpFa/p/C3GkL0E3MlAV3XL34tW+dGD4sGfuu+HEBH4YG5ckAQeP7OIVKeBYAGJxi0lN
	 6xAnp2Bs2zak8yj/OZlW8FseYoan2THN1d8S/SYFTcMJwa8qCpCvI/HCTH4vh4I8wjNSz
	 wgZ9kWtUfMZ2X/NZ6bxObI5V3EnxuBGu7gUjzWpT/enKpUYbk9zCbbxL9JyAmwx000i5H
	 KjLb53zvkf7qNUE9QRF84KXU7sSuTpmLbd1yokpzEyDu8FUiFH6iru3C/wuvpx3C21DpB
	 pM7QGJpBQDCjgWea4jE94PNiZb7Y/hc95LpYKYrqogLpeq4hSHi3XbThcajgF7YO2EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBSvJJA7;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C422B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBSvJJA7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9988825e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837220; x=1794442020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1p/rD6sTNhuzYzSDYOdeVCwAUdWvLdNAWonA3aBGkk=;
        b=HBSvJJA7LE1rpkWl3EQlaKPvM+vmsGVv4Eo/eNaB2C5Xa3ZmFurERa2waV1z3Rbofm
         BR54o4qXWgVU/Uqgpqru+uLVcm3iOhXeNvXXl6miESzC69Hprt7lgxQrIA6l3IJXtdmr
         2shcTnrsIEJJ6eqk9cUzOnWCC4Iuc6JTudDOVnyC2F3RMHNmYirpvZ7A/KlY+DZEXSjP
         GANFegY6laUwc9iKd+9K51CNwHJI2ZqjiWRy4T0ThK6yfkyr6hUtL/EX1EETTGs0n3BB
         Rjc1jA3RNJzRMFvsx4+2X0PepDc02WblQAmfKJBhea+ceuJAjXsNnJJlvNmCHAcKGJHh
         WYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837220; x=1794442020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1p/rD6sTNhuzYzSDYOdeVCwAUdWvLdNAWonA3aBGkk=;
        b=lE0Ku84mAOHddfs1LmXYdOaXRvH1PE+vcd/0OPmVy8tYc47g0TMwO4aK2BNZPUrEw2
         tE6l+SG/3yJCbg69UXT1Hw/dbUV4SFnc3YN+S6XG2SrDbO/PsVetIvTNEm87gCat6H0f
         he8k4hH0YABnA0ezdbZKHAPd0NRUC3t3GNrb0ldTFTBWXq2Ivcc8YM80Nyw2TVoxvc7r
         ImYPyEn13YSq733/PcyBjmYeRVUkl339YpCjd+kTuDJAu2wM5b1F2z2VXxkUsaA5KqaW
         zExeJgpIoOeOmcbFsmj2ucEXDT1POfpWkKIxNrd/GuNxCthbwSG4/V46ZKw+YXTbFZxF
         nYCA==
X-Forwarded-Encrypted: i=1; AKwUvBzMrP07opZtdt5s0lKNHaOpzzm0K/Zyo3aHLG6fP+00cJBxOtq3bZDOuztQmX6/f/NJ/XXYorhmqntwknk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zKIOoYiolBdJ6TgUBGD6h5c8MSCDNlGT0n0Zc25gZHIfmIc9H
	JKzpluZGTaVRVwdYoXYbdZjI0vk3k9htLjqWkGcVIB4D1tx+1UA21eT6
X-Gm-Gg: AYBFou1kbTyrqDg93C685xN+ksmRIrLazkrogE2UxHP/pqV21xD+Xp+rRl1WLCPJuRC
	gX7SGL8Omu9v5j7av2GIuMzRqtgA7fuNFjvGVRasFcQYdDa0RHUZxK39ArGocaIDh5ERL0c5DIs
	nAxND6KGb1F0+uQAtcgkve5+WKtPQYMS75a3FZbLAWtK0+0dwTUwuEtTwpMZr7PQ59uS8qIASjR
	Av/GxlxOndTpEffU/RBHnKvUN3/OCsHzGy5zmdyElDD7IjSG7/IZsfXczLmNJ6YG+7E3Sq8K3m9
	HlXrihKbYc+wsy9MqVOj+bXfxHqyl2POpRWTotelh+xC4OunTR71zUvedn9b7OvWyd7BP+9AtX3
	HIlsRDZIz5ib40+YVFyQziQokyzEYe0QT5h7XQvXL0qXFQCSK0hMTieHQt9fwRUjBRRxC8Rp5qM
	L27YFhg5jEyjRYnksygw37YQvgtPCouaDwOg/z4oRSBarc8ckV3lktWCRqoS0tvzicInzyJPvYC
	uabpefRz+Acpy4FSwXD5SfqvKnEEYTwjtF/4exUJRywfsjgaAmKPuKjwl608dgmwkD2KEfwCeo4
	atzTfVggGTI7y0lCtfkyq/HwfJPF+p0Y93n77PyxwuUQ5WSp3anr0Vp3R8PotwNHTI0omI6VPem
	6psIvBqQih5thbJ7GdcQ=
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr398502555e9.10.1793837220243;
        Wed, 04 Nov 2026 16:07:00 -0800 (PST)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725061e1sm21403745e9.7.2026.11.04.16.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:06:59 -0800 (PST)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	o.rempel@pengutronix.de,
	pabeni@redhat.com,
	rmk+kernel@armlinux.org.uk,
	stefanomunari.sm@gmail.com
Subject: Re: [PATCH net] net: usb: lan78xx: resume phylink on non-reset USB resume
Date: Thu,  5 Nov 2026 01:06:39 +0100
Message-ID: <20261105000639.7070-1-stefanomunari.sm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179375001506.488856.4516083483989818643@kernel.org>
References: <179375001506.488856.4516083483989818643@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 03 Nov 2026 23:53:35 +0000, Sashiko wrote:
> - [Medium] RTNL self-deadlock.

An open interface holds an autopm reference, so this requires a runtime
resume with a *stale* EVENT_DEV_OPEN, i.e., a failed lan78xx_open().
This error path is fixed separately, moved to net-next per Andrew's review
since the failure is considered theoretical:

https://lore.kernel.org/netdev/20261102211119.8738-1-stefanomunari.sm@gmail.com
https://lore.kernel.org/netdev/1449a6a1-670c-4d1d-bb98-51f92e32d848@lunn.ch

On system resume lan78xx_resume() is not called with RTNL held, so
taking rtnl_lock() is safe there.

> - [Medium] Self-hang caused by re-entering runtime PM from inside the
>   USB resume callback.

Same precondition as above. The hang needs lan78xx_resume() to run
inside a runtime resume, with the interface still RPM_SUSPENDED. An
open interface holds an autopm reference, so its runtime PM status stays
RPM_ACTIVE across system sleep. On system resume the nested
usb_autopm_get_interface() from the MDIO accessors therefore only bumps
the usage count and returns immediately.

> - [Medium] On a normal (non-reset) resume, phylink is now restarted
>   after the MAC datapaths are already enabled.

Pre-existing on the reset_resume path, can be a follow-up.

> - [High] This problem wasn't introduced by this patch, but
>   lan78xx_suspend() inverts the lock order.

Pre-existing, can be a follow-up. An actual deadlock needs a
non-freezable RTNL holder opening or closing this interface during
system suspend: very unlikely in practice. In the commit message,
"mirroring lan78xx_suspend()" refers only to the dev_open condition.

Stefano
