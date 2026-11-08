Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.242
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180835;
	b=Hn8WPPHyZvfaXMgtxgWSzgSn3UOuxVtoNyDOt9XOjldDrvIuZTYs72KiOue3MTetDzqd
	 oH5vx9yhxiMo30P3inUvZ4JO1fBPXte2jtPxDkMOKYuIaNVZnSuvKtiYKca5gNB3BLkWc
	 6BWtMojkGrAqbnJonO9u5FRaA0sG9InZT6ZF/lc1PXVcNgHH6bUemfDlMNiTS4M6eNhxV
	 +W5jtDRIj6RXQGIiKziDsSUUj65IGj28aiVXM5xh2hRVjvumkXzSoUL4kV2Mrgg/9oxPl
	 1ZmLzG+8DgqIIXkt+cLopyNgvLgetQ2XFoXAmZrwFAEMNzPw+zzeyYNbWNdibrpkvaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180835;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yWuo+qUaNy+CrX5cBE9Tcp6js8VodOqkc1PAcZwO4YY=;
	b=5nhTi/XlsrKJW/TtdceW7nkfX3d6eO9DPhWTjLvJRn4PuQjpxv1nCHmvu4Ho6nNE5KAy
	 atSnAhe1yo394xN3cnoJGW+fyvXUJCVcNrB9CwSWFtdWUsIKjeBlrYQaqSP9zsHIVTkN+
	 AGlVrQJfAnxlx7FpdpKakKqtgTaOh9cbw9I4tL9HXosQYgX5r5imOQ4jym6F4r60BGsgd
	 ZrYvNkwoLVdFD9Xip4fvm1m+GcX09qKQiVtuJ3umU5fa6XEvIsCgicM3NhZiqOs+v9zWt
	 vDPDW74MqcOxe1EESgWgLdU5Q4du1LW1foSUqGUl+66KsNDK+iVA5D/Z/5OqccRP4YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=yX7bCq4u;
	arc=none smtp.remote-ip=203.205.221.242
Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C5606A326;
	Sun,  8 Nov 2026 23:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=yX7bCq4u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794180830; bh=yWuo+qUaNy+CrX5cBE9Tcp6js8VodOqkc1PAcZwO4YY=;
	h=From:To:Cc:Subject:Date;
	b=yX7bCq4us2yrx2MT916VYXCtW3aSlV2f1cE8MAYbWhtVe7zPSkFD7Zg7ysAg12u7c
	 W3nUommaOiSH+27vR77KwetlR1S2PhiTzDK1cwBSHolkJk8F5kPEiVrcSHZIemwO6v
	 wx+uMMrxc92pFXISIFyd3q8LyF8zCVW6adqr8u00=
Received: from shuai-VMware-Virtual-Platform ([223.88.55.127])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 86F832D0; Mon, 09 Nov 2026 07:33:47 +0800
X-QQ-mid: xmsmtpt1794180827tjqid6cjz
Message-ID: <tencent_7682CAFD52BA8845497EA2C9047754EC6605@qq.com>
X-QQ-XMAILINFO: Nz6nvCBXF1ZF3ql4O4D6KEtocM9df17vmXp+qzIII9C7LRTdXp81dhcsbKKmYT
	 MDrhdo0CEiAunx4BRm/xaBS3LFQmw3V/wIlYOsrp77m0CWaU/ASD4inqNL4WMqfm8Lt6lgltndDs
	 8VFSJlhStgzHOXk169lbsNF6kA8Lgft/kr3D444Bsk8sA+fkP+7pkS2MYmKwqt7qRAiFmev/NNrS
	 QSXUM6MO62QGrKtRa7B7498TzL6nfcYk48lVAho9azMWqN/cvSyYvfkx5f3CC9JK6IfcTvybbCbX
	 O9fMrv+H56pDIRLZkRJC/avmS3rydaJ613kC9AD1jtOIfh9Gd0aITIF9tdgiGeo2UoxNOc+R3LrD
	 g0d5jeZE6NXhqeWgNWuSi5P5Px451dxgpEFUmMm4p3UckXuneuEcKQm0f/KL8j3YTOHZVxLlGHpo
	 mLZZmYkolDQ9N3Vj8RJIDiER9UAjsKbIcr3Lgnc47+85jyTokiXasXBrn1Fcz+A92nnzE9W7FCkL
	 Xzno5EANCkK2tMn82qAhkSCxLtMsLZ39TbPn3y3Cp7Q4+lNQGYKxhbqbKejxa7Wr1lxhllZo7n+x
	 V9MKb1vgxB3LJBxaGaG9SkLRnX6QKcxo6xT3OvNeFe6PglHZOXXWd3vY51z3xAz7GB99eWAiypej
	 tb2gqAzTqiDQq83id8RBaXeAk/Dsn8lOGx5kD2z5njVAjc0LTWbvY/kAp0L120cGpiKWHsp3tFwf
	 M5+oPVgRv75Al92w4A2+bn3sUEGyoQ35FSZIZauOjjOXRsBMCbApVvzJLvLoDM4oqzuNZ4Ht8xrQ
	 OdGYSaaiOnVtT/+mYSPwP90Y4ZkqbrMROAiiyV7Z50x/Y3baTpJJx2QQFxSXahwRcmmESO60CGvC
	 YRc2cokSwzpu9dZDPFFoOX2mmpvxreYZWi5fjEyWRGS+3I4NjT/mad8S6qRf2IA98Jr0MDDp/Gup
	 K6zzfIUn5gIF8xJGZSH8S2JVUrt04e+XxTUpsdxgm3hU/wTQGhx6LO/WgGaLMXPdZ3PWU9Opl0qu
	 Nmyjta+rH21Y5xY9KHbz/mDHr0jsBYA9E8JjEbjnH045e3EFDjNBDpJ7zmt0GWvY07CQ/7mrc1u3
	 CzbKZf
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shuai Liu <847807867@qq.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] usb: storage: don't hold dev_mutex across the max_lun control transfer
Date: Mon,  9 Nov 2026 07:33:47 +0800
X-OQ-MSGID: <20261108233347.1021054-1-847807867@qq.com>
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
transfer (usb_stor_control_msg -> usb_control_msg, 10s timeout).  The
reset and suspend callbacks (usb_stor_pre_reset / usb_stor_suspend) also
acquire us->dev_mutex, but they run while the USB core already holds the
device lock (udev->dev.mutex) during usb_reset_device() or disconnect.
This creates an AB-BA deadlock:

  scan work           reset/disconnect
  ---------           ----------------
  mutex_lock(dev_mutex)
                      device_lock(udev)      [USB core]
  usb_control_msg() -- blocks waiting for
                        the device lock
                      mutex_lock(dev_mutex)  [pre_reset]
                        -- blocks forever

syzbot reports this as a task hung in usb_stor_scan_dwork(), with
cancel_delayed_work_sync() in quiesce_and_remove_host() unable to make
progress.

Fix it by making usb_stor_Bulk_max_lun() self-contained: use a private
on-stack buffer and the usbcore usb_control_msg() helper instead of the
shared per-device resources (us->iobuf, us->cr, us->current_urb) that
also belong to the control thread and the reset path.  With no shared
state touched, the transfer no longer needs us->dev_mutex.

In usb_stor_scan_dwork() call usb_stor_Bulk_max_lun() outside the lock
and only take us->dev_mutex briefly to publish us->max_lun (and the
SCSI host max_lun).  us->recv_ctrl_pipe and us->ifnum are set during
probe and never change, so they are safe to read lockless.

Reported-by: syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=30552b4cbe99d6d91306
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/usb/storage/transport.c | 27 +++++++++++++++++----------
 drivers/usb/storage/usb.c       | 20 ++++++++++++++++----
 2 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 8de3015bce05..961595a6faca 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -1075,27 +1075,34 @@ EXPORT_SYMBOL_GPL(usb_stor_CB_transport);
 /* Determine what the maximum LUN supported is */
 int usb_stor_Bulk_max_lun(struct us_data *us)
 {
+	u8 lun;
 	int result;
 
-	/* issue the command */
-	us->iobuf[0] = 0;
-	result = usb_stor_control_msg(us, us->recv_ctrl_pipe,
-				 US_BULK_GET_MAX_LUN, 
-				 USB_DIR_IN | USB_TYPE_CLASS | 
+	/*
+	 * Issue the GET_MAX_LUN request using a private buffer and the
+	 * usbcore control-message helper.  This avoids touching the shared
+	 * per-device resources (us->iobuf, us->cr, us->current_urb) that are
+	 * also used by the control thread and the reset path, so the caller
+	 * does not need to hold us->dev_mutex while this (possibly sleeping)
+	 * transfer runs.
+	 */
+	result = usb_control_msg(us->pusb_dev, us->recv_ctrl_pipe,
+				 US_BULK_GET_MAX_LUN,
+				 USB_DIR_IN | USB_TYPE_CLASS |
 				 USB_RECIP_INTERFACE,
-				 0, us->ifnum, us->iobuf, 1, 10*HZ);
+				 0, us->ifnum, &lun, 1, 10 * HZ);
 
 	usb_stor_dbg(us, "GetMaxLUN command result is %d, data is %d\n",
-		     result, us->iobuf[0]);
+		     result, lun);
 
 	/* If we have a successful request, return the result if valid. */
 	if (result > 0) {
-		if (us->iobuf[0] <= US_BULK_MAX_LUN_LIMIT) {
-			return us->iobuf[0];
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
index 823a4b2e9033..43d333f3ec4f 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -980,19 +980,31 @@ static void usb_stor_scan_dwork(struct work_struct *work)
 
 	dev_dbg(dev, "starting scan\n");
 
-	/* For bulk-only devices, determine the max LUN value */
+	/*
+	 * For bulk-only devices, determine the max LUN value.
+	 *
+	 * usb_stor_Bulk_max_lun() performs a synchronous control transfer and
+	 * must NOT run while holding us->dev_mutex: the reset and suspend
+	 * callbacks acquire us->dev_mutex (via usb_stor_pre_reset() /
+	 * usb_stor_suspend()) while the USB core holds the device lock, and a
+	 * concurrent scan would then deadlock against them.  The transfer now
+	 * uses only private resources, so take the lock only to publish the
+	 * result.
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

