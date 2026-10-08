Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CBD4A441C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465024; cv=none; b=NOYdMfinTadGlSL9pvn6D8l1r4Y3ZfHdOxPh0h0sWGwzQ77mjGA41ZFVWtep/+WZxdT59frd7CUMlMEgmsRNd2xhuR0Ga0pyp9sd4S5G+f2PloixBUh7DjbSEoRIDTXPW0pAA2y+qzGuYIbxX+TAgYyNO9uruN8n+A0mfSDTZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465024; c=relaxed/simple;
	bh=YUlGiS1jZeNHsFEGcCiYFDgEtUvaG1Q4m1i0PNWHCQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBk7A+thAVfJFI3GUbnqhXiEB1WTrMC4E/qBpk0/umkOw2p4rEvNKS+Imfy/PlE8q3Wyt8YJU7UdzVdZhH6DlVDh5jD6UCgqFQKikHkJNYBYBxtDkXg/d6Se1vmgLDJN+cuqtjbb55rFddELk54o2ieBhzGOveutEQjWJWUU9Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iau03qP4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iau03qP4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8899a204034so1685299b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465021; x=1792069821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyWxBnAVI9qXIp/uzV/KvaCBjoQFy5tL1Gd9TbfdHlw=;
        b=Iau03qP4LgAKnEsfnbx5eLLpn1pHE8LY4hh21LPOpBQNvMtqFCz88W8YlhQb9Xwi6a
         OYUYomyiWZ3Vxk4Pvx/Lizs6keomAQ9a9t8B+cY1PzVZTtQPCR2zvZlSmEeOm5AqagGZ
         0GQYPIGGQz9PWaKz5hojOU60KrGbgUtyzTdh+EzpQNhWeIUsC7EnYbW9omqmLY14tt71
         ncRTY/wfJijSQdpOxZhdv7RxQAAsTUu64BeUXm4v2JBoxpLp4mRy4luEWaPKdDLrSA2F
         +NkIua310axyI7Y9PbeWN+r1zkLPrtp+dm19sqnT/CyoVl11D6Rn4aBbotwmT4nGUzwg
         OifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465021; x=1792069821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CyWxBnAVI9qXIp/uzV/KvaCBjoQFy5tL1Gd9TbfdHlw=;
        b=C4xdSVbTQT4LkxMFN9IEIufv50/J7ul8F7UPEIPOSTt8UHR0YGlmAyGXgK2DKJPxcj
         a7mBgm34MOI/Ug1xppcm4a8Xf84nFC7xL18mRBVCjJjibsXYnpCffv6siatR5rSyk2Hg
         7M2qeAirKo++vYrcEved6gmlEgGQA16FKkvVLFYKLoKLZB30q0CZohAsLYgm7GLldQa+
         yEhNkabaqofd0bcNwgaMfZEDSMX1jEDyw4fDoTF5R0Wq/RKFB69M+2Isj5IHzeq/ndjs
         hPV/HmfPJ9dU5oc90M0TDsKLwD/IgyHyGoJeyGfZ+0l2T3Xlvu0Horn1sKdeh1co9YOl
         6WJw==
X-Forwarded-Encrypted: i=1; AKwUvBwLWhE3k3PJvtHMI9yO+poUa2P5fzvLc9eYc8HUOMgjA9rJjuoTTb2Ta1h0kPNPvZKjmaJGIfDuew5CDYA=@vger.kernel.org
X-Gm-Message-State: AFuF++lGxxpVQ5295ks/tRtWWjNvf2TbahJsM5KYPgmL43bCMCwSe8ei
	xE44q00XjOy1Y0SSiO+PfnLHZouPrbUYmtmthmIzqmdGFUXcFgasBJE5
X-Gm-Gg: AYBFou0oHoFvOJFQIoXiAQMPtCstwc5RytEUVVRClrumCVRSuwWghl8Ql/3hzSbLCd+
	9rxrg6pZV7Y6NMxJyflPU+l9vGVDG8L4gvpqNoJVnF+nZ1gKskCGuCuHOg45ZKcH8W4Zzyqa0Za
	2THWZFe3aayF4ywdvJ94lZqEHbWVrNxhV3TCWPVN0Wrb/StfUtu23P1vw9VSk33UYqE3EtBMPfj
	2qSB5o/jPDm3px1jViQSkgw5tX1pZ2zD9Iylrtcb84eLPOnlekWfNoxBk42iOIfPPsG5IRojJP9
	aCD1PdV/TyD6ZsAWBw/rFfXPbi1NNc2XwZTkI5k6+tokQMS+zntYCytCKU/yyi77ITV8I/ZpZgt
	Bfqi5ODMFCBxZ0F2ViRXgKugeilh9MIelLi7/y17LHd1U6dNAf6mMD4Y4D2Y26X8v4g460nDW55
	5Bm4yAjrKlBg5mf7tmYbc0+mqSAbG5HC7DuTg/Ss3p51halbw93UXpX/rFjZN+q4dbCEjucAkhU
	oV1PYaYiWmG2+pJBKS/wjeG4fjNa0QACWkryQ8IJLc+189A4mNpUAZGArTfw950u+aMs1xkQak=
X-Received: by 2002:a05:6a21:608a:b0:3cd:9f0b:f7a2 with SMTP id adf61e73a8af0-3e133d9936amr4172038637.11.1791465021437;
        Thu, 08 Oct 2026 06:10:21 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:20 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/6] ASoC: max98371: Fix the Speaker DHT Min Volume bits
Date: Thu,  8 Oct 2026 22:09:50 +0900
Message-ID: <20261008130953.2446692-5-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register 0x31 holds two 4-bit fields. The datasheet puts SPK_GAIN_MIN
at bits 7:4 and DHT_VROT_PNT at bits 3:0. The Speaker DHT Min Volume
and Speaker DHT Rotation Volume controls both use bits 3:0.

So setting the minimum speaker gain changes the DHT rotation point, and
SPK_GAIN_MIN cannot be set.

Move Speaker DHT Min Volume to bits 7:4.

Fixes: ca2cd6bc6663 ("ASoC: Add max98371 codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/max98371.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index b62bd98f2252..72bcdb0d1289 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -166,7 +166,7 @@ static const struct snd_kcontrol_new max98371_snd_controls[] = {
 			0, (1<<MAX98371_DHT_MAX_WIDTH)-1, 0,
 			max98371_dht_max_gain),
 	SOC_SINGLE_TLV("Speaker DHT Min Volume", MAX98371_DHT_GAIN,
-			0, (1<<MAX98371_DHT_GAIN_WIDTH)-1, 0,
+			4, (1<<MAX98371_DHT_GAIN_WIDTH)-1, 0,
 			max98371_dht_min_gain),
 	SOC_SINGLE_TLV("Speaker DHT Rotation Volume", MAX98371_DHT_GAIN,
 			0, (1<<MAX98371_DHT_ROT_WIDTH)-1, 0,
-- 
2.43.0

