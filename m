Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.78.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879106;
	b=m+Yk5tkrizMFY1eFnN1Qvse4H6AsAsI/Jg8c0cweBy/lpu0J2SrmVKifsZF9v+5Hijx6
	 pRwRDEttE2Xyh5X/51QEukILzbN/xkGhrF0E5iKUg97qCSSWTW+MU6v/2Cwl4SdK+fSgq
	 A1Owsxeoh5KpY2VNIa6bzFMNH7uZDJMUKpTdBJMe0r4Itd1ibYca4F84+4Bp1Kaudn4RQ
	 j8AemYuAmPGXiqci+mcMONlW/KtKFeIFgXldlQSNIAVCci5yRIv+tB0tXUi62eagvy1E6
	 GNHjIl82aRCxmMHeL7go+enrYeJyDOuLjuhZ2kZQ1vl1f3ojHc9t6KoIOmwq2+eGZ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=i8H/4A+NpWNejlaYSVmvui2hqc5UYcenejqPfVH/uLA=;
	b=RSoWOOVj5TpSPKnkQzABlEYdR0OQMpzzIyyDvW/SWV4/2DxFVysn+EGIClLGigzSMcxc
	 ZGbfsJp0p8/Ma2LSMCY9r0Ptl41bJjjMXcLR4iIrndyjM/cQzq2+sELoveWNvJVDz9Phd
	 TAby42PmHK+kaZs47vN8lU1zU4xwAqUz0G4okf9QKMR2xRqREsKhiy6gafTPdK9UeOoHR
	 KByzKBQXYdRxm7BYCK16nDccvzBNaAuMDN8RJ8InC2CbkCjLuWfksS0Updh2xjhwc5xEk
	 i93/G7q25f8UERUHPHfdUFV+tvfws/h9jt0Og+vye3gmB2YX+KjqGAx4bnT6qEui9mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=seznam.cz;
	spf=pass smtp.mailfrom=seznam.cz;
	dkim=pass header.d=seznam.cz header.i=@seznam.cz header.a=rsa-sha256 header.s=szn1 header.b=ahFMKcth;
	arc=none smtp.remote-ip=77.75.78.125
Received: from mxs.seznam.cz (mxs.seznam.cz [77.75.78.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE61606EE86;
	Thu,  5 Nov 2026 11:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE61606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=seznam.cz header.i=@seznam.cz header.a=rsa-sha256 header.s=szn1 header.b=ahFMKcth
Received: from email.seznam.cz
	by smtpc-mxs-78c5bf57f5-q6hrm
	(smtpc-mxs-78c5bf57f5-q6hrm [2a02:598:128:8a00::1000:82d])
	id 58e7d2749fe5e98d5bb85c78;
	Thu, 05 Nov 2026 12:44:35 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=szn1;
	t=1793879075; bh=i8H/4A+NpWNejlaYSVmvui2hqc5UYcenejqPfVH/uLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=ahFMKcthEDtAgJPSnyPys3xR4BcW7wUXhAzs4/uetLhEdkuQ9S55WKcwZE/Awi6wu
	 v+kEftf49oKqxDymUIOC+1zvSZyKUFQp/QNB+0g2RVTXRxlFtL0+91VX/5A2IF7L2L
	 rFP1UG3EU+77Dy1NOXWCAt0yv7XRO75Hr95ysRXYYxpsIM1P+aErV5RCv4i08VneQ8
	 CYeTCEyuxTAu8kUgMJQHuHp/WF1goQp7Io3cM0gOfUuyG3S41mVct40H0bs1VTnrjq
	 sKOGm2dm1nosbS+GNHYpXscRh02UgM9F8lwPWWW+D4XDt0Y4wcMYPA54yt48CIJk8t
	 cjUswKXBBS0dQ==
Received: from fedora (wireless-86-50-140-68.open.aalto.fi [86.50.140.68])
	by smtpd-relay-64b59866d6-9bkzr (szn-email-smtpd/2.0.93) with ESMTPA
	id 77f62920-fde5-4993-acf0-3f016c0e4f99;
	Thu, 05 Nov 2026 12:43:36 +0100
From: =?UTF-8?q?Marek=20Konr=C3=A1d?= <konrad.marek@seznam.cz>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Konr=C3=A1d?= <konrad.marek@seznam.cz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu6: Fix ISYS runtime PM race during probe
Date: Thu,  5 Nov 2026 13:43:09 +0200
Message-ID: <20261105114311.49242-1-konrad.marek@seznam.cz>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ISYS and PSYS are auxiliary devices and PSYS is a child of ISYS.  In
ipu6_pci_probe(), resuming PSYS to initialise the MMU and authenticate the
firmware also resumes the ISYS parent.  However, ISYS probe has been
deferred until bus_ready_to_probe is set, so ISYS is marked RPM_ACTIVE
without its runtime_resume callback having run.

The driver then drops the PSYS reference using pm_runtime_put(), which only
schedules the idle transition asynchronously.  When PSYS finally suspends,
the runtime PM core queues an idle request for ISYS as well.  This request
can run after the deferred ISYS probe has published dev->driver but before
isys_probe() has called dev_set_drvdata(), making isys_runtime_pm_suspend()
dereference a NULL isys pointer:

  BUG: kernel NULL pointer dereference, address: 000000000000031c
  ...
  isys_runtime_pm_suspend
  bus_pm_runtime_suspend
  rpm_callback
  rpm_suspend
  pm_runtime_work

Make both runtime PM transitions synchronous and complete them before
bus_ready_to_probe is set.  pm_runtime_put_sync() waits for PSYS to be
suspended, dropping the active child count of ISYS.  pm_runtime_suspend()
then suspends ISYS while its driver is still unbound, so no suspend
callback can run during the probe.  The first real runtime resume happens
later, when the driver data is available.

Signed-off-by: Marek Konrád <konrad.marek@seznam.cz>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index cdf812c02960..905b03b7e76d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -827,7 +827,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	ipu6_mmu_hw_cleanup(isp->psys->mmu);
-	pm_runtime_put(&isp->psys->auxdev.dev);
+	pm_runtime_put_sync(&isp->psys->auxdev.dev);
+	pm_runtime_suspend(&isp->isys->auxdev.dev);
 
 	/* Configure the arbitration mechanisms for VC requests */
 	ipu6_configure_vc_mechanism(isp);
-- 
2.56.0

