Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875440;
	b=cyyxNGTDanig0YRwzYo3MoyzB61v2kkqLv8rjY3y4a7EdVXrPPGR0Bzj56DucXikZfi8
	 lP5WuTf7YDk0yqReX3S0L5YB5n1hASR+hyXhiAhqu4Cp49OicQ7EbBIEWn/1uqcl5HB6r
	 pns0xsbETPwg0WDLQoy1TEeibFHIEo7YzZ+6R436iy+TdeJaf73u7iDkFg7LQ7pqKUrAi
	 fZRsII9LR1YSE8ngw0sngwP+HncoyzDZisyEaKQ+156EhcK1Sz/p8SS+07OljxgqIN0iR
	 nJPB9N1XlEP6jeZu5+rIVDO2AIZBqnYB+QEycOwqrfDxm10srMKgfF022gCZvmFp+BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7a61XdNC711TnCfpf1e3aFAgR5XmE4l8ifMaRZC1SQM=;
	b=N4WIIIOJoL94/0BlGHeIZxRglREY0x4mgRbwM7Em/eVexArtUuU1NPml4Lr/v/MBi8lh
	 u7joeiM3gqZ71dGBAFhWIDM5XqZF6JFcMxbpIRvkbocrP4gzeJNjgoUOEAolq0eU3KVR7
	 yYK8zscEXvlmwt+QIzIZWAZxm0elNqnHbptIAdqu7ad14sTrUB703x+sJ5Rt3JZt1O9T/
	 Hr8LGY7leqpBqaoSKijgVpcTL1omHA6ssp9uQv6QGYoOJbIaBeXm6CDvb36XY211xxz5x
	 v/hIQOh4NzKI0DbrxL48vsMCrXupXhHdtQ9ae0R8zl5XeBnn807HK97oTMr3gTdSWFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QZWXlL4F;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34011606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34011606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QZWXlL4F
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35829219da8so492946eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875439; x=1794480239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a61XdNC711TnCfpf1e3aFAgR5XmE4l8ifMaRZC1SQM=;
        b=QZWXlL4F3ldbBvcVGjrzKYSmMFj5/3+qnrpEgFHEI8GNngFMxQELZVTpu9D1aXF6s+
         clm6MQ3Gb0OSD5ZM0nBn6dcekqm4qhwodhPVAQnIjN4bjT/EouDKI/TjI2hKj3N4Ow8t
         HzfExS/JK1eLIMhAcGYkkOLaWEZ9LX1XNDln/uk5UVHeQjgj/sMB3KjKmy6h8HnpX1yI
         fjYZKH14XyzssDBRBBBVAo2obwHLn7KwroPAGEfTmQlNEX/2qIivhcOkj2aEmrcCfzYH
         4TNicEvxGxVXQiEkcTWROQgqosinB1dv8J8qOCexgiKW1Cuw+3BN+nZNm4mswhta0Eeu
         DS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875439; x=1794480239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7a61XdNC711TnCfpf1e3aFAgR5XmE4l8ifMaRZC1SQM=;
        b=KcIYNYKoNzwX2+RhgXgIiTYKA3bXiMO1xQQrqM6mGjGaNdmX82SNHd5Cz9p/7z0lRi
         MFPOExJJiXMAPOQ4cZb+RY205mXWdHhiI27U3dpnPs123bgKwjayydOFKKs4rqwcuLwt
         p3sFcxW6RVFnnxv2Otk9VijK6QZOf+XQKHYX8Mb4M5fgRgEox2aLuzfG9xOdCo7j/Xoz
         j/m58B7bfWZb/SKRhhB9SAFyVqnHLomcNqIT3CsLnsggcc7tiRumzqX7L4TFRRJ52zTO
         qxdEhhQTUEQTWAcY9sw4cl2gP3GEPPUIRWnWI+SOuNZGv2xfVYgNlSmU9I+bAtUvdK+T
         2fUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdpLM91KlHjnD6ontXSkTKc395XwFH6yMIl8Ds9Nr0UWO1FOK/tZ+v2z17NR2jmhLbu8EYbDcsu5trZXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iyBV7b9OwQYfnhT/VINGpwIQgALkz+fD2G/g69NZyGHHltRxO
	6DqHNPU/Oybj7zg7oqOvNZdYEhoM34qcMOW7svViKzvbQNm0BwgyWXwW
X-Gm-Gg: AYBFou2x4rni7x2LPsuBfoocW8tM6Iv0PFMdw02zXzZcHCDnuqE5aYxHMfoy4fvYdLA
	u3+vJ9SLxz8ieNzYIpIsJQSURLRt7aV+JY6EwoOASBlkSOqBfzMYlbuMJKXv8AEjWNYSvB1idZ6
	YPffhXEfmMWxpmniHPIqSQfvYyATgKxzUIqLlSU6jOgwyJOL00BrCOTFOXIokc6oIka0OPeDbmI
	v+cncyFXAXPFEpzyXJ2QK7LFYjBxbjwItqrUhYg/reLA3ZE6bKpHx1GhMv0+WvbVx84tAd8gXXI
	sugN9XsLeIJADhipr0b++UHtiQa76U50iDBPYZKXS+sRS+bP581DPL+5kxpNvWXRpowevgalohu
	/U1BpSRQCOrZUPWCImCVOW1J3YVFC/grt+ao91NeeKHID/IE7JvEEe8BJFYPYIdwnbQuyryvn1a
	gXYGXJoB8maTL4JXUfVZnVK0OdiQcVeUFleP47zfle4c7v6CKqylYA2uXMEGIVQZcrri7XoTzrA
	oc+VkrWncRZtqKauCsvHVfhcIgb/FLNbdVfk+AERQMlo06zGJ0/LqU3w1V5FBA8g+HwBKkfobfP
	edTdjCdIeIWmUiRpumn8ZxUMBAYEWm+0hZp7cEOZ0+7mqlAAszuD0I+tFOkqsVCfHKphW500Jcn
	DhsEI05Ee9OhfCMIUxKyk8SC0KkCe8+QrKgyfwaQj81pjpHX/vx2Ae0rKTTEpTuyqxQ==
X-Received: by 2002:a05:701b:4591:20b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1b24f45f23dmr2950238c88.17.1793875438944;
        Thu, 05 Nov 2026 02:43:58 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:58 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 09/10] ASoC: fsl_sai: Reject bclk ratio smaller than slot width
Date: Thu,  5 Nov 2026 17:42:36 +0700
Message-ID: <20261105104237.38542-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

In hw_params(), when a bclk ratio is set, the number of slots is
computed as bclk_ratio / slot_width. If the ratio is smaller than
the slot width, slots becomes zero and the following
DIV_ROUND_UP(channels, slots) divides by zero.

Return -EINVAL in this case.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5c50ed7c2258..c61703ddb6f8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -632,8 +632,14 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	if (sai->slots[tx])
 		slots = sai->slots[tx];
-	else if (sai->bclk_ratio)
+	else if (sai->bclk_ratio) {
+		if (sai->bclk_ratio < slot_width) {
+			dev_err(cpu_dai->dev, "bclk ratio %u < slot width %u\n",
+				sai->bclk_ratio, slot_width);
+			return -EINVAL;
+		}
 		slots = sai->bclk_ratio / slot_width;
+	}
 
 	pins = DIV_ROUND_UP(channels, slots);
 
-- 
2.43.0

