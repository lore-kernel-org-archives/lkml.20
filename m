Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF0E3D9DD1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031266; cv=none; b=iQ5WOJ47i2lMm/dHA7w0l935GR1m/7rfMhTxjlLB96vtRGyHZi09cBAib7nnbFnsOT0BwLOo31fSuUw0mKF4+IpwqngezwPhv+2wIbKYwXvVvoHQUx89KYbpusPJxANB+kZKFPIdPGetNxPbYES7erTQJ74GQ1Kv7oTpwMscDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031266; c=relaxed/simple;
	bh=WWTcqcrYuK6IbdrjMRhsuwFkgDt4+Cy7tBLo38z8uik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+NLnD34n4LkjmTig6kdykPweysF40ZDtgDcSCvx9yKbJjmAorFVpdux+3M/Jg+6HSzPxWG4KK7MPxQTA4BoVZOEXXL79PQ25x03ECQUWppT8BRhYSqqct9T2Gm3R4K9BVTf/UXGmgHGbRTBRvXpYaQu67Jj5eptLRfEuXo4ZLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=qCQbx91W; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="qCQbx91W"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so1881420a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792031264; x=1792636064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=qCQbx91Wao8/zehzBBOPBoU+aNUmMxQ7s+JLYzrY0hZeX5zSLr8fqnyKKTcdfWn6vi
         K0QNzMjxGOFEE4fp+n/Oai5PMncwe+rNrvClswOoKPNb0+Jb2+xMNDU9WAVh/W99jEiD
         eYTNU+dGnhaqRgn5GE4dHqJDqClZM60axE3etGP1aEVWh20iJ3R3WOq+8qrM+JJWvujE
         oDuPKbuUYKi0eq2rUmWR06jm7ryGG9fjJBQS1uZ5z/seUdeG+acHf+S/XXBiLZhA8zfd
         gLDiUphDjxT+gEeGdfkYocUrbMNgc/VfRcN3bjQEZoyysHly5xfYQH04QvYly7HLrcJz
         qtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031264; x=1792636064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=GuDj9YNjUm7qR8n6JMQwrsXqPeC7c7u0Hc0SBOjiNUWOVDchNwLx5NCma4cJFwn8PL
         yrTim6fYXvxjFYE8h9sCsZaak03xALf8dsG79KzWEgq2OeNZaU/QJD6pc2H2YknLXBxQ
         98KlfNy5bJryDa8poAQomTK+uytshVWgD1GKWcXp8Rb3m+9JYyCxNFwQIe8nB/xukG74
         TQtLgsJUUlbP59i837vhTkHRHoVkeVDIiikx+CWlWW5/tVsq/Ty4V7Sd1MgS0DNByDgk
         U9Ux+dRmadumy1JtwU6t1PJBs+fpwO4/8e62m188n1Edrl3HdVxGFLvXj+vWBZpfAApT
         lS0w==
X-Forwarded-Encrypted: i=1; AKwUvBw4OqkJj3AY7jbkdicuIiV3tKAvV557LzaWXeRLQ0tT5Iol0RvwpPSRiJVvdEX6LU//1AXIgPOpHpxqGTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA4+o3mDoh8igmoAvJmVKiCMvi5nX7PFVzFkP/ONAYqULRCGJp
	/imj3hENtms1fpsU22hoW5ihX5+J0cNVHcVUGfz3qeOQEdfrbAbNHrWHvIo1Sy2vtwMBkCtxRIa
	Yaspx
X-Gm-Gg: AYBFou2CmW//Fe1Hdvn1fxOSjvBvQvQr9MVxgkB5DKtCjvei91PHQbD6r8pialqdHjr
	oi/59m7lOgj+eSekhNGB0/ssshTBwuGSmfq+6M+9RPZHKEsh7A9S6rm/l2w2UPIOZD0/fkVANmF
	2/9R9vNmDqRT1mvp95ZsmsPK0Ue/5TXBVSWcMyM6x4FrnOCnir+UHxSMFYyqrQ2CUKpX8M6TgKL
	p8PCOg03YVrDhI2P0L4R4SOgxvq/l+p2PPuTT070c1KyehXdUCuwRfjFl9WChiHLZa1/gAApvN9
	vGceQJ2kNhbfnZ9sDF2O3Zx5KYwZ3cJt769TxYnSs/v4+LAA2iloj0n/PRX1zfHLkluMFsi3/kF
	VT1XRPo/IbWW3M8JHsGIl05+x4dVRvYIqTnwnw2Gxf+jGlUiZKT5aQhW6NVGIFMBnkVMsaqFjlZ
	f8oxMol7p2YjxXI17LAtjrYZ+WLZcD7XMuYcCKXp4EITXZFfCoPPPytyq2i7ntXRrczmJcksOGC
	k66ig==
X-Received: by 2002:a17:90b:1d4f:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab3ac91bb4mr13995093a91.35.1792031263864;
        Wed, 14 Oct 2026 19:27:43 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94375f3fsm1997383a91.4.2026.10.14.19.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:27:42 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v8 1/8] scsi: mvumi: bound the per-event parameter and sense dumps
Date: Thu, 15 Oct 2026 11:27:21 +0900
Message-ID: <20261015022728.3936714-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
References: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_show_event() prints param_count u32 words from params[] and
sense_data_length bytes from sense_data[], but both counts come from the
firmware event (struct mvumi_driver_event) and are never checked against
the arrays, which hold four words and 30 bytes.  A firmware that reports
the maximum (255 each) makes the loops read far past the event and past
the 512-byte buffer the event block is allocated in, printing the result
to the kernel log.

Stop each loop at the size of its array.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index e70d336b4ab39..38a92f8c25f5b 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1361,7 +1361,8 @@ static void mvumi_show_event(struct mvumi_hba *mhba,
 	if (ptr->param_count) {
 		printk(KERN_WARNING "Event param(len 0x%x): ",
 						ptr->param_count);
-		for (i = 0; i < ptr->param_count; i++)
+		for (i = 0; i < ptr->param_count &&
+		     i < ARRAY_SIZE(ptr->params); i++)
 			printk(KERN_WARNING "0x%x ", ptr->params[i]);
 
 		printk(KERN_WARNING "\n");
@@ -1370,7 +1371,8 @@ static void mvumi_show_event(struct mvumi_hba *mhba,
 	if (ptr->sense_data_length) {
 		printk(KERN_WARNING "Event sense data(len 0x%x): ",
 						ptr->sense_data_length);
-		for (i = 0; i < ptr->sense_data_length; i++)
+		for (i = 0; i < ptr->sense_data_length &&
+		     i < sizeof(ptr->sense_data); i++)
 			printk(KERN_WARNING "0x%x ", ptr->sense_data[i]);
 		printk(KERN_WARNING "\n");
 	}
-- 
2.43.0

