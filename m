Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792953016;
	b=b8Ge78/1A9k7ORj1lxhj5W6VfGxl5EGhTM+ys1L/6b46ftl65qyhtj+waNFLv+E+2DpI
	 dCAv9y6c+WNUrxV39FCSc2YlcPEY3OiU0SLqvVfvxsj9LIbWTjCrtSpqlMxNRXmTGoIvg
	 E3wAakENzKRKHs89oDqqf/qjWGeVaMKij9Y3E4e/XE5nK6bJUUPWNL7cIxrEM7Da8xHJ9
	 zh56iGJJOsp19pvI+KVwPDyewmiWeXUx8yKBB2CuNAmTDpzd42H0DHbo1Lp5Bc+tJ/fd7
	 q+7kjYG2+IpTswmz9tVqXa1/6ObWVysTD8UPcWyTVuPzOkzlyP7vMetywIh9t+3ThWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792953016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4yTQMZKVmBBPdnd9MRcEWkaiWNGT4VcjDMEsuPPfO4c=;
	b=QQXqcTtpfVTLnhuwEiiHRk4W+OssV38oU2dA/uwmza3FapLL6D0wJt64vWLcIquJ+6lJ
	 1jsHRcEMzkHoiLIqQ7c9jECaSXTYsJ4g1OOiECeIn1QAlnU2gvsyCaoiMxptY7r/5INUZ
	 uG2ipkTdvMwaDpa7PgOKUGgKCHtyoQb6f4FU838v3Fh8/u1I7yNlI186qPKGfgrpJC74C
	 EgwSyMV08pSI3ENM6A5vYGevhpHh6nK2mVbeg4i9a+MHKYD4iuXtsRRTqEUQFZRbbzKwM
	 NACpToIDhnFYVXKmm6146Tds1dKxQHX+2bNtdHKgoKqsBkpz28bvHsStSipPgxh0P1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="T8h8F2/X";
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F9606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 561F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T8h8F2/X
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e948e56af3so1095736e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792953015; x=1793557815; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yTQMZKVmBBPdnd9MRcEWkaiWNGT4VcjDMEsuPPfO4c=;
        b=T8h8F2/XQyT8AWYtYXDESRHSIOrdBRK8HJz+dlCWSAqquhWHZcDqnCAAnXumpa2m7S
         0+wU6gSVeQW+lU5NnfLwbXxpUTbYlBOyNRa2f2Fc5TjU+zHRUAa4WBtrfYfMYTr45Ibe
         9f1b3U8DnFSkckw8j+EgMpr/O787iAy1t20gmXi8UMSDrotNmrb9n4ZT+rG+e49+sP3i
         9Pt0KSNRUJoKGIAAlSvqi3eSD9by5T1eNc+3FcgW6OGkrR25hZxVAaCG5w/S2tSDFod1
         U9unGQ/jo63EOy5KjLQdLY2Q8OvYFlIMgiZH5qExtGDeYoWbXawkabTjZ57zEjsLjORo
         dJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792953015; x=1793557815;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yTQMZKVmBBPdnd9MRcEWkaiWNGT4VcjDMEsuPPfO4c=;
        b=aTfukewX5qR6JDaqjzesgN7I3P9KpAhbCRvdtG0NbGbd4wp3ExJygu5XNWvfZkfUjo
         rGs8qVsQdjLvgQfKkMnDewlQVoe0f9HzPPqXnLsoCRfI0imcKU2CY/smwiGR152yHyar
         pWfcQfFuwEH69l37GUzqknvleZiCAxidCK3GviL1AgtNVoSMomqRJY41JJceZHCnXWLQ
         yfp8G62XwFKco5Ob9Gijy8OWfm3ayVBM+j1/Tv5DTQciyNFsr7lFYWikx49ZghXL+ND6
         RukctHFJ/5w/Wd+DHDGCbIewH/w1R9cpAwndacpJSf2aFn9bSnxu/4s1snLxbFzB/r5z
         Zh/g==
X-Gm-Message-State: AFq9FYKv0GM3ykYfeeOOZJbG92Ilsdu9AVfImD4Lvgr09YX/ZaLE+pep
	xnWV50v4zC7jxL4hZntQgDtdqUIXXIimyua4HrsfwmswsWewDHXAkYfO
X-Gm-Gg: AYBFou1iECOn5v0n7AxcdsI8U5utRck+xU3AyMckETGjYC4h087zCgjmbEyOiZp3kUz
	HHPkv8kTnB8cOl5Khw9D7NTt42UowPxNX1UlZgPfgaOTAzyPKRs6OM2KQlgZLjYT+COGq0prhA+
	jwM069uUvvVbufQTDnSVjBB91+DOlsxVlRqLwiKpzU4gxTsg9aQg1TLY9oYHY76Ug3XwG7mVfzD
	3H88owGdiksqSM0fh7DNH+zEMeT79fW5FiKq6V7UJMNzA7XnRJ8zA/hlR95ryfcFhWzgf3Vz6Vm
	1Mj0svwq9v3EKEMi2tscHo1PiyrwuNSx7svxMF5SaXzd+jSpQMrDpHJpzuIstuaP7x3rVr/ISBY
	l+Q9jNZUiHnpgFGqsXtik1FuBhRkJSkDrXewdjQ/Mm2O1X53UuFs2EpcnzFuq6Xily/gQoOgmeG
	ElKWjmTBsvP+/qN08CLqHX0BHT6nF/z9ydxqJQ7Vm4JlOOajtgnX6IoEAv1Xm8SOrUTISODTKVK
	DhtuxgdVU22o9OxttJciihfXU1qwBTZ16fm3yeoFEsB9niRo/ix6QA0uvfzQhwmVH8pXGRPXLbA
	JvF3W5pU32X5fsQvt31pM0kY77GOgasRC512+2KcEmhHReQz2RKfseNOUVuc/JKB1DPIWrb/Rwv
	MCbTxe4AlmYCfie2NkluLUzBUPszqZIjpJgSPiXb5Sg==
X-Received: by 2002:a05:6122:4d05:b0:5ea:b9b5:8c43 with SMTP id 71dfb90a1353d-5ec2328fe56mr1522596e0c.18.1792953015312;
        Sun, 25 Oct 2026 11:30:15 -0700 (PDT)
Received: from c.1.0.f.7.a.5.f.d.4.6.5.7.e.5.4.d.7.3.9.0.c.2.a.3.b.1.0.4.0.8.2.ip6.arpa ([2804:1b3:a2c0:937d:e94c:8101:376c:4b55])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234618c9sm6011011e0c.11.2026.10.25.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:30:14 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] misc: issei: hold a task reference across kthread_stop()
Date: Sun, 25 Oct 2026 15:30:11 -0300
Message-ID: <179295301147.11811.8659707428463039283@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

issei_process_thread() returns on its own once it sees power_down
after the final reset:

	ret = issei_reset(idev);
	if (idev->power_down) {
		dev_dbg(&idev->dev, "Powering down\n");
		return 0;
	}

issei_stop() sets power_down, waits up to ISSEI_STOP_TIMEOUT_MSEC for
rst_state to become ISSEI_RST_STATE_DISABLED and then calls
kthread_stop() on idev->process_thread. Nothing holds a reference to
that task, so after the thread has exited its task_struct can be freed
before or while kthread_stop() uses it. The kthread_stop() kerneldoc
covers this case: if threadfn() may call kthread_exit() itself, the
caller must ensure task_struct can't go away. The result is a
use-after-free of the task_struct and of the struct kthread that
free_task() releases with it, both of which kthread_stop() touches.

On a normal power down, issei_reset() sets ISSEI_RST_STATE_DISABLED
and the thread returns right after, so its exit races with the
kthread_stop() call in issei_stop(). If hw_reset() fails during power
down, issei_reset() returns before setting ISSEI_RST_STATE_DISABLED,
the thread still returns, and issei_stop() waits the full timeout
before calling kthread_stop() on a thread that exited long before.

issei_stop() is called from the PCI shutdown, remove and system
suspend paths.

Take a reference right after kthread_run() and drop it with
kthread_stop_put().

Fixes: 7bd4b9991db2 ("issei: implement main thread and ham messages")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Not tested on ISSEI hardware, I don't have a Lunar Lake or later
machine. Build-tested with W=1 (x86_64, INTEL_SSEI=m,
INTEL_SSEI_HW_HECI=m), clean.

To check the kthread side, I used a small test module that models
issei_stop(): the thread returns on its own, the caller waits 500ms
and then calls kthread_stop(). On a KASAN kernel this gives
"slab-use-after-free in kthread_stop" (the task freed via free_task()
from the RCU callback). With get_task_struct() + kthread_stop_put()
it is clean. With no wait before kthread_stop() I did not hit it in
3 runs, so the normal power down path is a narrow race. I have not
seen the hw_reset() failure case on real hardware.

This also applies on top of "issei: runtime power management, dma
and in-kernel interface" v2, with a one-line context change in the
include block. The thread still returns on power down after that
series.

 drivers/misc/issei/main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/issei/main.c b/drivers/misc/issei/main.c
index 5987fb3402..bea286757c 100644
--- a/drivers/misc/issei/main.c
+++ b/drivers/misc/issei/main.c
@@ -7,6 +7,7 @@
 #include <linux/export.h>
 #include <linux/jiffies.h>
 #include <linux/kthread.h>
+#include <linux/sched/task.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
 
@@ -269,6 +270,8 @@ int issei_start(struct issei_device *idev)
 		dev_err(&idev->dev, "unable to create process thread. ret = %d\n", ret);
 		return ret;
 	}
+	/* the thread can exit on its own on power down, keep it for kthread_stop() */
+	get_task_struct(idev->process_thread);
 
 	issei_poke_process_thread(idev);
 	return 0;
@@ -291,6 +294,6 @@ void issei_stop(struct issei_device *idev)
 	wait_event_timeout(idev->wait_rst_state,
 			   (idev->rst_state == ISSEI_RST_STATE_DISABLED),
 			   msecs_to_jiffies(ISSEI_STOP_TIMEOUT_MSEC));
-	kthread_stop(idev->process_thread);
+	kthread_stop_put(idev->process_thread);
 }
 EXPORT_SYMBOL_GPL(issei_stop);
