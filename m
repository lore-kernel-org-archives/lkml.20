Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384814;
	b=YFxX3AalLyyNbm+BVHj9XNaLOl/Rq9W70Sc+zzeUPQDgmPljULNv3ri2fjHyB9r0IOAA
	 0zg9le/DoYdVRjmwzK7taSl4bO9UTTxMd5bA2CL9ApxzLC2k1IikwOf4AVn1y2n9yykS+
	 R9xpY/ZrYt3INcbHT8G32eSNigQPjODd7cCRVcFA2VTRtMubE8hLge4iF/TIXSAAZmyud
	 UOCVSpeyNQnLelDzOUzI+jkyWmJAWjOYq1ZPjbn1KZoqA9s8lQIz98hrXrdGIdfCbF9lG
	 RpTY0R3uRBL8pD+QVyFgncCBfH5Not+MP5GsDbO1l3KfoMPyDNp0eAG+QUj66+ngMoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384814;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/0qm+V/JbsUcSgexXUje3bg5BmK9mEGU66q9WKEV+pk=;
	b=HJ6C/hC+QVRJbU4VTkiNc6LwQvtm06p44I883o6f6pat1qPLvUL51E+m7KHdd4CzXW2U
	 AiNSV/M8yf3H1+tYmeQXwrv/KrrEampRb4eJzMz5sBvvL00SdF2V2LySA6Yckh5WqZDJJ
	 FE5FPK+zNApOwqGtMhYnM7x5WBeU8vLYyeWPytAnGKZDi1VASAsJ7qREgYERigJMOHV6l
	 22QFiRxTID3m3Adb2FTlB6rPfz/KiOUTGGyJpkbfEnRmFtV59qByARIonOqg/wIyMkAWv
	 epYJnEu01ZzJiOjVqUYUA1HLpSwiSyTvWXgk8piDpgZvQt5mMWOIA+R86W5ZAJDXUKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=FOvQJwOk;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F2F60A263C;
	Wed, 11 Nov 2026 08:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F2F60A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=FOvQJwOk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=FOvQJwOkIyeEwSb4UhtPT2pLALffanzjL1RJb/G2oWEu0LQUC0psTl4k0+dqg2iXoodVo+Qa1BgXm
	 wUmEleTufWo7I51Gm1WbqcYPP7y7QniWuKS/BHjxeV9DEPSaL4W1VkDu1sEqw8Tj1XFLgf7olXmlpe
	 3Fg6K1cUBtckmP/U=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af4239d7ed-dbb62;
	Wed, 11 Nov 2026 16:13:17 +0800 (CST)
X-RM-TRANSID:2ee96af4239d7ed-dbb62
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af42399a3d-d4b47;
	Wed, 11 Nov 2026 16:13:17 +0800 (CST)
X-RM-TRANSID:2ee46af42399a3d-d4b47
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] usb: gadget: f_hid: fix sleep-in-atomic-context in f_hidg_get_report()
Date: Wed, 11 Nov 2026 08:13:10 +0000
Message-ID: <20261111081313.16626-2-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
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



