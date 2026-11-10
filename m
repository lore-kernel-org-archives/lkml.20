Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280806;
	b=lg1uAR1atLpgVI5huTwlHNcM78weZUgwaEmHfGKLjF5fkUk6KoJO4y1OyQ/FQ1FEMCOf
	 lNcOkLey+zlnQisBSf+tOWK7VpxTmuSYRuheWf6LP6YkVcTUhgg+eToDWSEQoSEzJ342X
	 pI29Q9TxU1z1LgpnneOsn+RBUegJPxIITPhq13W4CkkzbYnnOe3uxTSKEeLK7CTILeuoB
	 cUgbLWxW8ZMYTq9111wszxMnxvHozKar2G2U689A894QCDts+l8gzhpd8wWHlOqtS8kdh
	 +aNgnHzNWRMff5BEIV+LwQVpDBl4DxA74JGu1kciGbvVesCpMltlI4AWR8mq05SjayA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280806;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=dBqtNyaZTHzYtirD5fNyhHxfUG0KdJEr5claBMIANu4=;
	b=0kO54Fuwnkgq+mAYqtmwUH1R+5VaRYF9TqEW5GDxJegFkEUri4W/bx+VqIzemF40j5sw
	 bOZIkfPlleB5gCh8rw8S+GWovYU80kx2B8aE8GCV0v1kNXohtAQjkcAzMRY06s3rjJG1p
	 h+/cZ3gCFZpIwMPWNnrGrZDpxeXsvoY+LYrLYNJ20D0wCSuQtmsTIxL/8LQ/8UdL/LD4G
	 /l86c6yaU6DZDCn2o/MJaUsFNIf3qo3lCXhVIG5p6EqgjEWC3+GBWkVOOYgLG7gAup63i
	 VmyYurkIeL19odnh0IiExS76VNRzySOtwdls2l6QZyycPOgXDvIrtUp1f6lGsrsHw6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=QyObajbn;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA53606A321;
	Tue, 10 Nov 2026 03:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA53606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=QyObajbn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794280720;
	bh=dBqtNyaZTHzYtirD5fNyhHxfUG0KdJEr5claBMIANu4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QyObajbn5hQXvtN5hco1EcdwJRdVVLkxcL0unxnpgI8wJseMCg/8sD4SPApuq8Stp
	 t9ssNHIB/HRj4USG2R6Bl5sFpyx9ITSjzMoiNxPjPpid/TszXsQf0Sdaxt5ZWeTpxU
	 mykiEOsqAdETlZ1FxB5P5ktBX7niVuJiDUhMmY/s=
X-QQ-mid: zesmtpsz5t1794280715t46df6749
X-QQ-Originating-IP: VTjjW/EVU7TX0irIdEVOQLlnWDNjktqY9EA8ib7wjXo=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 10 Nov 2026 11:18:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6969336988716536493
EX-QQ-RecipientCnt: 11
From: raoxu <raoxu@uniontech.com>
To: nkapron@google.com
Cc: gregkh@linuxfoundation.org,
	luiz.von.dentz@intel.com,
	brgl@kernel.org,
	pengpeng@iscas.ac.cn,
	pmenzel@molgen.mpg.de,
	raoxu@uniontech.com,
	mlbnkm1@gmail.com,
	christophe.jaillet@wanadoo.fr,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_printer: Fix fsync waiting for active transfers
Date: Tue, 10 Nov 2026 11:18:32 +0800
Message-ID: <09D38BF2C904A309+20261110031832.219431-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OcsP2t8H9eg4Mg4fGSVflRHvGtWUwemtJqKzxCU3wYzvo/qV+burdu3L
	7E/47RaMjVRSWRoMtJRIzR4TEklBW3Tim4DVh+ze4zoaxFNuWEpB5VGuLBZYy3EnhhWC1hn
	O/JE+ufxlBmN08SkcUxJ/QiRsWTB3LsCAYeiCx9mTkVMYpcyRJxNtou0DnMDa/Gc2PsrBQl
	ZA8NB5DGlV0GJ5dUp6Pha743tymRM3hMi/zLM/TvBIQROF8BvHiGBYSgeDu4UJfxxolr3wW
	deKb7HAc10hhh+rSYBX77Qli8iyWPwUyIh3/Sbc4R0HjS4Pe+0MlczDzma2IpE7mnZBJS9E
	U4nbyY/7BnbjrOHw0ujhIbIg8S3v/0SHLL3GXKeTf7yN/wRWBQgxuifd8sgj+DVK+Usrga+
	jDCqUU0pJLvzkhxf0eBO3+pEtb4/uoS9yw6Z8+LXQxbXLQWNlwfVkCaqkPtXsshzDKVc+31
	v4M/Xhk/CNkp5OeeHB534xENOY0kcpf+ZxTarwXo3ynh3C/fDpQpBKVvlDXN0Dr7GfbnIij
	ZVCVqash3KMx1kl6O6TAjRzIMm9H76KAdUO4i9gBrRG3L1XAFYg/Nr/quCMFYljY93Xv1UX
	do/YMt6TvJn8NberhTQAk+qtyU6HyTuGuR7/uVQjkX4m1kv0FRbHPKPHOWBZYNTmOY5MepI
	rIkMtgZ81Y12PTHLa6lA2KzU6yQRtT7dEoA0oLGBnAuSoPpGM1gjYzgrWkWSy07RsMzF1Zo
	lL8O++RmGuO7AI9FUYK0RV78OwWI7Q5Jd5DEXSAWqSxBhweFOVC64J4Qjmh+o+hBz869QLy
	wcyMjeZCfJl1mvGZmXb7jSm+KThxVhM3ElUTASOhF0kJZ7cGpXOr+H4M8PgLvrwMYIX47hM
	d1dVp35pIIRRn0OIKmrBFFmEW32gi1kj6I7Bv7mw4y2FkjkZSsOzee/4Nj61mDabGCKdqsl
	Av2oBg8AebPLiHuIfD7EQxZryA5LrEel25/MSlG8fnFwMBCP1NC66qPDz9vTUzjZrtqq6dl
	YUvKFyB83lnnu70cS9UW0J8zRESWdXnAVsFK9zAWFPRpHYHWOZ8if5SMV8WUeaLvnKaEp/k
	QGhChtMm1YEYFZVs6Y7VZ0JPC+Eo83bMSP4bpejJuqB
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

printer_fsync() checks the list of free TX requests before deciding
whether to wait for all data to be sent. Once a write queues a request,
it is removed from the free list and placed on tx_reqs_active, so the
free list can be empty while a USB transfer is still in progress.

This allows fsync() to return before the queued data has completed.
Check tx_reqs_active instead, matching the wait condition and the
completion callback that wakes tx_flush_wait.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/gadget/function/f_printer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1857d786110b..a2437c8e668d 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -736,7 +736,7 @@ printer_fsync(struct file *fd, loff_t start, loff_t end, int datasync)
 		return -ENODEV;
 	}

-	tx_list_empty = (likely(list_empty(&dev->tx_reqs)));
+	tx_list_empty = (likely(list_empty(&dev->tx_reqs_active)));
 	spin_unlock_irqrestore(&dev->lock, flags);

 	if (!tx_list_empty) {
--
2.50.1


