Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919861;
	b=cz6ttYnmurC5FkofApxBGITDRJmBom6ddcolvaP9TnlPjoiiV0cfhuBJY+3oq5FUQuCJ
	 rpkCHIyQuwKK2YFvEeTQF0o1X5Tf6ECk+BRstcNvIM6O4zqlBkkje043+dnkKscSlDQAV
	 BZraKzPT5e6sXnrErqFdb4hO81r9h4aaPUUTzWDOkq0AuGeyyIQIjrbfp+1tGnOPOW6Uk
	 GRF6ai4wfXwZLaFdrvxdR2Ak8yAQaoxTkWBKW+CNgrTc6GXSvAT1FH8f1ZYLiY4THePe9
	 qt/AkX9jRgGe5fNE9qE5H4HA3u2OekkkRoQjAgvUdaHbPBRgoVpcxz9je0U1jnq9C8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919861;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fR/5E9OqWvtcG/puLEKNqXGX5VJYN3AZ6049pcTy/pw=;
	b=LBfClozgHBJ1NwJzzjr8SixvMWn/UENHCIXIXg4Jur7wdZvx+yR80DK+Ix/ZB02EpR1u
	 XYXMGhjXS4l/82FTowP0g6lMJ0BVM2rlzj8lgTYU0zc0/sCX8YLgg6FJL8Ov01YdTSkd4
	 raPii5HPxasEDiju274TK6YtsJZsuuuBvGkLJnjsWr1EOCDcocCQJZ11upPPAOMdiabb+
	 M1eiiv4sU5ddVsTWpsZQjF3Ppk70VzpiA2BhYfJ5114Gpqbu/SMiIXapvEc8Wfkh4Wqs5
	 SUAveQ9Rmfldq4BDcjm/8/rcxW4cG3m7vg8oe6fPsUhg/yUwd0uVBb4HOxfRmzj3acA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=zxkYc5Qp;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B589606A898;
	Tue, 17 Nov 2026 12:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B589606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=zxkYc5Qp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=zxkYc5QppGAPjG8oUK8Xb3icmkqZMVVJcAhPWREGxV4VyxidEn3cEjUMSrH2mHr0PUVmkn8NWD/Rc
	 Aj8Czzcse+AbmCBaAPHuQbYMSBUSb+xW1hTbGdhNVP8pjKAx79rak4yLQZQj977UAyBmhz16so82pc
	 ZhoMxOncyN7aE6wg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afc4dac659-080a0;
	Tue, 17 Nov 2026 20:50:56 +0800 (CST)
X-RM-TRANSID:2ee56afc4dac659-080a0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[123.121.1.242])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afc4dad71e-b1c11;
	Tue, 17 Nov 2026 20:50:56 +0800 (CST)
X-RM-TRANSID:2ee66afc4dad71e-b1c11
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 1/3] usb: gadget: f_hid: fix report_list entries leak
Date: Tue, 17 Nov 2026 12:50:49 +0000
Message-ID: <20261117125051.5646-2-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
References: <179486710796.2938203.13522037990167268712.b4-review@b4>
 <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
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

Each GADGET_HID_WRITE_GET_REPORT ioctl for a report ID that is not
yet in hidg->report_list allocates a report_entry and adds it to
the list.  hidg_release() frees report_desc and set_report_buf, but
never walks report_list, so every accumulated entry leaks on
function destroy (e.g. when the HID gadget is unbound and the
device is removed).

Free the entries in hidg_release().  This is safe without extra
locking: at release time the function is unbound (the workqueue is
already destroyed and userspace has no way to reach the ioctl).

Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/gadget/function/f_hid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index b778eb633b79..d7ba30323414 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -121,6 +121,12 @@ static inline struct f_hidg *func_to_hidg(struct usb_function *f)
 static void hidg_release(struct device *dev)
 {
 	struct f_hidg *hidg = container_of(dev, struct f_hidg, dev);
+	struct report_entry *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &hidg->report_list, node) {
+		list_del(&entry->node);
+		kfree(entry);
+	}
 
 	kfree(hidg->report_desc);
 	kfree(hidg->set_report_buf);
-- 
2.53.0



