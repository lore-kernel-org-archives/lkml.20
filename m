Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE61331207
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780452; cv=none; b=f9pS/8U6eSzS6VFpU4WAJaGzI4toFOEq7r5yExnmon3XCs4acE+3mtNV+uNZ1QzJO0PWw2N13EK1uZuSCdcclWODZ7ln7/Cm3QtsEEJzNRJSpipm+/+tgLp/k3NiaumaOK3Ds132b4AfUBdCMuqlGCDps/5iesftBwt7vI8Tc3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780452; c=relaxed/simple;
	bh=rHZ3blwmnCwtQE8g8vuh+GnhZEPjJ38mSCnJsVHGq0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PGVPK7NeSQIsQhU/Hozq7dUvMGCgKmH8vkuo1df16A2ZB+4yIihkUA2IckTBCY/A2/ZAVNCo788EchmYylSJYEq0AA/8V4Ud6q/WkQ7Cu+gB3RQWjXCXIedczRrNhEMp4IFlBGRb9WTrUVDqTyN0ErqCFqjCgNGOtotm+i2z5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgLb3cIr; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgLb3cIr"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9196d8543cbso18698756d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791780450; x=1792385250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pwHcr7X/ONR4Ul02KZqQ9Bn6G0VNj5fx1pck5G2EhHI=;
        b=OgLb3cIrul9TRAghF8w2FppoB88m4wDGTQT8OBsjzxa9JUW4WgQVCFZUTC872/M6+M
         wrbWHkTym3mjfLyjP2UKsa/XCRggTVehekziJnuDxa7gjGK1Q6BkSP89LMlrD1bvGyVc
         PmLSMhRlnmDsnct5+YTiJqrhR+pREze/VtRRamLBOtT3s/ed6O1sC0xQMtHgHMKmonts
         Pqtw1cx/kf/5E39QV2DsFevlrRqooBPXJXmNwimnQZ7HLQPBvTDeBUhnkfMT+q5Aqc7V
         YP0g8cA7tBvo8e5zMV2VFGiKdSSDNxmH91+1EyKSo4/zh+051qMad9SBN10aRUuRtBMe
         NiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780450; x=1792385250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwHcr7X/ONR4Ul02KZqQ9Bn6G0VNj5fx1pck5G2EhHI=;
        b=D25akbXi0m3l40APiY4OB3gkcGNjTCNaZSQwyUe/ck93JdsTO3XH1zMAqBPbZ+mEW1
         298eKnjS1SEfwJ5heZOpIMCQBImaMVIsRazca8hs0pgX2vwdT8fx664lZCvyHVwhGf4r
         6yWZKL8L3x6sN9lUu2802XkwCJvQUXVSFsZ6UgDc/48LJ3UoSj4WBAo0wxYQxf2UsI0Q
         H1W+lIMl0SN3uUmNnGqpODJFPKdrb+oWBeQ50LoIoTG4UgTDnRh0zQ6MagVkQ0J3Vu35
         9OsvAbyiYm2rpxtjp5vLu7incxtibkQ4nI4oM21mhgzBpdRon1SVAIitRb209MRIjO+e
         pmWg==
X-Forwarded-Encrypted: i=1; AKwUvBxrjYfP6a9OINy/jzXrBL+fs7ouNZQ8ffjGnQM4VPxfgDOcbs74+5+HOWIOmFIQvEyRpR3nr8GQZAqwjyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo2qbsb/+HJDIQaQNIPcWpBt37Y+vdz5c25afBBLKH2BNa07Ra
	Te6/EAY8VNXRYIcNH+TYB7PXmi8BxuH3Ly/xD8OxyDrdNJY5w/dkGg8=
X-Gm-Gg: AYBFou3c37ewavoAwA6fLKb7taUNhILRXqgDScjtGrwKCudQH/Tl/cDOXsyimTgSuOw
	bIE8p+d0P2ShvH0x/+h1zNd1A0Xei82/60LnsreB9MNzDxsXf8NT2zGzPS4f09KGE/+zl4wyAcE
	fV4a1iBfvPnKUKNdC1n3Nb4neXMawbPuSNffDXYTMpWdwu2iHtngC2nwQZ3MSQWJPoNmHZXJe+P
	M84u/t32WDphzwlp6e1+RLOpHBmqGuoIwbCLHhW8hSNZuFETdcaoTeW2sZELNFcuFZt74SkqXQm
	6cy1Arc7s2TiJQhYnU9h/DJ8/jj+7JKk06shKKhws9rQDC6KVCXp+uqwxacC45fW3zFC+qUtw4c
	EpvKgDhjTb6j4IWLHfK7zSNmscxcd19yXUpHLKZjhV0CtD558Kq+VEQ6n2OEqZzY+/l7s3d6gOp
	fOoETYjSQwO7fv0yYfTjbJHBfMvgofLZiy8RBfd3FdjjrCN8Q0h5wZPi5ywcMsBYTWYTFCJyBw+
	tCjne6/9iz64nHM6WPvpivqycsZa7oep1SfI3uCuIMsNyDMTKbmia4h7bLqdjnoiRiABVExaxhL
	M+yakLGkw5pWO0RhDu0sq9yBKhWogQ==
X-Received: by 2002:a05:6214:85d2:20b0:91b:5e33:9858 with SMTP id 6a1803df08f44-91b5e3399d7mr99215696d6.54.1791780450035;
        Sun, 11 Oct 2026 21:47:30 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b812ba8c7sm17513956d6.38.2026.10.11.21.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:47:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: atomisp: drain assert recovery before tearing down resources
Date: Mon, 12 Oct 2026 00:47:24 -0400
Message-ID: <20261012044724.160902-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The threaded IRQ queues assert_recovery_work, which can stop, reset and
restart CSS. Removal currently tears down CSS and the CPU latency QoS
request while recovery can still be running.

Disable and drain recovery before atomisp_pm_uninit(), keeping the IRQ
available until recovery finishes. Then release the IRQ before CSS and
firmware teardown. Apply the same ordering on probe failure, and skip
the uninitialized recovery work in PM-only mode.

This issue was found by static analysis.

Fixes: 93d3fb35aa10 ("media: atomisp: Remove watchdog timer")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..768b35468380 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1443,9 +1443,13 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	return 0;
 
 error_unload_firmware:
+	disable_work_sync(&isp->assert_recovery_work);
 	atomisp_pm_uninit(isp);
+	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	ia_css_unload_firmware();
+	goto error_unregister_entities;
 error_free_irq:
+	disable_work_sync(&isp->assert_recovery_work);
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 error_unregister_entities:
 	hmm_cleanup();
@@ -1464,15 +1468,19 @@ static void atomisp_pci_remove(struct pci_dev *pdev)
 {
 	struct atomisp_device *isp = pci_get_drvdata(pdev);
 
+	if (!isp->pm_only)
+		disable_work_sync(&isp->assert_recovery_work);
+
 	atomisp_pm_uninit(isp);
 
 	if (isp->pm_only)
 		return;
 
+	devm_free_irq(&pdev->dev, pdev->irq, isp);
+
 	/* Undo ia_css_init() from atomisp_power_on() */
 	atomisp_css_uninit(isp);
 	ia_css_unload_firmware();
-	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	hmm_cleanup();
 
 	atomisp_unregister_entities(isp);
