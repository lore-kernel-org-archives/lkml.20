Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620685;
	b=Q+/eRE/Gb8Z8TL/6C2cK4bGRUGDuWvDaUomJsSnGhVmD/0BtLFHQwtZD7U1vOARoZ9vc
	 IxaCJzI1S9sJX9RRDo/nS7hI4Rs0DCXdsIZQvDSAL/iqFeNoGl+h6lwXqhT+Zon+aElaa
	 7H1Fq/LKn9WgMGq0eiFQI9pDvfzeHdBNtwrDwk0Pd9QLLOjD5VAAP8KcrQP64PzuUk1it
	 nm0H9F2p08Au+byeSluqllSm3uIRdosZ4e9tyCWPVmu2Q2G+bvMyh8hHAa9pTDNvxjyUP
	 ws1ZWGDsc9ZsPtNfBH9bC7f53XAUiID9Pt+QJiHUpZp/ugmn+vtPOGimjNjFCAlcAXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6bf6t3Q79m4DHDjPwrZwc68kd6cEw+Bo8zLmu5APiVM=;
	b=3Erx83EB1JpZhJR24t2SL9r2iEvoeCh6G7M1o/WdG5vu/GVYm/SNPjCX0xeYrLzHPrvD
	 rzm3RAXxj4D0uqYUtpl+0IS3SUOEhiSkbz20M/fPY8Ei9edjDukzsqDvw8Lpwact58AO1
	 QhaDjds37sT0HX2sG22Jl0sVHV3PVgKPgiRPzz2IC2+xhBRbV6pB6ZwY3JWWSOZ8+ARa2
	 WStP0YIei0uFsoBIUw33FtCekJt/ExO/T0L+0G7uphLWLxR5ljnQYNY+bsE8ZeLRMFxAF
	 rspqdVQAYToCnFPG3XM2zc42DDQf6e1DSl/TDyUPRNTopktfdtfVfDyAq446117l66A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ef2GEjks;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48AC606A33E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E48AC606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ef2GEjks
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1360146a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794620684; x=1795225484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bf6t3Q79m4DHDjPwrZwc68kd6cEw+Bo8zLmu5APiVM=;
        b=ef2GEjksHjsOhvCWnT6KiI0YSJxZ1o9YELJwqkdxHnHVtGUAbEFwpPPReRp5n05527
         CoUEXdf8E4bDDRpVYeFGT/RkrtNLjr4hk6JE5bOoNtukx/EWkIbRX0AHoAQYVv3oW/9F
         Zj5lgB/28cTF5VwpY73q6Csl3u7Q3AEOmwvyuyrBtZUbEcoFb36NKfEI1HR3AY9VK6Tt
         fmOZSrck1dHpzgSxGtwfQnth8ygdUxJa7C4JVyhRuC8cQLu74V+SGFZG+QI8Wv31n333
         2fZElH9yXVvhR7edwVe1NdzZqiVn+NOJHFphlRoRXsEybFpawF5uBYfjjckL6klDMWNx
         1rUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794620684; x=1795225484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bf6t3Q79m4DHDjPwrZwc68kd6cEw+Bo8zLmu5APiVM=;
        b=n1mNpUa7CoePUVPIu6JpJTM/DvHBh3oULgcmSEjFnC9dFGnU0KcYBsdzEhTk8AETTk
         ji7j1oV3p6bI2vOiryKFE2bAlbVThHWCi2fp6dB5q/9ZR6MV4vLc1ceuh6gIBSSZ/tnD
         pqdSuAS6A9KIyGyHuO8J8u/bQrwSw5iOJMtO+7ZjtdcemigCktJ6wW8xp+npU+HEdQfQ
         wVD0rG+buYI6oH42en/kadwH2pdEUK98wvq4isbuGR2tVyH5YMf1gBznw/jheY8JSVp1
         aRMFYlDm7X13ivHbeJdTl4OEr+gbtIiqWZtL4Cik9uNWGHk53ONnEtk7CAvr0ithvpNZ
         22VA==
X-Forwarded-Encrypted: i=1; AL+hErGxYo0UIE/1cwSyBFLf8wvlmsfI0IWdXkKRBym439Phsp4L8kLcafqbYQE+JSqBMybfWJaKd47sQ0GXzlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ns+p9D9jJiJghv4W5eE60wArmoldWx0FuEJjDt6257g5l5zmP
	a6itnfQw31CiqZ5bhNy6lbxTB0xyZbU6ykUvkWDMwE6GC429U2g5ogoIOG8bhICMIxRoEbLF3kn
	jfisw
X-Gm-Gg: AYBFou0GazVUp2axqdrjny9dvdpGaSWjEmWCLzIZndx9oKiaZ9GY94VClD2qEzkNxfa
	V6NaX9dugIZQfRWL0qz92YaIRGrFUAPxMcWY6IGXRsHQsPnTCf2X8kU+wZyBOIl/bShhVS2XEYN
	Kf1nL2UrMHP8Ny/zBcIruei6HYHl4X+tP6yAvGj7AzC9wiKuE5y3gQTLHaupz5ZurlUEbv+MK2d
	36FR1AWYSEbIg6M90jbOZv+gTZOKS4DIp4xatWUjuW4RORuW43/0hvrVs/193q3zjKIIi1IKX2u
	mu7QC0YM+qtT2urImftF26y0OWzBOJY1cFOpiH6l1t8XFRHI7U8kSF8lEfLO8YQtQVvrBprB6ad
	1Wv2di7wajGmrQX1MO2wVstOtxGMPOJbz9mzveE4CbjpG94RAkmaKF4C7QtSQrrlpL28SPdsMmn
	pR/oTaOXD7ke33+BwRQFvfdvaO10rlfMFYlHJTj5fjmKSkWHbVsoS2/BhaDHcsHSZzu7I4plHhJ
	Pyv/jAhkOhXiUnXs4wW9wNwBZL7wbIbXIAXNBeVDyTfxSOJE/v6BcIJaDCQVpCJ7d29UwzaEJYo
	fH+gHvUM3ag4cmg38tlvj5Gw3oDxwYIUdcFx4qOT3HoRUMgjMsqcQCKHEecfLFP7LJEe3wMSwXj
	iqrf6cF9doSfi0B0lsvo0TEdZws0gXcwsyujeh70FMIAJ2gWpECSgTTDUJ6c=
X-Received: by 2002:a17:90b:554d:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3b1b0a4c61bmr4603149a91.49.1794620684252;
        Fri, 13 Nov 2026 17:44:44 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm3437082a91.0.2026.11.13.17.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:44:43 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] scsi: mvumi: stop the controller bus-mastering before freeing its buffers
Date: Sat, 14 Nov 2026 10:44:29 +0900
Message-ID: <20261114014430.489668-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114014430.489668-1-yhlee@isslab.korea.ac.kr>
References: <20261114014430.489668-1-yhlee@isslab.korea.ac.kr>
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
Disabling the device before scsi_host_put() is the order myrb, myrs,
hptiop, wd719x, qla1280, dc395x, fnic, snic, atp870u and am53c974
already use.  Freeing first and disabling
afterwards is the more common order in drivers/scsi, because a driver with
nothing outstanding at teardown does not need the device stopped in order
to free safely.  mvumi cannot assume that, which is what 2/2 is about.

mvumi_probe_one()'s failure paths are left alone: they reach
pci_disable_device() from labels that have no Scsi_Host to put.
mvumi_shutdown(), mvumi_suspend() and mvumi_resume() call neither
pci_disable_device() nor scsi_host_put(), so nothing else moves.

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

