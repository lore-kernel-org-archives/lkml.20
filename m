Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B86496D40
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400951; cv=none; b=VwPN+ZRlN6ho2dsI04vFGVNtomE/ecuoBGM2nwyUaqITYlvp3PkJ/GhXGe5janI3IL0rhOjeUJREaIskTElPlbXYUWIl1hALoam5+wScY6pd8cxVxW5r+LQ0eL5uFyr1HSO1RIZncxyqwjmq2kwgBrVMckmhRq6WK3rRE8PrPuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400951; c=relaxed/simple;
	bh=bXhM4FoKEMjoVJngey+rLRGsMTJr73lLsNGxz5SKA6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIOAFq53ejXFhEspZ0mfoZjiD1+cXZxE+QrJR879qCU6Ofxg07hk+BB1Cfz7Rrra5EAJuyeLU5e2QxIKrRAld+8Cjx/C7vHJlMGS3R+elYntkU5vvIKhi5fEyLR10uE0uxJpWcqRxeMD76KSw2kh5bEqYryqbh9kOOKADxcZkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNZnLZBr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNZnLZBr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso19848735e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400947; x=1793005747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74j522Qq3PrDT389l4xKGCJqDvHcj2n6WofFw+CY6Eg=;
        b=JNZnLZBryx4lKIt/Udc0SddljgwcIGoNhwa50lpYOvirm/+PNL0g+fpRJ4tBqXtTzi
         S/BQ1EffFtXPjuhVuYXZohX+AZ5B9Xzlgog7UoxvSQbeb7b7ht14KYX4bQGn2EJv/bfS
         ubzbjxuy1X6hPjq8lpeqv15UOx83DIH2P8UVbEh11unG/HlIMLN8K+VR/xSG1I1Lla18
         SZcGexF+z0em+M4FiaptEj/whTTqWJExYgshfgPzEC7LlQ+Ztn1jhuj6MT6IB6cg1Tup
         neZ3Mwwy3b4m7CgVKhyC1mBSflfl9TrJggNKPud/NVNwqLiKotI1b8S9f0ZzlP+qg2E6
         QbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400947; x=1793005747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74j522Qq3PrDT389l4xKGCJqDvHcj2n6WofFw+CY6Eg=;
        b=zvbP9kPrEHjYKSY86EoPFIiQVohmSMFZLB/bkN83vIpSHAA4RjcXVWfcIngfaVFDCa
         Y+7BBJRQmo1OaZixYjH+YKBfH+5PZz12yqkHQMXZ6I5cFcHyYCtsRHGOL9HG/lvzOXV8
         rElbpJuQhkz95X8Tt8qauBiXMPfaQSseYesquBG+TpiiUDaTSG1kKWuwwl5pEuZ4pUC9
         GOi2OmxHZfN/2ZwdvvYseJ8ikPZHSGj2Yu4+bQCnUBUk8czQhRhfEyMx2MxoNgILBNkF
         58FnJ44urKiWFJsEvBtCbp9/FZDmk+DEJHBBt6U3tMG8PmpsdIio0ly2KUokB14thMSH
         UMWQ==
X-Forwarded-Encrypted: i=1; AKwUvByKtYeWY2r2xfaCdA2hjQWW0S90s3N0XpJb53GUdoSfURWjjCInQiwdsjw7mLQMIa84j5zDUEJun0Qj1AY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDlBWf9uL3BNHfKQekWC1ZSNjjXnEC6Qoh4NnJtrD4p9xbjbc3
	wf7TONR7YJ1+y/wwXmQ/ptlv9fZCgsvDJ+BQYZ79p2p0ymI26Zj4tL8B
X-Gm-Gg: AYBFou0FPmqWPXSb+pbTHn22yXvtadfANNJL0Ox08SQMHXEeseDnmj1wNpWjHi6T5hD
	TFKnxA+J9SBq8WgtEfsVcaK2DmiEgoVme8cNmrvX769uxbfHYDoFCvCj+K8/sRE7J6hYo+D9e1l
	QluwTpZg9mnJEyLtWG4CikB5HVwvlNjM9FNU4HIMfk9b1DRe+xFTBS/cyAQc/xICfTRvnA7nsAU
	gZ3KPEXpaJu+eceOsLCscxCcOJRpT1tMClzBoBQrvr7DvZzcA0u1bMhT7kARxlalBw0bimXRSdD
	tfXp85ESf0sSmjeGgXiEUUaiNl/fpxtjNzH0KS8m7a9UC1E9JoFGtmQ80vImpYDQmtK4M7iNAVP
	AxDfgZin7mbnyHFKdqRP0kuXXX8VWJkwYi8/Lqfkk7uhM/O66D04/QnoZGcWx3vPdRme35TfCkQ
	R7GM10b0/Spjmw7JRtV8YRCjYb4nfnP0nDxClJlgUAuqdxLYnv2umKE7o/3rfAbbargCGChL9YR
	I0u
X-Received: by 2002:a05:600c:3508:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a1d762251bmr156669495e9.32.1792400947197;
        Mon, 19 Oct 2026 02:09:07 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm174734465e9.5.2026.10.19.02.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:09:06 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Wayne Chang <waynec@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Felipe Balbi <balbi@ti.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 1/2] usb: gadget: u_serial: keep the port until its tty is released
Date: Mon, 19 Oct 2026 11:09:03 +0200
Message-ID: <20261019090904.3264978-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019085855.3259716-1-mehmet.fide@gmail.com>
References: <20261019085855.3259716-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

gserial_free_line() frees the gs_port, and with it the tty_port it
embeds, as soon as the last close has returned. The tty core keeps
using tty->port until release_tty(), so a hangup that
gserial_disconnect() scheduled before that close can still run and
read the freed port:

  BUG: KASAN: slab-use-after-free in check_tty_count+0x230/0x278
  Workqueue: events do_tty_hangup
   __tty_hangup.part.0
   do_tty_hangup
  Allocated by: gserial_alloc_line_no_console <- acm_alloc_instance
  Freed by: gserial_free_port <- gserial_free_line <- acm_free_instance

and release_tty() then cancels the buffer work of the freed port.

Take a reference on the tty_port in install and drop it in cleanup,
and let the last reference free the gs_port.

Fixes: 19b10a8828a6 ("usb: gadget: allocate & giveback serial ports instead hard code them")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Changes in v2:
    - new patch: Sashiko pointed out that with flush_buffer the hangup that
      gserial_disconnect() schedules can run after gserial_free_line() has
      freed the port; the tty core itself already reads the freed port in that
      window (check_tty_count, release_tty), so the port has to live as long
      as its tty

 drivers/usb/gadget/function/u_serial.c | 45 ++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..19eea724280b 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -908,7 +908,39 @@ static int gs_get_icount(struct tty_struct *tty,
 	return 0;
 }
 
+static int gs_install(struct tty_driver *driver, struct tty_struct *tty)
+{
+	int		port_num = tty->index;
+	struct gs_port	*port;
+	int		ret;
+
+	mutex_lock(&ports[port_num].lock);
+	port = ports[port_num].port;
+	if (port)
+		tty_port_get(&port->port);
+	mutex_unlock(&ports[port_num].lock);
+	if (!port)
+		return -ENODEV;
+
+	ret = tty_port_install(&port->port, driver, tty);
+	if (ret) {
+		tty_port_put(&port->port);
+		return ret;
+	}
+	tty->driver_data = port;
+	return 0;
+}
+
+static void gs_cleanup(struct tty_struct *tty)
+{
+	struct gs_port	*port = tty->driver_data;
+
+	tty_port_put(&port->port);
+}
+
 static const struct tty_operations gs_tty_ops = {
+	.install =		gs_install,
+	.cleanup =		gs_cleanup,
 	.open =			gs_open,
 	.close =		gs_close,
 	.write =		gs_write,
@@ -1203,6 +1235,15 @@ static void gs_console_exit(struct gs_port *port)
 
 #endif
 
+static void gs_port_destruct(struct tty_port *tport)
+{
+	kfree(container_of(tport, struct gs_port, port));
+}
+
+static const struct tty_port_operations gs_port_ops = {
+	.destruct = gs_port_destruct,
+};
+
 static int
 gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 {
@@ -1222,6 +1263,7 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	}
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
 	init_waitqueue_head(&port->close_wait);
@@ -1258,8 +1300,7 @@ static void gserial_free_port(struct gs_port *port)
 	/* wait for old opens to finish */
 	wait_event(port->close_wait, gs_closed(port));
 	WARN_ON(port->port_usb != NULL);
-	tty_port_destroy(&port->port);
-	kfree(port);
+	tty_port_put(&port->port);
 }
 
 void gserial_free_line(unsigned char port_num)
-- 
2.55.0

