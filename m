Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632461;
	b=ELRu/ZGJnpalq5r/JpJI8NROEMGZuXTdvbc7xbPlM6H0ZRJ/CnAfUN5xKIf0+MbmkbRP
	 XyZbNF/1PCNVLDJVhlowArTa74YEwmaSFeMEB6QfXdVoapoY5cwL9xJbiodeJWvuL3e4Y
	 Funla+u1ZySPsA/9CtP8OLGztKWHmZ5D4EFhzegGKORAu8Zv8BLPr5ep4WwIzD4hrfhEu
	 rY+mExD6GHCIzWnPKxYLxQ8qzjw1J+YUYNTKm+PzuqhPpEah9eH4GVec1NtWKeqqEfKui
	 tpxYWSm15eEsS1TgqITUX3pgx/5T3QozcFLssvSs8i2eT2Ao7vZHBB5MUxw+fVpBTgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632461;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tD1LfS8v3U8vciF3kw+7w2dzpXjbhOMsyertPA+CAGg=;
	b=gBY73XXyp/ExpGy1UMmf1m/PPfo0Na0O+yrz3m4G3TfONnDWbCsrMA3uErAwCRxCk2y1
	 oL23M4Npjczjna4iQf3NdTro4ZNntFBLw8MGKQf/RnHayLA0/OERDh5456gnbTiQq33zp
	 Dvtnn8JDcGgT8uVQosCwoTg+FvE0C6DhkGlCqb9XWxFNsauE5bkcA7XLpvVshCogD0X/e
	 WLBOcZbuivF2jEChjGBVQYPuBt0Lsn2UzToVhoRlJ7lYdphgqb426qQqVpZV+cjsoZXh5
	 sLYhyoTv1kQavGzzbIXGrkXeCKsu1+8qSApNKdUVe11USCERPe3lW5VmbzY/l+0FdKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="E8/dLNR0";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B168F606A8AB;
	Sat, 14 Nov 2026 05:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B168F606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=E8/dLNR0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=M0Q7DqrjXt8ICcxwp1gthEb6oCgbrcLyuXxfBJ7UAhc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E8/dLNR0AKGMazfJCueqCE8uwRw3hKFBkWbi543yOkTiKHpWJwyt8UPrYVMjGigsh
	 43OJpuyHK1Qah31gOEuIa+Z/BXKCazJyUuGTLN3dnfSc4ZLpQfIs1P0iuocn9SYecS
	 7tE/1uPGjMF3/Fqkrl5B9DfMLnE1wuZCxW2BcPB1HOw8tu4AallQWHuRAJFnbxiEHI
	 GJpDgfQFiVYWbbAeyR/BRuRZdDRH1HhJYOMuIECi0Z3Ug30lyOH/Qq99MAM2mNQ/wb
	 /a+W+ZABEBudH3EzoMbhKOHfzb5/ZiZVCz/ptuwZaVajT91sgiFW2E837VT/3cTGxO
	 gZzLLVOdNj2NQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A91AE17E36A3;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 13F2248003A; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:39 +0100
Subject: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
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
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
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
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2228;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=M0Q7DqrjXt8ICcxwp1gthEb6oCgbrcLyuXxfBJ7UAhc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wexfJmXP3rQk8lZhyfgLEMJObk8/yuGO
 xJWp+EPmHe64YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qa1PkP/jNahyW/I1yhqEaivKB81Juihoshti2rA6PPK3/2DeZYxMlmweErLc6R6cLrDyOATmG
 Xa1iZVgwmeqxL4CjOfT/bGxEsXge6BQe/YDsG7uQ0mSl5nrCZpZql9AFzsbSm7SFLc2jOgL78CD
 +skAMPuW6/y2/pi1T7crr7HgGzgw8jDRPvS3h4XKKfQ/ynjM2fUgb7BqxAf6qvcBqYiOAIqgaqU
 jHcm+ZsjWP8JyymnwbL+HXqaaA5XnLY/qi2W6vehWWY+OyCq4B9nn/e6isK/eIL014AG4NDQ2Ni
 D0hrgICZ5BCPa3Lm6vGKaHD6hxIDyCjSb6CeI5vtr2mlJjkuZWJt2PcV2zyQA2CK/d3puIzMfJt
 8q9zjfElKG3p8g2gwfuny0wZ/mvmJ2OGrefKj7s2yZEDMgZpmGkQ1kXbsEIDQOgT9IespViqxp6
 CwBfJ2cjtGd+bFkGxlRUnL1rgG9qdb+A94U+KjA5Wmd93wLwNprlH+TKdNc1PKstV298qpJuAjR
 iz9tct+bC1+qbJ3Za176a/F6B79d2xJtogd7iPjzcHfctGOC3f0GH3iev7s1IvVc/SBkin+VkWw
 xlRUH55HOluovg/XLjtjioo/3yl5yeMDTvj/KKFKgqJtiaRjz5f+qxZ0QyawdRBElFxFg5PztbV
 5QAbOYhFLqQgUbWClvoA4Cg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The DP AUX transfer method uses a completion triggered by an interrupt,
which can timeout. If the function runs into the timeout and the
interrupt fires afterwards, the following DP aux transfer completion
would trigger immediately without waiting for the interrupt. This in
turn means the next one would also be broken and so on.

Fix this potential issue by re-initializing the completion directly
before sending the AUX command.

As this is racy (the interrupt might arrive between the completion
re-init and the new command being programmed), also reset the AUX
controller on timeouts and synchronize pending interrupts to guarantee
that there are no pending AUX transfers when the dw_dp_aux_transfer()
returns.

Due to lack of a sink, which generates AUX timeouts, this change is
effectively untested.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 7351b70bdac9..df0b98cbbaab 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1465,6 +1465,8 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	reinit_completion(&dp->complete);
+
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
 	case DP_AUX_NATIVE_WRITE:
 	case DP_AUX_I2C_WRITE:
@@ -1491,6 +1493,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	status = wait_for_completion_timeout(&dp->complete, timeout);
 	if (!status) {
 		dev_err(dp->dev, "timeout waiting for AUX reply\n");
+		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
+				   AUX_RESET, FIELD_PREP(AUX_RESET, 1));
+		usleep_range(10, 20);
+		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
+				   AUX_RESET, FIELD_PREP(AUX_RESET, 0));
+		synchronize_irq(dp->irq);
 		return -ETIMEDOUT;
 	}
 

-- 
2.53.0

