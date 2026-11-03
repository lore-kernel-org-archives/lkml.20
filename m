Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723915;
	b=avplGPLrhz4emtZCcRssaISC6XU+Bu8mIFEkwDGNCOazJlzF5ZrQmiOv9xDb7ZglU0tx
	 lJ+/hzGjtKb23eTH11HBYoa6Z0Z3rk/C4NpIamX+eX5hJr5EWJafIJ8s48eEiKrwtyXsi
	 0mYTuikKQd94LyC5lwUp3NjmYbYchY/M8CBvgNcBaW4eUVMN5PUtdSwJbmtyrMuenF8z/
	 rud4mMlp0EG0ph7mlaYy1NPGZuGSNbDsz2ttS9k5zElVWlP6MPwNOjRMJAzwYechwGpb2
	 ZosZz5834K0hMqoq9cjOZWM/3EEv3lJYC13P1av5wujnvfnOYIawzFzrv4I/Dt7DUdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w6Fqdp6/PUxQDxS0m+JBmY/nceWZDOAC7M2eIuiqIFA=;
	b=wmYi6SEs0WHcN5JZt/c1kFdD+qNiDFh7sGUiotTbXgTBTu9a5T3xjQbWwAVSZN1ecdUd
	 icjHrDpuHoQ6h4eNIaIhl1wrTohP3DejpIvtvhWGFqQQvRoLIXukrqNNFoh2SKx1ewiCv
	 13ASPz28XQmHoS4QcK+eflwtOd745SgC+CaRzQRpaYxcQKHTp+L+u5RYL4LnflMzdYuG7
	 D0bf3N0+R2XVrW/25CvKGthx1G8BmMtKOcy9/G9HwfU5ncn322ggNYvqIr7zfwIBuMlIP
	 TLxjZaJiLzT45WYEUYGbAp/t9ZhMB1fS+BaSaYnOFg3Vehi+WIHccT98mFOLgnwvkQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRCbTsFa;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CDD6082BDE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CDD6082BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRCbTsFa
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso7323392eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793723914; x=1794328714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w6Fqdp6/PUxQDxS0m+JBmY/nceWZDOAC7M2eIuiqIFA=;
        b=nRCbTsFaD7OM8zXTqBqhbT9Z9VMiXVdc+mCNlaYpWnmvIYn/8iOs029tKfUyGbsCYX
         ZbwixDVd7M7F/xVppowGYAqsQq9mMw8W41WuBapO84qmyrsOecFuEB9slI2VYgEBKnPK
         H6RLT1NR75itzIHKf56twiQCF/f8bvnPp4L80ZWwCRUzF50zQOeb+URbNHozfn7yoJrp
         OfVrXw7B+NzhrAB/c6Hn/lEKSuV5dT60YnDo1sP2Hub4L1xbMxYSrkbXsfkGoNNKLJnz
         fN9CoPMT0pp275pAMnMcGyObwJ5G3iUZLPUaDwJzb2XlNCb48vckaxma6GlUKicOBRMS
         xJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723914; x=1794328714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6Fqdp6/PUxQDxS0m+JBmY/nceWZDOAC7M2eIuiqIFA=;
        b=0l3ZIsAF1F5QeX5TWrmlS3uFAdTHf3MHhPjWr5xnpFSFghx/CGD1Bx6DVrpg9Oh3RK
         foe47bx8+ndsuHYeQ4RGrglUyVQZusEjz/DXIj+uIrScO+Or+t8Qi6hBXSRh8qwuM2Cm
         3M/C+PB670Sl4MibJvZALoSscfKqZQyjpYNAvqGqivq5gCkUmA+ITSXInSAf9zVVFdTG
         LqbEvrPH/ynJzIo69s9H24C59uEfdLkd74TLf83jZcBvKRZXzzMx1du2f83REaMru51h
         4tttKiwb9ASD7JBAr8JXs0Y0H+UvX51VBOV2KP0M7q4s1YqGuhkAEMAq4VnKEZYO3QcK
         9GKA==
X-Forwarded-Encrypted: i=1; AKwUvByF5Cp9B0T5Bg49LpZmFmTjVoFq6KbuwO58mUHG73iKgBPfnCFUEt+7WR0ws6LkJPN0NzKsH8nz0c2HAnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/urmbGdpDGagxgLgTFaF2/sG+uN8LKPjiQSqMFWCG2xBMltVZD
	g/uD1JYuYcVcRW5V8k9zRWf/F3y7+iOPuOaM9T/WU8+OQO6EKsIUyLqm
X-Gm-Gg: AYBFou3BJAS58D3oBcLVpVSp7fgzcUhmEEZ6hqzo2bTiX+7wD4YyXDjAPvLCtHXVG3J
	R+fEmo+oSOPo3fwceYl41V1OJmdQeStiUL3XpbZsm8jhHzlLvituuEBd0B6y7Hq3tYI6mjp1MqN
	H6R47zz7mdD2Nkpc0RL4PyW9SKJf+o6Kal4TpU87/DWW5mQWAFvgN4oUu2RMgd2XKbTVLV1lzmK
	f3BJFoB8nQRMnvBA9Mt8DXbCJO1QKv06HRIaslnpxTSn9csrc7dxEoLF9jy+jaHnEAOK1kxv6FW
	E2PAGjWCTWA7SjfO8Juso85vfBp6sH9ZFCIBHd7tLqmyfiwrsFYi9uiMmQNP+YTMQn+SjcRmkXL
	1a31YSyD4zPTgQJJkchQBZ6fz5XnE9X7SviLoC5p778KVnwbX/dm0peUOfnSA0H1NJmFJK6KvXQ
	UolwHz47whvTDMQnLsuV/F4bEQmgK/KSZ0ejok5ccvOCmeuInPVoVyUavZEg95JVi09M0PSkNmM
	uPNBE+7BNqUHYESAan0xTmLPMYcuUIUTuVtEZaOiDNSdj88nYLWpdV25DeW+PyabPpON9HiQyhv
	tOzXH1N4zdLMpU6ni4hgJobD9pk6oElv6+zcd9XrtAjTSGW+x3xiib/q1h20pDsIXQ==
X-Received: by 2002:a05:693c:6092:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-36a424609c2mr24955730eec.35.1793723913578;
        Tue, 03 Nov 2026 08:38:33 -0800 (PST)
Received: from arpith-debian ([2402:3a80:40d:48cf:34b0:c816:2853:c60c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429018casm43671843eec.14.2026.11.03.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:38:32 -0800 (PST)
From: Arpith Alexander <arpith99@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	sarang.sapre@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arpith Alexander <arpith99@gmail.com>
Subject: [PATCH] media: ipu6: Check firmware is started before close
Date: Tue,  3 Nov 2026 22:08:14 +0530
Message-ID: <20261103163814.96980-1-arpith99@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Commit 70e3fac3ec78 ("media: ipu6: Move firmware init/cleanup to RPM
callbacks") moved firmware start to RPM resume and firmware close to RPM
suspend. The suspend callback closes the firmware unconditionally.

ipu6_pci_probe() wakes the PSYS. The PSYS's parent is the ISYS, so the
PM core wakes the ISYS first. At that point the ISYS driver isn't bound
yet, as isys_probe() returns -EPROBE_DEFER until the PCI probe has
finished. isys_runtime_pm_resume() is therefore not called and no
firmware is started.

The PSYS is released with pm_runtime_put(), so the ISYS is only
suspended asynchronously, and the driver core's pm_runtime_barrier()
cancels a pending suspend request before probe. The ISYS can therefore
still be runtime active when its driver binds, although its runtime
resume callback has never run. The next runtime suspend, such as the one
the driver core requests after probe, makes isys_runtime_pm_suspend()
close the firmware, and ipu6_fw_com_close() dereferences the NULL
isys->fwctx. On a Dell XPS 13 9340 this oopsed during boot:

BUG: kernel NULL pointer dereference, address: 000000000000004c
Workqueue: pm pm_runtime_work
RIP: 0010:ipu6_fw_com_close+0x9/0x50 [intel_ipu6]
Call Trace:
  ipu6_fw_isys_close+0x29/0x90 [intel_ipu6_isys]
  isys_runtime_pm_suspend+0x4c/0xf0 [intel_ipu6_isys]
  bus_pm_runtime_suspend+0x12/0x40 [intel_ipu6]
  rpm_callback+0x5e/0x80
  rpm_suspend+0xe7/0x620
  pm_runtime_work+0x98/0xb0

Only close the firmware if it was started, i.e. when isys->fwctx is set.
The check for a failed close is unchanged. A runtime suspend without a
preceding resume then does what the suspend callback did before that
commit.

Fixes: 70e3fac3ec78 ("media: ipu6: Move firmware init/cleanup to RPM callbacks")
Signed-off-by: Arpith Alexander <arpith99@gmail.com>
---
Tested on the XPS 13 9340 (Meteor Lake): no oops on the tested boots
(the unpatched kernel oopsed on its one boot that probed the IPU6, three
boots with this patch didn't), the ISYS runtime suspends when idle and
resumes for streaming, and the camera works.

This only fixes the suspend path. The ISYS being runtime active without
isys_runtime_pm_resume() having run also affects anything else that
relies on the runtime PM status before the first suspend, e.g. starting
a stream, or ipu6_isys_isr(), which v7.3 guarded with isys->power.
Making the runtime PM state consistent when the driver binds would cover
those as well.

 drivers/media/pci/intel/ipu6/ipu6-isys.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 094a98e31c06..9c3818c904cd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -821,10 +821,18 @@ static int isys_runtime_pm_suspend(struct device *dev)
 	struct ipu6_device *isp = adev->isp;
 	int ret = 0;
 
-	isys->adev->auxdrv_data->fw_ops->close(isys);
+	/*
+	 * The ISYS may have been runtime resumed as the parent of the PSYS
+	 * before this driver was bound. isys_runtime_pm_resume() hasn't run
+	 * then, and there is no firmware to close.
+	 */
 	if (isys->fwctx) {
-		dev_warn(&isys->adev->auxdev.dev, "failed to close fw isys\n");
-		ret = -EIO;
+		isys->adev->auxdrv_data->fw_ops->close(isys);
+		if (isys->fwctx) {
+			dev_warn(&isys->adev->auxdev.dev,
+				 "failed to close fw isys\n");
+			ret = -EIO;
+		}
 	}
 
 	mutex_lock(&isys->mutex);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.55.0

