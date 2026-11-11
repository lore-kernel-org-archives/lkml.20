Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363424;
	b=KFaRw9QzqPtZeJYJzG1Sqgcf8KneLvUa6AF9hNbMu5LhX+CSZJVmc1xWvikFAQImuMWG
	 7nx2G0SZIJN8uvi1cFCkpsyFm+LkKyTzkIkzYk9eylo15gNT3IDMGWeJza4KcuNqoulyu
	 Nea66geiJS1q/5gSWox/YKnBZuJyYJQ/AQpRsBs8RDa+mUUlCO+PRQRqIaQuEP9APvnQN
	 Z63UFhN8xvLnYGfOk0ittxygga4vt17KxYmh9az/+oimRdrlz/cl00Uvpb4fxyA9jXkyg
	 S5+U5Rpt25qTYg00TwOT6+rI6UT/NdDeqtdqRxH8QuJ2QgtoVsEwSzt1WaJ4S5Y3egw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363424;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fR/5E9OqWvtcG/puLEKNqXGX5VJYN3AZ6049pcTy/pw=;
	b=lSrxbFy4UN8uCw4kogV1NOkrMx6prxPHpODG0ibLL/furmn3CswMakG4BDsFPChc39/w
	 rfmFDhTcDSc1ZGyZkb3Uae9gQ7EqiOaRCnDef6i6LoYaLcuzHdhgIyajIv9CEZuYK3T6B
	 Z+rgnm5D0hMJMdHhFngXN8QRT0bIQr4xtoP0U5aaK4pmYEEuJj8EjAfU4hQ/jB43yAepb
	 8Sp3GFaTptUV+qK5o2WdssLK5s7GPLqYtpOWjZEoR8YrJss+3dOihry6d9eUUGjJIdzq2
	 x/jYpmy/BXkylE9Zoz69dkbg3wfFZvWiw+S30HC+VGuOCGyQ1tQQjZu+i6f+6U+7hhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=f9pK04EF;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17269606A331;
	Wed, 11 Nov 2026 02:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17269606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=f9pK04EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=f9pK04EFsF8xTYUn4/ocsBuy1osv0CNwyS9AYx6QizCWqOvoIcEGFlYMhsgGMxVGNXpBdTx3OhTxF
	 7m7XS7rxP+HB+pj47SenSJkPFpE/egcpzPgeeZCth4OJNAsx23qh2+j72M2jYilYXpkqtZ7bK87BK3
	 jpYK786RN8B5vYyE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af3d01862b-aea73;
	Wed, 11 Nov 2026 10:16:58 +0800 (CST)
X-RM-TRANSID:2ee16af3d01862b-aea73
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af3d01737a-ca70e;
	Wed, 11 Nov 2026 10:16:58 +0800 (CST)
X-RM-TRANSID:2ee56af3d01737a-ca70e
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: gadget: f_hid: fix report_list entries leak
Date: Wed, 11 Nov 2026 02:16:54 +0000
Message-ID: <20261111021655.37851-3-shishunbo@cmss.chinamobile.com>
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



