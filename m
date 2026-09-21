Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C46471262
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986340; cv=none; b=MG4gsb5dtJt/dyDwe5+pfRj8hmWUFg7qayrpDhSn70dhdmTf2mejorhFPDbLxu9/+8IaWp1KaL/icgJD2th4+G229wRuugPFjdAqPFogSOVN7bqiCx5frkqDTx7O7pjWiLckZ4CFE9PRdObtyaPKH02ulkA9mobLwlFcPbnbUPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986340; c=relaxed/simple;
	bh=c2XkljVYrsDaDlkozLTNqZk536VEAo7mcAWnud55+mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLvSeF1HdFilm6XUgWRs7eOZAZuVjiS+gXu+SZVToD8LNLiQVjhjNE6yWshT0iXZewqB6Icc4aUFMRhn8m7NDE87C7XzomYVEV97jisjr4j8AOTccsYOqKEQXKZFncCQZeKMrSU6ZAUNMhTBk64WkZTd6QqPSaLekkL0Gh1chy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dq0uHJTd; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dq0uHJTd"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso1377127b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986338; x=1790591138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAhM4rS8vGtagR8aFAjA1hCIKMAz6vfqxFS0S53ee9k=;
        b=Dq0uHJTdiWjuegXQqktStrWvJgtp/DJY9KN/AhSO2pPSIR6gCkRe60fltfXIUEX+/5
         tSJoaV2pscrMrU8pCRH7t3GcKCPz2G2CtZe/bn1qjnMtU0p9quesjFAuyFtcytwgnTtn
         /qWMU7JEDuj6Uz0dF5J1HZdEhppKZ0XLh88CpiJVDDBx74RCkH4c5di47rnP5F72abVd
         7nrNgCCE1CuRq0LW4KhpQQHABDfhmXsra6Bh/sa5Pa8TQp+FNmNU/9hvr0ye8km9zGv2
         72AQ3ZOj7MSfcF+K9BBOiW1Lh2VYUuLaI2ilwsxOj5Z3OcfMG4Vz/alLxB7+pbsnp3/6
         kd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986338; x=1790591138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAhM4rS8vGtagR8aFAjA1hCIKMAz6vfqxFS0S53ee9k=;
        b=lugBGO9rixyWVCX+DECGOj4yOqseNuat9OwnnUXSHfV8Ch+dE8evsj8bS3wSxAA4U/
         E0FY407xPaeZksB34ARbRtG4LK4W7RkZWoyn7RFLXm8iO8DeQljmglLDuMYLVhaxaaGz
         LNzyqJ5aEHYT/K4VseetPPPFnB8gt8qcOGL9HPu47aSsxCwc0kMjdis7FTcdvbbXbaJO
         pFT6GZNwV7moFwXwiQEPE/FKKOxVh7dUbySQP8BTCDijBrabVgWxI9CAYQ8f3usdw7LZ
         z+4SbEkE37fmAvbAWzVPD46h/f9l1/KK9aeGSb8tncL087rQcJvNaMDt5PS3/X/OhYOJ
         r28A==
X-Forwarded-Encrypted: i=1; AKwUvByco8LZCn6IpCOeUYAG0vm8DzHum3TsKBYqUkn2IHNjd78aQHmjXUCBKLpQwjr6Hrm2cdFa2hInW9oG2wk=@vger.kernel.org
X-Gm-Message-State: AFuF++kQyFTlGKZmpY3F0KMPTD/fLzFPqENlPtoBaWPl/MpohWSW+blt
	anZ8UoAKsAxoqht3ok12607gG2vjiMpU1PeffwHw+emQnr2MmOkLLGFP
X-Gm-Gg: AYBFou2Dzy3gh9+QIvKDYZqVkD01p8Hr1Gxs0GrkYUzIIbD7JLMCJdW8UgQ7tBAH4zO
	LWVk8u8To6RSqYQz9MOCY7rjMsS0sCNQP2Jr2OBfg7+vW1HUOHYSmOBFyz+yggVW+eXg6YLaAiF
	/yVtK8kKfd3TToASOpu2joVdgrP6rSaKC+RcGdnruDjmpplQMPiTrNsIWWm4jbQIrtD5V9dovCS
	7RaYQ4KLDvUbNAXP/Cg/y1J7XGE5ZZRUrULZZrRKDrKpm42sejJ2QvvyZ13JpJmroFsmtnYf33R
	PZYn9TjSUaNezsRVCxfEPqYU82HHI+LwwbfglgSNIOLBBYY/tWKHfdoIXRVTK3LoyNRE6eKGctk
	UYQatyzMcGQHECPFaJvJR+Zj/iDyVVNy/Eu0ioaLgxVnPZZcSalNrT3lim51TgFoga4WpXHSCMn
	9e4JSR37YfePkKotTaDoPyaj7asGylDMk34Z4aSwbu21/CtCIgbTixr1JVgrKzYsQvYFWxFPzcl
	80LizGIFvq/dYdHojQxNBuFMFhDwk5W2pKoTJU=
X-Received: by 2002:a05:6a00:9487:b0:878:3507:8d6b with SMTP id d2e1a72fcca58-8783508a7bemr6555638b3a.50.1789986337806;
        Mon, 21 Sep 2026 03:25:37 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:37 -0700 (PDT)
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
Subject: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
Date: Mon, 21 Sep 2026 19:25:19 +0900
Message-ID: <20260921102522.1640072-4-akkun11.open@gmail.com>
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

Reserve the binding-defined CLK_TOP_HDMTX_CLKDIG_CTS slot in
the MT8167 top clock provider with a dummy clock.

The clock is not implemented by the topckgen driver, but the
slot must remain present in the onecell data to keep the
descriptor allocation large enough for the registered IDs.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..c88c41aa7fdf 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -746,6 +746,7 @@ static const struct mtk_gate_regs top5_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &top5_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
 
 static const struct mtk_gate top_clks[] = {
+	GATE_DUMMY(CLK_TOP_HDMTX_CLKDIG_CTS, "hdmtx_clkdig_cts_dummy"),
 	/* TOP0 */
 	GATE_TOP0(CLK_TOP_PWM_MM, "pwm_mm", "pwm_mm_sel", 0),
 	GATE_TOP0(CLK_TOP_CAM_MM, "cam_mm", "camtg_mm_sel", 1),
-- 
2.55.0

