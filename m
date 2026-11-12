Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445776;
	b=ct80toyzyPKSfE/T8MD62mLtwAY+ZW9FWdhClbFJ/ym2eBkK0e/N1i7riFIimV2skkrE
	 PN64tT0e8Cif3efCcjenIoS1fnugWgZ6bXILv0pbwOWFGtDdP5BL3139DGeX2lx6UuntK
	 oYt+ZMQpLDf+/jm8NNkVdn2/RG/ttv7Jkp4UuBVfun9pFv2wft8KyeSlY4ayQ4nAn2e3p
	 YRa2XIYkEGkeZcXONdxzfMHxgEI3Vv8TydAAkCZqT9pRpAnWkEB+tcj5HIs+BCfAsquDl
	 GAWsHLfvJTMR9ZtUzb4cvxHpVrQtpyJzQnPvrGO3If/UxZosSBFHIlI9Fn7vXperuVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445776;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/0qm+V/JbsUcSgexXUje3bg5BmK9mEGU66q9WKEV+pk=;
	b=wy9QhG6baujxxRKBsva7iLweRPy9HmoNGLPpld5xx0NbRc8zLDboRX5U5EpJugHeXPBL
	 3XbaOPQJC0oT4Gc1LcNjmWGJSzst7gf7K8ms7KYBqF7JkZeQIDCwizMj3JrC4y2neKQxk
	 yiQfebvZOpPXNRbmxAVXuSHvdzHJ7Y1dVfxBUuo1HIYEgcCIyZxWF03pSJm5WndZXNCr3
	 wsJRYLRbOtXpIKvp62MkNlONYPUyskxVbgkA9ZiNgNep7spB3VBn6pKxwHzZ4j5yhbw5A
	 aExHor8PgiDKLJEmB6jL1X75g9tpdOkXXrqz8ILi4qH/shigf//MsAJr1ucszOKcA/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tKEeWEB5;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF77606A31C;
	Thu, 12 Nov 2026 01:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tKEeWEB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=tKEeWEB5jAwRagTDhJ8XuAJhhlOmOsYLjA77k+g2imFwjjFZNZjp028X6FuTnqih3Zjjb6GRWBFzy
	 x3fSwDIH0bpjkeAf2ofccsQWiW7mXJipUUBEP/oeSF0jz+Ifw721iclpLdrUiuyiWi8XYQab4noj+P
	 6tKV/Sxc9Igrwnls=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af511cb402-a8114;
	Thu, 12 Nov 2026 09:09:31 +0800 (CST)
X-RM-TRANSID:2ee66af511cb402-a8114
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af511c8154-ec508;
	Thu, 12 Nov 2026 09:09:31 +0800 (CST)
X-RM-TRANSID:2eea6af511c8154-ec508
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] usb: gadget: f_hid: fix sleep-in-atomic-context in f_hidg_get_report()
Date: Thu, 12 Nov 2026 01:09:25 +0000
Message-ID: <20261112010928.23716-2-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
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



