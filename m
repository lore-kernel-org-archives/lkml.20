Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3204C4AA03C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683964; cv=none; b=dBjlluUlwkaHzP6FVF4G8S9cfIJMwxT3X1XBghGyTG0Wa6YdMwq7klpsfkldwTmiImb0D3JfAq8EEvZ7m99V7lu5uuSJdRt39NmfDBU1KPqWTPiG+lj4cSztpJGtR/3HHk9THLOMsSgQGpbMS7CCnsUNp7n3Ur5/68KBWaL0gzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683964; c=relaxed/simple;
	bh=l9/NyfXKy1WrGYxW/ylBLHr+m63MzpB0UkpPW7lkV6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmXMSCfPLY2XY54+HFnmttTr++ekGPkr5Cp6gP5gaHki60cOlX8Nk3vBp4IWbhHWa/eftwxSRjKpKALmVc8vgfdjztYpJziS1QtrMTjpXhFpLQI8ZrG9Xfw4uJvLQMCOv6e6Z40nApqBdhrGkv3vSEcK3p6Lryp1ju93vhHYdOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz69Ixa/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz69Ixa/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so1008275e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683959; x=1790288759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrlZYOE4Tb+zUOHoD48b//tG3mcCRvsKdsWOXCdCJnk=;
        b=hz69Ixa/cGbfn71itYZOrfQZOMPGdnB1BZSeuPuSOlLeWGXaMg/awb/Wh/BrBqS2gK
         g1cQPFIste/CC3P8bbZAffZR9PVncVTtxQYVEOMQmF0MTGiZsFZVBZzGzG6VAk3GxsIp
         7aI+WEWzzT6nb9I2pjeHtvjyQ4xG4uXwppp/g9NgSuxncL1krzY5yZF9TY6FwlJ25dW8
         B+AJGRUwh9BXp7ju9EII30mtDs2IaagPMnP2qtubi6gAQWm8JdTWh9JBxLkB8uNC5MGH
         Y7k8jzRVKquK1MymytDQ8d/vcimjeC439d0K4GkyqepbepuIRCgLoykwXzzXURwccAn5
         aS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683959; x=1790288759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrlZYOE4Tb+zUOHoD48b//tG3mcCRvsKdsWOXCdCJnk=;
        b=KsrxMg189DDSIFa7ZS2B8dFAb2uc0sxvrycMEROnnGFJgCoaMqu19EBbgIrOIeHUiL
         xucrvUe+eptHIHhtdFkvDOLC5GSfiyGnbn51f4NVp9SrbPMlCACeKP1uwl2qfRiQImE9
         1HOnhfiwEVQl9aErLDsAwRULIXYVwfsLOLBn1xFiho23rN0Bx0FtflKWHeZJQ0y8Qit8
         owh7ZmV8XhlD5luCjSCHUOe1qEzZ3BkpWiZkwhe1W0DMvTN+7wKjvuBUch+zfzOPtHgM
         J03ty6AWl4SFzQcX4Sfo3gX2zKn3qkcvybPFHla3ChXmh4ZDRraY2brMzI5Hobocr9e0
         XdbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxo0Tg24jcUBiUm3Tez+YfdLfPorcNOK3VHkF8ZnjtD225hyNfP8eUtrPHtvg1uT7fRZo8DPiOx/ItgVBE=@vger.kernel.org
X-Gm-Message-State: AFuF++kcyy+w+m3LkqCNK6FGta7Fj24mMF8KVavCHlwXftC/F8Vb5wZr
	+tAPD7I0aCHhwFkcdMpUWyHkdw2KcE4DSZE7NDrk7HjRMyVriOS0acbj
X-Gm-Gg: AYBFou36e7J7d0lHCOWEJRuEZP68W9wDoqAQxF9SiKr8BdUbMJnFdH82Sd4IkHqyHgz
	zZdVIVyuWQrX9k05n/GnZPA0CTlTwWQaUvAMsn7DZ8u7zo52/rp6NqDlzId/Wiaq3eqcAan7g1S
	T2bg0GMnphDBPvIl6Qfrdd4rKAYCTzoKiWVqkgQLjUcVpU6ibiwl1e0VyKp8PyBueqzbrs4gwpb
	5RA2whZg4S71aPHzFLGZNkhEQIk6ZJHKH4RQq7aYrcIYaGbArGRWCYl1Fb1c8cQSYm0Kg138/lm
	a390nUIvlaHjlIMJj3BgJtvmtUKGZniM8iXpB1NRE+JMIs8C3GjGsvdw1wqH0Y8szjpNPFGL+xL
	Y0DrW6eUT2H72bLz67HaeneMuFmDGOXNBGeioh3my1OKLW7Ev8An0dM6Ea8Od3P6pVk3RlvAHJq
	ut8S7jxobEWwVulx/52KDFx0/bz8DgI7A4Ylp9e8uEYFAsIeHiNvNU2iZSDQbJphkiV8RUx0Ebe
	UaRtKJjw98QZjcH0NoZdu/8IbkFW5nbCIQ7C+pBUnf3eYj6pyJDwHtkfZcUR3r7aFyeJGZCvR4h
	Es1HTPFQPQ4Pv1iBaykQUg==
X-Received: by 2002:a05:600c:3b17:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49fc5737b80mr3154795e9.18.1789683958822;
        Thu, 17 Sep 2026 15:25:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:25:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Fri, 18 Sep 2026 00:25:42 +0200
Message-ID: <cover.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

v2->v3:
 - Fixed reset-gpio polarity

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3

