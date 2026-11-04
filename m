Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800221;
	b=jFtRYnFXajcXyc87zR+l9eI0ywypWWyqDhs/xKe7dMth0E8dpQgCpmpSN/sHZOpUKAqZ
	 eskZ/S/DlPQrNOZAmFaLsysP8ZWb3Bt4bUgNfDunBzkiELY4JCbLbYa5NUGNH4B/i69AJ
	 8+tJrb2ZIMC833N+EhsBjF3JunHJHg9KSrfVk95yNgoE7SN99V+7JTJZ8p99IcKAwK0mE
	 mm2HLGb8vLwZOgVQpZqb2BRalHJ7VznBsqk6Vah+qhV9Rxf0SeY+2OPzISmOoPgGKMJNZ
	 6HtE0ALLjtgagPZXU5x4qUNki4Umhhj3KckfM2u72r8GMO9n5z9z+D42O/9vOaDXZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b5WmSCTeMimZOlRnOkcPt67mRLNbVAj1zsnb75dvFB8=;
	b=FME1RUUTMSyrSqNxr8I5jynqLEisxLpLA9YwC3v3okizQQ0Hw4TTB7e64zcrVLXbnAEe
	 Q2j6jAF3PVXILV75lO4j4GnnSGfz/bdeewyIspk3Xhyrdj0BQyDR7d8kCxHF5NMUyLxoO
	 i8JThBpwN1cHSutRNQT9g57FIX4uiNa1wvALGVkN6MV5j1ncZQ9j5v7noCUFTVE4FqTJ8
	 GPCBgtI2LubzSeVSCOY4eUb4fFt3SH71IDueSYBrtisRJQKHiiNZS4YY7hvtx3gRguhD3
	 4GD/j1YjF5rGUVWW9yt8/y8cAkpJ3lQ4+c/yHweQBPdC2oWLOpMNB9nwWiLTxbX0oKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U/EaPKGg";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BF5606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BF5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U/EaPKGg
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so651295f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800219; x=1794405019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5WmSCTeMimZOlRnOkcPt67mRLNbVAj1zsnb75dvFB8=;
        b=U/EaPKGgDSFFWIjaKsIEE3ocleQN7aWXgwXnFU6y+v5ciyA1kfSxGmHuAO3EIo/ugo
         0pVg7mCngiPlLcSnVJXrIsNvro/W5FbOlv0h/dxJIRbrDhxqOioxeEwZLahz7nUVQWNA
         tBfuP4xRJXRF3rEY4RrWbNNNzj4VR3dBQlnsKFd3QykUsrBsuYNYRc4oDZE6sYoX5Igi
         izEYesgESzDMvbNLdOdHn1D79Ts75OS3ZehoM2D/KGaKxKdlbzMj+8B5Xz5AkURb7Bwo
         KHL/IAHLsalPadJ4/KTcFJmE3+c+PlQmrjlfGlYjPI3F526v4PVLFgK+eRrvWrhBpvKX
         DBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800219; x=1794405019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5WmSCTeMimZOlRnOkcPt67mRLNbVAj1zsnb75dvFB8=;
        b=Ya3XHLRObVDxjgHFiRZb1xwcSD9L4QPNWyKvVEXQqcrkryw3rr5XWrXE8G/nTzCDl7
         MtsFTI8OAuDlsMmUldQ98kbgku9mNhqUBfT/lYlDqRrH+1GGLg3Hir/9iS6Dd2GcS3Z0
         T9aRUCWsHFEl2pkKjytoYZIS4S7VhZZqlYqLNJGIOYdNaWxNrGkRrO/ewEtl8/wwaEiy
         Z8PNX07wmukstqBIeIYyt9dKqdHYnQ+JV0ivs7BU7D0t/GD8RFJ1M58y4i1vZjq74UtQ
         YhuC6Km1rysUPrHmfXH8RgjINF8+nb43wShlXNCeA+IyXPMwOOsNZKvBZsd34UaawbXX
         KvLA==
X-Forwarded-Encrypted: i=1; AKwUvBztSxx7O23wHDoZ+QdsirEvhfV6Yr0POuhWmjxKpE6Q+cPkHcF4LlqJvLhZ3d3PhI+0SYuVYO4jhST8aIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OVfcFWEzBkr9v/LmdfwfyDxew/2KhXbFhweVNMfdA7RC8Iuo7
	IUHCmBEZmnAQvqdz3llgtm9+erYqk+s5es8DAQWMc2/nOzLuzoYxberU
X-Gm-Gg: AYBFou1sdTQ5OukWF1IuLAb+shDxH3Jek3pObVpiY9pXON89M+DSQoxR0ikKOwweGec
	+9dt/CwgvldbL4l3uV7Uw6f6W8HndFN/lRrSJ35yvsFQYk7v8YqFjAAL8gGdQFdJO0CJh1Q8CIm
	1sj88tJ148XbX7WWz2I/8m3b6tWzu9zGx2uu85IvHOmB/++IXUMopzx5XmXZQntp2FOAazh1+Sn
	urA+utv730RSRuJ3fPhN+XewpkU9IBqSFIO2Ecj/C96IQE2EdU8FcM4kJgiKUxlVbCMvWwyY98e
	e+sRqK6OOyiXTnRqaZ2XS8OJvyRiXtH1dOzW04F24eTQjjEJFw9JYpxhYjR10QJK15lkcS24MsD
	9xo56as/q2/JzYS6WFd0P4pRXl/paNU9PUJ2XI5MemRcUjKJOtGm2wFxJIlpKJBqvOd00GLgP28
	PkupBxPj/8UOpgeea1zN7kj3/yKtDvdBhWmXlBtuGCYjWX0Z+QsfMhbhAT4fXoK1FFjtRycf6mE
	Ij5qXIdsulb43NbHKHXP20wsVtZBMtCoFhyNAQIpl0lwLsiQa8GOpBL39MocU9mG1hweepJH68G
	qfBLSWAILiUbfi5RbPSJLFXQeHmW/o7Te8AtDxJqWnOlBTN09q4U93J4kleS119gt6CA4osa9hE
	Z9A==
X-Received: by 2002:a05:6000:2488:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e6e5366b6mr33871219f8f.57.1793800218828;
        Wed, 04 Nov 2026 05:50:18 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm3701024f8f.58.2026.11.04.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:50:17 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: chancel.liu@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 2/3] ASoC: fsl: lpc3xxx-i2s: select REGMAP_MMIO
Date: Wed,  4 Nov 2026 14:49:59 +0100
Message-ID: <20261104135000.3723017-3-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
References: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
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

lpc3xxx-i2s calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  lpc3xxx-i2s.c:320:(.text+0x13b8f6): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_FSL_LPC3XXX unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_FSL_LPC3XXX=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index e8924ed652ba..2f58a1a51afd 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -140,6 +140,7 @@ config SND_SOC_FSL_RPMSG
 config SND_SOC_FSL_LPC3XXX
 	tristate "SoC Audio for NXP LPC32XX CPUs"
 	depends on ARCH_LPC32XX || COMPILE_TEST
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the LPC3XXX I2S interface.
-- 
2.43.0

