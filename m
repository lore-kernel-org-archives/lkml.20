Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12C83D6663
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275050; cv=none; b=KfjPIqBruV6WL+M556Zn6dCB1nSXpCOhsKHW91Tl/YGxU91cXRRTb9Z7RaTFP1lLxjnGDLEeJzUwPS184DHpKAjcbksFPGoLT5DAdUCQ1mFDidF4gIpr6+k/jf1qEBeEec4i9NveOxCi1sMlEHChYCPxeYvTkCY0nmBRFE+lg9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275050; c=relaxed/simple;
	bh=VMBfELsDgdw4LHnXCPqjLHfbD46aI9SXxvEcWut9ryc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulF2o2OAxKeNk4lgyz7MHuayqOHTZuLnpFoyef9GcGOIB2IeNSDaDQtuGgCHrsj2VgBOe9k/f+AXhpBRlY49lWEzr4Xq/vfRL82IzFVPcCDZM2ROzU4Z4TE6hTCJmV6ayhfGq5X7cjPNHNW3PerijIs7yFzaUoj/RjmwI6Lq6po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brmu9yGT; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brmu9yGT"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso3187657a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275048; x=1788879848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFOAryefyj3E8LprwQb6zM23kP14ZZpWJUCwFcY71vI=;
        b=brmu9yGTEA2F4WzPCq6ADcgF7oOZy++TTvE+0A4rE30xUoEOT6hWOz5XtZPRBGh7NI
         VdA7uNEsUkaBJIjyaNdrV/WEW218oPPbEwXuLXTYwpTbeAU5fPhJFRMuQN27pKY0JQgr
         9p5yXkCKY/anvFDdiOPEs0dbGhGAjhtSTbUXZVWjdsobeRL0nXh27qXK74EPuhhyZj/j
         4p+4gERbxqoZFE+vq5LvdyDZHAiyBqfEWeC/0YQbeIhFVoDq39Yg/l80Tlx8mpnsSSnP
         iInc1Fs/c//Zlt7ga4B3V+AMNVG2n7IdHs3tOWXqqMo+r9VH1l+RsJvnbePrEGWOC+mG
         460g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275048; x=1788879848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFOAryefyj3E8LprwQb6zM23kP14ZZpWJUCwFcY71vI=;
        b=inDoojIKEdCVuKetSi+4PMAg3cF4tJWvHPTrv20v3wS/vVKdH68s8G+VMNzAnYmRZA
         q1kw3mZAMmdv0V4FmlVspPjEprlY5rfX/nDiuNR5v1i0o5yMl7iD8us+XeS6ay0X1kM9
         VzfV7ciCAt6fU7zi2GGvn3vmoxaq57ukdJ8rwDym+//HmghdJp/R0BcKTC+el+Kk0WH6
         oNjqfGPFqx0Tf7n2OaOqBcDj3zdeS5vdiAQS4Bt2dAyb/niBCVGOZj2r5gsk9AJePmF8
         tGGqsJAHElWVGZ5rWsp96tI+mbFUQZy/sq84BN3FuUeOWoh3LjZTHEz9HMEpSs42HyT/
         VRFA==
X-Forwarded-Encrypted: i=1; AHgh+RqaMBDpdpIGuHnfH5hM6RVuy43aUkoQli0/KR4H9wtNduWJc2ISoszgvMgJez45lFnYS1RL0055CSOSsiA=@vger.kernel.org
X-Gm-Message-State: AFuF++kH5Yw9QFSeEw7mA00y93mL0136vo+/qdfO4S+kFtLddEwHt6LV
	d5lH7sWWyUCFYGFFbqkB0NBZi/z4gB5Wmp+nU4xvxhyILxNEpU8cJ4y2
X-Gm-Gg: AR+sD11qjDdlCAOxefFEn5OXNcDF4zY1E72t/OkK780B9hM8SLlZJREqkY88ZopdnO/
	j9GZ5aN7o6ADUvVJhr9ckHfiV1RafrGW8xwRfJTBNFjlrqCT4Zm95a85b2rH2Md7O1lNJX/mUVy
	aTQuJaZV+0jJ7q2vqkN4FbnLH7DG69UtCq2cp5Y9g4KOZrleFwOwqXTqW+SpPeMA338Yb7yupFv
	1t/CROzQAPizxjMJjCJoGg9vDR2p9VSlqE0UApKRBkqp3la8686Fpt8NmK/itDfJh/jRA4E4q4m
	7309VRlACYgjbo6jgkEtOZXA2DdyUxMsNpjuTw9U03PnqmWiCnfI6kF3tKq95nzoR/4c9qX254r
	EPHh/mFouAz99deFXrT+kNiu0vk3AbDXsKxcKzrDNOqIdcHDobeN5gtVCunO4xXR7XNvMJ+hpWw
	21yz5QPw9ruQWSvvvWc6KbjYy63OD37uC+rH0FI2LrP661wmjDnGR5R2Bddsk=
X-Received: by 2002:a05:6a00:4501:b0:857:72f8:dc91 with SMTP id d2e1a72fcca58-85772f8de55mr39669660b3a.18.1788275020723;
        Tue, 01 Sep 2026 08:03:40 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0716846sm27914b3a.45.2026.09.01.08.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:03:39 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v3 10/10] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Tue,  1 Sep 2026 23:01:10 +0800
Message-ID: <20260901150111.141037-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901150111.141037-1-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9..c3b17752cc817 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23744,6 +23744,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

