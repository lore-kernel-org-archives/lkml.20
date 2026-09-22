Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780865616DA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092901; cv=none; b=Q5PjUG6I6+9Dg3sXSO4vMPG5LTOCr46JEXLAC4pqiEKrXPDsH9ZCdBXsm3WOaSpiaiMqZCZIXfD1ofHIetYeFaCWapTzi7hGou5slCLMP8Ui8EPKqojcAd8WerM1MohpEjo2Pc+jQfrkKXF54Izcas7hIwErGtKpW2HCU0DGXRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092901; c=relaxed/simple;
	bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IY2jTrZd+bY7Rt5CEV6m3YDuYLLc7lKTLBKQSJ9sE+16JOUNj4jSdQIfrNBq2ZI7rolDpwa07JgUHsT4cP0SIwNZF34D1Fo4ioUIBFSJW7GqTsnP/X+g69N2QJtmPTxFT83nwYk1lLofMXguAZW0iO9vmy6Kdm2CCClBJCwW9V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LZfDtRGD; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LZfDtRGD"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so72234f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092896; x=1790697696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=LZfDtRGDSMrwexcOSCtj1QggG3vEOiN3TYALWyKQeONa2O+x2wdZk2R1E5lpOpgkxn
         ZBhDYKJHNmogNg0r4H5pelejJgLqW4wg0jC98MqG0yphUq+OZJ3x6wkrUC9vAPMdBKIe
         t8HSJr+3H9tZ9ov7+YlfZiPw/rQlaIxJMO3f0v1E6UMC5XvWS3BgzqS5833BaNhxHK/d
         A74X8oebk7fJtBQKszMkhor+0Y9kpTnvX5VFflTWsAW8IDFb+PmZ/QKX+xoClWIdh1T5
         9QQqBSs8hZRK2w2aGo6GFRh2N0fa0HA2tQCIoDN+aX0nLyx+16xKCmmm6dcXbP5ePHG5
         oJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092896; x=1790697696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=BZ3ZbTeAVKyv/YeMoYAbjPcqgoG1u6NiGqO1x2V1BK2ShB7Dh1HzYL2AmFaVILE+yU
         MshJvTfV9gXMjUtv6fFa0gs6IInMASV7A0pujPFRCQ4VkmwuPUBHNbyZH3ANJsJM8VHg
         DALLL65nt1tqFjF3EUjiQoiF/y5rn78T4+EBzQbGKx1mO9teQGU85XbXIp4RcfE/MJIq
         D2zR+kH3kmUItCqzcQLXmDbUt418iU49EMQF/bpYrTVEPHqJlfDkQEG1sfWjU7LbN0PE
         dvqBGDVANJrnP2JOoU2Ue4TFO6k6yVuXT+s1ovToVenXevcIWzTDIILjvgAMs2bmc+/8
         enEw==
X-Forwarded-Encrypted: i=1; AKwUvBxltPqd2zkdq28SBlJCKnC/3KwFpi66IN1UwSeitz//4qX79kurs34MhinU0lomnt7Ax6zSSImmJ/OTMEE=@vger.kernel.org
X-Gm-Message-State: AFuF++kdj0ikVXZl3mxDlcAB0qQ/hm2tVETo0vi7vmYfzMjQlc2ruBXv
	DEMR3tyjs3hL8IPpQ6U73ATml1cNC6+BCDm/pnsRh1fyBaioPqMI9uVgf9BdRa+x8fo=
X-Gm-Gg: AYBFou0fmUerht5OlTqXHgEZGNId2POVeVXmPJnlLwdLaqOYWTjiwZGO/5l5UpHx+60
	HO+9kI61mMity6f4xpc9FRtDT3MceI3nO6M2Gb+op8mKFN24pZ7r2Foe5hOvMRaq5msVdwfwiXg
	6+O7Zi+QgSpOmCTeDIeQrsRDJ6jbzsdOA65bUIY23cyX6VuWUNV9FjhDv5fIIDQGW5wKDaQYjVx
	JEG4h4A5ej7kzVfXGOhTxH2ED+XrpDwFRCdhfw4jxgxyJgZSnnG7vwai5FMUTmh3+uadH2OkqF0
	f9RDWt6TpPzhFYp7MbD4M4F1yZmwsnaXsd6BexM8VjkCUbJ6EtcuT0YYVy4vJPR9EAB+jNZRd3S
	BsqmRHYB/xNHm2xPHf07d5cze16lLvMqxb/BkC5E0c3IVzI0Se7YNIaBQIifgMHDvjJfjtzY4Fm
	iuzlkBm3N/HO+L23fCX8rSBi4Sd4ZxyFjWODwMTTAFZwWpdSCeZv3+Om124U8ZJ4iwQJc=
X-Received: by 2002:a05:6000:491e:b0:487:27f6:a4ce with SMTP id ffacd0b85a97d-4886708a7c7mr50365f8f.30.1790092896498;
        Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:50 +0200
Subject: [PATCH v3 5/7] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-5-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkVtm8ch7b+rdEeF24O1qxX7Q+9OCG6Yalu1deMbg
 cIFkROWdJSyMIhxMciKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAiURwM/10Pswef6OL78Of5
 qanpLsULSnRd7qvUHAub22fQI8gbZ8PIsG7x0a85R2YGzDt56vFKLyubu5IFe0KFeTfUH4mPtrj
 QzAEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add capture stream to CPU_I2S_ENCODER making it able to handle both
playback and capture streams. Captured data is formatted from
"audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
FIFO and then bulk transmitted into RAM when the FIFO is full.

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Supported format for capture is currently limited to S16_LE because it's
the only one that has been tested. According to the manual also S24_LE
should be supported, but this is kept as follow-up.

This capture support also takes advantage of the following commits that
has recently been merged:

commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")

They ensure bs_quirk and rate symmetry across playback and capture streams.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 535fbf7c1639..14d0e20a4bd6 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = AIU_FORMATS,
 		},
+		.capture = {
+			.stream_name = "I2S Encoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
 		.ops = &aiu_encoder_i2s_dai_ops,
 		.symmetric_rate = 1,
 	},

-- 
2.47.3

