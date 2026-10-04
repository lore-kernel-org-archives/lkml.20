Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3F6352F86
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093911; cv=none; b=GBk9BV50rqxLhTBGlJVTjFxXCfddb89sVq4MCj5pN4v6TIrIvcAB+YVLLda5dzEkDEtB0S+nlVsPtoDBNCRVaGFrN+wb5/VCSNJSeTAeSClGHZP8Rzt8qMi7TmzhWbtPn1AlzPgEEap1Zy6cjFjjsEw9VabIqfmTQypKgF5b9QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093911; c=relaxed/simple;
	bh=Cx0fL2VvnwLsqHLvmS8INkeZRK4JUpqpc1FDp9KDOfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0bRB4WkcYE9fBkwYG5VGN73RpkSL5n5v97j/Rc1BH2fL60txkX8k4aoJ1mrc6z9XbpZG8dkE7P79ARfg23c2amSA+C0PKQNYgLYWPcMRQBNO4PMapACXfSsuCGfv+A/1JeaI9G61qtpLlBixz+djTxpvYuWpteQLv85RiT5r4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiT7M80P; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiT7M80P"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so197536a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093908; x=1791698708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqmOLIl36qQETjuB7PbP+3Wg/tYuEHw7Jvc1sfwFByk=;
        b=AiT7M80PNNH9YQXHJtz0g+oVjrbI2mjk3t+DilWIvLVeifmB1kmfCUKlrWEHyhYK8N
         AtHhPfswoXJGUtRrQft5e8VuClgrYgdpeRsU0PO3Golxgk1rgMIJXgCrkZaRFIWTsm1V
         ktpFOjj3dvEbJL6zaRCvHyxSJNUjBQBpwUBLCDo5vMqlhZd8RvAjSOQeCwJZAb4sFs9c
         uc6vlEtvKZx9B4jiVH7eVSbSKcNmRJBEuLrgYVNDLftMKQzjv1yhZCKwzhO/4ViIKfLJ
         yNamEPPBZckbfiHwwAkXPavT7H17eAnwRtqa+hRUF/QI5EZD+3v91YmAVIRwmkUWEpar
         ZutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093909; x=1791698709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqmOLIl36qQETjuB7PbP+3Wg/tYuEHw7Jvc1sfwFByk=;
        b=rkzj8z5fOxfFrGwfPEQ8Ex7jbnkbe8oQe5EpeUxON9nEdYfYZEvGSybKVB7ASc310+
         ws13a1ySG/GmGp1F5FLf2AQ3ap3f/zmvizJzV7e8ewMEyEj9XNLbMiObgBeIWJoa7fq3
         9GkkHkK7gcGgyBSn2LVKZHhoKzrAcgowMbr6xZ+6E3FyPqMoN791dRf/0AyYgAGoI2zo
         YFYovdK2XUc8F1wsq7OUtmqgWYY3XZuMpdSlIrGpgEBsBgPqg2MVPWFWiChnQa3Rl2ug
         OYAUTfDMxdxkR2jrq+P2rjDz+Ein8nbCwu9FwfdfY0zuK0e/Wz6kEHmTCIqXQQjFXICc
         kYNg==
X-Forwarded-Encrypted: i=1; AKwUvBxUhUGOEY51NdCtUrOokjQp+dLk5t3/s/c8p7gO1sEs8KjYG85q0ByecF+0/8OpCwLcabTtU1tPHcnnP5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjoKlIFl7oiN+ubT1yqpz/Db9Kv+1AIvq95rkTwBSDirY93j7t
	ifIVItykwDGSRo7ToFnlDfHlb0f3V9SemqSeyBn1Ru+mb2qEHQPgFLIOw5RnUD5J
X-Gm-Gg: AYBFou2xghwdpwu8xbMwBEljEXD2RUF+FfgqUxWlK10MkTiqri3WZPQAOLHOPfAMoi9
	RCc0/3StBDVFnEMROB6c3vdvbscLVxEICwd7ThQUFyZ8gmTWBSrqFNy7vDir9qq9LyDqqAAVePl
	YcvjIewOfocYtJoNfTQdRTjTMcZGGriJERbichkoshRbAMlRqaxx3xRxzZJr/3od7KkA2Z0U/aD
	aE6nWQj6BirkfH2BCCtFlF7PUk0CeYAQdDJeKVFpQcyiMwcozrWtdPLHIywPva8NGFHoG9cqlUp
	obfzZIRjfeyP7vr4EU8yE7owZSiBdshzAtbdjDQQAbux8H/OcfEDxrj8N9fi5PXyTtTXqoP+hJU
	Hq128wipnrohdKTdViuz/5BfS7bu2FteMfEuarH9NramOU7jvohTXBBJCkZHUuqeWOsJREsVKBr
	f6s2uUeunhb3ohhDVsCWrteuHOkvjVvMhKy5tN01cVirSzdKJleCfhcqxqkZMdLNzBVAnjqIUff
	azOsqnosCpvMOB0R3hGJ54eseVlLL3miW9iykamHfXl7vdhrguj4d7xPLBXJC+0UFg3e1vLE/xq
	c2y09PUK+U2xVrK6BSNsx/w4VzhuwWhE8eHAWWOnpFGkxqg=
X-Received: by 2002:a17:90a:1117:b0:3a6:e9bf:f244 with SMTP id 98e67ed59e1d1-3a6e9bff6c1mr2758728a91.1.1791093908591;
        Sat, 03 Oct 2026 23:05:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:31 +1000
Subject: [PATCH v2 04/21] ASoC: dt-bindings: cs42l42: Document
 sound-name-prefix property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-4-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Cx0fL2VvnwLsqHLvmS8INkeZRK4JUpqpc1FDp9KDOfU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+TMa63lNI19lscfXLmmJedDuMK8VtmvCllnZKIn9
 T9vunipYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUb7zL8U0p1EZI4bPTtEkvLYlWLwllT1wbqXbuteH7xl8+7ontLkxn+B5/2/bb
 vj4KDQUOSipjXKZlle7gEz9leeFF4cCXrY4eXTAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index bc759eaadeca..035463be1456 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -29,6 +29,9 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix:
+    $ref: component-common.yaml#/properties/sound-name-prefix
+
   VP-supply:
     description:
       VP power supply.

-- 
2.55.0

