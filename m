Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746152;
	b=20zjFF+5nZdaL7OaQTuBRKftL8PJv0bUUM6B69/wajHrqIfOz+KRCqUQ8t6hdsI0W3jF
	 VfT1H7W5F5bRljMVq38zP77rnoTCnJVOFk42Q++XN6NH8+FBXyK6QNDsT5R9KJIR1Swqq
	 s8Iht3SjFJ+LkcpKE8V+Hvz0CpEnDdDhYEKgvsJVnjohaEmHN6846NzapshMloM2bdqPK
	 L3NdObkJWcIihwG5AivHjm7Q8wpLGzmZXEMtlla8ztMCon5kxHF8+FwKWeu3vLTwvCmZ7
	 Ij6xXUbL+tv9Y2OPGvg4Dn4Tz7rku6PptLqadUssZzVJac5IZep/YeOkFnmH7shbh3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bVzW7zMSPHXaHTeckBv60Q9h77UETS/F7zSc1JaInmc=;
	b=lUzrY1lEHI610jRZ/KEap5UrnSO4hUWMmvZgaKBn2sadKah8oCqo5gjET8gmfDOFs03H
	 4YxbnM4gaGDp+kdCtJbGwgQmlZ3bTa4pEut0NV905BnDWAOKksu1HQysaNghh3MQA4T4B
	 +tHP8HP258kB212+GfHjzNZZM1jxeVTdtezKGinJp8jVwb16Dhclg3pvtLpFDcL+1k/8x
	 oBP+Vblhlqixghj3POeyyive+obhM12I8dHzAfMTHxcU/+ZfTHW/vI4EsC7iZUvTlj14a
	 EjA+Q9B3OrP6SN57guU/VyYQ69ODcH9eZdXCaifIg9o6E+EjNYKqJf+wvpm6XfQjXMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrvQw4yJ;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A0F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A0F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrvQw4yJ
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so323181a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746152; x=1793350952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVzW7zMSPHXaHTeckBv60Q9h77UETS/F7zSc1JaInmc=;
        b=PrvQw4yJzcrEcUpIH2yGDATjupfz0mfO4kdnoptPrhzPF2ChL5mjYKmWKMutbBa0gz
         NY/cSW5SxB+49afcl4wEvs3GuM/ZmssSGNqE0enWZPyGxvPaOvyZ1Lwkz7arPHfutgUv
         Gv1/j7UwHEcc/QT3tNm1X8579frKp1Fy3+HnOTruUpw7W4AFYovUVeyDTbYmLkMVj9oK
         d6cRU9FvgmXVzxhpKwCHNVKBOYFXKaoOMvEwrQyl6ji0jmfQn9DWPbPJAV5ohhQyXn5g
         4/XuhvbiHl6LPHuvQ4rxiNEewcEHOdRMD5sAIjtTj3sAOxde/WJ2BTf6ll+TFujQvT99
         A4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746152; x=1793350952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVzW7zMSPHXaHTeckBv60Q9h77UETS/F7zSc1JaInmc=;
        b=fVnntPnflR1eM6Nj3Lr03PaN/zWDrQTmN3097OjcpZsogIediB8y5BIBentAvxf5mA
         REgzsya1S5k/aKGoUIRPa6DPcN6aeDUFwAP46DQVVj+8dZjdZd9ZxmJvJwUxxNa9viwC
         JYvBFwZT8ZANGOb/+o1Yos8+KL2WFy6MKvGo0WGb05J9R9o/3KtwM9Q+i/ffzf8s8Ffo
         ahh6dRKZ+MkHAXgUJKwDfa0GLvvjxoq9oluOvOgszf6TczTWtxYWvoYVvCnT1GGwUxq3
         Olp3/zJqhVokoiu5KdsiVts5b7ueA0BYSXBRn1XLXwrQXOnQtW8Ri5z4FMXaK+9V16f4
         /wcw==
X-Forwarded-Encrypted: i=1; AKwUvBwn7OSZ1xgjnrDM83kiH1kV1hNiS7N6K7U+e7t+xQ/PjhaO324+G4poFP89vUnaWgPEjIyPWICWMVuCUMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIabfwb/B5P8FW+X7la8ez1ncGiiJfAZlBOFXCXx/vHuIhl5vGy
	d2o5m8JZh8ZygVCjjKuq6ESyjxTCn3HqhAzazFq1y5hr1jGicM2Q7NBx
X-Gm-Gg: AYBFou1eXCV2vHP02gjU2fmRUBBI5TqaAzBkrEHNQeHaLDksMjz3Nc3RSFWKi+tVIw0
	XQqgugrdeZwJSnlYh+SqnX4FpPqTRiGL9AP74nET7xAm9QDlKH++bCa80ZsnjDjYcHYuDesO6Cj
	5wJVG/mL41HKI8aaSfRnxvNIxqpk/czOfs+ZyBtXPFc5bU07/CnIOb92UF08kEFtMcUu5Xfv9wL
	iWysyuuQkjQoGDUCeh5aAx2L2dV5kmIQvN33xNPsCwQHQNo518eLNTFgvJ9GtLLg+8tHmP/3Cou
	XeM921jrmSd9ABJfyRk+OGjBMu4kBUKDsfgN3FAkH026vIA6Ed77OpBvLNfRZnilajc3pBjBaiB
	d+jXbl94fIWjkC6NpYYgP/hAkU0gVasp5D3UOmwqLSD70OxuvpVJDWpQTa2y5/hAkQGgiBjVqMo
	JIeqwZDyUhJsiIeV23NXZ/bYsVRlekcj23mw5ZbE3i5bT9Y59sUtdf+Pij4I/ILTb0CudT+Jlms
	W0DoYE3SdPNyH0m6563fucvAyfrceGbkTWHgGOckcJ3QFdP0wDJRg6gbrt3Kb4gVvccvsg7fsiu
	CtuBClNHOe8rMuq2aJhoR4YY3L8qj9UHX91S4KMiZjSxHL13+4JJMMAQbR9CDrOAKChlFzM=
X-Received: by 2002:a17:90b:2785:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3adce45d4b2mr1018251a91.44.1792746151727;
        Fri, 23 Oct 2026 02:02:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: David Rhodes <david.rhodes@cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: codecs: si476x: Handle hw_params return value
Date: Fri, 23 Oct 2026 16:01:55 +0700
Message-ID: <20261023090157.518032-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023090157.518032-1-phucduc.bui@gmail.com>
References: <20261023090157.518032-1-phucduc.bui@gmail.com>
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

snd_soc_component_update_bits() may return 1 when the register value
changes, but ASoC only marks the DAI hw_params as done when .hw_params()
returns 0.

Propagate negative errors and return 0 on success.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/si476x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/si476x.c b/sound/soc/codecs/si476x.c
index 9b904450ab8a..1738377d7d7c 100644
--- a/sound/soc/codecs/si476x.c
+++ b/sound/soc/codecs/si476x.c
@@ -193,6 +193,12 @@ static int si476x_codec_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 	}
 
+	/*
+	 * ASoC only marks the DAI hw_params as done when .hw_params() returns 0.
+	 * Since snd_soc_component_update_bits() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked.
+	 */
+	err = 0;
 out:
 	si476x_core_unlock(core);
 
-- 
2.43.0

