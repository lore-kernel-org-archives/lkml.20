Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4D23B0594;
	Wed,  2 Sep 2026 07:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332995; cv=none; b=jaZEzBPiTIqLMF5W9iIiasg22l71ZgfMDAO8TyOJDGlnBpBQ0lM1g1Os5bHGH+ss0OaqQG1z9BNhyLouJdfDEXzoyesTe4ogor/qE/ZMw0NP5rf27DgPQ76wl42RsbdUc+dcCboMFWZZ+Rnj0zxi22O5TDQTOcR8QnlPqiUtAHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332995; c=relaxed/simple;
	bh=0v2y6vQENo6sJh4uuDiyE1cuxNO5uR3RBtk+/HF/cMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBqDErZ5EtrA9MLD7fp4nU4R7sjnxHdFL4A/bW/tmgwxONh3emhKP5wPhsXd9A41Tnc5Wma7UC2Ei/8ELioP49bxSWdUuVVT0Qpk1FyRfkSPRNYrsu9OSOaStfeK2F/hkFGQHQjbDF2zJ5bjSWKBGzJ98EPNWM+0TZP7ZXYGKRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 47e99f8ea69d11f19a56ed5b684f684d-20260902
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7853a2d5-c7f2-4105-9f65-0d8660d0d804,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:c095a5e44064e4b369170979ddb95acf,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 47e99f8ea69d11f19a56ed5b684f684d-20260902
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1510329629; Wed, 02 Sep 2026 15:09:47 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: valentina.manea.m@gmail.com
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] usb: usbip: add NULL check after calloc()
Date: Wed,  2 Sep 2026 15:09:31 +0800
Message-ID: <20260902070932.1440-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two calloc() calls in the usbip driver lack NULL return checks, leading
to potential NULL pointer dereferences on allocation failure:

1. usbipd.c do_standalone_mode(): the allocated `fds` array is
   immediately dereferenced in the following for-loop via fds[i].fd
   without checking for NULL.

2. usbip_host_common.c usbip_exported_device_new(): the allocated
   `edev` is immediately dereferenced via edev->sudev without checking
   for NULL.

Add NULL checks after each calloc(), returning -1 in do_standalone_mode()
and using the existing goto err path in usbip_exported_device_new(),
consistent with the error handling already present in both functions.

Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/usb/usbip/libsrc/usbip_host_common.c | 2 ++
 tools/usb/usbip/src/usbipd.c               | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
index 01599cb2fa7b..8ad367e09e78 100644
--- a/tools/usb/usbip/libsrc/usbip_host_common.c
+++ b/tools/usb/usbip/libsrc/usbip_host_common.c
@@ -71,6 +71,8 @@ struct usbip_exported_device *usbip_exported_device_new(
 	int i;
 
 	edev = calloc(1, sizeof(struct usbip_exported_device));
+	if (!edev)
+		goto err;
 
 	edev->sudev =
 		udev_device_new_from_syspath(udev_context, sdevpath);
diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index 3e22b651c754..cc707dea2882 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -544,6 +544,10 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
 	dbg("listening on %d address%s", nsockfd, (nsockfd == 1) ? "" : "es");
 
 	fds = calloc(nsockfd, sizeof(struct pollfd));
+	if (!fds) {
+		err("calloc for fds");
+		return -1;
+	}
 	for (i = 0; i < nsockfd; i++) {
 		fds[i].fd = sockfdlist[i];
 		fds[i].events = POLLIN;
-- 
2.43.0

