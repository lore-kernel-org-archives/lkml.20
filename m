Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB4F5328B2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904737; cv=none; b=qmhrCJ5g1Uyo1O15tDCxOcEHzoDUt+/ZaHRF5DEVft/SZgfssXg/oEREEnyVu6si/OG1fq+L6H15QNuDaNAkEgznY2P308yY4GHbjETB+CjThiIcgKfQpJASffYxiTGnobs73o3qhJyxJFB9YgiDt97jANuPSZAOYAiMqAwKnxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904737; c=relaxed/simple;
	bh=6K3SkrEl0hDRYM2P4BpCm5A7jEZueESKwGIgsNB1OBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i16eRrt3c4n411YCdy0YsQbRp5k9ofGuu+dQY8eRD3vAIpb2zos1N2Xkb5EMmXPaSEJmlxBgF809oXj4nkuum7AVXs/OArAcze4iSkUZXJjDoEq7H13WzUjJrNpje7ncsM0Cmgs0RGimIS4D+oog8WJudOsfmjxUs+4X0LlvwIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBi04kmp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBi04kmp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a8af3a704fso1521930a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904734; x=1792509534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DldAa+NtWBY2ZHtMa/QGhrtb5Vlsja4TWpwxlEVTD6A=;
        b=lBi04kmpiz2uyX164nXI7S4P7uehh3nkysRF4KFuZjtv/r0Qs1xaWP2X/OprlUg7bT
         oX6sLE2EXFdjUP+a5W+N4dtZNmOJM7sg0/Xf4oQHlyDAYKY5MZUAlr9CScGgYwb1cXD4
         laP6wTVfJx+fuRw+c1LKlHRGM1kQl3vfjciPLDFlN2MVUJ0fwRRbKdD5+K7VFodYI0pO
         Fk/bQc9x2nmvYuc8Ze3UPeknE9pTbH1KgDefw3T+hUznFV+2ZF0kY/Pm0ZB9WoPGqp6K
         akhrWpqeqBfEr92ZeS72uDXriCBFSnS1kRAD11YxqYsloYWjSBcKNM8Q4jW1tqOQSVpJ
         e0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904734; x=1792509534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DldAa+NtWBY2ZHtMa/QGhrtb5Vlsja4TWpwxlEVTD6A=;
        b=G6e4GReOT9AcUCb6EW4Suo2/1HWZPQQYovMoNTX9yUHwqYrQO9YzqXRmvrOA5ilLE5
         4aQpjOPJPZaQ4c4y2ZpyvlHK2Kj2Q7XmOVKq4HkVMK/+XiHaNB8ckzBypjZ+Up0ijJVn
         VeHLUCGKFibfzu6S2Heo9s8c8u0oOPfgx2TLAbjmJNq51JNYV60sN23CK7LEzegQL/Ti
         nNJU69bb+k+gJRhhrxUp6mpebLTkCFS11rzY4GMrpcbSFNtbHoo/Aru7xEV3sOSaSIrf
         vh4JSOKk+7B8QcKae+imAICZkXELctm7BD9DrsTQSmc9A4RExBY3lXI0RvPpUjykhWFO
         8eGA==
X-Forwarded-Encrypted: i=1; AKwUvBzcczsJ+H9BVs6J2I5Bg+Exo1+Dg3WjCom9jLG39wTawHVauKre5N4eG9oEDq14dKwghgMdeCqcgsky2Z0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyJxTOJinN2uEyfooJHgyi7MoIF4yyT3BZCgrt+InzBm/+bm2j
	utAl4CkKTehk08lH06FIliCB7MBdtQqa0YekOZMjercf38EB2USBNKsb
X-Gm-Gg: AYBFou3teyjPnv5n8hc/DnCO38/DSgNekDaPxksQXJdpSW3LUwdqD80sNXX0gBFfuFH
	CaZPVlnFCbYClDrHURIEpsRBXV7S1BbcL05TkGU2epxUxGy5s6VZrWQUADhfuqXgVlMXfCWd9WE
	LBr+kCHmicZQ3y2h7wDjt/b47tllrKNNeHsyYtJ/Jdr8ZWEQIdqacs229pn9qKcMakBq3VNnY9n
	sYzmOUxUvw+ATyD8ZUk12V5tvMJv+O0Smww82FkubVK4gXclP/LH6pv0gEJk9GuTRK0GKA1KjP4
	pX8eoKQxaXRY4HxToWZsMzaXf+tjTGWTiLpITKZKeObqhLxbGYVTHdGX5BY5iuiYfn4HpkZgtE+
	m+VtazOjLxqE+Qe78BEaPPV5/LrObN3yHFznGteVrmO+zzrnjwRXVy6CRQ3ymzcOMkvPXBG0LO6
	LTu1/p7qChOv3K1zuTl1vsi/z2cyKEYqDH5UecA5oGAf6dpZFdAzA7qHpYGnIQBwRW4e/E1GK5w
	BSTFEWJFo6m18wYQinMRCogwgCM
X-Received: by 2002:a17:90b:2d86:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3ab3a60d1eamr9892006a91.20.1791904734175;
        Tue, 13 Oct 2026 08:18:54 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:53 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 10/35] clk: mediatek: Fix memory leak in mtk_clk_register_gate()
Date: Wed, 14 Oct 2026 00:17:09 +0900
Message-ID: <20261013151734.3177690-11-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a gate uses the hardware voter ops but the hardware voter
regmap is missing (e.g. the "mediatek,hardware-voter" phandle is
absent from the device tree), mtk_clk_register_gate() returns an
error without freeing the mtk_clk_gate structure allocated earlier.

Free cg on this error path.

Fixes: e504d3bdb3d0 ("clk: mediatek: clk-gate: Add ops for gates with HW voter")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Newly introduced in v2.
---
 drivers/clk/mediatek/clk-gate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index bd2fcd489a3f..0b1389993751 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -221,10 +221,12 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev,
 	init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
 	init.num_parents = gate->parent_name ? 1 : 0;
 	init.ops = gate->ops;
-	if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv)
+	if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
+		kfree(cg);
 		return dev_err_ptr_probe(
 			dev, -ENXIO,
 			"regmap not found for hardware voter clocks\n");
+	}
 
 	cg->regmap = regmap;
 	cg->regmap_hwv = regmap_hwv;
-- 
2.56.0

