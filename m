Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA394AFE18
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190928; cv=none; b=Ov3vYYN73AMKaNhRH+1C0sL/uih1NK/fvldVCXCH6z9+ahHLwZCn1dQu/ys0U65bPUJLXsIoiZ56zSeioZlZvhGxx2erP+k60g1SiTpwm8UPM4ONsJxrv6FZbHsXvk+ZDxtEuTCIp5rJVmVCA/cnYgVnaxxAvN/zNfxjr/H6x5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190928; c=relaxed/simple;
	bh=WJIWy9fh/l8ZmjHfklKBecjb67wZEtuuUHbj9jkfuKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHcslD51UlnoYeIjDLwRFPi5iX/+fqvwNZaH0qI/5rxyZJjXXNKtZpJpflQeVSOvEqSpKe4fxIOks5vx7mBDj5IBT0iQWxFujgu3mNBHppNwXZa53tPcjYzWO/64AdQ7gu0FK/A05YEnGNWKycKVsdJ+KgKkyguIZGwCa0W4FN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=fQwMIBDF; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="fQwMIBDF"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1713A3F677
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788190918;
	bh=L6aw7f06zAC83jbztYhI5HbGQwyw/GeoofB5v9d9v8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=fQwMIBDFs/Nsu+IydmijUzh4xLHXH8l1E8lF+jlcOv9iBxajh10Kiq9LIav0Ivteu
	 sa8b6b1/F42CgO7OMtN/yGeWpVxF9ahoN0b96k+OFwAkQbXRYzl94Q0ONOeAcn5hOm
	 fBUk0B6Aoc+iLk18Bj0S2sB7lGfa/SoVTiNbJhgXg0Jrim7MwnuB+DbXDPPTJZlsqJ
	 3tmpxQswpwa0D5z8S90lIIPYA2rOEc2skdoyGp1f3C31h4WtwUkab5qiK5STFCIay8
	 wYxcUI2ClnQboe8QmhwnBk07Hp+VxUScLYCwa4YHR8qhU/fNIKRPHr11mLnxVon2LR
	 6eLRLLZObtZ+0Jd/eynpR8AOROEUfAb0v74uS4qsm8Dmhkdp2jAFxd/BgTrinjLOfF
	 C2xxhSXJT3nawrOwp8mKobGiA8D8y+z+vnFBZalu2Bo6PLLyeY9ihOIolBz46lTyVK
	 QARBlNOCcAf1cxVWHoYF0D7OUVjhiCn16E7HmeDxmpnfJdbDFBifHKYMGVCfZLPN5H
	 iKi7t+Q/QbzvTdj8tH6aTUc3KSYAMcFWVnmPK8HaSFdynFoA9wbyoNnByTPVsAW5fU
	 Eogd0i9uojRO0q1GNNGS/6lXx8mxKK8VGBe86sOSCwvneQ7j005HQJUjZofTQ9vnF8
	 KpTw/WUmOfFBGP8h4SY8+3U4=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso4968603a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190916; x=1788795716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6aw7f06zAC83jbztYhI5HbGQwyw/GeoofB5v9d9v8Y=;
        b=JptcYO14VLVD/0eyLKmQcwL64ZJ/6wuCZe4BfpnHN3gX1SeEfdHhzBUn6Am/ZOMwHW
         XWxwRPxIYQdWP2BuErwEc9lrZtcPQG1t1YA4i+kSXpm92Z+0KwUyK0d9KJ5M3GiVSSh4
         eD9tdtSECTIDWPTUZID32QDqPrl2VcHNETFAs1gKXwZYH9rA/3rN+wOWx7E45hL1a3ZN
         VikdUdTiAobzdn3XPQEwqnGSHVZWkp4/eI9sn4+j7Bv1t2VkfVCYo2MXEPGqIYZyBw54
         xY7CIcyrwTodjFPFNak+CuL9hyUz2DjQ/88W4VvODA/xXgHgmLKZnaubqUqKG1zlTcTl
         m43A==
X-Forwarded-Encrypted: i=1; AKwUvBxivdLwXrEUmm1YlWHGUwpiDcvHLj+awDrEMEWxk1uzPVu3/qlYljNisrNHio73UyawCeY4q91YZZFzJTM=@vger.kernel.org
X-Gm-Message-State: AFuF++niVtQKzirNnk+MICn5l9EW0sMyyvkoDGBA9fxxB1fb+liEsJwd
	ztovGkINPv4Mf+6mQOwmHhT84bxRIzDWEGT/t2JlVPD9HslokDbd16NVBwmpT1GBTnXEL2Nrc1q
	sh9arjcIwNu8EUcBGLLr16XJTuwH1hD3fi3McejOBc+0kVosrzsK7e6GCc5c5gqwIWW+EvdgnRw
	+M9WfnDbukxlJn/Q==
X-Gm-Gg: AYBFou3NpUAMMY0fQz6sEd+TFCwQ0c4T0esKxBgkurobee0cD9fTKFIhM4hCokFRfxS
	SaQcG+oIldNOOK4uDIaE0W0o23Pxif98+qxsS7MYY3sirUqvrT+kYUVMRTRjID2FKULDGVqDzUl
	fPiyBwJ5XgvDbTck8kDHcAWBVSVxymYVl2MSKEYZJgbpOO7PBEM2FfuQC7vlOV+5q0nEFup+5a+
	OW9/SV7/9Ap9J1rn3T3Nn27xFeZC9IP6B8bDtIKLVLD5onmfUebyL8PPFVqspbwZV4cEP4y9SYb
	U38Ri2HwHGZMKvBz2rjlsi4CrUnmMMIlaR3X4tXm/Cay86XHtDpoyGHmEa5EE/0D/j3fzxm7bXW
	DNdHwVlgBoG0rtAb5yXZuBSPM5nu+p5hH3i97QUw7+fW+kpOduJ/zmg==
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id 98e67ed59e1d1-396d0ed0023mr43261760a91.6.1788190916151;
        Mon, 31 Aug 2026 08:41:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id 98e67ed59e1d1-396d0ed0023mr43261680a91.6.1788190915629;
        Mon, 31 Aug 2026 08:41:55 -0700 (PDT)
Received: from resolute-linux.lxd (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d62b807sm36228a91.16.2026.08.31.08.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:41:53 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	=?UTF-8?q?J=C3=B3=20=C3=81gila=20Bitsch?= <jgilab@gmail.com>
Subject: [PATCH v1 1/3] usb: gadget: configfs: fix WebUSB landing page missing NUL terminator
Date: Mon, 31 Aug 2026 15:39:37 +0000
Message-ID: <20260831154139.55811-2-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831154139.55811-1-aristo.chen@canonical.com>
References: <20260831154139.55811-1-aristo.chen@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

landing_page is sized WEBUSB_URL_RAW_MAX_LENGTH, which is exactly the
length of the longest URL that can be represented in a WebUSB URL
descriptor (U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + 8 == 260),
leaving no room for a NUL terminator.

webusb_landingPage_store() bounds the URL with

	if (l > sizeof(gi->landing_page))

so l == 260 is accepted, and for a "https://" URL the second bound
allows 260 as well.  memcpy_and_pad() degenerates to a plain memcpy()
when dest_len == count, so nothing terminates the string:

	printf '%s' "https://$(printf 'A%.0s' $(seq 252))" > webusb/landingPage

configfs runs store() once per write(), so the 260 bytes have to reach
it in a single write to hit the case.

webusb_landingPage_show() then does sysfs_emit(page, "%s\n", ...), which
reads past the end of the array.  What follows landing_page is the
padding in front of the spinlock member, three bytes of it in the
layout here, and kzalloc() left that padding zero, so the read stops
there and the attribute happens to return exactly the bytes that were
written.  The over-read is harmless today only by accident of the
layout: the terminator is never written, and nothing keeps a new member
or a different configuration from putting live data where the zeroed
padding currently sits.

A 260 byte URL is legitimate: after stripping "https://" it yields a
252 byte URL descriptor payload, or bLength == U8_MAX exactly.  So
rather than rejecting it, give the buffers room for the terminator and
keep WEBUSB_URL_RAW_MAX_LENGTH as what its name says, a maximum URL
length.  The explicit bound in webusb_landingPage_store() now uses that
macro instead of sizeof(), since the buffer is deliberately one byte
larger than the longest URL it may hold.

Fixes: 93c473948c58 ("usb: gadget: add WebUSB landing page support")
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 drivers/usb/gadget/configfs.c | 6 +++---
 include/linux/usb/composite.h | 2 +-
 include/linux/usb/webusb.h    | 5 ++++-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 51df6d1d1487..4bc95f4b6670 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -55,7 +55,7 @@ struct gadget_info {
 	bool use_webusb;
 	u16 bcd_webusb_version;
 	u8 b_webusb_vendor_code;
-	char landing_page[WEBUSB_URL_RAW_MAX_LENGTH];
+	char landing_page[WEBUSB_URL_RAW_MAX_LENGTH + 1];
 
 	spinlock_t spinlock;
 	bool unbind;
@@ -1072,7 +1072,7 @@ static ssize_t webusb_landingPage_store(struct config_item *item, const char *pa
 		++bytes_to_strip;
 	}
 
-	if (l > sizeof(gi->landing_page)) {
+	if (l > WEBUSB_URL_RAW_MAX_LENGTH) {
 		pr_err("webusb: landingPage URL too long\n");
 		return -EINVAL;
 	}
@@ -1742,7 +1742,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		cdev->use_webusb = true;
 		cdev->bcd_webusb_version = gi->bcd_webusb_version;
 		cdev->b_webusb_vendor_code = gi->b_webusb_vendor_code;
-		memcpy(cdev->landing_page, gi->landing_page, WEBUSB_URL_RAW_MAX_LENGTH);
+		memcpy(cdev->landing_page, gi->landing_page, sizeof(cdev->landing_page));
 	}
 
 	if (gi->use_os_desc) {
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index c18041fafa52..0621a6a5cc57 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -472,7 +472,7 @@ struct usb_composite_dev {
 	/* WebUSB */
 	u16				bcd_webusb_version;
 	u8				b_webusb_vendor_code;
-	char				landing_page[WEBUSB_URL_RAW_MAX_LENGTH];
+	char				landing_page[WEBUSB_URL_RAW_MAX_LENGTH + 1];
 	unsigned int			use_webusb:1;
 
 	/* private: */
diff --git a/include/linux/usb/webusb.h b/include/linux/usb/webusb.h
index fe43020b4a48..a3febe726911 100644
--- a/include/linux/usb/webusb.h
+++ b/include/linux/usb/webusb.h
@@ -68,12 +68,15 @@ struct webusb_url_descriptor {
 } __packed;
 
 /*
- * Buffer size to hold the longest URL that can be in an URL descriptor
+ * Length of the longest URL that can be in an URL descriptor
  *
  * The descriptor can be U8_MAX  bytes long.
  * WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH bytes are used for a header.
  * Since the longest prefix that might be stripped is "https://", we may accommodate an additional
  * 8 bytes.
+ *
+ * Note that this is a string length and not a buffer size: a buffer holding such
+ * a URL needs one more byte for the NUL terminator.
  */
 #define WEBUSB_URL_RAW_MAX_LENGTH (U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + 8)
 
-- 
2.53.0

