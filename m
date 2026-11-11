Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363422;
	b=o6I8yUf+mpAj40nXMxP6Hrk/4bL2R5AD0DG4nREa/F7xYnrp1Z9UOV+IO2luGRPlQ1UI
	 khp7tfCcCW13zxoxZiIIXOvWR8Z4+Yodx+ylSAE3k5o2EZ4Nb4nobwzxx4zKcULtb6Glp
	 aNMU9/FUswIUpnC7kf+MvI2J1GV7pUUGbkZRimlnEqGLoXRu8L0fpYp+FWeTigLl4NGTG
	 3bOyXIpGCe4SDNyA/IE8tCLokns6WYTRdGwNpT36O8GB5Fc27CHPPbZCI/cJudH3v5/YT
	 xQK9piI//OktfJZWOnJRqZRs24sgWq1QUpGNWUtSFvkuCcsyDoZhqUv/w2lSAxXW+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363422;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/0qm+V/JbsUcSgexXUje3bg5BmK9mEGU66q9WKEV+pk=;
	b=DV188PgrEFFDTNULBt+U7m9Y9HVUJqVqhAOY4+ghK2rx3Vyi6WUAtPNcqjy2rxz7+YN8
	 TdFmptMFLIgzgBgEHB/zzBZvg9vH4nKMmEuRdYlHH6ss/RU9RNe5zDoyCOZWeP4Cn9nbn
	 G6HPvly2wz4Yuqw+Wx7sAlrq4Y9nyYAWi++pjvIXzKCa96knp+O4zo8SeFrR1/nBquHuP
	 RrWzVxGTRoms0ytxAsLpAlEDAcJ7ORIRoUm2+dyp8iBe6GFuccU29CphyiHwgA7dwnnDM
	 uwQWgRhFKq19jdaJu9jYmWt4qhrfdT0S67PBXvc/9KkIMalds07MJHQYILPA/3LqumQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=A5ORBRi+;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0222606A31C;
	Wed, 11 Nov 2026 02:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0222606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=A5ORBRi+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=A5ORBRi+0DV6v2XoET6k7o/2TZW3SbPLVTSr3p0+IbJWP472HwWwfFQYl97nn+POkN9C95T+f3pjl
	 VkoycwDDIRcA+GXYVmEEADviykZC3u45WCfQnIRRkDSWq7SKFL79420KSWQWfLlbgTUfv8puapj+3H
	 cLWDW2zakD2cY/rc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af3d01a081-d0660;
	Wed, 11 Nov 2026 10:16:58 +0800 (CST)
X-RM-TRANSID:2ee56af3d01a081-d0660
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af3d01737a-ca70d;
	Wed, 11 Nov 2026 10:16:58 +0800 (CST)
X-RM-TRANSID:2ee56af3d01737a-ca70d
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: gadget: f_hid: fix sleep-in-atomic-context in f_hidg_get_report()
Date: Wed, 11 Nov 2026 02:16:53 +0000
Message-ID: <20261111021655.37851-2-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
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

The second copy_from_user() in f_hidg_get_report() is called while
holding hidg->get_report_spinlock with interrupts disabled.  If the
user page backing the ioctl buffer is not resident, copy_from_user()
takes a page fault and sleeps, which is not allowed with a spinlock
held: it triggers might_sleep() warnings with
CONFIG_DEBUG_ATOMIC_SLEEP and can deadlock the scheduler on other
CPUs spinning on the lock.

The first copy_from_user() into the freshly allocated entry is
already done before the spinlock is taken; only the "report already
exists, update it" branch still copies inside the critical section.

Since the data has already been fully copied into entry->report_data
before taking the lock, updating an existing report only needs a
plain assignment between two kernel-memory objects, which is safe
inside the spinlock.

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/gadget/function/f_hid.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3c6b43d06a6d..b778eb633b79 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -654,6 +654,11 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 	if (!entry)
 		return -ENOMEM;
 
+	/*
+	 * Copy the report from userspace into the entry before taking the
+	 * spinlock: copy_from_user() may sleep, so it must not be called
+	 * with the spinlock held (and interrupts disabled).
+	 */
 	if (copy_from_user(&entry->report_data, buffer,
 				sizeof(struct usb_hidg_report))) {
 		ERROR(cdev, "copy_from_user error\n");
@@ -668,13 +673,7 @@ static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *b
 
 	if (ptr) {
 		/* Report already exists in list - update it */
-		if (copy_from_user(&ptr->report_data, buffer,
-				sizeof(struct usb_hidg_report))) {
-			spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
-			ERROR(cdev, "copy_from_user error\n");
-			kfree(entry);
-			return -EINVAL;
-		}
+		ptr->report_data = entry->report_data;
 		kfree(entry);
 	} else {
 		/* Report does not exist in list - add it */
-- 
2.53.0



