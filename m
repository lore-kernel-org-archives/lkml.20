Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88E450129B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983967; cv=none; b=KSD/a+4ABCLhMTxhA7ioByXNUf7DuyT6mPtLp467eT9V4aBvJgV1f0/fOrMF9Wwapy7TR9ah1P8PYgtat89wkPr7JAcWCUC5GzKIMRyVaA2toDAPWCewl5M1p+9WHpMZcaSuWxhe1VBozXPXHO49zDdk95qly5GKufeXfmE4HQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983967; c=relaxed/simple;
	bh=VvNAKorIQHESg43TUCZCQYDSXp6aYyhAAYAoIK4CrYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvWjh38GNlWaTKEpwEx24oyMQu1+9J6QDMkA7DkmyI4uHlcTyiCBlplWeCGaiFK772VUUW6qLmOm0uXfuLaleB8T5aMEnPTg89Z8nYS7XsUGMIfkyrdjnVWPEKqeVXw6lwOtuL/fiSXW2Fe5Ar/Z5Jb8wKDKP13WliWvqsMlRT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1u/W9JY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1u/W9JY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso31975785e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983959; x=1792588759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flOd5jRK0BBTxugSKV1iakG/mzV514WMwo9F+GGq2xE=;
        b=M1u/W9JY9smBJ8cLLOTcNFUCsVZQF5HlktTdU9vOH0N1NPvv4siKUYGud60ekPM5au
         VXpVN0fmxPj6CJzOmZ31ouBtzW1q15exmS+5i0bXrx6l2EeyCYs6LjnVKBYPyCBtZOCi
         GENEUt30NF98R1hitmTn/FkqeMGYOYpejxKNXRC4v9ghYI9EE1MkFwc3tV/g5sGKz3gm
         M9qGOU7uPDuycn+XRlkU0pzOz5Q0qT4JOmf3CXhLN7srdVK4N7GdTGDcqJBeS+LcY+rk
         Y7MsWZWHNd3zrqLzSjaGHKLtBM7zJoR7jW5Uj6EFsRea9l6S49z8q3Fk30X029pa7Sq4
         ec0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983959; x=1792588759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flOd5jRK0BBTxugSKV1iakG/mzV514WMwo9F+GGq2xE=;
        b=cjM2qfvhS3XEFAWxhK23sj03VYVOZf17Bpq8329iGRzMM7dhKs4NFXPGdnLPEHh6w4
         HvtnLCz2gTR8juOXB3+2lUtJh3v6+TKBI8xJ40AHaTqWY+pkHgz9HxeMlAckuaeLlR+G
         4O7sEDHaEd409LNYEPoVBp4+SfUIrJe4E41T7691p9ODu58TgOByYaZiUST4rc03QEDf
         759d4kGLh0I/Dkbwan0/JFGGcJgAnjuP+4gkryLqQ3GBNsciL4PxZ3rhcCzlrAEhgh+g
         cqHS0KK6YhT6HtXNoxMmdPPr3fHYr8OemV3pf46IllJzcvltl4bBGHARsSKbou2m8pM4
         3IAA==
X-Forwarded-Encrypted: i=1; AKwUvBxQRVqeGHXIBfuFYQfLS3ixZsktR+IC3ZaPI7oyFGYAIAYPTHH6XyJO8ORHE0Z9zy83KhJnDaOaVE9eZzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNBDPCJp3cmm+XIO4ebMmz7800zEu86XbjXLwrf0vZTpSHXU43
	wsVgMEHUELQkFSMK87k3nRfp7B1wpDo1amkG6us8sMblKGbJODrMSa2H
X-Gm-Gg: AYBFou1aXyM5dJb1PVp19z69T1KDAj3wOfVrrRbfa2y6c1GSd3831dk7pHho/+rgh0g
	9c3XMY3rOF/UbiHfTkI99vmCfv05VTCS3EFBtGxx5GNH99HFRwecHKSFBWtgSQeWaiOeb1kIOE6
	yHxXlHYUzLD0/x3xaX7SywI2zTbiidChHvptE9xCmOgli6a4JE37qko/SydbiC5OrsBF3HQjvYV
	Nhi97/ymHBOtUyrY6LkgX7wCnKzjq+GNOUQCJW+nL7DZPyOGKgqNKiZs+Fm4aacMR2QcUGExmnQ
	ykB6bI3pkvQtkR4b4GnPFadVq0isSFthPH9a3OrIWviCq/2lDehDMnBwS51uGtue3SipjwPBYkY
	67BD4Ej7oErmL1Dv2GtePkXa3eFIhotfGVcsK+8arneDNjEIEn1bTuo4yG6If79ydMTpeH73rAu
	H+n6jQhZjk+HkhrCJz6hhtThMVtGW+fUdOFuZesBhFlxc+qZoxEHiuXR82nTjoAdnm4MtbKoMNW
	qXc4lh66nhPTwNbxg0o6pmVchl64o8Hua3Iz7cuQWqUDHCOHfkfHtT0EFQ18gJeXi7ljzZjELLx
	ef18rm5EQ/SaLbv/gMZcnaVozpC2
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr278007335e9.8.1791983958736;
        Wed, 14 Oct 2026 06:19:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:18 -0700 (PDT)
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
Subject: [PATCH net-next v3 07/13] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Wed, 14 Oct 2026 14:18:55 +0100
Message-ID: <20261014131906.990077-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
driver. Some SoC variants provide a dedicated clock source for
timestamping or time synchronization features within the Ethernet
switch IP.

Request and enable this clock during probe if defined in the device tree.
If the clock is not present, the driver continues to operate normally.

This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
the Ethernet switch includes a timestamp clock input.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 9daa5d8245df..846216f22bc3 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1212,6 +1212,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
+	struct clk *ts;
 	int ret;
 
 	a5psw = devm_kzalloc(dev, sizeof(*a5psw), GFP_KERNEL);
@@ -1245,6 +1246,13 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	ts = devm_clk_get_optional_enabled(dev, "ts");
+	if (IS_ERR(ts)) {
+		ret = PTR_ERR(ts);
+		dev_err_probe(dev, ret, "failed get ts clock\n");
+		goto free_pcs;
+	}
+
 	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
-- 
2.55.0

