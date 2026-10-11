Received: from mail-qk2-f10.google.com (mail-qk2-f10.google.com [74.125.230.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3755E456DE6
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748642; cv=none; b=O4yR+tQhOv43R0bcbGbZVI1N7P8jxDNujCV2osTYlHxM7qidNpaKmj1GmFQjCwMpLp7HCszhFqwExak1hEVjT64ea6zpDOhKhf3yZi/VT8BmONVmEhS9EiWhQG/0dWaZj3qL7Mt8eUwIhNJDhWGVvlPUKQDZ3tXEw4MEXDvQLa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748642; c=relaxed/simple;
	bh=1ILQ+U7Fm5XjAul9HYGzD8lpDpaW5gM4yITeSwIUeNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJAps9cufgn4IWoMmkZrzfyu3z1uXq1LIekxBNiv6AUC0Bdtw1UFqWz037K8bok8NMjvr8uy6yyy96CAjRhXQV0She9L12d6E4EdamZKjlTibK14MZB79/9WLDhZFUne1VG/yPtdVlm/4oNPIol1mszOJFMr14niGN60WiIOoiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvEPggWa; arc=none smtp.client-ip=74.125.230.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvEPggWa"
Received: by mail-qk2-f10.google.com with SMTP id af79cd13be357-93e67431372so120100385a.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748639; x=1792353439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybYSdKsTtQmBTL9u8kO8sl68Iedi9IlFuOT60yw2EWU=;
        b=QvEPggWaCIOvx2JHe7xHKCOijpV5qKq5TeEW9X02zCIu/28yORcgEVT3VKOSM5Frt2
         k/uGc2iMaShWRRpl4zJ4Ot4WblNVJ+CMKcrRL+GhaUb4UHk07OHZTMSMZBQavFLJrrvo
         DAUxyBY0P/zKe/C+UGN9rRo82lDq4MO1r6LLbwOfKt3U3KzmX5rPfV0YsjLy2QaCE9WU
         I+EEAYWT5HEEzvBc51tVzjMrzHloJojBMW4dWFKxaTzPl5jc+dryGJDY0lMXyyQZ5VDw
         Kk6jbbCz063sLamSAEDc/XlP0zPZlnJbloCfEU/VU2pBHhD7D46yCv3oTXWvHdAcRkoY
         NtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748639; x=1792353439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybYSdKsTtQmBTL9u8kO8sl68Iedi9IlFuOT60yw2EWU=;
        b=wqoTPZx8Sb6V0zVGmobFr2U8vsdi/r3muhp57d7uSAxob/3NV+TEJJd7uO+qcJUziG
         dMDeZ6SfUpOhRJNgm0EJ8tXHoxax/LjCcFhK0XuUh6pD76yyFYkqIVct8ciJZsNMAR9W
         2YpIUPZgRWrYxhxwkjfrBoH0yoHOY3eJTAej8iWQz6ozifHrrozvtQZbo+fkv8lMwZcr
         zXSdJpukjgfOaXcHAd8rexN4AfcJyTl+UEZbAHgQc6zg5dyIMjcRcz3Wd3adsYSGkyny
         v+0koE1PatxnbP+2Gy4GQccZRjfWoyEN6WKUtxVh4b3ltqjOw25ctU4VFN6dmTcd8199
         l1PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKXulaQwUavgi0iCaoN6QNht7fhFAz708uH8nUpNz+UBq8W9rzWc88UvmyF7jP4ahTw94nbZi33NsaANk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIUwYMm2vpd6uHmYLXT2q0TKrPpy+qEL3e2IzSO3pNH3BXWQms
	I16C5rQ7EKOyXr+XX0RO3sJkwwdzMDYgFkI9CS4zEVWhbgaFKW4Djglk
X-Gm-Gg: AYBFou3numE88dmsoLnu7c0UduatcXcGqiy+szduKdFQxKcqnX+aZKWXG7B/HFiH5Su
	2UANiSZoEKAjOl7scaXnGykCdrwMIe/vwtxExumMreNEd30qdW9qceeDE4iwTQLVkKk/7AOuOwA
	79Kd4KAhVQApoX+pnBpiQfyOlr99b0kwd/+QcA9zkX/o9hvZ9JlwDHgGHDhGzjvzMDw+H+4+TXt
	Ze1DAJVydScCnxQbjjFjAuFyjvFY8B204XH34DMqy92PY6CUtxGjJT2mT/MWxXu4dgIiNs8j8dh
	lTD2vgON9AliMamSzueDENkzsTBGZsGFtnc/aSWx2ZOgvtcI3hEhTWcmkEjmFjewxXyg23IHIln
	8U9nC80PtD9Vw+Px8qGGZXCnY8DHLGISGSzN+BPOHMjLw8GxbOHSyd0BNUIQYadwvPOZmOpJB31
	83GbvDNGeKl8H9oHuHqtX5rts0AnZtvmZIHeaBOfoypGbCx1SR+a1ElzpZHP6utTAfrOU=
X-Received: by 2002:a05:620a:2912:b0:93e:a818:c8b1 with SMTP id af79cd13be357-93ebd0d01edmr1283130285a.9.1791748639122;
        Sun, 11 Oct 2026 12:57:19 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e832edsm77803306d6.4.2026.10.11.12.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:57:18 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8189: Don't let the GPU reference mux retune MAINPLL
Date: Sun, 11 Oct 2026 15:56:12 -0400
Message-ID: <20261011195612.1663714-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-19-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-19-5df247f56938@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mfg_sel_mfgpll selects the GPU clock from mfg_ref_sel or mfgpll and has
CLK_SET_RATE_PARENT, so a GPU rate request (Panfrost devfreq) goes
through __clk_mux_determine_rate(), which evaluates both parents.
mfg_ref_sel is a MUX_GATE_CLR_SET_UPD() and so also has
CLK_SET_RATE_PARENT, as does its mainpll_d6 parent: through it, any GPU
OPP can be met exactly by retuning MAINPLL to six times the requested
rate. mfg_ref_sel is parent 0, so it wins over mfgpll whenever both match.

On an MT8189 Chromebook, MAINPLL therefore followed the GPU: 2340 MHz
for the 390 MHz OPP instead of the 2184 MHz the firmware sets, and 3360
or 3570 MHz while the GPU ran at 560 or 595 MHz. Everything else derived
from MAINPLL moved with it: the peripheral and memory buses, and the
display PWM, whose backlight frequency jumped from 2 to about 3 kHz for
tens of milliseconds under GPU load. That showed as a visible brightness
flicker.

mfg_ref_sel is only the reference/bypass parent that the mux notifier
switches to while MFGPLL relocks. Don't let it propagate rate changes,
as MT8195 does for its top_mfg_core_tmp. The GPU then gets its rates
from MFGPLL, and MAINPLL stays at its firmware rate.

Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---
Found on top of v6 ("[PATCH v6 19/27] clk: mediatek: Add MT8189 topckgen
clock support"); it applies to that patch and can be squashed into it.

Testing: Lenovo IdeaPad Slim 3 Chromebook (MT8189, "quigon"),
next-20261008 plus this series and local board support, Panfrost on the
Mali-G57 with devfreq. Before: MAINPLL 2340 MHz at idle and 3360/3570 MHz
under GPU load, read from clk_summary; the display PWM's actual period
(debugfs/pwm) went from 500 us to 348/328 us with it. After: every GPU
OPP from 390 to 1100 MHz forced through devfreq min/max_freq, and
scrolling a busy page: the GPU always on mfgpll, MAINPLL fixed at
2184 MHz, the PWM steady, no flicker. No device tree change needed (the
mux selects mfgpll by itself). Built with W=1.

 drivers/clk/mediatek/clk-mt8189-topckgen.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/mediatek/clk-mt8189-topckgen.c
index 6ed7661119b8..ff9fd5115c5b 100644
--- a/drivers/clk/mediatek/clk-mt8189-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c
@@ -818,9 +818,13 @@ static const struct mtk_mux top_muxes[] = {
 			     dxcc_parents, 0x100, 0x104, 0x108,
 			     24, 2, 31, 0x0c, 1),
 	/* CLK_CFG_16 */
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
-			     mfg_ref_parents, 0x110, 0x114, 0x118,
-			     0, 2, 7, 0x0c, 2),
+	/*
+	 * Reference/bypass parent of mfg_sel_mfgpll: don't propagate rate
+	 * requests, or GPU DVFS retunes MAINPLL through mainpll_d6.
+	 */
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
+				   mfg_ref_parents, 0x110, 0x114, 0x118,
+				   0, 2, 7, 0x0c, 2, 0),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MDP0_SEL, "mdp0_sel",
 			     mmsys_parents, 0x110, 0x114, 0x118,
 			     8, 4, 15, 0x0c, 3),
-- 
2.43.0

