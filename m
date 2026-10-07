Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355B46C836
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372212; cv=none; b=ZTLs8We4OId3MmwLHuhRQgfP7VKnUnaS63RiPmsyXUuMs0JIgtkSJ2FTpkW2Hgs1noZL1jLpdkfyInZYwUXKzCfxtlwxcDOJ44llm1SjF0TxDJPGEGQFzwfFZ4Dr5wRRhtN68t0udjqqIOO3he0a+LL+6W2d6qgtspLHtiabyd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372212; c=relaxed/simple;
	bh=2hwsUZK4ODMcka/Ebr9sKxEUtV9w7OkXEuWQZ+N18YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBNrAXC2LrZuhpZJ6hcBcPLGRIx38peiXnZvZdn6eneHWApBp3zrtWGQiV5bIpStXxmBLqPwoEIUVi57f/mmi2SM1WeeG/nlLy9bL99ymTSxPzqeVc1z8lbFwZtu6ZJVNT6I+QGE9Nfw4JE5EJFyNry9Kclu0dR0Zo1LMcBpErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9G0JFMD; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9G0JFMD"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-141395927feso2487529c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791372192; x=1791976992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecet2Ly9TeUCYQ0Ys/6vyvxrbNg36mAKtReMuHqWCLU=;
        b=o9G0JFMDoktnW//TtCy7CyHRjmHKEikXiV0zKO62Hl+m0IPcGn1ksVw7YhUgA+s2TS
         R7vRKoZEV2TmLg0PyOdduzDTKj4n5C2VaNuQQ3qnV46vW7SicT2RLJAQVZ7SySLWp8Mt
         aKM6Sm+jPBoyBPg8r2gpx8CnU8hb4dbtvyF4v4OxEyTd2LS+oI6h1tbEojPqJJMU0pmK
         QhmQSNN1Ro2Q1VZlkmFgY//tPPB/bDsw9WiM8lyOnn5EbWpGDAw3bHVR1IlibsDAe6Kp
         lRXFRKnBqCXgRs/NH+dTguRCtdh5YALuMYYrXm7ujZX18VdodEht9TbaRr1iFIhtjdoq
         UgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372192; x=1791976992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ecet2Ly9TeUCYQ0Ys/6vyvxrbNg36mAKtReMuHqWCLU=;
        b=w48i1hJJa9gmgzm1IygN9QmrHYi+cLRdNa/Grs8X6WsLAX+kFcJV1RrUvR1wO6S4hR
         0oCqcHL4/V++nIpGvgf9QOjPGGZtCaZyS/AAM7VHZJICTb2QbsUozHs6qD4Lyw1mgRom
         XzB5F7qOPzrKGQ7Cp2UeUEtHCilQpMB515IKBYJ91d9oBiLmqsDLHsG70A2TSe5nHCRh
         +eTmqvbWFJuWDfYhZbPYYyGZU7U6v/5G6df0dvZ9wL5ioRP1oSFK/Qx9nRPgSyt8enrt
         ylGOIlZNNIeYcvK9OFY/aX9jKjXFlsPa2rZL+qcTbW7c4Tz58P0fRXlU0CIrAx3VcScK
         aaqw==
X-Forwarded-Encrypted: i=1; AKwUvBw6zOrSizDH7rtbxjgGMGhrGasfgvp3RVvM2SbK2E6nkIvxzqoXOiGT79FW5GDrPBWREq0SjvmNuaoD5Xo=@vger.kernel.org
X-Gm-Message-State: AFuF++lInxxDXbEBsyI+IY0cOLRZUqOclDQkbqSf5qTor6NqXzCa1gz0
	2ZyrSLxfJEa3j1COHeJ+WhdweQSLYMQP5t0vY3PAXFyFDE9RtMjdTjd2
X-Gm-Gg: AYBFou0GDw5IK9BKrVdXyVbTJGe564A2rtMO552tKNL6REuXJXPUNBpKclc3ySApShR
	J7eGqqwU8tCPl1RjABvh8qRvd79TsdflrRVB8vgOXoKdf/eJgcXcf3+ZzuLWyQk8fw8j+1f338J
	CMePPHcZJg/arEP56mI1DOI/kXFtowbWHpXyVYIZkwZ0iS8HxOLk3DxlfqzUz7ejL+tt/qg7gXM
	TYnfThwZxfTRcQRsCCgYHqQW2v4cfruXNAovBC4X2vAA8t3JkPjWWGymN1B+PAbbhsGii+AL831
	4mvK4h7CJrcqYeAvOmBC3fR0TirlsM7gJdtyyWyz1seWF1Y3H1RphA9av6OsAL6uSO8fBLCVOw7
	206LmbBivL0hDHL6QNl5Rx92ulUXswjHOLW/FqJeyKnUd8YF8WDGW6bfexXAv8KsV74FDaByShz
	leRmQFDD6MmLmcwasqg/gT9SEDdgDE2XJTteQrCQjrLPXr7Can8Bfmx4n3lsqc1Sj2z9Y9vBkzH
	kYQJuBs0zEC/BONu7ukQw==
X-Received: by 2002:a05:701b:2616:b0:13e:6efa:78f7 with SMTP id a92af1059eb24-162044bfdf4mr1689134c88.15.1791372191642;
        Wed, 07 Oct 2026 04:23:11 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.133.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16352800ed6sm3234698c88.9.2026.10.07.04.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:23:10 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Duoming Zhou <duoming@zju.edu.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+d627b1495de0e851be32@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] media: siano: initialise the urb work once, not on every completion
Date: Wed,  7 Oct 2026 16:52:57 +0530
Message-ID: <20261007112257.1888-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261006124545.1778-1-yogeshgaur.83@gmail.com/>
References: <20261006124545.1778-1-yogeshgaur.83@gmail.com/>
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
Closes: https://syzkaller.appspot.com/bug?extid=d627b1495de0e851be32
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
Built with W=1 only; not runtime-tested.

v2: Added Closes by
v1: https://lore.kernel.org/all/20261006124545.1778-1-yogeshgaur.83@gmail.com/

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

