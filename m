Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632463;
	b=sPx/mrSVspekp0D94rq+SaiYqc5g/BZXbv2Cl7sBbIfCVDCOATLe3biL25tUYuWHdpTF
	 IA5u1o/zEbIHgp9spD+nQNFaLYBYlxvpwM6nmJ/l/G8T7jFB6j0g5q+lI302NjSBsNROl
	 +MpqWXQVBpW0ZtbuOYMtu+iRo3B3wVH21TA86e44/lvejNHHAO9T2YrqRRBQr0PNaCni3
	 3c578hasMFNzKyczi3CldgANBpIV/AjI2uTj4Ew47ETUmq7k1kQ5XEqoypuZieuk8NLMU
	 IHzASqbMdeBK1kNdAfZQuy/ky7ZXWzIXJq2uTkyzbsLyOOQMuM6uB9wwmJiK7kz9R7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632463;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+U3SCyKNAEAYmdSpLmyLetCIP4LmLHZ4OH/uMMRkuWk=;
	b=FmI4wH3FL79adpJv7fUJ0mu1bTsSzrL2y8LCe7GGtIkfWiUhvlJDQ8QH8xfhMgPhzgh4
	 anZPTFxMHHzB6ex71Wx0oajiEJ64sP8/auaFGPjgeL9FKqKn+mPrLKpXWRyK6COT0LLki
	 5tgQy1syWMGdJhh0uLHDOxWAEpZqvlLqTx1yIFvjHlmhKEhBjumVpoUWv8pkJWGeHiNjs
	 wbVzpJqJRaewT7uWMNZsjtD3q/LYXAZkBrBorU+2YOplhb8isVMITX5xMJmHwjvBDbfhl
	 cnaLFFrL2vUGsPVeLwlFl8mahwkALjq67sE0M59ieBbxVpLNWhcr6f+Rn4E4XxtKmOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AwU4ZKVz;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8CC60A382B;
	Sat, 14 Nov 2026 05:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A8CC60A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AwU4ZKVz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632457;
	bh=qiTnNJ+ur0YxXmV+nt05zCuHB94myasDkxur83iCFBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AwU4ZKVzF8jDvmTXv5KxJT3byOWTHPEKnoYi6WSFYgThhCO5lb+eDqVrcRoYo0s4R
	 Hvh/djDGXzNlycGOs3cjqzKJ170/Tl1yGyXG7zyHlQPeXawgUNkn/NjWMa2lSAMkM9
	 LUe+g9gJsaDWQZaU3EZ1K08u6AgYSJ7PARRk/VmRVN3w2jeO0k1c9nGknwjVjH1Cnx
	 TUxfdYFr9PFcSTI7Q7eMOyzpW+Z/APqacg8s8Tx2Nju2BMnut36jBNkeGkDnnu5zzV
	 zxF5D7MH/sQCOqi4Il2WCAFNTNrh7rq/hhscIkUwNETgjLXZ+uyWh9iDyCp6w24+Tv
	 d3wVTf/r5QtVg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B0EA17E3BFD;
	Sat, 14 Nov 2026 06:00:57 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2A267480067; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:53 +0100
Subject: [PATCH v12 20/23] drm/bridge: synopsys: dw-dp: Use regmap_set_bits
 in dw_dp_send_sdp
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
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-20-d42d3dc5bdd4@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qiTnNJ+ur0YxXmV+nt05zCuHB94myasDkxur83iCFBk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wf4v07B4qdQilfmkg+Uyh3Lo+yP8VsVu
 FXfwNb9sqBh94kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qa8SoP/0YImbqbgVdXBLzRUNM4BOriNDKJzweEyk9m+MVlwRxd4vZmJA83LzGmYyBEIPK6JHt
 wMytUCYMR5fQXoKZRfFBPP/tIQlULp7XvssuRPFWOYeKTyJ+rpBFObJLVuBo+y9nV0RZkxKlkvy
 7Xl5fZFiBpb0u+lstfbaT2oRI6p9bCdkWHiRB0smPaQMaCtMnr0GNHq+aqciLJH9hz7/R2RaC41
 gBPaJG+rgsABX4CwiOtf3XmxUrjbooR67QaGLYToSjlwnGkzm8vbgoOvOYMxKkcy59hBs/w9ycm
 Dml3mkqBI6ARBh8zrHOXMNijqTwzffvWGnExKDdjlkuoR1VkYJjg42RuTSb1hh3wKGziYE+WBSW
 SCWuhGNHicpZG725GvSpHyz/pEs7ix3rwVZodurDLNi/DUMk5RswimgPkKM3OLBCyI+jZ6yArP+
 FA8M1fJJ3Y3PYTibcQw0jnQnvVVTpGsgGnwr5CCU9UFmATFbbtTBNMcgcVqlRdtj+rTj2gAcl2d
 hBd1wqY3Nz2DPoMrybdTW30frn4GjWuwcN2PU/LOYrJJVfth63EScfz61wZD+KMTFECjzldZNyy
 iQXL3KfF5yxwxXUV9irsNHlGzMTkYVQVGLddwsi0SqDjBqMMADQWVjZJufPFokXipRvNmf4LQiK
 i3f7iiWsSPlAAeJMWzm8sOA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Simplify dw_dp_send_sdp() a little bit by making use of
regmap_set_bits.

No functional change intended.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 6e165e39b1f8..3c10cdb9ca28 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1068,14 +1068,12 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 			     FIELD_PREP(SDP_REGS, get_unaligned_le32(payload)));
 
 	if (sdp->flags & DW_DP_SDP_VERTICAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
-				   EN_VERTICAL_SDP << nr,
-				   EN_VERTICAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+				EN_VERTICAL_SDP << nr);
 
 	if (sdp->flags & DW_DP_SDP_HORIZONTAL_INTERVAL)
-		regmap_update_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
-				   EN_HORIZONTAL_SDP << nr,
-				   EN_HORIZONTAL_SDP << nr);
+		regmap_set_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+				EN_HORIZONTAL_SDP << nr);
 
 	return nr;
 }

-- 
2.53.0

