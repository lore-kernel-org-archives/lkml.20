Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815828;
	b=njNizx770uEJaX8cGaNgAmiUAQHPcY+QSDvu2iSaJZonAx5wkv1xaAnu/gjitPuUlRZ8
	 L4Dx5ciFNryKM6qYzl8wzicEofBegiTHUi1YPBMrRWvDwPTpjZqlh6MChaM1JREpBICWq
	 c2KKyF/fhm+A7yz1FACSkA77N+v9ElX/6EDK/00EJEFWkB84amp+UQN7yqdImFQF/mUSU
	 T58M6Kvra0Tw9cmE80jy/8H+Pv3+WiVx6aiHNNGXndnZoIcFj7nHUTGyOK4RSO5W1xxal
	 +fmlzcuh33YU/Bmist33bYTUaem6r65+rvk6AmqRIwa6NO+cRvsm9XurMmQMXmPPgNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=A7v3iQvYpOI1vlkhEubPLkV9x5gOZiQT5f5VIsmNMyk=;
	b=n5wVRIXr8J9LQbGW0LB1EfzjB3eS9EtCsuiYYlb/myLoMesz12y0bgHryhfivA3c4axK
	 aT6FWLaCKheL/laxnzEHGHg03WrcQb1hz4WDuLpGATPwOZXXCpWJButvMMH+cN1XtOMu5
	 vO1lGRF8cJYJRz0tN1BVv3RoZpfc/twIYzHpVZ/JhHoaP1t2g2tV/Sc98kWc7xrtH/n5Y
	 h9R2mkBN0XUMO2AuUCWb/14rJVo9H8Lf/mGvBRsBb16NV+hM16/CWysJbEAGspnrlnEkD
	 7VWvukV8FczxFg7Q1fHsEbfA/maaipHvUb3ORT2vQTSeEfl0X75Y5sGotahyPwbd7XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=glD74pUq;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C43606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=glD74pUq
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-823b938464fso1047632a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792815827; x=1793420627; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A7v3iQvYpOI1vlkhEubPLkV9x5gOZiQT5f5VIsmNMyk=;
        b=glD74pUqbkxWRdZnLCx3z60ZiLGN9SkQ82qloBuEp8QYlM9I7Z4/ghs9839ux9Sim3
         h0x6oKvoaSA4mG3EEKuJforRNNCa/VCIJRfUg4fip1q/XJjedlIbwt9+O7/v3W6Hx2Fv
         Xj53HOLbRTTSBbLjHxHRAVakPg/OnQ4nojy3sR3QdukG2RLNbQgZE4Bg5vpB0GXc4Fz0
         Itjqsu8/z5wrMYZVe8Zw0IrKFrK1EBeBou0i5LOCh0K4OP+tRB8i4BNeqzvOZ8Xe9rNM
         7w/tXHYufggjje0ugsQLs4fklpm0wiU1/IRjuY1nPvsp9Dx7hYHvrGowt/vmoMwWl9W4
         mYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815827; x=1793420627;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A7v3iQvYpOI1vlkhEubPLkV9x5gOZiQT5f5VIsmNMyk=;
        b=m5M55WvSEcgo2J2x1zxkvokKhx5ub88G3S8zsn9c1k/cJcRGLLhpMWd2YU0ZLyicE1
         4qj+of/sOT8+fTSHdIvKP4ZB9uB8owGrKHtD4Rj+gDEx6qS1w1HvSGFaZQGSdWctcThp
         JvgJ5L8ncMRq4ldpP4/4fa2UWTP/u/msiZSZNvapHE7BC+KOpQ/20oUhFX7AtPNpNQ1Q
         KiAj1Tkkod4w5TarBrfP7CDiU2d7HBjYt1rbb4g6391bRgz0FG+FFwtQ7d+Av4aUSGw6
         kpkkjOEf62RuSBTe1juzGAV0ed7TVkfzeVxjSiix8znjqLrLoCx2WJ041zwhQW8LDaZn
         BZdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVbQC0pFlAMjfGnvh6gxMOMAWK9cIkELKeNSdGGpmXvSweJRonnIOVBEJi5T9XKNyqCKGW/CpVD5CTCsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGJISpFGATSjlYobteCHtNY2uvEtvk4Z23YIRoa5L8IrwAYn7I
	3LgKGUgw6btjoKWNWAqy/vQonA1aFQ87cj/NH2CgeLGT2w4/+SD0yd+6
X-Gm-Gg: AYBFou0x5An0RPGUViMBklkKBVeJMFY8cwYZ+9+Ws93r82biujykTphaAXAD+qoFuFa
	4wp/UN0lGqzyEXs/q3kX76UzHssYFAlDNHL9XN5v81ykKLd2McwaU3ZSJM/vxth8B+9Ywvb7pHZ
	dvr8VvwmSvFGci+PofzsbzdAR6D6t23ViPS97UE8c+D4w180Cqq1rrJi+2MofEFDOHEzz3vUOss
	H1mPwXTL3XgJwhKKYjuPcwPhfYIOogPHJqtGoU8lUFAS6qi1hSBJ0nLbTDM3hg5aEfoH10yPsCr
	iyo7yq9m232bUyWp0pzzXY1+W7v01jRnF9LqV48CfdbDGXsYP2IFyxzJrvTltYfAQmwl4j7QMe0
	OVAYrrhnk5eXR0umjBOW4yZ7Josdq7oQhwkYK1HVlIcxSW8qIHtxT/KKd4L0RufJjmBvFr/hAC/
	yLozaTouXpHKoxavI8Z7U3kmKnc1kvg0AWfRCaQZ7swLQ7eAu/AH51XI+lJFc4a4I/xYsELkv0k
	nDCrQTaW1bfBrMPcu+3+CM0t5CchzBT6rCVhdRVmiTNqYkPRJGj9yW5RzQrHdky0PVAIQg7l4uR
	rsNI60Bsvpf9TW76L79bT1eXxfU+xO8mDSvKEmlxeNRQgK0LD4/OjwBCgvCn4io6tlUjlk9IEso
	Q9fZKAMq5BeUCXxCmoNb6AxMBn9eNLgmO5kbn6a82otx+UG7b0LpbvAJ/n82PylI9u/SZv3ZRZw
	2i6u3R
X-Received: by 2002:a05:6808:e89:b0:539:a2c2:aba3 with SMTP id 5614622812f47-55c00366527mr677126b6e.52.1792815827190;
        Fri, 23 Oct 2026 21:23:47 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c040806a7sm691649b6e.2.2026.10.23.21.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:23:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 22:23:44 -0600
Subject: [PATCH] Input: serport - defer write wakeups to a worker
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-serport-write-wakeup-v1-v1-1-74e7311638a2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw7DIAxErxJ5XauQSln0KlUXEEzjfggykESKc
 vdCu3yjmTc7JBKmBNduB6GFE8+hgj51ME4mPAjZVYZe9YNW/QVTsR/OWGdxloyrcCZczYtKxEW
 jts5ppQZvvIEqiUKet9/B7f7nanjSmJu1NaxJhFZMGKcWcYgln/0s+OZQEhzHF6qWmPqkAAAA
X-Change-ID: 20261023-submit-serport-write-wakeup-v1-1bdd1006fafa
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

UART drivers can invoke the line discipline's write_wakeup() callback with
their port lock held. serport forwards the notification directly to the
serio driver. I-Force's callback can transmit a queued packet through
serio_write(), which calls back into uart_write() and tries to acquire the
same port lock. A notification after I-Force queues a packet but before it
sets IFORCE_XMIT_RUNNING can therefore deadlock.

Defer the serio notification to a work item, as required for transmitting
from a line discipline's write-wakeup path. Keep the SERPORT_ACTIVE check
and callback under serport->lock to serialize with serio close. Cancel the
work before freeing serport in line-discipline close, where the TTY layer
has already excluded further line-discipline callbacks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/input/serio/serport.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/serport.c b/drivers/input/serio/serport.c
index cabe3876c168..24c0d0c0c9aa 100644
--- a/drivers/input/serio/serport.c
+++ b/drivers/input/serio/serport.c
@@ -18,6 +18,7 @@
 #include <linux/serio.h>
 #include <linux/tty.h>
 #include <linux/compat.h>
+#include <linux/workqueue.h>
 
 MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
 MODULE_DESCRIPTION("Input device TTY line discipline");
@@ -33,6 +34,7 @@ struct serport {
 	wait_queue_head_t wait;
 	struct serio *serio;
 	struct serio_device_id id;
+	struct work_struct write_wakeup;
 	spinlock_t lock;
 	unsigned long flags;
 };
@@ -66,6 +68,16 @@ static void serport_serio_close(struct serio *serio)
 	clear_bit(SERPORT_ACTIVE, &serport->flags);
 }
 
+static void serport_write_wakeup(struct work_struct *work)
+{
+	struct serport *serport = container_of(work, struct serport, write_wakeup);
+
+	guard(spinlock_irqsave)(&serport->lock);
+
+	if (test_bit(SERPORT_ACTIVE, &serport->flags))
+		serio_drv_write_wakeup(serport->serio);
+}
+
 /*
  * serport_ldisc_open() is the routine that is called upon setting our line
  * discipline on a tty. It prepares the serio struct.
@@ -85,6 +97,7 @@ static int serport_ldisc_open(struct tty_struct *tty)
 	serport->tty = tty;
 	spin_lock_init(&serport->lock);
 	init_waitqueue_head(&serport->wait);
+	INIT_WORK(&serport->write_wakeup, serport_write_wakeup);
 
 	tty->disc_data = serport;
 	tty->receive_room = 256;
@@ -101,6 +114,7 @@ static void serport_ldisc_close(struct tty_struct *tty)
 {
 	struct serport *serport = tty->disc_data;
 
+	cancel_work_sync(&serport->write_wakeup);
 	kfree(serport);
 }
 
@@ -249,10 +263,8 @@ static void serport_ldisc_write_wakeup(struct tty_struct * tty)
 {
 	struct serport *serport = tty->disc_data;
 
-	guard(spinlock_irqsave)(&serport->lock);
-
-	if (test_bit(SERPORT_ACTIVE, &serport->flags))
-		serio_drv_write_wakeup(serport->serio);
+	/* A serio driver may write to the TTY, so defer the callback. */
+	schedule_work(&serport->write_wakeup);
 }
 
 /*

---
base-commit: 2e6f2e5799f328ca0879dad14d7f3709c7f7496b
change-id: 20261023-submit-serport-write-wakeup-v1-1bdd1006fafa

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

