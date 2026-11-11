Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364117;
	b=VulZcGqDAUXOUnD9omf1p2NxQhCr0F+4NOdTyrMc07wrw7gydrIc/fru/dIIErl6g8TY
	 JMZf7vSME7wrZDIEHtR8odPmJE/9u9/vS087SoRt1WFGykMMSbT5KCwvKKu1rkKoTVMl7
	 gDAECHz7xwdG+N5Dxl8v7utY8iqLc1GbUHjQ9nGeJNHNdMMp+7mHwZahUrH6lGaLtS8Pc
	 fJca5PlNyjaEg03gA3RBlIWj0G68aU8wqUx3gDFzgvUUsPGjCllMx6SW7O16Nbo930cde
	 orjUZkKG+RQ9a7WRrxTjwUFe9rwToCafc1IX1YoDvNx/HhoTYjUPEBxLyWbWVtCDYuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
	b=GjevOtgWfbOXWZ/Rg49m3EfPjf/KjoNVZ15Wk5m4zLIhY3i7YYVkde0d+uyX6FvSmTea
	 f7Gl2qDPoLB0apwPPyCy/Vh47UmHlW1Gn2wfA6VYPOvbVvZleIKVNhltz0pjdadL1obiU
	 I9VdGqCque+rWHRotXRyyIwNnStOBA69H35i18mGP+I3lUW87ktyYqdNwrjLLt7/JZWtI
	 WrWJQ6SGKPjabuhWByuSXGPMfQ7XMwRjWBW6XUC0BEVMBT1aKFdRwmuldhug6M1Br2aRF
	 Lq9Uk6fiqlLChyDUjiwijbte/Ju7TcrI4glK4cVjD7ACRE98uZZ5i5zgM5RGgWocsBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnuFGMP;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC337606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC337606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbnuFGMP
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3acec6677so4226649c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364116; x=1794968916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
        b=TbnuFGMP4qOfQBQjC9PkLNLe8ZPMuTZ5AJPeotGBSDrNILXneU8XRGGTRNiHGulTdi
         gkQXTzv1UzjTiDQZfW9mvdy3xMBlnbEU/Sbw+6Fuo498ngp5iL4W2MJiIbEQCknf8zRv
         H6S9dkqSiAeincJfjUcU9siif9/hp+JeTt085LKnCqqOJSW+FJQPYHGJ0dNGYzffBz6v
         94GRY69idkudXl5zJYcEwNBRhGanQk56DncY2y2ml8Pn1JQKVP4DinmR6jXDR+tcZgYz
         FFLr6hWunqYDIKOfKlwhZdx4UhpUetUU5rt+VML9NeWMeVNvewYY1ud8/dem6Q/m6CbB
         Rf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364116; x=1794968916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
        b=0G/8tWiqV8TDbrwtRPfc8n/dtYSne4Qf0cBfzGQzbQVe99/yk7hgQT7fi8kCgJuqIe
         F+VAj6oPY1oCxFRcvS5Rt01UFH1LgGfJU6qUIIEUGP+wdmJypuRGUDUv+9SEuLOPFtI7
         4rw8pUL5c89I1gapvsTZfvDXghRw5WS8XHpSnKBeXo4GglHAmhTfvStsjEmmTZLAnBD9
         RKmdZYVLRbp4+q2htNH/yRaRj1iPBWBp2graUBQtc8xb4+AjiJMyAKEv+iajjHwLQUUt
         oMEmi+A6/CdIshMus0vJCpqsPd6txf/NfGc2ir3KK5LkZZ9UYDsiVQlJudjhmGLSUdw4
         8leg==
X-Forwarded-Encrypted: i=1; AL+hErG/GnWswBLD5RUdzX+Xet8jQ7M8SPYMDUeQ3l6IpW4+DGSfvTXwiN5d1ok+q9JuWu0xnwCiCfQWEn2OBfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RfbQEZrxfytaAS5mrZXFZ2XJu1E9sWD5r7rdSP5nmRxyNlHYv
	LX85vX2qwAgAAkJyDoQCsr4mdHD1hYh1yZgZlc/HQfDqCb7jrNGWwyy0
X-Gm-Gg: AYBFou2kjRtG8b1E5hcUZiOFz8xlKgpbinyAuaObBFcz1KrKa8RJAcNhzIMgGZ9lI3V
	xiRx7KIbWpJfHEN5BwU/x3Jzv0bFzHHuIXIYwjivmW8KQZRSeArFqXcNijwC5lxydyGr7TCYXzi
	+ZE+DkjJP3ET4gnNFskK2qvMM7kawNCSeMdVZT38kelWePho0ff2w5u4CobbBoUK63MY8s+NDH/
	6+GJ/fo6evRdQouflpQS3mJbyIqUbvrNWo6E9RvoIi2U+sJ4nfy5YJsA3C41SGaTOENQhRjzoKw
	iU5HPnQR+eHzfPRYC4im0VZcTY+Y7zCkmIhimRmilKnU3FlQOEkjZm5UEJ/euUbeNMPKevWFjWQ
	q9rwkRLuMUptHmHFAbr8KNsTe3rYvHAdXvmnleJf2WpmkvU16CxWEynZnHHQpJFUDr54NqJxY+i
	fTP2fCHzDgQa7X5eppXNahfTBZLc1I7kT/UulBwsQeZO1iim2uWhIjQP5RJ+Wd/MA7GP3bPFMbM
	uMTK3vCUZkfYpzunlIOAjp4iAq1IEjvo/GtAwlNKyNrrXei3M7oyUhx1ErCBtV1+nLRul+IFbj5
	IHLA3UgLl795uFYpOXS0+z5MdkRCT7x4vMvVXacD3i4m09hkc7AylHrNjWkKcR8YkzmlCRaGMkK
	TVV3XvXyS58H0OM1xm4mWvE0+C5D8mDLuH+HsacA3R8hnIA==
X-Received: by 2002:a05:7022:3a0c:b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b3c0342ac7mr1035433c88.35.1794364115796;
        Tue, 10 Nov 2026 18:28:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:35 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 3/6] ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
Date: Wed, 11 Nov 2026 09:27:28 +0700
Message-ID: <20261111022731.8243-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The I2S_TX_CHANNELS (bits 10:9) and I2S_RX_CHANNELS (bits 8:7) fields
of I2S_COMP_PARAM_1 encode the number of hardware channels minus one,
i.e. values 0..3 mean 1..4 channels. In I2S mode each hardware channel
is one serial data line carrying a left/right pair, so the maximum
number of audio channels is 2 * (N + 1).

The current code uses 1 << (N + 1), which only produces the correct
result for N < 2. For N >= 2, it overestimates the maximum number of
audio channels.

Use 2 * (N + 1) for both playback and capture.

Fixes: b226efe5818b ("ASoC: dwc: Read I2S block configuration from registers")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 6a25d2a69ea7..c5773f191db7 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -605,7 +605,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->playback.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->playback.channels_max =
-				1 << (COMP1_TX_CHANNELS(comp1) + 1);
+				2 * (COMP1_TX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->playback.formats = formats[idx];
 		dw_i2s_dai->playback.rates = rates;
 	}
@@ -619,7 +619,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->capture.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->capture.channels_max =
-				1 << (COMP1_RX_CHANNELS(comp1) + 1);
+				2 * (COMP1_RX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->capture.formats = formats[idx];
 		dw_i2s_dai->capture.rates = rates;
 	}
-- 
2.43.0

