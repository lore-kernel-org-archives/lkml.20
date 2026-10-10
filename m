Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A17440D590
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629956; cv=none; b=kXLW0VfNhWFpx/F+6BEnkS26TwMjlu+KlhA20SRW2mCYCHGEzTGCdg47JhqdzVXsstGuPwwffRsUm8joJVB8noHhdxujL9kVXE8cg5jfM2/TP9mumnRqvlaHxyfoWatxO2COs9eyO1+3dscwX4pOgS/HOoRo3RTC2f0iaBvFXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629956; c=relaxed/simple;
	bh=7MCaBFOuVYPL3cfUtOVX6nxdRkEKoiQe3MsLZtFLwkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXwLAF0ufrgElx4maZjFYVRvkQ/qNU3sfRlzAn/Ql7K3DE4pCVmDB+9cwLZCV7k5AhE7TbfY9PN3c7lIw0GlJ4bmCBggHh4OCD7w6ubTzIpATpHlB1JQ/WpqKFqBONRrYBaDuQ5uaBWXeIDUf2dRrZOtsRTtZqM9Hr2WB5pkx9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c45111bebso288934f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629949; x=1792234749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=maM1J/Mbq+hE6nFNio21r1hZ0ZTbgk9AgFVW7ghfvsdk4TqBibhsG+fxzS1Xz3MkHb
         egll79008B8/WzyCFYEq1lokhevKTgWoCsAAZ47U7hZnMoiksI8q71ScAlfes9nLcK4K
         vV1ColForBZVP9J6pmzK2Y2BhJmqTxqv3MEy8/48JqD7hRjb2Gjc1hGMdZKuwuAOfHdV
         oze/dKD7Vq+IGAgmKH0LL7wUs32tCpTlDhpeEQSlsdhjF9nk70TyhoEVhiVHkHOSjJ9A
         bbXxH04Y87wWCd58r+Z8j61nZLL+R9ppPZ8hxH+o5tHnyb2MOgnvRc8Ekioj/Gxq78zR
         O0Og==
X-Forwarded-Encrypted: i=1; AKwUvBxj9eIq4gt/tKoDJAiYN9qd0C/jfLf/RqTAc/OvobZs7G/H/B/jvFgHYHNrKNoI9o/EY531PT0fkK+UX5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPTwyI1xLwhCJ5IAXBXzfund+cng1ylFcjnvJWJbhATMGeKHc5
	+q6b3FX/Kl2S0it+DuoWQgYTd46myfcoDiIapPJcFWqiSMuid2rGl4Nj
X-Gm-Gg: AYBFou3cXwMDPoIN0pKHeTA+YKIG583/vblS3X67PmhhLhF9wDJNEeHeh/SmVqrnLtA
	nZVK5/5tkCb9oAH9QeC4yRMCVrhq1M9kPb4CZGbKF49DYttAEHsM1uY9mlH6pmT7Ua5/AH6s+dk
	InsljO5aMPiEaUTMKJ5herNSWlSkkF3oThwcG0jMmErbqd0demk2Hq3CkXgHz07oUFM3MeJgFvD
	mEA3h2QsVF66Ca9RUy7g86oTSyWAJ7WaMvTxupnaTmMS0/ecaWWjSmIsD3Z+dEyE1zYBZEp0shj
	8F3t/xql5ITpeBPpm8OHJtHfmjLue1uD9BYYSZZ/CWl2iRtkhViAeJxSmuAUOChk4wLRtfzWNxO
	VtiwpkQaAe4prZowMvyPYXs3x3xwEiGNgg+5wuceHxkwojNEmo6/utHsdqG4uK6m/xTeHl9vai1
	NMCgGGLR0nJIyxuj9UCQBxYTPy2ZdZgdMxzWjUtHlZY6mwQmLaGfL3cDcd7DuOOT8L5ZFA+wNTp
	Wgc8PNNwwIAz/INJbyedS/CBel5of4Rz5w=
X-Received: by 2002:a05:6000:22c2:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-48dbacf3275mr7157743f8f.41.1791629949021;
        Sat, 10 Oct 2026 03:59:09 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 10 Oct 2026 11:58:57 +0100
Message-ID: <20261010105900.247342-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.0

