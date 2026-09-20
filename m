Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A42B175A95
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880138; cv=none; b=s9tX7u4blCcZx7EWpvp2jU8h4B2h0ejZ4j4rudelhAx+xPXGb2j1dxOl/5kPmu3tCBk6AikJfa2R+6sGY+l7sZgP2qjJu5D9KIHis8x2auNPBxPcR+BBBojwstfemfkoDPzBK4u3CWKeQkItf+KAJySk2OJx7dfLe1FB4CQ0hys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880138; c=relaxed/simple;
	bh=vjc8kzENgz6iKNAy+aA+ET9iiFQ96+MVJmNToH4ibVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4oH/irlK4nZs+OfbJD1p7ot0NLxKBeLGUu4cKzAQj4803tOiKdyGHnNSO2rEhLKtBU2IWwDWIvRAEsdprlyXLx8JZzcowk5U1FYWtpz6cxCFQXYbIQHgxguVSRAtlBRPQB3b7WUkZJ8yYBPfdlpz8Km6vD5JIHtiK1890z0by8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhNsfMsK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhNsfMsK"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f066d8so6961885ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880137; x=1790484937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=YhNsfMsK0qk6onzsVi58+SzI9I3WoyBfqN4CqEjUIBImnWEhhFpsM0ryqMru1niaN/
         TtBpZo/vEaOmhVFIp+tzkY4D9aJt6pwTlv0iEFtgCTEnXIX2aRPQuVph9lfLhLDf09Qh
         rEnips7XyrbCo8HIRrawhZBA2wkgrEohk1ILg0/RSsG2t5hky4HLwVJu4qCYTdis+XbL
         9f88hWyjeJkiN7qJSPxDZcuigFbPnSUU9rWpHr6oKgKO2qZRXIT3lNY7ErKCWY+zKQo5
         nHKEUpYaPbdBg26ozTzWt3LaHhDqJusFr0DtsSvAND35I0+Nhx/by8XPxbw32ppfI0KI
         7E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880137; x=1790484937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=yHDwICutokNNnEmTth6ySSJzrCmP+jeHMtrWXeTgkCCA3vNRShqipECL0nLbT99Dxj
         TBjTDpRVpuZdLBKpJnn/NIVMz0baFbmYdng814OKWqvEMJrT+wrgQWgtB5sQ4XJ1Nccf
         jgoYHlYyCr+sdbC2Puk7PN42ksOot8QGXXOuhSXttZjEDA82S14IibzecNg6PC+WxAVj
         5wn34hQC3I2HEHFvauyIT7ELvwiTOGOaATgD4AhEV/tYsRw7WWAbyiaE9+HZxoQ6CaSD
         iwR5xVcGuA7Y7bT23G+UjkZvS2y5RDYmR7YUe1ZjEv6si5kHxJOjickUKgFYO2UylL5E
         OpwA==
X-Forwarded-Encrypted: i=1; AKwUvBzSezcv8SjxYNFnJ2cyMzCQTiHkKJUQTOzuNZUsdkLMVwD6fAB3e0rZTinUdSYeE/jj0ehdrEfggU0mwb0=@vger.kernel.org
X-Gm-Message-State: AFuF++n2LQnIYEFu+y2qo0wSQnt7HO2fN1l+MnLlfCYDkvBk3gZMI0o1
	xl5SUYEdAGmdgcQQBtmTE8LKctBkcNIBDlVHGkYC0yZVhl15HFM7jGO8
X-Gm-Gg: AYBFou2wtQywyIftEACLfdMyk+1ykiHMQQquff29A6EKP090yDhTFu5N8Q9pTdJbrT7
	onco+zO2afLufJ1yA1RsOr/scm3rquLWYSFMWcRs5uc5ddb0GvRbOINn4YwcxBs31bHPI+d0a9S
	EHHizW5OcgAsvi8fnQ9S2fbesHH+jjqpE2YLdNje8qRZ0cFmrKlrdxqMm90ZPEyuZlVAssvGMj/
	rG63svrYu2U4AWZjLky1FWOjdI7dNR1COExRJGNd9sw0YPExZVFFfOgrVozxi5z6I7mZcLGOn/u
	3RMXOlgcfStMHnsvzBKGBMOhmqGirbTXGab8wVtbKGWOFV7CzY9l2ezVtNUfknHn2kTE5yX/aDr
	LSx5ek39YC5dfqapyJ8v1AiZ5pP1PUGPYPXaUryreFxShyLXfW9gE7l3HA8mHvyFxOS65BU6MEI
	+fkbhdxus4CPoHFwnT7CGhhELr3EFyOlhTAtH2regpEAt9LsO7w8J229sFPiu2hspLYlLxPw4Bo
	ZM41DMoVvZ4je5WT5kqMDpfWSpSDqm5KuVaHTRIGIqhQ3I9OIBFC4JuoaVRTLVtCcctcbJrT5Q8
	VGRV6uETqfvuS9UuLvYWZh1+C1PhGMeKbicvHptjkNg0k9c=
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr42342795ad.37.1789880136783;
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:42 +1000
Subject: [PATCH 03/28] ASoC: cs42l42: Set a faster digital ramp-up rate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-3-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=OmSPjK7SUuOGMGgXmxuIo+R2IFqwguXc6h4eMDL7B9Y=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UPyfalrpv1r+xTfu2HLE4JBaWJnIbuCs4xLr/5f
 j7JPX+yYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNU3NBj+6VWfZumKncEUeYQh9bx1/ZJCiWl7v/0OePDm0bym69Z1Oxn+F3iHLD6
 yt/urYQ8zk7cEo0T99E9aWpIxG7Ysk69699SeDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

With the default ramp-up rate, there is a noticeable fade-in when
streams start. This can be undesirable with aggressive muting for power
saving, since the beginning of the stream is lost.

Lower the digital output ramp-up time from 8 samples per period to 2
samples per period. This still leaves some fade-in to avoid pops, but it
is a lot less noticeable and no longer feels like the stream is fading
in.

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/cs42l42.h    |  4 ++++
 sound/soc/codecs/cs42l42.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
index 1bd8eee54f66..b3657965d491 100644
--- a/include/sound/cs42l42.h
+++ b/include/sound/cs42l42.h
@@ -62,6 +62,10 @@
 #define CS42L42_INTERNAL_FS_MASK	(1 << CS42L42_INTERNAL_FS_SHIFT)
 
 #define CS42L42_SFTRAMP_RATE		(CS42L42_PAGE_10 + 0x0A)
+#define CS42L42_SFTRAMP_ASR_RATE_MASK	GENMASK(7, 4)
+#define CS42L42_SFTRAMP_ASR_RATE_SHIFT	4
+#define CS42L42_SFTRAMP_DSR_RATE_MASK	GENMASK(3, 0)
+#define CS42L42_SFTRAMP_DSR_RATE_SHIFT	0
 #define CS42L42_SLOW_START_ENABLE	(CS42L42_PAGE_10 + 0x0B)
 #define CS42L42_SLOW_START_EN_MASK	GENMASK(6, 4)
 #define CS42L42_SLOW_START_EN_SHIFT	4
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..c40e8da8f6eb 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2422,6 +2422,16 @@ int cs42l42_init(struct cs42l42_private *cs42l42)
 			(1 << CS42L42_ADC_PDN_SHIFT) |
 			(0 << CS42L42_PDN_ALL_SHIFT));
 
+	/*
+	 * Configure a faster digital ramp time, to avoid an audible
+	 * fade-in when streams start.
+	 */
+	regmap_update_bits(cs42l42->regmap, CS42L42_SFTRAMP_RATE,
+			   CS42L42_SFTRAMP_ASR_RATE_MASK |
+			   CS42L42_SFTRAMP_DSR_RATE_MASK,
+			   (10 << CS42L42_SFTRAMP_ASR_RATE_SHIFT) |
+			   (1 << CS42L42_SFTRAMP_DSR_RATE_SHIFT));
+
 	ret = cs42l42_handle_device_data(cs42l42->dev, cs42l42);
 	if (ret != 0)
 		goto err_shutdown;

-- 
2.55.0

