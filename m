Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824214;
	b=Y+9myeoIO4xZLldHOvR0dWszmRJSk0TvwFV2FhgpXkyxvu0HhhE3r18iGfvg/FJUVVnS
	 YXRv4FEnMAQdOJf1Vg/YfuvNMTjvgx2Lb91xVZ7cMbYZ47Ff9GQxm/lpd9UW5Few6fMEv
	 WGfrZ956GYG8rKw9tzcF/1eDusE+xtPJo/2Jj1qJHsfQaJojMQNISHbdxPvrzxZ9fiMrG
	 rXJJgIH6TngxZnb03TBX4Jy1Hkeg0/yll7LYuVnsM8rB4b2+nscrpFpIuvLUcQAudhihs
	 afO+qibku/5+8EYsXRgSi/KYD04IM8YZc59RlvVwKHB2jiCH8040j64MWc/aL4tQxWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824214;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=83EzkV/zAuyLlWZm4+9UhuOzd9w/yrA7VpQnP7xj1HU=;
	b=lxjHdIzCdE80sT4fsVa7B/GzgD1SnNXIGSA4IJ+jGQaa8WtcbBa5UTQG9CPO//6taC75
	 TQtlcHaoz1unN3KuZTSv56bUhZTX+cq8J41weC16Z0YSDfwgTeaYM14u8HBQEoSXym3fK
	 YwoMhGzt1SfvSEjq8i/1eXlpmr9lron3AYGKwuepoy2wMZ1MARIqXF8oxnPTUVks/f08O
	 C8SLwwMtj+DflL36Wl/sN/eeffnxeNaJLLXsJ56JHfwlq7D5n5259uJW0IHuxc2eDXqE5
	 uQfuUd7vU6FFD+smBSbebhVqc8xH7rYIWeeMuOqo9gQVHnhcfV5Zf16UOBRNwNhiGkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="vsua/b1v";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B8606A329;
	Mon, 16 Nov 2026 10:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A68B8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=vsua/b1v
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 1804F1F83F;
	Mon, 16 Nov 2026 11:16:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794824211;
	bh=83EzkV/zAuyLlWZm4+9UhuOzd9w/yrA7VpQnP7xj1HU=; h=From:To:Subject;
	b=vsua/b1vNKXsbo+E3fiUVGTpu2x/+2pCG+pKdQ4gvtuekvdZUGun78eppPD9Sw1X9
	 GO9HAqsXX3gp/nfdFcj5ECFNE/tyJDkviidXcrasTs16dKfRJGvi9QeTN3/ifNa6px
	 epgUYgaJeYyNBShIumsJwuWqMI2a71QfwrMBwB+7HJjz5aZbEdjgHpnEgQSGHkk1g1
	 eAAr8wlEQ+QKXgSkPWl3CJY98HGhHXZrR7nIOUM3Vs8HLz0FQWE1V/UVIPWWy80P3M
	 5WRI961IdK9Sp+HxwCgPmRYQoeJrprVW2y4GS2jDE3DmETkuZQJn6LcAlLBy3Cel2Y
	 q5QIj/UJVQvQA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v1] net: pcs: xpcs: add 10000baseCR_Full to 10GBASE-R link modes
Date: Mon, 16 Nov 2026 11:16:44 +0100
Message-ID: <20261116101644.83097-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

An SFP+ direct attach cable is reported by the SFP layer as
10000baseCR_Full, and this link mode is missing from the 10GBASE-R
supported list, therefore xpcs_validate() masks it away and the
10GBASE-R interface cannot be used with such a cable.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/net/pcs/pcs-xpcs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6466e0ff2a98..3378528e57f0 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -114,6 +114,7 @@ static const int xpcs_100gbasep_features[] = {
 static const int xpcs_10gbaser_features[] = {
 	ETHTOOL_LINK_MODE_Pause_BIT,
 	ETHTOOL_LINK_MODE_Asym_Pause_BIT,
+	ETHTOOL_LINK_MODE_10000baseCR_Full_BIT,
 	ETHTOOL_LINK_MODE_10000baseSR_Full_BIT,
 	ETHTOOL_LINK_MODE_10000baseLR_Full_BIT,
 	ETHTOOL_LINK_MODE_10000baseLRM_Full_BIT,
-- 
2.47.3

