Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958789;
	b=N/5Iqd1NSjiYu5gayjqK3YSQOJzk+MGsFoZZ9B2lclcIMxyaHS+NOQt6hnx7onuTNtQC
	 n+KG8lAdGxRGkKkDFWIS8YpXVWk5Xv4qHmgAXwWXiS6MUj5Z9FzTt8zSgsYC6okPt5Ckx
	 PLiHO0Iu0/Uv4md4I0u5+iMKp6UFR5/cREyWuQyd5wmagWK5Y+zmKcq7C4coFrWy9YkAi
	 /AMoYuBFslBAdtqRzyCornXn8F3t764vg01apwFwOABmVrjvskewtd4aZKkZikAGvkDKs
	 ho1eHis7OuDxUCTyn0i5VWM3dn61eWfHZWntBK1efCtx3L+RZs9U3qRZu8bzB9n8HUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KWd33QHj1KyW14bW4rGiw3FQ3MhReLvouK1usu+yNIs=;
	b=wSG+Z+TG4iDdPfDRkv8QP/I4xrgtLCbzPMEFDWNvAZg3dFl0ZXC4rweKl2Xn7BmrTWXq
	 T47u3hbPG7a4l3HfLmwRHNt20YY3/Mw+vg2ms5haUQr7hB7Ja9tIwhLjYgomK9vgRfyaN
	 WP9mR9rsi5jXoGoTu57Dr8oMSyqzwgxrAGZYH9Qb8bSjjB4wPYg9pgND3nat33TCCyo+J
	 waEu1clO8THH22h7pLqNf7p3e945ISSSzRpSRD9R5c2VfFID2w2MQN9RXfP9Q7OHp9ASk
	 wlj4S/MxOJg38yOQXV7b6wFhvZmArnGkAS/G/kbAtH3BRyPMBozTU5Ej4w/EoavThqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SlVKcEWA;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13CD606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13CD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SlVKcEWA
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so176293b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958788; x=1794563588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWd33QHj1KyW14bW4rGiw3FQ3MhReLvouK1usu+yNIs=;
        b=SlVKcEWAPJNtmi9HH8Qv08HmSSynRxHaWjuxDpbWNe5n0ZKzoAdfPNGD+O7i5pIq11
         8fzKDv4qzaJWgAMurG0BVb6tIQEF9FLzpsEbQs9o5ZeXDfgKxgL8QLZ9Racp0hfZJTej
         8jfGhFGP8K0GNr0PZmy382qbi5+XcHN0FgQI6mbn0dc+BqUqCt/a6m0w+HZVHOh6CPoh
         pTjZ2BM+7fmkMwmWoibE8Mrs795ajXt1COuAytmJgfo3/wZM0sxWX9slv2+YR5FDGYzW
         JcGz9cvGE1p3Besrah1o3asmlduuqqyGRjUdZZfRDP0nVUEzvvB0R3T2lyt6yYdPpWMg
         aQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958788; x=1794563588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWd33QHj1KyW14bW4rGiw3FQ3MhReLvouK1usu+yNIs=;
        b=qWej88w9PmXFzV6Eso+22+eWEvSKJTazQPPqRbhEshrztx+GEN7SqIMcXijBY9VhoK
         HToLisi/gsALf3A5mTUca9nGViDzZaB6ed7bdgxr6aSgJ+VNqnIIrIUhZyesZwgEa6br
         z3u0AkRzIHPLbrmrzl+Cfs3bFHF6Z/cLl8sKcz5F8tBflgzpuvIDHhHSvClI/in/+9yy
         X6rG42ynUdI2FvkiYkjJB1IEaH1nGdLs9ErlmImEIHm19NQmtZaqBJsfgpg+092zb0ig
         1RHvtQNEJuyuo/yT9kFAhmbcoieVL2pMInyCCcaSvpFSnPWRc/m0qPr9e+UpiD65bNzB
         aV8Q==
X-Forwarded-Encrypted: i=1; AKwUvByLHS4F0p2DUScHcxTe7+fJzcw35ztdxtOMxBq73VZYBYgidchtbDnbum3ooXgPDtBcynNxzOLKu9Mno34=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zLp9m1iJ4S7CKJANYRMcK7YdSPoL9idQrRpE1haMAUGpuTxoD
	ImJTk/0EuZNWsl/VcjTMsl4s2ANdv0t+O2xHdCCJRRXgW2H1seIaPqo7AzCumIsG
X-Gm-Gg: AYBFou1TJBCL9CGeQErUHjHVgXvb0MAOaakchpN20nYeM+DcM0Hc1lq8HmWPKL2eDz4
	217Ay1uLuQKiFiPrrx1inyDGkZIqVgclhikQ2tZjAC7fuYjvg0XvBsjXa2J0FcUReBacEwPEbsW
	Zlvl+a0H/ygFveuao9X4fbg0gy5vZsY6B1b4bN4p//qzJyX/R5taoR5PviGGmIGAdArS+g21viI
	fQ/+HXhntcR24CLlylOWzx3I6j4C4mX2/urnobksfgBvxH8On84fqLHoV3PIB/3LsLIF1tzF1X7
	1yTv+8nqMd6sNk9YwKbHuUsBWa1u1erGM8fDznYHrR7HyxYWwpF6axP7YWml1SJNskaSGJ9DpCI
	tP/ydipOsR7DXy/TeEa1/0XZnrr1DZ7oV3bGIEhf7Z2Mj4zBfCGaFJLgMmBdXSM6tARUf+oyEBM
	gVErPCqMFex+PS5KxIWLOdUBwQFDuDsqtXF4F1S9z88DFO26H7qudIrOex0s+g5mEfyNcN310RA
	W+fpf+Y4J3uNem81pjqHu+8kBjDZ92AftfJ64YkRec9Eygtu+EWPtR+IIhX5jGFlTFkrw71mw2l
	hrqZF75PIt57Bgs3u81+Mai36LyzqxJCIQ53SrQ2u99kOXxL
X-Received: by 2002:a05:6a00:f95:b0:878:34d7:69b2 with SMTP id d2e1a72fcca58-8b37cc0a6bamr1752697b3a.57.1793958788061;
        Fri, 06 Nov 2026 01:53:08 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35aa98162sm468581b3a.56.2026.11.06.01.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:53:07 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] nfc: port100: drain cmd_complete_work before freeing the device on disconnect
Date: Fri,  6 Nov 2026 18:52:57 +0900
Message-ID: <20261106095257.2407520-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

port100_disconnect() tears the device down in an order that lets
cmd_complete_work run against freed memory:

	nfc_digital_unregister_device(dev->nfc_digital_dev);
	nfc_digital_free_device(dev->nfc_digital_dev);   /* ddev freed */

	usb_kill_urb(dev->in_urb);                       /* -> schedule_work() */
	usb_kill_urb(dev->out_urb);

	usb_free_urb(dev->in_urb);
	usb_free_urb(dev->out_urb);

	kfree(dev->cmd);                                 /* cmd freed */

nfc_digital_unregister_device() does not abort a transport command that
is already in flight, so an IN URB can still be pending here. The URB
completion handlers port100_recv_response() / port100_recv_ack() schedule
cmd_complete_work whenever the IN URB completes with an error status,
including the -ECONNRESET that usb_kill_urb(dev->in_urb) produces
synchronously for the in-flight command. The work handler
port100_wq_cmd_complete() then runs port100_send_async_complete():

	static void port100_send_async_complete(struct port100 *dev)
	{
		struct port100_cmd *cmd = dev->cmd;
		int status = cmd->status;		/* UAF read   */
		...
		cmd->complete_cb(dev->nfc_digital_dev, ...);	/* freed ddev */
		...
		kfree(cmd);				/* double free */
	}

Nothing drains the work, so a command in flight at disconnect leaves
cmd_complete_work queued (or running) and it dereferences dev->cmd (freed
by kfree(dev->cmd)), dev->nfc_digital_dev (freed by
nfc_digital_free_device()) and ultimately dev itself (devres-freed after
disconnect returns) -> a use-after-free plus double-free.

Kill the URBs and cancel_work_sync() the work *before*
nfc_digital_free_device(), so the completion that usb_kill_urb() forces
cannot re-queue the work and the handler cannot run (or is waited out)
while dev->nfc_digital_dev and dev are still valid. Placing the drain
after nfc_digital_free_device() would be insufficient: on SMP/PREEMPT a
worker that already started executing would be waited on by
cancel_work_sync() while dereferencing the already-freed ddev.

Found by code review and reproduced on 7.3-rc3 with KASAN and
DEBUG_OBJECTS, using dummy_hcd + raw_gadget to emulate the device and
race an in-flight command against USB disconnect: debugobjects reports a
free-active work_struct for port100_wq_cmd_complete, freed from
devres_release_all() via kfree() while still queued.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/nfc/port100.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -1619,13 +1619,15 @@ static void port100_disconnect(struct usb_interface *interface)
 	dev = usb_get_intfdata(interface);
 	usb_set_intfdata(interface, NULL);

 	nfc_digital_unregister_device(dev->nfc_digital_dev);
-	nfc_digital_free_device(dev->nfc_digital_dev);

 	usb_kill_urb(dev->in_urb);
 	usb_kill_urb(dev->out_urb);
+	cancel_work_sync(&dev->cmd_complete_work);
+
+	nfc_digital_free_device(dev->nfc_digital_dev);

 	usb_free_urb(dev->in_urb);
 	usb_free_urb(dev->out_urb);

 	kfree(dev->cmd);
