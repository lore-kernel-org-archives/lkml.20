Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0457A46EC9B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923822; cv=none; b=uSE/0kayxDiQgEjMj3gNlxJMFTHxtEJZzGmnqZt1fzpydrdo2+JnEcfXRx95agmwnycRu+1dhMMH6x4aJYJqPWO03T/WbXs5VZKtOK/DGH7Yv25+SF93zDLzFFPjOuJUJIOl1EzNWAa2zyUfnG98fyPCgiTkRFgvZwpUl92xbwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923822; c=relaxed/simple;
	bh=fh2Uu82ejF0DtKt0brgXH//fEo0R202bASP2cymwUFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5Ns7pJWthYGC7CpBYENMcRNjyP7RPiYS5HM/VZKJTd+Id0SZIX13s9iOdtnB6nSXO7bMxloaOwQPF63CrK+6DwuDstoaoRNEdJTBEKNFsLoL3uZ/C/65kF11LbjaN4kRuxpEV81t7zy6yrhU1g8sL7l2zjctPH8cEKW3R/BkJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oc83AY8i; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc83AY8i"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so1684805a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923820; x=1790528620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=oc83AY8i9T/s9qJHtWjS7WM5I+B091jAet7u0+bXr9FQqfwIodge9hUq9UiLscPAqk
         5f+gKg4eDY6xTVI87ijf+GjtNtOwipxKUUKyjFx+aSpaTeNiHWbg2cwzNbhp7eBM/IgM
         kS2UKmP68ZLuhqZuRrIgnxZg/1B5Vg+hLXyBBuizT4dXwyp5gY6RPHROz3M1ezRzG+11
         dUCRrllW2S06FDnmrrdLC1wdzCHubXyrYznDxlNFnNDa70NbvxTqRLVV+6FuJEEH+0Yf
         YSGQGO8kAiIQ69MC+VivyyokeeM+0ljcpGdA5eqGcDRNncpnh9vSE3BcMOL1IzJwe6HW
         5xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923820; x=1790528620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=eeaC8Zgu5H4qeyEP/j7BVDCHS7vf1rlFxL7xTgNWdWpuEr9LtCBNXjik9Zg48sjokk
         0wtUi7ItqcU9QJAGy9Vp14PEK11uLBE7JldRBhw9WOuHp84LuSLGUYgpq5HmvOaz03ME
         lJOTbD75a2C1LJmlWTnkHN2AZGPD13Y/0glXzJkWyomvFg0X8nVa8M7t7q49vow2UVXd
         p8aJeB4yKoF+sS0LAQzEBoi9WJc+fegQ5KFL0dme6RUIDOUFmL71f+CucMj0Q3I3Tj/2
         y2TM3dTew6yQkUc1C9UEiESzAlmsfnLLt6wnpap8uCtNX/7M8p4bcHLtvGPEavp39CJr
         Ta/Q==
X-Forwarded-Encrypted: i=1; AKwUvByuej9S/cmqv+a/kYy26VQp10irLzADySQzBfH+PE0zCvsPOQ+JU0+7hCWnVemoTHMqee+QawZZ5nB4Q58=@vger.kernel.org
X-Gm-Message-State: AFuF++mTLee1aOJOsOKiUGTqOKOQ8+R561mkdh06GW4f6bKoQrl20OBM
	bsrJu+e6PB8Rm1i+PsjVe/s9wvMAhtELvaz8Vg9dyPoDAMgChsdvydev
X-Gm-Gg: AYBFou0M1fC2yXgEu3OXput8hvzwiCUYufJAucf9DfSI0g3PJPdm9nM/M9MZFckLT1u
	35bDbl4sHurBfiKt/Fqmov6eygqTnoSA1cu3WSF/eVFPOZ15LdmbXU6qfJTxOFXhtMj3O828efN
	/Aq+Cw/DgO9j2YYzG8eKUpZANOQhKZ+pfppPZvSSDUyPAs4S5JYGzIru7c82da2TdRPt20Pr4l/
	fH3TJ4sUOcxGqjjy5sz4rGQfjn9dii88O5lzm8HRx7bauy9RuNrSbeXsT8LmauwUz3WGlGcSjie
	HeMnUcupqPC1nko5sZ5c1Cf1DS7H+xhWCP5P9MdfC5imZ13M1CjscCb8gl+9iH59Px8IbClu8ov
	1JNQmqqtNE9O9QvYarEtdSNjljbJNWZYxq88pxfzP+tUeHG8FDpZG/PxVBy4F5f1IAWFdCPepJ3
	k44Rg9DeBp6BaWiWHcjPUOrYG7zqWC4ynxxBYNI0KqEVLXlK6L3+yg9uAuEZ8o1lloG3UBwg==
X-Received: by 2002:aa7:88d0:0:b0:878:3538:8f80 with SMTP id d2e1a72fcca58-87835389b2bmr4633099b3a.46.1789923820049;
        Sun, 20 Sep 2026 10:03:40 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm2140646b3a.42.2026.09.20.10.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:03:39 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v9 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Mon, 21 Sep 2026 01:01:15 +0800
Message-ID: <20260920170116.3624104-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170116.3624104-1-coiaprant@gmail.com>
References: <20260920170116.3624104-1-coiaprant@gmail.com>
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
index cc3cae2e378b3..085589b8ba65e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23740,6 +23740,15 @@ S:	Maintained
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

