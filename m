Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8D476078
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529751; cv=none; b=CBIrPhizMEP2PfhkXpnwu6R50WHnzxAb93/NU4wDiOUTt4+voa+qAyrxOzIW4/VxsOBzAWbkDmOUxHnJCV00LCFUY/gx8nHYACmPMAE/50YBTxXyOwmgtJESZRK3z/NYuF7bDHgeB9aAuBzdw3jXaKXbUEvJNxzZqt/0gKliuZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529751; c=relaxed/simple;
	bh=9Ns4ghOs8PLCySKAYGuPPTtS6qsiHfgzhNih4mkhjLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtPaN6ZErSXAajYo+vLYEOiKmfKZqv9OiOyPOiZxBws5ECC8mesaebEeLqOq+iyq89kxoFW6ilBAsOCo9ruxCnZ0iTDl2Ih7T5JaM/TgGCSpmPDnyCPt7eJJx8AKkzUZEnQg0yA3lodppq1A4qCBTh181zVeNLUViwXoGcYsc3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYOI4PTa; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYOI4PTa"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1036201a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788529749; x=1789134549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIW572LpZg88/9zoCd0pfmQgexIR84aCpztA1cYPl3M=;
        b=ZYOI4PTa11mmNYFoVudoEk5ccAMAKEG3tr5ZIVt3UD2YrxdxUrmwDGQfkQBh7WlMcO
         /R1A0cwdr3d1v3gVzlaA01K7PTyUJxz+6fa9kpbc06YHn5eIlUq9w7931abteLm3e1P7
         +WeQINSvyQ0GnOkfSQJhKioehrGm8oQ/GXsJLCE8a4S1j86H1CienfCo1pL0r+b6rKyi
         AThF2x/lln/HB4kcvGME7vr9fE5NA2XNiPTZm85cf4H2amkHp0b+KADvi5p8pxMfvF68
         tc4PxMdRs551yzrD4aM9/7HDy63JXaH77DBe320+gOzwQCo/QA8qEpuzwGFJIW2g2C9A
         7row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529749; x=1789134549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIW572LpZg88/9zoCd0pfmQgexIR84aCpztA1cYPl3M=;
        b=mQjbkio76++RN01xxfRNUuy1QdAjjQ0of0WTDWwx8kEX9c26NzWwvrPtvHhmd1vy8T
         SnftpD/OsjUvEhcmWELECC9N6dcyApD34DwJTL0F3FDyv5qyo6d+1O93urWHjSNNjhoA
         GFNspdDPrm9DongudPqYOCgYCd45L2BU5r/xEsRGO9EjcNd8dZGT+JF1DBK33Oxt0tCe
         YzGckGBSC2Yv8ObVKPNoOfG0O5w8ky1ngzDsjcT5sTCJLOuU2ugcSW29TRPJHj1Ri3WD
         PpvyPPT2LFTTFQyY0UZYU3hh/tv7A8MLtA+DFbSLhCyLnUkghPdHt7v82KxyMl6o9rE8
         yILg==
X-Forwarded-Encrypted: i=1; AKwUvByDJ2hX3xM+iVbJIhB7UPJpVo8ZMn4pru45wth1HKgWsDFUybD7knK2g+TGKwngJ3ro+pn0LWLUoeqQQ3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lfGB/2ChFhgVlECvUzSXRsBXg8wYjuHZyPUPk+7+xf7yDipOdc
	a30hZUepokclQLLmFPcU1zQ9ik+FWf8E2Ttesex4ocA5G5GJbFe8g/xS
X-Gm-Gg: AYBFou3TyrDyJYn9zPTMuOeIienzduCve0s7fhZ6biwPgxQqufna6Td3kliqM6pPvRC
	2JN97LiLzYjdgG+B0yIuCdSMPin2DXOkoaj0N1DZ2sYYWRhtQPTMjP53EFBGq+N1h+nuiYtawiv
	+pYRlXqU5j7JxmZueCi5UU+GqeFlkp3wnX/pLskrjWspRdBAbkexq2r7gYQ5O1cNaE37Awe4BL/
	+C3B+wuQzoZueon3BQwN5ruoC82/fIosuEFc2wvmTJPF7/INF7k6pky7Bfr+q2iszw8czqni4wm
	zkw3X/PLBeG8f3R1odHRzcy0pnnrcALG8H0JlYvCRIJFlN8tdVIusF2JTAx/5+mY6t01AdlkrJK
	L7iP2ln58bSwq1FRZocayaRVk8CfaC/2M3GjMNcAVX0k9mSudGcSXtSYXvoyUlDarur5U/lnh8s
	/n5rqV4X50sJMsiWPZJvU8yz5O0aWltGF9c5DCb3vI9Ou2qdWBr2Pwf4CYbspIFfzfZlu06erPU
	vkOQ03u8mPUaTw=
X-Received: by 2002:a17:90b:5287:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-39b26202ea4mr9184929a91.12.1788529749056;
        Fri, 04 Sep 2026 06:49:09 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661b:3050::4d0:46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc060sm12561892a91.3.2026.09.04.06.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:49:08 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: dsa: motorcomm: Handle degenerated blink delays
Date: Fri,  4 Sep 2026 21:47:46 +0800
Message-ID: <20260904134752.635133-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED core defines delay_on == 0 as steady off and delay_off == 0 as
steady on, which was treated as a blink in our LED driver. Fix it.

Fixes: 9af9a8168213 ("net: dsa: motorcomm: Add LED support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/leds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/leds.c b/drivers/net/dsa/motorcomm/leds.c
index 7d3c0f68d8ff..87a6b9cf6068 100644
--- a/drivers/net/dsa/motorcomm/leds.c
+++ b/drivers/net/dsa/motorcomm/leds.c
@@ -107,6 +107,8 @@ yt921x_led_blink_set(struct yt921x_priv *priv, int port, int group,
 		       YT921X_LED_DUTY(1, 2);
 
 		use_cycle = false;
+	} else if (!*onp || !*offp) {
+		return yt921x_led_force_set(priv, port, group, *onp);
 	} else {
 		res = yt921x_led_blink_select(priv, *onp, *offp, &cycle, &duty);
 		if (res)
-- 
2.53.0

