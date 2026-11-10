Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304613;
	b=H688VdqJjvg8QdkiSGgcy1gYF4g6tMEviCczidhGm0UOvmORdPxGfETv0UFHI0dRUX8A
	 OWv6oncRRa4eM9lAOWtyoZfQHmWB3l/UVx7xojuGe4a1Zap9Z3rKAHMP3kgJtO6uamrDc
	 Nj5PuBIzVRHEq1wY6zO8rZzyMbXk3ZS37jkO181spabspYvTR33nHHGX38PIj+E3qM3DB
	 L/P7OdX2oeJdKQdS6qg4a7Q9zr88cPLh98O2ekKRb2Or3TZcX+7UeWUPMTIFyb6GuL0cU
	 s1wEcp42nOLiyn6FeU8VjOyY8s2CRcZQn2aw8e+/i8D3VSQZLltC7x9L1bg/L/t+frg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
	b=5Ut2q1WTYOEzhNBrwm+DqJnGMvtiTL7dohPeMnntlh9hWisHD/i3dKuLtpsanm4VFCDw
	 ReRZwVmdAZBs3mtqwjfy6FsGsH2sxvJDokIb4466DwzAcecgTyJEwy14fJWePK7YlQA6b
	 GSD86xs7gg+iVZ8P5IdTxaHcBFyHea337//zynuwqS9Q5PcBWaNREgmq2DVmYBVU5kg5q
	 Acw+nwVgVPgfYie7zd2bHv/i1B0DSpHMiJENrpALQD188shdWmlSCU/iYRa88jobu19bZ
	 ERUcQYLNTUBjmNQpKOGerlCKRwMd7swvpcYNnsj2bQvamrrJaKhhGXEyt1B5DrIjd+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yvt9jK/M";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399FA606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399FA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yvt9jK/M
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b244fb7fffso2272025c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304612; x=1794909412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
        b=yvt9jK/MB0foe2S1knc3VkPPSy1xTMr0MqRecg+KGnLCGVRqgDK5oBdudS5ZO93AUl
         QmJpw6lWnvdPeiSxBJZHQPKJjFykpp0j4pu1UEZ9iCxlV8h6KRuLbYAYULNLbHuqCeZz
         yRKJR7bRdr7S9ByqObxmUbMrFGomCQatJ1+j4SWVk4Z8CDp+HrGgRAvx3U4b9NQWTc1t
         Ps/8W6tl2ZrFqYrE/qv4oOi0X0MKuRKu1NaAJ/lREI0//ZnQY+k1TARlzpD8iikTVdIq
         HUBvaAcNJXao1tG2cTveFlLlxUeJeK+4bPF5sMPbMPbS4bK2QYXNR7twjRaB05d95ue4
         ccwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304612; x=1794909412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvOvMCi4CpsDXeK5KUPd/ai6uKkI9PBafZrGZuMgzXA=;
        b=JVPBcIafM6S8V8uKGCWl+Y4nnFr1/A9z4JX2Rt1KE2yzd2aPWDOjrAXB9Gkprb9OEu
         BaRxgEWqy+bw83HrwUuzmJ8bs50IBWUYLdy5stNFo86mkiTvvjiMTENWJwD2/fxhJGfJ
         iwa+ySCFTK1eJ9Eqf/IiyxCogP2YWMrIKw5rRNhbkxTcrubJMxrStzuwiSx+FB2n3J1B
         4avQZS8XnePrWyxr0gRGytLcncryOEVd2srcUOkKosGY6sQL2UsRY0ZGYBsi6XE6Z03S
         xXI2efSdIksO3lQn1zjNOemX6iLqBlvvuJWx8hV/4O7PiqwWsnGc8hL6n2vyhTxKm8cs
         c7fQ==
X-Forwarded-Encrypted: i=1; AL+hErHk/0RRd6J558T0fTUNlVtJ/PBsYzpKYfUDTpTqCLxHS9BXf0XFyonDFyxNXPgiQhKMFXuQP02hfKSPCd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z++9UZBceVqQjzCDMk2zXFJ3AyXNVHpWRTw75FuDbma2kaJoT/i
	6HotiL+0wOxaQJo3ohAkDwtWZLOOWU32nMU+I/PhMAfI5qSHR+LqB8F3
X-Gm-Gg: AYBFou05D+y2jQ2QkeXslY3EqEHcU5iEzxE+kqRs+hJfiiL0sUsQ+V/WuQcJzcOjpWC
	rnsAM0c3Qj1zVXCjrTCxr3FhmvYFgxTczdlK20yQwxhRk99BlTqZe8Gk6WwDHkn8fWEvxkVg03S
	Z4ifTS4SADLOPQJ3oIib3ss9jrsXGUOG/tfzch8MbD55pIweicHj/B/V+s6G+TJ7cDBwHGfUoQX
	trY+OCYxHDlTcFugzGO2bjpXeUePmfAOodno7SIC3hd5m0/hHji+croHbjnwYGE+4QKAlficieu
	2OKP9sJ8UdVya/6f8GEksM+rMqPrZ6mNrZo9QxPOSkAVORN17k48+F6j4lS3fHGSn5uqZDUR93+
	ZKPKMsi0ujJTpOUl/0zPG3aue8yWs2/90/t34Wp4WPQa6tBkSKzaApFGKlBIBtJ0jPtFoJqEqfk
	aT1jogkIZrtnXFrxPudEotJPxitj1mN8PVw4nLJOw4xPE7u6TQFntdaWUh+GMTaqQ6+qVaRvgqT
	HBM+7MCBWhIRnt7tjuZ9rHQaZ7e0Q8tF1H+CMJWDsB+dF5zoRAe1SnJ9tKx0pWBExXqObrvuJ9M
	Dz/MvRs1Ljhi5vIZNQfKT1TKBO3sKyLdr6nS5s6yUPIpx65/ENUjxuaTwCSlgX21lktV/WWr06Z
	pZTCc6o/xC27+BGElFYtkoOEc6FaZ2q1vJBWZM8GIuTCQJm/0YDjQVGQZeAI9YxFaGg==
X-Received: by 2002:a05:7022:ec86:b0:187:c940:21b9 with SMTP id a92af1059eb24-1b3b60090d1mr3491485c88.30.1794304611890;
        Tue, 10 Nov 2026 01:56:51 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:56:51 -0800 (PST)
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
Subject: [PATCH v2 3/6] ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
Date: Tue, 10 Nov 2026 16:55:22 +0700
Message-ID: <20261110095525.504660-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

