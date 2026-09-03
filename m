Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21554370ACA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476368; cv=none; b=b9YKJDHdimsVqQgL6OMrzzWukr56bgIa2P2DhMEAmuGaYetmDnQA+X4DNQipbsYho7E6tsYpN//l0UXk+Ytm1mYlizJwo9ELx0s5ICaaVCopa/+U0ray2f6BgjbxBp8mdXBj4mN9/TiYB6oZi/w2+TrFZLfBIuP6wT9MKnMCiZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476368; c=relaxed/simple;
	bh=q0PEkNH4X+PaMAyot1IOtz3LQ1vAi3SlCfuAqTtRk8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+SGBO26PEVK8IIg2KHvDP2uOq0BWLyiIbyJ/6sjzFN9NrDrzvXiEZMkeQXFiRkEnlpB0YgW4y23iB2q2Js4rjzr2iXcQCe7J6yoRgNwxqSau4rTeCdOmQ9BEOOo0COm/3pukUX1jKw2QfbcwY7rjFlD4QyRVLRgHWGfGpn/W3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e067e908so371825f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476364; x=1789081164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUDONbWsQf4g8On4R7HSZLyPEP705AHSMo8bYRBit5E=;
        b=aAvNgK43bxuZ7zGFX1UMcljj1y4BlwLBTspnvbElocmVXwYZGboWWJqTQniHJ4WCjj
         QNTaza5utTo34pH14Vr9SKS3/oPy7OT0WnCfFSW95mEeFlXhkiHFGPK5EboZXPJR0aag
         Q9t1iS9d8FbodWiFrSx3A0fSFCS/eywzS66op2nlGHM8WcKY4NDJHyFs9DDQi0B3tFyH
         JoGJnHiAaSklYUr+rGDlG5Y7X887erUYlrz5K10yt+DTGOuniz3Lkf8wZhcoXFrKABwc
         2vcotss9zvjoy1kw5GfUvTRifvv4H/YchrCXRoVAd//aOZw+jCDdCW7aMjL/16fIDSY4
         uLDw==
X-Forwarded-Encrypted: i=1; AKwUvBwqFEzo2R9DxyTwzPfZV/+6oJX9q02gwOJlcS0aINj/ZTpAdY/y9t5tXoJElugqBLeyy4Mgrh+YxxC5s7c=@vger.kernel.org
X-Gm-Message-State: AFuF++nlV0QRm4KeLuCwd0RoHqK9H+RQNdHvp8247UXLJdxKxp3azub0
	w8SNc1o4Z+HdDc+JhJ9UGWlanzN5YYVFv9WWo92PkrDkX7xHNOnD5e7D
X-Gm-Gg: AYBFou0ZKqiAHshIHqja3japceHgDWdG977KyILIvlWD/IZmvCqqfg/OiGBPDjgRYo0
	yqpEVnFoe/LZ1IJWebG6cHPqapA3YqTTidzTqm/Fy73pLMwSlMM1uw7/KUhkrOFLPevBsJLfKZv
	jbd6dBWDFfQRY7RtQ3JFy70gIbWXhWFWPuT9x09rKz5qSexeQgr7ymQAr8vpbZhSk0KGsiDWq8y
	XEyoNMG/c848On/xh56DuZf5XNqJqqqG0SkwrOrVBcE+ZbXadSE1OPWTCk6f7dQkN/4sFX2xDyI
	ZieqfONODUSI4N/dfCX1/x4T5KGCP8I+LCkguNdDo9+7PUrwL3Hp08BUqga50Bq5dmsdpCvWhb+
	4QPX+A2g0NhVTFHWMsUtUgjpvJuuhr89I0xqNcL7Zviq+MPNVm2eQL0hRWg+Sarkz8cROhtvVJO
	oZotAccBWzes97VQ5w7zHGF4XObIjQXdB1/FA16mXolhXlo65pchhDYt060ZO6vVPJTYEqZ+LNQ
	lJSY/X+x9lyoltbBfTHdNw0IA==
X-Received: by 2002:a5d:5f50:0:b0:485:8a46:7059 with SMTP id ffacd0b85a97d-4858a4672acmr372086f8f.43.1788476364181;
        Thu, 03 Sep 2026 15:59:24 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:23 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] amlogic: t7: give the MMC bus pipeline clock real consumers
Date: Thu,  3 Sep 2026 23:59:17 +0100
Message-ID: <20260903225921.2290441-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous series [2] for the intermittent boot hangs on the VIM4
marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
explained [1], sys_ampipe_nand clocks a pipeline stage that the
hardware design inserts in the bus path between the SD/eMMC
controllers and the NIC_MATRIX fabric to help timing closure.

So the clock has real consumers: reference it from the three MMC
controller nodes and drop CLK_IS_CRITICAL instead.

The series crosses three trees; patch 4 (clk) must only land after
patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.

[1] https://lore.kernel.org/linux-amlogic/ (RFC: clk: meson: t7:
    Intermittent boot instability and memory corruption on VIM4)
[2] https://lore.kernel.org/linux-amlogic/ (arm64: amlogic: t7:
    describe the VIM4 supplies and keep the fabric clocks running)

Thanks,
Lucas

Lucas Tanure (4):
  dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
  mmc: meson-gx: enable the bus pipeline clock on T7
  arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
  clk: meson: t7: don't mark sys_ampipe_nand as critical

 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
 drivers/clk/meson/t7-peripherals.c            | 10 +++----
 drivers/mmc/host/meson-gx-mmc.c               | 21 ++++++++++++++
 4 files changed, 63 insertions(+), 12 deletions(-)

-- 
2.55.0

