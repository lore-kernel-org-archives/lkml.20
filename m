Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59764F474A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413233; cv=none; b=p4oJokuEPHBWjfVYbAJCNrIzqnrflQsLdMONsuq04o39wPDjEwbHEM+XVB+viBcX7KC509I8iFg6mo2d6bkwfEMRnGOrq27ItRjjEvlXF5gR1fCQATJUd91lje59UsowAAp5dg3oBO57/OqIcHDESXmtHKRPLCiQOOc940Aaqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413233; c=relaxed/simple;
	bh=0GuxC9RnJGOljeit/v34dy7mpuUKalG6E0GqjE87Yeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A+8gykI+nWXAsINh5F9AjseSRfXtDurQFYYQerFC4vW+5N2l0EZlg4E+qUzmyWM2vVBO3eVVdOi1hoYsQSQ9TWFOPY8DFtpNTEtkulZAP5mdaJ6Gr0MzaX1WOyBd7/2h9xrwgAD+ZOAlIxNgAQAdGbTT42TFbNz9f14rE65n9MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=G0cCyrwe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="G0cCyrwe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so14018985e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792413216; x=1793018016; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q1kDGFOBuUTvyA06Flp2KWhLjMc4oScSjHsi2pPF/t0=;
        b=G0cCyrweFovJE9kcTaKKI11eUQXRLsEPEjYzjP+oHWNvlz31iMbnlg8402s6qFFJ5p
         8AQoWzwN6dUjWIYuS540OeJOyJvQmPtxf5emKzZ/rkqo2G2Sx096gZCCOztII5Qi6SBn
         cTMJUtXMsjRfTuwHRZqliH5LIkq+VAfxa+cPW5UcE1JoXkW8yIWGTS2VYOI0M7JczEgc
         gaMFDTxa6AwAeljIo4UI+wbDYAOs0vSu6pifiuatSms4hKPGkAMeaH0V+ZnnHDg65SNm
         1vwB9vfX+2CdjGLu/sZZbEeFLRRtHX7HdE07mN0fTu4GY4n8LtHWaECC5DEwOq3yR3xV
         gulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413216; x=1793018016;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q1kDGFOBuUTvyA06Flp2KWhLjMc4oScSjHsi2pPF/t0=;
        b=pL0HNcy6y1Vq+RklyvR5a7EHMLcJm127RvM9jwV2zLoyRe59tJTvKwjdtoOwy2WJwK
         JFoIfQeT1ReU69/+yg9fci78hioonzARK5qqzI51iQObVuWRWbng3xnaCjxPeJZeZupA
         3NPWc960jQtOsW4bGHGfuWVAW9Ud7TIyKdw5DXncEUP9EUk6qDvQuCZAUqc9Y/2CgbmW
         ECB3vxVNBZU6KV3r6tXLaM8JTdKpCKK8FUFQZr8jnolKn/YtZS7l5bAB6/GzGxgyIulS
         aTYKmu5cd2DalM8+vxFYqKu9lWHk8AxiVOa6YvRxPlGL4yRSyWLAIBye9GSlhy5k4b4l
         +UtQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/ftSY9JuPkej0g8Fsd2mBaSzrp5VsZMsVQF1AGbtVpJbhYAF2xXR1AazLahyMBPQyVZRRC5gzb2X9ZeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyCNH6NGCg3tBNgLTq3GtYhSD2+sbsrm0fcFIcM1qJdarrykws
	Zw4E/rYQS8JCbWzoAYvs5ZgAvofPvfriQkXFsa5QvRfZhIeMZUc2lsPPxqpBLQdAlxA=
X-Gm-Gg: AYBFou389JE1CE8Q0ylbiqIaqiVlwUxiUSPdFyYZO3cgqXZmUtQQmYIwHm3ooHTiSU0
	keHjeHl6N3eSVkHguTsVr8WWgjQW8FrtaHwgbYLVddWv7WJo/d5gqFMEeqedG+0ICmQ3Ut5mRN0
	C1tu9Pw1ypWrt7R6TQimgzOvm5lBjyAlNoyHtUUtawSdzcZ7ls4aRh2W3Z+yvhVFnCcVtmULXiq
	muFRMWUwwPfWCd5Nu928yszaJuCPHy+i7vBSnlbpzNRDL0mebsUyzdtVoDntO4JEtwQNYKE4DbE
	jUkr8hsaEZENugXeaDAyFj/j1GbJbdi6/xGum2rY4DuPw1kNEY2360X3CnmI2vW4XWSsT+EDxeU
	2DR95ciEpLQ6Ph5PqFOnd0fsNfJUYI3Wt031JTYCrsM7LqT4r58bmiPzzInjGzsqP0aNxaoXTmt
	kDL3Ske5TpfhYGugR8lzdDBAVwNEIewOQ5DmJOddyfghlQkzLny3SO6tQFzKBEW1+hxcLHbYQF/
	cM/dUAHF52/z9ZZWIy17O1PZ2Uti4clwBIl2+VEKJkkXHCOOSRcNI/sYqziKl3u9oEhhtrHmQ+z
	rBigzhYegksOmXYnyXYtITxqLr++Py98Ckyt2A60M6iM7k6S1VxgX98=
X-Received: by 2002:a05:600c:154e:b0:4a1:e11f:b2e8 with SMTP id 5b1f17b1804b1-4a1e11fc15dmr105829485e9.34.1792413215929;
        Mon, 19 Oct 2026 05:33:35 -0700 (PDT)
Received: from [192.168.1.100] (2a02-8434-7c41-c701-8278-849f-666b-c282.rev.sfr.net. [2a02:8434:7c41:c701:8278:849f:666b:c282])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm24677930f8f.32.2026.10.19.05.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:33:35 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/2] pmdomain: mediatek: mt8365: fix defines and add
 missing one
Date: Mon, 19 Oct 2026 14:33:54 +0200
Message-Id: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UBTSbBeRVykyURHSVoyVQqld
 3daF3/x+PDeCkKVSeDarFDpy8JjUTCnBsLTlwchR2Xo2s6Z1vQ45ThmzwXz/NZdzs5i4gUjJS4
 kGNxAzqYUfG9BLVPVYzkKt/uf5TO8KMy7FrbtB6RUIEmDAAAA
X-Change-ID: 20261019-pmdomain-mtk-mt8365-fix-defines-c6be65ffca95
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.16.0

While trying to add a missing define for BIT(25) in
MT8365_POWER_DOMAIN_MFG, I realized that the name was already wrongly
assigned to BIT(22). Trying to fix it, I also checked all other defines
for MT8365 and noticed a few other mismatches between the defines and the
datasheet.
This series fixes the MT8365 defines and adds the missing one. While at
it, also fix some indentation issues.

Cheers
Julien

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (2):
      pmdomain: mediatek: mt8365: fix defines
      pmdomain: mediatek: mt8365: add missing define

 drivers/pmdomain/mediatek/mt8365-pm-domains.h | 11 ++++++-----
 include/linux/soc/mediatek/infracfg.h         | 21 +++++++++++----------
 2 files changed, 17 insertions(+), 15 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-pmdomain-mtk-mt8365-fix-defines-c6be65ffca95

Best regards,
--  
Julien Stephan <jstephan@baylibre.com>

