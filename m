Received: from mail-pz2-f2.google.com (mail-pz2-f2.google.com [74.125.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935A3E6394
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215927; cv=none; b=hmmB6HiryZHmIiebBzFLriaTAGU+Vd6c340kkhMjXjX0yYE5ePZ5BSZ+7w0+79u7HyyIewOhTpyQ8P6juo4WCzrKGdXNUClPGxgx6Xnvlwq1W614WlLP1+YdxnyypirHnRZWbXkYGgnnGX1TTjnNBDUKxSt35Ayh8+TlCl1qbt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215927; c=relaxed/simple;
	bh=77hqLc9J7JNzbmg7AMorhPOB16l5fiuXalMgNBngkQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHxdIgYn509diKPk95pMGkLlRzsIg1YhcP/dU81/kpIYiHRfZ6X2MIoKgh3FP1RrsDxowDsZSjhYK6b5+gvxgdzSTbZXjEJDXLC7OZA6Zcl7JR59uCsAhYOOihG4z5ikQ9mj1yMusdqYPvvrcek7Iuzp7mYn3SpI4Vm90T7f6C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaDuDKG1; arc=none smtp.client-ip=74.125.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaDuDKG1"
Received: by mail-pz2-f2.google.com with SMTP id 41be03b00d2f7-ccc451ef3a7so103603a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215926; x=1792820726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=kaDuDKG136hNm5tp9UX79/0FF1Mun9gn5tmDLxEe7NWNGc9+4IcOncJ+C/GjIyg04q
         RPCYATQtAX9SbZx/GtS6I9J1cVFL1tJG5A/edKXOhyvhu/Q/kKOS1lWE8CsR5h4nHi4j
         a6n7WQmPTBRijHwci0inGaeNd9wtE4udu5AUzD9JInrxqAl1ntepN2swaLZqEI6m5L7f
         d0HWj/1NhmpCkGj6GwtQJX8w0ciDDVdKRIXHkg8Wv67s6arF3zu4b6MjM6oPjAG1BcxO
         k2IMrIvJVZ2JQFKNjQz/9ppY2BE2t2hiw3xMrWqQqgzSbCnsVblJlAT1Y3hDfZBhynlj
         MeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215926; x=1792820726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=CH4Or3svXAqeFxyVu9QbIZ27f5uhoRwUhIOjI6BMC9xQ7JFF2/5Uz6w054kagIFW81
         B3dOjQFxcO6IbewoLqx+7f8030/sSIwfRZNujxO/ff5VIYwpf00GypMOhQnDk7aBtLcO
         lGa55CEv+8a7rbcbiGs0av5haxVkbrQO7o3TVnzhDQb9/fLHid7hAOdLMizLEmP1eypH
         2Fc//1M9X8Os8pa4noi9d6KOq076Al3mvEJT9tiMds9voWQNwvJ5td236pOVlk93EIzJ
         qzABfd7W00hNPp4PnxmbmSqvkI8RbSM0jZ06lJTcLn8c6u6FYqh4MVmeIHY9g+zhvXwG
         x3vA==
X-Forwarded-Encrypted: i=1; AKwUvBy5FEAPVZj2q5+PDD5K3vGTcalcqkKruJjXPoaIUi1LWdoX/XK2t8ttC4EFoCO2BPQ3X5PPQ41FevP7s6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3+hEJXWiC+dztFT8giD0fwb81GoVfd7SnWtMruVzP/6UigpNg
	4DOzZ9HOx/DmKOO4VEFnjeaW1iT0L9TW//yUWQbeFJog5VLypDDJ9p/c
X-Gm-Gg: AYBFou2F2XNgaJv3wvNtRJ+FWEDori1IhyFyrt6gkt9HbBQlj7msq40Y9CzmG02yyNc
	dmrOrPwpohrd/EmH3um/mpVjpkNELDetBkN8AfDvIr13V4YcZ9fCH6+5leVW3535QT4N76gDRCz
	MJnxSXF4VqqHyff0BXCLmAD0BCjl4hkedD2hfCVphN8eeamAcJdvR2Js2mpGiUKSc60jqIXG67Q
	pxwmDX1CCCqQEnEkaGwJeCH7igKQT01k6yo7L6OG9wt0beZOEDCAT5768LAsj9GgOIvKMFPr56W
	kIOc5fHSAr1dL6ogtnXN85/pZhHmpam3xt4zjbLiBEHqqVudZD1Jh3Ua3p+ogp0zsbRh3Zwb6LE
	U9h9dVHEkOsgE8xM84jc3nqUcCigu+zBQx0NqBGc1+jHbSOG4/Gi+f06A9/yxoyoELv1xZirBES
	AqpboHb1qtDa/DQCDFW2oo7v4cJm0b4V0iNTCMbL28Ug1fIy01wlnLKYXi+QIM/WfmXVCH
X-Received: by 2002:a05:6a00:4146:b0:87d:430:1437 with SMTP id d2e1a72fcca58-8a04be6035cmr1481735b3a.38.1792215925893;
        Fri, 16 Oct 2026 22:45:25 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:45:25 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v12 6/6] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Sat, 17 Oct 2026 13:44:04 +0800
Message-ID: <20261017054406.1828061-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
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
index 65e8a4b5c90b1..2f0f46eabcf54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23757,6 +23757,15 @@ S:	Maintained
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

