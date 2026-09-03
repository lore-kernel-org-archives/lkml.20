Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD3451068
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439021; cv=none; b=PaxJOlSSJwHnWCn2QRKP9maQXLJQh0rs6NKYBWIx9lYLhFqWfqyi2SlPndf6jS4mHihf6zZszhEV4AOYXXPj5exdqh9hstNLs7e4PfsCC4t6BrUf2ZHjWiRpKyLbHv867F/20PUgnT/iDV5wcJqJpVkDC5e7y5S0P6jReT03bjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439021; c=relaxed/simple;
	bh=9QRth4a5u37wDzisjjIulmQr2wC9EG52Fv0U2cVh9h0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kv+h46RYh8HRcOPpWsXNJPUB3QeCGih4b6hfPhoWCR5vU/ZygRwFnTAXT34ekltCPFCItUb11DtI5SGtlfr9tIuTOTzVpSVl3T6FwzrX0AaAH1R8XuiOkxLim+oKQTRtwZF0ynR99+g1WqZl8L09SjTvXA8SE+54lKFrIK6M88M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=QPllLDtW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="QPllLDtW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so2257685e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439014; x=1789043814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wd071ju3O6nFMLZPxIJUW/f01EIUe1MklVResj1uZjo=;
        b=QPllLDtWY72Bt8XoKKau6BPrbAAiarmuqE1rHwjVVlbgTvxFpQe67RlWZZ64c7SPZZ
         k7E6r0Y5EUAB9fgNROoAIVdjeRdR7IWPfqUdUw1JJXhOraJZNCvZj67lu+5F6b/atXPC
         YB/agWyHWoINGgWhcoLEB2ClJJt/IbxhJcJmHXQPWA5gF9eGQsf2R3cT6FI9rW8IAahp
         AeVnwHxkZkb51Hwhjkp4Zof22XfGzyQP7mFzwMXgU8Xpl6NnS1/lczp1aQkfRTsy0eIY
         BtQwGkQHiBfg6yggYFR9lnfIfSqpgXSquHRsd4zHKCGP6dBZVRM6p/PV2kgLJDBQmlcW
         yOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439014; x=1789043814;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wd071ju3O6nFMLZPxIJUW/f01EIUe1MklVResj1uZjo=;
        b=V1S2ADQtS6iWu+Gwui09etcYC/oBYo4Plf/smFbGaus89TDS9t5BteSp+Kvk1HaMko
         RlZ3Uroj248hHR5opGwYmFWKoe8uCtDROB7ct7yEocQ2spEnJBpJasE1X6pti4x7Dgm/
         gETG3K7J8X4S8ln0JVdkcEkWXAHiCaY/EP7pf3HCPzDCqV4RiByWOMk69yfyXg09o5JR
         vnQ/qOGYx8hnjYxJpHFa4HhMC5GXy3hBMtv75bEzxUzJCfS7XUy9I8mAuA5akGqO54DU
         x2fAB7a8eo8WsbZl+wX870M/WSJ6VjCR7atwABTDpXV7o/qr/zeIolBq+vzuBCS/IfUK
         5qnA==
X-Forwarded-Encrypted: i=1; AKwUvBxKSI/yn/oFe0aJUSJjkx8HTDFy7NWeenoyu5LqYEiU8/d4wwJpYT2TTJG2rWBmZLE1qKglUYqwjzrbpw4=@vger.kernel.org
X-Gm-Message-State: AFuF++kqtdHR3+os8JAc8koIDlJUnORmo4fJRWILHYq5QQCJLebr+hPQ
	gioyEGwTL+ZHnF6Hkxx4aq+BfN+GmrCfP6wWKLItGSqKk0Vk7phtsE6G+b1aNErNQWg=
X-Gm-Gg: AYBFou3WCxfN/o4LwQOriGhFa91SrArvduW/UNdfLXYDDUvX3f+6YwOsv+9YO4u/8uG
	PgJ2nAoHiu2CtqCVoGSGKzO9oK8Kh7F/I0KeEnnH4o/zbPd4DNNRuKWLUARW2jrSD9c1DXsXyJc
	9mJkl/PyfL4SJxIKE3y4qcScVuBXLuZ4zCEJI1BjAi+IvZjDA6NUh641eniQ6DliCG5OBS5qpW9
	BtNnyVnGYyO5FAMSvIRMU1lCHNHCdIhwrCvdAEGO4peoMGtnpp1zZU8/YlXRDP1SyDNb5E6xDOx
	6c+StwzlYTVy05gpS5szmkfjbe3NaypWl0Dyb1M6DUdUVG3wOmEtmkKysCGJf8LHyMLYwc7VbKB
	W7WxTJmovy90rVmIBE5ouvBxkRRwdbOCZpwlA2izz+jMl4pY9/VcFe3mFu9nrXowcNgCY5i3Wj0
	UHgL7qkYeUvfMR6XvOguwy84C6x0uWsTrqcOJd6XocZCZNG+vOAR0=
X-Received: by 2002:a05:600c:c490:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49ce581f1ccmr175363685e9.13.1788439014414;
        Thu, 03 Sep 2026 05:36:54 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2edfsm13223248f8f.23.2026.09.03.05.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:54 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Th\u00e9o Lebrun" <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] net: macb: fix the link speed the taprio setup reads
Date: Thu,  3 Sep 2026 12:36:50 +0000
Message-ID: <20260903123652.23900-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two small fixes in macb_taprio_setup_replace(), both in how it obtains
the link speed it scales the schedule with.

The first: it hands phylink_ethtool_ksettings_get() a stack variable
it never zeroed, while phylink fills only what the link mode provides
and even reads one field back from the caller. The second: the speed
check is written as "<= 0" on a u32, so SPEED_UNKNOWN passes it and
turns into a 1 ns hardware limit that every entry then exceeds.

Compile-tested against net; the driver has no test surface, and no
macb board here.

---
v2: both commit messages rewritten to name the uninitialised-memory
    case first and the link-down case as the one that happens; the
    grown declaration keeps reverse xmas tree order; the error text is
    "Invalid speed %d, link-down?" (Théo Lebrun). ethtool_validate_speed()
    was considered for the check and does not fit: it accepts
    SPEED_UNKNOWN by definition, which is exactly the value patch 2
    rejects (Andrew Lunn).
    https://lore.kernel.org/netdev/20260902080528.2211468-1-f@lex.la/


Aleksei Sviridkin (2):
  net: macb: zero the link settings taprio reads back
  net: macb: reject an unknown link speed in the taprio setup

 drivers/net/ethernet/cadence/macb_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.53.0

