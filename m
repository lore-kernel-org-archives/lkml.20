Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0168551CF63
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983972; cv=none; b=STIyETQNMRaxhC5UgWGhZY7uqffZEEFwOvl9OXCmV5OzgF0h4CwAWjl0new7X2v1tLR+tS/nd7bNn5ly1Pq6dcGw3mWNWB+lwmXqCP7VMP+F6fdAUN4fS6TOcRE6FHFzbQcGj1+krYnjaiLJx6a0ddvQqv434gnbGkz5+U5IZrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983972; c=relaxed/simple;
	bh=/pTsHh3m7ThFgrPAd2TN0CeqomWKk3eyHd/DzPW0FuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiAMUTAB4F6k+u++Iuni08LHVsEH4aPET+zJeW2bDSGDiw7e2eBwpUB10L8XL1XEZl6aCDHmt6R8QlnXMpYrCtDesXDiHlrMfLtfZk3mh9nQhjT+WeGhn6/Ychh2CZviwCpHEQVLeYSZE34d8IjUDJD0LzHmQ1QB0S9cRBPCI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToCt6dQ9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToCt6dQ9"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1af482519so14506085e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983965; x=1792588765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3gciRTz95+N2hv4BkqSp9pRvU8mdE8196aJfMQO27k=;
        b=ToCt6dQ9WH/vOUncZfpAWaziAd2uALlf07W2DuBHBMbW8KrfIerxeVurYRMam4XWNM
         +ZAZpGyPWBP8S1OrNX6dFr9QiTxhXATI+2XxkitAwr52gcIIBxiIdV05LA7Md61dEHm9
         W0M7gndcHY7IOLOiEWWNEGVLN0LdJAsFZAsEFUkbYcNpWlshOVAx8M2ulO3LqObq9Hsw
         CP9sXwNuNOn9yKMR4ebizHQsoBt61EY83Kd2azFbEuFq8gBA6ebrAMPAmhxn7/N+Acjg
         5Joq69OFjiDUTZMuTmJ3MgjowOPGRWv37b+7hor/09U2sV+/O0zsMt51FWX5VoY9CEZh
         sJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983965; x=1792588765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3gciRTz95+N2hv4BkqSp9pRvU8mdE8196aJfMQO27k=;
        b=N/8cYdA9YnJ3HFgGm9lgqlpIpz4vUKnyBNeznpiK0CiA2i30FYlcpIYlreGiWjdVYU
         +GEfjZh2fAHqH/xjJe/B7jlExcUFpYOqiGH1P5JGog7FiqO7YY+wDnUqoq7/GRboAvTQ
         723/RR3U+Gv82wpoSRrKlzE19QFsmgysJBf7flJ14i2AJENqS9bA+pHBSLUER1gdgaDd
         o6quTCBLDPIRNWm8t2MUpc8WYHehLnK/LhqTGIuxBgqlduYFK21YmULaPvUVwqBbh23I
         CySu7cBMxrl8NS3i1WDxlJmMwMNXJSoHGt2JihUAs3ZlHbFm1wUvZxp2PEISsbt2D3QW
         WOBg==
X-Forwarded-Encrypted: i=1; AKwUvByCiOfL7vSRc7V6mCIkGWcPUyHf2gB0rgx7oIZDe+PfaMh6spuEUnpdbsqTQ/6ROGgNw0nGc9MVpNVsVAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpzXiqpGEsSDjZpmkdMZVUnVDcD6ldMjC2ZVnCVXBPHNeFQGIs
	3BdMHtpiowooEiJLkxdcJtRVWwHGdNlNGyxmFkOmC9a62+L6Ggv2YzQU
X-Gm-Gg: AYBFou3pgf0J9owqN/gBy1u30wc5rcaqnShC2AVnU/MezJg6yBkEPIw+yroXIkO5Q7T
	/8x1rOaLPoK87kwnNK88K14C+xJJKLglSJ+vK80VUu/e7u9oARfexTQRKq+kAG2EnHO2suSwaJw
	UqEVeFnMFW6sQDPXhG3mMYbzFlW1lK2tevcyam2s128MIHUWy2NegdKFepMycKTZAFzuzBHOK8a
	n6KY4VzGfTfkFZJ4C697vW4bPdR3l1G2hHNfrwbBDuHnVyhBy125QiUyffPyYARXWzsXEwhFEtz
	nbr4RAd/ntlBxk6gmcUfWUY2B2k6FR59UgIKNKc4HuUWvfwn8pC3D26Zzt0Iky0OMbLxkcG+rVg
	tCVClwfYQZlp2AC7p9bjB/m2T3SAKV7W0bXbjy8zXvczfymocxPFr6ODHEMhDpl82Mu4oOlRdg7
	4np5iymaAWFg7WxWaqkKep91S7DmiD/FY8XPpf4itNmc+NB8C6ncDhV260DEikJ/0Mjx014DApI
	MgCb0CYPj6jx5bnWRg83CiB1ckXZRQm8H0LhxPy/T4zsSxYVBH9ILY4MM2gl+LNM/zv97kNkC19
	tBSLRZ+8outB59i/Xg==
X-Received: by 2002:a05:600c:c10e:b0:4a1:93fd:913 with SMTP id 5b1f17b1804b1-4a193fd0ad6mr201613335e9.10.1791983964718;
        Wed, 14 Oct 2026 06:19:24 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:24 -0700 (PDT)
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
Subject: [PATCH net-next v3 12/13] net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
Date: Wed, 14 Oct 2026 14:19:00 +0100
Message-ID: <20261014131906.990077-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add device tree match data and configuration for the Renesas RZ/T2H
SoC Ethernet switch. The RZ/T2H uses the same A5PSW switch IP as RZ/N1
but with four ports, the DSA tagging protocol `DSA_TAG_PROTO_RZT2H_ETHSW`,
and an additional 8-byte management port frame length adjustment.

This prepares the driver to handle RZ/T2H and compatible RZ/N2H
Ethernet switch instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 30eca64fb218..933589084eea 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1334,6 +1334,14 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzt2h_of_data = {
+	.nports = 4,
+	.npcs = 3,
+	.cpu_port = 3,
+	.tag_proto = DSA_TAG_PROTO_RZT2H_ETHSW,
+	.management_port_fixed_frame_len = 0x3fff,
+};
+
 static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
@@ -1342,6 +1350,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
+	{ .compatible = "renesas,r9a09g077-ethsw", .data = &rzt2h_of_data },
 	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
-- 
2.55.0

