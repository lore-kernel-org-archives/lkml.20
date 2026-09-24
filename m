Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443E443E56
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287288; cv=none; b=AYUkpLqL+v379rfdKSu/TPU8mtwLRI9rdyr7ptUEzL1sMAbD5WnEG0+OyGgXPyWC8wocL6FHb8bzIZ5I/Cr9emxj2rEYN1cYd0c8YAESBOH5rWNpgpQzxIcPVLq0C0hzDk7E9ynA6RzPbniVQxTv1hRkvfBe5pVQayahgu3a2K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287288; c=relaxed/simple;
	bh=JYMGTgV+V84S3zGh47hfcrq7KdlrCh0v20XsSsUpdOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hqW+DPIC8/JWnxK+51qW0URaSS+C6zw7iTEnJnm4i/HB/af3MVsxUWs60N8luk3D294l1sOPAFjXKN3oL48nFT5tFxJdRw8CsDVyvDyZJueGy/TjYahTZgExWZT3OgpW5asD0Rttso7ylpHT7kIDH/WMnsyVq8GoSgPSme/0l1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Mlk4oIRe; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Mlk4oIRe"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so2338875e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790287284; x=1790892084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rI7xlaCb6dszd5Hc5HrUUMLQKgpiUexV2xDY/RII4IU=;
        b=Mlk4oIRe9k1qFVrhRluswQ0t25DDFoJ4c5lq7BOQOtXWhPSAswgmSpk+zQOQThoEl5
         uDrkLSlFP1NJJuMqfEE8nszKd7uUfxizPjMPi5zFuPQcsEIdvwW5cfkEl85hhhfEuLgR
         Md6klDmxdhbkaXPu5xg7/S8n/fuOBTgxJ2Zgn5Mh3eJQ5mx5p+waS7oPjGOe7xdJdG8J
         ZNluk2YYqT2tVMT+W9zZbZg7EmpQIq1nIlcK0flHkXiZctZHDEcgALCptWcTobWYkzbN
         K08kjv4i0nF+krXi8DXxVp5dsmSlNQjKtClgREYwYLLg8dVeyKOYIKK/0LxovxdC88gp
         FHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287284; x=1790892084;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rI7xlaCb6dszd5Hc5HrUUMLQKgpiUexV2xDY/RII4IU=;
        b=BDmU0vDO74qFA2+I9zOPJ20EFWHoG3H26DokKj9I1McIkq3iOmzX8pxgMdBPb+lYvO
         OGH8J2FKjYwrBK4uQiLwdo2OxmKPkJxmT9aWdO5jaLRWFYkGRqeV0J9uDpbUgB7iSRJ2
         SGMigwkkCmDPFKsczNm1Af6g5byAYOrYPYmfRRKK8tZWLXVUm9Qxk4wNjHBhSIxZ1Bj0
         ag6px/lEwWIo9CWU1LRa8ouk9oB0sI+Qk0/Tc8FwLKzrQ8eojGDcK7Ttx92+5+utK1jW
         n2riqEhLbbBFzIRMX+HFSHSFqvBRd5cNsd6n5TtnrEP9Kh5M78hT2yLHbt55m6PCxRic
         1lKg==
X-Forwarded-Encrypted: i=1; AKwUvBw43eRopydC6mdp433P8gMbpqNO7SYrO05ItjpSrcTdWsTl/r0dlLqaJedL2bZ06L0MZg0jQ5u++gjIg0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++khlfpJ6tNKfXqredHbIu4sguUwAN+r+QNvO4G7J8ozHhMqxaY7
	fl6HgZPysgQlOvPbEFfeZXPgLb7LT5leV9b4NsIaIgFy+bXGyV3pvHJYxGeXey7ylFk=
X-Gm-Gg: AYBFou1ae6KdGL+xPZPn4Dp4dudGvxO2/NuGYuf6cqpEUYQcwDTceSTvR7GLpZy0jkp
	o4PKUuZDfLIDo8TObVSLU+B1vY67GVCuA7GYNkCWlSXsV7uHh7BGa11cqUJ0ZiXLrvS9SRFD3Ak
	wqMuhzYegPtDiMyX8jD/1lku3K1R3HZUK36jVRP6lXCCx+XhPQZXnoZr+UVl/8yjm/Nkw2HmQF4
	CEQa9FHLPsUTdKWac8h/SZY2rI0CUTiPayMpuuOtPxCy0Peo0n1kYnozoCegyHrHNjsfHI+sUW1
	wqSEDZDkYuCgQ/dw50h9TXhZSuZSTWZnB2KiY4DF6ZAd5dImLW8EbD/leqLHtJMroZp2thZIa1S
	RUTpsbz8eyQ6B7YwYyw+M0BgSazIRd5sGRFlJgZiuXd2Rbf4c/8CopNSxx8DdcZXdfnHWyt1r4z
	eo6qXNtD1/XSUiBwdq8snSpW1Gqu5t5ocHIKTyKUm7TF5B5kPtZw==
X-Received: by 2002:a05:600c:1d06:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fe7bcc25dmr57484695e9.31.1790287284491;
        Thu, 24 Sep 2026 15:01:24 -0700 (PDT)
Received: from remote-01 ([84.17.55.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee911e9bsm21338675e9.1.2026.09.24.15.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:01:24 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?q?Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?utf-8?q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Frank Wunderlich <frank.wunderlich@linux.dev>,
	Pietro Ameruoso <p.ameruoso@live.it>
Subject: Re: [PATCH RESEND net-next v17 05/10] net: phy: Represent PHY-less
 SFP modules with phy_port
Date: Fri, 25 Sep 2026 01:01:21 +0300
Message-ID: <20260924220121.2129632-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910170103.1029108-6-maxime.chevallier@bootlin.com>
References: <20260910170103.1029108-1-maxime.chevallier@bootlin.com>
 <20260910170103.1029108-6-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Sep 2026 19:00:57 +0200, Maxime Chevallier wrote:=0D
> --- a/include/linux/phy.h=0D
> +++ b/include/linux/phy.h=0D
> [...]=0D
> @@ -724,6 +727,7 @@ struct phy_device {=0D
>  	unsigned irq_rerun:1;=0D
>  =0D
>  	unsigned default_timestamp:1;=0D
> +	unsigned has_sfp_mod_phy:1;=0D
=0D
has_sfp_mod_phy lands in the same word as interrupts, irq_suspended and=0D
irq_rerun. It is written from the SFP state machine under rtnl, while=0D
irq_rerun is written from phy_interrupt(), so one update can undo the=0D
other. A plain bool next to sfp_bus_attached would avoid sharing the=0D
word.=0D
=0D
Aleksei=0D
