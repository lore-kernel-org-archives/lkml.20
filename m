Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585936;
	b=OnGbFYY4pR43rX0feLEg9Hj+buoW9CdD60FZi/vJsErXBe/DBtBiJvlrwBVboFAwITEB
	 SAJ3JZYBb5FvELE0sZBHZTzrMVC+PBH5pv2WUBcJtaCNXsoV/LZLD2M9ArSy2fEmmohNz
	 T6jw5RnapRo6PXG3cH1oMwRh+yhUflaUDxXLVjNnKIU9cOqzI0Q+FvM8RB/29KTiLMykZ
	 d+XU9V/bhPBhdQhxl5y4NqtdPLdKHifWMrWgcuGYrRFP024jsFdjU5e9qdeaQbzzqs9bT
	 aV9eh44Gs+KxF/Dg8xNMAEyJAV6ZjG5smplTvT+tCaJzzfGQ2P0HMYkV94gqDHWrqgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D0jGTVLtzaIFDc7gI7x4v6SVaJxQo+nXgqAY9AHPQIU=;
	b=bdpFbd9zz5WT6sFlgjUSOCxq0aBo2fvF/XnP8Ou9k6zxqJ3AUJElmxC4U3iJXsFA7dvN
	 LPdkoEJ1jRIBiWgWt1HU5vuE6+WJ/bqUmFFilM2YZqbtVVxKDB5wXqOcxcXP8X/TVGnKm
	 bIh+PdmHBPWCdoUUgsDptSBEGR5lBUCoVwsf1hddZA0zB3/QIwKtkVPs2rsulbS2bTi5I
	 su9RzaUK073xLIAHCV73qZqj9VNIKABSaZ3bMw8xltemnsnqeAeN8YUuyQCrryKeh+pTj
	 WJgumb9Y5UUL26ZiKJUq6GvWezGMQD/Nh0mdzWQaMix7hB9UvsXAPJyET3UFY1wqnHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EF9HLruD;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5160A382E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D5160A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EF9HLruD
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so386785a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585935; x=1793190735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0jGTVLtzaIFDc7gI7x4v6SVaJxQo+nXgqAY9AHPQIU=;
        b=EF9HLruDnCdBFiWI52nFz0wGrnjT/Lfj5ghs0xy/UlBDEoPN04FyAPV9ZTATR0H4wc
         Io5MeRGt/au463dBe42mkIM8PuqYGnYAZ7Hr+r48V5mTbJb/5YCeAV5p52cW18Leznc3
         0Bknn70Ffim2Ex9Cp947zlJJWG5BcaDCUFg0J3gKbBGsHXfmmHsycVLNNfN8IvwXhfPU
         2U6F6RwXCDR67/ekV26JJSqBOQP2/VE4XWGm+SKr3xlSWZTDucu8fmXeO63bwuORaxT2
         VXghlIu8SizpUNJTMEwZCBGdWJ2fwo8BCIMXVgHMvLtXwljDr2eGDAM9G+GG8ofh4f0c
         YSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585935; x=1793190735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0jGTVLtzaIFDc7gI7x4v6SVaJxQo+nXgqAY9AHPQIU=;
        b=vIwKI2e1ddtM1Q4oeLheb6Y8nD9lAWgGVNAy0/RJuYB7q3PT0qL1bFon4kW0Ox7dRv
         wh9ibRom+7Jnx9+a1BbHhkXNBbHn1MvUgNW6g87b3lODserR+ykS0MhjMc83WAZaLthM
         BbAWp7vF7V8EVhcbT35N49/EjxJ+eI09fYI7gEMXlwf+8oKrBfMYgqIq+/LVzk7HQnRB
         7/VHtgB+I61zPKqYz5XecQzkyLHTYOy5bqQGg59fne97SrGlUU7RNgfJfT0MhfvIYtB6
         JwrNZkPfPgeB1Y+oJ7RHxfk2xTp4aqfQmLijkBu4dgKTfVyfV8CW5JrvCByQv4fdJ8rD
         5xhw==
X-Forwarded-Encrypted: i=1; AKwUvBwEzXL6BtupAm5zHtz0caG4dfB1kEy30nAA81HyBS5/LtSRm0h3zSrVmZpZSPdX/JMvxBehvS1FlsRUa4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2R0Nr/ok3o/SNK9At/4y6jXkFJnfkb0DccjR2sOEQ138OW+u2
	M4dsNVuymaPZC3eWNCnc/0TWAK1J8Td4b0IMB7wCfXQtAQVmzA/mguju
X-Gm-Gg: AYBFou3hj+5WwZ7v/9nAXWtGHgXTiDCSVovZd+ZRWAarLZB7aOJl4FPxTfQG31YSGoO
	LmWKIsCRL+X2BV/vTVAsAxf9Gfq2oZw89B04JMs30FGNKzSQvnmI9P+tuSOHkBBb2dHOshfJ4VC
	A7KVNUCSReClPcsrSuzICx6W3xA1Wv0Z+Gs48CUsFgnsmtBAebbl/zDgXl61pjZtB34BhISr32y
	5SqpriVgvQGriSEU/ct0wUdmHoy1Fxp0UoLLCKeHw2sKALjx6BwAlVkC7WkjXpvNxhbELhlafWk
	U8DTRClPpOEzHbgJ8PtCCmgqQH6+kmU0gH8QLxq7yII+MVz2Ky1xTXbIFi7NPgkFS6GLI7PNA3f
	gv+URYHsBpy0xCoPA9PiE1xU+rqVKQ30QGHis4wqx/hcnidOD2KvykBYqBQjtmVv17HFc1gXhpC
	MaupEXwV9dmPtZFaRQZzyY8c2SWvAEK+L5mmzK36EKGMJmW55C5deBjfwndGmuCcicMKXnFdPo8
	nVDDVe3LZ3RBjbyOZiAfIDDdGWtw82cSa24ZNPfLz0GfptB9t+ALzXHTv9egxthpF2TyKHmbKMe
	6JG3g/x9mWs7O/yP69M=
X-Received: by 2002:a17:90b:570f:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ad870711e1mr1875316a91.37.1792585935271;
        Wed, 21 Oct 2026 05:32:15 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4229523a91.15.2026.10.21.05.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:32:14 -0700 (PDT)
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
Subject: [PATCH v2 5/6] Input: tablet - use usb_make_subpath()
Date: Wed, 21 Oct 2026 20:31:45 +0800
Message-ID: <20261021123146.17202-6-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021123146.17202-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
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

The acecad, aiptek, hanwang, kbtab and pegasus_notetaker drivers build
their input device physical paths by appending "/input0" with strlcat()
after usb_make_path().

In preparation for removing the deprecated strlcat() API [1], replace
each pair of calls with usb_make_subpath(). The helper formats the USB
path and the "input0" subpath in one call, avoiding a separate buffer
scan and append operation.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 drivers/input/tablet/acecad.c            | 3 +--
 drivers/input/tablet/aiptek.c            | 6 ++----
 drivers/input/tablet/hanwang.c           | 3 +--
 drivers/input/tablet/kbtab.c             | 3 +--
 drivers/input/tablet/pegasus_notetaker.c | 3 +--
 5 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/input/tablet/acecad.c b/drivers/input/tablet/acecad.c
index ba79dff21aac8..c12b0a0181837 100644
--- a/drivers/input/tablet/acecad.c
+++ b/drivers/input/tablet/acecad.c
@@ -160,8 +160,7 @@ static int usb_acecad_probe(struct usb_interface *intf, const struct usb_device_
 		strlcat(acecad->name, dev->product, sizeof(acecad->name));
 	}
 
-	usb_make_path(dev, acecad->phys, sizeof(acecad->phys));
-	strlcat(acecad->phys, "/input0", sizeof(acecad->phys));
+	usb_make_subpath(dev, acecad->phys, sizeof(acecad->phys), "input0");
 
 	input_dev->name = acecad->name;
 	input_dev->phys = acecad->phys;
diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 0c1acb9e6b437..cc68ee82c12c3 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -1705,10 +1705,8 @@ aiptek_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	 * & a tablet, and the inputX number actually will tell
 	 * us something...
 	 */
-	usb_make_path(usbdev, aiptek->features.usbPath,
-			sizeof(aiptek->features.usbPath));
-	strlcat(aiptek->features.usbPath, "/input0",
-		sizeof(aiptek->features.usbPath));
+	usb_make_subpath(usbdev, aiptek->features.usbPath,
+			sizeof(aiptek->features.usbPath), "input0");
 
 	/* Set up client data, pointers to open and close routines
 	 * for the input device.
diff --git a/drivers/input/tablet/hanwang.c b/drivers/input/tablet/hanwang.c
index fd5a7e761dcc4..a9521bbc89646 100644
--- a/drivers/input/tablet/hanwang.c
+++ b/drivers/input/tablet/hanwang.c
@@ -350,8 +350,7 @@ static int hanwang_probe(struct usb_interface *intf, const struct usb_device_id
 	hanwang->usbdev = dev;
 	hanwang->dev = input_dev;
 
-	usb_make_path(dev, hanwang->phys, sizeof(hanwang->phys));
-	strlcat(hanwang->phys, "/input0", sizeof(hanwang->phys));
+	usb_make_subpath(dev, hanwang->phys, sizeof(hanwang->phys), "input0");
 
 	strscpy(hanwang->name, hanwang->features->name, sizeof(hanwang->name));
 	input_dev->name = hanwang->name;
diff --git a/drivers/input/tablet/kbtab.c b/drivers/input/tablet/kbtab.c
index 6ce70c8e2d7cc..f777118ed7c8f 100644
--- a/drivers/input/tablet/kbtab.c
+++ b/drivers/input/tablet/kbtab.c
@@ -137,8 +137,7 @@ static int kbtab_probe(struct usb_interface *intf, const struct usb_device_id *i
 	kbtab->intf = intf;
 	kbtab->dev = input_dev;
 
-	usb_make_path(dev, kbtab->phys, sizeof(kbtab->phys));
-	strlcat(kbtab->phys, "/input0", sizeof(kbtab->phys));
+	usb_make_subpath(dev, kbtab->phys, sizeof(kbtab->phys), "input0");
 
 	input_dev->name = "KB Gear Tablet";
 	input_dev->phys = kbtab->phys;
diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index 85390ae423076..28fbae98f7399 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -354,8 +354,7 @@ static int pegasus_probe(struct usb_interface *intf,
 			 le16_to_cpu(dev->descriptor.idVendor),
 			 le16_to_cpu(dev->descriptor.idProduct));
 
-	usb_make_path(dev, pegasus->phys, sizeof(pegasus->phys));
-	strlcat(pegasus->phys, "/input0", sizeof(pegasus->phys));
+	usb_make_subpath(dev, pegasus->phys, sizeof(pegasus->phys), "input0");
 
 	INIT_WORK(&pegasus->init, pegasus_init);
 
-- 
2.43.0

