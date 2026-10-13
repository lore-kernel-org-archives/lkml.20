Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A15172C2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908194; cv=none; b=I3Sk2a+CpJZOEi1c3xYXapvo8xrIbt/+FMRoqeq8f6bxsI+wuOnKGbnKO/oQTNYoqgCUKRp0hYjtFU95VRRX0uR4aL2Aiudmf1IZIXme/XOU2HlewRNoGrBEzrKRYZWb1lswm5FKToCldmGQavUrtiwVua+t2YznP95UEhqcbe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908194; c=relaxed/simple;
	bh=WWTcqcrYuK6IbdrjMRhsuwFkgDt4+Cy7tBLo38z8uik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWPDdjWaRThtazBBgKVJEJE2a6BMnRXZcax7vF3TEUyvN9WCccWci9R83FdnpWT//6wt609jyo4AcmORUVUH45hlHpHgdnzH2ZEPad0ld7kTALnY5tRgd9pxbXlJRzYWWmN9KiV/5xJQrl/UYunRee8Xz1te+XneHAd7u8l4m54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=WniLjSwq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="WniLjSwq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab41538192so2287954a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791908193; x=1792512993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=WniLjSwqHaaK90PRDorbuWVsrXkCVE7E6CePnaPF9Tegq9O/LXnfB+c/Tf/hrBhz+b
         iR47vmfdpBtjGY33i6HFk32+DHlpEdjhdj6O0lrZpOzbugAXrnIZd37rmHd9alSdNjgs
         snpSkm9rcYFkKnSfDG1EeSIQId5bmuQEfDiZda3SwVyw14NoD7gqji2pXypAVCHdmtND
         HfbzqtvnsEsFamitmV+kdsU4RsNCXFsf3+RE+jh+JTYsHhtlngIpujbjo6mPPBFcDxI9
         NMIoxH5nSTw5UDegl9auNbebfb0TSfUi+BehE+DvJntc6REzXAkDI20MWbnEA+5eC0hy
         GQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908193; x=1792512993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=CM+dpPfKQ8eqMoBH+6oRCekU6O6n8IR2ZCLA+XovG7qgLZG+CVZcfRj9W22SdVGtHG
         +vCz8bqmrIoewV86ce4A2YLZrcSMJi+SOCZGFBZ4pfpAWE/zJN8p+rygpGTgrZrNIDQf
         kqyQJUTsTcTl/FlFP1oidyZV2DwLChX28MS44g9s5L3h59KvnJjSCYEVhPFWgrqRVHIq
         CXNKTBlHuS8RNUDetOebBOhC0KZ8EzhDjXweTAcZwhKpgV4UuDofATq5PN+raQKI0NIk
         10v4Jng04qQyBdFhh53taWnIdfSgAyZoU2f56/NxtQXtZ/PYvHOzQL5wdeCvDP2RFCUq
         zJ/g==
X-Forwarded-Encrypted: i=1; AKwUvBzGlVWM8ON6W3bCGsQGJEuz1io9k+JOPa/ErA2QCOdNI7MOlLV6L3UJgnSoFdYW5VAQ+Eq3NJ/4T9jCX0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk3cwIMrE/E3UOCIdj4SBayHstiSutH1w5iLuNpthyy6hAJISi
	XMiLD09QHNPVStCZ/ipq5PTLsGqICyEI+SdhjteeAgxIUyRzLH7nd/TS8bAFX3FVvY0=
X-Gm-Gg: AYBFou0MocoFMH7reQQ6MzQVql553F+MKD+nZl7JNQZ8BdVxy1BIqme/yTyRrkLrW9q
	4qNkKAD1QTthh6Gmx/jgiax/dQ3ygGANXeFNKN/ogEGc6phagOb+iXXl9cGpxwa15qqv5aWv2IU
	69FDT9RzWdtCRr2zBvwrZo2pRBu3nLUskjAJscjH4kRHngy3PtPbeRpAkAQl26VdlJmQrUvVzry
	jC9VqBQhmXY1uiyzJ83AA7ft+FVmfL0JFIeH1oWWVctRXGx6b6ORhy52vYK7RmoJexaCJ4vf2Ur
	KAseV96HUSXx6nxcAZGWdbrNAp0yOZ2e4GWHfDcQYmO6itHLXjompYLikIhG2hMJ2Hcni+DS+Hj
	btg5hEiOJeHORQGKBGhG7mm1NOJgFTIxhK8ei1QP3Y+nJWig/iHT84niVlUEfsEzqU8yIqyXRUp
	plXGmRZTTNPnsY8PnO2Ezy8+qhiW83wCR97KcNiWnvqx2JE9p3/Pd3mLyPJqq4AXO3N6w0EaOs4
	U70w5dtT56XayzJAVQF
X-Received: by 2002:a17:90b:48c5:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3ab3a7366bfmr11829012a91.14.1791908192883;
        Tue, 13 Oct 2026 09:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600642c5sm202607a91.5.2026.10.13.09.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:16:32 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH 1/2] scsi: mvumi: bound the per-event parameter and sense dumps
Date: Wed, 14 Oct 2026 01:16:19 +0900
Message-ID: <20261013161620.3210533-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr>
References: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr>
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

