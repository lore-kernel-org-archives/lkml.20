Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816676;
	b=poUfS0za4J687906XBjvRRttv7CGXCh+d0hq/jTBKflsg2Vp1GHDu8RuWUp0KCPtZI2f
	 o2tP0uchRk6jz+CPZEBVUpOCx7wM8nWRd4LTAOe5Zy12M1GdUNpdfQGbTb0raDzgVcA74
	 tdplOyRZUinGHg3X3pIO44di8WjsggXpPrTGvV0E0AodOPLghuk98mAHltzW9DjmYjCWV
	 nA/x80+/vZ9rGmzfk85fxYkHWkJp9P4Ic5HHvMGPDSNp/IjLbtZhKvbAZenRLvcu2heTM
	 3+gHIXpat/IS7tpBInB4C4wTGpaDuNnV8e407ELDFWW94KIvP1ut9gBW/pbDtOqJrkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ycnUco1cGdhF6ejE960/8oZSSlOXbGBirBTEJmck5lo=;
	b=3DprySgcFnIikYc4y2wmAK/5k7IpJEYjrKZOSUOesrZErfdeEo40msLiGGhJz1UtNGSK
	 Tz6OWERPhMdkeG15Z0WhAZAGQ2mJvHDKe8GYPk7jVYVkcKEzF0gLZC88rnu8nV4BRu8KX
	 QO9fFE0S6LvCENLa1OLtNWvghC4hJkOJLpRN7UBog++MxTcQ/W/2d761T97lPZGZIB03k
	 oKn1fcLqDDOxsYwIWpq04qvuM+t1sdlG1vtEe8VVU4GCjoFGqFkIbAp4B0RT3Z/rrWC6a
	 h8xCxd34IzOkA7lqr4MEf2u0y9k8ukLhKiWiZL7CcejhZKds9SktXE9eolyn9NTLdlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAvZ42ZR;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E459C606A8C0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E459C606A8C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAvZ42ZR
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso8298725e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816674; x=1794421474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycnUco1cGdhF6ejE960/8oZSSlOXbGBirBTEJmck5lo=;
        b=AAvZ42ZRapL/FMAksX95saKS9FgTgjlJvKBwZ1pJogyOqinmoTMN7ygQWtw8MUwzsU
         XP8xEhzv6dcsY5IS9bcTb8HrB/AeFsobHyQrfXWcCIS4z02LJbwGIn5wYlKr/YFgEwo+
         8lPuPRQPW71kpzpKYD22xYdDXlCsYqwnVXYsp4yfkREhxJlW7v3oN4LwVZxei0oVCYad
         /dmnHdlouVpUeAy2t6NWWlB7GK8isX640LnwDxoi2y33o/w976xnjycGy5XxqUundg/6
         owEuLMgr9F+UltJOp1XfjC9dwjRET/axmp29yWGoxzk0ja3CIPdcJBxP5gZ9LUaP/DKL
         uJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816674; x=1794421474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycnUco1cGdhF6ejE960/8oZSSlOXbGBirBTEJmck5lo=;
        b=XOy1879xfhh7qMfS1Ujq+7jBsrYBGDH/59p0UCGopS0H4a4XG2Jy/Ys163bDUtKpTf
         r7mzVuYRSqP6WAYnoZpzNIJHrBvdvrMSBt+a36iOaE3tgRcTjNdgSohEJVuSkO4gI59m
         ztTp6Mawt9cs5z6uLTm/qPxL2syNHKgZam6uN13jLdvLJw7VxRY0+yGc1ytqEMZsA8Mi
         SujtBI1IJBbyG5MYKhLS1Y6g2zspptcY7IFjtqwGErwCF3DG472EwYsX4lvwbpSvOd1x
         /Qkm2YEAyUoSqpF3iOQbJldYwncyP3eomIPpfcJqYmhsPQpos2w3dJ0+TobFyX15799R
         dqCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDskksOPcBM0yaPwgMalYzO6NWkNkx1NiK1I23BASLWEYlDwj6x/lfadxibBrrDTPW1FSa9OQhQQ5ZKkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wmacSPaHeXRSK98Lcq6ypG91uO5+/DQMLV51/Q12Q1FzrW+eW
	MDPh22YBZleTyZgiV/9cDXusGDDE26Mn1ia/uhga3kP5LW5IzWSW48Hb
X-Gm-Gg: AYBFou0fH+SadUFyenyMQ0t/PPZlKOPD/FhT8CS6oFTTFlqvS2SsS7wJANKxWFqpYYS
	paiL0Gkm7bBv/BZQyjtKRRCWpYNCP0hRB4mKG7GQxchFVwVEjivG4rsGhEN8d/d4RzytqOpF3XM
	ErUorsIECAJPYMPOrmHMFvnUwxTnJWgeNg/3tg/LPu0GGE8rjlUD8Y6XHgIjjR8L+naZcrGVQBB
	6T0tD9cvCogZjn5xok7BrMzPpjDMfgMbnL6v5hiZXFDRUgpGyz4q6N6NFcWkYqJ88/MzlayO/7F
	gp8+jZh+R+NHmQXuZ0lmqZPvYxvgxouIt9im7mupGSYBabNbzE0ojH++TS48D9Ux651tYSWmodu
	JZZwk04iooas+4DIBF/wTPfNZipL3Wo/Bs1TEdPatlmiiFIShtxK5kxx8JqM2ia+BbRSxxoSzWb
	/9tFbu7U70zBNPg6FdVNSSfmLAx2y6UZaPHtCHDOa/3SfyBIXLes+M7VfsI+o9aiL8yPW/i0yH2
	MIDXWozMMaUAcj/fzpLFXPQ8XPwIfclxjkPyYc13lndO+Dw3yvWCFdL8RDc9Fqx58xRzkcb+aIx
	N43TGQXLzVfyrwnw8ovhRRsfuqhurcBN8gASaVU5n687gDFq6dU2pBjrv+3czu0nYrF5r5SFnqI
	RcG4Hj4SUDdMcu5ud
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr409378675e9.6.1793816674252;
        Wed, 04 Nov 2026 10:24:34 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f0237aesm3010995e9.9.2026.11.04.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:24:33 -0800 (PST)
Message-ID: <6aeb7861.6171b307.11ae12.6b94@mx.google.com>
X-Google-Original-Message-ID: <aut4XNrQlPIZ9q4y@Ansuel-XPS.>
Date: Wed, 4 Nov 2026 19:24:28 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 5/6] net: phy: mediatek: add calibration
 logic for AN7581
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
 <20261103221439.30502-6-ansuelsmth@gmail.com>
 <2b744929-609b-4529-8b6b-30feb3ebbbde@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b744929-609b-4529-8b6b-30feb3ebbbde@lunn.ch>

On Wed, Nov 04, 2026 at 04:47:09AM +0100, Andrew Lunn wrote:
> > +static int airoha_cal_cycle(struct phy_device *phydev, int devad,
> > +			    u32 regnum, u16 mask, u16 cal_val)
> > +{
> > +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> > +	struct phy_device *phydev_p0;
> > +	int ret;
> > +
> > +	phydev_p0 = shared->phydev_p0;
> > +
> > +	phy_modify_mmd(phydev, devad, regnum, mask, cal_val);
> > +
> > +	ret = mtk_cal_cycle_wait(phydev_p0);
> > +	phydev_dbg(phydev, "cal_val: 0x%x, ret: %d\n", cal_val, ret);
> 
> What is the locking scheme here?
> 
> When using PHY packages, the typical usage is:
> 
> 	phy_lock_mdio_bus(phydev);
> 
> and then use
> 
> 	val = __phy_package_read(phydev, X, Y);
> 
> All the read/write helpers are __ indicating they assume the bus is
> locked.
> 
> Here you are doing something similar, accessing another PHY in the
> same package, but without locking. Is that safe?
> 

Hi Andrew, thanks a lot for the review tag.

It's safe in the measure that the worst is that link goes down during the
calibration... I will rework the function to assign the base address to the
default address for port 0 (it's hardcoded by the SoC) and use the lock and
read/write helper instead.

The main problem of using __phy_package_read is that I have to duplicate
the mtk_cal_cycle_wait function in the airoha-ge-soc.c as it would use
different helper... is it ok?

-- 
	Ansuel
