Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C5470EA8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986348; cv=none; b=Z7+lW7Y/Nfq8zGdzL3OksCVgzq7TW039I6L8Qs5v2NOtTieEvkADt5QmTBGXy9u80CrFkZOy5GvSxmYxicF8B2fYcSmX2sjy3zJ+psOiOlZIypIbcC4wby3lB3EMbA8pETUCfaN0Pe9J9mzuVmXanJj19920hopclUhaFSCJkHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986348; c=relaxed/simple;
	bh=UrnuOQDF3Rlf7YDhO1FbPPEjfZZuOk0ueh2Uyejiap8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmrN3eBb0HgSso2JREHHBjpQQrWEjH9+0H0Tc8J0YG/A0fg+sGyeLuR4fwdbEPC42d73x9uWbT3/nxDsWvXHcUPLzfMA2WbrrdniyZSVXfqMOMSV52Jj4UPtXI8+BF722AxQUVZNEKOay1ySTPjBuHlxsxv2jk9MHi6SWa4W3o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWX+ODpJ; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWX+ODpJ"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so3036984b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986347; x=1790591147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7tYSkJ6lOcONG+Kk7MS1jRgYa+E91ac/ILJT9gEeSM=;
        b=QWX+ODpJamICGmba5SZEGpavYPMsVg5CaEBRh3TmxHOk6e/DpSKiwE6BlrfE7sGIE4
         C285HWZr7D38EP1TcnnAUlKXqAM25YzUBkQLf1rQZU8/+hZjTdiFI39MCzeSG48XLWct
         N6ggxJOZWbxuuxpaCmoBLrQgnNx4Sb46AqRTorKlab1WLVyfheTXN2kUSukssgfdN0Xp
         0L1DK8/jK/WKC9DYh2cduy7WGuR+03cA9ZLcn+GJ4d7YRZZSMTD+eSbm4x9elU+HSSRY
         hnWz4Y2Rn0JDts8RI0HMxNDcl9HVcAaMwpo2ofgQCkFNe+7fe8FPVvMx2WJyNvnS2f77
         RJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986347; x=1790591147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7tYSkJ6lOcONG+Kk7MS1jRgYa+E91ac/ILJT9gEeSM=;
        b=0XefhDK/kg6uK6ezvDcQGpMIRCX2uRx/qVtcznXLeDsCrwQqm5Q6IMrk/zR4XBr7u3
         52nZnNS8/DUciJ4KvSz16IAct5X+GX9m7TlrJgtiue9kA+AZPqbA4PTJ01Yirm9mJGWH
         ML/7hFBsoC1O9LwyeAzkpPtkG4Hqgje8cRnPE5yGbrF0bL7a7vBWA9cqQlMahqgmFleW
         bIepw1IyGq8WfpuJJK/S5+Fk38fWvVpOSHt7vU0QXo/C1bypyeDEDD0j3peulNqjGvSS
         HtqdMujaS3QH5Fg+GdwmYseRWqKxT7S+Ny43Tg7WR2eb2xsHNo0zgWAk47kQjBzit3CH
         /U9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIJ+hW1s/FnmelD+WrM+raa2568/2UYaZEXltF16Vy7OV2+sC7cr3npA9VlYlXVbI2UDU8O3MHzBi+cC0=@vger.kernel.org
X-Gm-Message-State: AFuF++kE/SVvQ5jdL1nrpLGl8PWfsrl5Ycya/go3AN/qrojdJwZmLW2N
	CikK+8gbTF/ek6dBFvdyQeTqtCc7K/T/t5PkGLyDSS4MRXbH9pBX+HZy
X-Gm-Gg: AYBFou0jVYRhR7ghStiGMuVNC4yPRZoEFMCcn+qZL1Op2SxVV/E5qvOMyVtwwYnw6QY
	anhTeLKkZiqMUF7cOHlXrJIzdVNQapececDE1kxodkHw9aA6wqbAHEtp7nkdVnUd1OnKyrXZZXJ
	NaLWd0EH5OUbNFpOgcRtrty8yccIchh7Byt31bTGSlCAI5I22jSgzfujK05JGpNm8j0Cuwb25wX
	4n3olpE5HrJhzC7vdsDXFDVNvG/QqwSJw9tw9sB8fyTMDTjWjLNj4Jbd6KA8p3An7MNN85g2ggq
	j1FR0AzCPkHT7Y81P1oI/In8kMx8LBb0K/y359svfV6txZWRtaPcj2+t5xVT6mCF6spJbBHYXtu
	IT+at65BYISI/rcar7dXJwwCag7nqlgtCdYLSkWSUPaQXXHeR+RDMChx7ngCnfQYyvJ6YJwmtMw
	T0Q3QrrjojqQG4yLObImzAd7GksWtna4FrU//VqtCV5QDfrl2ZqSaOn/+MuLG3MxjXVclPzKWtZ
	nyazXy/oIFcQX53RT9Equnh3qHP2bhgKUm9NPI=
X-Received: by 2002:a05:6a00:159b:b0:878:34e7:9a40 with SMTP id d2e1a72fcca58-87834e7a3c9mr6176607b3a.57.1789986346569;
        Mon, 21 Sep 2026 03:25:46 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:46 -0700 (PDT)
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
Subject: [PATCH 6/6] clk: mediatek: Reserve missing MT8516 top clock IDs
Date: Mon, 21 Sep 2026 19:25:22 +0900
Message-ID: <20260921102522.1640072-7-akkun11.open@gmail.com>
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

Reserve the binding-defined CLK_TOP_EMI_DDRPHY_SEL and
CLK_TOP_DDRPHYCFG_SEL slots in the MT8516 top clock provider
with dummy clocks.

These muxes are not implemented by the Linux MT8516 clock
driver, but their binding IDs must remain represented in the
onecell data to preserve a valid ID-to-slot mapping.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8516.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 342a59019fea..b64674559878 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -545,6 +545,8 @@ static const struct mtk_gate_regs top5_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &top5_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate top_clks[] = {
+	GATE_DUMMY(CLK_TOP_EMI_DDRPHY_SEL, "emi_ddrphy_sel_dummy"),
+	GATE_DUMMY(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel_dummy"),
 	/* TOP1 */
 	GATE_TOP1(CLK_TOP_THEM, "them", "ahb_infra_sel", 1),
 	GATE_TOP1(CLK_TOP_APDMA, "apdma", "ahb_infra_sel", 2),
-- 
2.55.0

