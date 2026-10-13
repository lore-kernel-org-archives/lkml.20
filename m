Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB90530E10
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904712; cv=none; b=gNLJTW9y5QUAGlUrRSxE9ORh66WA4UYrptQvby7VZqFi9/BACpTiMPTyhlq43RL8rCsTM4WVR2mda+y8DokUAMGL502gQjmBujqGy/Y6W9x1rgSUilMC+jfocp2ubNbPV8Hcfs4kGETjddMFOTn/7TAUs5JcGtPS6LftfOsiRI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904712; c=relaxed/simple;
	bh=kI48R3fJE4JTl82VzeEKG7bnMrIy6krPzjytHDhI1KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCM30ffX7sroyPTnpac5ATe5Jrn/SYim/zIUVcvFDpj5RseWiFSphINEgoNUER6wyd2g+TUcySPay6LHol0WSycxoNq53wCHIJGAU7IrC8MbKWHR8l0tHTSNPvo1Hqv8wVXzrIcJMDq51VI7pz+6B0bde9RXp2jkfOwYTuCjCL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5zM1+8l; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5zM1+8l"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1050354a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904711; x=1792509511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=;
        b=j5zM1+8lKv8jz4VFmzHpU75dcnRBIoBwktsh4QVNeEstlvTZAR7G1NnE5c5V3LNLmU
         DwykOagHGOOhHtkVRNaaORjbfY810DH/djWk5ckNsT7ze9Ji4eSlF9OAXcU7z6gIjh1N
         dcN/28XMLxOPzGEYBxytrdAeGOuFrewj+AO6Rb926l06/w2hbmdrH2k8rhraGEgV/TTB
         /PMul6E26vI/uvqj3GJVCYBd5F2QvFWCLHvptOCkWX5eU5HMiixoLrcJqRH7yJFHNeOU
         GBo7i14nZ3AHRoTJARJTyXm4PXHltq0Qf+RxyW5L7RnEOqxm6mZ+mCQHsj03WC86kYhh
         eI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904711; x=1792509511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=;
        b=H5gzvZF/3QdJRjMsFKbyBaTPgGnZP8wqbnfZBIctS0Z3nycfbXRrPugW6FUQarBEL4
         6vuqrmeGdrLW7KkNDAItA4h3HIEowxPisAXnzFzCZ6MV7A7tt9fprvfV4KrC+L3gsxco
         K74YxomKLUZXBHEFkvcqqNr0sUmxTz381wqrCm2vrIPNFl0u3w/vSvRu92V4V0Hi2HHB
         wARMZmFMB//n0SP47IXZNiv8EB/mydAstqnJnlloNk1J6Pp8ABjkkA3RJ+86y/oK0a9l
         kdmyp3Lc5ySsSWNmu6zyN86iAxj1w8Z4RR6Kf3gIvq1jZUnaYmCOLCwAU75QoHyzPEdY
         CD5w==
X-Forwarded-Encrypted: i=1; AKwUvBwHNRz+Qb+GeWqE/hx3AVb2Hk2j2VWeVu/Z5Zg2h4K23haR2kcXkvw4yEd6/l7JdUvjSwkbLuRpgaOMxNs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKszCVBKNorCoSKp05dBPBGr9RuqJvauvN6bW6hu4Ro011z+OEu
	LEJPSDJOG9iWq4hBf4tOoUzvJjuCu617EMjrAmJ4dvvHkBPBpnKwqk/I
X-Gm-Gg: AYBFou0JsEZJgMdMt3J+hgw7QZlP+PKFBgwi6hQwc66yIU2+FlmwdmxCKr3the+JX2u
	lXDiHRDanz65Dj9zG87/feRzSca4vgccaxDewaylRLCtXUaJJuXR21ursFbN/HPvXlr45uwdS5b
	59Gs70htVv0zMQ1Ys9TnLQ1Ilq+123HPA1Bt0HO1rnJx3yy+vw7oUQxXQLqYSDFFTvtJIYR9/eU
	KMqiOPB/t+J37wAzm0pI66GelvtRgFYKCrahDtQlmjPF3rfXTnBDsw4hToWKmBKmJTVTVR7L9ua
	Nvle9J2JLvsQlmGmAorhsp3gB2TCLFcyh+ncH6dRwL4MuUK2eWhz7sLo4wiuuAd6gJxuwc0gGg0
	8bTRiCvUBI+U5EJSr0rZovSvkQQMYifpZsazuo2oCd4OkexWasmwPWj4JcisRrsUn7BXMv6cQ16
	EBpRp/730Q/TzDwqLAIipNacgYlm8/Vfw6kRnXq6NlmyZhBCPX65Zfw7nO9Jk2Kf2kHanyIM9+B
	5nqGu2aRQ7ERI6sQNmbN/CVNq6G
X-Received: by 2002:a05:6a21:394c:b0:3de:3f4d:f2bc with SMTP id adf61e73a8af0-3e16badf2a9mr12154427637.1.1791904710777;
        Tue, 13 Oct 2026 08:18:30 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:30 -0700 (PDT)
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
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 06/35] clk: mediatek: mt8192: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:05 +0900
Message-ID: <20261013151734.3177690-7-akkun11.open@gmail.com>
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

clk_mt8192_apmixed_probe() in clk-mt8192-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8192_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..e6ac40e2f12d 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -176,6 +176,8 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
-- 
2.56.0

