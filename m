Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792473294;
	b=Tlj6himdtjUwU70GyRyUu7xXilAJHYj0z0aCOPxYL11xbfa4Tx1VPAEzaSRWiYSbLw52
	 k+MWQhxAhN6U+CL2IoWoAADdi/5tdoJlDX1JuaEvC4Lh8rdiFKOK5ORx1P3i5YPdkvxQ0
	 yE3Jc4/WwoxIg8wW6G+F2tzBmDEK5whvGEG6wy+ASj89xNp2JjiRFDifPAarUH1eAVWRk
	 kxBgBaxwyixjyziuF/rsi8MLsBq9WiB4EceqG2zDbBj4T/jJBxsc+vLEUsKDS41xT613X
	 Fu5MaE3PIYzLrJxtmDYyVKaY93ooUFX2LURY+ky6czCdBf+tLhmJ8Ic7LT5Ji6x0s6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792473294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TrZLjxuUWkEymBh2PSVn3/lyI3kENtzx2QTXaKgS9MY=;
	b=Z50Axj4HvMdOoqMNes78HcOe6MzuSyyICP1g4Ay0dsvAe0NZvBOAyN8ZrKV2A8YoTctt
	 OopGmGbNK0Rkp2pU8Wx/PUPZYPqI6pwQDd1XDkiuR8xGONoBrskXX5KlqnObAhkqv2cd2
	 GGNsP2fyFqjPmQkJBE5sL8RpyLmPs1R5oq4idSEjzUceAt63C8whI08Ko7m39lYCwTWV2
	 DC8QXKB2xf2wn5JClajp0IuV23a3fsA433XL+sa/dfBMGhQTS71KUwkoZBJoGoE3WLLLN
	 zJcNybVmDoUJmv9/kblCUJQRZwJXKJ2fvF2XonaAdZ+pEXA1D60xZrDMoAIE9vHa5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="pj/U+8sT";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E64606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E64606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pj/U+8sT
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1670090a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792473293; x=1793078093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrZLjxuUWkEymBh2PSVn3/lyI3kENtzx2QTXaKgS9MY=;
        b=pj/U+8sT7PblrBdJkCpGeL6ASX2udgplnUPFcQFKQG3BPcwrOXWHzlHAFPQOJcZJZI
         uNRbdtAb2pIPDl2pyRPQVH9WQLhw91c6oE2QvhkPt7a3ToJmcaSFeZNPwzcaqYE0BT4X
         2CKHmJTb3voGDHNfKyWPzvb+diIMoXnbmzA5ovxp5ESExbdEqQeu1ZL9gnI1qYRTD+dN
         VD4TZm4wJGbuzZpWJA9Vh8lwPexwq5w/2UEBytdfr6ommumrhGiBbFy2XpEwc8DLsnem
         5T5MNWq4sz32gXflMK+dJ0NHSkx9CoocrkMrgA6bVN+ceyTVrC1+giRjTHG4vPZBBc7I
         qBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792473293; x=1793078093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrZLjxuUWkEymBh2PSVn3/lyI3kENtzx2QTXaKgS9MY=;
        b=y264vjk4qCboMONfTrwqqPuMnfAN5fpQ7CDUJJsn+DwKL6W6ADpBriyZGEPph44tqy
         DuBSTdNFKgkRFpHrraIuznhrZFbfXKhmU+ejqg0Un2ia74fTucgV1YVftV/GfIiOxcN5
         yrdoT5z2gepI3rishpzo1/HxU56LWQsc+oYSw57vkQqwdmyBfTNwlFNrMb+UFGWYCSBr
         UHh1HWN/JgwB8dyP5UTAuWHqDZFm4Z0WF0gJV/DvtccuqDmIffD5ipY6SnhlMiAfdJyl
         QnHFedeKv7ECNKlAcvE0Q54y51ZeYzllZY31inVbXfuMc2zAh2JVCxqBpIFOR27J5GDv
         IaQw==
X-Forwarded-Encrypted: i=1; AKwUvByb3XUwyHTl94e8qXv4ao7GlPL8wBX2M4AxqYLkzi/lKosfpIW75QQOvyuiTC1cK6o+LSQHvuNN5+azCjo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+55VQDEmQRVo2ZnchwLg9pkJ4fLFi1nKX6dj1U2b2cE/d5OgB
	01xRhXXamjo4Ron22iLkp2wk1MRpfT++RmzFZBG/hmq6KsDr/fa9yX0z
X-Gm-Gg: AYBFou0eHYSJ6x5GwZEDTarfBCiq9xQ9bkbuRNqEHebeb+m/Ktzr/3QlueMXzd8WT/u
	LUbn2aDOuWeLaNVPEU9sFNFGDF9Ry9CyLU57r7aTYlP8i+WfkzyDCuQGiPlh2R1ADIKufX5yv5j
	di7oHS3kS7GHIQoeVuQPapZYjBT5EwFMjVoH4Ol8gc7+ExBMEm+Qv3WWpX4dXVVmK4uIzs0shsQ
	7gaDduTscWXkCvUHLdnEMZwG80XREVSrSd0rdeP0uQORqGteHlr9UfYsby2jkheHFtJYWaMbQxv
	NS3rCgEcYLQq7YR0vB2l8EYYVBqVGUxnn7OwIaYptT2B8vdISbz6brIef7Pz5mAbawtBkHpc6n6
	xNY78pA+kmdE65BLDMgg0Mm+7+ZfGeOmD7bZuQPWv2raH+TbotfPs2vaDbue3ZBt19CTLDUTEex
	+uhYWfBX8T5VP2Ji9ZZu7e1IMY3uSCanjbI+6+mW5DCjDQBscHeEVqkpsTqviU3k0hmkGN6NIn8
	z6GHX4k704V+G5ISA3vtRLERr5SgDsoUCJ/TZWWFgJJTk/dJKcJEpUjimnA34Andqr/PoFvi2Ru
	Rkd+6C8+O9PhzV4Kwj8XRUKkegK779SX5YQ5zpW2t8rOllJw
X-Received: by 2002:a17:90b:5448:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3acee98db60mr7985189a91.6.1792473292926;
        Mon, 19 Oct 2026 22:14:52 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad64273f6csm1843353a91.15.2026.10.19.22.14.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 22:14:52 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_hid: avoid copy_from_user() under get_report_spinlock
Date: Tue, 20 Oct 2026 15:14:46 +1000
Message-ID: <20261020051446.92179-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_hidg_get_report() copies the userspace report into a freshly allocated
'entry' before taking get_report_spinlock.  When the report id is already
present in the list it then copies the same userspace buffer a second
time into the existing entry, this time while holding get_report_spinlock
(acquired with spin_lock_irqsave()):

	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
	ptr = f_hidg_search_for_report(hidg, report_id);
	if (ptr) {
		if (copy_from_user(&ptr->report_data, buffer,
				sizeof(struct usb_hidg_report))) {

copy_from_user() may fault and sleep, which is not allowed while holding
a spinlock with interrupts disabled:

	BUG: sleeping function called from invalid context at ./include/linux/uaccess.h:169
	in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 3481, name: hidg_getreport
	 __might_fault+0x4d/0x60
	 f_hidg_get_report+0x155/0x310
	 f_hidg_ioctl+0xbd/0xe0
	 __x64_sys_ioctl+0x120/0x170
	 do_syscall_64+0xf9/0x540

This is reached by issuing GADGET_HID_WRITE_GET_REPORT twice for the same
report id (the first call inserts the entry, the second takes the update
path).  On a non-debug kernel a userspace buffer crafted to fault (e.g.
via userfaultfd) would sleep with the spinlock held and interrupts
disabled.

The data has already been copied into 'entry' before the lock is taken,
so reuse it instead of copying from userspace again under the lock.  This
also drops a redundant second read of the user buffer.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d..520892b 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -668,13 +668,7 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 
 	if (ptr) {
 		/* Report already exists in list - update it */
-		if (copy_from_user(&ptr->report_data, buffer,
-				sizeof(struct usb_hidg_report))) {
-			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
-			ERROR(cdev, "copy_from_user error\n");
-			kfree(entry);
-			return -EINVAL;
-		}
+		ptr->report_data = entry->report_data;
 		kfree(entry);
 	} else {
 		/* Report does not exist in list - add it */
-- 
2.43.0

