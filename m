Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4DD572683
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886781; cv=none; b=Ha3YdtJbnmVN9dEDT6mMzHffFjBwUdWcm/WWqSbmp5JyW8gYyDTkGDTGYazogc9S19W0HlRd8xOZOP9m639yQe2LB+UmVpvqCZApxoVLrJqUxss4NWLFRtjU6y2cFvNUzALSGl5gBeWTOCk0sE2Ok0cgAXKbnxSerrnzibGPmOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886781; c=relaxed/simple;
	bh=+KOQ1Ds4ZkQOJQZRLn+J3z1zuh2gsIE6PlCJszLVBFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gieEFzXk4nBwMZRvGXbxaGaTbusuv42mnDhBQ8rHspAxZ2ZWw5id9V1sBBriDNSe509R7gbh1fPHiraBz+EfVxIlf4CNLYb6rCnDZ8Xpz12h2cSro1jM4BxNQjqh+z4aMGthcGg2v4v7ufQrFkAdBXmc88bqhf1tNLU+lFcapZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1zrakv2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1zrakv2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d715f4a587so67573875ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788886779; x=1789491579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgqygJFgVHpbr65+v3Un3U0dLoYuKnbnhqEwnLI1X3A=;
        b=c1zrakv2Tqf2KocQK8haNdChgaRQpAKLnfhN01cDlgDlMslO0+ub6rFIfxrOjKUnDM
         4wSZOqdfmHzZrmJcKFoqAsXYs4ewgrfAYEmlfFkDsRAxb3sZjb+FFrvHqZfZWyqNwYSS
         Ml6xU/eWPGzG8pmAhP3CughSIcbPxvAPfpEWqMs2GenBlzleYH6g8h5QijU257hbIeBC
         AjUYLzVc3/0V1Bn/6AZraOBbs8b9B+ujwWoQSTIRL5wzCkJSpJ5edcqW54EevmBmJviz
         At61N1BmJrWOpxY4aUh2JjvYlyeK7BtGm6KWPjb+m8stpqst9vtXd6QMa/dvZb6PMJYY
         fOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886779; x=1789491579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgqygJFgVHpbr65+v3Un3U0dLoYuKnbnhqEwnLI1X3A=;
        b=ZkXcRuut6KD3v1mczystGn0lm57lj+9syxD9ZrL8y6LM9wHZ9JamJzWzp7/E+K4HDz
         LPHussvjWpHIb2tfal1R12DCJKurWZAD0VkwFFZtcVsMnvoxGl/F/l4jawwjY2dHuYQU
         ZxKlJlKj7Rbb6rqVfDJIanMp1LT8wMDZ7YVqCbpUz9aZB52MUqVj00WDHcMFxcM0ZKAJ
         e8Ay6HebUiIbXNVwsXeLQv3kh1xOr8RZiKEIiIa8Nd7eLWVgnWSpM61a9n2AtN5YOkQv
         k6ump1MOD0xBC+LOzoW0PSpZqlz2u7ryD+GSfm/1nRgJAGNkKFcYMCCKt+SEw+EFgMzi
         pPdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDLinT+zjaQnVY8ajJu/2jYu27T82eeRGPFrchevBb9ijOwSz0lQ/JouhWN+ZC+UhtETJUGPi++um9nuE=@vger.kernel.org
X-Gm-Message-State: AFuF++k89nQ+iV0WKU0Jy36lrcADllIKDwWzdaD7SPLgcuxy7ePBZ9hB
	xF32qnSjQpMlFcSbner1fmFmqKSH4pbB6fI8z1Ft/0i4jNXCTJiX4Ngc
X-Gm-Gg: AYBFou0kXLVXVLmgr2d2jFMEiZp/YKR+u5ByQ7rmoWLLlTkBNbf1I/8xjkom5htWtmN
	0rB4j8WPPj2w7S29CbO4vrP78go3MRJT+CuWWn/x4cCcsnhisxgATvwHGliehiXD4YChMkzekMo
	L1735VnuqkSeWLPCR+MvfMz7cpVeT0mxcwN5xc6qlKJjMUOL9NNcVQz1iPlNpIHTpxZLec3lvUg
	/VG+h+FPkZp5fDJ1m6zqMjzQXNixbCEbU9vRc9AVTC/qWoHDZcfuXEHFZddwidRHmQgu9UAhywe
	B6nXFAA+Hedsfw0v2Reuw6ePeXAhJTT+VuBQoinppIxbHmC2DY+hMlTPL4C+ztXAIgqEzWgIDKR
	uZZ75GGAy2pgSe/NTpIi909F/gCnM6nFg2KnoDQ2RxQNC+9AM/xldv3qzkQqoNEOlqnWBxUdbGZ
	YJVu0Bd4I13qbHua5WE6s1JQ+J31V2wjY9LKiVLZS5hz528mzJn8ecmGIFChX8U1dvRJPErtWaF
	eD3GhuPW18rbz2GX1WLn5eB
X-Received: by 2002:a17:903:90b:b0:2db:5f00:ff52 with SMTP id d9443c01a7336-2db5f0103fbmr170823495ad.22.1788886778892;
        Tue, 08 Sep 2026 09:59:38 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db146b9691sm61436395ad.0.2026.09.08.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:59:38 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christopher Heiny <cheiny@synaptics.com>,
	Andrew Duggan <aduggan@synaptics.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+09103639e39c989e3ed3@syzkaller.appspotmail.com
Subject: [PATCH] Input: synaptics-rmi4 - fix NULL dereference in the PM callbacks
Date: Tue,  8 Sep 2026 22:29:25 +0530
Message-ID: <20260908165925.2030-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rmi_driver_suspend() and rmi_driver_resume() are exported for the
transport drivers; hid-rmi calls them straight from its ->suspend and
->resume. Both reach code that dereferences the driver data right away:

	static int rmi_suspend_functions(struct rmi_device *rmi_dev)
	{
		struct rmi_driver_data *data = dev_get_drvdata(&rmi_dev->dev);
		...
		list_for_each_entry(entry, &data->function_list, node) {

That data is installed by rmi_driver_probe(), which binds only after the
transport driver has already published rmi_dev via
rmi_register_transport_device(). A runtime PM suspend of the underlying
USB interface in that window dereferences NULL:

	KASAN: null-ptr-deref in range [0x0000000000000078-0x000000000000007f]
	RIP: 0010:dev_get_drvdata include/linux/device.h:989 [inline]
	RIP: 0010:rmi_suspend_functions drivers/input/rmi4/rmi_driver.c:283 [inline]
	RIP: 0010:rmi_driver_suspend+0x30/0x180 drivers/input/rmi4/rmi_driver.c:994
	Call Trace:
	 <TASK>
	 rmi_suspend+0xa7/0xf0 drivers/hid/hid-rmi.c:448
	 hid_suspend+0x4a3/0x530 drivers/hid/usbhid/hid-core.c:1618
	 usb_suspend_interface drivers/usb/core/driver.c:1323 [inline]
	 usb_suspend_both+0x285/0x1040 drivers/usb/core/driver.c:1446
	 usb_runtime_suspend+0x58/0x110 drivers/usb/core/driver.c:2000
	 rpm_callback drivers/base/power/runtime.c:460 [inline]
	 rpm_suspend+0x8a0/0x17a0 drivers/base/power/runtime.c:698
	 pm_runtime_work+0x132/0x1b0 drivers/base/power/runtime.c
	 </TASK>

rmi_disable_irq() and rmi_enable_irq(), reached a few lines further on,
look the driver data up the same way and then take
&data->enabled_mutex, so they would fault too.

There is nothing to suspend or resume before the driver has bound, so
return success early while the driver data is not there yet.

Fixes: 2b6a321da9a2 ("Input: synaptics-rmi4 - add support for Synaptics RMI4 devices")
Reported-by: syzbot+09103639e39c989e3ed3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=09103639e39c989e3ed3
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/input/rmi4/rmi_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 5d49a9021c7d..cff9209ec0b3 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -991,6 +991,14 @@ int rmi_driver_suspend(struct rmi_device *rmi_dev, bool enable_wake)
 {
 	int retval;
 
+	/*
+	 * The transport driver registers rmi_dev before this driver has bound
+	 * to it, so a PM transition can reach here while the driver data does
+	 * not exist yet. There is nothing to suspend in that case.
+	 */
+	if (!dev_get_drvdata(&rmi_dev->dev))
+		return 0;
+
 	retval = rmi_suspend_functions(rmi_dev);
 	if (retval)
 		dev_warn(&rmi_dev->dev, "Failed to suspend functions: %d\n",
@@ -1005,6 +1013,9 @@ int rmi_driver_resume(struct rmi_device *rmi_dev, bool clear_wake)
 {
 	int retval;
 
+	if (!dev_get_drvdata(&rmi_dev->dev))
+		return 0;
+
 	rmi_enable_irq(rmi_dev, clear_wake);
 
 	retval = rmi_resume_functions(rmi_dev);
-- 
2.55.0.windows.5

