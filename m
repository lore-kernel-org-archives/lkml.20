Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDEA479898
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146862; cv=none; b=ooaIVaDwW6fBtzAs+ggyQ8KRm1QtgVgE/Gz4M9W8mdc7yu7Ec569FgFE0C4kxpq8aoPG1l96ZvwFUe6cLY0u0n2YGDogCt+B2/qU5sEuoF8+x30xt+MRs1pwWiCRftGLaFmv1Llx2VhTN/VZWsdH+of3DmK6W5nK4LFBRJ1/gMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146862; c=relaxed/simple;
	bh=CocjqBK1bf5KCvJSo6fMTgVPCgDyzqgdFwf2wui+jZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rqk//OB3jX9NYPyKQZ+bUeVR1gCugU4fpvQruX3q2vr9/P1Kgvv4ddlJYxNHSw2O3ipMYU28XrC/Vhj7BV3AdEKE3gLr1M2K6p8JxgH6beQHqQJ+6YYF1SLTicfv6t+E3YeWOgN+uv03tupICikUbJhhQTw7VwH6ItzS1CXAi2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nrXZQTsj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nrXZQTsj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df54150dfso1029618f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146860; x=1792751660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vL18oGUd8P1r7kwxwBhDb5d5aEOYYG8Ck5OmuOWVWk=;
        b=nrXZQTsj4bP3VB7bYOf+GqsPDGBv0JKkU1wH83ZyjYhBNquKviOkVpYgF+XFcNuM7Z
         Sn/pc2xFQoQu0cRRVPjjh7Z258ndzXmC34VZ19ZrqOs9+78YZKRTQbZHNDIPt5e4Jqox
         KKBVOVJaog1zCmztq4SPZaXlzHa2WQByKmcm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146860; x=1792751660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vL18oGUd8P1r7kwxwBhDb5d5aEOYYG8Ck5OmuOWVWk=;
        b=Ef07wRtX4rV9yXBSFH/MdeOr4f5u/ogjC1x6+US2heelq+LKcsbJ1GCEzaQhFbsTlE
         22T4MmGDb5puOq+x+K2y/Y+1ERDH3vBYdRmp37vphIb5+LBUZYigyB62qW3qsFV3v9FH
         HFp1oO/2I8HBHEkYef80rFhUA0JZpn8pYRvXbQUfUH+bXRJ53B1eQL3GLJWF/wFW1lvf
         JHoXlBK6Sw/QdW9X2F+9OvNmYTS26MQ7uDGx6vq8f4DLG4OciQw0y5kZWG4YQdVG97ak
         2ENEp8Dzy2O0lak3V9JObkhisxx2o+8t/wpjzfqFiepI/WhcKJBVrdXxacvFpjtzp8fs
         q6gg==
X-Forwarded-Encrypted: i=1; AKwUvByiOLisU7/qST4cc52ghU9bWP/lK9X/5PI50T5FaVlCYSlbKpO3S5KBHfnrKpCpN/R74kD8F4VBjSFszM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi+JIAMiH7SheXORHS3AIGSjs5L+E2pujCt5vJJ9dInbQLLpOl
	YDAOp4TxcCFknA2Ax4uA+QhEz3O78S4IuwiOKhgHHz8LFc7MHe8srGbLRHYuV4lDIhc=
X-Gm-Gg: AYBFou0hAU6iS31sRA1deA5+AOz5oGxgAsy3/6OD4rxlMx+8qKs0/OTorit3giEalNS
	j6jPynAiSImmbIqz0XW4Ns82ru5UW0CqQPF684a531DY/ZwwVXxJcENM7C0TMC1BBbLRNEZUp4T
	a9pT+hfAEVX/NQ9pSEsFHbTdaP4LN1rm6c4MNea8OONpBhARJRIktiGZpULJXd/XULgEGv8dQuz
	nchszqg6qyig6I1//wm7h+5EWN3QRTugYKJl5XFfr+Hsfu64eSKawb5LvRKrl9DRtTDO+OnU+L0
	vdqa4g+dIk9h1X3Q/GQCcsGwih6osrMOirI6AIvgNbzvRsvg50WIFT5k1bGJYKqlVjQgNOQfBF0
	GFR3SqQ4pJyOIJdn0uQcquy4gK0bjQtmp8N1DGJk1bz+AW8z/DTdId6If+Uxf+8C/lzU38SFAHx
	9umAJotM4yAUpNT2+WDrtXmycGCxZTAohOI1GUezYXqWKcLir5v/c9kR6LjOtrSkP+qFDbWWtj2
	IlguVOAh34+gHu8Z8rIoioNzEnM5mvsn9T7OggFmWkbma1f0+CZhMo=
X-Received: by 2002:a05:6000:2583:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48dff815434mr2832521f8f.41.1792146859019;
        Fri, 16 Oct 2026 03:34:19 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm4163148f8f.2.2026.10.16.03.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:18 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:57 +0200
Subject: [PATCH v2 4/5] ASoC: pcm179x: Add compatible string for pcm1796
 and spi_ids entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-4-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

The PCM1796 is fully compatible with the PCM1792A.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>

---
Changes in v2:
- Added missing entry to spi_ids.
---
 sound/soc/codecs/pcm179x-i2c.c | 1 +
 sound/soc/codecs/pcm179x-spi.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index 5337bcc7c62c..e81e20fadadf 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,6 +32,7 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 192fee90c971..4b873f2986c7 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,12 +31,14 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
 
 static const struct spi_device_id pcm179x_spi_ids[] = {
 	{ "pcm1792a", 0 },
+	{ "pcm1796", 0 },
 	{ "pcm179x", 0 },
 	{ },
 };

-- 
2.55.0

