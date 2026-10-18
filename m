Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2063C7696
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302295; cv=none; b=MJIwByapWdfWK7xquJyu1tdZdLfjKnsFFmaU6pTca0MhOhxaEFEKO6LTrANQY7MoBx+VPiSY5qU7Wk0wz9qZ1bIqRAChDK8k6gvkC4IWJGXiruF0JBSRTNaPwjR20HLKI3ruIdkG1919bqVa4tf2Q0hZMRg2h20LGny6amkUnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302295; c=relaxed/simple;
	bh=22oYmraKf3M0qeI2hZlSz0Ih1lqpjgI8wQZkelEo1JI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Am+v+e/0GX20PkmudrmhsWJQFvhAbYgVqJFJw7W1qstFRf3seowKtgzKOlgOP1P7ercxeEG7uHcXgusGUAYzvjArcvam+JcfTZdKJScpIuMeW0LL+Xv8Tyv96asZswC76MNmBv/s3D8QlAaTFz1Y+Xq1B5lm2uiAs3RBlm9DPxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVfBUkrd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVfBUkrd"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e940d5d2beso3878005ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302293; x=1792907093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7d0nJ/frXW3wHswZvrpSxzn29F8Cv/ZaDDOaazmw5BA=;
        b=cVfBUkrd52oKTfFX7vervU98wbvYs1WHiIYAcv/hVF2ZQd3sqRQ9eVjoSABt+lZp2g
         tJnzKremyk498OAM/ih39dEehtbyTJEy6NARVsi29jPxMdgqPedlZwYP2yoROO/S/iLc
         2fSalilCdqgsHOGzD43e9bHQEck0pOu7uAxT5vVtwqQwfs95bDoYqFjMlOJNBd/+z01L
         EKYtp6xlLNe9Qv2q0WoomraSbT3hqXcx24/6dYWG+FMhlLDo4CU5qj/n2INGvoRYpjHc
         t3MxQ44ohh+ft8gz0viiT881TH0KnmRwiatTL7OuQMDlLJS5cQ6quz2p5h2JO27Q6XD9
         deuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302293; x=1792907093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7d0nJ/frXW3wHswZvrpSxzn29F8Cv/ZaDDOaazmw5BA=;
        b=cnrnWzeT/mnaaurHtFk7InQzAIrh4hfCePHhgvtaE1Oi/XfvSG0WLMLBQcDcSYi5kA
         V/o5bM68SSWddPOcilNgyxilDuC5l7zbkoKkLC0y8daOBuYKVTdlf8LaNnxTA+nVOlH5
         q8XdJEsfBO+tB7TOkiP+8BqBxIaE8cWr0iv7Fld6UWxZ5H7614/CfXHQl1bFxiJ6W/mV
         OyhnYmSZYLAku53oknDEEJaCiCcnA1dVBvHe+xQf+OQDobgifdRql5TEC5ZfqYC549qc
         Hs8V4OQLEzzy2BfPireSfO+b+IypYVidMfaDKX40C5F9ABZU64VrjREWWQR7BVzK6I6V
         Ikag==
X-Forwarded-Encrypted: i=1; AKwUvByO/z1uX7E1CMWI6W55UFwdfvai/+7zUDp4JkbYd1YNv3kDSJd2y/x1wOtFUUqYefXA910cy8XWmo3dyvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9tSVZIfrsMGQ3osNA1ADE6ZgRW1lxghNy1SJlplBbGukUcNQG
	LbKdEjCInaZq+74uESoFqjJSh+Yo8sgtaF9+05KH92qZWH4Pwdav0A9cjm3gKt2F
X-Gm-Gg: AYBFou0hxwuXK0hdgmswLDiwp7z+4jE2+n/nN17hZEp2o/Dlqr4XVYAkYI107UWUGI/
	quqfDQ4uapvbQHk4e87r3Ll5enQIFIKIaaWCCHq5eGk3jfSQ2/ozIiI/OCRgslfho5mX5TKgSIc
	dZYbYrPbSaL3qd580yGj4dmPI11vYUq5F7sjVqXxSksaxAgQUcpvzOL/K68FZcGbH0LlB3Q1qmi
	y0vtzDsYug6VD2eVL99son3FzEYmOKXXu70jXK30Eh63PFLr1x4Ctwu6Vzvsp6XbrnK+5/o32Wv
	tgtDdPNzLaQ6vq6OdTcgJyTUMLzx3BMXkuWVt8dXDnqaX2/whmfx2hGZRZM0kU73YH/p4rhJEqZ
	CVrTmvb1Oo7+VSvRY+PJiOB4LF+unNqy7dXsOw6GCRPrTBEvJfXRN9JYePjXwox389ZUWMx9+v+
	TNsQDl1zhdMcqbi51i+QbVUUULTN0yDU9F4HkGdodcT7l0WINxEt5B/2AdLXs1DnURwXqt0n+lZ
	RxGLC0slljMXyt/h3VH0VBD3MG/aKzIRC/D
X-Received: by 2002:a05:6a21:7d01:b0:3e2:24a9:699d with SMTP id adf61e73a8af0-3e2262716d7mr2866162637.19.1792302293498;
        Sat, 17 Oct 2026 22:44:53 -0700 (PDT)
Received: from anise.tailfe078.ts.net (pkos202-079.kcn.ne.jp. [117.109.99.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c8b931sm2686648b3a.9.2026.10.17.22.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:44:52 -0700 (PDT)
From: Ryotaro Banno <ryotaro.banno@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Michael Krufky <mkrufky@linuxtv.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: siano: fix oops in smsdvb_hotplug() due to race condition
Date: Sun, 18 Oct 2026 14:43:32 +0900
Message-ID: <20261018054403.76055-1-ryotaro.banno@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When two or more Siano tuners are connected in parallel (as in the PLEX
PX-Q1UD, which is a 4-tuner enclosure with one USB plug), a kernel oops
occurs in smsdvb_hotplug().

smsmdtv:smscore_register_client: Client already exist.
smsdvb:smsdvb_hotplug: smscore_register_client() failed -17
BUG: kernel NULL pointer dereference, address: 00000000000002f8
RIP: 0010:smsdvb_hotplug.cold+0x30/0x1a3 [smsdvb]

This happens because smsdvb_hotplug() is called twice for the same tuner
device due to a race condition. Suppose two tuners, dev_A and dev_B, are
connected in parallel:

CPU0                                   CPU1
smsusb_probe(dev_A)                   |
smscore_register_device(dev_A)        |
// add dev_A to g_smscore_devices     |
                                      |smsusb_probe(dev_B)
                                      |smscore_register_device(dev_B)
                                      |// add dev_B to g_smscore_devices
smscore_notify_callbacks(dev_A)       |
// nobody registered yet              |
sms_board_load_modules()              |
smscore_register_hotplug()            |
smsdvb_hotplug(dev_B)                 |
// first call                         |
smsdvb_hotplug(dev_A)                 |
                                      |smscore_notify_callbacks(dev_B)
                                      |smsdvb_hotplug(dev_B)
                                      |// second call and crash

The second smsdvb_hotplug() always crashes; smscore_register_client()
returns -EEXIST with the error message "Client already exist.", and the
error unwinding path calls smsdvb_media_device_unregister() while
client->coredev is NULL.

To fix the race, add the device to g_smscore_devices within the same
critical section that calls smscore_notify_callbacks().
smscore_register_hotplug() calls smsdvb_hotplug() under the same mutex,
so smsdvb_hotplug() is invoked exactly once per device.

Fixes: 2e5c1ec8865a ("V4L/DVB (8258): add support for SMS1010 and SMS1150 based digital television devices")
Assisted-by: LLM
Signed-off-by: Ryotaro Banno <ryotaro.banno@gmail.com>
---
 drivers/media/common/siano/smscoreapi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 017629e3cf84..c413f9696cb7 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -731,11 +731,6 @@ int smscore_register_device(struct smsdevice_params_t *params,
 
 	smscore_registry_settype(dev->devpath, params->device_type);
 
-	/* add device to devices list */
-	mutex_lock(&g_smscore_deviceslock);
-	list_add(&dev->entry, &g_smscore_devices);
-	mutex_unlock(&g_smscore_deviceslock);
-
 	*coredev = dev;
 
 	pr_debug("device %p created\n", dev);
@@ -892,6 +887,9 @@ int smscore_start_device(struct smscore_device_t *coredev)
 
 	mutex_lock(&g_smscore_deviceslock);
 
+	/* add device to devices list */
+	list_add(&coredev->entry, &g_smscore_devices);
+
 	rc = smscore_notify_callbacks(coredev, coredev->device, 1);
 	smscore_init_ir(coredev);
 

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.54.0

