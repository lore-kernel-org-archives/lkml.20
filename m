Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745330;
	b=Uoufnf19miTJ4uCktuRJtVkARzJZvLXpfkV8+o0YHmvhyqytidYIbQcuTTLJcyJUa2Dc
	 XRyNUN1v9y7X53K6Rcu6H8uvW0RbbT3ngMGbIC+lILlO/EwYwzMxN8qxIa7f27AIRvMEt
	 2XjnCa2kLrPgEW7bKxkiXLKBftWiN0C9WKMlZ8fYHnV+w2YLMkJDuRwOH03wu25/76h8A
	 orAVs4B3nlNeM2b2lYhYwCoaMLV036Rs2mvCuGwNT1f6mR0dTtR31om6P4O6Q0BfVwSRI
	 YYPRAREA79eK7/zhstYmXA9CafAp6x3333Q6tUnToJp3P2vbonm+NrX2txiDTKE4aqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R2y/sy9kcOzgZ09YoYPacmoSf451Z2c95GvvGBXLGJM=;
	b=WWrCK7iz9xcVR44QOzV7raoEDkd2DF4Eb/sNteFde21czrb5XzPaUMoxbnPNk6gLBS7J
	 CJfoL9PemImTkJhp0PXqc7JnFbo5PpDv4qdJVoHJksRoY3XUpwsNFK5+kYkHK8OUD62kc
	 ND48YIhU9rK6135h2fwYdCFpipist7M5CjkP5I/th8j2gTTg1bLOe5fRNDKYTy3OwUYVq
	 dEs7G4i4mafj7sLobeBAZrMp9D3VLxkSiyNPqTf56mEczvg0Bm5DkTGoS83hE0tNP+SRN
	 9iWBQx+Q72/yWIe75byQjI00d0iPl1FTkcrfpa/AOxhVmqb9T9V1vmvtWJ7TGoLtpiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sg3SdeKp;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F3C606A331
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F3C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sg3SdeKp
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1301938b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794745329; x=1795350129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2y/sy9kcOzgZ09YoYPacmoSf451Z2c95GvvGBXLGJM=;
        b=sg3SdeKpJT6A5EFRCtF0Nu+FmM6+lPowbYZtuMOh2BydzpRwITV2sMBsCQQuhdla5t
         02Mfp4BH5W1Q3zT5leYnrKp03MkX1IsGFP3lj0gOCHFKAHH23cDVtgkaD9fd9JxDuHV+
         5CkkmygAes+ZodQD7HsJDSPxiHhoV6Ixb6kjkfGH+Dxef7Ctpnra0AAMRl7cGyq4YNlj
         orQAOsYYN5qiA2nIIys0kKosxJC+pZXzNWdESr9RLCikSp31sSYC7MJaXTu0L2GyUJIJ
         aSn6Sb0Vi/Ttil+KxhbA2YNBC8maxDrowE7eZESQ/7eU5YdnWsXG7lyPiI77HvyZv5+R
         uVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745329; x=1795350129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2y/sy9kcOzgZ09YoYPacmoSf451Z2c95GvvGBXLGJM=;
        b=H1vX+6W051aP1qF/u86oBLL0Kzs1agVQJ3UVz9y/A3B64dCSlkmN235etgj4/4Id8Q
         n1BHVosppOcUOOXN4X8z3EI/bA9ghhMV99+zu0PBPhWF+mrUFKW4mvSg9AqRpLp4Ot9f
         HOIcTW7uUE8GFfjymQp/KxqRuIOa/yFh6MaExdaU5kt8iJ18i33vTPPfchdNg7TTzV52
         fjdGthOBcCZFLla9lz1Aw2PTAKZYDgJi8c2Tsk4JyRUX8QNvi51GpTcVBZ6F9SmwoIRI
         N0t6m7+6SKy72+pa3YJpZ0sPtc0q4eJDCsuD0abKgLrV1tYWwy4ZZint6odl62thU+qx
         oXyQ==
X-Forwarded-Encrypted: i=1; AL+hErG5tV7XzVogzCS8Pfrg72R7iMsPGvTKTNc2vbaBOeebDSo4H6HUqxptkF/Dfcntwamc7B3/pGpuwgbQOHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z81be/egv5s7ayZGaO4zhB/HyYAgUVVSnmG6sLmi18hcXDMQTTA
	s9ijkqyHTR28DphlFPYRYQPQQ20DtPa5PYBGFPRgoOlqG9ZL3ttXZn4QQTExzdDAI40=
X-Gm-Gg: AYBFou0cCLhoGNGQHnjw+F2bK1UuMeEgTREzjDPKve4l/S8NKf6vPUTZ+ckIlWhCiOY
	Sxvo4mdC6qcH3typvURXnmlo+7Ao/jJjrN+a0qeE2EpWDv45832uGaXJhx3ts/YiVJL8YZ0zpvU
	Ewfy39rfqT3wr4BUrgBYgeOqef6Q1MiYzqxd+hrxE1lfvtDSUJMTe+53ifie5TJh3j22r5Zoxz3
	dzNQaC3+6HV8/1KiFHmlEmUYoZs5WNjbWbf00tQ/vrkx2WEWWYfRigrx9VinDIfBdlR6XRZfraR
	lz1PlhdPQB/J+IDkuaq1pevIhm/UP6OUZ8K7xxP9UkKJf34q/QBLxny1HIfMv0Ra1xnBXvY3enN
	oyfVXVt9F6A2Q6OsTMhevAURdyaKHxuSSeA/vweKF9RawlYxzAK3a0qnID571lcPFaAw5obqFzy
	0ix8pcxiqkDFfvcHM22XB/M/j4i999g/rUalT6eiqRBMRS5g6ZP0CmmVVkVSNU7WGmxuxjn3C9y
	fL3U5b+Rm2fKInvkZ4if/Zf04NX5EQhKgXBr2zrUQmyRr1bmStEQinTBiU4gvYtwg8iGkcNM0+q
	NSNzksLIqmbpzUBFE/4lrQudyb7SUVYkCBfX1PCDmv3RlSQMz1Za8qxyeEe5ugMFqGBxjmeSH+m
	tNzrAAOhJHKqFHFGHHu9V65g8OJ8HTwB0fPwuGw==
X-Received: by 2002:a17:90b:39ab:b0:3ae:8410:ae6a with SMTP id 98e67ed59e1d1-3b1b0a1eec0mr7647326a91.22.1794745329249;
        Sun, 15 Nov 2026 04:22:09 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:35d0:694a:1071:9bae])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdded58a9b9sm1220520a12.12.2026.11.15.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:22:08 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] scsi: mvumi: stop the controller bus-mastering before freeing its buffers
Date: Sun, 15 Nov 2026 21:21:51 +0900
Message-ID: <20261115122153.1446810-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115122153.1446810-1-yhlee@isslab.korea.ac.kr>
References: <20261115122153.1446810-1-yhlee@isslab.korea.ac.kr>
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

mvumi_detach_one() frees the controller's buffers before stopping its DMA:

	mvumi_release_fw(mhba);		/* frees them */
	scsi_host_put(host);
	pci_disable_device(pdev);	/* stops the DMA */

mvumi_release_fw() frees everything on mhba->res_list and the handshake
page.  The controller is given those addresses during the handshake and
may read or write them for as long as it is bus-mastering, and only
pci_disable_device() stops that.

Disable the device first.  Nothing in mvumi_release_fw() needs it
enabled: it contains no ioread32() or iowrite32() at all.

I have no mvumi hardware.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index 91c2db697c6913..8d22d370d8608f 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -2548,9 +2548,9 @@ static void mvumi_detach_one(struct pci_dev *pdev)
 
 	mhba->instancet->disable_intr(mhba);
 	free_irq(mhba->pdev->irq, mhba);
+	pci_disable_device(pdev);
 	mvumi_release_fw(mhba);
 	scsi_host_put(host);
-	pci_disable_device(pdev);
 	dev_dbg(&pdev->dev, "driver is removed!\n");
 }
 
-- 
2.43.0

