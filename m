Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653025;
	b=TDjcbPpN4toQtXnSbrqibrJK6Hepl9/8DIdOcRDwTOYTLMKCubYxXQT0tj4jIBns5MOY
	 zRTKjZmr98vcaiO1L6ASSmuqW31Td8jcDfzFPbdML3k30pbk0JU7RYmIXM/8EErkLqQHs
	 XRWDoKC5186yGcLY3+KnpodlZWquvgrj/GxX5vWcHv7cgrkwnWW/DwAsPq/EoDHVfue+S
	 D7wK5QkhfduoAHft3hlYJDeyhwMW1dEY3y96k/dyapp6QZwNXSArs184V2QkhRfkj9ccw
	 EqqIuyudRzLPfc8iz41rBi4VO2jW3PTaC3kzuzrcC/MQGpe8FDe2OFXSYGukDgTEPcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UlfXExQXyhG92dzdrPUvVvWcK6W0MmRTGKrmc+yyUUM=;
	b=TvvWIhgWBbS+Nu1V/0tHbAafhmNA5gdgdqCmBR3WTzX24Ps7c0pYjA/kmW2KFJAjylHH
	 SKTCRKMggSMGXwh8isxx4dlQ3id1E40o/gw61RoNdkFUq2v8PJcEBavAz7HFcB3xYbVX+
	 TafEnquoiurdOpwpTu/vDud3Y6mCM4uwQpcTf1URrqVtNcIv7f8t7wKw5pFdn0dSDxIN0
	 nXREcxgP1UveCP0REPwW3UObNCqDbWesY63PUSeGv8/HdwZwhQ+gX+m4Du+H8Gc4XYwOl
	 RRaXbE6bDeJdmaRRR0gWU/qH3yKsYTwt+tUdLEY4xzfWEGmGDiew0gj8Rners6P6JfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qFUMBxMa;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4431F606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4431F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qFUMBxMa
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so811529a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653025; x=1793257825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlfXExQXyhG92dzdrPUvVvWcK6W0MmRTGKrmc+yyUUM=;
        b=qFUMBxMaK6CdgDBTyOpMWCNdcpfDDqGdiQLb/pR1oPQYi6CKaowEzQBpBV0iOSwnVU
         n1Ka8uwLGD93La8MP63IB9EKMndadwJWLM7vk+135dSsI6liSrGFTLi4UEh/YQQ7xHUz
         3L2MDkQdbK//LlcZEuy8jJr3RDvrbPp5fMWbVh6w3HBe5W4Pbq6v2FYBAt4FVakfLI7S
         amDIaOHHbjSRjkCVAnCyms2ivFmTinl7uvmRVWJvej8mlaWm9ZJHDdP+vwW66PKEJpKf
         YE2ngiPpfMh5FrXMlWKX2s23wVNEs1a1hMVnfPih+WL79F4ZIlp4iekknikNaemb6weY
         nLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653025; x=1793257825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UlfXExQXyhG92dzdrPUvVvWcK6W0MmRTGKrmc+yyUUM=;
        b=JcZtGOxUvq382O+pdpclKBJXWZAvKCRy3PMj2CALQ6P0xsBW11KK9DbIlRuGlHD80g
         o6XS6HNKxIBJQB2r4L8tgfLMJ160cIBS3U0knm0MMGnYgZtKkeMzX+jOIO58yQqYRABa
         u771W+XG+c6ExpDHs61vLBviPI8FY0DIbGLCmKUbGVKu4bETlHXUZAENyWTqDmHBGgI8
         Nvth+QSavRdoBCaI8rLMC2Y7QQHqQufe0NBbEdrA1ip4Q3Mbo9eqhJl34TMPH/qwhL0W
         mSktY4WoM6spNeRlOvEchgprz/ztT34NzYFecbhLOtxt7TcsmcigHT4sHCS9wou9+xjt
         HCCA==
X-Forwarded-Encrypted: i=1; AKwUvBwGEeQkYrmQxw/T5qGZsDNtoXBSimYskr7sANPPH/crz0S7um7I5vmHJY1iURQEZ1X4OWhzC7olyT0o3eM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNoJY+/3bMsbfp42Ex8/8jyccMn9mCOaSBl3ZLrOb/rqcr+5L4
	pgUqBkcll5OZvkMcB6IIQbaifrwxVoRUtGX1EjckLE//pVccW4dCqE4wGI7vrTKqsFW+ZA==
X-Gm-Gg: AYBFou0B1W+F95jViLwdE8QBQyyyyjDCR+ZplsTFoFahrRrh8AX+JYRPXPTYabHP2nl
	M3gmYI8n0uqXbktrlfPfUfqVRNoWmq15JnG3Dezj1ydQRoaFfSzEhhauZcimHKLkFlT5sgghGQ2
	RPZhUIm3wO3xdQqnMolKfPXWxC00DM3qWVGtnQzj8X4lHPwIkKgOm2bqmnEEpUAA8UZgzYqhqgJ
	Z9CRQyUzWHtytLSfb0gzHHZ/rMsTHTEZ97F5Zdnt2dhMDMjIzTuyymFMCtG9lAqhXHJrtoGQBYq
	TlF65xs7ZYni7TxZt9SNHpG2FQwKqxBkghmtffw6LArj0i0IBAXiKhaFo/QhzgdfJFWlhbtekMG
	CAEwOs549LUi3c67NMIyUIatjE4ePTojyrL7wHfII6dkqUY4t5jM3IJUhusWieIlb2ugclgPQqZ
	qmoORo0n3JneJfA7hjANBBHVxH2X66R9dd36AYxfxSHuZ1BPHgp1O9NhAGiOxsQftfhH0xvObu4
	gdvc+c4erc04D7Tv2zJZH6I8MpSKE7J2dubR5tsGy7fbvgD3CY5xM28M/Gk92xpJBbPWJXlTQ==
X-Received: by 2002:a05:6a00:2e17:b0:89f:4cd9:241a with SMTP id d2e1a72fcca58-8a089d45677mr3426736b3a.41.1792653024539;
        Thu, 22 Oct 2026 00:10:24 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm1706039b3a.12.2026.10.22.00.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:10:22 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 RESEND 6/6] Input: touchscreen - use usb_make_subpath()
Date: Thu, 22 Oct 2026 15:09:29 +0800
Message-ID: <20261022070929.20820-7-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022070929.20820-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
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

The sur40 and usbtouchscreen drivers build their input device physical
paths by appending "/input0" with strlcat() after usb_make_path().

In preparation for removing the deprecated strlcat() API [1], replace
each pair of calls with usb_make_subpath(). The helper formats the
USB path and the "input0" subpath in one call, avoiding a separate
buffer scan and append operation.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 drivers/input/touchscreen/sur40.c          | 3 +--
 drivers/input/touchscreen/usbtouchscreen.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 77ec2c94b91fd..7702eead123e2 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -690,8 +690,7 @@ static int sur40_probe(struct usb_interface *interface,
 	/* Set up regular input device structure */
 	input->name = DRIVER_LONG;
 	usb_to_input_id(usbdev, &input->id);
-	usb_make_path(usbdev, sur40->phys, sizeof(sur40->phys));
-	strlcat(sur40->phys, "/input0", sizeof(sur40->phys));
+	usb_make_subpath(usbdev, sur40->phys, sizeof(sur40->phys), "input0");
 	input->phys = sur40->phys;
 	input->dev.parent = &interface->dev;
 
diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 0bbacb517c286..fd2b896675dee 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -1512,8 +1512,7 @@ static int usbtouch_probe(struct usb_interface *intf,
 			 le16_to_cpu(udev->descriptor.idVendor),
 			 le16_to_cpu(udev->descriptor.idProduct));
 
-	usb_make_path(udev, usbtouch->phys, sizeof(usbtouch->phys));
-	strlcat(usbtouch->phys, "/input0", sizeof(usbtouch->phys));
+	usb_make_subpath(udev, usbtouch->phys, sizeof(usbtouch->phys), "input0");
 
 	input_dev->name = usbtouch->name;
 	input_dev->phys = usbtouch->phys;
-- 
2.43.0

