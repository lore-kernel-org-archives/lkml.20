Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070551;
	b=DBPINJzjRPaChLm5XmALf4JONtLR78PuNye2PRg04HLBd6JgsXDlL76v7d7QEHOD10uP
	 SYXJKqWyWftrdM1BOgq+OILSq0unM2gFIh3ubT/uazp1jhxMcoh4ZBNygCHFSAvjGm1Ju
	 yIWUITeMjd26ngFAERlp8frVQb2Gf1lpE8lkiAeePurEht2AxvbEws+iuuu8JsQQlE0gy
	 zEUFMB7HshuTBrqK6cHSjYcasTUCiZ/1LQJn864ATHw3shkJ5WsGVvPJ02Yu1vysTY9cO
	 T+FwwFxkaysKFUyXXP2G3d3XI4IVeXoSCnBE8hzkjsaFVh4lJffbIx0JSlzcS8BokNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
	b=yapNkm/XZ+JCf/d1YeW5G+UUTAyy5lQSgJQGwUvMGJxlPN0WJJLAuVN/JrcnkbNVi110
	 hlpj26YDNhSsKjiS0c1FqUfPqB6YqN4HyYsvj4u7N23ImwrELl24DYa9QR57IrIEZ8qmo
	 tjHRAVeeHvmbnIKfRef5q20Jwgw/pE8si/dEhHq3m9pmuHKE2LUjo4TTMKkNna6WoVSuh
	 bH5buQmQswV4go+NRdI3bofJgmmM8FLsguW22veeI2vyFnhqDbkWwKy9Qq9aaZVd9cYPI
	 lHmM7mo393eXe1qL0uhOEX1O5ZY0nTLhj9WjZ/TGHnBZVRF+8bRVIuXLfTh0bXsg5lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwxdpkhI;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066A5606D813
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 066A5606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwxdpkhI
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49134c8509fso1360093f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070549; x=1794675349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
        b=ZwxdpkhIIaLrAp7+0L/UFp4IcmNG/Q5vxgosx1FGfaZPFwVJS2FZ96A1qFkdf5Y/9f
         GNRoxR65L7e6NjmSPNVxwgzREq2dSPmLv5Y8o1aFruse6MhXtoARerVT60/9cg+8xIbo
         KlJNGoI0ZyBtgoYKDE9Qn5H/VTi/LXbdOKks1ZLbpzm54mKo8SjlG8FlX03gM/trIX9N
         r0E/5JSpeAO/+C1M5nb01xP+uo6c2kook6k49bNLSffLTx8E4hco61hHOsV5mR6aX96q
         r/GmRmwhvOf6geN2/ax6QXpN4QjzCqtxhNzhPsxPSr0BSGwlFJKfqe/lYGni30d1baVK
         gB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070549; x=1794675349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
        b=0CpAwzmBlpRdNgovTnoAv/wUwS3GtnB/+77mjFV3p46D3jeW1FnWOZsSgDNfJSeYMf
         NWtaOHlJcQ4Ku4FrHAorq7B2EXqvQvr2vjdwjAkL5rN7woev38TZ44tRW1MMGkGKimVO
         dbrpm+ZK9+lhAOXSE0pBAPd8dMuUN+5GhV7STSTQnjUtNQYOtGk9LdGnDCvAj54Wt3Ws
         xGzuDaYa7NjR9kSTdB+yIr3JHyDCMcLze5ySYjGMFhJJH76SM/YKTMWJwcr6LXiK5b+g
         518C64CWo0RlSwrYU5/NTf8FAzGMIrrc0NZO2A//uPVkw63t6X1U3l1rcVoIobOw7xRX
         2b9g==
X-Forwarded-Encrypted: i=1; AL+hErEKD94CdZlWkxRrBcvE/NjIwf2BJHuLfK6B3x9HT3z7x71nUBXdVyKKRw0WcmsTMDNzwBULo6CWOqAzxA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6SjrIlrYqugSg+t/HuG2wKLixqM79NTPSgLpU8MN+FNsO+jew
	YVtv8hZ/pb/O6XiLqmHsFXLDaOiNmgbRyK2hvcZoZVFsuzfquCGDb+a2
X-Gm-Gg: AYBFou30tSGAAqb7LRpHVajeIMJEMR+STJzedH2vGiDNb2WpShcHMLAVIVJpfkKMyoH
	7/vAGcOdcXGT8AdHr9Oxm+tizN1jIo+t9fjcJRzK6h/WXM/tZiTUUl5PgW/ruT4K+s5u4wgeBC7
	isAbUW0auPQo/ChFA21YgjzSJP0aEjnMswkpGa4ZDvFTUx85c/W2/fKP8Oa2cbL6hcTsiMDc3j1
	aDBuLfn+M1r3Zxplyki9eTNiQD1If00JpYPjRyRV8ogNIxAdgIohTc3fx510fuBXtyzb3cgbceF
	DLey6uiB5lOelrb4br4pZgPcNLwmUOw8OFUWajTX3KpRriPUhc49cauU5AvasiWa0CZF10pJxvy
	f+r1EOcjhat3wHFwwp4Ww+PGfRSJpLFY5e7arJwNSU8Y18V3Ip+YucsoSpgU/n/vDhYnevJGMPO
	gkxO+cuUBgU8pwz6mEFwARi1sP5XqRm2bbL4MYxpZOtue157/5H1SzsuYsm35eAykkUNFilABZm
	fTk4Z3H151EvodA1Q85f3rWpn9ZSpmykvdFBDsZaTGXfLEmtiCYJn1AWwFu5d2rZ/3l2si9y7xj
	DBTNr8IWy1XClW42P4tzNMAkTkYFW/NHjw==
X-Received: by 2002:a05:6000:2384:b0:492:b880:53a7 with SMTP id ffacd0b85a97d-492b8805664mr13284591f8f.5.1794070549260;
        Sat, 07 Nov 2026 08:55:49 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:48 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:26 +0100
Message-ID: <20261107165527.576383-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

axg-spdifin calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifin.c:(.text+0x154): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFIN unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFIN=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 4b06a9e7c72a..10c7d59a5ad1 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,6 +85,7 @@ config SND_MESON_AXG_SPDIFOUT
 
 config SND_MESON_AXG_SPDIFIN
 	tristate "Amlogic AXG SPDIF Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_SPDIF
 	help
 	  Select Y or M to add support for SPDIF input embedded
-- 
2.43.0

