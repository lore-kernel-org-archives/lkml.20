Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0604B0E26
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719636; cv=none; b=jivD5rfp3i582Hrg7w0uKhB1tBQjKjeF72vJ2oIg6qdXCaucfRDDWhO59i+e5Agx9gUW8typ06oT1YHbbEpoelT+IkUDjCgzMDbxxYcjSmd3y3VfkG5LBkeBDqTFel6s5Gy3o5sP3Hyc4D9S7Y0J8OOKdB1Y6G8g9I5uHJfhnQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719636; c=relaxed/simple;
	bh=WQreecELN5CRsfsxuPNhLWDBHIqw9SnFoDssMj6GbPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLiV7DI5LIF41kAnvCvPEmTD7OrF3bTnW6XKFM2Z4awCaerJMw17henf4po/GIY8gKzQF+9R2F0iOxTZE88WCggqQgRLQMWyFKk/AigCxrhDqUR5BsZbRXWFpWDdxuq5gTiDhn5iVZBG3doS2inq2Bku/SHcyJV4zrLt1lXahps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=QsPeG6S4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="QsPeG6S4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so2059175e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789719632; x=1790324432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vShbw/2lgHNba8hI1FFhUDrshd08XnAEdzVSO/hXIgc=;
        b=QsPeG6S4Twg6OmFvdbow1ntr/c4yqC5lR/MocwqHl6OQoYxkBSOmZNsRmLC+Ki6pew
         5RtSFNQmUTMrr9Qcr+TG6JKtCpJgZRQEWADgX84T4Ys9xYfQ2D8Qe+PS7JGGe8Y63lB0
         dz++BTCaXhdub1mqCu+Y/4RSYBzoJFVqg4tNEgwaBsblhU+oA+flEHycsUy6d9SBx/FE
         /2/mBpoT7iy4ixkHV/koA7qsAkj6VE7FO17BFmOGXyMJ3rAKWebBqvIMyPj5XU7hymgo
         Eppqlh9nlEpl1pCNhnXA9lAoCMpg12HYlnnuC7Y9maRszAWeP0VNo/QYHYCxkm+7VATP
         b+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719632; x=1790324432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vShbw/2lgHNba8hI1FFhUDrshd08XnAEdzVSO/hXIgc=;
        b=HLcpF8uHqjRSCmiLKDh26U74mn38wemo5zfGac+jRU4J/GR6BQjqHvvQvjx7WLEdW5
         SlomuLIDKRh0AKGFDcmqzBCLm9EpXGTZ8pF7D1mdqvkyOfmv2445BP3gQHK4zEmrW0nD
         zZG/3jThSkW2S7NU7XJDb8OX8Jnsd1y6jRWM+bjU3GcSd6+CEo//1EKMbjP1+H6zzNDf
         vPHoZg33l+fBV/Qhe2y7CrzzATIs2e2ghEFABjkJDZAH0xAx7ewHr8+fne2gH0GHr5Am
         x3NhO/nPFT144/jXoxVNMcKh4Jg67LYcIv9fr2NQTbXoW9qADYEgHjDWd01i+NIEyrzl
         11Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxGX9x9muG4jWNS8sLhdFsMCrkoETNgCgMoPob4WMcG6MoiKDHCzUaMBNLhFNlC05FpASLmmP2pfTVmj7g=@vger.kernel.org
X-Gm-Message-State: AFuF++mKvo07pzMKR/gsgZ1vPiaoY7rDDFkV/xORjkA4VKt4tyg8Rnjh
	i0VdbkecZatbKaKwD+PktPZf6p8e3Z9nFzGStkoh/3oKo68FuHVVgzR0XxYmrgT82iM=
X-Gm-Gg: AYBFou3JqghxvKcJTwVii613HLRRpcpJNerkMlVCGsl8ffN3RP8zi464XZimY5xIOBH
	ACJEO/RK5XpeKumJ68ZHPoVdnDpepDfXVFn6WpJwcP0ZsupA3HDzG2nthcjStecikFT01umEpVi
	lKf0fxgZjKb6XC7skgq6kpiclBo4XlIgFe95bPKhVWbyeZVkyURdd3n6WNL9xVaNE2HKLzNawue
	BYIePuZbGaHHNZLhUK4lIWnx6eZxXuiIrfRTtC1xauOsjSqGwRbgOBttwOhHdf8jCBU+JnKgfGy
	YTOHs92IlORb4RSzB8jSTMAklyQPM6Ze5mSldaQ7l2//DwmKJML0n0M28wTPt6+gFy2h7OGkxtg
	sQ9vLLqvuraz7XhyGsthCYkJLswWr/+1rXHeuDgPyJvihGElxU4pzpGQXOYr1SzAX2sgf/jckMu
	l4qBTT+5ypxuWIXpi38Z/dqJTt2fkRXwPVsHrxv6BKJtKuo6NCnA==
X-Received: by 2002:a05:600c:4e50:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49fc566443emr45154215e9.1.1789719632274;
        Fri, 18 Sep 2026 01:20:32 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm143028025e9.6.2026.09.18.01.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:20:31 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v8 1/4] net: usb: lan78xx: register the PHY interrupt with the MDIO bus
Date: Fri, 18 Sep 2026 11:20:29 +0300
Message-ID: <20260918082029.2697643-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <df5d4af1-a86a-4820-9aeb-b1449a60f37e@lunn.ch>
References: <20260918015029.2518425-1-f@lex.la> <20260918015029.2518425-2-f@lex.la> <df5d4af1-a86a-4820-9aeb-b1449a60f37e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > +	phydev->irq = dev->mdiobus->irq[phydev->mdio.addr];
>
> This line is redundant, given how phylib works.

It is once the table is filled before the bus is registered, and here
it is not yet: this patch writes the table in lan78xx_phy_init(), after
the scan, so phy_device_create() had already seeded phydev->irq from a
table that still read PHY_POLL.

The number is known before the bus exists, lan78xx_setup_irq_domain()
runs ahead of lan78xx_mdio_init(), so v9 fills the table there, before
of_mdiobus_register(), and drops this assignment together with the
if/else above it. On a 7801 the PHY address is not known until the scan,
so every entry gets the number, the way mdio-moxart does it. A
devicetree mdio node still wins: fwnode_mdio writes both fields after
the device is created.

> >  	netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
>
> So maybe change this line?

It goes too. phy_attached_print() reports the irq at connect.
