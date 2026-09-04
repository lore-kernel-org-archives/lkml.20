Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C8B3C553A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565539; cv=none; b=h7gecdF4yVu+RNpT87QRvXYHEeIMajnlIgeydGT8Kb9JbZDUB3rS/N08Ig2vlZe2L7yX3gXsMo6JWI9TCZp/BHbnuGP3jv21wdCK5PeXG49Y8pSB/oHp4wKee/xiMZyEDMYeEd8NGc5OL3XHk3NUDhHxHGDlfabvQN1Acj/SlcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565539; c=relaxed/simple;
	bh=fkFTQQNYnQSSSsDD7OGhM57lhbiJ5lJKsqadU032ayE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZygbVHRUFTOmdxui2lHRK6bxB4xZI5X7lvh9Uu7Tohr6z7VNXwIeO+9MPU6+Mhw1yf/mLSCcPxC6Hot2cWPxuowiNN9JaYYNPRYYadFNZQHJiq6mQB7t71D2U+F4ZVz397Yo8I2jsMYFYvma4p3OQw3wuun6OphwndFqVK+wB5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=OQyiNN63; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="OQyiNN63"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482dbe4d247so981317f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788565536; x=1789170336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RjaW1h7vZKLdHfo56Q43CxCz+PpDYJcHVHSJB9rJaGs=;
        b=OQyiNN63vU+T9mYDThlN6nY8237tXPzcMLsJtneON3yQ3JEAn5FQGVworkcxBGExTG
         VTxligFfwnhu4FTy2irZ3VktU2Xl0PsnLdIBIUvXQWuaaAz4vy+lVO/nJYM2USLKPdW1
         BRDQgGZE2y55Pol45o1xoU9m5OyGKrFPIDF4r3QpLAojqva+jsf4eyHMWHn5PBQOhAUl
         x6U3WrwwXtYwexxP1A4jD8sbGXfKKBReVJ2EpOdTeo5GqPc3MebaRctRgGHywD707Div
         /WjMFc9LKVF03IVUHdEkO1CdHD2WM8BuqDXURbii3s1yPpJaql/KK4Hxa5z9L+Z8QBj7
         e0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788565536; x=1789170336;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RjaW1h7vZKLdHfo56Q43CxCz+PpDYJcHVHSJB9rJaGs=;
        b=MsWa+6ZRzSn4Tl5BiY36MVSkkTBFCVVPOfCKcC7IbOM/5h56cT2U/bxQH+bQw51EwF
         LL3cbBQeXgFHLHHkLe7JMBjEhbtufyIaQOYbfv4gKuGPXqlgP6zEtBoMm3b8yJFkdYNh
         O/GkJU9NElhCmL85s86FICizBNOZbTCUecyaXruLNtEcFP/I7LbSus3asG7oJS/+q0bM
         yD114GrMHqjeXoJGREs7GS89RJM+vPnlVrHdnZO0PN7WSduYxKwvd2ESIayxhpdSxaf+
         IJlwB+ysDefGAudaQ8nuTRZ/iMr40aUbLSxXqvBqOZYX0J7NrtIJWTpj3u3ZRjCGUCnQ
         ge4A==
X-Forwarded-Encrypted: i=1; AKwUvBw1IrtoWQV0KE+EH5MWi4r/3ANFS2w1VVvtnLqEj7TIDYgYBtJZCWFALqP7qFPfdMwaQCizy0tibGjn40I=@vger.kernel.org
X-Gm-Message-State: AFuF++nwkAf4AEG6McDSDLcyPPtWY9DkYNvEA93YdUIqQF3qJ+o6U3+o
	tv7RCbyTqx7iF+1S3moKDX8zU7syBP4+VvldfzQ0q2YBK0UzE0ilmdq31CwRrq/Q1Mo=
X-Gm-Gg: AYBFou1FLsWVXTsHMOWB5H20qmYy4qv5T/J5yU5nq4t6eNzuk2BBTNwEvX6mwnlKTsZ
	4OF7uCSOf0H3fdcMNR3u3o25ro5YnX9yReCstmaGOWeV5zkfUgAcXpW2soqSizUpnJf26WyBtYB
	3n065ElZ8QwL1DaohSleUc3P8bOjlqqe08ZFNFQdDBytYD8ta1BR8gYO/7J/4jsI0NixQmEYs/L
	ETEwNLx4aBbElSiSfJcEGOoMM8q0v/hWPgctKiO/29zM9YpcImOyhIx9neiEuIttrZYFXEBxut6
	5NlD8a4OilKM83TWIDoWVdA+Eb2N0gbeqPnKimOgj13Sz+r69Lzah5m/YJLRml6lwpNxJVo1Lxj
	PIUsuaObraEtFzKcrxhgZa5SxJ62ADYigs4AMDugWsUGJO+3Tj8W3+oTvtr8dHmM8R1VveMcGIk
	Qorj34+Kn0mnkfq57A7/VArjZUPFomFSWC4eofSz6EWIM4gXHnMg==
X-Received: by 2002:a05:6000:2388:b0:47f:9283:1fbe with SMTP id ffacd0b85a97d-48586bf25b8mr18225190f8f.0.1788565536106;
        Fri, 04 Sep 2026 16:45:36 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9a56sm8018342f8f.15.2026.09.04.16.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:45:35 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: macb: reject an unknown link speed in the taprio setup
Date: Fri,  4 Sep 2026 23:45:34 +0000
Message-ID: <20260904234534.407633-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cb6da9c8-aea0-4740-9709-d718462481e9@lunn.ch>
References: <20260902080528.2211468-1-f@lex.la> <20260902080528.2211468-3-f@lex.la> <cb6da9c8-aea0-4740-9709-d718462481e9@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 18:37, Andrew Lunn wrote:
> Can ethtool_validate_speed() be used?

No, it returns true for SPEED_UNKNOWN:

	static inline int ethtool_validate_speed(__u32 speed)
	{
		return speed <= __KERNEL_INT_MAX || speed == (__u32)SPEED_UNKNOWN;
	}

It answers "is this a legal encoding of a speed", which is the question
you want when a speed arrives from userspace, and that is where its
callers use it: net/ethtool/ioctl.c and otx2_ethtool.c both validate
what was passed in.

Here the speed goes the other way. We read it back and need it usable,
and SPEED_UNKNOWN is a legal encoding of something unusable, so the
helper would accept the one value the patch exists to reject.

v2 is coming with the commit message Théo asked for.
