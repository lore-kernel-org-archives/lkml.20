Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAA367F2F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885004; cv=none; b=jBrnzwjOB3sD4QARJNMU//3ackrHW9nb1YBili0lSW3tt0Ijlo5n1cpJXkNq/mco+zsYleGPgTaM4nBslc8agqijNwzyBxdhIdG2zT/IOGyDRWPVwe3nL1tENCnIKyjRJbqHpODcP5OrrIzH6DtyWVWb8be5qR0i6QPewuQYoY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885004; c=relaxed/simple;
	bh=zyhhR75FYsJ7CI8Lb1oLs548FMMbMQZmnJj+IN0E3nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIf0AkP63a7PL81exv0+PZYbUHD/qUIiMcuhUdMmVUo7M27vPEFDDTw/FKCurr6tgj+M6IQL7FJyG0+XRLol5hOXSEqJdMHpP0MO/aApBDdxrfbu/kee1px6wixjhvM8UCH5cY55w6d16VxzpA3OqhXT8MTEkpm2X9gCc8Tj3VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALkwWEC0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALkwWEC0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843703c170so338862f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885000; x=1789489800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emj4cn58BmwUvuEYrkn19RQf/kNhJ8y8Fx3ptxT/4jw=;
        b=ALkwWEC0tzySsfZX5cggYjdv/Pwnq8PxitOdGQh27zdjZ+l2ycmRfUDMIMQfP/RuK1
         ASOQwwLitMWG6CcR1bjxRDoLyz9MtfsLuJha8SCUIcQmOofUM7HYtHLJGNHK4vKtcnCZ
         OFtKvaldRz0XykL/z6UZ7CNIEpIUiYPht8ivNrVrl9EXPeAJTp7FX5yDSDFKPfPdN9nD
         j1S1e7WLqfuJYVZ1bq9ENh5sxwh4bcgMklKv7Higral+0bZM/+r153Ojk2e4CHt16bi5
         jujUsz3ChMO7jBnVryqbm2tTv2V00gNGN49E40SvV6EuhjY84Qjzya8w1UqjKTwSulfv
         Dplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885000; x=1789489800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=emj4cn58BmwUvuEYrkn19RQf/kNhJ8y8Fx3ptxT/4jw=;
        b=kbB/uxRNzEAqdjHLRgE5kH3d52EWNwJCTVdBrbynZo69t6iW3Cih4Ym3YWXI6y/uaG
         x+hNq7bvf8f/ci1DP3nPqK0IncobDvDgjHOTO08c8G+J68nlm56TlEWH5nvmJkom9WR+
         8QECERlQz5F5i/Sfut6UcCOprPmoHhs4MtAgPPasM/5+0kCW06+VxppkK8R649VMaK7t
         ujrXA0Sk0fzMPrai1xQcUM+OSuCNissNZ5CSJD52/y1vtW7qJ5C+IY8VP6Ur27uqUC9N
         7LYKX4B1BRPIXeCpEWWi2VbXa62zXrt0Y8mcpqdLu6zwRebAsvpt3nlWu2Q0XFlD1MND
         sXHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHmAKPVdnwNHLhLW+0JgPPnrB6WjJvHre0JGh8DdfHJ82uoN71GwfICuGtYC7c4UWjziI6o2J4uRFhQEU=@vger.kernel.org
X-Gm-Message-State: AFuF++lRovYIOfGQS6nKsV53stmR8WAddNX9QyKQ5L3wm/4XuoqcZOnB
	V5uf//S4UHh8lK5tdHO5GfQBLQptsPsUpBsFMkX6pXbe4cgFxX0H0KSv8GscWu+H
X-Gm-Gg: AYBFou07zbVHp3BhBkJ9R72bKQ4HA9vlM5y+Cuxcr1T1Vz6Tb02PEw99QHW2m8tD/Fm
	IojyF+L3lfTkr2WFpLKaAC2j0fZbf6FQGpQMmF55iJOBqeET+WWb0xATuJJfSm0bAtYwmzH3Isk
	XEYsFwdgtGwMeBTee3E/9qW3GbgSBkNdTkFfcktnTIQswycEr8rN8blzlcd8dS/WSWEMp82Yvbw
	PK43RgmzrjLQoUNDsmS+vYkxke7W11c5nNWDiGgKuFikvPHScBCdgvI031N2EfUsTjLOXMMPhX3
	AIRLb1j4RPeUR0/Abr0PtJgU9WFPl6OwHlwGiVo0fIDiQifSlvSFC9yGzv5BP18tyGdM7JUEAhM
	7F9HyeFOxKbXdMW5u4yJGLW5UXcfRNh6aU2kCl06c3vEB6tjnSjNLylT/T0HlmU5TG1zuLjiiQ+
	PJz8uP23uus3+FTPOw6BCgPqhUq1uFK2GTs8FOJLNRmCwBpgQKfPeLb3oMbLBaxsy3zCzGpqeG/
	qyTPh4X7/9fqXYk6OsCy0FngnYiuXuoE0LiOAk02DSJ/oELt1Cc8qGt/j/mn1euAGl6
X-Received: by 2002:a05:600c:c494:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49d010c3969mr205691045e9.0.1788884999944;
        Tue, 08 Sep 2026 09:29:59 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B825D00814606522702B594.dsl.pool.telekom.hu. [2001:4c4e:1b82:5d00:8146:652:2702:b594])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00031c95sm378593345e9.11.2026.09.08.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:29:59 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] phy: rockchip: inno-usb2: ensure PHY is running when clock is requested
Date: Tue,  8 Sep 2026 18:29:28 +0200
Message-ID: <20260908162935.7092-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
References: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus (RK3588)

Repeating the tag here so it is picked up with the patch: I tested this
in your rockchip-devel branch earlier today and reported the details in
[1], but that was in my own bug report thread rather than under the
patch. The code you posted is identical to what I tested, only the base
differs.

Briefly: 4 full s2idle cycles with all four USB 2.0 hosts bound, which
hung every time before and needed a cold reset. The OHCI whose 480 MHz
clock had it as its only user went from "enters ohci_platform_resume and
never returns" to returning 0 after ~20.7 ms, 8 out of 8 resume passes.

One data point for the reviewers here, since it concerns the guard at the
top of the new function:

    if (rphy->phy_cfg->num_ports > 1)
            return 0;

All four entries in rk3588_phy_cfgs[] have num_ports = 1 (0x0000 and
0x4000 as OTG, 0x8000 and 0xc000 as HOST), so the new code does run on
RK3588, including u2phy2 at 0x8000 whose controller is the one that hung
for me. The num_ports = 2 configs are the older SoCs, so the guard costs
RK3588 nothing.

[1] https://lore.kernel.org/all/20260908144245.10700-1-royalnet026@gmail.com/

Igor
