Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB5954A7FC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875407; cv=none; b=DegpwemBwhpTH65EXdqVi1UB4gMqlz48rYg5/fJHOA6Evi8Y9803J+5UTCowxYmSGQ4Rw0JDQdzck5vIFyKMSJHVO/u6EjCE59YnUcaWBECwsTFp4zJSkYv4denB3aQ0NzeYidrii4D5vnqHX+zH3VUxkko19veCV9ntI5aKxo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875407; c=relaxed/simple;
	bh=ar+43dOz2VmIYxEzbU/l1wzEmSyVzI2Ez00niz1s1oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaL5BYwDR4EN08vwi+IC7qsPLRfFC6Y2At5/mvQt1Fs6RYjfBx28CrGEL9Ncyrfqt8rHiL4EXhExwdI7aWND8yKloP+HUADh9qXlc91ScY+YqTUqLPrbc/FPwKjpe1jPWReg5lp0TRgY+kpOzDs1DUHiCuVcd2nly/bgpHX3Fc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY6rLeTc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY6rLeTc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso44973135e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788875399; x=1789480199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwxOcnlvcy9U0HQiJwkZMzbvB1txUIVhCVffQoriU+0=;
        b=BY6rLeTcGX80rOeajVwyXLN41Xcnj81oMvb07r1CEN0QEnEYwATqX0MbTe7zL2He2k
         2niDN40DprTmDlPtcrOk+mVu14M/RTb9jiY6JMR08b2xqIrFqyjmvHFoTwNMA2HEcWsE
         CBHKTFz+n2bJS/EExgqTJYNQ+JcUKuW+COCupeU3CWOvLjDxMHR5C3cAKV4TxjAzJjIR
         udra7JtfL4l+d46U09DxwFYzg/y+uYnS3JUIBVVxgjP+dap1dA0YNn8waUZFuwyI3uLS
         tMRU+98AHGtubjM9sqySAw17VQn+kKrOhqpGAJ2EFdVEktHCBf5GnLT/ia2soq++dx65
         Dkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875399; x=1789480199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwxOcnlvcy9U0HQiJwkZMzbvB1txUIVhCVffQoriU+0=;
        b=PzTEoAviNG+pE3wStNscZvomEhJRI1FI895I0sgGAMWyVTfmuosWeRgxiIIXAa59cL
         vukRwmpAPuskuCicQQYYxnjehKA1deE+s0BAQF6TBbl/aYsWtyk60CdtR/pnkENxNG5z
         1zQJH26XUyuS7jlCg33XvaO8bSMh6vEMY/lBXxxRDnISukTTvBx0fEGqdQw3/hXwH28N
         UkKGyuxnXB/3JZU5kQBiM6h+ottCd82zPwT7Y1/ijA0AM9mefznLV9+DwI3NergYrUTy
         js+07apgK7f3DWUNEU7wLCU34zp+GPYCH+sz1gvKDAuIHkBROq8bUXCNIkSEmYsmGHoo
         QIow==
X-Forwarded-Encrypted: i=1; AKwUvBwSi88nO4efO1VIDoC/6Ly/IwcYxyiB4SiUP5QUSqS86dypgWyL3O/k4Pt8ELsxcpKtVAlvj6aUyRB5VWU=@vger.kernel.org
X-Gm-Message-State: AFuF++lBSQaHzQrYwF5g4qsu5yUBVvioXZ/CwQUeqBw2enRtctmGPVrW
	VTv/nERqugUkk63WthGc068j2lfWPrzCukzQw2yt3GHoFfRhm7miWKXb
X-Gm-Gg: AYBFou3EoL/h6NBTZq2Ldl3t5oKzA9G7IlNTPKi9E4vhr6IgERHwTPmnsJYEyATxI7V
	igLIQnD0qFrKlb+pIwOht0Tmqdu6oWl8ygCYo2KQXbBgrWA70kuE36gltYxQp1ieQHKxmZOvn71
	WvAYGHo75EF74P1POgN18Ia6gQW20GGAC+QTKJQF/dy5/JiJi+OzEj26B5g3Xzlnn+jO424LUye
	PSoLKrVzmRQ3YOZWzWU6PZ3Tc35QRIrMwX9i8WiQYSELuwyFc2bRAtsNBABRKU16YPhnkxEW2Wi
	lwv0Y/j3fB8pGo36stXk1sjxH/DBiVD/ad6lzwDIgfJNOQlLxvnnFMbI5ExGyDcwpND8+uiCGQv
	/tGK3sydAIBKvGUy8nKoXBnDE+RVOH+qSfjT0QvcTbl4GZPgAuHwE02y/R4kZnggayjH1GrZx1u
	wwQSw4wdpEKpxOvwkk+DDtWjG/pynK+r4hLy2q02GgdFdyENJPN8DtVpQLuRRlOcrwNZ1MHvE5w
	snCc+JXc0JoLRQwZgPiJJIY6QqAX1hH
X-Received: by 2002:a7b:cc91:0:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49cffa00196mr188444915e9.6.1788875399076;
        Tue, 08 Sep 2026 06:49:59 -0700 (PDT)
Received: from LS-Tayyab-Farooq.dreambig.corp ([125.209.88.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm389144795e9.12.2026.09.08.06.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:49:58 -0700 (PDT)
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nobuo Iwata <nobuo.iwata@fujixerox.co.jp>,
	linux-usb@vger.kernel.org (open list:USB OVER IP DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>,
	syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] usbip: fix use-after-free in usbip_stop_eh()
Date: Tue,  8 Sep 2026 18:49:02 +0500
Message-ID: <20260908134914.3169-1-syedtayyabfarooq08@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During device teardown (e.g. when unbinding a device), vhci_stop()
calls usbip_stop_eh() to wait for the event_handler workqueue to
finish processing shutdown events. usbip_stop_eh() uses
wait_event_interruptible(), so if the user-space process triggering
the teardown receives a signal, the wait is aborted immediately.

Since the return value is ignored, the teardown path proceeds to
free the vhci_hcd (and the embedded usbip_device) while the
event_handler is still actively using it, resulting in a
use-after-free:

  BUG: KASAN: slab-use-after-free in vhci_shutdown_connection

Fix this by switching to the uninterruptible wait_event(), so the
wait cannot be short-circuited by a signal and always completes
after the event handler has finished processing pending events for
this device.

Reported-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=31117fde582fe6a0cd62
Fixes: bb7871ad99ea ("usbip: event handler as one thread")
Cc: stable@vger.kernel.org
Signed-off-by: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
---
 drivers/usb/usbip/usbip_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
index 0e00c2d000f8..81d761891184 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -115,7 +115,7 @@ void usbip_stop_eh(struct usbip_device *ud)
 	if (pending)
 		usbip_dbg_eh("usbip_eh waiting completion %lx\n", pending);
 
-	wait_event_interruptible(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
+	wait_event(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
 	usbip_dbg_eh("usbip_eh has stopped\n");
 }
 EXPORT_SYMBOL_GPL(usbip_stop_eh);
-- 
2.43.0

