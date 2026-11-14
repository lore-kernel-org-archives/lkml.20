Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632564;
	b=qrpgM9DLceIPgOA5KJvMePl+dF3WD6FM1sneTb3O8YgMRFyZTsporN5s9oR+9odK8mdl
	 Dapzx97zwFPo0hjSXyd5Wzb4Hs5xl6oVHjWpFEaIMGmFcik+qhFa0Ow2VmmYsKRV+Ct17
	 z96iHDLiB4dTy1DQ+pyIpzTHDhdofLZP2BwIAD9bbiK6WgDcR/jp1iq5BCIzalL74DBaD
	 HzOObp7diVyyH6iW2kTy0DSVb1E18VJGCDxNbtQ6yg7q+2uCSYJucBCKEnMbzWaUbHbJ2
	 5mTG+0f8I3SyMb6F75ZwqeQ9TpUnbdZWfjvVtyhjdaRpKhkZw9Jr6J4TY3iHedG2yWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632564;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xTbCP+YKu9nQUSdthSEZBjag7EgR8WQkPX0xvCC1olk=;
	b=0uY8RiV+qc2jsw5oqu+ak2TwCpna45Pt4hvq5+IKYNwlLfOcOM/9Ntsfp+But7wJ542L
	 JbpF57+vjtNord85EpOWzD5r+tdyaek1HGo55jOVkH0nPNGbPqE2c8HQ7X7PhLU9g5wnA
	 TLu3eCzOzzSsHmlv9TtIdQxiHP3JFqu9YEIHA2gVJNIDgAzvqz+nZHNkruVvrjdZHsgwp
	 9r4wNUhwP63pjQBqYQlWpa6DzbX6GmkiHylpNylsP8VjHO7qxOW/aPWPoQhtEhC0t3Gn/
	 6/NW9eQc/gxsApRk3ib6bkkmC8/58ChQ7HuRFYIlzCw3HUSyiFpISfhMDgeKfI38xgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=miJIMTj2;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D281606A889;
	Sat, 14 Nov 2026 05:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D281606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=miJIMTj2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632562;
	bh=0r7U5Yg6sSGfBgWp0m+HU9sSss4Q+sJk0BLGFEcJOgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=miJIMTj2t3lScQjMk3opzUCdWer8efaScumrg+B4yeufIM+RosJDVVBfgm6x71N0P
	 m92Wk0hhumGVYYr0UUZ93h99tYOmVoMq8dELAXRgJGwOTIPU4UvmP0Y8h4+KyyU9J2
	 MQeFvVYtA39WLrvEvKlZoDxPC0MClvhxJ634PVdIWiwbvZKqEm0pG/21Q1iSmP0c1L
	 rxoMGUOZKvZlxVnToO6sAD4n7A+8GHWM49mBnHWxbPeLBtmO33Cejfwy+Bt0YcefXK
	 bN0UxghoZZXUv6kfRLtOP3nBBbOJODRQwAmNDKFGruc8fqggNjMAp1uA2U/QLGa+ea
	 JP0oQkl/V/p+Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BEC417E0FCC;
	Sat, 14 Nov 2026 06:02:42 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2716F480065; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:51 +0100
Subject: [PATCH v12 18/23] drm/bridge: synopsys: dw-dp: Drop useless
 reservation of first slot
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-18-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=0r7U5Yg6sSGfBgWp0m+HU9sSss4Q+sJk0BLGFEcJOgY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wfQ6i3dgeRXOjgQnMgr9bqJmKz48UtxY
 dfrDyRbacbwIokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaRXAP/ipivOXI9FeMImp3dNekh6NiWVgRlbRPC0pN9hQtqAvSu/ibaioKHjziPePkunrdFFR
 jVqhmn8IMUqZCCD7GNTFYwVEweMojWi8DiwjaJIjNn06QiqajTaLAFTFtoJSnH6hCB0DAIWrqCQ
 JbdFEEDNNt8lMfhZvf/gzcc2y3rQna7qcI+jcCgPr9hUfhamH+rsclYxANtXiCSmA2ybKD2m2aq
 d27QGjz/KPYnnJ8k82sg57687V5AtlbU50ahzbgT2ZRYaufagZZ/n4Pkg+JWnmtgsBN6xQFVg0h
 gBw0QoRCYU8PTOmw3ur/MomSGvqhbQ5mxnok5AQD62zLbiYss/7iy3cF8LIAdXeqSZiZuydxEU8
 E2ifc4X7FdyKK5spG63s6tkQculEd5wGFPYoGBNpGUVPmjjNOFm4CwfQfkeGqB1jm0oSvurvTiD
 U3CbkhIadUI0/LRQaES7PrXY1eyzgOAoUxw9hcTpN/dZMQC4I007ng9kgVgMDoFHNPZ3a2IAPGo
 sz0tXcqpbQt7V0rfZ9XPY8vtKRu/0XpwOm5PbhIumivzln6n42iNsQ0W2DPWNNs9K1D2+G/itjX
 DcJ72TZabBlNSv1NAK/JpyspP139vyksmI8+Qj9m/LY30MPCTZMqTTytlPOGtdc0OABrwADx6Db
 xMmJzwJCryq/iyLkblv4rkA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The origin of this reservation is unclear, but it is a problem in the
atomic_enable code since it potentially races with the audio SDP
reservation once that feature is added. I suppose it was either meant to
be bitmap_zero(), but that is obviously not needed (and would also be a
problem for audio support) or some left-over development code before the
VSC SDP slot was allocated automatically.

From my tests SDP slot 0 works fine and can be used. If SDP slot 0
really needs to be reserved for some reason, the bit should be set in
the probe function to ensure there are no race conditions.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index cd1499ae449e..1ae5c842a782 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1712,9 +1712,6 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
-	scoped_guard(mutex, &dp->sdp_lock)
-		set_bit(0, dp->sdp_reg_bank);
-
 	ret = dw_dp_link_enable(dp);
 	if (ret < 0) {
 		dev_err(dp->dev, "failed to enable link: %d\n", ret);

-- 
2.53.0

