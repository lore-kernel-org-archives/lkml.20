Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0803EFFDB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822394; cv=none; b=ZB7sRyzkYovJfTZtjSdqZomZCx5gqWe6hV4fSvZbl+rQdTlMuBcS3cNVWRMdNLU0iyUTDazpNy4n3Exo93kH2/7eQ0jUc5WTNfMgcpUDNR0Jhr43GMYSEuCL0ern6Jvuz8cOHa/WipWofRs1cyyJBduq7I+W75m3x7SPUa5XLOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822394; c=relaxed/simple;
	bh=tCrgHNTqayWFj1XRarWJorXnl2XIBvQrDCQv89fV94M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spbBXWzPMB4e+DcaqWF0U9Pk1cA7uv8JTn67qSwE2D2D8LBNfGyniIbpN4jlE2i+S+4L3GDvESlqwxAJfv/uukODG0R/bvihc+h8H0fucKn8a1KIvOzqoJEIjrAlJU3lgJW9S65oqxfhOn4rW8HiQDqWx1QHR9oD1EeFus/Kr2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYRJkC55; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYRJkC55"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso836679a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822393; x=1790427193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=MYRJkC55yHwhHoONtGB5ttuGAyN5MCrfpYjCb1B2hzqkTPZ51muAILPGY/Nu/IwOb8
         dVCo8fyIH9bxEfRit6buo/MBTw+cA1lWDGVrzRz8eGIdzUgE9lq78U1RUcwmC4k5sMqy
         2QKZg/mn0r62aonntu/exwVXyEXYxfAY2MEM02f90Xa898AdqMZpJRe7gq5WhnqOCgik
         J94NQPk8o5SsbldFG6Igv27/a+vqb2g+Fm7xlMw2Lt2xYp8VysBP1zlFTsGfk575zrNa
         veF7VeSMu4iqddGsywnxxDcZmrtQH33m3RCivWj6FGuy31MuS4xtUvj12b8hwohb7BLc
         e/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822393; x=1790427193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=QfDTlYdG+dFI6QixeTP3X5oC6/EGsXRzy0PoxmdD+dlvcl50VG991eE76ZNa2DLLgG
         E81h5wSVAeN8fA70dznjM+5Y2l/pJZBShJxzMByGf1TJq17oyx+IQyoGOjFCIAvID5vS
         ElVv+O7CkBMN23d9nwWy6aOUwRjcTRIyruNbbDcOO34Vlq8lZeHUkuVuUCqMGJ52piUY
         euGnCSX2oTbNzjr59pwO5gz3V0Y/bEjmich+nIshVZt13LUUneXIV9eAZsK2JSD4Pa9h
         HxpgwsCyrKUtvcIwJOe0M1erdQ6qjP+S3ahXkA5OgBo90DJp/D2WCqQP2ARbqjzf54gI
         K8CA==
X-Forwarded-Encrypted: i=1; AKwUvBxHSTUsIIKsuhZw+nLhQvZAbg2CmKx4IHHTVQhs7VMThJpUSPKLfJb9Qapd7fnIhM8CxI7nuIS1gXH59xU=@vger.kernel.org
X-Gm-Message-State: AFuF++noSbEo7s2ElUwqjPSRW9MOSuLpButniIgrYkejusX+cdvL/QGd
	y5hcDlcsaOGf0bnzD8lYowCv4paMMm4Q1eLSI5gAEZ6TFb/aemb0Dlcw
X-Gm-Gg: AYBFou05+JAfqAbc0i6GNmd3/1+RkL2vmZLbWABhcUYw16aB/m+KWj5EowqTklfgeB1
	1nt0pfKwNBS1XMhWMjCcXRJ5G9DxOhCAxI9Gb/eOmwVT1nIL72zeAqi1pI8IY/jRqFxY0vtnMNm
	uJKA8B/Q3H3rkOdOVM09gT7q7ZpJ7xqyycEl9EsoOIMztnr/+CFL+2muGTxjuC4/+m0FKddswDy
	rWzr6TXF4FAU5SECiSTzGB2yD3DcRogkfPCazragdGMtX/So2Z9uoQExAFUE6UsQ7jYOJ71UYQh
	+jWKPahpfojlfEUOjBFOexi8kJNPh9IXiLWWyyN75JqI1TdQ4+gdQRq8Q0gXrvKscMpjJSTTY1o
	JAvOIMv03ycpHb2qNh/hi1nbMwbk1hQa0NJ/s0T3jRa5OIa4VoW7z1k0Ldx3XlQhsTah/S8Ab6M
	RIaG4D5jHuGs+rOcO8+13LH+t0qZ94Wt/HlIM6hXjqCzZDikkYI/K+tnlU7cFbuPTDH51eSQ==
X-Received: by 2002:a05:6a00:1796:b0:874:706d:8573 with SMTP id d2e1a72fcca58-874ddef6806mr9062175b3a.27.1789822392717;
        Sat, 19 Sep 2026 05:53:12 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:53:11 -0700 (PDT)
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
Subject: [PATCH net-next v8 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Sat, 19 Sep 2026 20:51:18 +0800
Message-ID: <20260919125119.2107089-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
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
index 3b2eb2a7a89a8..f53a519da6298 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23739,6 +23739,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

