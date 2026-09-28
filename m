Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81602BE7BE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599166; cv=none; b=Tj30QND9/BnKZ2Zk5rBYnY+/X3xZ4Ecmhvd25YUQHwx+QbpwY++q/3Cep7AkwX1J8phjHYD6F/15rgVEVCt5bwP1IkkCfdKLloToMTh/qWhadCjYCMsOdi3sLIunX0zv01wa+dID7OUyEjW5OobPQLLXAnJ42HyHejXf/OBXS+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599166; c=relaxed/simple;
	bh=pmd0+ShJKV6mb5D0Fapp5f4sCZO2d26xd1hwzZ3KIek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EE1thUcCRJe46vzFeclLUf0NQBcH6bgfbrPq8vAnTIlBeHiijsq52BylCJkzQ2SsNSzKNcfSBbEyrEt0SFWWWqkY3CNFM8Fkc04KCH4OhoXIsW3410w4ULrL8mlJrihxNbvTGjSZJ4wX3EWjM9Uefaa5ZdByExzn+Q0/YcCcxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=pass smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpsz9t1790599102t2b351b77
X-QQ-Originating-IP: UslvrLnkpLv219EBOCZQWgdLB2Yd4yGQ4ouR4nt8KoU=
Received: from localhost.localdomain ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Sep 2026 20:38:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5072193590924452758
EX-QQ-RecipientCnt: 12
From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn,
	luoqiu@kylinsec.com.cn,
	liudalin@kylinsec.com.cn,
	Yingchao Deng <dengyingchao@kylinsec.com.cn>
Subject: [PATCH] coresight: syscfg: Fix null pointer dereference when configfs init fails
Date: Mon, 28 Sep 2026 20:35:15 +0800
Message-ID: <C73E0F9BDC0A8FE7+20260928123515.2032-1-dengyingchao@kylinsec.com.cn>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OHzPAwYnxdyj/dJup1oe7uBWd83nemyghiy4LlAG+RGU5TYx6vOgiRgK
	ML1IRclAsgSik7qor3f+10R3NLs078cDD9Wb+42cMsNj34lRBkxtltfPwE65tWpAbqTOxmW
	aWwj3ko1/fIkU/VfVBoPs6FAUY/IflTtRRQLJTUBLGUpf8HU5dR/UGRHT+ffCKPDzbVjABW
	UNuZL1n5NDC7EYBzH3ljbu1HKslYl4nFdSiEr3xAP9WoCqRx2OCb6hySWM5miowpNJ6ymiX
	WuKdG/tUotA6WzpNXQDIvhYLgtvZt0CkoAQ+0FpAUWzVo+e9mQReMQTjgXknEXZ3ucR97A6
	FNpF86/7dSrsGH+iupw7XXLWfRUJdMKny2ANz89+5RafEIkaHd4t7+pXywsJXVizVtPSsp2
	t04t7/HpG8SD+viYvLAIydALGANPect9+iwWKCVZYAbRt0QdBcvH47CgInDu29404qkN5ZM
	bxz9LfXq/KMvQfRfhKoz20s9J6y8ZQStzTeSxkxI69etUcnKCzmBAl58YVjShdSepdrU0ny
	TZDAWj6g2RfR8QdvFTzwxCkM2FsF4Q1X/N8snCdBk8TqTKC8d0s/vH4/OdNKXDf/v5jqXHU
	D3g/xuz4M8P1C2cWAIHtRJA+bWkcd66EjZffLNPjRBWsUhL6wgGknqthOHaC9/SDzsQVJu8
	FRM7Q2eBbgGstsPbWfZGqBHqlOweA9fsN5Cmb5+42i9ajmcllARLXBQ+pp1nVtwkcx7mcWO
	xLdbqoG7bepm2M76KYBRkVECWWA6euVKUqoSxg+QgQ2Si3fcYvrC2YgIDT0tBI3i2NpoKLx
	QnFyWWiAauWLnSqqbBYMl3Es+gp8RX+EMQQCf7tNGE0KfVP44bJLlZJsb9uHsbWAJ2AEYjU
	T/P3a/qaRhQaJXNWl1Xbd/POK89M1gGLGIYvd1tFMG7Nd2ynTjvd0RdgWIDV9e6UH1QWmbR
	4S/jX5XjPeupi3a5/mnuAOwUEcBNnn0p2mjn7N1FCBmFScnCq+LE6V92RpIGd9fi42kJFAt
	Lu41WPllkzd/H+bJGczi8qDqmtpTNPlmeRyKThUXht/xwonpSQklvp0XVvyy5HWzXG17FEx
	X+6HtuhSURRYlz2g1vP2KV2h3ohSDCormBINRC5Mi6Ol+NJ+uhTX3iSfLedq/1BFZikXbiq
	bTLVCXR3V7Xc/7OclKfKWq6Wgw1Q14O7kZvp
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

If cscfg_configfs_init() fails, cscfg_init() takes the exit_err path:

	cscfg_init() -> cscfg_clear_device() -> cscfg_configfs_release()
		     -> configfs_unregister_subsystem()

which tears down a configfs subsystem that was never registered.
configfs_unregister_subsystem() begins with:

	struct dentry *dentry = dget(group->cg_item.ci_dentry);
	struct dentry *root = dentry->d_sb->s_root;

ci_dentry is assigned in configfs_create_dir() only once the subsystem
directory has been created, which never happened here.  cscfg_mgr
comes from kzalloc_obj(), so ci_dentry is still NULL, and dget()
hands a NULL dentry back unchanged - the next line dereferences it.

Handle the failure in cscfg_init() directly: unregister the device and
return the error, releasing the devres-allocated config item type and
cscfg_mgr without touching the subsystem.

Fixes: a13d5a246aca ("coresight: syscfg: Add initial configfs support")
Suggested-by: Leo Yan <leo.yan@arm.com>
Link: https://lore.kernel.org/all/20260924162404.GN200420@e132581.arm.com/
Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..00b29d1656c0 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1299,8 +1299,10 @@ int __init cscfg_init(void)
 
 	/* initialise configfs subsystem */
 	err = cscfg_configfs_init(cscfg_mgr);
-	if (err)
-		goto exit_err;
+	if (err) {
+		device_unregister(cscfg_device());
+		return err;
+	}
 
 	/* preload built-in configurations */
 	err = cscfg_preload(THIS_MODULE);
-- 
2.33.0

