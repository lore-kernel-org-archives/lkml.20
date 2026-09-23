Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13294756DE;
	Wed, 23 Sep 2026 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154572; cv=none; b=GrhslIFne75HNt/DKSBvnD2JOcKLM5vxyunVS7Vh29DMZM2ooTEIcQRyNjBW/x/IP1duePzrWvIpPmk+0mgTb4Zk6Dd1q5kgKOZQfxfptEjp+Ujqyssq4o2ljgSCrgqxMutdfuJC4U9glHMtzsIn4hfO6uPcoZfqAkUtaW0HxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154572; c=relaxed/simple;
	bh=nHicoToJMuRixP28mM7eCyZcSpEkqVgre2qAOT+Dyi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l70+Ckd0gWfINK/b2taXcrNZjDKsODRw5U9OIOdWdjHRZCxghU7SKplX7uqtxVnTVuuGNM2cKf8x1LKb51oMfJ9DiitBPO4a4SFdHQD0EWOBmqa9qLQVfV5kaz7cbpaqTkyjku2wSkU2vMHPo0Amgw4BvWN62qgcsXhSaOfRUkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=gbE9Gs1c; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=qK1d2lUE; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="gbE9Gs1c";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="qK1d2lUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1790153994; bh=nHicoToJMuRixP28mM7eCyZcSpEkqVgre2qAOT+Dyi0=;
	h=From:To:Cc:Subject:Date:From;
	b=gbE9Gs1cdglIEVN3oF2zJk87RCPuMs1I5nXASwPHsM/Q2jYDgDVmTfgWR8wbVht1c
	 05dsPy2Helkixvb4YvmaxTX6pn2jgjDil5QEWDFzf6Mxbbdo7rBsCxrYPW2sQJ2OEm
	 p0Q/3DI33XHIsUU/G+wS/RGjNcJzNyw6pHSyDZ/vU7bEQvjwvidHanOEFrUTpApWrM
	 AOsj/8dS4rC9dPVRKAC3kgDdWWOUNdEf0CRz0/FymKOMTRNQ14AX4AuB24ZbH5+LfE
	 BBaoO71j3WFwx9DC5NRwYK8ObJpCWVRQFHB3s6R5IVkyjSklsW4io1ckx39MK98tJM
	 Rh0Exy13ovuYA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 463C640BA2; Wed, 23 Sep 2026 09:59:54 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1790153993; bh=nHicoToJMuRixP28mM7eCyZcSpEkqVgre2qAOT+Dyi0=;
	h=From:To:Cc:Subject:Date:From;
	b=qK1d2lUEnm2YJlzPo39PiHTN14XcMn4AT/36lTWWf2Tp0Xx0ouKWj7zZShrzSTf21
	 Whf5J+gD3ozQe25I51cwQM8clJINI4UFwdlesKv5wnfLoMB7P1krG1jJ23E96ckuby
	 RX/qMl7KhSW+HdcNlp/0T76edjZrIj79UjobmYu8iWdRKkVBBd86Qxk4mSvvKBWsep
	 FiFHzJHPmvuiIhlQCmTTM3ua4p88KWqU/wbfYu0dOFxWGx50Xxx9oCOPY8WmAH9KDV
	 spQw/nAa8EAYakZSAMOFtQaNwUBlFwQuJ+qtUk55HdgCIK7YLz40WZCPl6I3ebu9O+
	 6J7JaBjw9SU+A==
Received: from maru.mess.org (hephaestus.mess.org [82.68.61.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 531E24017A;
	Wed, 23 Sep 2026 09:59:53 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc: Fix build failure with CONFIG_LIRC disabled
Date: Wed, 23 Sep 2026 09:59:47 +0100
Message-ID: <20260923085948.312798-1-sean@mess.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 37efd09ba2c6 ("media: rc: Ensure registered is cleared in error
path") broke the build if CONFIG_LIRC was not enabled.

Fixes: 37efd09ba2c6 ("media: rc: Ensure registered is cleared in error path")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202609230511.Em5Osw74-lkp@intel.com
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/lirc_dev.c | 3 +++
 drivers/media/rc/rc-main.c  | 3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index d9b6ecca563f..f7b8f1f66d9b 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -777,6 +777,9 @@ void lirc_unregister(struct rc_dev *dev)
 	unsigned long flags;
 	struct lirc_fh *fh;
 
+	if (!device_is_registered(&dev->lirc_dev))
+		return;
+
 	dev_dbg(&dev->dev, "lirc_dev: driver %s unregistered from minor = %d\n",
 		dev->driver_name, MINOR(dev->lirc_dev.devt));
 
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 1c07bdd3b42b..a867bf9e8416 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -2018,8 +2018,7 @@ int rc_register_device(struct rc_dev *dev)
 	scoped_guard(mutex, &dev->lock)
 		dev->registered = false;
 
-	if (device_is_registered(&dev->lirc_dev))
-		lirc_unregister(dev);
+	lirc_unregister(dev);
 	device_del(&dev->dev);
 	/* registered already cleared above */
 	goto out_free_table;
-- 
2.55.0

