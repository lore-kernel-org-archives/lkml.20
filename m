Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4543152F28F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869420; cv=none; b=bio4hOCEO9Lv8gouUip5rsZKLPk1+h/yt1zrj34LAp9CCO+HHeo20O7NeL+MIb4SKB+1TVgHp0Qz5iVSkWDAwrRMoQrlM7y/P3ouCZV8lquRu9gH2zHkqPno4o1/g4rRFlytjH/ICCSlLQIDT0HAm5Ah2yBeGAbnRHUn05X1eoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869420; c=relaxed/simple;
	bh=nW+JMLHiFU9orVIthc91msKuW9PqT7A0A6/amJs74MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLemk+BvZmpSez07EzBXaNAh/F8k+5do1YAlVo74qQBixgqaWR3pkC44xzMN8QBcEyKeFHoUf7E0D5aQIxqAl3bjWlpbUdBqbUN9mS1Val0ll11C0VupkcIAW6HtJdD4o2CpAu/deVuS3KRCvq5FZvDBcCVCVjACma8Iav9L4X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKr1txFp; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKr1txFp"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so42000665e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869416; x=1791474216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msLs90Jn+yH2RYcHq+7D9lQYssyMQJNyeueFs8OHBis=;
        b=EKr1txFpzOgDdBug3c1haSKjZbOrt/NTMR+Duapj4W21Pb0RZPQQsj0wqBeGFBEF2f
         xI7N4CmWo0zmauZeTZYF3w2mrvOttFh4l/sIncoQUhZCEZuBfN8Q6LHRh2xFRltGCOXK
         wDGdaJIq99BFcskmhNtLEAtjXzYyhdYOAkA6q661p4Idq0+JyiulWmGFH/8uIwSPkV1a
         noNTTw3fEtFbdTkY/8nWN0TVdmMFciLarnCvC6Qfib1uzE8PqvKREbWSfUSsP31QWz+F
         93nK7LUoKfFrmEPeg4lGrMR3q+YWwioV252xYWqPCwHvGlReK0NII+zsKvUomBd17WMk
         F3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869416; x=1791474216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=msLs90Jn+yH2RYcHq+7D9lQYssyMQJNyeueFs8OHBis=;
        b=Ky3psjEVdmGewyzP9ix+XfDXW13MRVAT8nnJMwXxdOuc21Hgal8Amo6VdSaqx3YveI
         NOkQg0Vk7JA99JprkTHD2C3/YIhzMvZYSyUbBIdAFFBiB9/rc2LUpGf13t73UDLXBjI+
         1AMv+MpIPm+aS4X3gEc/CsMqYYCDyDUcSAJSc+JNuKVQZVZ42YXldpZNfFnGWb5OQMtE
         iX6VOVWj7dWpY23zx6hGFc16T0H1RfNIzS+hTzK74rwf88KMJ3Gd+4KdEdQIXv1iLDoK
         x5eqTU7JrvDKVxgszDtMljEeSJ7ZH6REGoVwmuyuB8jJZWxu3TyAW9Q3u73aX8OxorG8
         KaUA==
X-Forwarded-Encrypted: i=1; AKwUvBx8sL2GDNDzEWJQvfCr8gp+vXhAXPUz3oXJKQzcigaETaCVzX80uhOowWMFMzQJgrDCSnvpAmddeudnuaA=@vger.kernel.org
X-Gm-Message-State: AFuF++m+2E+vHAWh45mvSGN4ybK+PtnxKenua+WzbZkPncvs7PFeQJEi
	D6+rZzvefGfurxlMdmSnnivu1XAjiRJkeM6yHkYBVqPOWEzudr8gQyUK
X-Gm-Gg: AYBFou1XKPCbX3DK3i3MGcifmkj0utP0Zu5AnSre18UUemITaNBB8+vQjO8DMx+m6c1
	THJCk888HPngvT+3Z6ThYKURLYyvwhWfQcVNm9TBNtQweiPot1tr3jq5vIcmmhXaarjb4ccYgGL
	ud3lAetp7/kS2U49jhHvyQPQUnaS/yy1t1o+scnX7B5fx5zM44cgNS35OyOdrwcRt66kYyUO0vS
	vAJuz1gdwiRQECmG7VB2A422wnTdmSDqrp41yDrFxpS36P0p349k0Di8TtAE/9n/nD+xjmzV07Y
	C1ibR5bFSKkUDIAHyQR3Sjwf4R3XtwanzjDRbaYw+iqienG0WGr2goPwzEajcJP81VsTgM/d9VH
	c7P8dMZnwwyrjnEAI3ePS+gFIkKOb0FCMi9c4CxCYo0B8rx4J/2zsYJrxBxKbDpXsIpL/JGttgj
	bvamqppjn1ik+BOa0HkuvmaI+nGW1PImG40zh1j89HuIoJ2HRifn/q7++n45GSvMLZsVniwS5ov
	8PpHm8HDP4akSIBVK0fYXdxEK96J/fcSpq202fPj1pHdqXJJO5jMcNSLd8JqM786uI5RrY/oTf2
	YYXyDBWC+fxc2BEtvfI=
X-Received: by 2002:a05:600c:4f81:b0:4a0:1ebb:bd0b with SMTP id 5b1f17b1804b1-4a02755f840mr444255e9.8.1790869416505;
        Thu, 01 Oct 2026 08:43:36 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 03/12] net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW
Date: Thu,  1 Oct 2026 16:43:16 +0100
Message-ID: <20261001154326.754314-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
the same tagging format is also used by the ETHSW blocks found in Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated description for Kconfig entry to cover RZ/T2H and RZ/N2H ETHSW
---
 net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index 4f44bf3ede23..88e181ad4cc3 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -188,11 +188,12 @@ config NET_DSA_TAG_RTL8_4
 	  switches with 8 byte protocol 4 tags, such as the Realtek RTL8365MB-VC.
 
 config NET_DSA_TAG_RZN1_A5PSW
-	tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
+	tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW"
 	help
-	  Say Y or M if you want to enable support for tagging frames for
-	  Renesas RZ/N1 embedded switch that uses an 8 byte tag located after
-	  destination MAC address.
+	  Say Y or M if you want to enable frame tagging support for embedded
+	  switches found on Renesas RZ/N1 (A5PSW) and RZ/T2H, RZ/N2H (ETHSW)
+	  SoCs. These switches use an 8-byte tag located after the destination
+	  MAC address.
 
 config NET_DSA_TAG_LAN9303
 	tristate "Tag driver for SMSC/Microchip LAN9303 family of switches"
-- 
2.55.0

