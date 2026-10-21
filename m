Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585928;
	b=e+6mrKdiKcX9QLJCDOsmmcH+4cvpM/dfbfllMT3EegWSJce9PE2qq6k3SxxRA1qkhBkv
	 uSQcW4m6IOJ8l0h8r7cKzaY6tRwj/RW/nSHQMYCWmRgJlRhjfJTcHtiMLcKTyUTLQEEwk
	 8jxBq+ZrWwXzDFmjc6RpAuU/ECBHEfURVcNEUMUrU94zRa8Tz6oxAutA8chtX065ZjrZ1
	 smo4vmuLnFkP64+gMhEq+zfSUeAjgEks3X+5CFbX9wLDSvWbkhU4uabVq/rnz/RhC46jF
	 j7U6Zg/UVrp0yR+FZitZKtgJX37P/0yNMqB/VjosMY6dDVGo4PmnO7xUpaqujOsrxqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R129GmDUt+qvHZFqEN3VKb8rNuaams87GONxeRw6Drs=;
	b=1pyV//uksmrTFCA95g/zXOPxVFo+m1T4o6Q9R1KgwRA/Jcw5GEuVtubNBASkUkROQ2ZZ
	 D+9H4jb8lZUhweOI7j7Xci4zhufbYhl+kHYUdS+8Vj1YP6wmVglO7pDev5qj/9k7ggDwb
	 i7+K00PQrW0l/r87XM17dliC/6hyNU/MzntRVRuCWasMYSiUr5NoyaJsoePO96gxnAU5O
	 +7xny8b52WCoKMMQGNk7U5kY/VbmgTxbnc+u+nIgKmiUTMVeHM7YLWElrO0Sf4wVZoSb/
	 8F1vgqqW9Nsgbzo6+KgJaZf4vqBZQP86fsub+m7m08uTLHfPygQ6yrXLHtAlr0l/how==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dS6XanIC;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318D4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dS6XanIC
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3acc610014eso368581a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585926; x=1793190726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R129GmDUt+qvHZFqEN3VKb8rNuaams87GONxeRw6Drs=;
        b=dS6XanICxAcG1TNmiPkCDP2CLwUc/8j9KXXD5drfyueKCkrOYq1BY2HJea2ekENFAU
         PDcGmH9VRXQC4BnXkyQuc83pxrsu/kYm6BE2f4ME/LYnzp1y25EifzkVf1MbavVmuvEG
         UZEbwp2qNQ7yKK2ZYd+43L2nkl5ROM8QdEAniDRGk/7Gk21nSiGzJ6ouDqF2/X+CThOd
         C4acm+q7acwdepGv8DaJ53mVxigcrBPJCn/7dYmCbSioWlBS9CHOh41ZIbsjgS16/TmW
         x6tBV2oh8xxH4W9W9nKj7BWbUlRUVBALw7c1emP01fd/q30fVT5d7okF2YuoTeCzMhDc
         JWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585926; x=1793190726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R129GmDUt+qvHZFqEN3VKb8rNuaams87GONxeRw6Drs=;
        b=Nhspjlt+HKaaURonGGdzz6OuNBDROh98F2jLkUsSMeoZwByHG0rvEC3kpDbMaECfFB
         s/fVGZjb9tlONnhp9iqOJAd8vMI5sSbhFf047VagL8PNq7Fp3AyjcmbzQ5rdTQbdv2Vi
         pyMQ79WhSQtrqxGjTAeSAucDDlFsdEWQmOOP6nW4MsHGzlY6WgXDJ6eHqFfHQG/bKK80
         2POYy04Scff4e3h40J3SCbJTHtifweCv9BQD8fGGY+wbtkFOs0dvSa3CC3dXhnC9Xqul
         BJqX391L9j4LxmVG1S3X6cOAPf8lWdC5I4YOW5pnQ9PeY6lLm01zjHTRBsYqLcQzy+De
         GAUw==
X-Forwarded-Encrypted: i=1; AKwUvBwRXU61vloK31T7qapVwHezMWzN7VJvwt52B1VE/S6T43PR6oJlRYoUIuKeDg/i0C0CtzqDZB5rKzk9GHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZATUq2K66VS2Y09HWuF260vna6unEPf4BqnVo06OubDBwnIsY
	CPZDOQMfaiWTeZ9yXJo4zNMfjRD/i/QFRKFIdljn1BvVqRORS7p8f9eE
X-Gm-Gg: AYBFou3hvOBUduU/W1Oy6WZFmh5GamrfBGmBzCO5iGxFHYW9btka6flhRFUvTJv9Dzb
	oSlHKYmpgbTMhZzriWmbLmsiXwxwNRZuirOsx7p4PRIgFki+6Oj5kUtCjXogUTMuw/car0ACBzT
	iX3z5M1odpYnTU+dtAR5793rQ3aialiaQcy05NCwST9bELbDtOodc/g7gsxGAOR7loICspgBk8I
	hq2iUVgxBkugSpVXi44LaNd6q+UF7VxX3MYSEQlU7CjTUkFAcQEyyaPId6klpqZ/mDcBrawjAbW
	/pcIt+tgj8W5EX4NYDapDR9FsyhOVyIr7aliICYYCbmazhfI59FwTno5qSueb7n65lNBWMemNvb
	WqM+M2tnn1aFSnePBvDaToAsQ9a+Z/tcftO6yHTyVOOicQz8lReTUJ6VVIe0tA1l7unT6vc1Jmr
	kh2swztSDd3sVnPIQ0bscCjFS7niclDhhFeYApm0K96WusE6Sf674YF7E95mT/rUSuCn0NtSdGg
	XaUDeNCAZiLg3btgVzr+lXc5m4udT6tKNOr3wwyLDMF0c/CJBWAGwBDvuJg+f6IZyrGiCyo5Q==
X-Received: by 2002:a17:90b:5547:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3ad86ee2cc9mr1596337a91.18.1792585926342;
        Wed, 21 Oct 2026 05:32:06 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813eb9casm4229523a91.15.2026.10.21.05.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:32:05 -0700 (PDT)
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
Subject: [PATCH v2 3/6] Input: misc - use usb_make_subpath()
Date: Wed, 21 Oct 2026 20:31:43 +0800
Message-ID: <20261021123146.17202-4-shlomojune6@gmail.com>
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

The ati_remote2, cm109, ims-pcu, keyspan_remote, powermate and yealink
drivers build their input device physical paths by appending a subpath
with strlcat() after usb_make_path(). Most use "/input0"; ims-pcu also
uses "/input1" for its gamepad interface.

In preparation for removing the deprecated strlcat() API [1], replace
these pairs of calls with usb_make_subpath(). Pass "input0" or "input1"
as appropriate so the helper constructs each physical path in one call,
avoiding a separate buffer scan and append operation.

Link: https://github.com/KSPP/linux/issues/370 [1]

Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 drivers/input/misc/ati_remote2.c    | 3 +--
 drivers/input/misc/cm109.c          | 3 +--
 drivers/input/misc/ims-pcu.c        | 6 ++----
 drivers/input/misc/keyspan_remote.c | 3 +--
 drivers/input/misc/powermate.c      | 3 +--
 drivers/input/misc/yealink.c        | 3 +--
 6 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/input/misc/ati_remote2.c b/drivers/input/misc/ati_remote2.c
index 8db2dca84975c..20cb7b8efcc0b 100644
--- a/drivers/input/misc/ati_remote2.c
+++ b/drivers/input/misc/ati_remote2.c
@@ -822,8 +822,7 @@ static int ati_remote2_probe(struct usb_interface *interface, const struct usb_d
 	if (r)
 		goto fail3;
 
-	usb_make_path(udev, ar2->phys, sizeof(ar2->phys));
-	strlcat(ar2->phys, "/input0", sizeof(ar2->phys));
+	usb_make_subpath(udev, ar2->phys, sizeof(ar2->phys), "input0");
 
 	strlcat(ar2->name, "ATI Remote Wonder II", sizeof(ar2->name));
 
diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index 353d3c1d347d5..06d8f0dab4b37 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -765,8 +765,7 @@ static int cm109_usb_probe(struct usb_interface *intf,
 	dev->urb_ctl->dev = udev;
 
 	/* find out the physical bus location */
-	usb_make_path(udev, dev->phys, sizeof(dev->phys));
-	strlcat(dev->phys, "/input0", sizeof(dev->phys));
+	usb_make_subpath(udev, dev->phys, sizeof(dev->phys), "input0");
 
 	/* register settings for the input device */
 	input_dev->name = nfo->name;
diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index b1a0edcc49b4e..e629a327fdd76 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -215,8 +215,7 @@ static int ims_pcu_setup_buttons(struct ims_pcu *pcu,
 	snprintf(buttons->name, sizeof(buttons->name),
 		 "IMS PCU#%d Button Interface", pcu->device_no);
 
-	usb_make_path(pcu->udev, buttons->phys, sizeof(buttons->phys));
-	strlcat(buttons->phys, "/input0", sizeof(buttons->phys));
+	usb_make_subpath(pcu->udev, buttons->phys, sizeof(buttons->phys), "input0");
 
 	memcpy(buttons->keymap, keymap, sizeof(*keymap) * keymap_len);
 
@@ -301,8 +300,7 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
 	snprintf(gamepad->name, sizeof(gamepad->name),
 		 "IMS PCU#%d Gamepad Interface", pcu->device_no);
 
-	usb_make_path(pcu->udev, gamepad->phys, sizeof(gamepad->phys));
-	strlcat(gamepad->phys, "/input1", sizeof(gamepad->phys));
+	usb_make_subpath(pcu->udev, gamepad->phys, sizeof(gamepad->phys), "input1");
 
 	input->name = gamepad->name;
 	input->phys = gamepad->phys;
diff --git a/drivers/input/misc/keyspan_remote.c b/drivers/input/misc/keyspan_remote.c
index 70cd6586459ef..68c969657806d 100644
--- a/drivers/input/misc/keyspan_remote.c
+++ b/drivers/input/misc/keyspan_remote.c
@@ -481,8 +481,7 @@ static int keyspan_probe(struct usb_interface *interface, const struct usb_devic
 			 le16_to_cpu(udev->descriptor.idVendor),
 			 le16_to_cpu(udev->descriptor.idProduct));
 
-	usb_make_path(udev, remote->phys, sizeof(remote->phys));
-	strlcat(remote->phys, "/input0", sizeof(remote->phys));
+	usb_make_subpath(udev, remote->phys, sizeof(remote->phys), "input0");
 	memcpy(remote->keymap, keyspan_key_table, sizeof(remote->keymap));
 
 	input_dev->name = remote->name;
diff --git a/drivers/input/misc/powermate.c b/drivers/input/misc/powermate.c
index 754379d2625cf..f004cfca795ec 100644
--- a/drivers/input/misc/powermate.c
+++ b/drivers/input/misc/powermate.c
@@ -333,8 +333,7 @@ static int powermate_probe(struct usb_interface *intf, const struct usb_device_i
 	pm->intf = intf;
 	pm->input = input_dev;
 
-	usb_make_path(udev, pm->phys, sizeof(pm->phys));
-	strlcat(pm->phys, "/input0", sizeof(pm->phys));
+	usb_make_subpath(udev, pm->phys, sizeof(pm->phys), "input0");
 
 	spin_lock_init(&pm->lock);
 
diff --git a/drivers/input/misc/yealink.c b/drivers/input/misc/yealink.c
index 560f895a00cda..9a8ee7a586f44 100644
--- a/drivers/input/misc/yealink.c
+++ b/drivers/input/misc/yealink.c
@@ -890,8 +890,7 @@ static int usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	yld->urb_ctl->dev = udev;
 
 	/* find out the physical bus location */
-	usb_make_path(udev, yld->phys, sizeof(yld->phys));
-	strlcat(yld->phys,  "/input0", sizeof(yld->phys));
+	usb_make_subpath(udev, yld->phys, sizeof(yld->phys), "input0");
 
 	/* register settings for the input device */
 	input_dev->name = nfo->name;
-- 
2.43.0

