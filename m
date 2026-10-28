Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207348;
	b=o8KDB9q2OV8hkzcFTryGIoJb6+N2RixnBksiLYnjZWdTuoFjlgZ20zXX05SMHyEJD0Bv
	 caLveWR0Rz2f+DeupxGWynDs3Vgv7njkiAKB4RI4Zm2SUpVbwxJSZs5HlDi6d2LcNI26S
	 U2lBsEe6nTqcM1hcCYr75bkWaGNFX9YUsyVUrD2h4R0PNQJ/uOBQcEHBSwGgQOOVKE0Wv
	 FIAAVlKRNYts1oWlFBy9tJZ46VFTV5gC/BGr3KuFOvESeEdFy5ed5rv1o0PD1ue9oMHGH
	 V8Y4EyrIX97udbxhG6yybx4axA+FW0AgV92H1PEdlA3r6aS2vQu+FYrjf+HJmJErBOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O0UDAqKLczseG5vwWb+qcEkII4ga7mybPYBMC/i9NRo=;
	b=NLByxZCZird8CqTLP1mFDJf4oLiEbXuXMnvSOmm8ECfH9TqOqk3p55qsDZWwMB8GkCVI
	 /yGPFeuqtpFfm5kCQionYK9F11g++1dTPLzyLLNpXTrQSB1CQlwtf21WsoRvlo2dEKBUZ
	 Xqfolw8kE/W4lTuXLJJSNeRT21G+53sZnl64cuANRSA1Jh3Op1Q5VL4t77H8oJAqZZkdg
	 c7Hf0deFT1Mq9dO8bzOA7yYrVzria1Ss9VQta+pvfONwYRSYLvHWxNP8rcG9H0CFXiiXu
	 /ZkpbnngwLTAF2jWuVcIiMcmgY2Wxl/I3b771f07IG/2sTPYxrDTFSgFV69dmHO4zTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9kDxjlf;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F36E606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F36E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9kDxjlf
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b042c0759so662580f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207346; x=1793812146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0UDAqKLczseG5vwWb+qcEkII4ga7mybPYBMC/i9NRo=;
        b=R9kDxjlfeabjIAx9+fZ+Ftk4ce9PFZEliXk2DS7GHjIEYyta3iN1PbHpEdpzeCTqrs
         RHo5TOba4alpQcNlbsyIng/dYlKgt0O8qk1eGitHEjgpYsVgJCBhyEijtDLucI7jS3gY
         Pk72CP7dxVPxcs+7IZ7yqxB+S9bn8b6u97hLKMClRB85F3wceZXNJswZ3vEkgM3DThl2
         g5fl8DNp4bqopHUhumldknslkfSWAMthLRZlQ+JeKXB3CBgcatUwm3dqbSNXCqQv7MrO
         XZVTAJvKHSW9hW+dr5TXxTBF4Owd8wNvBebOfD+o9v1IMHJRX0pTGu++U4MfWi3tmqGX
         Yi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207346; x=1793812146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0UDAqKLczseG5vwWb+qcEkII4ga7mybPYBMC/i9NRo=;
        b=VEmv2WhD4DJCVUcVmKCVlEO+/6E4zw9JKDUaOXK2Yz/YefEM0LP/pv5YI+QMSjS40v
         J4+n5ofCnn7ky0UiJNWjuPnbUXtGByaw3SqsGGZlJHOqTT6O3Gia1amXGN4leblt4LJx
         LPC43QzIGKu15IBQ7fJoQQ83PZmjmPEzXYxAGvPhXsDjWk+9S2mpWjBZfwPFRe31aFI+
         h44G2aJvyOmZ1hXwAdHVD1suNhntu4WS3oGU141pNVZWKub0y/mRnbnU+WBfnHLeztn3
         GqK57BF456RUX6bHMl36mPzOlftckkwBjKvg/6G7Uda8XQ9Jy4Vci4FdvWMPUbbnAZWu
         4vEg==
X-Forwarded-Encrypted: i=1; AKwUvByFZgFj+QFzpuHO377H8R0uB51IFNqlOESfOxPZsdNqjdvItdQ4awO4EPLLjgvyb7JfwO7p8h/pCAmOXcA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKELXeS54Zu6QnZg8Gh3RDISvOrPN5znExIw/HOjYmvE2k4hgH
	AIBSLSsKUI0bWOo1WfwUHKTTXw242xoga06AXn78npklmj/TQH7rWcObuVr8
X-Gm-Gg: AYBFou3ql3tpw0qqG8VKoQ4S4/G2hzqzAsc2/FmWipvX6GOHW81tPchn2AcrsFh9THI
	Vw5S1lkXIj0o6HxwYrI/373kWK/D9w5G86njIgOzqYJQ10Nib3vLsIFwZVeXHKau6aCUs+1rkBl
	kS2Q71jyPLtzeFQLufEYCLk6i8zuD5+xN9dxtGtbmMvS6bQ55fNt4BZRnwgad/YHOhfN+dRGdUK
	AjIc35qxBKiRwAgUJPuyS/02JMTwZ1sA6Woc7CtYZ2gBO86F9QUPS4IvJBEOKbpUcZt9WQU7BPC
	nkbBpPFG98z4s9CT/0lutQZjdBLTban5/Krii44GEM4vMj1nDKERpjjpBA7CbeAUN9B5ztFTBbX
	blsVqpmkthGbjC/+YyEVY1CUNbllychAgFnnkYcb866DduS/2PHXTbQGWWzzrhG4KaRH1bFHqJA
	q7TrOVxk9iKd2ZPMiYwyCKyJnk75gtVaBLUAgsFWBUg/goDB0ucYGqkL6HwTf+QDCHVO8jeeiA6
	bVebWPghYAsKsWwOqYfkG1jXt/dLw2drFej4iMHM+anZRn/P0oOOqDXVTSWiyomuYrshVDCcg==
X-Received: by 2002:a05:6000:288b:b0:48d:fbf4:895e with SMTP id ffacd0b85a97d-48e5d2e6cd2mr6765330f8f.11.1793207345780;
        Wed, 28 Oct 2026 10:09:05 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm29732715f8f.33.2026.10.28.10.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:09:05 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Steven Toth <stoth@kernellabs.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH] media: saa7164: cancel workcmd after disabling IRQ in saa7164_finidev
Date: Wed, 28 Oct 2026 17:09:04 +0000
Message-ID: <20261028170904.1183502-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

saa7164_finidev() does not cancel the workcmd work item that the IRQ
handler schedules via schedule_work() for command responses.  If the
work is still pending when the device structure is freed, the work
callback runs on stale memory.

Add cancel_work_sync() for workcmd after free_irq() so the interrupt
source is fully stopped before draining the remaining work.

Fixes: 443c1228d505 ("V4L/DVB (12923): SAA7164: Add support for the NXP SAA7164 silicon")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index ac5eb6b923e21..8c6dd8dfd9a1e 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1518,6 +1518,8 @@ static void saa7164_finidev(struct pci_dev *pci_dev)
 	/* unregister stuff */
 	free_irq(pci_dev->irq, dev);
 
+	cancel_work_sync(&dev->workcmd);
+
 	if (dev->msi) {
 		pci_disable_msi(pci_dev);
 		dev->msi = false;
-- 
2.47.3

