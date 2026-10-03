Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72739182A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017210; cv=none; b=kurVOsOECYYfTk4Vy2gs8anqtSpRGhy9YEFQXZi2av84X4+Snia8SWXj1m8Y4exfklHoYvoG/THWJy1uWHMxi7GodTdt3SwkeP9T2yH9B2eTkqj8tTXT5b8wbMEEXMJ5u4APRVWCPO4v90AFKG0ywRCjhLEVzCr98OyW/DBIhRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017210; c=relaxed/simple;
	bh=qyBCYS+MPERrvSOjCZVI+1tSKoaEhtcRPA6ygVGDDxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfoLrWZ94MaQy1rfiGQUCzTrBvX1iWxKwwUov17wweYGesQtPfkjMRFC8L/byq3dpKUejFxoJ7ONelnzipvgjZ3Kf+BiGpghYSs4BlRlAI/WR9ElM0F2DNGCzhu6LM/7HunW1Ba0VoXur+pYTLiBA1NFSK7VKbWtrCnYXYOo3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InQoq0Rq; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InQoq0Rq"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1ab17a156so66355a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017205; x=1791622005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2X6RfdoRZCSwn03+0O701g2gXtz+LDb8LKtxHTTyDg=;
        b=InQoq0RqBaTgWkx6kQg4zE3uAPWfxywz27SZsUn7iB+ErEqFQv1M+lsZlyTP0sEIYk
         eYVKA7WsLsaDeaenMAQsm9xGqG3g6HsjZeBP4qViyZB53lh9SsMlbLB1Xt/Em7XqLIGr
         123OZH8A3B+YoKgFcqwY6tAwiZFVbIbs1fTS9QuLC2Fmk7F1Hice4b+FW/vP+Ms0OwSz
         ocOK5FVnu9DIUisWurTozFJOL3E2B1+qdr7zIS7Pc/yVT83rRZR6Q7pE9L7edo6gXcKd
         ATZc5cSQJHgZvH9N1Rs9YT1sx/pM+Ukxlf/EWKpWzT9RvsxPglZvgnZ8pE1LFnCfTOPl
         ZSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017205; x=1791622005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2X6RfdoRZCSwn03+0O701g2gXtz+LDb8LKtxHTTyDg=;
        b=Mxutp82tLFSHrcPBD0LoObHSh7IQyxph5bXwaCUomKB3cSxt50CWvsBll41TUIECzJ
         VQ1LuFwUJrsJZZQqP6ywD42DfdYASSqdqfzY7lEtFQ2QrvpXWoVfmCzGEHLqKY3jCPEV
         HDQwYgnXk02nZWr4jGPOXb7yIGMMuGpSBr/gvGK+othPkhli0IG8BSfKYihjwpJkQN1H
         nwYDm9fVYkwrOyMXqT2JBv/c2Onh8Etxw+e3uqkWQ7P4lVDl/46WDfgAr/x25H33OVpD
         HuhfK3/QX21o1qGQvq/b1KruYJ1dGEzawH++cPNskDqcRna/2tJzx3VT6dduxTTzJUP4
         IaAA==
X-Forwarded-Encrypted: i=1; AKwUvBykMWVhxDinMZ/WYmiI6JrQ8eryvDrgm7CZ3evhChTlclQRPp6sP7Vp+MDoXre/pZP1RfRkMr5zo1MRiVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDLbbqDvKAIYEnE7ZomICkLL+gbJFbTlewDU/qr5lLCK9xDazf
	6sBzPvB27caWoOCcviii1E21YzI0DlfMI0/vh2FcXadIf5+HMh7abxoW
X-Gm-Gg: AYBFou2oGR1mknKicOT6AoYxsnixQnH7G4gBhaNbOq/QZDuYzD3kV9HdW90Z+o8mXiB
	6uP43wS8pE8RCU2poV96nj0zdoiCMQnycI67Mh4UpzO5Sb0dsu0nJa4BMpRLX49CfCFFrSUJWqI
	hFwsu6yPVBboupM2xBM8uuDRcIpQhFL8tx4nApbzx0DWW1WKvTQFDaJqkXn5rQxACXJpKaJWk7H
	+3WrZkEdN+lIHgTswb5mriPnCVMTv79XYXAKiSYh07RkpFHoF3kDms+eP+0EJ153MnKXN/luPt7
	Y5AnggxQGTK7i0JJZ4jIiTjxOCNl1qukS9OJ7q63QQ9TJmRpHPkf3y7uYK3jOJCkqWcMp4ET2aV
	oBXpdtFGwd+FhLbhRcW3gkP0Dz18J8peOGtIyfdrz0sNY3ZT+h5E8IssEkoQosYi0d6dSnRxJCT
	+oepb+EGBjpAJbsD20H4zY2xz4TFOZG0tL3A5KLxWZC/iLft3sRc3NlKNwbgQY8syR8QsFNsiyq
	idfQVY1sWd+H4cstBiZPmjzz9I75ZrUiqJkFZenk60P+3xTE3d0V7GkSpcL8Ax2oFcIdGA=
X-Received: by 2002:a17:90b:2804:b0:39e:3728:3b11 with SMTP id 98e67ed59e1d1-3a6ce6dc25dmr7643738a91.3.1791017204760;
        Sat, 03 Oct 2026 01:46:44 -0700 (PDT)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2208033a91.7.2026.10.03.01.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 01:46:44 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
Date: Sat,  3 Oct 2026 16:46:25 +0800
Message-ID: <20261003084627.353899-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003084627.353899-1-chenyou910331@gmail.com>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2002 has an internal 10/100 Ethernet PHY, but on the Milk-V Duo
256M the Ethernet signals only reach the RJ45 connector on the optional
USB & Ethernet IO board. The MAC (gmac0) and the MDIO multiplexer used
to reach the internal PHY are already described in cv180x.dtsi but are
disabled, and they cannot be enabled in the board devicetree because
without the IO board the same pins may be used as GPIO.

Add an overlay that enables them.

Tested on Milk-V Duo 256M with the USB & Ethernet IO board: the link
comes up at 100Mbps/Full, the interface gets an address via DHCP and
passes traffic in both directions. Without the overlay, eth0 does not
appear.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index d5c80d4ff005..49639cb0888b 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,6 +4,9 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
+sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
new file mode 100644
index 000000000000..cc93746d932c
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
+ *
+ * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
-- 
2.43.0

