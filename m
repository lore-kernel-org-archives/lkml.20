Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21753F684
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170297; cv=none; b=Tb8oYAlUGobXBvq0gPI1F3G3E4GaxZHVQtRgSxtX2f6UOttqAXHlaf6kVPX+1omhT99gQ+mNDR9lHYsFi1NaI0alXxPdoagw7a3nckP59zEZGtzxJhM5bZrumAhPDI3+WUmuR4BIRdq4qEuFS0gkgOtD+ll1e1E6fOFvfmAoFas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170297; c=relaxed/simple;
	bh=P0Sg+F0KKBPtMKdv7lWgT3UyF3Ll76cOvOMLZIK6NBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNT7NckWzWl/i6qOlt7m2wqCj8SvKOGWOr6EkLcZkCWn+G87aTXYaC9WXMnDDEvUWGt80mfL3kaPL60oRFvIvtUh9T/b0L8uTvmGdQOfiSawAKUKq4+kFg4JeAUXx/ewLj2qdws4Fe1rp+Q3IJ4sZulgenVag5Maw7y6PD2JRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+/DsjxN; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+/DsjxN"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac803d3bafso8051a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792170294; x=1792775094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTK7t+qRWhyCyqZmU5cFtXciAINVp6GCAy+u+kWv2kg=;
        b=j+/DsjxNRn4pSCNitIQqwqo6wCfmoBXav8ejxpJuFxM2XRETwZuuFL86CX/AI+ojyA
         IwBl23VCelSDOOuhGAm528+D/yjCHpKezRyv/oMASUHCiu18+NvZihJd27CsO8MkdK8M
         zq23nS1PdWUljzxjoH4KKbbtOMiQcIH7tgrsO7DTgDaNBHuCOpn/C6Nd90k6eUotAYsJ
         ubJUY44LMaxXs2ZWDR4Ne84VNbSkgadDGghgYhOtntD9jiPioej3pDvZBofA2+QLVdXk
         ChyMdtl7/RdiWIqomOw7qeHZDvWyEVvbjPY/GiObHZfr+eVtm6y8PSzByDyyR4G8WELp
         iZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170294; x=1792775094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eTK7t+qRWhyCyqZmU5cFtXciAINVp6GCAy+u+kWv2kg=;
        b=cLUVQuzj4L4RUcns5nzZXOhJPdLeEUUyZZ4Dw2SdUXlpgYMTajMdjR1GsaCPzNqXdq
         tuEdHP3CDXSYbi7iNzs1zoMRdcN4cbjnj39SXivFZpfez74UAt41mBWBdb2NOWioTcu+
         JpDRnBLCAAgpqm1k42UPv47xCIniG+WTExbuHubBNddqAJbchT5qQSo1JhNDBzL+LQX7
         zU9H8oK6KI8QiIYncKv1a6ZEAz0z3BmWhacHvN8SpFEY/rHnrYDvXG/mxiJTkAhrq1Qh
         hb3Y3bNna9Js77AAw+mG1pADmMBy/1h7ogxxXX24BwO5BiuFv/8F1D5goIeWzni0kFuo
         GVaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsqPF9BsVRdurpkP2I8Mhoh3K5hP5zdPp+NwlWizOTXHvqhjqZTGMZSMSxGcJg/kKkbNTthV0/qNiym/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMeiZOVm5wKbU73S809Q9IKhF1VOX+qfgQKg+L8qT5+3FKL8/z
	NF7uv3TRF2tNsiaAxMVRHM6oq+rRi5oF92qm0zrhYYQfw6fAgxUd0b6uFowGSF0f
X-Gm-Gg: AYBFou1RThDsRQPtM69G4yB/j2LjGy04RAJmP8htqAPZrWPWYvtvKPUFwvKWjtVMQSm
	VTEuVX4PLiVVb8upISr3mU03D/cdvBaespmCWNFE9DBi/EOtZiaQRpVifzVKZ4rj5UBL+FYMmp4
	RGLQEoPDdpljF6G7oe4ko1jMcYPdrkO2LCiVoKjhslAF5xyM82pEdykXEVDuIHsA883HkgXk8Z5
	bXamOPSKQoh99IkL3fgvhNd7NmvrBmFhxsMk5SihJBIJak7E8E+wQLuiE5dT+VJROs+6fS9Zlil
	cZamzmkYwYEB1Kqz8uOI4EGagFSx+EXkGmWsU9b9TniM43x/SZzjaXCwCh6mKEGMyWVlQxtWWGf
	9rxKAyWUkwRYAqq4Oda1n7NplX0+anSE0JSJCzdgqxrBqb8fnW4Gma6bd711CoatTvcjW4CS38n
	2CkYj/a1eCMF0u9TirKz+kpFmgqyMAFYU9mvZcX6dwL4Wv7JnUCTfCJ9VLXiqoVIF8gyYy78lDQ
	13jKKd86F8aP88=
X-Received: by 2002:a17:90b:48c5:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3acef4e131cmr275516a91.30.1792170294449;
        Fri, 16 Oct 2026 10:04:54 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([223.104.67.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm9928587a91.0.2026.10.16.10.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:04:53 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-kernel@vger.kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH 5/5] Input: touchscreen - replace strlcat() with strscpy()
Date: Sat, 17 Oct 2026 01:04:11 +0800
Message-ID: <20261016170411.51025-6-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016170411.51025-1-shlomojune6@gmail.com>
References: <20261016170411.51025-1-shlomojune6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sur40 and usbtouchscreen drivers build the physical path by
appending a constant "/input0" suffix with strlcat() after
usb_make_path().

In preparation for removing the deprecated strlcat() API[1],
replace it with strnlen() followed by strscpy() into the remainder
of the buffer, as commit 34b228b739f5 ("HID: usbhid: replace
strlcat with better alternatives") did for the usbhid drivers.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 drivers/input/touchscreen/sur40.c          | 4 +++-
 drivers/input/touchscreen/usbtouchscreen.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 77ec2c94b91fd..72ec3882e3d40 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -657,6 +657,7 @@ static int sur40_probe(struct usb_interface *interface,
 	struct usb_endpoint_descriptor *endpoint;
 	struct input_dev *input;
 	int error;
+	size_t len;
 
 	/* Check if we really have the right interface. */
 	iface_desc = interface->cur_altsetting;
@@ -691,7 +692,8 @@ static int sur40_probe(struct usb_interface *interface,
 	input->name = DRIVER_LONG;
 	usb_to_input_id(usbdev, &input->id);
 	usb_make_path(usbdev, sur40->phys, sizeof(sur40->phys));
-	strlcat(sur40->phys, "/input0", sizeof(sur40->phys));
+	len = strnlen(sur40->phys, sizeof(sur40->phys));
+	strscpy(sur40->phys + len, "/input0", sizeof(sur40->phys) - len);
 	input->phys = sur40->phys;
 	input->dev.parent = &interface->dev;
 
diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 0bbacb517c286..e6f88bd9a3408 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -1438,6 +1438,7 @@ static int usbtouch_probe(struct usb_interface *intf,
 	struct usb_device *udev = interface_to_usbdev(intf);
 	const struct usbtouch_device_info *type;
 	int err;
+	size_t len;
 
 	/* some devices are ignored */
 	type = (const struct usbtouch_device_info *)id->driver_info;
@@ -1513,7 +1514,8 @@ static int usbtouch_probe(struct usb_interface *intf,
 			 le16_to_cpu(udev->descriptor.idProduct));
 
 	usb_make_path(udev, usbtouch->phys, sizeof(usbtouch->phys));
-	strlcat(usbtouch->phys, "/input0", sizeof(usbtouch->phys));
+	len = strnlen(usbtouch->phys, sizeof(usbtouch->phys));
+	strscpy(usbtouch->phys + len, "/input0", sizeof(usbtouch->phys) - len);
 
 	input_dev->name = usbtouch->name;
 	input_dev->phys = usbtouch->phys;
-- 
2.43.0

