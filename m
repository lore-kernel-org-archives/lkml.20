Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A57842124D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109602; cv=none; b=nS+4Q+RaVPzO8LGfVi06oHon3TKnsYtvV8tPRzR0BxlyDbLP6rWS+wvL5tWEjMZic09OZwhPRrfsUG2hLcSmTo53SvXiS7sdMYQsEdQ+GmWisHk9k7IZMeO0LNc0qHyYm3u/cmCaxQa8IkoDNbnyynmQRpmjt5/4dLpQebSnUsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109602; c=relaxed/simple;
	bh=XhMhcu0Ij3BizMpIdVRfd1wxq8Jalk+FNAh6krVwqwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hu6G8Aq8N+aZsnEk2ZBBCbSFAsQZ9vPYlz+n4Oo16yYg2u7qeHr1Gm7XS8Y06Mkwkc4s4FhG32xmC+wT72ziYGRR48d3xG7ysyAI9XdgJVaaA4hzKwR3Dhb4fuTt8DOKN4PV9MoaIwKYAdl/0sV0I1yHBq1j+4v2ZQdSLTDQvE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALrWq9/f; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALrWq9/f"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-917bef0d531so21680036d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791109596; x=1791714396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GmjpMu1lVYAdeEK9QKdXTuQ5b/yeAbWm36UPOAVxQ4=;
        b=ALrWq9/fiIivR0vHuVgvdDPE1KMUfp6VFRihCQjVEBMVLmLN62igHCY2HtPGPRHVmn
         aEeuENKKM32XYXDMVlYRkCRRRREEjaDS27SkXTW79A8vLrpCMINug/VCKaQyjnmzaH8X
         anSyjfUFoqsMSqrqCaesdfJLOjw00dT5Cwv7LyEDMDbBmCrX6YmeNMkBD2lHIunaYGo9
         kP50EWGH7hBhx5llpMtiI4j9ECcWQZ3fZhZSrb96AmQaWKlwtMaoB/3XuMjLJ2pSgeze
         KAWsuuEPzUx0UGJpzebHq135+ntGrmIDBzgmg5gyIj5yGhz47nCL/zdpUxLnsQFuX6LP
         hgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791109596; x=1791714396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GmjpMu1lVYAdeEK9QKdXTuQ5b/yeAbWm36UPOAVxQ4=;
        b=on6iH/rHqezoqX1TMn+8aLVrbfzPTTnns5Veu5sxm/ntPxEGZ/o/JNuGRXA5kzXJt3
         +E+bp0qu1BLfBNAsCvKhQLJpjT2BgvGkh4ofVTe+bFpq2ckY7YY3yJe/hJCrsEkgppGB
         E71Dn+uPx50ocJk0D9GOM35QjIq0IbMbY/POlNKNmTjTvkT/F1maGPR795HMIJGPXkv4
         NQvEb08bso0I0fJfb89xDz14lD/f5goaTJ/hAJVLmGuyNFi64/Nxa6kp71PBJlKOJSvg
         PwqaFqlcH3KjHaR28SBSmfU+e/w3DOCJMqDwlzsfybji722Mqua37EcVA+2WAFL9zEbg
         kalA==
X-Forwarded-Encrypted: i=1; AKwUvBwCr20Bon+jaIBZBNOrWI5kzpsdq4Uc+rmGgHNDjT4VUw/PHjcJTKn8xlmO+NZzZ+qRZ9wP4aJLmgR5MQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYItqZmRcgutXkzARlPzYbkr3pgfxnGlrEaoerFsCL66ki3hnq4g
	tIjOqBnE1g7XDcslU+ziyzvxgCj1u/hb0iPUu32z6Lh6+Bl4C4JIeMwt
X-Gm-Gg: AYBFou0hnHDEtDucjP5Gq9pCXfU5GYJeLaKjBrjpHliGVxmlMlPmTqCqSqO5n4miL39
	JHFL+R0VTTaWrxO/njjl6LoRA0xS7/rWDaqLUiKW96WYn1LgyxRlSayHicpMN2RALYbm/jquP3N
	JqQlW09REJRaZXtksGBNtTieAMa/QuemIHtjLym7tD1JnAIatflssq5lUI0ZYqVL9JMOG89RPml
	Dpy6K2uZYIVOZ81OLbmVTdAYtOkGb61SBBhqgGcqxWq5p/Twfkc7hDMjkVZNKpwtPZ39Oz2qHIm
	qqZouHhxQIwoJ+N4wDJXLf+TIEQXnvXEw7cGUQ3HNHXXMfZtfQylm/UBu/2LU94HpM4+UGTzRph
	Q+V5ZacmB7WnAg2zWEey2oRwhUElL2jllrTEbRvu5MJXez0dePU6gZ7yPcQ7l44Hb9SUJ0DwiW4
	zZzc46Tzw/p192jjPZPO4olttiFKmHo2ge4Dw1UFAYryWgkRS8/kg38oRGLzJIARtA5AEdvbycX
	vgBsys+Qs74TB6rukXOARlTQHEXmL5iYgwC276OyaJtrmtNK3SF/CX8jmGG0w==
X-Received: by 2002:a05:6214:f6c:b0:917:7d92:6486 with SMTP id 6a1803df08f44-917bff43141mr156594696d6.6.1791109596104;
        Sun, 04 Oct 2026 03:26:36 -0700 (PDT)
Received: from Precision-M6500.home.mulloy.xyz ([163.252.155.132])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b1aef0sm63309096d6.12.2026.10.04.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 03:26:35 -0700 (PDT)
From: Joshua Mulloy <joshuamulloy@gmail.com>
To: Alex Dubov <oakad@yahoo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	Joshua Mulloy <joshuamulloy@gmail.com>
Subject: [PATCH] misc: tifm: don't clear dev->driver in tifm_device_remove()
Date: Sun,  4 Oct 2026 06:25:25 -0400
Message-ID: <20261004102525.34356-1-joshuamulloy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tifm_device_remove() sets sock->dev.driver to NULL after calling the
driver's remove() callback. Since commit a995fe1a3aa7 ("rust: driver:
drop device private data post unbind"), device_unbind_cleanup()
dereferences dev->driver after the bus remove() callback has returned,
so removing a card from a TI FlashMedia reader oopses:

  BUG: kernel NULL pointer dereference, address: 0000000000000090
  Workqueue: tifm tifm_7xx1_switch_media [tifm_7xx1]
  RIP: 0010:device_unbind_cleanup+0x16/0xb0
  Call Trace:
   device_release_driver_internal+0x220/0x260
   device_release_driver+0x12/0x20
   bus_remove_device+0xf9/0x1c0
   device_del+0x161/0x3b0
   device_unregister+0x17/0x70
   tifm_7xx1_switch_media.cold+0x6b/0xbd [tifm_7xx1]
   process_one_work+0x1ac/0x3d0
   worker_thread+0x1b8/0x360
   kthread+0xf7/0x130
   ret_from_fork+0x195/0x2a0
   ret_from_fork_asm+0x1a/0x30

The driver core clears dev->driver itself in device_unbind_cleanup(), so
there is no need for the bus code to do it. Remove the assignment.

The problem was found and the fix written with the help of an AI coding
assistant. Tested on a Dell Precision M6500 (TI PCIxx12 FlashMedia,
104c:803b) running a 7.0 kernel: removing an SD card oopsed every time
without the fix; with it, insert, read and remove work.

Fixes: a995fe1a3aa7 ("rust: driver: drop device private data post unbind")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Joshua Mulloy <joshuamulloy@gmail.com>
---
Runtime-tested only on 7.0 (Ubuntu 7.0.0-38), with the patched tifm_core
built as an out-of-tree module; on current mainline it has only been
compile-tested (W=1, no warnings).

memstick_device_remove() in drivers/memstick/core/memstick.c has the same
pattern; a separate patch for it goes to the memstick maintainers. A grep
found no other bus .remove() callbacks that clear dev->driver, but if
you'd rather handle this in device_unbind_cleanup() instead, that would
make both patches unnecessary.

 drivers/misc/tifm_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/tifm_core.c b/drivers/misc/tifm_core.c
index aac8f0933..03d1324bc 100644
--- a/drivers/misc/tifm_core.c
+++ b/drivers/misc/tifm_core.c
@@ -97,7 +97,6 @@ static void tifm_device_remove(struct device *dev)
 		sock->card_event = tifm_dummy_event;
 		sock->data_event = tifm_dummy_event;
 		drv->remove(sock);
-		sock->dev.driver = NULL;
 	}
 
 	put_device(dev);

base-commit: 6addb4f385570ebc11c4eb499a4f1c149f313e84
-- 
2.53.0

