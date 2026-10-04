Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D101D175A6B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093902; cv=none; b=ka57Of2LXu32L+/oaQwfrFOu3KBQI5jsF/Oj6ASyBnz6utTrPK+S/L9JF4e6y6havnSd3ksLhOoYiR22hVbg+2bo20ekdzH6QOW4RF5nKvDrVhtGaQrGOs22eYBXpnS2j5aYrtKepKjnsurcgRZoujoxDfKV/Gwib+8klg0wcc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093902; c=relaxed/simple;
	bh=Tg9Fb0S/kn3WqXmtsngaJ/pCDuNRSXzw1e4JgFn2CV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcFNcHge4qL/f9fXp6zndUAasMi3FHdcazrsHLi0B8b0CoKSnuK3LdGmP77IjPwmkvwsK6A09cnKYNqiUP24N43vOtiswavbKrrD/ovhnp02Li6+JM5of2RPnRjCqxjlUpx0Un9SCAi7NVr4MocsTz06Ar4MmHvceEWpUckr6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUXH9Tqq; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUXH9Tqq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso529221a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093900; x=1791698700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=FUXH9Tqqy4+V/J2BXYW0s6bQnwHBaFsdUebF3laxhqnap8pKjApMFX5pm7Atq9QUsU
         FpAvpESLLfSIRKBNbj5ToTmD7ftntfOQzyX1wgjt7ku5jQIGEHau045eGctWdRzCcEHW
         9r+EDIMDBZ0Lc64IuCMfv+1jxbMjzrNgTR+jRijzxNkoTe2g5EeWdZMhcObQP/xXPhvi
         D0zkJQp1Qvl6a/02ndQ7XwfKXXXITZS4InG5hKfAoj8/I/+PC7a4G/9UDMkvhDs6nSCS
         A5RBARpTAA2DrxgJQDhtXagYbMbPHhwsIPQYed3Rys8SDngl2O7j7AOjj94mLPY7231s
         ey3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093900; x=1791698700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=Pliwyje/zBNqOodipSWHp0l5qRvouZbmcckEInKLuuZSqXeY1CdVeL/mU1PnBeoKHG
         XPCAqZyCtYgc+iAfimETnsPumGN2MNIHZjqw70QzMxQAdo4tu7WCIhrefHqntEQ72IiR
         0Z96DA52YRp6MB58w4qzPbaInHJELP+7S5ctoTdThJxYUqx7UzwSOwZzHRfWCc5Fcft/
         9ScQJmSlDlEXaKDxxdHS4JCbjbb0h5IypvdodxUE6aY8QKMKMcj+krtpZCYbMHRJyu6q
         p+yLdL6+RzzQTUbCJ9MVfNnmYbYKDBrDTM11+AjPpEH1r84Q55NTMeNgAJe6jWOCCxrJ
         kIqA==
X-Forwarded-Encrypted: i=1; AKwUvBxBoub8OBvm+DdRcR22EgcUaeU8t9r9WZdvghlwpqeyZp+8jEpFFiABjJH3Y9EQjJ7kqymDpYOUhJWy/5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpQeDX7rv203LkTjUux2ZygjY1YpNwRLx2WgzHkwVEVv6aUdzR
	23Ow8TP0f+DKz7rbwDgFsL+WxO10E8EdZaSTAVMN1uSZ4BVbnjkPoJKF9RFLBTSZ
X-Gm-Gg: AYBFou0KeV+4BI2Bd1FmAroHgEmXzEzM56Jt6P21mBG1VRjjzSGcV+wnzLBIhh7+AZE
	dB1iXDVoHpntZQC6YOqhXZ/c8E2R/SabG1c5okdL3ENMys85f9zVFa0Br1kZkONRmCERJL71Ti6
	MO0zKPV9/7vWnW/fvHO14xZq9dN8Dlxx78/9g38P7GmwkazozOijsmHWabkPSrMj63nNUzuURnr
	9iNyZWuqhTJZSsGtBVpQ/kLcvPRRKwyDukuMAlKF48n7Pj4uxY79UWIrPM+ebDXQOohPHOmPgBs
	LgNIAhCf4Hd1oEFVPceFSpjTfcTagwsno2mwQyuhMZ8y/3DBM9Rzalp7k6i/M5rorntis+tEoc7
	z64xVLEu8SU9HIMfO3CfZfcjbtpMz+ozZU6xBCHK69ggq108Xi6pmAGQ3RKdyjZpR6qgBBcAnxt
	ZhUpq31JvEc15Uo8AgiRr4P1xQ1joq6FWobavIeDkOb3+Y6dqWndm+6vxey5Vw91VoLgls8AwNq
	l7x4kFghCHBOtXQi6/t+O3VioUrl9GPgnDdjOXo99Rzw8lVZeiqt21luQ4kIHeCrJ3b+/FEiOmU
	l1chj5lmv0wbVj2SVcz06iYoCpy2xzrus7uWLC7ZBHmPdaKP
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2835623a91.39.1791093900190;
        Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:30 +1000
Subject: [PATCH v2 03/21] ASoC: dt-bindings: cs42l42: Document
 #sound-dai-cells property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-3-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Tg9Fb0S/kn3WqXmtsngaJ/pCDuNRSXzw1e4JgFn2CV8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+RM2Kmkv1uvQWTh/GVrPtZXmXm2312b5qR2vFcma
 s/nKbo9HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKme4MHwh5/zmoP++ubfe22u/Q+uY2q/VPFuA/vh/VM9301VOuK8YRojw9Fnp1N
 arHpenZUxm2ntFt9WGnNK5VwTo6rAozy3h72anAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define #sound-dai-cells on some machines where this
codec is part of a simple DAI. Document this property to keep the style
checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index 6c100cb36699..bc759eaadeca 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -26,6 +26,9 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
   VP-supply:
     description:
       VP power supply.

-- 
2.55.0

