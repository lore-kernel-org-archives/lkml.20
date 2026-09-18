Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F93624A8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692892; cv=none; b=Z08KlGgJSkUuoqTKO1j/ASxVfgV7I5T6HB+L+7TetU7sE9NhkGmVYKOT2DulDNxWcwVRW6tyPFS/BqGDAA/MbC31tJxPGceJ+2IOTNms4nuvO/TkmAzHjZuNDXHpR5OhroOLn2MUHzELiCQQc1Q0g9CiYfiv52C5GRRSt8K19Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692892; c=relaxed/simple;
	bh=qCrvnwnw2ZmTpdL+R/0NITnHZPsB2ITSD1FJ8dZiKL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bs6Vo/aUiyHahpAx12Hdhb5EudHtm+GJPjktuTSHGQXuXIWJWafowdM5cYEGHN3hQFTMagbmsfDhPq8joS8OFpQ0yilwguv9mnRaXON5SwAFIAXMckkj+/Z3nZiUoCGpIDL/GT+x2sedvS2Khla2ndoe46p/I0jlSXM1iyF2E/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZENtkiI; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZENtkiI"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so58266a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789692888; x=1790297688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vorPSln8DTStAoGWTmO2QfiwSgMRhe3eQ+sYKlZMfk4=;
        b=UZENtkiISEgDw+Y/0Yg2iBk8HMlhWmF6+JjFAjbySgUqb+faetKAghjCCjMPnvgZP2
         m2oiLmuAvaPUQpPMxuI21Sgh9rfrLhXxsrDlD9w3Rs9vE5JbeTl/swGA/2ooAveq3dXW
         0wbv85HOSKmLFq/vns3flsTYc9kr9OYrNwEUKuEppTJ4XgAKpEUyqcW8D/QiMtGrnK+g
         yilLi3dwWtjtySgM895QAauezGs2z4KDQI4IKagke/HtPcdldpIuL3dsh+LnrMRW5FZM
         fi4zapgUQzhrO7F/7hBN2Hqk90eY6WBDFfJZD8yBBiWGoeHpI9wZ8rm9JBjuCPWU+KuW
         y/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789692888; x=1790297688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vorPSln8DTStAoGWTmO2QfiwSgMRhe3eQ+sYKlZMfk4=;
        b=tAgw5k8mO2T95LJU7UnLBH7bQj2CC6fjWc2yMrpByx5CSchqr3OalCTT4O4pDPQ7B7
         q59AcxE/C16h+qGuSSdCuK8dKnUg3Mc7TCso1cXEtMkDZul1xPwpa0zp9mm2/hjUYQIF
         La2eC7MjbZLZ1Lt9w5lPV/psRCt6xZafZiJXf1WesGDzTEE1xYlNmYJ6u3GCV4xwUZgA
         3xexyM2v9xroZ2LFZOdLgnFe/9Gi13fMvmAs/+q9v/RIzicObIPv9oIRddwcisejXj03
         LIPIG9023j0tEFY/zEZdEj0c5jj1kMvQwDUlHv/iUJJkVA7DT0VH7o7R6Pz3Y036Nir6
         QZKw==
X-Forwarded-Encrypted: i=1; AKwUvBxNEdX/xqYHhd1OZiwjBWS+fkgL4xFZfE0xXeIBaC/N8jwtPHBxnjjg9R5jecokKxTdxJgMmooNKhAEZVE=@vger.kernel.org
X-Gm-Message-State: AFuF++mPYEGXrfVINrN1RhY4IXkx20nVjS+5+gIDjHcUhJUeiO/QvyRe
	5nTIjbYgOZbuSqpfIW5zCJ1rGyPjNqfAwYR6zQ+GgUN3Ra4gmkgC+scM
X-Gm-Gg: AYBFou23HQwUUNumRtp1HR7Nh5afvczgtOOWI5Kn0xWdrEbaFQ314sjKTj7U8InhhZ7
	+McVXRVgi5Lvzsz7OXZUzoo/RGA4ywN52PscFxSr2BLm0YjUMacG4g1y6J5EdstJAyQLwCM+PAp
	1afXVdoekylUDRqPZa8ImKYk5wbK+/wwkWM+K5PKZY7Bk5L1dXPd4pZMWMzFak4CuEga/jrlWif
	crpOwdJ8a1CxHqt8L9xAoiqom8lagw+WL5sxu/q+KsKHF1bPYEFEHXiUKFbpC0qBjMtHUUAyG+C
	O7rTDMKdrl8L331oCFudTRbVXoT2x3QD+JlZJN82nx9OMakGjzzpVecp4mlxrjf5aRmnrXQwVNd
	l9hQYshVXt3xwckVI4IjbgCJbWouKsgwyB9+PXQojN6fwTCXsKJEnCoZCLZsJIYyJSsJ/+vfz5O
	TVdyMG+fo1BLUk6UtsU7J13tqEOuZWjTbZhH6tXqDWiiLBtC2xCr74uEy+wIOmCLTGm4Rfvh+K+
	4+pipgfe7rW05lQ+QnQWkOsQss+KIt7Aw==
X-Received: by 2002:a05:6a20:c989:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3dd8c43822fmr1616231637.14.1789692888530;
        Thu, 17 Sep 2026 17:54:48 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:84a7:aa72:4f01:6c70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm25238885eec.2.2026.09.17.17.54.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 17:54:48 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Nazarewicz <mina86@mina86.com>,
	Robert Baldyga <r.baldyga@samsung.com>,
	Felipe Balbi <balbi@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [RESEND PATCH 1/1] usb: gadget: f_fs: Fix NULL pointer dereference in FUNCTIONFS_ENDPOINT_DESC
Date: Fri, 18 Sep 2026 08:54:38 +0800
Message-ID: <20260918005438.81263-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918005438.81263-1-ndaugoing@gmail.com>
References: <20260918005438.81263-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

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
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
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

