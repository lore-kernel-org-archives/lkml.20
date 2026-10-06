Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DBE3EC683
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290776; cv=none; b=MsTHVCrqrxmxUrXMbwN/O4bX8MPIDY8Gc2HZhVVkEoc7r93XNSSNMu6hqrFdP9esuws5GvcBTLp5Q0H8Qg+22Hh+P9QDyvQ6EcfwGXyobYy+TIDIdumfdCjNFlRoUqhawqpFdYQhKwo85bFfxhGqctfaSf3qjpusw5V7WKUse28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290776; c=relaxed/simple;
	bh=4EwkUTqxC5Uts/rcG3ZaV8UEts32S3lMvIUHgcMGsRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CL5J6b+ZpFYAEGH/Sov3ytBZCsV2Z0RRlrw69QWe6uZt4+u5/ZZkuAygrIOmS1BOZBU77ILJdE4tI49luaUievF6UQx0QpBE5s69xlDLA1rhFhtREjk0OfNc6eM0k7vZ4K/hACDvMAWCqjTJqZjyDS2F8fwpTXGTgLL1osYlfQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0MCuzNd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0MCuzNd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e2d4cf3668so4735865ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791290762; x=1791895562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YaXlr/yPmfkUIqnSLYGFyg6IcacgTfFI6Bnanq/Mm1U=;
        b=Q0MCuzNdwYp3hH66haF9SfMjiB+5XKf7v9VvTL6GFlfuk0qZQJEf9ifXKJjAu2LCbj
         fa/BxavgqAduaKSmo0EQD4owIcVcC2oWWmEty+A20akcjTGE7xh/6IC9pcMhvu+orhV+
         D5XBhldpnnWwPvMfhB/8xWniQNR+cM6fWGRtzNqx/T4pbzQAWMWEBC3jHAS8BYQ/oaEg
         /zZP3clHqs9EFicrnNptE4xyFiczWadSeulEUfgChmb1CceL6NEIObU5TfBA+m3FGRR1
         axP6smYeXleDhFGxrXdsJ1CkVMGEfDZskjDM3SjnIVbniQx/zUF+KfkAUvSKBYNvhNBV
         gn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290762; x=1791895562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YaXlr/yPmfkUIqnSLYGFyg6IcacgTfFI6Bnanq/Mm1U=;
        b=d/XPW21EKgsSfEVhX7OiuZL4lOVTxcW+iVzyAsMQlygqpv0nmfRmSSMXzpRJIaHzKk
         98ujXq99XRKXE71Y+3t1hmsnj2CSDSxeU8col5/uyCtNp02gW2QhaVAMIjHtWtWFngGM
         xR/aXUR+7kdQ5WMFG+hM0o1CgShPYhNP7L1mPMy14IiB04s6faAxZMEnk147XGCXEk9m
         VyRyHpoLRMqOYdtZkwETt7LdtLegNoNDCt7Rd5eL0I87ObbKaIQBecnEANUMn7kKGsZG
         qTN1oLXBNsvZweOrvE7JfQbk+62BSQ19fmBVKi5AjR2NymjdvJc3QFC52eT7+Y8LWf80
         T/6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzWG1/DkH1TG/n8OBCzFQfCUgsotCnWiF0R4M4gWoZ0vOVHBLs5+olCqNs+Z+FxbLLiwQjh5KDuz53G+pY=@vger.kernel.org
X-Gm-Message-State: AFq9FYICCp40Hq81P0hdrd/D4DpKs0OtIXIZx0YuzHiBNBeQbo2loM6f
	OBTyAPtwg8BLce7foRUM9aXPqTIJ1YtHG4jxL8WaSEqqRYhf/MnmdvsMyhsZR1BvpryoQA==
X-Gm-Gg: AYBFou2i8YlaZWvBtTRXlJ8vEEY9/G5NZxa9hTrb1MXvCO/givk/rYrgHOOBma1Vkvp
	MoAca7+gsmxEZeYKumAhIgchOEBrMQ3+vTnYzG5iTyMzAl+ErjW5K8ItIIuyFgDmwaiDDtqRy22
	CsmGCjKhDC22JIn6hyDFw1ZAoV/7gLEp4+SyImsDlpP6QCkoj3Ut4/CAROSSfnmYdI+MxmyjpQN
	XfGTOGqGmXnRQsyDKAW+kmiijUanI078jD2CyfLuUVQmP1ZeKdf+R/h8aemKAxbgusE/ATQVdtM
	U+/NXVYeb4iRKfI9Q0kPborLRMmn56rDuisVs7he8EyBB4B/kyGqXEVyN3XJw3GhqufNvvNR6CU
	QFhE1TFxUzeGXwnp5up2jMNXo9Z6Aul2M6NKf5D70H+U+mrvW9Q/q+oZy8t+3F7D0C20xZjvm+k
	3mpnlPLxcmffMU1q0A8FPxqpxHQQ+2cCqmYmav0LumZ6tbnsmCSiLG2FW+vGAwSas60yyoWOYba
	nfZuecKekGzXAqbNw==
X-Received: by 2002:a17:903:4685:b0:2df:5967:8eb4 with SMTP id d9443c01a7336-2e5dcda69ccmr12590655ad.41.1791290761607;
        Tue, 06 Oct 2026 05:46:01 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([2401:4900:900c:ec20:d139:f8fd:7043:7eb2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5eb9254sm21240175ad.36.2026.10.06.05.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:46:01 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Duoming Zhou <duoming@zju.edu.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] media: siano: initialise the urb work once, not on every completion
Date: Tue,  6 Oct 2026 18:15:44 +0530
Message-ID: <20261006124545.1778-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smsusb_onresponse() re-runs INIT_WORK() on surb->wq every time an URB
completes, right before scheduling it.  INIT_WORK() resets work->data,
which is where the workqueue keeps the work's state, including the
"being cancelled" mark that cancel_work_sync() sets while it waits.

smsusb_stop_streaming() kills the URB and then cancels the work.  If
do_submit_urb() is running at that point it can resubmit the URB, and
if that URB completes during the cancel, smsusb_onresponse()
re-initialises the work, wiping the cancel mark, and queues it again.
__flush_work() then finds a queued work where it expects an idle one:

  smsusb:smsusb_init_device: smscore_start_device(...) failed
  data & WORK_STRUCT_PWQ
  WARNING: kernel/workqueue.c:4425 at __flush_work+0xc8f/0xd70 kernel/workqueue.c:4425
   __cancel_work_sync+0xbf/0x110 kernel/workqueue.c:4568
   smsusb_stop_streaming drivers/media/usb/siano/smsusb.c:183 [inline]
   smsusb_term_device+0xdd/0x3d0 drivers/media/usb/siano/smsusb.c:345
   smsusb_init_device drivers/media/usb/siano/smsusb.c:497 [inline]
   smsusb_probe+0x1aba/0x2280 drivers/media/usb/siano/smsusb.c:575

Initialise each work item once, next to the URB it resubmits, and only
schedule it from the completion handler.  smsusb_stop_streaming() keeps
its wq.func check, which still skips the URBs that were never set up
when smsusb_init_device() fails early.

Fixes: ebad8e731c1c ("media: usb: siano: Fix use after free bugs caused by do_submit_urb")
Reported-by: syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
Built with W=1 only; not runtime-tested.

 drivers/media/usb/siano/smsusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e0950b7..210c323c8232 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -143,7 +143,6 @@ static void smsusb_onresponse(struct urb *urb)
 
 
 exit_and_resubmit:
-	INIT_WORK(&surb->wq, do_submit_urb);
 	schedule_work(&surb->wq);
 }
 
@@ -468,6 +467,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	/* initialize urbs */
 	for (i = 0; i < MAX_URBS; i++) {
 		dev->surbs[i].dev = dev;
+		INIT_WORK(&dev->surbs[i].wq, do_submit_urb);
 		dev->surbs[i].urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!dev->surbs[i].urb)
 			goto err_unregister_device;
-- 
2.55.0.windows.5

