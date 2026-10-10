Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E04B8291
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661507; cv=none; b=Rg3Vifk0W/1X3W/H8jDuYBD4kgnAmqkGHdHsa52DTj/qWjf8ASVi1jaRPX+kE+pyQsKTq0QSBjlv8mb9IDhe32d2+zxMa32WOEuEQhl3nEBi9CEpJGeGUZqyNLddRjsIBuRB2OPngVzMHaW6uNgmj+nKWi/vo1l0PidnoyAmbQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661507; c=relaxed/simple;
	bh=jBWuGD2YqZU0E2e6O/mVHlk6Lcec7KbBe/dsJotPZqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUYWUfCfcKSNNeQKcLS4hGBA0OTfCfB7+V/p0O7hLlJ9xxVSp9yBsQsfvrTyBo5+VY5dXY71y/SMyLde5dQQQXmU/TvpTtR21Et1BpoDsn/0Pv0hQZL9kzxwTds45++Z/2Z3cAYGGmeR5kOYn6v85zIDV2rk+NPX4U8J/SqwIz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=SxVrH9Ug; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="SxVrH9Ug"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a168355946so3918275e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791661504; x=1792266304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBWuGD2YqZU0E2e6O/mVHlk6Lcec7KbBe/dsJotPZqY=;
        b=SxVrH9UgkmgMBmm71be1Hp9yPkJh6wNDiKPmxnCijnMEjXuFHFR5Rtjp/kvOWRZ1B2
         nzpNXW9gDxdiu/vMImTJinNWOYuoinCzdMNyLdBrS37Z/R3bO/gLy6FZb0AkCaGgBBzf
         Vsz7BHi9Mp3EOT/10OULKgeRheq5AUHPyKVJT01CUJRtP8c2iKPm0S79GVv5CH0alGB5
         jkh7Fk22tibJtNJsRpzQoFop2wW9uQj+VkZRLASSPza9eh+5QKlLLOxHtNDAkJhAGbaL
         9JTVzJx0giyBaCd0S/aLOAfnL4dcNpQDkPtDK0pHECcV5+2b0soeK+ULDsmxBcj9fQip
         CSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791661504; x=1792266304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jBWuGD2YqZU0E2e6O/mVHlk6Lcec7KbBe/dsJotPZqY=;
        b=RObriyXEV/MIhg9hwLyYHsiYdNup1X774fGCZEYd2wJxQ73YxiE5ZvTazwgW8QrzC5
         TVyvXlCLdVTFNCE9Qv6gpSEx1x/gEfCtr46t3380Y+o2Es3wwWRtMC92lCkkitg+WarL
         3dkmHbOdA6y6bF/ArUw1HG9KMnIe/39eoUtn798+3jWhqEt0L2stQP5Ynnr+x4fUuRQu
         p1Nq3E1uQdtf68T+5zza5wfguTX1qQhQ8/nGTJVpO2hUhPBLTa7/9sP7bIWkezmNTbIu
         w959P8j/7LPzhLNIYiCxdnBFKcLRzIVn6XwHU76KOj1e31nup/EITuykYm70zALUXnfP
         l6TA==
X-Forwarded-Encrypted: i=1; AKwUvByQ2YSmxbyOpYWsoVgD3tMby7fjOpizXuV0p99XAYOJ37KNqTVQHi4Hmkb5RY9lmKK5nP4w6RT42nil2rU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmEFQ28LJsf85tSFKOEHfHyTLDF02gFn9BF9lSrCJjVSi+KAm1
	3XY3Ih9PYB4naW4XoAVZbTGnd37mNs9TrGcF6tP6fjDyCAt3kOliWXyreyu/BnvQ1jM=
X-Gm-Gg: AYBFou28cEvwu3zqp+bZhFMwqBBznFK5dxq3RG39SB6KCpptZgci8CarUSHPY4zWXPJ
	FJENWPeCKdh405QfoFF/Ltda0XpyiySDMGAlrs8EKqtfhgDdBStOx2srZIEG3c6odszCQellkAK
	1xZUzYGf7e5yL+cn6TCsBPx45uUB5cYAUTh2/z54AtFhkpGh6NzEDWMe39T0+BAhLsWBx0DAPZB
	SqXV/FZaGNSwNhG7a7RWh1Hz0/E/g887QMuwFsc+uwgmFvDhvB4QzyVP08RWw8b6ePOHaI46RrD
	UzEL/xW3jr6kzswUeY7+oiL4CjnoPl0wxg9Xw3IALD2lrCOMtJz2GaWftOGWjX1LWysfKDsze9W
	pWfrF6wt6cnGvd8xA5qrISiTM9XJVY8pqxnyvb8QPh20h7a1qDlzqVkzqJcu04KO4IOUhRSSE5Q
	gDsC76gDW7CKDUypl9eDn5mYLggLumt/VDToRXGEdXBe9G+lW5ksRkqQoQNu4c
X-Received: by 2002:a05:600c:3b0a:b0:4a0:1e68:d28d with SMTP id 5b1f17b1804b1-4a18e4a177cmr99986885e9.6.1791661504056;
        Sat, 10 Oct 2026 12:45:04 -0700 (PDT)
Received: from remote-01 ([84.17.55.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm151457265e9.13.2026.10.10.12.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:45:03 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v5 4/4] net: phy: make an unbind wait for the attached consumer to detach
Date: Sat, 10 Oct 2026 22:44:58 +0300
Message-ID: <20261010194458.2943738-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009180551.1234107-5-f@lex.la>
References: <20261009180551.1234107-5-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Russell,

Sashiko's review of this patch showed that waiting in phy_remove() for
the consumer to detach can hang: on the unbinding thread itself through
device links, and with the device lock held across reboot and suspend.

For v6 I would rather not wait. phy_remove() would call back into the
consumer under rtnl, and phylink would answer with
phylink_disconnect_phy(), the path it already takes when an SFP module
with a PHY goes away. Consumers without the callback keep today's
behaviour.

Is a callback from phylib into phylink like this acceptable to you, or
would you rather see it shaped differently?

Aleksei

pw-bot: cr
