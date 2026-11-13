Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530220;
	b=Hs2jKp+ru9n5doIF4FN0mdWQO7Zf7S996d6dnJoUaIVJYU07+uVuVdp9C/iNqXuHfoNv
	 wT3rlquCyS+N+yIcCFhREAQpFGCqqwV9jSGf59gh1WOjDXObVQQoG/uPvX74TwbFsfqCC
	 BOxL5HyL1/FGtXQhUHq/MrPBdy1Ag6yXUflTUEv183Rb6vJLWXunyxp4v0Tra8UgsXjaf
	 fvC6ll/AuiHVqzF/6jT97G6mxDuyECMy7eJwoyHGKz63hi8LY+SpQi7tPvJx5OdnwdTfM
	 QDHzXDqPnScOPFwuL7tUySYMl1kTEaEG5kW1GPz1Awv+voqQtggt3zIHBxb1cOCmBTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vd1pmQ/tTy1ka0SKsEViEHEk399ztjWfzFlh1vxTWRM=;
	b=nx0UglkPyVEoEHjbEONMWUjbPwVKKgOPmXy6ubBQ/gsMUbh20nlC4iePTSnmbo+AAyJ1
	 irwOt65oVahyQyKk+CyIshXK/RkQAil1kce4MKbzXxxu8aPtyU7AsuxWuFtXIZSHJmH1o
	 KTN6F0OPQ1t6Jkjd7g7Z27Buq1IgU4tUdBep+U2/vbE5X3M+zgESvG/15YpY5mxeJKh4X
	 UGZF4avtTm8gP/Whi7hOHWb8mIHGV1KdR8el8spwt9nCvq4ab7z5dj3cuxgVw0wPbd14b
	 zyqjwgQ3yaMoldcmh1hhdQDiC8klgt0xDa0Dy1Fjy6l6HIQB7UtYVp20L/ryHTZMfcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaNisiNU;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0F606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F0F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaNisiNU
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a210470b49so2666765e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530218; x=1795135018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd1pmQ/tTy1ka0SKsEViEHEk399ztjWfzFlh1vxTWRM=;
        b=NaNisiNU77N77V4vCcQ1icKa7OMJCiXO6trRwus913Lif1keluGkym1ogzwsMSBsbx
         VZt8mIoNREjgHU/QyR0cQrLmt4QUJ7gicuX6EPPtgtcTIyskbUH3a2lOjZRPeA0vbaJv
         +qo0y/1wi+HqUvpWIOAi7x5/Wside0GHORLIwjZ7VZX0sYzIitZION6/x1HcAAJJqC/2
         c9gCWNOaabza14N2lPuQUP/C44QAwEvrU7v4iba+a9FHz8WhsRoupeNjF0YeNRpnW5VD
         hU5QsuCcj26v3XfuR1fVlYyMf8f/KVYRh8iuemaFXzx7WWMj3rf0bYtb8r6jiZaAOHfm
         b+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530218; x=1795135018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vd1pmQ/tTy1ka0SKsEViEHEk399ztjWfzFlh1vxTWRM=;
        b=rcLFGougEJym52PJuOvQxz+mKwbYuthOKJF0u1FatppziFfZuIj3iV5AHCBxzm7PGH
         S8/rO/tv0JkWVbLebctAPGREg3/NQbJl5EFshx4mrRiMZfbPbJLu9qvzZ4z2X6lMJRLS
         a7JIghP1WSm2qP8Ud6epUeN0J+oqefOz+GRx9lG42QaysU1DhF/5UgTM64OtJTdVeWg2
         DIcQp8R8OSWAEO3kML3xEKr0MQcSB/RAv/tRKm19qAczx8X8be/Ly6u+89q+ru4fpICa
         +OPybve1BFb9yd2OE0YuDJrR9DytglG1QRRUBWidG1RNjcvCQFeoHmexV7bOGYrFDCu9
         0kCg==
X-Forwarded-Encrypted: i=1; AL+hErHUQbOSXlH2e9qZ8lSfEoyS42xhxarRWWIT9PhFX+HpEui421BbJ9Vd11BSmlprUXydaYOKDD+Z1K6bPa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tAs8WHckfNMFDenvIPRf8NnSNqwTy6k8bG1XAPLnLLNyV4Grw
	/0k6loTfSW4LIeLfxOlCKFY8LW+L13ndXc0VwsOVPiuA8RZ3u6DU3euj
X-Gm-Gg: AYBFou3uHgJ17nJsCleAfzSYBWswGXqwBj3WFDhyoCfz6X/WD0xh8uspiVWk0NDGprf
	l7Of7GvhtEn6X+6GtFmwBjoS9irapxbN9SDvjbO9XcBhCxA0jXEiaBG7hkatxEvyOBgy4xjbBHK
	hEeJHIHbKYV7VskFpDIhGsbsUT2mZk6GhHsiqyEAW0huF4Y7ZsZ1a9RrAbttJ3iZzCwbgXkxfqb
	AnE656IOwQZO6k4LqYL6Tzlla0clFXYwUiT9Qjgw+BmjtLSj38U32q4K3Z9088kg7d8Tcn1N/My
	0NvLmtpXTDLrIWRefN2R48T9IfaHqpgEcSUJS4SsK+PI1GIwPr3HHmCVOmydQHjwb22OsSQ+QHg
	pmhbT/O6MV0h84kehAZjfN3n2Oc9PuSnhx6+fMJz0dt2xUfYi0syWh1hR5JDCdDaEyyq89EErye
	eoE1WryxsZg39zFvsFvn+r2/hc79d5z/RhZAdQroJtdVFJPHpZBx9psz0YDhg98FjWsCU587d5X
	Xx17EnzgGNSeVplL2oYB/fWnFSCe3IOrdTxZIpkaStlzhLARidMVD8r+NDfo8TlJ9XViSn6nmlB
	qMtLmYZSf7m9dCgKeIu6YeX3Gm55lhvC6ZMhgDrpzInEOiz6KDOD0cEgXQOGZkWb8H13vDlSdk8
	25tOtZImW9gCH1MwCAsqjrTsYZY5TTO3xOIiahm1MJ8RZzPojBn1WF4kpit+P0qEjHY8l833CRs
	A58L33kH5OevylZFC3j/vWaz7is5HRcrJS89ouOn8=
X-Received: by 2002:a05:600c:8b56:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4bb55ad0711mr16815645e9.29.1794530218377;
        Thu, 12 Nov 2026 16:36:58 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm106506085e9.15.2026.11.12.16.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:57 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 16/24] net: phy: Add Sanechips ZX5201 PHY support
Date: Fri, 13 Nov 2026 00:36:55 +0000
Message-ID: <20261113003655.3665572-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <788c9b01-473e-4c45-b6f0-b2ba054da8e9@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-17-ghahramani.navid@gmail.com> <788c9b01-473e-4c45-b6f0-b2ba054da8e9@lunn.ch>
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

Hi Andrew,

Andrew Lunn wrote:
> What do you get when you read registers 2 and 3 of the SERDES? Is
> there an ID in them?
>
> If the mdio bus is scanned, and there is an ID, phylib will try to
> probe a PHY driver on the SERDES.

I read them on the board. Registers 0 to 3 at address 9 all read
0x0000, while addresses with nothing on them like 7, 20 and 30 read
0xffff. Something does answer at address 9 though, since registers 22
and 27 there hold the values the driver writes.

So there is no ID, and no PHY driver would match ID 0. But phylib only
treats an ID with all of its low 29 bits set as no device, so a bus
scan would still register a PHY device at address 9. On this board the
MDIO node lists its PHYs, so of_mdiobus_register() does not scan and no
device shows up at address 9.

> I would suggest adding a probe, and validate phydev->mdio.addr is not
> 31. ENODEV, or EINVAL, to indicate the setup is invalid.

Done in my tree, the probe returns -EINVAL for address 31.

> It would be nice to reverse engineer what these bits do. And then add
> proper LED controls. However, that can be later.

OK, I will look at the LEDs later.

> This says it is an RGMII PHY. Why does it have a SERDES? That suggests
> SGMII?
>
> We need to understand this, because if it is an RGMII PHY, we need to
> address the RGMII delays, which that page says it can controller.

That part I still have to find out. My driver has always told phylib
gmii and the WAN port runs at 1 Gbs, but I have not worked out yet
what the link between the SoC and the ZX5201 really is. SerDes was just
the name I gave the registers at the second address, and there is no
public documentation for them. I will find out what the interface is,
and how the delays are set if it is RGMII, before I send the networking
patches again.

Best regards,
Navid
