Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922972;
	b=Q8YANp0sNBU0aj9LHxwto/n7nTiYFir7oi6PmMcpVbft6BWvT12tvFKfxnxbBKis77Xy
	 XTjSXdSncSVw4dty4eEBe0x08eAxSG9AfXPTcLKRSE5GBOc/+K411LXQWbh8KXBqre8Y5
	 /o9jkR8oqwA4R7iVTKaJONryiqW2rpWFHmhsoNkPVhpOcN38fcxTA+r7XIyR/h2n2K0Vo
	 DGTKR2rtMTer+w2GG7Bvg3lJD6tFI+brTLtRRT7USuhiT02YlAelBo7nqMrbRAI3NESvM
	 qnjiCsvvWxsfEkdW7X+Gdet2+WSDD+UQ7z8O/7/zLixbBq1ipS7YDXVj+13cR8pjRVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R2y/sy9kcOzgZ09YoYPacmoSf451Z2c95GvvGBXLGJM=;
	b=y/3LaazYSecAl5JUWPBrbYnUyO2XNeAPrpGpwoGsVG8s5eaJnA1Ls17D0Adx46aeMeGO
	 w+4KJryuJ/0+ChO86CAYDHgpDCzSH00/yYzwhpY8UxhzIpxZ8FSaORSiLCD8xbBymI0W/
	 gxpt80J3/qb7L5qRKZbUUtoVTLxHnGderoGyny3kqBZeLz+82E1zfRvqc7EV+u041VuTr
	 FDEGL/KhnKbO+Kx3qXuQ32p/ItadJ4vWazII4777C1aA9c/womEbekF1AdKrUZHrlrL/h
	 6XiKFmnBz/VK0ambW2EMkAjG+3MDsIMS+f3KV8OF+R7IGwkKL1qXQY/6k0bn/e0a1WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NuVQqrro;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86636606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86636606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NuVQqrro
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-886e61fa30fso2016673b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794922972; x=1795527772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2y/sy9kcOzgZ09YoYPacmoSf451Z2c95GvvGBXLGJM=;
        b=NuVQqrroMsezBs++beOdzdAskzrrPfRzJMfEGpTCLLyxjiYz4rjqdpQYhApn2BYMyD
         vNvAEHa4rs2Rqu1Xs3c//h5HYsK8wFDRbXRbPSKb1qCgjhtomlHTsvQUsKGnU6qiDh4f
         EOL64IRcH1Cs9HTIFETzO/ClZTWapWHIKH4HAvSs183dRKm80VmHNrXdjMUKOmavJshA
         86bP4l9bksPw2vaHd4eXabVVaQqJpBegP8pF2MSAfPCo+s3eLAnSwYOLsuN5kXnPv8vl
         nemcEXl2zRKIdfwhCSlQK4p+NVQ+NVhWEEaEd/UP+5aCO8Iopm1eaI7GcYp6eyvOCJ9I
         2yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922972; x=1795527772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2y/sy9kcOzgZ09YoYPacmoSf451Z2c95GvvGBXLGJM=;
        b=BRRm1Uuizuo2au1PB1OpTaTJuYj5RkKJEtvJqoBYSJqn2wnWWPLvpGMucwfMq2jvJZ
         48+C6W1iqBRd3/T4UBOQ0c1S0eJglbOAUFtHOLx2zkU+5s7VskxlSn3iul+BDqnQJNN7
         hNOsValZNmMV8oMLUoLo6T8mcW72Zz++Jxze01S+Oqsaa5klIjcWvXwAHSTt0rtlez7D
         hb/TuVWml2KnOPSMoTWmzrLn1DOSFOourmepl5z/O45Pwmz2OCPiCWVpNvslqmn0vygu
         6FrxQDYU60VzkclQmxTm+XImpRmj2uvW8OZPEkxN/2EGF6m0QeE+jc+Vk2zCNZtLPCib
         4G2A==
X-Forwarded-Encrypted: i=1; AL+hErG4RsPnsiU5yTNIZuv+SAojTubhTSHeKEntHCmGqbCccdMPXd/DePDrNgHxMVCSgsbgknqv7a8ZCcLrzfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iADcCyyyu1E//a3gte0kdol9rxjkaL2fqNh1treSThuuyip6y
	XfTp3kCh+Nd4LP1zcOqF+SfJmGFgPtjDLH9ImCmUhez/HTH0LPScNvBnG9XJW4uBP5Ha2F+32Ki
	v2q2zCyI=
X-Gm-Gg: AYBFou3TkOWq1McLmEPUB+k7oTgRbemKhttH4k3OcTxWIwffkFprDOO8AHUrACiivRR
	qftUpHaYYl0HtbRxt66wruT2x2VPwrULjBbhwd39Lh/iMFF4buXcIERLOQGiccea4RVlGrLxXcz
	swFX5eSXuFcar9S5tUvP3CgnlS+ANqCIXh3oPhoT76rEh0fwOhnIUP7udOBv3YpqHpcYLybyhoU
	8YgR7wOVYgOz43ehdIMcrVBL0i+XA2bZp14dYTS/KeEqe+m00nxTc3i0slA1ym1dX2FLaBgfb3b
	tmI7pQVBsZdwxaIAIQsoM7I27aJWPdTNBOf8uFCejacTt2iOb/hmySN0qfLaG5iZAXqLJ0ad3zt
	DglWvAPdoFTYvyBlykJU73EGuo+Mqlq/XInLKKW7IDp8OWqXoEKZeRLQ9A5o3oqQneyuYkfGnG7
	s+LasbvF5zoC3IZeKu71Rad+GBdMkbq7+09nk1Jud/X6tY5Y5E7akpy7gqXjhM5JUCexQZ09nnJ
	IEYje/y2PO6Hx2AfHd/s/dypl68T/RhawAYPcv8VgxRAa/v42FG8Bg5k/TNmDojz5S4fTRz2udu
	NZklka6xz/KXTTakJgz5LhaN0xRkA1KuXpk6P5xQIV6x9mIo2RCDd61C6AhPkzOODA9Sn10jlz8
	l4tFgltpDVsOssC8CADiM7YK8fFpBlV/90swO0A==
X-Received: by 2002:a05:6a20:6320:b0:3f9:9897:4ac with SMTP id adf61e73a8af0-3f99897220amr5666028637.60.1794922971751;
        Tue, 17 Nov 2026 05:42:51 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:73df:c7da:8e76:82c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8024sm5040714b3a.11.2026.11.17.05.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:42:50 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zilin@seu.edu.cn
Subject: [PATCH v3 1/3] scsi: mvumi: stop the controller bus-mastering before freeing its buffers
Date: Tue, 17 Nov 2026 22:42:25 +0900
Message-ID: <20261117134227.2077013-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117134227.2077013-1-yhlee@isslab.korea.ac.kr>
References: <20261117134227.2077013-1-yhlee@isslab.korea.ac.kr>
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

