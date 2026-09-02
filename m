Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51E2366DA5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325297; cv=none; b=CZfysCibR8BBxP0icgkKKxSamSC/VmoDKzZUzfd5IPTgB97s/N2Wbg281BG75aVWmFsgVFJl2QATevZxbtF4O5VMnG2dQUl+6oWQmgY+5WNxT7Jx2eK3oU4zat/a+s9opu42z4fKaKnwzTKF9+u9JzL3aXNm/NJTOs9nYfQTnBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325297; c=relaxed/simple;
	bh=5mVDL4kqExw9hIknIEfIlCKSYbg9TjUWlFav0ecLMks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r19FQEhAN57ZQAA0s8rhDyZuFWKAHVu94BZJXpmySLgyuZXDR1L9of8tBhxJsZACtspwAg2M2Jct4ZJXPvqmzEXbXAhAOqbek1iQFlIrp+fanPiEeZT6GixabZatlE6TjemZwH56xllTroVw4FCg52L2synG4JLQDKz3l0v9McQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/K+31rE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/K+31rE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39682983a0fso784139a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788325295; x=1788930095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQNqD94j63s6WRrqwJlb9dpJ00oMA6/fQfx2maPK1DY=;
        b=D/K+31rEN9aGkhxoAOGFFz+oY7t/6BumnhoI2Q9u15+H6j5umMn/L0r7Qp613BSYRq
         Q2z/4BAyWdzK+hpqeSAX9ru89sgPy3w8pSfxZXK22YQdjcJcd3kaOEUtny9OMib1Km8J
         zz1JbDSciOHzkN4ExWxHr3/p9s3VbZNe1GZ3meAjRhWiINivuAFziKP4e+cGQYAocAHo
         YPmFf+UQSpCqjyRvXoR5hNsjWUfaFVqyw5SgpLS5D8gZd0auqby1qivwVj9zkhqalx3Z
         rWs8X2DVcWMrb3RBWruMWLQXhLKEClr5XEZwQyMd5DiG+FXB3UeKcoo9JsELQg1+kCLU
         OOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325295; x=1788930095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQNqD94j63s6WRrqwJlb9dpJ00oMA6/fQfx2maPK1DY=;
        b=tMR8D5Ch4kzKnbMp+O1I5i7goWHmLVLAuHl5vRPwBxRz3aRji0ESnrukPowJv2ZKvy
         bccnUx8R+WIfI95xe8Vhn7Zj4juSvgItuqP9ZcPZbUh8AmKgWvT1B6txT9rsmRAEHzfr
         VbABSVG3ffATXSQqDGRCUJyN7A/p+RhDhhGnVsccTpu5LtLMSb8ZD0+loIXy1pMB+aX/
         SvE33CDKXEGMvRfutKa5UEPCdWZPyfpiYqXGyRWiwdGb/IR+bcplMsIL79mmjRtonJB6
         jv+mIv/1nthS9i5YKNBKsNOkodTvaMz8qgF/V9dVeSmTpX6/uG83zM9yxPTYVxyvjVi5
         K0XQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6fkF3SKi05draLhZ07P88+K/c2UlKn9/Fl9OCYvGxgASAX+lCLWS/IM53aPULIgRs1B2hDGrlQ9se8u0=@vger.kernel.org
X-Gm-Message-State: AFuF++my88+UTckW3fi9f4BKtH+3E9PzhD45XrAabqtP7OpvUDDyN7C1
	Fho0NsrYYSq4BLZiByaYiVnwn5A8/iJ2CRAmwW3shf4NnGv98YC+fXsG
X-Gm-Gg: AYBFou3L68h9IHhklg93WPJ9jdjxUF9DsHFnT5lM9HdMD5vhaAkoEziaAdmzkspZTPt
	/FbfrSK8uHtCq95cDZ+G6wvUwUW6Rn8R6R7dy+yI2+Gsm1TCJV6ePE+eKHREoDw2KYYJHvYBGMI
	U0UlrhtfaEDf2pwSL0Ya58BsPrf5QNXftVJ77ZPd1eyQn03ZBIEQ4FI8UpHTZ3eND4RMgLctvZo
	1F6xG3GdsGGY1eO+wM0IB3BwhjRnFXMdOyEMXiqJjVPjj2msFcVRtNRtVA3tzVn0uJzz0Lz9TR9
	rLVAEwqfV+nlI47FwOUgB9gkfPpsXAIudBUhircCGn2i91I5lOLod8WnJKzHD1+L1AhI7/PJSKi
	fBIGfGmFN3etJOclj3iGoZcqYFhRX3a7JnZYsW7NrnEJ03Srnz78ntbvrXaX7NOOAurChdKwAWn
	zpwkXECEdcElM3+djLbW/Dfs7HrRzjXrmDApVCFCqeW47d6YXG1tTgyPvQCSIFhQ==
X-Received: by 2002:a17:90b:3890:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39aedee8f9bmr2979710a91.7.1788325294918;
        Tue, 01 Sep 2026 22:01:34 -0700 (PDT)
Received: from tradnomic.. ([2601:646:8300:7570:1bf0:3629:a2e2:397f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d0bdsm3010758a91.11.2026.09.01.22.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:01:34 -0700 (PDT)
From: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rafael Alejandro Diaz Cruz <rafad900@gmail.com>,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: [PATCH usb-next v1] USB: gadget: Fix UAF in gadgetfs_fill_super()
Date: Tue,  1 Sep 2026 22:01:27 -0700
Message-ID: <20260902050127.3767049-1-rafad900@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UAF is caused by syzkaller reproducer forcing
the failure of gadgetfs_fill_super()

When gadgetfs_fill_super() fails, it's error path calls
put_dev() which drops refcount inside the_device to 0
and frees the objet. But the_device pointer is not
cleared, leading to point at freed memory.

VFS will then call gadgetfs_kill_sb() after mount
failure leading to put_dev() to be called on the
already freed pointer.

Fix by setting the_device = NULL during error path
before calling put_dev() inside gadgetfs_fill_super()
so that gadgetfs_kill_sb() skips put_dev().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..3e2bce7543d4 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
 	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
 	if (rc) {
 		put_dev(dev);
+		the_device = NULL;
 		goto Enomem;
 	}
 
-- 
2.43.0

