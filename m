Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384819;
	b=1kcQ20zSmSM6nvofGRUzmehRakPcV5/ZDW0Yy/k1KILvC+XPTwrS5hC0AODXW6pdngXk
	 q98uoGn94YqqsgixdrwvH8EX92o+Vmmt+t3XsPW179yH6h60pOgMi0ZvJHCB4snRR2/IG
	 ag1IAs82H3l+FcyUh0XrheWrMxuFnnKbTgcWZ4+Mo5ZBL5++6zJzKOqXgGALF2Holx30X
	 DhvEAkN51Cb7R3/Ypu23kKpKO+ZOteYEFx3gnATUPh2HwV/LarMlTzsDQTNAlw2WJidlq
	 1CwzcFij0d0dM3tNa+wjAzlo9FBdo7o9kbGAZKcv9K6aWbq3kZ2iMn14IoAyVcpTxLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384819;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fR/5E9OqWvtcG/puLEKNqXGX5VJYN3AZ6049pcTy/pw=;
	b=d7D/wKoEta/6hbqLIZOpk5qz/iN3Fnzmh6RNMLmGwKMYy2o08On9ntM4yNJ7r11vV2t4
	 qQFcZbEV2qE7HcY6LVb1631wdSN5Tb68KSOZaDKmQnIb8AgRAnpVJ9XHJub8OF+TtPBEx
	 3ClkxKsdDPH/JThVVmoZmJ9/4An0Zyg+P6i6ce+U6QHv+0eeTFWFBZpnPDtBK3kirp6v3
	 1Ltxuy44KGT5VU9pUCRmNteW/sCXgQqqc65F6F6hdqu/CusOkIxdwzXqWbjvv6Xh4dqW7
	 caFZVCL1h/8stfvHSOjWsS7d+UNikdM9YwNLD7XllOr01nAeHslsOD9Q28g7BZN/kZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YR822ax+;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123DC60A5BD4;
	Wed, 11 Nov 2026 08:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 123DC60A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YR822ax+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=YR822ax++qfXBRFD3oZ5NMTq51IRtmiPXFBrFX/o4lf3q0DOlY/JnIRgHWjfcM2vuXW7YL0a8VgDz
	 HoMvVN7QqEqDexgIy49krTKLkdDU44wc+fbtX+W/AcmqXpEmbWGbX7dv9YgP9Ll5dJoVlE+h4avguE
	 w5ZGz2SfwxQ+7OVA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af4239e97b-d72ba;
	Wed, 11 Nov 2026 16:13:18 +0800 (CST)
X-RM-TRANSID:2ee76af4239e97b-d72ba
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af42399a3d-d4b48;
	Wed, 11 Nov 2026 16:13:18 +0800 (CST)
X-RM-TRANSID:2ee46af42399a3d-d4b48
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] usb: gadget: f_hid: fix report_list entries leak
Date: Wed, 11 Nov 2026 08:13:11 +0000
Message-ID: <20261111081313.16626-3-shishunbo@cmss.chinamobile.com>
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



