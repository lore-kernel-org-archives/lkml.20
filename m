Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C1434988
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897517; cv=none; b=aYrDk3zZZTXyS+lcVU+L5WkxZmpKsPL/ViaM5KYZVC2Z+7IfPruG1JC2EHNTtO1hKk4o3ZkGqvhqUas4nJL2z2UGWyN2PldAmk3XU4rDgwLmaNEtJ2UlILGro3QRVNt0nsAqzrmc6CyWwGH2lbDM9jYP5z0pk1LEmGtHRIHME4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897517; c=relaxed/simple;
	bh=Cns2oT1nIczmTx7BA1FQJrYa05Qz1bt5TspJzKY+DpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X1V4q1nHaef9Q6chEfLYJNrlffkuwLypA6ld+nFq5p7jK9p4WuJYlWTQ/IfU1JTFz4l9iNEbNO8sy/qNLfyG0/oOYIQ6azZTD8RLCkegca7Ys6CZp4hJZ5i6E1NwgPfLYJPJoM6wlO1OgVJ5ETR8I0runqDf8rx6yK3Xjov0988=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=K1cOj307; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="K1cOj307"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8525efa7274so3564881b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1788897514; x=1789502314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nty+EzL8h2vGEh2tc6E2x5KvUZQ/WGvvcz1FT+MSujg=;
        b=K1cOj307fArWwLUzOrJPwQnvfZQZrXkdF7CnX+JY1TVAT3GcKqy4OysYSXMlyeCr+/
         K03NdnTwL2CXmaOkN3ZWTqPv/7/yfkWdqxsLzdPvYlkX3h5Qo2jaUwdN7DhBFRKpV6D7
         7a1meCNU0TwpSzgj0eHGNgrC8u9fbxfC3eYUsGk1KBVFQm9FGRg2o+BGdnKdvAUtkqxf
         tj3HBStd7ObWFm71yv3btKQXJoRDN6U0CYnhZRQQSAwn78mm+fLYFH/wmeEcMuTmxjKo
         c0tMFtz0uLOILslHzWYg+5mVNYLoqJzGooGUg7GhB2tXUv/jm4t0fdzX30xamSSWAg84
         PWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788897514; x=1789502314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nty+EzL8h2vGEh2tc6E2x5KvUZQ/WGvvcz1FT+MSujg=;
        b=rKh2mTQaGU0YzvZLOpsv/TMGTkXeCady5Xn4UrxTK7FZhqqT4ASFzw0poly/4hWmz5
         Abbq53nrdfwbWQ3j1O7AEC75FiqF1IECuk8e2D45R0GM7BwK7UlmSjLTiXo6DycEHOto
         DRoj7qS3JcEzjQHvTf0+3moGLSlLLd908EogS5G5S7E7/HTK1rlr7U5WGCOSU3ckZedx
         zv2TeQqYR695wd2ULWihb5vJCVcxuFaHeXi6c9nEcCOH1S+murr+sM1PEgrIEIgXCk20
         AU3TAAFQWrJfVgbOxIz96ztXDWgU05t7b7uUvqdElcHGPLkrRVf0JKf9M55usoHkPQn0
         H27Q==
X-Gm-Message-State: AFuF++mBG7qfnWxywu+M1ddMYZCZcU8W18fyUqUrUsmzwuFx2uCSthPl
	3gmSqV/ytvoF++0PBrNJ+4KnOT5XJoVgrWm2wddBCbXfAQhGf8z7nClPLhwuyoX65A==
X-Gm-Gg: AYBFou0mDWEAtjKgtDEJ7f6/BNgfhwUlFDeict3Wnw37G9qCYA+smhk7neMhUcx8ZNu
	jRfACkftZFf42a79jPPQ23D/rmKE/r3wHJytD1saVBnpLTKQ6URlPhYwj5NdqFk40PdaDGI+RIb
	kNC0ibqt45KCU6CJ4LHvhCtLka06MApYQgfVD1poHXg/ScvjiXjmUkMqa7CAVgSfQqH8OmDhHeM
	ym00ee+NhkgSe//9ilHonT+Bil6vjKRHTDBNJemOfIIlYytQeR8Wm3SI46AUYL+cKBwthJQWfYc
	guU4T4WxFvRdG0d0VnrzVin3MUaPml1YlP7JhAJHrRlydVrvPZJ4QUHqP5SAvSu/tgupyY1GtmE
	wwn7gL+o8/8Gj51q4KdT9efP1x1EGaMyY89hji+/wLTd6wR2sgDbyIP4/yHS1FouZ7Qwss+/ZfH
	WDMUIXRym2xl9w9G1oQOHttljYIwd8xTCLnfUyln2vwRDu7MAtYDOb0C2ziSbWqBrA/UhVjcXKt
	SrMDCUIyLG5c5l+
X-Received: by 2002:a05:6a20:2d0b:b0:3d3:af85:eb99 with SMTP id adf61e73a8af0-3da3a16270fmr50562135637.27.1788897513761;
        Tue, 08 Sep 2026 12:58:33 -0700 (PDT)
Received: from gio.tailc60d82.ts.net (129-219-8-8.nat.asu.edu. [129.219.8.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm50931202c88.2.2026.09.08.12.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:58:33 -0700 (PDT)
From: Giorgi Kobakhia <gkobakhi@asu.edu>
To: mrkobush@gmail.com,
	dpenkler@gmail.com
Cc: linux-kernel@vger.kernel.org,
	xmei5@asu.edu,
	Giorgi Kobakhia <gkobakhi@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH] gpib: agilent_82357a: fix null-ptr-deref in primary_address
Date: Tue,  8 Sep 2026 12:57:35 -0700
Message-ID: <20260908195736.1554837-1-gkobakhi@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function agilent_82357a_primary_address initializes usb_dev with
interface_to_usbdev(a_priv->bus_interface) above the guarding if
(!a_priv->bus_interface) return -ENODEV; When the usb dongle is
unplugged, disconnect() sets bus_interface to NULL and the NULL
dereference is triggered.

Commit 8491e73a5223 ("staging: gpib: Fix Oops after disconnect in
agilent usb") fixes multiple NULL dereferences in other functions,
but this one is left out.

KASAN report for the left-out NULL deref:
 Oops: general protection fault, probably for non-canonical address ...
 KASAN: null-ptr-deref in range [0x0000000000000090-0x0000000000000097]
 RIP: 0010:agilent_82357a_primary_address (./include/linux/usb.h:752
  drivers/gpib/agilent_82357a/agilent_82357a.c:922)
 Call Trace:
  ibpad (drivers/gpib/common/iblib.c:466)
  ibioctl (drivers/gpib/common/gpib_os.c:1507
  drivers/gpib/common/gpib_os.c:675) __x64_sys_ioctl (fs/ioctl.c:51
  fs/ioctl.c:597 fs/ioctl.c:583 fs/ioctl.c:583) do_syscall_64
  (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
 Kernel panic - not syncing: Fatal exception

Remove the faulty assignment.

Fixes: fbae7090f30c ("staging: gpib: Update messaging and usb_device refs in agilent_usb")
Cc: stable@vger.kernel.org
Signed-off-by: Giorgi Kobakhia <gkobakhi@asu.edu>
---
 drivers/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpib/agilent_82357a/agilent_82357a.c b/drivers/gpib/agilent_82357a/agilent_82357a.c
index 2468a471d175..7abe5540ffc5 100644
--- a/drivers/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/gpib/agilent_82357a/agilent_82357a.c
@@ -919,7 +919,7 @@ static unsigned int agilent_82357a_update_status(struct gpib_board *board,
 static int agilent_82357a_primary_address(struct gpib_board *board, unsigned int address)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
-	struct usb_device *usb_dev = interface_to_usbdev(a_priv->bus_interface);
+	struct usb_device *usb_dev;
 	struct agilent_82357a_register_pairlet write;
 	int retval;
 
-- 
2.43.0

