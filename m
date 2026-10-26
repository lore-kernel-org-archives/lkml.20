Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035184;
	b=kx9fiZVLETvdlkNMm5m/xkdek/er/TTr9sSwh/gFEPMtgxShpKFro2UARBEBGA33YpM+
	 pVw/Du06V0Wu4cXyx/NHy6JqVkubg69CmJ1MLU3sXsB4n6ShPraLgnQhOwZk7OaAZTRxm
	 oMo5rTo/pL7DstfCiWzhciVh4CKvNQd4eRivbcSoiEmloc0KoY9E8FbzP5Dt/V6SBsbV2
	 asd3ggN/oCdHoz20IaVAeejTfgadN1pa3BrQnXGYv565d6Ek+G9d5yIvL2V41reesVmrv
	 1cWoCbxRJ4YAAA+FSYB9piK1/gxQ//hJSjLp6PgEwFAQcgeYPcxtFiU6zVibpZVmDxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035184;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gZs3jKMIPqWazalHPQYcPiZqTTC7ha5sI4oY/dMv+ow=;
	b=evRHRnpNh/Ylt0AuKH+OwCvqyw5QB5+nNrdZnc+Ovf8pnVc8UYl2xU3rx2A7ePv9fa5+
	 MqVVrA40gFfJw7Q5iqkuBq+F1t7uYiYbHBgYu0zkG3i0+dEFRkbUTeWXRa0Hd+qnAM9gI
	 17nYtHGsdiRoRHFdm0RdkeDJXk1h38JkULG95opi5WctIokWHAHmXOLOprJ7BBjloPf3i
	 eikreB54DAktquE9TLRZiNe7aplZUlHFvIhgY3ni7vBWKd1j6Isx3vkUTsU7Igd6w3HFh
	 yA3GZjU+8GKREvQPsuomK79ecg5CUepV263ihLrqB0YubCSVLzCMi3UXiPpNMzGxPZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="oqi/HOuS";
	arc=none smtp.remote-ip=203.205.221.155
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EC5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11EC5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=oqi/HOuS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793035174; bh=gZs3jKMIPqWazalHPQYcPiZqTTC7ha5sI4oY/dMv+ow=;
	h=From:To:Cc:Subject:Date;
	b=oqi/HOuSO7UQBJlrB4SxqMSB1Iv8Cr7Sh4VPDJfSaMkkKfh3bETLOz5ecCSWPHTxD
	 +SsFYzvpHlfd6W3zq6qNx6PTIROJkft3TNb8z6HIkQdXc88qMNyHxBSpp4PyUADf+u
	 aR7lZ8jWDm1klpvO4nfzGsNNfb8zBjh53h+QixJE=
Received: from XP-PC-fangsz.localdomain ([112.65.82.64])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 4A083AB5; Tue, 27 Oct 2026 01:18:32 +0800
X-QQ-mid: xmsmtpt1793035112ta3usl98z
Message-ID: <tencent_D7A5991BA49FFDC9706385B0D2BED254EF06@qq.com>
X-QQ-XMAILINFO: MzNwb/pqyJTkaJMRF3aR0mtj43p4VetxXrcVwWEHNudQyB+IUfd3Bd0dvzawae
	 lcKMhoEXDcIgW8tfUcCgb4i9FCnkfDSLBJjOX7MIvJrbSntdGpqLgkZYTl5FUBMXWH6cnVOvxfic
	 CvUZAuqKASzlVT4kXHo2ib/H56AdUE6a8zTBxr1Cz1PtXnAl8k8vuG+pPjJu/v0IxrrIqvPsWsON
	 Ztysjh9/Y75wHiYPpekJNMkvNyyynQQQAdqJxWRUbt633joX02K8gpxcJe9/rHzEXsBuX8nmHQM8
	 ViB1iOq2LrQjqEDg08VZert4L+hggYt5mgyf92tD5TmhQNishc3CPM2kwgRmgLz3oEN5qky/x0P/
	 hWoG1MJyAj/KjPa8vUceapgh4ms1oYSaK/naLG+PQwXLqNCxNYwRsNfj5mvpLlkMS9TPNRRl/En/
	 FSAR89VK+DjIPtcDKBIDsYeZoNJB773SGbpoWw7uSxKCy0x111ghe8Zx+wd8b4NPIpAFlowC/nKR
	 QT+W4Kfja8lOyDsNO++po6tubeXs4OqtuoLaIsVXLSyB+N9w0FcqhOKG5TivSiNF4nt2lnscK0Pc
	 8TDm/oig+0dvH7V+gxMW5wu7GHdNaByowVkzxkeda6TZMsBegeQj0Als8m+PyJA+875hYuk8jYdW
	 qwOXVBbIMg2sKQ1UJd5sRzcDVZNCaCvYQAxLI2fNsbq7hBZjjOM7BJBwHKdL3GsInZsK7t1cZsq0
	 1DBNGH/DoZoJL/ynVwcf4skPpgjrhpZagmSWpSP9bUb4SP30rKheAxaFzMLx/HKwb/OfQdtDgbQo
	 2jeguXJfTyR9QChximcpYBdR+3YGnBM61r1k4qvTSRtIrCBOwW1NHEcQr0mjJNOOFTQjzPuLmWwH
	 afHB69wnCjRDZjRqn6MhoaBrwJRq8MxmUs7hrEDR67uDxhJoNJUpZIXK7CAFz+vKEyPAC0y+q4Ja
	 6cROYPZ/JXXH3RuEl/nWw6GxajaDDhC2mbHplxenTqmnD7t0LHndm7aSoe2kqL9Ucs9nrr+dShw+
	 XVQ2RvOUN3N3UkaYY5hoVrt3mXrmPqmXQCIKtAGgWw1O3whZAPbAnHXAFGTC6Zy4+RqHmaIw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: fangsz <315539811@qq.com>
To: tglx@linutronix.de,
	anna-maria@linutronix.de,
	frederic@kernel.org
Cc: linux-kernel@vger.kernel.org,
	richardcochran@gmail.com
Subject: [PATCH] posix-clock: bind the device before the cdev is published
Date: Tue, 27 Oct 2026 01:18:32 +0800
X-OQ-MSGID: <20261026171832.336277-1-315539811@qq.com>
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

posix_clock_register() adds the character device and only afterwards
stores the device pointer:

	cdev_init(&clk->cdev, &posix_clock_file_operations);
	err = cdev_device_add(&clk->cdev, dev);
	if (err)
		...
	clk->dev = dev;

device_add() publishes the /dev/ptpN node through devtmpfs_create_node()
before it returns, so a concurrent open() can reach posix_clock_open()
while clk->dev is still NULL. get_device(NULL) is a no-op, so such a file
does not hold the reference it is supposed to hold, while
posix_clock_release() unconditionally calls put_device(clk->dev) and thus
drops a reference that was never taken.

That stray put frees the parent device early. When the character device
is released later, cdev_default_release() calls kobject_put() on the
already freed device and the refcount saturates:

  refcount_t: underflow; use-after-free.
  WARNING: CPU: 6 PID: 4270 at lib/refcount.c:28 refcount_warn_saturate+0xec/0x140
  ...
  Call trace:
   refcount_warn_saturate+0xec/0x140
   kobject_put+0x160/0x208
   cdev_default_release+0x78/0x90
   kobject_put+0xa8/0x208
   cdev_put+0x20/0x40
   __fput+0x2cc/0x2e8
   __arm64_sys_close+0x3c/0x88

The window is small, but it is hit in practice once a driver registers
and unregisters the PTP clock repeatedly, for example on every link up
and down, while ptp4l keeps reopening the node:

  [   50.048138] eth0: registered PTP clock
  [   50.767426] ptp4l: refcount_t: underflow; use-after-free.
  [   55.735110] eth0: Link is Down
  [   55.816736] eth0: registered PTP clock

The ordering was introduced by a33121e5487b, which added the
get_device()/put_device() pair around clk->dev but left the assignment
at the end of posix_clock_register(). Bind clk->dev before the character
device is published and clear it again when cdev_device_add() fails, so
that an open() racing with the registration always finds a valid device
to take a reference on.

Fixes: a33121e5487b ("ptp: fix the race between the release of ptp_clock and cdev")
Cc: stable@vger.kernel.org
Signed-off-by: fangsz <315539811@qq.com>
---
 kernel/time/posix-clock.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/time/posix-clock.c b/kernel/time/posix-clock.c
index dab3729..1c61382 100644
--- a/kernel/time/posix-clock.c
+++ b/kernel/time/posix-clock.c
@@ -163,15 +163,23 @@ int posix_clock_register(struct posix_clock *clk, struct device *dev)
 
 	init_rwsem(&clk->rwsem);
 
+	/*
+	 * cdev_device_add() publishes the device node before it returns, so
+	 * clk->dev must be set up front.  Otherwise an open() racing with the
+	 * registration skips the get_device() in posix_clock_open() while
+	 * posix_clock_release() still drops a reference for it.
+	 */
+	clk->dev = dev;
+
 	cdev_init(&clk->cdev, &posix_clock_file_operations);
 	err = cdev_device_add(&clk->cdev, dev);
 	if (err) {
+		clk->dev = NULL;
 		pr_err("%s unable to add device %d:%d\n",
 			dev_name(dev), MAJOR(dev->devt), MINOR(dev->devt));
 		return err;
 	}
 	clk->cdev.owner = clk->ops.owner;
-	clk->dev = dev;
 
 	return 0;
 }

