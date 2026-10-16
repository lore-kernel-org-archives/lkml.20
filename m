Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A4444E66D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141977; cv=none; b=SbJFl+v6oH987zTJ21a2uZxMi1O+8rY/U/ZX5FMq6NTWMUMGg34o/FZRs92raNVrYykRx0Fx6j9VuPCpLM8I63n4TFv1y5EHYKGpfslFVKYa3I/xl8bnguIolFdPPID79YNlNMzs2Cj4xgWdOyyQjORTedhSnlo//AylDRLSGOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141977; c=relaxed/simple;
	bh=cAYyzvBvABdQ3mPgVmEus3vWnqb83GFBiX1p5PjH1a8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qWJLQX5FBxVsDB8Dsc8OiaMePZZ/vJgPRl1ByXffMoe0MZuVxFFEkSRQH1ytrc1/KZEM8y69C7X6PfYQVJwuKmY4lOL3uSLTf3m2kRjG6GH4QRT1xTFo9vpM7DKtjXtGQy/S4zRZFUKdr0af8FNJPseJkzRvpdlLTaMq/PoU024=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWhhTCgG; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWhhTCgG"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1631227a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141974; x=1792746774; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R5dwpMdeDtafkrSIKilmZHw+Byk+8y+YTLJ/JPrzYVs=;
        b=fWhhTCgGrrEUmif/WzS1oi+QJmb7Lq5pm7WWNUejivxq93/7FRIJmimPE4uSZiVF3z
         R3k/pfTzZzvLkPvdd00l+igI8azIoPjt7U0U0Z7/i02GbtnJaqHYg3h6DXaR+bT1jEB3
         oAogcRWjfrKSFJdrZykEvP8aFYOWd66NxrnW9ukI19ecfBqQOgwpzaldxJWj3By6HgMA
         PoTOpKoh+nXlopRT1yj4GqiLX9Nqsy27wzlKkgSus7hCp7dyECOAR5TzH7Xef6I3nr9k
         JUVTA7eAQEDXqZb2bgeyXjRwRjDhv/+EBWhAUjcfRx65ePTWzz+Q42ParWUqr5CVRQth
         lEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141974; x=1792746774;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5dwpMdeDtafkrSIKilmZHw+Byk+8y+YTLJ/JPrzYVs=;
        b=VIaKmoUfDFpEMT3IHA0DS+1FNSVRiDBDDtXVokr6pcfTP9AMIrAopkGyuECW/wKmHB
         fgV3aHQT+O2FFLpOtU5WaqFlTpCvcN0y1adw60ezKNJUnotrM9G+P6SruDYHLE+RgfGi
         lylPFzNI6DZs+VTrg80VQFo0LJLfp4WSzxFEGPIWG+Wh9qMYrlX422QTg9knFIR291d8
         EyyfIMH5fJzpdRN0O3D+WVf7YFJOEhzLXUohsArdxSRIHMRBvVaoi7FJGUSdmwmsp8WP
         maEoU/geYihAdIiTwF/pFm6r+QnE6MZ8oigLaQ7nXcPFmkyc82m6x1ysHY65KXnydk13
         zHfg==
X-Forwarded-Encrypted: i=1; AKwUvByRFihSbTSY55IBWYSTx0fUucVh2iBF1oqzwu+k/KFORoAR/5fY19AvqMf+36Vu5D1Nu8W1kJ0wzjqkH/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt+7XC5rObGpfe5rXrX4Ttcq2mKEF9srKl+2Km904NbJSay2t3
	Vcd5eoYA0cFsyiimU8xuDg6yD7lPzt0HKahfjYvCephwNWFHnOSTygmy
X-Gm-Gg: AYBFou1mXuhBamRraNiLpD73fBaApZY4d2evOyybMGdLKZXsNaiGRepJScUYC+XBqTK
	NZbbamVOqoUQM1ulOxvZr9Zr8a3GXSmd6v4RCXpGzE7WmH9ijwTGLdrFA1ps016V1tuCRn0kK0B
	T5d/NJsb4RTDvsDD2myJ5LlsEKsWAvZ4GsOn5bYPemXSwLX+Wl6/goZjQSHkQ4B4eciEaMwV29a
	S/nkOYg7jvvsIv6Xa5/rvySgYF0ZE5gevoK6eu8zY7qP63i4/Gip1GE7xVj6PiRvPJQGR4QTAvG
	/0oTd1k0LN7sgyzXXL21VIJFJrz0ZiCFWgc3/KyyLB/JjHJ1W173m98zNBNDCQuPpKTtu9u7P6/
	6exDsbxuVJ/OM2qd/BR63jJw0FekLVy/utSZxG9gf7NF0OGBineNFXIAR9NbizH6izGDCC/ppcc
	eu2Q98wH1wVtjbXbgL9pdwKgfRwp0ybU/5b9GfkffN5/tlhlQFZJqzADG2OclJLvQ2u3fkvm4uD
	wfBPmNQbT/Uma6Fv7BBXtN5jEtt5xlNldIOrizQlBGMVQng6g==
X-Received: by 2002:a17:90b:52c4:b0:3ac:9ed8:f319 with SMTP id 98e67ed59e1d1-3ac9ed8f5ffmr4225776a91.2.1792141974372;
        Fri, 16 Oct 2026 02:12:54 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:12:53 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v5 0/5] net: ethernet: mtk_wed: misc fixes
Date: Fri, 16 Oct 2026 17:12:32 +0800
Message-Id: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDq0WoC/yWMyw5AMBQFf0XOWpOSqMeviAV6y7Uoab0S8e+K5
 Uwmc8GTY/KooguOdvY82wBZHKEfWzuQYB0YqUxVIhMlDtKGT1HIvDRZoTsjFUK8OAr6G9WwtKL
 5pd+6ifr1XeC+H49dyXVvAAAA
X-Change-ID: 20261016-wedfix-8079f58dbf06
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=1968;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=cAYyzvBvABdQ3mPgVmEus3vWnqb83GFBiX1p5PjH1a8=;
 b=VVf24T35ucw91qTXLscFnfuQBIvCNVXax72WvCgQBWP7iRYfg2a2Md92x1wnbvy6rlwhXt0Zk
 geGFIrchTdnCstRJxHrqpZ+TlRCUsxcoNV+xlqHXS8CgRTcmeul1YBc
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=

Ths patch series includes some fixes for issues that were discovered
by Sashiko and one original patch fixing issue I encountered.

Patch 1,2,3,5 fix issues that were found by Sashiko
Patch 1 fixes tx wdma ring reset for WED v3
Patch 2 fixes the reset condition for rx wdma.
Patch 3 fixes rx ring and tx wdma ring not being freed up
Patch 4 fixes WED on non-DBDC mt7986.
Patch 5 adds error messages and bail out when wed_start fail

---
Changes in v5:
- Add cover letter.
- Add patch 3 to address Sashiko review on rx ring and tx wdma ring not
  being freed up.
- Add patch 5 to address Sashiko review on error handling.
- Link to review: https://lore.kernel.org/all/179000700034.2160803.10594281691384015089@kernel.org/

Changes in v4:
- Add patch 2 to address Sashiko review on rx wdma reset condition.
- Link to review: https://lore.kernel.org/all/20260730090030.201100-1-pabeni@redhat.com/

Changes in v3:
- Add patch 1 to address Sashiko review on WED v3 tx wdma ring reset.
- Link to review: https://lore.kernel.org/netdev/20260706101044.161059-1-pabeni@redhat.com/

Changes in v2:
- Address issues raisied by Sashiko in patch 4
- Link to review: https://lore.kernel.org/all/20260706101044.161059-1-pabeni@redhat.com/
- Add comment to explain the special case

---
Zhi-Jun You (5):
      net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
      net: ethernet: mtk_wed: fix reset condition for rx wdma
      net: ethernet: mtk_wed: free up rings during detach
      net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
      net: ethernet: mtk_wed: bail out when failed to set up rings in wed_start

 drivers/net/ethernet/mediatek/mtk_wed.c | 40 ++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)
---
base-commit: 191aa41548b2d2b6af534a6d5cf84a552435c74c
change-id: 20261016-wedfix-8079f58dbf06

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>

