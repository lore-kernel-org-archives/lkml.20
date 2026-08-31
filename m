Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE04AA3FA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189220; cv=none; b=ejqBSnv3vehJu2qUd9gQXsaXmqdpL4MbzP6AOFYIhNqlwDS8vZTCJnIKHY4LXAv02qDF20oLvoUNO7AJcCUl0Ht7TYkBdQiYYFYM52P8Hcu5dSuGowgccoPyHWMSML23WFANChynBdxpiHnjpq1cF8i6u5+jEPd0d3nuaV8sdZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189220; c=relaxed/simple;
	bh=qbF09y7RhAvLPfC4Dx8RclUjSAxYhL2nCqMnl7OXpgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N3apNX7ChIbwoszR0XtR5BXmfhVnOQBzf8zvbnu0M4srxd0m12D4OXhKjlcse3SNBQ0wBv3au4OgBug1NHxZGudn7jh0eULz6uTPwWFdOGEzyvd3nX9bkv5ae0HkU8dErbr0yCRG+4pRPwlfTyddTzKlYu6zVJXQld0quz9BOIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2GI4kHS; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2GI4kHS"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so3833995a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189218; x=1788794018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OG9YyPStLuN+BSPp/yVr/sF53sxqkDDt1S6b3xVxr48=;
        b=Y2GI4kHSapurdyvQfQw+ETQKedIbgCSS7K+81lHROk7rliKQ9bzTeiyTx4gd0YsaX0
         d79W6bU+AYCRCofRKH0ZRRFbWOdJB7oj7lDEV8AuhtcdD/q2JQ68Dr1WxrypUm39fIAR
         n4g5XW2QPpU0VeotAjLtIrc62FYDElgPyGVdyPZUN3uSsUT0kpHPOHxkXrraQ+pGyG6K
         bkPr8VlqW/JFMuaUpTr1jPWhYDp0YDuwCz4wgSlx3UmwVHxPcyZIKjAihL88dIrv73xG
         EfVqYigrBlyxY/gu9pTZiVMnQ1l5P2SPtypAD57AEHt0+viIAlbJ1sseyaBEC1baV4ZC
         3J5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189218; x=1788794018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OG9YyPStLuN+BSPp/yVr/sF53sxqkDDt1S6b3xVxr48=;
        b=sIngqL/sbtZLTUm/JOm4ql9Zjs2AJ31GckI/dzkoImxACHlkMgMpnEdFJ+XHpvpfXE
         9zeE75Cv6epW/wEGI2Gn/XzI837izmEwN2/1Jp/X8V6C5ZsRCAN6Ay26/EhXcofLlL8F
         3q83vnyRPH07hBofNfeN05uWbNQhtiMhsxq8vYl9JVdp3VfmYl8NsK/hXbr9IWMePAQO
         Ivb1dz/cKy+lGCYBp396WkNbIUvcmYVHrYVm1xy+XH09dGHr6SvjWmh4iJ6805UHjQVf
         i/KV0KcC+yDQsBEbRDZyJ5zbBMR5UPiIu9lXAtlMStzLa7PMNRSVTqctzBwDj9B3OFqo
         1DqQ==
X-Gm-Message-State: AFuF++lTMASYjvxahGPca79btEtTKi6TOfDR4K7V6xzuSEIiUSl1TRx/
	91zn7drpDp9wE/6s7Zv3jwJ/Ke5sg7rH6uJfywkMb8TkudOx37gpbv/sAxyPqHehVmiKlg==
X-Gm-Gg: AYBFou33M65RHGWUihEczCdMsOmMk5H05MnW0hvT947mMxhHDawFAIopJOk1d6sbwDH
	bp4kKCVq/TjOzv00mvPhSbquPWLNG8Ge9y/ppcvlZhUG1Hsssjf/Ns6RHDzycFqtfUuHY740Fer
	A6svN4pEi75XkxBPfkSnDd2Z/2N2hZpaynlze57GrcIgGS6Cn4sJRNiIQ8C8I/m/4zLu8CJOK8M
	wJcO19XDxAcUoJTmcjHCpvHyNSuBDQk9RoBumMRQDlDdVhgdwrj+uF77QFTIKVTFAs3Qhv/x89K
	mlzxfcKrWTHDHCLCZwYKELRwER82i54IB3VobsJiHtyCjCJ6Y5sL168CA/V2UyvsrJjLuVgNDe4
	y5tmgEY8WYxrOJPnSHlMSs/F9pg0Lia3wLW8l7GnzUvvRiZ93a7BMyC/h1OplnAGfq+0/3WYPcS
	fKVURS94yp7zKBQ4nD+3xNfe6iw8jYp0OzwUtEzhyo+VXlbec59YDsuweP771t4NjRcdIvmVqZv
	Q9wj7azVw==
X-Received: by 2002:a17:90b:388a:b0:398:e436:370 with SMTP id 98e67ed59e1d1-398e43605a7mr9963219a91.2.1788189217664;
        Mon, 31 Aug 2026 08:13:37 -0700 (PDT)
Received: from thefless.. ([2405:4802:f7aa:a4d0:1ef4:f6f7:1076:de13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc555b0sm17355122a91.13.2026.08.31.08.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:13:35 -0700 (PDT)
From: Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
To: jirislaby@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
Subject: [PATCH] misc: phantom: fix open file UAF after device removal
Date: Mon, 31 Aug 2026 22:13:26 +0700
Message-ID: <20260831151326.131296-1-khoavna.tin.2225@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phantom_remove() tears down the character device and frees struct
phantom_device immediately. Already-open file descriptors still keep
file->private_data pointing at that object, and their ioctl(), poll(),
and release() paths remain callable after cdev_del() returns. The VFS
also performs cdev_put() after ->release(), so freeing a container with
an embedded cdev leaves an open-file UAF behind.

Keep the runtime state alive until the last open file is closed, store
the cdev separately so it can outlive the device state, and block new
opens while removal is in progress. Mark removed devices so file
operations fail cleanly without touching unmapped MMIO.

Assisted-by: LLM (Codex, GPT-5)
Signed-off-by: Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
---
 drivers/misc/phantom.c | 123 +++++++++++++++++++++++++++++++----------
 1 file changed, 93 insertions(+), 30 deletions(-)

diff --git a/drivers/misc/phantom.c b/drivers/misc/phantom.c
index 331cae539290..dcec9c02c426 100644
--- a/drivers/misc/phantom.c
+++ b/drivers/misc/phantom.c
@@ -48,9 +48,11 @@ struct phantom_device {
 	u32 __iomem *oaddr;
 	unsigned long status;
 	atomic_t counter;
+	unsigned int minor;
+	bool removed;
 
 	wait_queue_head_t wait;
-	struct cdev cdev;
+	struct cdev *cdev;
 
 	struct mutex open_lock;
 	spinlock_t regs_lock;
@@ -60,7 +62,7 @@ struct phantom_device {
 	u32 ctl_reg;
 };
 
-static unsigned char phantom_devices[PHANTOM_MAX_MINORS];
+static struct phantom_device *phantom_devices[PHANTOM_MAX_MINORS];
 
 static int phantom_status(struct phantom_device *dev, unsigned long newstat)
 {
@@ -94,21 +96,31 @@ static long phantom_ioctl(struct file *file, unsigned int cmd,
 	void __user *argp = (void __user *)arg;
 	unsigned long flags;
 	unsigned int i;
+	long retval = 0;
+
+	if (mutex_lock_interruptible(&dev->open_lock))
+		return -ERESTARTSYS;
+
+	if (dev->removed) {
+		retval = -ENODEV;
+		goto out_unlock;
+	}
 
 	switch (cmd) {
 	case PHN_SETREG:
 	case PHN_SET_REG:
 		if (copy_from_user(&r, argp, sizeof(r)))
-			return -EFAULT;
+			goto err_fault;
 
 		if (r.reg > 7)
-			return -EINVAL;
+			goto err_inval;
 
 		spin_lock_irqsave(&dev->regs_lock, flags);
 		if (r.reg == PHN_CONTROL && (r.value & PHN_CTL_IRQ) &&
 				phantom_status(dev, dev->status | PHB_RUNNING)){
 			spin_unlock_irqrestore(&dev->regs_lock, flags);
-			return -ENODEV;
+			retval = -ENODEV;
+			goto out_unlock;
 		}
 
 		pr_debug("phantom: writing %x to %u\n", r.value, r.reg);
@@ -130,7 +142,7 @@ static long phantom_ioctl(struct file *file, unsigned int cmd,
 	case PHN_SETREGS:
 	case PHN_SET_REGS:
 		if (copy_from_user(&rs, argp, sizeof(rs)))
-			return -EFAULT;
+			goto err_fault;
 
 		pr_debug("phantom: SRS %u regs %x\n", rs.count, rs.mask);
 		spin_lock_irqsave(&dev->regs_lock, flags);
@@ -148,22 +160,22 @@ static long phantom_ioctl(struct file *file, unsigned int cmd,
 	case PHN_GETREG:
 	case PHN_GET_REG:
 		if (copy_from_user(&r, argp, sizeof(r)))
-			return -EFAULT;
+			goto err_fault;
 
 		if (r.reg > 7)
-			return -EINVAL;
+			goto err_inval;
 
 		r.value = ioread32(dev->iaddr + r.reg);
 
 		if (copy_to_user(argp, &r, sizeof(r)))
-			return -EFAULT;
+			goto err_fault;
 		break;
 	case PHN_GETREGS:
 	case PHN_GET_REGS: {
 		u32 m;
 
 		if (copy_from_user(&rs, argp, sizeof(rs)))
-			return -EFAULT;
+			goto err_fault;
 
 		m = min(rs.count, 8U);
 
@@ -176,7 +188,7 @@ static long phantom_ioctl(struct file *file, unsigned int cmd,
 		spin_unlock_irqrestore(&dev->regs_lock, flags);
 
 		if (copy_to_user(argp, &rs, sizeof(rs)))
-			return -EFAULT;
+			goto err_fault;
 		break;
 	} case PHN_NOT_OH:
 		spin_lock_irqsave(&dev->regs_lock, flags);
@@ -184,16 +196,26 @@ static long phantom_ioctl(struct file *file, unsigned int cmd,
 			printk(KERN_ERR "phantom: you need to set NOT_OH "
 					"before you start the device!\n");
 			spin_unlock_irqrestore(&dev->regs_lock, flags);
-			return -EINVAL;
+			goto err_inval;
 		}
 		dev->status |= PHB_NOT_OH;
 		spin_unlock_irqrestore(&dev->regs_lock, flags);
 		break;
 	default:
-		return -ENOTTY;
+		retval = -ENOTTY;
+		goto out_unlock;
 	}
 
-	return 0;
+	goto out_unlock;
+
+err_fault:
+	retval = -EFAULT;
+	goto out_unlock;
+err_inval:
+	retval = -EINVAL;
+out_unlock:
+	mutex_unlock(&dev->open_lock);
+	return retval;
 }
 
 #ifdef CONFIG_COMPAT
@@ -212,10 +234,15 @@ static long phantom_compat_ioctl(struct file *filp, unsigned int cmd,
 
 static int phantom_open(struct inode *inode, struct file *file)
 {
-	struct phantom_device *dev = container_of(inode->i_cdev,
-			struct phantom_device, cdev);
+	struct phantom_device *dev;
+	unsigned int minor = iminor(inode);
 
 	mutex_lock(&phantom_mutex);
+	dev = phantom_devices[minor];
+	if (!dev) {
+		mutex_unlock(&phantom_mutex);
+		return -ENODEV;
+	}
 	nonseekable_open(inode, file);
 
 	if (mutex_lock_interruptible(&dev->open_lock)) {
@@ -223,6 +250,12 @@ static int phantom_open(struct inode *inode, struct file *file)
 		return -ERESTARTSYS;
 	}
 
+	if (dev->removed) {
+		mutex_unlock(&dev->open_lock);
+		mutex_unlock(&phantom_mutex);
+		return -ENODEV;
+	}
+
 	if (dev->opened) {
 		mutex_unlock(&dev->open_lock);
 		mutex_unlock(&phantom_mutex);
@@ -243,15 +276,21 @@ static int phantom_open(struct inode *inode, struct file *file)
 static int phantom_release(struct inode *inode, struct file *file)
 {
 	struct phantom_device *dev = file->private_data;
+	bool removed;
 
 	mutex_lock(&dev->open_lock);
 
 	dev->opened = 0;
-	phantom_status(dev, dev->status & ~PHB_RUNNING);
-	dev->status &= ~PHB_NOT_OH;
+	removed = dev->removed;
+	if (!removed)
+		phantom_status(dev, dev->status & ~PHB_RUNNING);
+	dev->status &= ~(PHB_RUNNING | PHB_NOT_OH);
 
 	mutex_unlock(&dev->open_lock);
 
+	if (removed)
+		kfree(dev);
+
 	return 0;
 }
 
@@ -263,7 +302,9 @@ static __poll_t phantom_poll(struct file *file, poll_table *wait)
 	pr_debug("phantom_poll: %d\n", atomic_read(&dev->counter));
 	poll_wait(file, &dev->wait, wait);
 
-	if (!(dev->status & PHB_RUNNING))
+	if (READ_ONCE(dev->removed))
+		mask = EPOLLHUP | EPOLLERR;
+	else if (!(dev->status & PHB_RUNNING))
 		mask = EPOLLERR;
 	else if (atomic_read(&dev->counter))
 		mask = EPOLLIN | EPOLLRDNORM;
@@ -353,8 +394,6 @@ static int phantom_probe(struct pci_dev *pdev,
 		goto err_dis;
 	}
 
-	phantom_devices[minor] = 1;
-
 	retval = pci_request_regions(pdev, "phantom");
 	if (retval) {
 		dev_err(&pdev->dev, "pci_request_regions failed!\n");
@@ -387,8 +426,15 @@ static int phantom_probe(struct pci_dev *pdev,
 	mutex_init(&pht->open_lock);
 	spin_lock_init(&pht->regs_lock);
 	init_waitqueue_head(&pht->wait);
-	cdev_init(&pht->cdev, &phantom_file_ops);
-	pht->cdev.owner = THIS_MODULE;
+	pht->minor = minor;
+	pht->cdev = cdev_alloc();
+	if (!pht->cdev) {
+		retval = -ENOMEM;
+		goto err_unmo;
+	}
+	pht->cdev->owner = THIS_MODULE;
+	pht->cdev->ops = &phantom_file_ops;
+	cdev_set_parent(pht->cdev, &pdev->dev.kobj);
 
 	iowrite32(0, pht->caddr + PHN_IRQCTL);
 	ioread32(pht->caddr + PHN_IRQCTL); /* PCI posting */
@@ -399,12 +445,14 @@ static int phantom_probe(struct pci_dev *pdev,
 		goto err_unmo;
 	}
 
-	retval = cdev_add(&pht->cdev, MKDEV(phantom_major, minor), 1);
+	retval = cdev_add(pht->cdev, MKDEV(phantom_major, minor), 1);
 	if (retval) {
 		dev_err(&pdev->dev, "chardev registration failed\n");
 		goto err_irq;
 	}
 
+	phantom_devices[minor] = pht;
+
 	if (IS_ERR(device_create(&phantom_class, &pdev->dev,
 				 MKDEV(phantom_major, minor), NULL,
 				 "phantom%u", minor)))
@@ -416,6 +464,8 @@ static int phantom_probe(struct pci_dev *pdev,
 err_irq:
 	free_irq(pdev->irq, pht);
 err_unmo:
+	if (pht->cdev)
+		kobject_put(&pht->cdev->kobj);
 	pci_iounmap(pdev, pht->oaddr);
 err_unmi:
 	pci_iounmap(pdev, pht->iaddr);
@@ -426,7 +476,7 @@ static int phantom_probe(struct pci_dev *pdev,
 err_reg:
 	pci_release_regions(pdev);
 err_null:
-	phantom_devices[minor] = 0;
+	phantom_devices[minor] = NULL;
 err_dis:
 	pci_disable_device(pdev);
 err:
@@ -436,11 +486,19 @@ static int phantom_probe(struct pci_dev *pdev,
 static void phantom_remove(struct pci_dev *pdev)
 {
 	struct phantom_device *pht = pci_get_drvdata(pdev);
-	unsigned int minor = MINOR(pht->cdev.dev);
+	unsigned int minor = pht->minor;
+	bool opened;
+
+	mutex_lock(&phantom_mutex);
+
+	phantom_devices[minor] = NULL;
 
 	device_destroy(&phantom_class, MKDEV(phantom_major, minor));
 
-	cdev_del(&pht->cdev);
+	cdev_del(pht->cdev);
+
+	mutex_lock(&pht->open_lock);
+	pht->removed = true;
 
 	iowrite32(0, pht->caddr + PHN_IRQCTL);
 	ioread32(pht->caddr + PHN_IRQCTL); /* PCI posting */
@@ -450,13 +508,18 @@ static void phantom_remove(struct pci_dev *pdev)
 	pci_iounmap(pdev, pht->iaddr);
 	pci_iounmap(pdev, pht->caddr);
 
-	kfree(pht);
+	pht->status &= ~(PHB_RUNNING | PHB_NOT_OH);
+	opened = pht->opened;
+	wake_up_interruptible(&pht->wait);
+	mutex_unlock(&pht->open_lock);
 
 	pci_release_regions(pdev);
 
-	phantom_devices[minor] = 0;
-
 	pci_disable_device(pdev);
+	mutex_unlock(&phantom_mutex);
+
+	if (!opened)
+		kfree(pht);
 }
 
 static int __maybe_unused phantom_suspend(struct device *dev_d)
-- 
2.43.0

