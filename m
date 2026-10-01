Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2585531AE4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869425; cv=none; b=pp+XcVQ6GlSlBL4++mVa+7O/ErThW5yz7KbR+pKuCc/Ws66sZ+08KzEATSQ9tRgwHMIfjKMLhee42Dfc1slLutBDWx8csO05WBCUyT+MOoogRy0rR6w3p7GnduqmNtYtAbHwNhNeLMzwqBLKu4XQIgvB58khY9hmdzQ2A402PJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869425; c=relaxed/simple;
	bh=YskAwpR/mGuRgSSU6DdBPgodvjjIZ8+/rOUSY446yvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/YbZytaqWI7/JaMYMvAahcgpxDzdj5Jxw4Lk/IK9ZYcuusKqHe8H+GUg1ksT8bo9YzSiBbNuIh1aXL5uKmvtS8+VZrdT4A8xM55cHB1kUdLOdrCNPj2ikMXPs4ZpX8S4qAF9O8Tud4ImXZsD4HvGhxGshU9t/GBrB84yex5OqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKAXv6cZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKAXv6cZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso49617115e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869420; x=1791474220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/xBG81+Esek94aYUr997cbgEWln/OwkjDM1Q1+8oQ8=;
        b=aKAXv6cZo+5Z8VzOiVgz5QRQcchRNs/lpNbKn1/h0SQZco9jACjDDM1YpZMRccpFp7
         EN+7qT5msz0zx3mMUhntnJ5eRgOqQgmSgAAi3GRcUhxg4qyw5gVuwQODt/WAFvblMiKY
         zuuYU/Q+9Opi8l5B+FtjXJoLmDZncxfjTPBPJKyA7EoR6+n2aU8Wk4zXQl3+aNYAsWWs
         RQTrztcC6q0YNuMA9Q8lA2PTLzHEQg3uZVpLIyfMAJgEvBEQ7Uv5eq/XmWzM5HZfkKsC
         r90v06OR1K3HQQNjEzw4addbbQS7H+9hfS6+B19MIGkYK0LsYRdTMQGtwjNpvK5O5Zga
         aIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869420; x=1791474220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/xBG81+Esek94aYUr997cbgEWln/OwkjDM1Q1+8oQ8=;
        b=gN3eCdIHl1uDW0alG5tQra52gaDWfUPp+YBLZj93AvVDehjsBo6D8NCNA4Lb0sj1/p
         U8P08gEEgksekTf2b7hMAAEv9+lg8SRfG1JbiVpdiqFkEm0umbhYPNF9MQYLX1ulxJai
         Iiur+eQntA5spaWVWD+K7NpCnQZNX3m9YQ3n+d6vEq1Un8kp4RpYBrBxVma52+NbeaOx
         dpWv/fMXUt1wxpbJ8eZJFUX1asTeQXdVHxkdYT7tuikuj2vUcqstsuqMbC7wLBwVJMf+
         c2Mxn7j7OyjXx39bprBx46dXCG+0eGJ5zF1Qo5o/gvThjH4imGnhsRfqAdAiRFZXcNUa
         z7yQ==
X-Forwarded-Encrypted: i=1; AKwUvByi8fs5BqpLOJx90tn9pHTqeb8V5Thq6q1jQafdAiz5VTWqrP8I1OsQmPmU/2zPnsuIhF2jI91FnsWnIIY=@vger.kernel.org
X-Gm-Message-State: AFuF++lcr4f3QuIhbwXD9tFsr2REEYfSkCkKIpM/5aNeIlDX+WoGSIHS
	RYLmR/z9pXqEx+sWEhAdOy8d/Jyq8/ZaY/pD23kIB9EIJY/laWxbjIfp
X-Gm-Gg: AYBFou2v47H+7SCvDETZVDwiIvUJUFdSoMmDzf2+jzZQzYm3/mtzMd0a/HI9r4gtr9T
	wzoqf/oMznqrBjCsjIGTZK0Z9vWik7/nsrQPrpHJ5uV49Gb/qDZt6jvvv9YWUjT3VXu9Tl1gkUj
	XuRvcKCl43JLpTVA3Z6jaR7nl587GOuXutx7l4zx+vFkHDD9+Hiwxzgc3pok/yZ+gVpVVQ8Eu62
	BTRdrREh/SfBEsvmun8L734OKWGI6iy/3Hx7B/ZXmdBOOv7nZ8jcGdhwdD/e/2LZwQpLhRzv6rL
	ZBePo6rztg4m2raIcYxmU9eodztaS8orIzENecf8oujl7UcUYWzRKmN3LF1DHw2R1xMBEZtC1aE
	w6Pemj81jJEOM5vipJfxmk/TRv5375N0vzSa6C/dPbKrXuAc1VCqBnLYbtLS4SsRIUz2dnBtGe4
	4qoWAvflOZw4AIWlRwLUupKYxWmb3paoCzLpWQ2CYp3AFzSkSZeYI+ocv8nYUV2CEtifU2F//T5
	cr7a1INd9398ndzINRWE/E7sEoDpSJFc4pu85Yl0jNv+7b7TKlQYwk4a4s1ZEyZmsXRECOmcS46
	HpL4iN9l
X-Received: by 2002:a05:600c:46d0:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-4a0275a28d5mr165735e9.25.1790869419554;
        Thu, 01 Oct 2026 08:43:39 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:38 -0700 (PDT)
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
Subject: [PATCH net-next v2 06/12] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Thu,  1 Oct 2026 16:43:19 +0100
Message-ID: <20261001154326.754314-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

