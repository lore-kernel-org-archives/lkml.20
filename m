Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816477;
	b=DaJElr/PUE0ZZV2ITCRnYx2gLtxR14mNb/gLcyBBTlxMMHGrTbNwZSZqtlodsuFexBB6
	 Z89EJ6cmQlCNI1UaDtlVX7lalZojZv/ZnJhQsaI3qx86uZvzBOIVm40Bg46S848bwfToB
	 ckhbgP8F1JO6p5mVyzcMYCNzVysL31Nb8AbZC2fJzi6QGRKdcWZAo9QSUmlexE6O34WsE
	 29Rj+2nLvNJRsrfA3ukKRDwbd/hjwQCI64Dsgocozb0uVcOZnBoKM536GZfX09IzcqNl1
	 +I52DUNPFyYAEK8O9rodOEOk6aVZprWEJNhxtZw5TbQzQVQJeN7YniwS//C5zGKsidg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3KWlsc/MZRnBDaOP5Xm04uDW6oFxIqc/gzrmAKgcexc=;
	b=tM2YWiOVPy//1BV/eOkIXkx/i+ORoWN9mdC6/iFCdYNs82DFb4NblluFNFsyJXw/VO+t
	 +25wzOjxuLzR5QHOz3jvsv5dyr/K49bfM71zoU+dkDQWlBgBnAzSDQ+Zfhnxru4LLhctC
	 bcMHYlP03Rale9R65HrF7uMA242E7nCn47gKcwEBZtuHggiLxFUKyLP+5RnMNyM/3ADYu
	 oYdcNGBtMqbTOkIOYxD5syLBu+MZl0aq19kyFpUtX2ZERNLDXy8VGQDZGbQhFzX8ZuJFi
	 nJ/rG0aJjAE1hdNftoaTKG4iR1G9gleL+DNXlFR5ZHEcdDzbLdKemuZn8Uwqd9xcelw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyCqQvQu;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E44606EEBD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E44606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YyCqQvQu
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10917635e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816475; x=1794421275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KWlsc/MZRnBDaOP5Xm04uDW6oFxIqc/gzrmAKgcexc=;
        b=YyCqQvQuEYo69t3a9xwwzjVfNUuHUWilbjAWINrDWWKi1yamWhH8BiItOVbO4H/yWm
         XSZBQ2gJ0ztDtXDJ3kBFKhq95utIIsNeoXGheZdoEThPVP410gnp25KySXX0fvnEuLPw
         lI2xPEh2Cz0X3q/CE1csWfQxcKdNYonViM3NqdI8b/DSDfd0SqWXuDVXfrLiiibzQtS9
         9cljp0HmqiZKA/8GY/P9NudfMlhL86Bv9FcxR06wZwVye1DE7XPcy3vRExOBaVOyGegb
         96ROIWvAJFo1/+4z+PMFXlWBJ/ZmAgRSprxXrkqQv5kWvz+KNevuW9Koc780rFGt4KDF
         AUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816475; x=1794421275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KWlsc/MZRnBDaOP5Xm04uDW6oFxIqc/gzrmAKgcexc=;
        b=PBTQ6BEuu/gVyZmSPvNN730d70ubZtWl3VwmGJ84ul8dZ3G7YPXaUqtCFofZy/3Ip4
         koM5Hs2i95HYtSZTNLvj6wkwXrhTAMgsH/7T63HBQOpaWYGA43ZW/0sePUO2oHyS+cLc
         V3E7n3TxL0vM4jz29y9oKyfzS2s0d+B6lMuOQZt8MA+t7C+dPTTZjMJNn2IGrU8VWDX9
         PD4ZIJQ4ap3uLe9EHqBaUjT8VDBF8B1mjsst30RzZStr5mnNyxOIIH6vXnD1mD3lPBs/
         9+sC7KsL4vh2bSK2XbQyOcFnkchCmeA/NMxGha9E7yPVursS463YCo6MEMlAYBjnsW7I
         5QCg==
X-Forwarded-Encrypted: i=1; AKwUvBxIO5aqex4RA1+416lyxiMJxr4LlHaQCteqWoYeR39Cw+xhem6pxoR2XVK1b6jpdHQiguDep/GxPymHRzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z84pNnrDeqq2UHd9WFOAZ4XhEGG7mizN+H6uBAoWtVNbFzHjZgx
	ujTO+mqyGtCRvAZtTWo3g3Htd0LinPBel2bqVjdYH2tKEpIZU9BDBBbr
X-Gm-Gg: AYBFou09+E2mPP7r06cFB2yejjgkmv2ga2BUmHQAGNzuoGYxJAAZ5M3o/FsjGrsW/m9
	n1sK1qfPeBvr+iPz+pCf1YGLf+3Va6hLlZsRDIWM8ch/iWFRluWr9Q8ZfYTBAfs7ettde03stjA
	c8pPS5Tg//KR8LjQrduekEs4KVU/nI+CE+SfoRE9uRRWIpECvVIPqfJfOIEsanH3egBTn6+opWP
	HFWSD4HwzlKKndhB2EJ7eTek5ILCBymBH0VGod1AozBpLYhDsvXqPs3tiA6Y+hKsO3yiwPvddPX
	5cB1/ICt6yLFCqNzjY9kyYACWGvuMRt4Rvgqmh7I/r9Hz68D1x1j2S+IBUNowSwyaSaM8WLPa0m
	fwHX4PFkYSjK1wvWmDceLsd0E8dSHddt9Ze+11hAgBSJdVwUNms/UBDkjhl/7CR3u3Ye/jIUbs6
	AoIpW7eVeA9FMXRXQgKTm0CbFUS2R5c/whJ1O0aVwO/k92OSBRiVT5wOBsN13BsvVc55G/QBSdt
	uxUUAwZmFj3j46r6COGXvrO6z54vyj44MBLcDx+TtdqlHcNWjeSFeb2psEAqHDHkyChwysDhKsA
	o/oROODKaWvDZMedP8dRX5jyL1Wt1/m6KE7gcMFWoxg+4bG0xRJFXnoILy7k/6v0/F0XWNG17l0
	PKsKXPd+XFY5VuRmtobpjesmjKpBSlnOQ1DGx3g==
X-Received: by 2002:a05:600c:628d:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4ac17d16b99mr372467265e9.11.1793816475506;
        Wed, 04 Nov 2026 10:21:15 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:13 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH net-next v4 03/14] net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW
Date: Wed,  4 Nov 2026 18:20:51 +0000
Message-ID: <20261104182105.1102555-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
the same tagging format is also used by the ETHSW blocks found in Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- No change

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
2.56.0

