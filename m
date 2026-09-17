Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E04D54CF56
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653240; cv=none; b=klkjgZ8OW4NYbho5IkpKwg8KCazcdee4pGBQbZN1vev+G08mljDkbokBSIQR7fMfS4ZlEH/GFSqD2RaePOn7EHs6O39uA43W1DSLSfoa18TJcfnMtqmrRjgoGX5RJXSclYNAQx7D1e1t20mNa1r5zRs2Gy3OGXay+OvZ6qyF8tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653240; c=relaxed/simple;
	bh=mfzetHJUn51ArerYHqF6aiA8NuXaOVldE7r6LWhO0uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LL5z67DAPI6T5QqHi/S9Magn7fZtFojHQAVMxFrQjb4Pgl/Hk/vW0ebETVIgRlLMSLYPxVVuwaDXOhIycsAhWVFyyO1cV8iQ9Dl54VhPUl0Sleu7VbmioSIaBgaqnVwvxQr9H9s+FNo0GQcYESBH1DF9yHR4ecLQDGzK1tolGdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=En7S3FAl; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="En7S3FAl"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50b9e8a45so547671a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653229; x=1790258029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNzuklJ6syncehvRtPRFyTK25DIYgkrFQvB75keaveQ=;
        b=En7S3FAlvb7xVAltzwxtYNx6weFJxSA9G721seTvYqMG/5AxdoRiOV4uoXMN8E/5dT
         PY5h60hPKDNjabO8buj8Ilq4c33Uo48tIAQnqnox34Cp+RdePYdm5VezPfZSsa5YWYsZ
         EUyo+MpLRAS9Lbl2t5VRWOzxtOdIArs7tGYgVWyurAKMvLPZ9RuV7NjM0IXMfa8g4+RZ
         bOojSlI5lggddrHVadGBi7sy0rQ0zgD1MysNrvb/+KavfbHSmFBtAa1u2P9JY6CbYefZ
         CoZNUoy7xCslO0s7nwgFqA/B3YegNZqYU5X0K8VEQhg1NANIJbXvx3ISm74IvEK792no
         bKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653229; x=1790258029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNzuklJ6syncehvRtPRFyTK25DIYgkrFQvB75keaveQ=;
        b=oLne9vO78l7qU4LhRoLTf7ShTdmA5+vOWhrsZ4unD5qxn2iY7MEkJXyxcxZS4f4M8Y
         sirx4t1Uz+GI055dZxuQJKhMvrenY74jxxnqilWAGnhD8bi8Y/b3DOT54wytRm2UKP+g
         NcDDBaVA2oXOH5RR4tskFeOYOjoZ4ypAwWSvuffyerP5RDDijWSisMoSkAtUJMKXJ8F1
         NlQpdvj0u2IK5RcaC3YQFWJyDcVPWpUYv3xX0sa+Juu65NkX8BUY1oYjkbOw//oiDc6j
         Lpm2yDOKXumiK+XLTgFA6wq63GMCQwsGvcBGv+MM0U+cZ3D40qUakJIEt544xajMHt2N
         8g9w==
X-Forwarded-Encrypted: i=1; AKwUvBwX6co9iBCP4FX5PReJ7teSAt6HkMRJDcw2wr6A2w+b62UEgAgxsgljulWNq0SbSiDqy2EsXewmfz1RDYs=@vger.kernel.org
X-Gm-Message-State: AFuF++lfaTk0EqTznXna1G9trmKkHs1eswezCiomczHQrZ+A86j8GICJ
	OB7T3Rpoy4kWT2EoKlYGgrq4n7dI15oAd9/QOSC86qzTB2nKLKmjK8WV
X-Gm-Gg: AYBFou0ZlK9RX4tpY/Mup0QG+PMzmNWCFff7kthIqDVhyQloCKk+zymrOBDSU67z2UJ
	CwxgLVnsFRFDbI60fV3iAGbCXtKfaVQnZx+jFnKvUxscshi+vtOer5wnpIwmrbqDwkZVbKfWSgN
	5EaPdxn6go3f+hgj/wV1DDHHkVRdZz3YYBSAo27cngVzkB7N/xIFQTMC1udngEt9X+AumeGapOH
	MrKk66iU8QL1ZQY0BpETNT4ihJklLfhX1IgRjLv6mbtMoHzu6QtY/3fGToCD8FUycqLaJKYp21i
	wD9lMbH/qaD1dWKrx+JLm8OF1xwotMzNFPw2rUz8NyNM3ny14vzZvyGf6v/lV6UtpMkn8EhjYey
	TjUSqEj6aEGsQbfpyONErN5uoWxZUA5fa5stz4Vni3/pf/yOL4cKjM4TWD1HRwJHnAVixtCT+Tm
	NZhYPI0mfcAjOI2Ns+l3H0XExMOmiNgzupKQWFUx0Q2AMUbmCMYpLml35bhCNUfsyiqlKP52Axl
	R2T82wccvwCVYGO2Z2UVkyoIM3juUp4gA==
X-Received: by 2002:a17:90b:2ec7:b0:39d:f317:44cd with SMTP id 98e67ed59e1d1-39e1e4907f3mr22997029a91.14.1789653228453;
        Thu, 17 Sep 2026 06:53:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:2428:17da:9062:91b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360ddfc2sm5303334a91.16.2026.09.17.06.53.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 06:53:48 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Nazarewicz <mina86@mina86.com>,
	Robert Baldyga <r.baldyga@samsung.com>,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zjamg <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] usb: gadget: f_fs: Fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
Date: Thu, 17 Sep 2026 21:53:37 +0800
Message-ID: <20260917135337.65444-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260917135337.65444-1-ndaugoing@gmail.com>
References: <20260917135337.65444-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When user space sets up FunctionFS with only full-speed descriptors
(e.g., flags = FUNCTIONFS_HAS_FS_DESC) and the gadget operates at a
higher speed (such as USB_SPEED_HIGH or USB_SPEED_SUPER),
config_ep_by_speed() detects that the function lacks descriptors for
the current speed, logs a warning, and falls back to full-speed
descriptors. The endpoint is then successfully enabled via
usb_ep_enable(), and epfile->ep becomes valid.

However, when user space subsequently issues the FUNCTIONFS_ENDPOINT_DESC
ioctl to query the endpoint descriptor, ffs_epfile_ioctl() selects the
descriptor index solely based on gadget->speed:

	switch (epfile->ffs->gadget->speed) {
	case USB_SPEED_SUPER:
	case USB_SPEED_SUPER_PLUS:
		desc_idx = 2;
		break;
	case USB_SPEED_HIGH:
		desc_idx = 1;
		break;
	default:
		desc_idx = 0;
	}
	desc = epfile->ep->descs[desc_idx];
	memcpy(&desc1, desc, desc->bLength);

Because user space only supplied full-speed descriptors,
epfile->ep->descs[1] is NULL. Dereferencing desc->bLength triggers an
immediate kernel NULL pointer dereference panic.

Fix this by falling back through lower speed descriptors if the current
speed descriptor was not supplied, matching the fallback logic in
config_ep_by_speed() and historical f_fs behavior. If still missing,
fall back to epfile->ep->ep->desc (the active descriptor), and return
-EINVAL safely if no valid descriptor is found. In addition, mark desc
as const to match struct usb_ep::desc and avoid discarding qualifiers.

Fixes: c559a3534109 ("usb: gadget: f_fs: add ioctl returning ep descriptor")
Cc: stable@vger.kernel.org
Signed-off-by: zjamg <ndaugoing@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 43962e05eacf..c64a268e98a4 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1877,8 +1877,9 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 		break;
 	case FUNCTIONFS_ENDPOINT_DESC:
 	{
+		const struct usb_endpoint_descriptor *desc;
+		struct usb_endpoint_descriptor desc1;
 		int desc_idx;
-		struct usb_endpoint_descriptor desc1, *desc;
 
 		switch (epfile->ffs->gadget->speed) {
 		case USB_SPEED_SUPER:
@@ -1892,7 +1893,17 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 			desc_idx = 0;
 		}
 
-		desc = epfile->ep->descs[desc_idx];
+		do {
+			desc = epfile->ep->descs[desc_idx];
+		} while (!desc && --desc_idx >= 0);
+
+		if (!desc)
+			desc = epfile->ep->ep->desc;
+		if (!desc) {
+			ret = -EINVAL;
+			break;
+		}
+
 		memcpy(&desc1, desc, desc->bLength);
 
 		spin_unlock_irq(&epfile->ffs->eps_lock);
-- 
2.53.0

