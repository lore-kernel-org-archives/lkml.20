Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E657947F3DD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468437; cv=none; b=Z0OZ1d1LxBTskx+RmOy/KbLrY6rAoC3sighlZHmBE3kKBRq9rN4j3xZqTvbIb/jP8MfFoXbhewEy6FpVnD97vK86J+ZFdfOfa/4bjpeffRlzMcN7dGUnPcq49zkQ3Lbli478zUDJQqt3iMhKG68XSGgqToEI2y4xJjOKMeOjmi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468437; c=relaxed/simple;
	bh=24iyB0qQIhRBRLcksSKKzm9eIHZVgNfeEOfit53HP7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csSQQV5nM7nt+zR8u8IMRKhRlwvxTQXzTkc1mOBV7lICODvvFCYurtjVl+LlRKEUfYBWpwxobuCS9O54fHW2grFfWeeKPduAHu+HqeMRnx72TYdG+K1/Qwomh3Ca+2lqNDNFOosBnh31GlUPLCV7ciweQknOTNY4baPoxfllkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0hxpsZO; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0hxpsZO"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so19964666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468432; x=1790073232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vA9NWFMPC9pCLE/rtR1qK/Zvon8swdWRLmKM7jQZ0lo=;
        b=U0hxpsZOV2ZwRr8HuCE/aCrFM/LucWFFC6+C12Ye+qwO8JjW9GfiSc8BgMy+aAWQio
         DcB7dehQ6+si7t9BFzEzgW99jtBOtzZ7MYeA/5xDjxCEPe/bmYO2tFVuUEW3B0w4rOxS
         Bm8eSt1VPJPeV2wHzohX8z5ywXAcFDl/DAGhxx+KnNyQMEOTiIYDCjbye8NQStjQMW6h
         C7GW/xO9ZVxdIGc8W4xRwIARxbLe5RNYJlEXymRVvrxLogS20hnauwXGdzLl0jISPJav
         7MAZbXSIZj5QfDQjIlgJVA9s2Cx/p/mEh/jyB1M/ELEVhgOMOGg4Kyf3/Ndd1/zExlHr
         YcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468432; x=1790073232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA9NWFMPC9pCLE/rtR1qK/Zvon8swdWRLmKM7jQZ0lo=;
        b=BleAzmS/wi2aHNkSR536OKN8uZDyUxCYbbCac/nKqUSceeKyRoniMSBRvKHE+kQAZb
         sbhyyB+BXJvNm/1yXoTpLCsjfS81HwrBYfbO2gJcark5Hb2urRQV+Z11i/xL+Bd1O37G
         3AfBshcpkgejITvJlc1fO8cnPOJi2Cz5loYv6XPsi0aY8TaA2UyIpkuzwDUEpZ7EzoQ2
         IxkKmOT0a+OcLWkIa2JMa0GOFDCa7fPXaSwPsjx6UJKV/Z2gtCkfys+cgcOZ2ix0f1og
         4gTft/Xr31EtlpQHjAS50e2VID6WsVe2aCcCszsFzBuLxDtK6mh260+YxQSQa81Bu8fX
         t2tQ==
X-Forwarded-Encrypted: i=1; AKwUvByB4pMU7alC1Q1S5e0Tr562i1mSIAIw1rbz+lgQNC24e80eVN/O1cLGDtvjbhlVzQT6wCRmHvEjliqboCU=@vger.kernel.org
X-Gm-Message-State: AFuF++nEl/DMjxEZj3FH8JZG50XWcgLRAfmShVImgxRSwWKxR2AFalmJ
	XlBg849GTyv+Zo3GfqnxJ18+UkAaTVoXEQ6TV3WMzWQl6sGr4Yui09+9
X-Gm-Gg: AYBFou1G+ov1f3lusIr+fpcfFtbic9LOZCXnHj3GnAwfsBVJSz4EQ8K8kDtrec1xkzE
	X81itszR7Gac3YCBR26sKdQ9jRYc6WY3q1IT71AiT0IGi3PvqCMWKmiHX+gZ6CSN97P0hBci2wj
	nrxhmCsers7ZQQEyGeyyBMS+F3lw7lLHHp1IwR5oJyixlJ/ldx+O/woL2Sm+aheqUqzqGHZIC+p
	sPyfVF+0rnCRYuOFaXT4cL3PIqKaUIgKXwCl49kvKLOdtp4+1ua3U50GFMraLNjAGseInlditoj
	jpgNeOoF2lxATuO8yoP6PAE9GgTYyHwUDjgNRPlsUXumgOMqESl8RakLNM8paNUhaQkNvBKf8Wt
	IbB0/oIjvUtbATl4ahkmM4b0noW3h0zLFhkpwIVtA0zgR9Sz3kevPYZ4XNuDxHEtPXTzHb1yRGO
	6LOz2hrJjnUKggi006/yRLMNudNqWi1fWlQIq3qvOI+0RW5xT4/NC2bYgTWvoVyrhap4BM+Rc3d
	gk1zW/mErJe4xZxi1WSdkS/VWAzaOYe04e7SF2FevMmQvcBDXjq27217RqZxF7sMTVQ9yw04CYC
	Vn87qGUfe9hIbkAXg19jXDXaiuTG4PG5nRbz16c9nTCzng55pXcQGnJ3ZjsRa9+QoOY0WAKYOcs
	3ObxfaGaICztHEBBYQ9lVFL4939Lp0tKhKblC/gdUtsVxEhcnveHPA+86IrfuPHYmXKY6nVwdgs
	je4OHujEdG/4bPcRbVSj8YB97VtRoit/XbZl2W4PHKXsEw/SnyqR2lMMukUUwwSGYJJXSH5UIcc
	SMyh+tm24ESojrk
X-Received: by 2002:a17:906:7307:b0:c29:5a76:72be with SMTP id a640c23a62f3a-c29d78fed36mr38938066b.24.1789468431681;
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] clk: imx: scu: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 10:33:45 +0000
Message-ID: <20260915103345.1334-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915103345.1334-1-joshua.crofts1@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_clk_scu_probe() disables PM runtime on failure, but doesn't call the
pm_runtime_dont_use_autosuspend() function, causing potential resource
leaks.

Add the missing function calls.

Found using Coccinelle.

Fixes: 18a50f82cd2f ("clk: imx: scu: Do not enable runtime PM for CPU clks")
Fixes: 78edeb080330 ("clk: imx: scu: add runtime pm support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/clk/imx/clk-scu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 44220e9c5c2a..18f73e679331 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -525,6 +525,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 		if (ret) {
 			pm_genpd_remove_device(dev);
 			pm_runtime_disable(dev);
+			pm_runtime_dont_use_autosuspend(dev);
 			return ret;
 		}
 	}
@@ -533,6 +534,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 			   clk->rsrc, clk->clk_type);
 	if (IS_ERR(hw)) {
 		pm_runtime_disable(dev);
+		pm_runtime_dont_use_autosuspend(dev);
 		return PTR_ERR(hw);
 	}
 
-- 
2.47.3

