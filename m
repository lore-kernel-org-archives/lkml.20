Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE59453444D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869435; cv=none; b=qbZROvY8zLkoO7kPgsWG58LXK3GTHKisOx5MyB6RlO+ESKtCyO882atkWkFPAGUpSte2b871TNG1XcHWVaepYhv/fzkDcWnYjnIbWIflBYYub6r8eFdyDPEboL5cixketo1GL5fAGr6ytEoPE/8/voCnsKPVZhzi2Z+fZXqi7wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869435; c=relaxed/simple;
	bh=1CsJrL5dv0jqsIRpjcW9K6WQKh7GIcyCFtOvsqLHxU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/grsNwlKmBkk5hkFS/HTrSNLjcG4hKPmXUjZJwiOS+A6ouVPsE2doGtByU+kT4HWmPKWMGvfVgaNwIMQFHhv/XKJQ+QRcRAmQvm+mu8dJLWDfHDQl/7nQX17AptHI5pZl1p5AL5RELA7/sZt82DQis58AzJS8ixd6ii0XaidqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtdR7XHP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtdR7XHP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so35166285e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869425; x=1791474225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoAP5G+rK5YjhZNDe2tKfnhAIi3bqkkWc3AxgLgsr9c=;
        b=qtdR7XHPTV41oF5Bso5O6zlM1uxmq8TSlUvYkmad0WWuzXza04T3aedE27V0O6f+OK
         d7na96qlGbz2fPOnQfIJAiPvLEoJtT5repQ3f0jHD40QK9nHKGLngrb4QmqMNGcBFU4d
         m1aYNsBnctpJsMXst6t40WnO72WuL7QsT+9Hvk1aYErNBoJSM7E+8VUG2lkQK5tW0XNA
         bt25JLQckGBke+U77aweAZV9KUqe18S3H6108NBRRIIL60zcp/oloT7lvxyRoTbB4rcS
         NFEqMnBDoVgmbpyHbqIrU8wgDSutHDHRwNZ/K6Fl0kYZDhb50+xa71iVZSvG/5+O/bW/
         buVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869425; x=1791474225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoAP5G+rK5YjhZNDe2tKfnhAIi3bqkkWc3AxgLgsr9c=;
        b=rWz4j1Wbk/uy3D8vBlRWza69MZh97pYZhjqA6kv6lCw0N+QgV/NrXxnDPGeJr/AXZ/
         oxEyqzbVev4TmE0EXWpogax+ZiwQSXTtOBoYfvrkCBdYbo9HDpWAKFyYrE0HpDSd0cUr
         i884gkIOQrqRpiEcRY14fOgEDTB/aSHY6z5bxrwfhoPlOXER2t+VkvfbaQI3LgFVzjN0
         n3jnea+jsn9WLvXkX9sLqq9MlEBTVXoMlExVLj7k/GtUqVhwn3ik+YcS73xlJ39cNwuB
         B1w4oSzpizOp/dJ8S83dyVdyRXYtl1bd3xt1cHQT8j1/pdFX4PAY/37gpfKmFO14sWQ6
         7ktg==
X-Forwarded-Encrypted: i=1; AKwUvBzx8gq8pkdRRtkCp8uXq6tGMPrkTx3CxdeMVFtLPipmJuUIfAaRZRSWHQ6YfOncovyAqaa7fDOizjI3GUI=@vger.kernel.org
X-Gm-Message-State: AFuF++mc1Kf60VdQdvguj5TaObP76gYkbe6Un3918RFstrSzSzg9eTUb
	U8ODtLRzJG5fowzF9zeweV3f06Oa+uhuEqhOUidZDOXITcL8kHH56T5H
X-Gm-Gg: AYBFou1+L9F0S5SwvDjhH6E6uLk7JkD3p7jUfaRNMznjlDFUn6jPhCpuLeWMy2hqDUe
	Pjq0aGe8GmzN+aZ1/l/mmJF8OBBYSkGgCgOtqepbQ9o0DScHcIXP69ugbTSr2PFuiTKelVVjh7m
	TDYBUkIlZH6T1kT7uIbvp006z2s8qnXLk49t4I8mxOypDXABaRWNysDwJYzW66JSTnsfwx3GF+Q
	6XDWCWoiyvLPURBU3a6alFRpAJQwnn0sH438NyYIoUOo7Gq350qDX68C4pMIiGKOgJM0ppOxnyP
	/aAXDWqTPS21c1jjyjiQDMB/5w6lRTA0YtZ2+LLYRYKqezYUV5rnJ1CZC3O+B4FySKx9LpsmmCC
	ZihYNq2FxsM3BrZWDZdQMCTdyBy8cr7qGflIhT25me3iO8Za72RGU12WWHc5MWaESSHW42DF3JO
	x8ApW7o55yNMAs7hJfVLNDGOX8L8ZP0YkNaXibK5Zna2T6/TevluMu/b/y/SqVG2n+UafDYe7DR
	XFjy7uTAIGsal71oGuY9TwrOKHsrmlEQv9GiI1kqygwk0E3fIwtjajGUaj6LAmDAzedyVFSTkpL
	UIM7x6qtYdGsHqjKUGA=
X-Received: by 2002:a05:600c:3152:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a0275977eamr262145e9.18.1790869425065;
        Thu, 01 Oct 2026 08:43:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:44 -0700 (PDT)
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
Subject: [PATCH net-next v2 11/12] net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
Date: Thu,  1 Oct 2026 16:43:24 +0100
Message-ID: <20261001154326.754314-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add device tree match data and configuration for the Renesas RZ/T2H
SoC Ethernet switch. The RZ/T2H uses the same A5PSW switch IP as RZ/N1
but with four ports, the DSA tagging protocol `DSA_TAG_PROTO_RZT2H_ETHSW`,
and an additional 8-byte management port frame length adjustment.

This prepares the driver to handle RZ/T2H and compatible RZ/N2H
Ethernet switch instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index ce931442d49f..1d5ce18b560c 100644
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

