Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585494A090D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903739; cv=none; b=kRoXgEZG6JM3LQDYvEOIe1Nt1XgOmkBeqSjahyxVO6FHxmVWv900X7Tq45T2rhm9Nd0xOjuqt1io+4zN0Q2YrL2mD9L/JEI1QmNdr8o1dqqqBHreZZ1sDJA0Ooy+mVK3Sxo4C1DnGL6/B4jwSUCRZUm91V4+534kDFJqHj5cu4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903739; c=relaxed/simple;
	bh=B3RlepYw+gz7j/lHhtDy+Q356KPKjQOJnndOnA4AUCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nT6t8hVuLjqFospLCqoh1c7JvVpTv7/I6zHOJUcvxQPTfwOcizdhHbxhJhrbNbYbT9WkkBRixHZJzKPBTQbnaN+euURM2Okr/tNFvlzfWjEzxutlcQ8QppTvACbOzXfe3PsMjv2dV+3dtc3YCcv0mR6dra7tiFCjeQnwSVs40ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0CvCtLh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0CvCtLh"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so615254a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903734; x=1789508534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHrD1W/xUh8N3eKgAHmZMqC6W7o0uzrtTZ6P6CfRVxQ=;
        b=s0CvCtLhGK0KihJ+6z5+msKxL6UdhziavUMMVU0NoXn6rJk9MLJYooxSNThz02K80L
         o5ft5G6TOA6/wTO7a/brDlf7ve82ciQOpB3XwRMLa30yni8H4ntN5OK8A7J5xSxT/0+C
         12rDj5ewVTqe9dfJeNkyWQCbAtxa+DlTs8rSpzRTEl28UwKyp4IZpME764ycMhmr19zp
         ATAi70Cibn1GmFXTqCkitLkmcHA2WMkfvgAQlNTZVSrAB7bIUqLoLmld3ASdKcvD27Jt
         dR8v2xvMtoheY0JUZIQgoy/iOdW6+xLQgHtA8skEkXmkh44CSI2p602rBav601lgIsEs
         rSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903734; x=1789508534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHrD1W/xUh8N3eKgAHmZMqC6W7o0uzrtTZ6P6CfRVxQ=;
        b=Bf3PSLk3/FhKOkZKFccB+PX/I4ZZsHQ69x292yuMKDGSuou9rBuMTxCbJpqBebYvjp
         v7tyR4CmT0IWo+4q2Ym7QFZ3PcLzW/NztJzYFO9ACnhlPK2XJJrICysz722BmyzXmog8
         wvNs9/pSc1qMi6ayrkPwf2PebVUA3WhIFytZDTcrIM0xqbc89RFki4XR+W821OVGmWOT
         0u0j3Ppy7KVRi5xYl8cF8aNE8QWTenYtjUmk4rl+zIQirz0H0J5sRo79S1PoQ7lUR5r9
         736gZk7iiOnQk+GE/2BUGCEYIMGo9NjjDAQmcoxTEl/m9pT0GgJW/4ymgkXup5w3nwVZ
         QDzw==
X-Forwarded-Encrypted: i=1; AKwUvBwy+bSDNSnAAk8SKntDVbGRbvijv9NcfwQY2oyj2GP9+ctEgxM3JJdVKMziUgcTgsz1nFAppcc2kKaNtnM=@vger.kernel.org
X-Gm-Message-State: AFuF++nfTE8bXnJcY4vpdkTsqJBFjBTPnhxqHY8M0q609o73vnXIZW4c
	cpVLwOSvpdjVwfIVu9IsWH4mPazz5zX/3lyw7FPaw5UN893iGn6pPM7A
X-Gm-Gg: AYBFou0Js4m/ck31yqA/10+q6rHweYEEgTt0m1jYJojooOoaDQ4J/vYcGvYmyvuR/ue
	PG8uBiauDYTfvBmYFTwKbHJrkvNp7WykrKEU2io1T8O8M9z9voIbzXKFS+lxIBLEnAgDpbHGk1I
	SF6HvWovwCELibDAepQWXRXJJ0VJq0SHvI4w4ZRvbFwGkbcM25gD3no9Y8bcLY3BQH6eKmDW2Rq
	5gohoBhdCJ/VyY1EWfFc6jdvz6iTuKgQCrbooP9RWeULaPkNl1ZJM+DoR6Z2oIOKSOmF7ENdtrj
	9ic2yNjcteRHPPmpFbXacDB6sgVPFF5wM3SyoC6qV5aocLAxJZtAMb+sRLiHlh7Az53sBoRd5OA
	sVr18ga9bdar1spLCwTu/iaT8QZcaVrVGlySVcDcJEfUMf1XnNtDj91HJ2NXY3s1pcbK+aFqFGV
	peAtZlGEG/C/gEbsPmUI/gNaIOnXM5Xra+Lkcbp6Rkyd9E/Zi28rACZ/DEi0euQhFs+Yaa71bI0
	2XY6JcZ7DAVbVw2jUtNlYURoa46ljJmJ6LO2ux+sr019phUPYA4IRoPiJELgiWSfsjoIpyaqG//
	LMnwNb0/U5mVAiA7tUUIX0ZHgFwOasHXRzjxZw==
X-Received: by 2002:a17:90b:58eb:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b8bf497edmr7045541a91.15.1788903734330;
        Tue, 08 Sep 2026 14:42:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b3312f9a8sm25576005a91.2.2026.09.08.14.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:42:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-ide@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Mans Rullgard <mans@mansr.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ata: sata_dwc_460ex: fix data race on hsdev->sactive_issued in interrupt handler
Date: Tue,  8 Sep 2026 14:42:12 -0700
Message-ID: <20260908214212.597139-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hsdev->sactive_issued is written locklessly in sata_dwc_isr() before
acquiring host->lock, while sata_dwc_qc_complete() performs a
read-modify-write on the same field under the lock.  This creates a
data race that can corrupt NCQ tag tracking state.

Move the zero assignment inside the critical section so all accesses
to sactive_issued are serialized by host->lock.

Fixes: 2d20da00c324b ("ata: sata_dwc_460ex: get rid of global data")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: resend as standalone patch
 drivers/ata/sata_dwc_460ex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 8a1d80ac906a..73bacdfd0bd3 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -465,9 +465,9 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 	int handled, port = 0;
 	uint intpr, sactive, sactive2, tag_mask;
 	struct sata_dwc_device_port *hsdevp;
-	hsdev->sactive_issued = 0;
 
 	spin_lock_irqsave(&host->lock, flags);
+	hsdev->sactive_issued = 0;
 
 	/* Read the interrupt register */
 	intpr = sata_dwc_readl(&hsdev->sata_dwc_regs->intpr);
-- 
2.55.0

