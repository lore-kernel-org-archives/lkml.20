Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243023BE146
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389859; cv=none; b=mccV0lf6oK9QwctRSzAwtTtDdbCJSH+LScCfXPf21uI9VzvuVTWF/QREWGL8GdIX7X9QuKMw+o/rQJw0uGk5fn+1wmteManPMk7hQypt1oqc6mG4okFhifr+vAdn3PQQYN1vpLJo8VX79JjszQk+hQMBa1cGMbMhXuugdyhfhl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389859; c=relaxed/simple;
	bh=bKyKGJUGrCb3W9qMGUk7P5fCi8mjHN6oQhIRrQh+ANc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJ83MZ/i+QdocGwoPOWLGAL7X3maclwiu1F8K9yomgZREYCeasD2sc3+iCSWLVrqZAFA4jx7jnGmk1aoGUMOZfkPedlpcJnsUWQstiicx+HgFWNMVHyjUhr2xw6BNM4h1avvfbAI++axkT4yXfTKC2WGGaRKrgWRUzNknPjT5iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXSFyDk+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXSFyDk+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so18567555e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791389856; x=1791994656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tB2XUCRIczkPoeyE81Ks5+Tx4mLH37sTqp2RF+26pI=;
        b=aXSFyDk+xIHJXei8FJ3g3XQX1C9dcvGU26GzvJYrmcpKE9ARu1+fZuHrEB0DerR4xR
         WUXmjrywjldcX7qMRhDJPz/1z8b6n1bCSVqf2ZCGo0jhORqQsU4y9bvddMl0ogq/6ZAy
         9/Dls7TRFCudt3MMWKFsV9Gy4/Cb7tsdKl7TcC6ukAuURihNwlqydkY1pXv3L3dNOw6b
         y7nh8cmA2n6kql+m5Iimvd7ukFOMwe2c6THtf1yKMjfY7bn8+94KhssJDwDZU6clSms5
         Ypbk2iIrcDsyh7LkpsDFfcHDAJ8iXo9n6uPRazpFeGjvMa730TLN8boHvTSm9gZoX02L
         fOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791389856; x=1791994656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tB2XUCRIczkPoeyE81Ks5+Tx4mLH37sTqp2RF+26pI=;
        b=HCoJAHAX4WejdsgQTvpI6KNzROjMZ1P1GgvBo12vIEb/5YDCw9yIZPawSirngNCO1Z
         XYBa2p5suq3AGzp4uQJyOXHfqU4nxnOlWvVoTpdjnK6Kg2y+DXCKQBKuXSSngOP5WTN5
         33DtR292arjY4wtPDLVnWSNramdjZElGT7xjF99kc6YC0aO6bQ/wtSlOYmMYUwgfeQTI
         ZHWbtotXWHNOXX1zu37vk8f8Gs/IkaqZNQuI9Sd3gN2o9MCx1a6TmTt936mn2+WnnBVl
         /ORjrXvRt7oh6f3yxuwQQNAj6cExsmxLMacx0izv9hPuItflnx9VVcUH4eE+3SN98TyQ
         uIXg==
X-Forwarded-Encrypted: i=1; AKwUvBxfGeYC3ZpOsysUzHNGJsdR/1U/vFIG0BdjLR2VUquztK588b6zl6EtNzSneRS4SV9QvUn5B/HkTM95EFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l5n+o0Z/vA3PLTIrKdS+zUMP33/XJQmXfOaBbkIGrAXwWDDGbL
	1CwL3p+31UM6RgSnTSiNDB7ZSiM6ILvcymqRrDkMAS0t3aWoMh8LnSiQ
X-Gm-Gg: AYBFou33d0UzdjDmgEE0TXCqUxYdxqLkzqQywHTp7km0I4DQSODjXkxXip4pFSajT7f
	GBWCGnwDmIvyCxq5H0+Y8x/F+gV8jvBCWXhAltO7vreI6L/84aWuYumsrp8PPBJ3Esvkjf62+rK
	rI3GoITuRXCTotiQrd6C9Jo2bEHiWvOrrMRq3XYHmrS7H0ndx98jaHEChr+NYEjTqPupYGrpXJC
	beJeufFbe3P37AaxpC03/7tGh+yKqyQ6CNhzkuJqdeN7101m1Fqfe32H069/0uYFEAqtdj/oanJ
	bPgUNH1Iq4bp+55XlS100IABR1Hdda01fbDLspn4Bd8OcLZkoM6yIXR3fmK4yVciS+CGmYjagl5
	tmHbyGe1Gnka4VbSdVrzLA9ZoPdQwu9lkJvptfcasMEgy4cjM/9dNVjpEnxOca1s47J5kQB8TzK
	Nu3ct5P/hMnK2CC2VdzXxz5licrMn5C99uIO9yRw1irbWCecjNeWwIm9rAl89iE4jC6m6gOilnv
	gvGguVqNg==
X-Received: by 2002:a05:600c:19d0:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18044ba0dmr42978835e9.24.1791389856079;
        Wed, 07 Oct 2026 09:17:36 -0700 (PDT)
Received: from unicorn.lan.internal ([2a0d:3341:b894:4600:1396:12e1:c92f:1932])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm118989995e9.2.2026.10.07.09.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:17:35 -0700 (PDT)
From: Giuseppe Piscitelli <ooonea@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH] USB: core: emit a device-level modalias
Date: Wed,  7 Oct 2026 18:17:21 +0200
Message-ID: <20261007161721.60593-1-ooonea@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB device drivers can load from interface modaliases after a userspace
client has already configured the device. Loading apple-mfi-fastcharge
then reprobes the generic binding and interrupts usbmuxd transfers.

Emit a modalias on the device event, with unknown interface fields left
as wildcards. The existing udev module loader can load matching modules
before consumers receive the processed device event. Keep interface
modaliases and the driver teardown paths unchanged.

Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
Assisted-by: OpenAI Codex
---
Tested on x86_64 with Linux 7.2.9 and an iPhone (05ac:12a8). With no
Apple module preload, the first insertion after boot loads the module,
keeps configuration 4 and works with iLoader without restarting usbmuxd.
The current usb_uevent function also passes 18 source-extracted cases.

 drivers/usb/core/driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 3c3bbaf89..29d1acba9 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -954,6 +954,17 @@ static int usb_uevent(const struct device *dev, struct kobj_uevent_env *env)
 			   usb_dev->descriptor.bDeviceProtocol))
 		return -ENOMEM;
 
+	if (is_usb_device(dev) &&
+	    add_uevent_var(env,
+			   "MODALIAS=usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02Xic*isc*ip*in*",
+			   le16_to_cpu(usb_dev->descriptor.idVendor),
+			   le16_to_cpu(usb_dev->descriptor.idProduct),
+			   le16_to_cpu(usb_dev->descriptor.bcdDevice),
+			   usb_dev->descriptor.bDeviceClass,
+			   usb_dev->descriptor.bDeviceSubClass,
+			   usb_dev->descriptor.bDeviceProtocol))
+		return -ENOMEM;
+
 	return 0;
 }
 

base-commit: 42bcac323cc3b16566fed8c5b250318ad02a0de0
