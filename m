Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D98952D2B0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904681; cv=none; b=YYAlNro4DdkhvAsMUeLOG3LccBDaAcl4w3evWzyG1RUjvuovfY0WfNAQwpuiImkPPofO4OEe5tFRQ78Ccx7gu0y8vHJu9kLiKaADngdy66YSnT/Rw+acXz7cpufjlNOB3MFW4OrudzLKT7STsfM3vvh02NzzQEYii6d599cpuT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904681; c=relaxed/simple;
	bh=OE+gXHE9UHjIn/OavOIvjtiu1YPN517pO6UGiQZApvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ez8qLt2Rg9mSVxpwih9H20QkBmnM1SQHsuC/cljq8wjcAd7ceOAIuZShp9OtCXMk3Mqw2c0ErZOR+kr6z/XKAtJdt7rAwo2Hvme7ABzkDt0E/pzC3ChD/meqCpS9130hlqa3UkRqYNOFn9ltIffkHYLcDnVofe+B7JU/U6oDlko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGh0VHjO; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGh0VHjO"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1063648a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904677; x=1792509477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpeZCtjtr3RFnVadMQBbI2r1C6CwdAtY8VnYl6TRGII=;
        b=pGh0VHjOGadM7GlLMNhCGMjwxEVfeq+W4RQqZ9R84kNIF2rJIsQur73nuUGADCNttu
         3XkfhXqgIsAALniH0d0Il9O0yDcf+pTwHJaj7M9Vqwr+vrXfMkDnk79SXRpYZIlEHMSC
         bgUmGWqBg5XrvtnQOzK5oQYAs/TCMpgUFu2cmGUfhyb0opdaKti/7C5FlKWeZfeVCgvU
         Y78pUs9M1b6RfNOGt+yTpOUl5l7QNtJUQ4JqlKZHx2t/9rKR/G0wKJFu4VH9HrmjbQxz
         uvO2EZCXPDZ1Io7lWPZYFWWyyOpr6D5aEbAKuiJybppuPuI1n4HM49w4HiyvhWIfCMqt
         SqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904677; x=1792509477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpeZCtjtr3RFnVadMQBbI2r1C6CwdAtY8VnYl6TRGII=;
        b=VmoArsr0HMsKYTQFVq4ACWa5fTV7uxF6bFvd3EpVMR3Pi7xcJ3CNoJdSXlZLnC1Mj0
         F5GAknhoWzFmJp7bQxirxkf180Pu830Jp7LccC1GppJJgmc8ZTgmdlIPIjRv1uEgtKAF
         KzEJi+F49jwW/Z0Icmo3Igvdaq4JLBbRHyF1Uftoum0fWQuEcidyxZekUjrau6eLre5u
         XmAuY5pa+YLlsdWdokc0KrHmwY6om1dJzxVZYP9T2jAkKVST1DDT9RuD1UdaHG4fWyzR
         o1fVwm5WKP2/tZM/8Hb+L4olFFwUN9W+yh3ux0GbXbxrcETOAy9lbK9pePjr+3lgr6HB
         aghg==
X-Forwarded-Encrypted: i=1; AKwUvBzZrPvMbp5edRDin/LPz+uSGUlKXYUjL/3rwiQnc4vzCKeK5PNUjS9sHWp+YVsUiLmlDUWyCYosoX3gnWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIehOEUIvG3qY5PeAxMHBCWMxQ7BY9n3GmXvJT5nHk/w7MZ/NET
	rw9B7X7yrsHasE8rdI/FDs1BZhn8gBl6Omp+KudfADt4KteA4nMyUhNn
X-Gm-Gg: AYBFou3w7QsqKknw5AU74hNbb1h0NEr4TNgnv15FJSMbugz+MbLIYYFQy41ZEjMLW9H
	8kJWZcyOT3mKzWo3l5tXm3rA7yc7M8hiQQFX0pfixQws4pfdujjrgHdFMg+eQqnn8+bWqv7UbWd
	bBflp9Zt16fdPNp4qCyAeAM52G3si3ifyjvFUvG7XBbNrgdYZOl+PfwqqIULdp557Z/DpiSnZrt
	UAW1Esyy5KlgLVrjWdxu/iEXWKR47QhOd/KvC/soHLMxohpOoFeQhbAMHVLm7RKPCLsjNnV6tiT
	ASIu89J4rdielfSv92IBojRQhNPN/34UOEGAzyY8Ucoc+dCprB+w1L7+5fH/GmNxoR+zl3wjGwF
	4m+CUabSzCE1EyJc5BH4GdHx6chODduKdlpEd6bxrvSY8cDEi0Amv6jFfUeKjiHsyaXzfxyjnDj
	VpcSXcoCK1CelyMnKTCEhDVYmaLQ2U2rD+NxhlcfQ083e1G58B31wkuQc7ek17xVlDJNJ9MgO39
	vF8NPhXLs2+42M5vMXqdDq+jUq0
X-Received: by 2002:a05:6a20:c905:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3e16bfa50dbmr12116690637.55.1791904677448;
        Tue, 13 Oct 2026 08:17:57 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:56 -0700 (PDT)
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
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 00/35] clk: mediatek: Migrate to common probe/remove helpers and fix memory leaks
Date: Wed, 14 Oct 2026 00:16:59 +0900
Message-ID: <20261013151734.3177690-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series migrates most MediaTek clock drivers to the common
probe/remove helpers provided by the MTK clock framework.

Key changes:
- Fix memory leaks on module removal caused by missing
  platform_set_drvdata() calls (patches 1-6).
- Add missing MODULE_DEVICE_TABLE() (patches 7, 8).
- Add missing support for cpumux, PLL, FHCTL, and child-device
  population to the common helpers (patches 12-15).
- Convert all compatible clock drivers to use struct mtk_clk_desc
  and mtk_clk_simple_probe/remove (patches 16-35).

The memory leak and MODULE_DEVICE_TABLE() fixes are split from the
migration patches to allow backporting to stable.

Drivers not converted:
- MT6765 apmixedsys: requires direct register init.
- MT6795 apmixedsys: uses mtk_clk_register_ref2usb_tx().
- MT7629 eth/sgmiisys: uses a hacked probe sequence (multi-instance
  sgmii gates).
- MT8173 apmixedsys: uses mtk_clk_register_ref2usb_tx() and custom
  divider registration.
- MT8188/MT8195 topckgen: call devm_clk_hw_register_mux() and register
  a notifier.
- MT8196 vlpckgen: requires direct register init.
- MT8365 apmixedsys: uses devm_clk_hw_register_gate().

Patches 1-6 are based on
"[PATCH v2 0/6] clk: mediatek: fix memory leak on module removal"
(In addition fixed a compilation error in mt8173-infracfg)
https://lore.kernel.org/linux-mediatek/20260707074839.240676-1-akkun11.open@gmail.com/

Patch 5 fixes the same issue mentioned below
"[PATCH] clk: mediatek: clk-mt8173-apmixedsys: Invoke platform_set_drvdata on probe"
https://lore.kernel.org/linux-mediatek/20261010160134.112136-1-l.scorcia@gmail.com/

Patch 12 is based on
"[PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common probe/remove helpers"
https://lore.kernel.org/lkml/20260304181024.738391-1-akkun11.open@gmail.com/

Changes in v2:
- Add two new fixes "Fix index in composite clock unwind path" and
  "Fix memory leak in mtk_clk_register_gate()".
- Add new refactor "return 0 instead of r in __mtk_clk_simple_probe()"
- Fix missing `.data = &apmixed_desc` in the MT8167 and MT8195
  apmixedsys drivers.
- Fix PLL registration and unregistration when
  CONFIG_COMMON_CLK_MEDIATEK_FHCTL is disabled.
- Fix child-device population logic.
- Clarify the rationale in the SoC conversion commit messages.
- Minor fixes to several commit messages.
- Rebased onto `24a19b953e2a ("Linux 7.3-rc7")`
  from `075b74841bd0 ("Linux 7.2-rc6")`

Link to v1:
https://lore.kernel.org/linux-mediatek/20260803141659.559129-1-akkun11.open@gmail.com/T/

Akari Tsuyukusa (35):
  clk: mediatek: mt2712: Fix memory leak on module removal
  clk: mediatek: mt6795: Fix memory leak on module removal
  clk: mediatek: mt7622: Fix memory leak on module removal
  clk: mediatek: mt8135: Fix memory leak on module removal
  clk: mediatek: mt8173: Fix memory leak on module removal
  clk: mediatek: mt8192: Fix memory leak on module removal
  clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
  clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
  clk: mediatek: Fix index in composite clock unwind path
  clk: mediatek: Fix memory leak in mtk_clk_register_gate()
  clk: mediatek: return 0 instead of r in __mtk_clk_simple_probe()
  clk: mediatek: Add cpumux support to common probe/remove helpers
  clk: mediatek: Add PLL support to common probe/remove helpers
  clk: mediatek: Add child-device population to probe/remove helpers
  clk: mediatek: Add FHCTL support to common probe/remove helpers
  clk: mediatek: mt2701: Switch to common probe/remove helpers
  clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt6779: Switch to common probe/remove helpers
  clk: mediatek: mt6795: Switch to common probe/remove helpers
  clk: mediatek: mt6797: Switch to common probe/remove helpers
  clk: mediatek: mt7622: Switch to common probe/remove helpers
  clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
  clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
  clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
  clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
  clk: mediatek: mt8183: Switch to common probe/remove helpers
  clk: mediatek: mt8186-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8188-apmixedsys: Switch to common probe/remove
    helpers
  clk: mediatek: mt8192: Switch to common probe/remove helpers
  clk: mediatek: mt8195: Switch to common probe/remove helpers
  clk: mediatek: mt8196: Switch to common probe/remove helpers
  clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove
    helpers

 drivers/clk/mediatek/Kconfig                 |  34 +--
 drivers/clk/mediatek/clk-gate.c              |   4 +-
 drivers/clk/mediatek/clk-mt2701-aud.c        |  35 +--
 drivers/clk/mediatek/clk-mt2701.c            | 233 +++++--------------
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c |  48 +---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c |  51 +---
 drivers/clk/mediatek/clk-mt6735-imgsys.c     |   1 +
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c     |   1 +
 drivers/clk/mediatek/clk-mt6779.c            | 124 ++--------
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c |   2 +
 drivers/clk/mediatek/clk-mt6795-infracfg.c   |  70 +-----
 drivers/clk/mediatek/clk-mt6795-pericfg.c    |  71 +-----
 drivers/clk/mediatek/clk-mt6797.c            | 140 ++---------
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c |  60 +----
 drivers/clk/mediatek/clk-mt7622-aud.c        |  35 +--
 drivers/clk/mediatek/clk-mt7622-infracfg.c   |  70 +-----
 drivers/clk/mediatek/clk-mt7981-apmixed.c    |  37 +--
 drivers/clk/mediatek/clk-mt7986-apmixed.c    |  37 +--
 drivers/clk/mediatek/clk-mt7988-apmixed.c    |  40 +---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c |  48 +---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c |  58 ++---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c |   2 +
 drivers/clk/mediatek/clk-mt8173-infracfg.c   |  98 ++------
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c |  51 +---
 drivers/clk/mediatek/clk-mt8183-audio.c      |  26 +--
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  59 +----
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c |  60 +----
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  67 ++----
 drivers/clk/mediatek/clk-mt8192-aud.c        |  26 +--
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  75 ++----
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  49 +---
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  67 +-----
 drivers/clk/mediatek/clk-mt8196-mcu.c        |  96 +++-----
 drivers/clk/mediatek/clk-mt8196-mfg.c        |  84 ++-----
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c |  42 +---
 drivers/clk/mediatek/clk-mtk.c               |  90 ++++++-
 drivers/clk/mediatek/clk-mtk.h               |  12 +
 37 files changed, 496 insertions(+), 1607 deletions(-)

-- 
2.56.0

