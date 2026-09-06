Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6CC3C063F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716174; cv=none; b=O2vuxOvniFKzHjmyG/JPrlEE9tXI9w9EGpEpImvKHOWizOFDUPvHNdb292BRc58dl2ReljMlB+kztjJdT71vRCEaaxvMN6HotnJrSOj0Y5O90HqItiXsmWw1zrJtY7zgNKbKC4tgLKObxMrOKpgEDoi8g+O/yk2V9wQQ3utB4lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716174; c=relaxed/simple;
	bh=3/zJNHWWWtK/uof2pKE8ZIxAIpYgy2Ej9DgxfoSv1Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q95eJ3GQPZ50dr7I4fEBE/ejjtAaUOlPmf65EvhFXbw+aBZnQHGPpC2tpp31Y55Xp4yPhi3sk631wziAajLKMYeKjIjA5jKJKVQIR9ncODSr7CLAE15IcGzu3ahzxaIZOsUfGPIiyKMTe+M2svLg/xzpd7l+h0Yj9bO7rbuVSys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCLMB+C8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCLMB+C8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49954b88fffso19966695e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788716170; x=1789320970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2ehGMYuyDOWYVENzei92wq0tc1bXeRoq6FhwwzkxNU=;
        b=hCLMB+C8jpSFl3FQNMOEuK5QsqMofOEW8CW+QK3+1Oeqo7TpzbGpvjppKbunke8V30
         PTXdTccGebnP0y6Ubr8bpWuxAXwcSqfsrembXSnR42JvySC6BWYz4eYufHxI1V1fyG3D
         uYdyNJldoqur5kGUHTrccxSOT/uaY93K5IbDC22tw6YPVrI4Av/Oh4xeYLkWNu4Rjclm
         F/ElFUstP2McpAKet2Thod7hkOIx2YLHK8AsbBUydOz3y64B2iATYf75GGMPcRoRPpQZ
         K53hzipwReaeaxOMXfNi6yTGnAb/38iHJ19II8A80IderTQn671vPIHtS5zst+gsfbsY
         LlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716170; x=1789320970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2ehGMYuyDOWYVENzei92wq0tc1bXeRoq6FhwwzkxNU=;
        b=odz/hoq4OJQfapVmD101FVAH2OKnjsJixtlVhmgIG5gW2JgZ8Rk//7eHBafDsq/TMe
         R1/uY9YA0AfyW9O9DhCVJxdvEH3qy36E5HoRVCMneJKfwSaChGza6TbQX6ZARFDhbJCT
         6YXMaYc3izBrSoNpHuhRTVdFfEvsZtWVyrYHUPfePG6xDBpKXPM2wcV+GSmwmpfLIvqY
         chJnIWx8Cjv/4hdtaQg0005lwLwxW3Ut7JXA5q0yPm+YcXC/zO4RsulaYI3kkt5TuKWN
         OD7NCr1zQ6rYPtwGMuNgE0jXSNqFWvvSJenqUk1LzcSjJS4SXbowZvQ3iNPGF5Ak6656
         AAkw==
X-Forwarded-Encrypted: i=1; AKwUvBxsAN1LAo2o5oU+Cz+QOA9Ng2zEM8pe/QuvroX0jIo4uVo9C46Q3+vAmJS9AWEe/z7rzBXbq3c9JkKJAt8=@vger.kernel.org
X-Gm-Message-State: AFuF++mKakBhJ7YBnMMk6Z3jjHI2biUfN+yKBlu72ZCaDeeP32a7eFFf
	5GIKyfMiAaAzk/Gduo3ADKJxD/6ZuAc2UXq0vlOPG3spQF0qhi47+uQ=
X-Gm-Gg: AYBFou1AC13IJwJa5iRYWfZrIwu1w3e3+kHj+2yGd0GUBEfEIZCwIzuW1GHmL5LQPQ1
	Yo6x8WPrILKLdoZTeix1/8fx7OXe/0XerRQbnW6XQYncUV7GNSTtY4plWmJ2t40m7pZeB5mXerF
	2/eBjzweZWu4SXzuVXQPiZ2/99QXeSlWsItC9VZnUSeR6y/MeHSqTdPoDhoyHqqBVs5ai/W+IRI
	QF25ky+pB+k8PPabjZmMmGsHDcl7O4kx6lxUXQhJOAhlePV54GZxy9aY3AyNbt7J0UVv5mhKsW7
	gAFxVbfZysYa4krUn/XZUC5OrPOu45OD3piJWgB0p3JgmYFjQdmQTgpSPtpdnrcTedK4VYdIjbY
	ghcaFpyDZJpinsrbJjIa8dmFenlwAiKDLKpnT/V7ge37UIrbHKC5BKuM6iuouD+N/OEaQznaaPe
	wXgKhMUssw/8xa6rnlPfyCEOrqPk/vxves3bu0x0lqPni/NQuGxHk=
X-Received: by 2002:a05:600c:3e1a:b0:49c:fc6c:bdff with SMTP id 5b1f17b1804b1-49cfc6cc078mr141942975e9.22.1788716169788;
        Sun, 06 Sep 2026 10:36:09 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18857331f8f.13.2026.09.06.10.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:36:09 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: netdev@vger.kernel.org
Cc: Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: phy: air_en8811h: simplify en8811h_probe() trailing return
Date: Sun,  6 Sep 2026 20:35:57 +0100
Message-ID: <20260906193557.35115-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

en8811h_clk_provider_setup() is now the last statement in the
function, so the intermediate "if (ret) return ret; return 0;" is
redundant.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/phy/air_en8811h.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index ec7c44ca68e7..99221ee87977 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -1168,11 +1168,7 @@ static int en8811h_probe(struct phy_device *phydev)
 
 	priv->phydev = phydev;
 	/* Co-Clock Output */
-	ret = en8811h_clk_provider_setup(&phydev->mdio.dev, &priv->hw);
-	if (ret)
-		return ret;
-
-	return 0;
+	return en8811h_clk_provider_setup(&phydev->mdio.dev, &priv->hw);
 }
 
 static int an8811hb_config_serdes_polarity(struct phy_device *phydev)
-- 
2.55.0

