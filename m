Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266D4471267
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986336; cv=none; b=Eco+3P0azr283bVeg4sXt3xaK+olTmVoTI+XZK+Y3PtgyE3ZyS+g2Il4tnz9hfGPflspKr6pUb3+hZrRLOIMJnd4VIk20XF3sg3OjEjH4GzBb9Y38yizU4YNFGK+/BJDtwf/o+s/fXNC4RYx9JXLB4g3dn30PlbvKtutw2ETKVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986336; c=relaxed/simple;
	bh=IejuY1OCZv8AYpXQ4UyNnE7VmX2yxCTrj1q4ybqC9pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edKuDi440hbgJ3zX4Olni/2OguYdP/VrgD9WxQ1LYUL7CkqFJI8qYgjuVcc9uL/6c9SdQQHgzLXFhFON72XIuH4aqXWKA1L+9qFs9hgtmlvHaPsXAwLaK5xDpEWT1mnh+r4NbtCL5KkU3GEA5KjcoIyxIsAqlc5IZy+mbs+Eq0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOdiAyuH; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOdiAyuH"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so2892850b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986334; x=1790591134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zghCP5qddDssD+/Zn2nncsxv0muFxosiwEXR8TK7rAA=;
        b=IOdiAyuHmaGusauKIcgq1jmpO2BCtOk+dNWy4u3WtjNJQO2/9PpWTOfIfw4Kh6uryE
         mz+P4zB5y1QwiFwuvnpjGzfOvYS1ugnKTsnlZprf/WrV5O5GyRpJuQI5bmy9/g3jdlM1
         8WgN8xSuj9SK6Q2T+Wua9x8yDCbS9K0pcnj0gIYuYkaEcbkqF0a2yPEv1e4xkIJwqCNx
         DYhHkZ6FrX1zwlsFmiitXowi8bKhN6cJXk5XLYY7wi8K5udg5D2WFVusfboJCGo9rATY
         76n5h3s+jJbN/5vDu08eivdBf8eMN8Phg0SvYMoIY4b82ixhcb7Ar1iqYe1KrluCmFNC
         /kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986334; x=1790591134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zghCP5qddDssD+/Zn2nncsxv0muFxosiwEXR8TK7rAA=;
        b=NFK/gXipzFdtYiZFbWisx7TK49Jl4oKINMZpIFu/MSolVagENNB0hIGoLzpyhRXwby
         Z6mleaKkV9rBfmN4eBK0dogrUVaHxV53jrsKPGy1ZlAYW9ELlqIeIwnVr8c25Ef/FHSF
         AweDgoYJBRBGArnLkRDm9yxBBZsjUNJljADgd5X0EpS6uzn5HBZ8reeFKXlo6keI0yky
         xoy7eNtIzCa+15MmHOseXPI+G2drxdj2p94mwsP0crncmcoy+Y5OclyDYIQPh32+TpxH
         yEXy+x/40gSBDyBDjD8pdNA5wQ1HUVw6NIH2qYO04KCgbgjutjviy5HN0Kbg5IDShgZC
         bjwg==
X-Forwarded-Encrypted: i=1; AKwUvBzj2Ryep9xzmmMyafiuWpiSQAzIXqkCOU126dl3WRUkXNFdNhe5rbBDqauG5CjumAMl5slhPctpXQrKFHY=@vger.kernel.org
X-Gm-Message-State: AFuF++lY00fDzKvrwFOop5n7tegv28KywpSmBlmkqZmXPmRLeQO6iUqp
	Lwv4WyzsbYPdpEEYJO7FVkbBAN5EtGgByuuzL//Q02HKvaWnWxmP+AJh
X-Gm-Gg: AYBFou2NGKuij8hOIe5LxhAtxywrFAQQE9J4vPu1l4r6zYcbk5Q9xN1Naxtwz2t/OUG
	GsBCL4A5RMZjogLwnAlYpZLRWCwQEY/PMAmwYOoX57FeFM2RoqhwtZLAdTN3qsz45MNvuagcBYr
	6lwhjZsLwZlGnXRyB4ZfhnbTCbqaUj/0f7DT0I8D7Malfe6GHI/PFR1A1JtCKQqkfPAsUQNJ++h
	wHi6B019v6WN5ldyj9vx7XvR1ftS7wShEAEjNnCuLhqksBRhsTsm8AsNgk9+oPRlfOAZZulz5VV
	/5PxTLiJq3AyyK9PEgJvB+0mmWUjf13sEfZjHsC6HZ8M1vv5B5xtPVqmO6zQiaOb8ddszXUkCN0
	f6dXBeBHJFnAe7JOdlVsZgpkEE5eT6AWH0u4U9iOXCYFyCQRKZIFAkXGWO25mkkAkxcERyH8TEF
	jvDo4U/BfMVxrLrEvShvgvx6tIzduQ1I+GWRUf6jS6KkZoEhCLKpIowXwvQ5AqqW5TTeo3Ruk9F
	wtsUxcboKE/toZX6KLWj2UR+/X0OqpH0Z69MvI=
X-Received: by 2002:a05:6a00:32cb:b0:874:705d:f655 with SMTP id d2e1a72fcca58-874deafb8cfmr14424938b3a.35.1789986334443;
        Mon, 21 Sep 2026 03:25:34 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:34 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 2/6] clk: mediatek: Fix MT6797 clock onecell IDs
Date: Mon, 21 Sep 2026 19:25:18 +0900
Message-ID: <20260921102522.1640072-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing dummy clock at ID 0 to the MT6797 image,
multimedia, VDEC and VENC clock providers.

This keeps the descriptor-based onecell allocations consistent
with the binding clock IDs and prevents out-of-bounds accesses.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6797-img.c  | 1 +
 drivers/clk/mediatek/clk-mt6797-mm.c   | 1 +
 drivers/clk/mediatek/clk-mt6797-vdec.c | 1 +
 drivers/clk/mediatek/clk-mt6797-venc.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6797-img.c b/drivers/clk/mediatek/clk-mt6797-img.c
index 338c69234f24..2a42ec0a4b14 100644
--- a/drivers/clk/mediatek/clk-mt6797-img.c
+++ b/drivers/clk/mediatek/clk-mt6797-img.c
@@ -20,6 +20,7 @@ static const struct mtk_gate_regs img_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &img_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate img_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "img_dummy"),
 	GATE_IMG(CLK_IMG_FDVT, "img_fdvt", "mm_sel", 11),
 	GATE_IMG(CLK_IMG_DPE, "img_dpe", "mm_sel", 10),
 	GATE_IMG(CLK_IMG_DIP, "img_dip", "mm_sel", 6),
diff --git a/drivers/clk/mediatek/clk-mt6797-mm.c b/drivers/clk/mediatek/clk-mt6797-mm.c
index ddb40b8a1a7d..d2349c1d2a55 100644
--- a/drivers/clk/mediatek/clk-mt6797-mm.c
+++ b/drivers/clk/mediatek/clk-mt6797-mm.c
@@ -30,6 +30,7 @@ static const struct mtk_gate_regs mm1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &mm1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate mm_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "mm_dummy"),
 	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
 	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
 	GATE_MM0(CLK_MM_SMI_LARB5, "mm_smi_larb5", "mm_sel", 2),
diff --git a/drivers/clk/mediatek/clk-mt6797-vdec.c b/drivers/clk/mediatek/clk-mt6797-vdec.c
index d832f48123f5..73339310fb51 100644
--- a/drivers/clk/mediatek/clk-mt6797-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6797-vdec.c
@@ -31,6 +31,7 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate vdec_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "vdec_dummy"),
 	GATE_VDEC0(CLK_VDEC_CKEN_ENG, "vdec_cken_eng", "vdec_sel", 8),
 	GATE_VDEC0(CLK_VDEC_ACTIVE, "vdec_active", "vdec_sel", 4),
 	GATE_VDEC0(CLK_VDEC_CKEN, "vdec_cken", "vdec_sel", 0),
diff --git a/drivers/clk/mediatek/clk-mt6797-venc.c b/drivers/clk/mediatek/clk-mt6797-venc.c
index fd4446f4a9d7..f616d61a0de4 100644
--- a/drivers/clk/mediatek/clk-mt6797-venc.c
+++ b/drivers/clk/mediatek/clk-mt6797-venc.c
@@ -22,6 +22,7 @@ static const struct mtk_gate_regs venc_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate venc_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "venc_dummy"),
 	GATE_VENC(CLK_VENC_0, "venc_0", "mm_sel", 0),
 	GATE_VENC(CLK_VENC_1, "venc_1", "venc_sel", 4),
 	GATE_VENC(CLK_VENC_2, "venc_2", "venc_sel", 8),
-- 
2.55.0

