Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD057471CE8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712296; cv=none; b=YMPMct6oPAOjky8qlJAilxuduqlCphBAhjFUQ8rroD3H5d/I/ngFiMoOL+n9lfcQ8SD8dwFI8vg9k7faCDVwQotgvE6GJJTLEsw6AmHywiuoyNuOdcDnxFzdVrS1qClrwcCsMA3oMe6kHuo7PhlSQi7BXjzOsOqQTz9HOF1nadY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712296; c=relaxed/simple;
	bh=yfmN4VgJWiM2K0qD+/ELhW7GlVZmQtDwQsE1uxCYWOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CFW1BoHyqlOadWMtfjv+8euurS4JdNQ8/th/2BnVYDX8v5lL54U0aEAk3t/kwHwNCwkKyCtyN+ybOQry4kllyw3rGrFeU1R056Ze0UBvXMyiH5x7nspUDhTkfqpnCdcOGsPOjC3wcDscD1yrDoFCrnxOe02ZlkyH7W1yVuRApy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STRGQ+B9; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STRGQ+B9"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so369151a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789712294; x=1790317094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9Fiem68UhKZxOAnlG3cQI4tsKfNk/QxfQ4iK/+ITaM=;
        b=STRGQ+B9nQu77R/g5add3+Eh/f4ekXW+gi+Sep32DFDEOASu/YtP4FOFGVuOmfDPzM
         UrSQWGI2ps6GaIpcTlHTEEJFizibbSo/Qxjchl6lysI27QXTLm5M4Kj7aUB4wNyHeDpZ
         NdNyb5Wet3XKCUzWTV/c0exVSyFO4LvU/ngRsjHwgQzsE9bXPBxItdfIr/dytiy+XPJ9
         NU4OkBMFjOTH1XlNuXeJ6AChPL5Nm1gxFlw6GYwmszc5Dt3X+NfDXkmTzS1yvTKIeuo0
         fce3BJskEaEpaE2+geSc5zb1/cJCAFYRvbb2Ssn9h5Mats21TQ8LAJoY8bJQ94QFUORA
         TKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712294; x=1790317094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9Fiem68UhKZxOAnlG3cQI4tsKfNk/QxfQ4iK/+ITaM=;
        b=kSzyE3wm8ks/clDyojmAtd4OFuPVQHNLRY2YeTz1NEo+tZYoQlpGAoHJu0fZf0ANXL
         VOnc/c+dqOe0BHr1MyI2OdqIl4ThVGvko8t4hcBPvIwDNIa32fdx7hu3+siMnfj3Pcm0
         l8dPrpM14cqS6G0JqmMwiryTErPZR9e43y0x3XB9mi1xLnoQBPV/zrPJKJvaRKk0F8fk
         vCvQd/0bqOWJN7E+gYn8QriShisHP9yMifUnRzPbDAv3VTi9sDimWt6RKT3JDlBBzgnC
         d/wLGeo27lfdEh0omx8mDK49AjnQgZaeoW7LITRsgXT6zCfWeR1HEdbF34ARg5Zbjd9e
         lwUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJC4ZNlKFMreHuEX7BiUxNXofPR/ryzA5YRREh1HHEh3rX2w/p9OinOhIKhOibVKZTNOXIOjkncRYSsxA=@vger.kernel.org
X-Gm-Message-State: AFuF++mH3w9U6Hw7kSlrcZY0CHsiHTI+zDGOQu2I0JG+M7z8R3wzSuxX
	++Jst9y5zYa2+7P0lDHhtPKIPhNLKWSfIzV8f5nGGMdZQ0hN6gEMRImz
X-Gm-Gg: AYBFou1Wn/VlPxr6ZBu2FxqrXJ77M/3fKFVjoavAinAO1SancmEQPTWzSbMm+IVYA55
	IRIDb3O78ASEPMXB+AYwtSjESGHRnEX2w2dIKLLqbHeNSHNYiRW0ugsSDGA/qzzIt7zG/GrdFfG
	AH8bVcHeYPHMsYfMZWEcRmC08kJpCnfS8jNS7yDUF7W+eBo1x+u8lQTDA3ZT0uffC3gScpEwQqv
	0Xy5kbuT7NvqaFdkmvZGumE/eLxvgxC0MPZF22uWiVTITQTazXcisR9vg6bBpmDmXl0Yh5thz1F
	ZYyUdkDqz6gOscwwaEgmUcJPwdpEenbuziDGODrc8opTd1eIL02CFVuhATQdbYG3QQdG3zpN1TE
	aGH6epy1XCfZ2Yi/QnSOdACP/QUeyOqg5swBb+cS5WkNP8pGnYkfqvniEccUyFvmJqg6LrM+s/g
	LFIz2qB7WX6ce++AmfoG8sZojvRHop3uN3T7HP9LNH7819trMX80npBL3EE63DK+dq
X-Received: by 2002:a17:90b:3909:b0:39e:359f:8539 with SMTP id 98e67ed59e1d1-39e54f35cf7mr5196439a91.15.1789712293559;
        Thu, 17 Sep 2026 23:18:13 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a5993bbsm1441555a91.17.2026.09.17.23.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:18:13 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	James Bottomley <James.Bottomley@SteelEye.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: initio: free SCB array on remove
Date: Fri, 18 Sep 2026 14:18:03 +0800
Message-ID: <20260918061803.3561680-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

initio_probe_one() allocates an SCB array and stores it in host->scb.
The probe failure paths free this array, but the normal remove path
does not perform the corresponding cleanup.

As a result, the SCB array remains allocated after the driver is
removed and becomes unreachable once the SCSI host is released.

Free the SCB array in initio_remove_one(), matching the probe error
path.

This issue was found by manual code inspection.

Fixes: 72d39fea9017 ("[SCSI] initio: Convert into a real Linux driver and update to modern style")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/scsi/initio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/initio.c b/drivers/scsi/initio.c
index 06fbe85dccfa..b373828bddf1 100644
--- a/drivers/scsi/initio.c
+++ b/drivers/scsi/initio.c
@@ -2934,6 +2934,7 @@ static void initio_remove_one(struct pci_dev *pdev)
 	struct initio_host *s = (struct initio_host *)host->hostdata;
 	scsi_remove_host(host);
 	free_irq(pdev->irq, host);
+	kfree(s->scb);
 	release_region(s->addr, 256);
 	scsi_host_put(host);
 	pci_disable_device(pdev);
-- 
2.43.0

