Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182015;
	b=eVOq+CgSVaKUAG1gq1Pj4Ez9ZBpMG82uD4/qXqZllCgtGJrQbuFg9bRsWlGEk6vNnU6r
	 npM0+GSdbzmNLWKC/7/S7U6pc/SuSB0rOTYe/CNlPYA50FbBOib+iRxRtxT2OghcARoeS
	 SPuWNQvdQ8sOFPJ4vgxVLEQDNK4PoYpF2PzhOZq5LnsxA5HaHsiV3krtDBqIwKLCwojUo
	 5cMmfeeQ/3m+RdRHsMoeVxa3T1fRvdX/8jV/MRhdRpNnCr3GmvEbp2Bc0Bh8UDZpeCHWZ
	 94YRA7KJK076hQ/1+IAXzl76A+GSBCvs4z00Xqg8C/7Hqcpqs3pxFCsar9PJC02GAVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182015;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RSCGrdgSArfXCMEcOW6bRIMjbLBp+rhO/w5fSd/2roM=;
	b=AupvFu0LVvzHyJN7Z503VXFLQirwquu8yuVq1VUoD9gfTE4y5wxUL13ZXAhmjNathqjr
	 o+OCxRqFSY9BPf9pf+jcCllpJhJMqwbXr0Ho7NdjM+e4rhnroazk+wrlgmCVqsI4XS0OJ
	 4WKdd6JyhuloXQSQMy+9gz6XtxA0/K8Xl3mb1vuVgVAbLT6HadCrDPCFtB01X40KwBdZR
	 A+e4I4Bm1mW4xaIUbT9ARlkIu0tLoH97fJxfjuyYfzvH9paC5tCc5BCbioB0E+74kippn
	 H8VZq+yDY6z3iBQnwzaHjeP0//9WBp5IuoY0kqUqK7gncNu+vpdv/9APDIOpahHaxtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=LcBQYlf9;
	arc=none smtp.remote-ip=203.205.221.191
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709FD606A31C;
	Sun,  8 Nov 2026 23:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=LcBQYlf9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794182011; bh=RSCGrdgSArfXCMEcOW6bRIMjbLBp+rhO/w5fSd/2roM=;
	h=From:To:Cc:Subject:Date;
	b=LcBQYlf9sA9/LfqnHzgTVVVzG0AbQ/UsAyROtCZC0ipZVflIcOH+Qv6Sl9g5pWTti
	 eyxO0hWcTdEtUWcelhAnlQf2i3HKQ5mCSuj2PgOMePMT0iEM1hmsQiaFMFFalrCnGl
	 /knVo+OXmpZ7IfKOJJkiNp+TJWNjn/x7nmSiZqHI=
Received: from shuai-VMware-Virtual-Platform ([223.88.55.127])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id D5C0AC33; Mon, 09 Nov 2026 07:53:28 +0800
X-QQ-mid: xmsmtpt1794182008t877zz9sc
Message-ID: <tencent_5A9A9E45415EADE916B7558C66A2C4DD4F05@qq.com>
X-QQ-XMAILINFO: MxLtP9q6S0tz+8IY8BI97Pf+ZFkJG+7wgtya4aH1huNEMVDtaOiWIQ7j4PnDJj
	 cj8ia803+7IUIDD7s+pI6t1XGWsOdMxPTBs/tD1oRiJ6JkDxW8pOiqJSxXqSzRg5OE+h+4HXeNG8
	 DS+rV4TQKYM5eidrae9j7GnWFk4RMpqVLe0bKUN9KLOZF7yV04XtNEsVWQHJbR1Lrlne4iL4jA+L
	 XZqDo/jliemrhiIUTI4ctlKK7g/sfgFcYBAZTDB1LeZUvcEKZQp+mIS5Knp7pjRmBjVX+HLE+Is7
	 fV/qTKK0wQORBYeHEY/nVqDO1k6mizkj2/FWwms1ogGYNkGy9vV835E/f11a+/vRLbcBgbHUKO9M
	 /0U4F0C/NU5sKI7za/bV0r4y1ppbWiovVJgyBD5jb0E6oiJdBv5YFRFdWttIwXJUG6ctx1rfLa0k
	 C5YUdDpmvmMOB5uLnpIeR1F5hVeaM5rh7vMfX7FoCQ6VmBOz1wsEz0G+Pmd8wvZIrshVUIL9zspl
	 hJdS725UqXL2gRq8oaaIklklz84sWvxA+8rfxfuaB+RTGcsujNsLoZcuP5Ax33UjnE0Ki6hS+0sO
	 GJspGvpYqumA0fYKbLSj6rB756QKrKxNtF7VsYCUk2JCEWkcXkvxtBRzQvG4JmyLNCU5SYPnhaMQ
	 orPG0ZR0ki6NVj/+lE+e2IEz+ZiuZCwk8ye5c8sue4OfVh32wbhydHm66K0s2rTe4ZZSLJa4M2hu
	 NmT+x94I8NMcWho++G2SFn6V98M2N9mOtMDuVxqq1aabj9nfnM18j2cSOkeH56ltcVODjVaNVvov
	 yDD0NG0q3kuEL0LBz5x6vuELLlh5JWz8yemh/7hQeE+9nF+Pl0BL5OWAXDkhDGJiL9t96u1L9oZv
	 OTtVTSKyZcizUAvIY0C3y1KLIu3olxTmu/vR1nIT1cl8jWxjDSXETKO9tQ+wVsTpVAtLjvoYDqqN
	 bZoCcCO6HCjCiFFbtMzCK3C58eqQNmP+FZupw5xKuEuoCpOAwHtd14n9JYWDdcpWUEqeQrlZBbTf
	 W8Ikxbll8Ykle0C+tXVfLlL9aC+gRi9vahytxL74ROXznPNq/IM8zrcY9BuNO3TVHbGiUEr5gGXH
	 BDDktij0Al2dFwd0inrUV6B6M8ym82i8/OB+pAAM1qr/vReZk=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Shuai Liu <847807867@qq.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH v2] usb: storage: don't hold dev_mutex across the max_lun control transfer
Date: Mon,  9 Nov 2026 07:53:07 +0800
X-OQ-MSGID: <20261108235308.1023796-1-847807867@qq.com>
X-Mailer: git-send-email 2.53.0
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

usb_stor_scan_dwork() acquires us->dev_mutex and then calls
usb_stor_Bulk_max_lun(), which issues a synchronous GET_MAX_LUN control
transfer (10s timeout).  The reset and suspend callbacks
(usb_stor_pre_reset / usb_stor_suspend) also acquire us->dev_mutex, but
they run while the USB core already holds the device lock
(udev->dev.mutex) during usb_reset_device() or disconnect.  This
creates an AB-BA deadlock:

  scan work           reset/disconnect
  ---------           ----------------
  mutex_lock(dev_mutex)
                      device_lock(udev)      [USB core]
  control transfer  -- blocks waiting for
                        the device lock
                      mutex_lock(dev_mutex)  [pre_reset]
                        -- blocks forever

syzbot reports this as a task hung in usb_stor_scan_dwork(), with
cancel_delayed_work_sync() in quiesce_and_remove_host() unable to make
progress.

Fix it by making usb_stor_Bulk_max_lun() self-contained: use
usb_control_msg_recv(), which bounces the one-byte reply through a
DMA-safe buffer, instead of the shared per-device resources (us->iobuf,
us->cr, us->current_urb) that also belong to the control thread and the
reset path.  With no shared state touched, the transfer no longer needs
us->dev_mutex.  If the transfer races with a reset it simply fails and
we fall back to a single LUN, which is the existing behavior for
devices that reject GET_MAX_LUN.

In usb_stor_scan_dwork() call usb_stor_Bulk_max_lun() outside the lock
and only take us->dev_mutex briefly to publish us->max_lun (and the
SCSI host max_lun).  us->recv_ctrl_pipe and us->ifnum are set during
probe and never change, so they are safe to read lockless.

Reported-by: syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=30552b4cbe99d6d91306
Signed-off-by: Shuai Liu <847807867@qq.com>
---
v2:
- switch to usb_control_msg_recv() so the reply goes through a
  DMA-safe bounce buffer instead of a stack buffer (Sashiko)
- initialize lun to 0 so the debug print never reads it unset (Sashiko)
- pass the timeout in milliseconds (10000), not jiffies (Sashiko)
- trim comments; the full deadlock analysis is in this changelog

The remaining Sashiko finding (unlocked GET_MAX_LUN may race with a
reset) is benign: the transfer simply fails and we fall back to one
LUN, which is the existing fallback for devices rejecting the request.
The reported scan_dwork vs disconnect stall is pre-existing and not
introduced by this change.

 drivers/usb/storage/transport.c | 27 +++++++++++++++------------
 drivers/usb/storage/usb.c       | 15 +++++++++++----
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 8de3015bce05..f32393634415 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -1075,27 +1075,30 @@ EXPORT_SYMBOL_GPL(usb_stor_CB_transport);
 /* Determine what the maximum LUN supported is */
 int usb_stor_Bulk_max_lun(struct us_data *us)
 {
+	u8 lun = 0;
 	int result;
 
-	/* issue the command */
-	us->iobuf[0] = 0;
-	result = usb_stor_control_msg(us, us->recv_ctrl_pipe,
-				 US_BULK_GET_MAX_LUN, 
-				 USB_DIR_IN | USB_TYPE_CLASS | 
-				 USB_RECIP_INTERFACE,
-				 0, us->ifnum, us->iobuf, 1, 10*HZ);
+	/*
+	 * Use a private buffer via usb_control_msg_recv() (which bounces
+	 * through DMA-safe memory) so this transfer touches no shared state
+	 * and need not run under us->dev_mutex.
+	 */
+	result = usb_control_msg_recv(us->pusb_dev, 0, US_BULK_GET_MAX_LUN,
+				      USB_DIR_IN | USB_TYPE_CLASS |
+				      USB_RECIP_INTERFACE,
+				      0, us->ifnum, &lun, 1, 10000, GFP_NOIO);
 
 	usb_stor_dbg(us, "GetMaxLUN command result is %d, data is %d\n",
-		     result, us->iobuf[0]);
+		     result, lun);
 
 	/* If we have a successful request, return the result if valid. */
-	if (result > 0) {
-		if (us->iobuf[0] <= US_BULK_MAX_LUN_LIMIT) {
-			return us->iobuf[0];
+	if (result == 0) {
+		if (lun <= US_BULK_MAX_LUN_LIMIT) {
+			return lun;
 		} else {
 			dev_info(&us->pusb_intf->dev,
 				 "Max LUN %d is not valid, using 0 instead",
-				 us->iobuf[0]);
+				 lun);
 		}
 	}
 
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 823a4b2e9033..d973bfd0f23d 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -980,19 +980,26 @@ static void usb_stor_scan_dwork(struct work_struct *work)
 
 	dev_dbg(dev, "starting scan\n");
 
-	/* For bulk-only devices, determine the max LUN value */
+	/*
+	 * For bulk-only devices, determine the max LUN value.
+	 * usb_stor_Bulk_max_lun() sleeps in a synchronous transfer, so it
+	 * must not run under us->dev_mutex (the reset path takes dev_mutex
+	 * while holding the device lock).  Lock only to publish the result.
+	 */
 	if (us->protocol == USB_PR_BULK &&
 	    !(us->fflags & US_FL_SINGLE_LUN) &&
 	    !(us->fflags & US_FL_SCM_MULT_TARG)) {
+		int max_lun = usb_stor_Bulk_max_lun(us);
+
 		mutex_lock(&us->dev_mutex);
-		us->max_lun = usb_stor_Bulk_max_lun(us);
+		us->max_lun = max_lun;
 		/*
 		 * Allow proper scanning of devices that present more than 8 LUNs
 		 * While not affecting other devices that may need the previous
 		 * behavior
 		 */
-		if (us->max_lun >= 8)
-			us_to_host(us)->max_lun = us->max_lun+1;
+		if (max_lun >= 8)
+			us_to_host(us)->max_lun = max_lun + 1;
 		mutex_unlock(&us->dev_mutex);
 	}
 	scsi_scan_host(us_to_host(us));
-- 
2.53.0

