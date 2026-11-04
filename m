Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816474;
	b=hVH4lCrgrTvZRXz2KlRpoB2o6sOY6Z6ADoiFOtcS+A5Eg5iv7YiYB8EZI7KvwP7WwqhH
	 rG+tIP7y1QlnmAwHUYJdEnWdoqwbDHT4ZzKQe7jyvCvuzPrHz+csxfe8/+7st/UGGE21p
	 aygM/izqTWebj9ylR0SQMn9gVzupXSUik54ZN7lcW0y5FfDM0D0tROUsMkC5wAXZENBxZ
	 oZodr08c+QnpowgUqxvgd1U9Z5vah6X/vcJOsJirATdWbXrSYZN3VyBgvy9JxTGhEOxkh
	 VZRg4pFL3dDZulwbCf4g27S4zYwq5DEX8gUXARj+nfqmK4QO+VBfITRwEg5hq5A7Uzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Sr6nSQY3uWEqkIiMYzgpKENOs6ABbPBnX5Q/I3z4scA=;
	b=xDnA2HH6sSrPB6aUtSS/r/Lm/ioEtjriRdhqiYnwt2bD+v1IyvomZ5CtSjfJIxIn5yIM
	 nW2FSOjjhR8vO4ZPCzMKmX5PGMqQULr1jnfSP5kxttij72BbNKOCuMUsCY6fk3Zuislw3
	 NTUmXn8imILguULsu9kjxN44VCsszMBZstTgeu1JsSFbuVTl+ndZLzsIqFeLqMcbM5rf+
	 mqHohAiTKKY2pCny3vsEkobvwdwsE3h161DTpuC+EwE/4x4fKCGUv1VKPs36WcIpyZBQn
	 XqpKIpA6AO3mLxI1n8RZgtcG/fH4FiusJ1TY9ZXRsw/DjJsWgh9FIt3mrwdzfBNlbPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAEQE6J6;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F28606EE88
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F28606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAEQE6J6
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0728so294927f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816472; x=1794421272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sr6nSQY3uWEqkIiMYzgpKENOs6ABbPBnX5Q/I3z4scA=;
        b=aAEQE6J6Yd08SLoynnSdAXVwopPn6rtlIDJWOD5R8ioPI4Aouvtdxf/xvyFkxsyk4T
         +H1DeyosJh1gmvdcTb2osWw4xOEEqFOHPjNDOQRom9A022bCE6TWjeDkzda+jx4ugBfw
         Y82DNo8MYfpJzNOUY7c0Qk5keLwWfpb/BCiClIZVCrt2jRR9stgc82IxppQsTZiIn7Pp
         hWWGOcRY0O6P2kzykkA08Xl4YcSuQaf0chOjzl+iCqv9/WVrxucS+mbB/Bm2xOqahBR4
         wqxLP6rzpkE42Evn3Frr1K3hyTWRJs01Nfl9NKai0lKiGbEkCYdDDlUtZsSldH13kEQG
         gnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816472; x=1794421272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sr6nSQY3uWEqkIiMYzgpKENOs6ABbPBnX5Q/I3z4scA=;
        b=j25gxQ3WLFMMUrFKaVUL1/O1GnmPF1W4YyiIp4qDxcVrzuRHj6orKISInx//73hs0q
         wBiOWCCVwuTPdlf8Aw54zgoFnR5fbVQfni6izBhSvEtR6HikyNyE6pScKCKlNof7j+6t
         fpJSmSadUuBHBqKPXGG3G4BYbeitJEubYTm/27DlHo1dkTsd7//dsXBljeMO/hLOybzY
         ewnRVGKtJ9Y4h1dbcZzUybJLh6sZBFWrRR34MeKkvo9rerQg5ItVLyWQQmXoJcFmh2GH
         l0EGuE1mLPCtngRkFzpcAAJVrbNyh08uubaOE7nveJzdicAOIBT1kEZsObzYA4U7Tt6h
         R33g==
X-Forwarded-Encrypted: i=1; AKwUvBymiwWoMloOriPqUeJC+pnW+Q3cSFBMIzqIPOCren2sxSxsjJr2d3EpzQ2wzS1J2JR+22dP6ApMsLxb3DM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AivoFQfzL+Qy72gzf1bbDml5ORySqkE0Yj3vFSyKQNjmXq1MH
	7UEJtJXUYyme/jjZVES7Dbi4W3LR5vd7iiGmA9Goly2jeP83kGI70rbS
X-Gm-Gg: AYBFou18VuRCNDzNHvBr9AlQXmLGRGMlm24gcs+uAgf+NwgHRaR+BaWPV3lH6IYw6bR
	mEHNQEPNbxqnd/lKrZ1PxBPmAezzuVjg6rbl63Z1S/xLgN48MU6jcyQ0kPyexlsH7DgqcVuj+QO
	r47RpljtCBNCqjRCKcWB0QC6uh1C3AzMeI7xcXYtwHZmjk08mdkz3JZ8wcci6TD0a4gBCXCRZTK
	OC23jeS2UFEJvWNcx9e/OYbielqtXwQoVvRyKnaTrtejWpTvd3iI66qe+FPY3dkYj16VqO1VZco
	/5ouduPF9JjswImNcgWSBYNhNqdzUeVI+vkmIWCKAIfvAVZ3MtOzIDNCTUOIEyZ5hGvw9uCVG45
	8Y+ahM9DFkWlG6T58tiAB/zI5DpBvsQlAVSjkuUi9Ds8XFns1iPoFLbX8vLJ2ly9xId/ZxqB5vM
	E0sCXlO8XMg2cl1/QxgbY9eibEzjrC6JtTf4el1TVZjPiD1uI7nhtOULqH+xwcnqEy6d3Lmez4E
	IXpk0pcsjN4tT6UKKuZR6kzDQdLQ+vOvpjRIoNtmT3FeluO3vCXQ1kRB9ejr5k75yCM6ClMwP2e
	VTmH3O+fuTo4u4WY+3zTObQoFx9jkKq4o0L3yjHPdKxXIA4GpQU3HbLq6y3xGnp4WoaYwEkXl8Q
	Wa8ciRKYDW1f588D1fTgoC+g8KitQo8L4LiA8Wg==
X-Received: by 2002:a05:6000:2089:b0:48c:4f6f:62e3 with SMTP id ffacd0b85a97d-48e6e2eb736mr34348488f8f.18.1793816472184;
        Wed, 04 Nov 2026 10:21:12 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:11 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next v4 01/14] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Wed,  4 Nov 2026 18:20:49 +0000
Message-ID: <20261104182105.1102555-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tag
---
 net/dsa/tag_rzn1_a5psw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 734910156dc3..aab0ec143c77 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -24,7 +24,6 @@
 
 #define A5PSW_NAME			"a5psw"
 
-#define ETH_P_DSA_A5PSW			0xE001
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
 /* This is both used for xmit tag and rcv tagging */
-- 
2.56.0

