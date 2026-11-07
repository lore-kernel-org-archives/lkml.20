Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070548;
	b=VuQXVGBvL4afaPAOQ+M++S4W7bN6ay39FbXIZNrkXfjg17Y5LmiuTEueEHaWUF9SFOga
	 o/1gx6vtGIWeUIypWnUy2efVgStYnSnvbhJxuHXZXqrVqulIY72U5Gdg3y4kokFUrkz3X
	 f2UxbygOkypYUh9UyBBLd4a2jEb57cLMaKzq3b+cvy/Wg1W3jy5YbO1PLxf2HxGwUJDUl
	 Fvy3IXPFuasW1iR3UCONM5DArVFwo+UH3tgmFaYLwF2zBPU3wGfilLJ3q+rZDp8nRPbeW
	 A+2d+iZY8gK3NIik+NXBTGkRRJKYrz9tojXvwQos2Sy8L6BbtDLss5Ek7XsDIwNCweQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
	b=egHZuVwM+xDfZvRStpX5baVuGpbLJeeTfZCvNLK5Etw6lcK75jSl408ll1eJhcSmHeJk
	 C525/0uPUECpeJE948rSPXvz2fohj1awFVBX5GLqXrceybBBSf1pJpZR9/ZxFRUCHmWho
	 zmHatgjAMv3UP8TZPuAgfP90gHxhabpjb8mK3kT+KB0x9Lgf9505lZROSPtrxgcn5dfA5
	 IuJ5K1uF/57nbD4ep7PHAPn5i9+nmko73WxKzCCQQv7EA7BbE7iSk0HylO3V+P4dnYD5v
	 SpX5IARVRClWQTApH+L7Xp79UBGjCKHpc48I8YCIiSvj44A3JUSbUJOQcyb9e2P7R4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE3DXTmh;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181E4606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181E4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE3DXTmh
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so933793f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070546; x=1794675346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
        b=rE3DXTmhPTPw/gfysJn7Cj09+/1mpvHzrqpCoJ5aqonIRSad0yAn3WGBRv+UyLfi/1
         1KPAKRBpHHvqVHReNO334wfvPpJ4lkgY9UtBWcXJPozSovHBdLTGqR2T4f2ICqIncbp4
         KaYxaF0Z++e1H2NyM052bsRS3S6J4P96SXZwRsE168qmDkw+v3zDJ6nepAlkil7CPP48
         z8bQLMpeaMC452zqecUJm8zK+hpWwiDEKeZIsHxqb+hYzf4WNP6L+SScWvSGw+AhPoEI
         tOctqxBdm9W/ZYe7JwaRQ+BrkEWoZPqVcOe/Ld1Cl9TEVAcfEZpKadLC4EXdI9HUlss1
         MN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070546; x=1794675346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
        b=Z54lbooVpFjIxhB365M+A6dLT9itvkNBzcXI2TIqRjR3a8IpOF9ZOm3uTxCjWIUpp/
         vBY7jfvNKaVbPPkDMEjRmHPQ9Q++ojnelr35YNYTUFsoWgC/yuAQUwXdB+TAtpJY76Zi
         r3mwxfB4HXLMM+MAw98PvNhelSvRoMdmELcJYNvI5nac59+LYq4GNFw60VWQ/kZGwm0x
         Pr4+R7DydyeQ3yQF00C/Ecw0j2jAp2CUiWgd0AlgHVXY2I5LRU6caMNyKEiqhuYLk2ck
         pKyRLdiglibRKfFA1wp1sYST/HOnVcAacW8EK9aMjtDqUEiL0lzTC57K4TFvCZYlaSmD
         1bHQ==
X-Forwarded-Encrypted: i=1; AL+hErEiqufclisoFgf5zr5YxTMXjFA0kQMcgiYhg8EnHHy58Lj4O9BRfZTXRTj+FVNDKBTx/A44hd5K5n1/JCs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WH0FzMa0CmrjxsWUMXjL6kMZDb2/KtFcMwJ6jOpM3Y5z7zoVi
	2ik3UydNuPm0GwlzdlwaTHn3GcdsECROLCCm+XLFi2FLghs/WO4weTaa
X-Gm-Gg: AYBFou0C0PNYm5EMrFU79FYpDtm21qqPSq6geXqBQHAMJSosFH/D94sN4/zJnl58Wur
	QxcEQOvK8Iw6qfj3XoLi3LW7w1k/bstwnvlREYNS1amY4OBiW6H8T5lfm2MmHYJNAOHKe09UsL7
	+12LQ+y/lmKRG3TQloXGnVv4A6yvTCkURP/ETDZHXJiE8xbRVuhFpiiKhMp2iDUXkDpumYK7yaF
	vxr3k4KyNE8be1Solj4bVbcMBiTLVcivlUxY0FqgRWqCj94chtPbBkHZmcf4lX2WpyLtzMQCbB1
	MxXejGSIQd4xUcqPCvwVVLGsbgx5stvZTYzHVp5qRjqncoAUimzNBxqmEEFLZM8tNZ7Jh9uiqsZ
	yAvl12bJHFcNllY2WYtagowrf7i5smvYlw8lUT4lsQMydVCJ6JqVQcpBDsEMOdXg6AqT8kDrX3u
	OcrV3+8+jW7QIT4yOytMQjwmHRPahOkk/Bge1FShinxKSOPvnnIWmfjneVM0I/C6olI0P+rF9/F
	gw9T6ovaPDy9TfMxGor0F9d7cx93pBwH00xN4sBDjJftOE+80Qwzh0KTgiyhGKC3p4aZy6KxgJB
	kPXnHOD6n3udw/qdreoYt+yrWK/Fb7/g7w==
X-Received: by 2002:a05:6000:470e:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-492733d1ca2mr11716934f8f.3.1794070546480;
        Sat, 07 Nov 2026 08:55:46 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:45 -0800 (PST)
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
Subject: [PATCH 1/4] ASoC: meson: aiu: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:24 +0100
Message-ID: <20261107165527.576383-2-jude.gyimah87@gmail.com>
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

gx-formatter.o is part of snd-soc-meson-aiu:

  sound/soc/meson/Makefile:7: snd-soc-meson-aiu-y += gx-formatter.o

so SND_MESON_AIU is the option that decides where its call lands,
and the error below names gx-formatter.c rather than aiu.c.

aiu calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  gx-formatter.c:(.text+0x74): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave SND_MESON_AIU
unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AIU=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..d0f60f8af2b5 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -4,6 +4,7 @@ menu "Amlogic"
 
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
+	select REGMAP_MMIO
 	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
 	imply SND_SOC_MESON_T9015
-- 
2.43.0

