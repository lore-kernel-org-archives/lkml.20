Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445776;
	b=GElkWQhZtTqs8I1l4ZMP8LX6JVYPZtXNYGOU33QfYJSBAduGBpSWZH700CtFpxGGlYnZ
	 Kb0BuD4QC8dD7vNPD4rIDpiAcFZRyvIWMYAa0CPnDUnN9LRPd31Pk+N8q59vaktUwgtMj
	 ylBKpPzyKsRMFZ0MNpj+VAfsmtbsTzibRlsACrA5OnnaBSg05GaF65vZbnmkn3DzqPtFa
	 CHVqvs5VOTDxtNSdnWMW+h38G+TyIFET/mKkM/42A+q287qc2Sb8ohMHDRMovkPIXqvpw
	 Bi02Frl8dLe3SpPddEhu+OrWydKM6/m00uGDlwEMDxdLe57+97d7/rYvPYjzICVcWvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445776;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fR/5E9OqWvtcG/puLEKNqXGX5VJYN3AZ6049pcTy/pw=;
	b=qb+cBo40eIZy3BYTfg7N8UCgai9+ice8L1KEItCZ6AtIWGoCpDRaItbQpPcMq+uAeVte
	 AzaQuHr2rFsvaVDw+QSx2d9MyknXiARA8LXnEBjVKudMWaJ0DQF+/yNkIskkeSuvqwRmh
	 kZtoqAWqOVshbZSO9oAjIi5wC7Ofn9Rg1cHRnp5rj/ZDhy/uRiXqINT3cPCJSz0trGSPB
	 tuJbvBIoJ5vjxu2Fx3dr/3xJ85sf0P19+OZPQEV94JF1DBjoJK1HdG6AEAQvunGllncIj
	 o2b4VYxrGI8yHT5DOLV0fXmdTpAh39m2JwEWeykf33VcULssgtC/9nu4/dzNqN6AL5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NHOn0Zp4;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83B9606A326;
	Thu, 12 Nov 2026 01:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B83B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=NHOn0Zp4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=NHOn0Zp4OTlVeEV7fUvPkUaIdIA0FmdhQB/7Q7GEef2jpuoUFCpNq3RDyG4mqcjVJ/gknTynzvITF
	 IMk7yBoorQVtlfFkgmnNJ2iyg599qPc6uuTFfHFDN7iKAiAo+IdJTlcW+/UGpsdVbtmtGoda/w85Dq
	 hhz1vU9zqTY7Izok=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af511cae0a-b734c;
	Thu, 12 Nov 2026 09:09:31 +0800 (CST)
X-RM-TRANSID:2ee16af511cae0a-b734c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af511c8154-ec50c;
	Thu, 12 Nov 2026 09:09:31 +0800 (CST)
X-RM-TRANSID:2eea6af511c8154-ec50c
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] usb: gadget: f_hid: fix report_list entries leak
Date: Thu, 12 Nov 2026 01:09:26 +0000
Message-ID: <20261112010928.23716-3-shishunbo@cmss.chinamobile.com>
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



