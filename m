Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794457694;
	b=YYL0XjGke1KHYw6wsO1Ap7CaQy+ZILhV/ZcnsRIlMXWMZC869Ah5rWKfCzkP4Vfl5MYA
	 loemg9nkL9IEjaSBu5oEtiQ3i+lanzjUmbTCd+F/FUi9PEzPDfpgo8t3zq1CoedV8PeBA
	 Zw8nZXRllMLNTpKJSSiCAytOAYPwflp2knfXA87Jc+iX35UMsUtTF82N6QItsMy0JNVMn
	 6x+Xb6rbLvjHz3uLxEEFerRKqfvCkQjxFfhxq8QspI/29PSQedgW1caBCquBuljdT8kC7
	 tXJH+zHpgoxERNDNC5XkeB5q7GuzI3bgXzEy9WiIUU4WYeycbDDT6a+M5C5xRq9rAZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794457694;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=72SUPaxQEhtOUv0mlFo4kwCDiyNMot1/Xsy1W1QLG5M=;
	b=vyCjWHNqANMHx/BE+QTw9leLEgo2BwhS5xq6NXH3j8nHOWPi+Vnk7cDCeyfHKnOtATT5
	 d37m9XBhpKGqeoXGvklR9oMlzC3TmkEtp061+IHokQdrOXdYxYb/y1h9Y9+YI1WhhPFmN
	 R9z7TxexUYqcIMIpgR1qa4FwfGLFrdawRtcvM5KEvwfjwUSjUANd1Ywdifojmrqrj0IeO
	 TL0XhX62kLxuWIEY4DxcYCSIf3E4ldlPhXz0q3zs/kcZWjAbQQjGFUHLW4ldmOtwKntrT
	 cxYHXxunzFQGwi+hkAfDuXOwbFW1QnFE3HDo5bv+FfRM9Hdb0qOWP6slgF9RqcQAP3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jAYdlGdb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CCE606A321;
	Thu, 12 Nov 2026 04:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jAYdlGdb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794457694;
	b=SFWBhESwlidwwEV0qKMgBY2ZnL4PlBbqnmLLn8Xc0OuTrnlQpqXOEHdcZ1ZARWXB4r3Z
	 C0QaXlosLxcykZ1fhQdFQLkECXcnqLPOeNMxgOKvkrAxqJIAVg7R+O7GVtFOpG1E0NAG4
	 9DkEyMrwj7/k9/aTu/4rxRv3klfWn1YABBPwhFbq1dN6J2Ac0p6tP3fBA0arW1ved5M3K
	 DPBoTGyl8cxi9pReYSfPCVcR3Gpxn1jP7DnxP9EPu4y7b/eEUqGXxtOmBGMCk3/OQAMuM
	 0s67sooqKZiopzdaSXWaTd0FvIOQcY5kEe2mw6Fydm/2l1w26QswRAlSkvkiUMO6m/g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794457694;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=72SUPaxQEhtOUv0mlFo4kwCDiyNMot1/Xsy1W1QLG5M=;
	b=Qexr0B5DD9ZfgQrL78js+v4VQeODkmbGTvyMTH1fjUqyxXWzL3666RgSaz+EZPZoVBCi
	 U67qdks5MT6e2ZOKa/aPbWALQgKXQde+KlX4qEWPT36ueQjxfwojfb2byKa9vPAvX/6Ex
	 m46hhpAWq2c+mTbBgikvLIQHi519m1ae3QfOaVV/lIbnrA6EnZ9ba7Vjao6A6JBcmodx5
	 YsLsV5spMFcccUzMTVCPJa94PcG0wqPBMa47V4TzGIE3QbkpX0Nk28KyA0Ir4es7OX27a
	 IEoA4ECc19TXbHv3oNWsZeO0IAeLo6hR6XGjinKo8L3xo2cyA7iQ3Y04Av7YP6BcLXw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B31FB1F00A05;
	Thu, 12 Nov 2026 04:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794457694;
	bh=72SUPaxQEhtOUv0mlFo4kwCDiyNMot1/Xsy1W1QLG5M=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jAYdlGdb2kyRa3L+kma6sqWrC33UCCk0UGKVw++zzTKTkVb5CGv28i/LhDGhRC1nb
	 NJU93Ie/o0EITV1N4Tx3FxE7WxYa4nZpkoQOJILTdicpSga6fsb1ZHaln/YC+Z73Sz
	 WxzUGzU4CTzmfd1Ytosbbyr7ZxGxgLRngnteJS8cW47IwrxZ2xf06KykVq5kc37QLL
	 vJOgh4yIZNjg+0kWwBhqBWh9nA8yhgrNKUzYbRY4LS8yZsCyFujZKymoaNk1A5fBAn
	 5RJlXzjZCLku+Lxyc70mE1DKGZjfs4Vyqf/cqKL6iZ8L3oih/4RHQiXtDPGn1thzBV
	 b1yHBmtxhoa1g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F79E4927F;
	Thu, 12 Nov 2026 04:28:13 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 04:28:13 +0000
Subject: [PATCH] usb: typec: tcpm: Cancel the timers before destroying the
 worker too
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
Message-Id: <20261112-tcpm-unregister-timers-v1-1-7230fda5612b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxG4auUrA00g4rjVcRFnf6tETqWZCpC6
 d0ddfkt3lvJYQqnc7OS4aWuz1whu4bSvcsjWPtqCm04ikjgkuaJl2wY1QuMi04w5zD0coj7Uxt
 jpBrPhkHfv/Hl+rcvtwdS+d5o2z4PaLCIegAAAA==
X-Change-ID: 20261112-tcpm-unregister-timers-2fd159480999
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Xu Yang <xu.yang_2@nxp.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794457692; l=3576;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=uO7oLFJ9U2ade7oBvcd7yir9nsFmvPybpTlJOuoRoAM=;
 b=12OwEeV8fEQtCgyW1E7aRWtRJbppNwN/xgiR2qmXBfUwQldX0xlNfYjZAL3iuCnkAOaajjTJV
 gO/caxTbEwSBO/Und6USQU0+xqw8TQo1001UkPihPbgv2oWHVqWPt23
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

tcpm_unregister_port() clears port->registered, destroys the kthread
worker and only then cancels the hrtimers. A timer handler running on
another CPU that has already seen port->registered set can still call
kthread_queue_work() once the worker is freed, or with port->wq
already NULL:

  CPU0                           CPU1
  tcpm_unregister_port()         state_machine_timer_handler()
                                   if (port->registered)
    port->registered = false;
    kthread_destroy_worker(port->wq);
    port->wq = NULL;
                                   kthread_queue_work(port->wq, ...);

The timers are cancelled after the worker is destroyed on purpose:
works that run while the worker is flushed can start a timer again
(see the commit in Fixes). Cancelling only before would bring that
back, so cancel them on both sides. hrtimer_cancel() waits for a
handler that is running, so after the first round no handler that
missed the cleared flag is left; the second round removes a timer that
a work started during the flush. tcpm_reset_port(), called later, only
cancels.

Fixes: ca4d8344a72b ("usb: typec: tcpm: fix tcpm unregister port but leave a pending timer")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206898@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Sashiko found this while reviewing an unrelated tcpm patch of mine:
https://lore.kernel.org/all/sashiko-outbox-206898@kernel.org/
Its suggestion was to cancel the timers before destroying the worker
instead of after; that would undo the commit in Fixes, hence both.

Compile-tested only (arm64 W=1): the window is a few instructions in
the unbind path and I have no reproducer.

This patch was developed with Claude (Anthropic) as a coding assistant:
it wrote the change and the commit message, and I reviewed it.
---
 drivers/usb/typec/tcpm/tcpm.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef5210..c7e0e09b1cbe 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -8987,18 +8987,29 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 }
 EXPORT_SYMBOL_GPL(tcpm_register_port);
 
+static void tcpm_cancel_timers(struct tcpm_port *port)
+{
+	hrtimer_cancel(&port->vdm_discovery_timer);
+	hrtimer_cancel(&port->enable_frs_timer);
+	hrtimer_cancel(&port->vdm_state_machine_timer);
+	hrtimer_cancel(&port->state_machine_timer);
+}
+
 void tcpm_unregister_port(struct tcpm_port *port)
 {
 	int i;
 
 	port->registered = false;
+	/*
+	 * A timer handler that saw port->registered still set may queue
+	 * work: wait for it before the worker goes away. Works that run
+	 * while the worker is flushed may start a timer again, so cancel
+	 * the timers once more afterwards.
+	 */
+	tcpm_cancel_timers(port);
 	kthread_destroy_worker(port->wq);
 	port->wq = NULL;
-
-	hrtimer_cancel(&port->vdm_discovery_timer);
-	hrtimer_cancel(&port->enable_frs_timer);
-	hrtimer_cancel(&port->vdm_state_machine_timer);
-	hrtimer_cancel(&port->state_machine_timer);
+	tcpm_cancel_timers(port);
 
 	power_supply_put_system_batteries(port->fixed_batt, port->fixed_batt_cnt);
 	tcpm_reset_port(port);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261112-tcpm-unregister-timers-2fd159480999

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


