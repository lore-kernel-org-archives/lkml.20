Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DC249B1F5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678968; cv=none; b=MfHiZX4yJK2pQ9B/rMtbNo8IgiQORxqPfQqQ/BGwKh5CPH5cdzcQSqhT6yyvr8ca1KZMkeRO/qJfb3+fWweN8TrrOKpfUGhZaG599qGhkl4O90iJvKdBITmpQBJ7T3Qt0nrNg86cpuUaJizLqVWVu6EWdOoth9dpqwLARDuim+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678968; c=relaxed/simple;
	bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1Sc1pzfJ6R6nAxZcyNbUVE6pmtVOtGIV2RF5kokUP7WjPv+zZ3Pisch2Putj1BHghPQse7zDEoL9r6vINWV9ehrqCoMLoeeEV52cP9s5Os0lKdWC02FzRUam6dHCbyiLxLojM/EOvKCG7K2cjGTHrsMWJSX/0HJaAeUgd/07T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Kg29WfOX; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Kg29WfOX"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so969935e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678964; x=1790283764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=Kg29WfOXjW0/kjOCVjKbclVDnPh3qxPBMr1GjKk08d9lkTd0rQs2+Gzhyd+xK+mapQ
         g3bfeddu9K3OLL/poxG2PsWSGTmv42okVppmbTUHWK29IJyWUZufIiV+QsaFJc9/XwlV
         TWfQDTZu5T1as5y8p3HWHNxJ3IrzVgQ8PWCNsRKrcgkl7LrCwR2j2TUc/REN43WBlzm/
         49/J0zeduwh263aK+AFcaQHN7I7Lk6WtLAGir3sdBGUN2tLE49dwSY7nBRIvBYzxDg0e
         wIWseMXZ1Hgc5EwUPVXAm1puHUla8qYB8bFqeLUAzooFjchpvBzKrGLCSg4iMMfWKgSm
         VI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678964; x=1790283764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=pdOAe1UWzJHaEYHhzMaMd26dgvuASTZbbsjcmnM269JREXguivaE7woa48H68yoEE7
         CTQrrpIiq4VAkMZLi79b/0tly/6ctNpGHx2lqre2z1PYpPVgGzpVwJlBXTcylPeoCl74
         dkreXbbU4G7kU1ekNg9/fgGt/1i47dSvx3f8C+9CKfjfQgu5L04/8G5+yphabVDDst4o
         FUIadR7mx8Esrop6NppzhqpY7TKng5p5WOCGIOxFSTK8hCjvKEw4CwOEjG+LvAE2fBZG
         8aQkr14qEmML8k07Gi4N/KV3LniVkA+MXwYYjMQfRa+6Yljt7tvhfRNlZQmVH3HUhASj
         Z65g==
X-Forwarded-Encrypted: i=1; AKwUvBx8Od8S0eW3wFKoHbr5P2ndJbvRsiUHe1qqOjgfnbpaNbI9q4iHLZISNMUXOaborK2dJVD2/e+Tertkygk=@vger.kernel.org
X-Gm-Message-State: AFuF++lwbSPK/NJp2djKtzexFc/g2aXRwQRWfKaZpSb/3Wh+X7IsS3Kw
	Cx/FjCAqUxLkQRdfVanGVzauUr+zKnEUYI67dopabJ+1zkx036d0OxG+Gtsnf475eOo=
X-Gm-Gg: AYBFou1c3SrMmykJiOOmyICjjnR+3Q7Ud6F+bpuGqZREdjbPE/RyxsGoTkK+0ZvMfhw
	mipqRyTWi0b5s0nkUrbYS69XUTdb7ApCqGgVtEd6ATdTbayKfcF6Ln4DISBPBO75j4axsjZTNiB
	q9EMEYihAmfDNW0nUt/GaPEG49U9jAquJBut82/u/Rq2Rdz1T9hVA17PuHi9CAy/GJ7c5PmRjHf
	1N3Lt+7kSajtlyIGtEhsoxTYJq+Gnp/GcJnxndiI8kyyomREy/BvjkWmAuvsDz6bjqHAbGcAJJs
	p5dV1YGbuR1ooiqO5Auu+edQgm8Om3bPAUwUSYoLkW+eqPefocF4bqiFrW9C++hXpDQZeCiP64E
	XfYSkv0g1vLH+JpwzFlVgsuW44o6qJECv9QX5b56cYP3VQfnQnS7WuzxORxYvRDRRasBbjd130r
	EJPZ2S5spzQndPskFcqppad8KoYl/lwPevKXd3VTQ8TNOZYqyXJBtI+rTIDyzVqtHRTG8GP8upa
	+tUjg==
X-Received: by 2002:a05:600c:198b:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49fc574f05dmr1574425e9.33.1789678963884;
        Thu, 17 Sep 2026 14:02:43 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:43 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:34 +0200
Subject: [PATCH v2 4/6] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnPVXXIkF19akM2yaANzTvkv5SwOwx05M15mSF780
 rfPiNOso5SFQYyLQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABM59ZLhf0BKUawkm9T3o373
 JU4++fdX5HWgZ7tPR4R6xFNtM3WhnQz/TBt0/F/LRDzrEImSn2DTeaBkfTLbsZcn2dRi5yVor2h
 mAgA=
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

