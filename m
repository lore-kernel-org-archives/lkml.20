Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D451B198
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983969; cv=none; b=HdM0ShimQaf907pw3TrVwzZM1dmlbS7Onv7vRUnN2m9iGsnIIYgEIGPnp2PDin/oclvy6rdo612xcE+GbnV8TX+GW+HzGyFHICGm0s8V3YlSOcPxaf/j3FDeWC2XyE6/9gUQ68qQeLTjbgxHHnBZYGroOijvCiCW7nEF/8WKI+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983969; c=relaxed/simple;
	bh=IlLPeAF1o26mhAqsx63KGufXDG5cAXXgxoMEPAtXBe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gK4cG8Ok+ASuAmDzNwRQUfgUJdqQcua5pV6OK2eMU+enDP6W7MJuHD/17/wcaA98+BScwy4Npidf3snSjRSDg+JblatCs1MS3rrB58w4DI40AxJaB6TYMTRYWIBjqaCQIpFtXhNxYnYNUcFP1bZCU4dUnwln6zagv3U4k96/V54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9HKCMFk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9HKCMFk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so25388755e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983963; x=1792588763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VNT+5NJrdIPogjbi281FODb7RnSo1SrmMW5iB1hwVs=;
        b=d9HKCMFkoU/sXmZqIiI2Xema5fbTY732EMj8RyxOtFXJG9w3Hrg140U0Fp6mW36EiG
         lvv7gnBmAG42WtrebSjJp0FEhRjhCOwhl77p8QULuccU8rTKpnr+7sHpjMKlAb9LYr0W
         i7XrgZOUMT/oyU05gIpbB+i5JUrPW6eMToCMPlXn/9pwyE3oI6d1IB+1fyUpb/qtygz0
         RiR85Vx53T2PCj7SEiV8HajGdHvqXNfAIx7B/M94EBAB8f7v9WEa0d2RVvPicWJbzplj
         CwTU32s9F0VRtI67tIckrzhMONi5JVQy/xQyap1ySjbuPDfmcV8n9a8JLcm3D+bjsATb
         Zf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983963; x=1792588763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VNT+5NJrdIPogjbi281FODb7RnSo1SrmMW5iB1hwVs=;
        b=1f4pEQbpe+hgV3ma8xAbTbfCnrZgANsk87dfU6pKfP2gkjIPD5z+dveNShN5x+aGnR
         4UBJVeXxSEv/VeAAGscASS15NLz2eXQ4466ZWH1xdeRlfWNBNOkU69hrSk/WDYHNp0/g
         QUhIz2uffuj2jaEMJlJQxLZXGajyrglGoB5rRU/DUxuqezGjQEVQxBJOS7kIdSCeyiw0
         fjTTt1oFCUjfUEdSILRQ4TMRO627yLgZTxyIXiJXMUNHHmM/RyjEv4dnCkCZcer0g9jt
         BJWXX8WljYLBBsCEXFy2szba/B0euh55UN5VuRGqwgMO2BVg5UNmiDzxfkM4ciG/JjSH
         lTPA==
X-Forwarded-Encrypted: i=1; AKwUvByF92xKUsDeicEeX3PIH+d+ZgE22M+FxymPhFKg6Aub7gUKsRHRO8ccpxIUBi/clPItB0iefnp3LG4YaNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHAFuIKi53t+wP4o0VFwp6+mCnTeTAmje3KtF6A6c5Y1KyyeoD
	MkS5s/jtngh4KwmvP4kXFzfX3Z2Wec68MPG3NZgU3DU10Nkg274tTlKm
X-Gm-Gg: AYBFou2LqXqFbjMTUNddkNJLSp9pg88wWUJnwNFr4w3G3NimXlt+0nriYvD3pbbZRN3
	WAs3hxHXE6iOByW9fsBBsRVCCPx8QfGPf3cyYrDahmfZPBVovXwlAfPW6nwCYfQLSzGPwKdjYiz
	w9uPMOJRkSjGFPrencKdAuFNTB7WV/GDceTZszRPHlHTnNyiOcIWriXtxlJ6jG4zOcgJHlL9wPC
	SwCo1zP+IR3Hjhg+KRc4+j27NzlSDv1nFxbc0ma8ahJVTbJbbgiiUNh1D0g8mlweRgREQMhh1B8
	uH0SM7VoQkL4KhZOy8TatFI7jwSuSmCkK1fBlGjOKq7FkHJCAsXa8usullqFtIpyezLU6FLjsxW
	PRUM5cRioRILbdYwHdYzP7QLEooohbQfn7zP0ry3AjXMz+oAWOWwD1b6PLJFgOEfIo2HelbE5s0
	ym3tLEn4ubZ7MIdMQXw83YD7RPamqK2BBYCngqXJhhENA01khl3TPUnBJ+3tQ40F6S2aSAnrpF0
	hLeyZ4on9K7CEASS8WR06Uy3SSNbR6uFkn4sPwwnUL99ttttL1jqRqskIKO0wNh00bHwFWIqRED
	tV1B5GH/TEjnvpxjtw==
X-Received: by 2002:a05:600c:698d:b0:4a1:98ed:7a79 with SMTP id 5b1f17b1804b1-4a198ed7aecmr219960415e9.8.1791983962558;
        Wed, 14 Oct 2026 06:19:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v3 10/13] net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible string
Date: Wed, 14 Oct 2026 14:18:58 +0100
Message-ID: <20261014131906.990077-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the A5PSW driver for forthcoming RZ/T2H ETHSW support by making
the DSA tag protocol selectable through SoC match data. The RZ/N1 A5PSW
and RZ/T2H ETHSW share the same tagged frame layout, but interpret the
ControlData field differently, so the tag protocol cannot remain fixed.

The common tagged frame structure is:

  +----------------------+-------------------------------+
  | Field                | Size (octets)                 |
  +----------------------+-------------------------------+
  | Preamble             | 7                             |
  | SFD                  | 1                             |
  | Destination Address  | 6                             |
  | Source Address       | 6                             |
  | ControlTag (0xE001)  | 2                             |
  | ControlData          | 2                             |
  | ControlData2         | 4 (timestamp, portmask)       |
  | Type/Length          | 2                             |
  | Payload              | 0..1500 / 0..9000             |
  | Pad                  | 0..42                         |
  | FCS                  | 4                             |
  +----------------------+-------------------------------+

The ControlData semantics diverge between the two switch families:

  +---------+----------------------------------------------+
  | SoC     | ControlData bits                             |
  +---------+----------------------------------------------+
  | RZ/N1   | [0-3]: ingress port                          |
  |         | [4-15]: reserved                             |
  +---------+----------------------------------------------+
  | RZ/T2H  | [0-3]: ingress port                          |
  |         | [4]: timestamp timer select                  |
  |         | [5]: reserved                                |
  |         | [6]: RED period indicator                    |
  |         | [7-15]: reserved                             |
  +---------+----------------------------------------------+

Because these differences affect protocol semantics, select the tag
format through compatible specific data. This allows the driver to
choose the appropriate tagging protocol for each SoC while preserving
the existing RZ/N1 behaviour.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 5 ++++-
 drivers/net/dsa/rzn1_a5psw.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index c8197ef62fd2..0b0b4055e615 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -97,7 +97,9 @@ static enum dsa_tag_protocol a5psw_get_tag_protocol(struct dsa_switch *ds,
 						    int port,
 						    enum dsa_tag_protocol mp)
 {
-	return DSA_TAG_PROTO_RZN1_A5PSW;
+	struct a5psw *a5psw = ds->priv;
+
+	return a5psw->of_data->tag_proto;
 }
 
 static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
@@ -1320,6 +1322,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
 	.cpu_port = 4,
+	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 197ff5916578..e952afd95dca 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -236,11 +236,13 @@ union lk_data {
  * @nports: Number of ports in the switch
  * @npcs: Number of PCS connected to the switch
  * @cpu_port: CPU port number
+ * @tag_proto: DSA tag protocol used by the switch
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int npcs;
 	unsigned int cpu_port;
+	enum dsa_tag_protocol tag_proto;
 };
 
 /**
-- 
2.55.0

