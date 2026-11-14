Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632463;
	b=anQFlkTxmugUmYppssa83d519y5gDP0xjps6gxgilmfK5xZjo28bP0b5pknJ7wyL0YbO
	 SADprOgf2DaBwezbzANVtnO4b+Ugd5CwmtFTDR2tgl6h1NTHOaU3/6KNKw8itwVgtLA6C
	 XfYa/uTaWoAGmZl4mqIDJALXG2A8yhqfRms/jSpVHkxfvAfsL3pHymctRs7w8R3Y8Jygz
	 DE58J3tA1YLWKEbNAF3UAIz7Ki6m3ixZLU8ZRWjKy/Qo7H0DYFB1sfgPP6J5sb18nwKdA
	 B9EqqPI9VziCH/ChEqBXmyLz7kp2uxSWVS+QHUX6TY+Fdb/PEKuAs1mnGl22PkksBIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632463;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=gna3p3mu+wa1XCJBcKrCcPx1pXeUffKI271uvhHuqAc=;
	b=ObWpTMDUbmp8BUIiQyNnaMrTSKq+Aj2b61uK4YkHRo9SmJTTbmS2uRxQNiTADobqImdb
	 pN3l/Rgxs/S73hFocFO8dgqIxD/+AK8iEP7EAlHvfmrxyx4h3lXlus2nny/c9UbKsE5h+
	 Zmh2L7Vlg37sixGFR9+HAj7p+ZGfjedg/9jK4o+hnYEuWleO1CDbvEiDnUFh4wNAq3GiT
	 OiT0rUSsV8dLkWudNapIWOnCDB2uA9bujf0wrtoPEORltYLaDOJSYxn/u9HLMl/JQ1jQX
	 zCuhd76EM54bjJ8f6zEjD5EYEce4YgpsYXf3OG3aAPFUPQ4gyqwLO+qLw8ypvT3JXTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kPGjodb3;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E69E60A3836;
	Sat, 14 Nov 2026 05:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E69E60A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kPGjodb3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632457;
	bh=0QVucLvAU19fF0FWb8f/iW6jM9gX/SKdaudX33TdcXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kPGjodb3FCJIrZ4a8VSgYicgY+nxCsOGOVQiP5DpuuTS8s3Vr2roAOLnfUzvmvoqb
	 aPguN1lcqiw7reKRpH3i5wZaCIMzLB3k4BEDA8gZIEKufCIG/pjxkcQXSr9JYxFyPE
	 z9IrUJPzKLQaKIaE2fEnBwnPPThLxDDEW+Ae66W1mvF9fI48aKws6GhqwV0oEaFvUD
	 9dg0wg28FZyP2yHrDgeRD2KNnYRgDpWbezDH3kOow0ftdSTmVDsjflqjwOlh2cJIGV
	 Lk4fXMU+zZHbjLx7o3dzkFKBQYj6Kvmla3XVTVAolFxQQubmp1g9Znevgzpp0oh3Hv
	 g6ezZt/GgfXsw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 182B417E3BFA;
	Sat, 14 Nov 2026 06:00:57 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 28973480066; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:52 +0100
Subject: [PATCH v12 19/23] drm/bridge: synopsys: dw-dp: Clear only enabled
 SDPs on atomic disable
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
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-19-d42d3dc5bdd4@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=0QVucLvAU19fF0FWb8f/iW6jM9gX/SKdaudX33TdcXA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wdiDGEHOzkPYNxB/YQZqGHZ5uOpXVxRC
 MVROnkrlE2S6okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qab6UP/j29BpZLXJMNP2BM05ITjierEfLwktxihZ68kmR705uqsC146mER050f9dNjlY3/rSu
 vRf6MNlWcdlb/jUZgL9h9qapFZYY75z+4QEg0BXWLetGHrkN96C9UWyumVq+jH9XappAMDPFj+t
 8cZuyQN4ysDV8Gy00jrTkkP0APoN+6gTFFwZB6xUvvLgs5/rkGu2dFT6swuMDauFZGA7MB11jMw
 HVp+vsuNVpUEYXS4Cn7Mu+0TBBzfW4g+YDjP4Nbkjoap2lV1jMCA7hUS9xaFwjmQsjzfA+aJQ/N
 8IjW7FfjCFakr/whAW5ZwRXP44NUjm/teZ4htnprMlgwxavCuuAY4OdGcTQlOAYPlfiZaWMOUf2
 dfXa9k1ms0LOXzFPM5zxnkUhUJUfaYI1IJWIUfzQt65Wwqr1z55jgfc7ratQvkTd9qoEdcjJCBS
 4gh0vsbFekl14dvvhZHSLDkDifDUs20ePxmCICawjVOhDp3n1hdByMxlhKazWyVwqNNGPr4tN6O
 Lg3E7MMclU2Tfr2HU2C9FbvHa20J1AdOy4stw2WfEROa72BqZRQWrr4BuvQ8O9UuBXqjUlr5+3h
 YM56aD7bAr7MC7ZMRBVtY8sQTodLpQeid6WrBZZ4rGeUhbFINthpnsq9CNf0O+iRhSpnFXDIn2h
 Fc0IxmEQfTIrjbKeGQWQl5g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

dw_dp_bridge_atomic_disable() bulk-cleared the whole SDP register bank
allocation bitmap via bitmap_zero() resulting in the loss of all
tracking information. This results in a slot potentially being handed
out again by dw_dp_send_sdp(), which is still considered to be held
by the previous owner. Then the previous owner might free up the wrong
SDP later on.

Instead of bulk clearing the tracking information, the new
implementation only clears the SDPs actually configured during
dw_dp_bridge_atomic_enable() instead of the entire bank. The
introduced functionality for that will also be used by the to-be-added
audio infrastructure.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 1ae5c842a782..6e165e39b1f8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -335,6 +335,7 @@ struct dw_dp {
 	bool usbc_hpd;
 	bool pm_active;
 
+	int vsc_sdp_nr;
 	DECLARE_BITMAP(sdp_reg_bank, SDP_REG_BANK_SIZE);
 };
 
@@ -1076,7 +1077,19 @@ static int dw_dp_send_sdp(struct dw_dp *dp, struct dw_dp_sdp *sdp)
 				   EN_HORIZONTAL_SDP << nr,
 				   EN_HORIZONTAL_SDP << nr);
 
-	return 0;
+	return nr;
+}
+
+static void dw_dp_clear_sdp(struct dw_dp *dp, int nr)
+{
+	regmap_clear_bits(dp->regmap, DW_DP_SDP_VERTICAL_CTRL,
+			  EN_VERTICAL_SDP << nr);
+
+	regmap_clear_bits(dp->regmap, DW_DP_SDP_HORIZONTAL_CTRL,
+			  EN_HORIZONTAL_SDP << nr);
+
+	scoped_guard(mutex, &dp->sdp_lock)
+		clear_bit(nr, dp->sdp_reg_bank);
 }
 
 static int dw_dp_send_vsc_sdp(struct dw_dp *dp)
@@ -1394,7 +1407,7 @@ static int dw_dp_video_enable(struct dw_dp *dp)
 			   FIELD_PREP(VIDEO_STREAM_ENABLE, 1));
 
 	if (dw_dp_video_need_vsc_sdp(dp))
-		dw_dp_send_vsc_sdp(dp);
+		dp->vsc_sdp_nr = dw_dp_send_vsc_sdp(dp);
 
 	return 0;
 }
@@ -1754,8 +1767,12 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
-	scoped_guard(mutex, &dp->sdp_lock)
-		bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
+
+	if (dp->vsc_sdp_nr >= 0) {
+		dw_dp_clear_sdp(dp, dp->vsc_sdp_nr);
+		dp->vsc_sdp_nr = -1;
+	}
+
 	dw_dp_reset(dp);
 	pm_runtime_put_autosuspend(dp->dev);
 }
@@ -2352,6 +2369,8 @@ int dw_dp_probe(struct dw_dp *dp)
 	if (ret)
 		return ret;
 
+	dp->vsc_sdp_nr = -1;
+
 	bridge = &dp->bridge;
 	bridge->of_node = dev->of_node;
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;

-- 
2.53.0

