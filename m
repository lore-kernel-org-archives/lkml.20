Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89190503BD6;
	Wed, 16 Sep 2026 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569315; cv=none; b=mO2ETThdD02OQQf7KtM0KTmQ9Au3onQgUaCaHvQQ2F7Z0vF06yl71zqlfojh/ctQu2ACrqJy/dba0kQjqu+0g3kTmrqCFJ/LMrVdn+UQS9yVMPwHDcb88oEdUV2HrgUM2wpDvZECRP5aF7xG/2m7C1rgUkfYaSAzMRFkGxRCYpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569315; c=relaxed/simple;
	bh=tzbg7uK5/shkC8bFSCg25CEDhd18zzycIlQF7Bl7Dm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pHFbZt5RDzo5s6sCT+Muj4G7RZl8yGqv+m/q1L3pe5QDW++GsCdQRoY7v6hPTqykVtNLVRpIImjANh6nXAXxDjThBiCxfbOZRBKrXPxHoWro7x3+ctXgoV+owtKikX96IM9E4pdMhLc3B/iUfKiNMeqeUsK/o0+K0L+ANkkW4Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cRq3EGA9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cRq3EGA9"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBFC8558;
	Wed, 16 Sep 2026 16:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789569210;
	bh=tzbg7uK5/shkC8bFSCg25CEDhd18zzycIlQF7Bl7Dm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cRq3EGA9s3tXLyKlkiAqhl6/DietXyGcehJcKsDHijGNBw6FNupndiU+4fOpNzFb+
	 QNUTn4WqoK2lxrhDc+f90UVHXRRP2bOER94vGDdRGJG6Mz1NAKqlnl64X+vXRVd6Jb
	 uuy9ttyucrQbSCdE/pnwcScSC9TGTNJhsrRnTiUM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 20:02:59 +0530
Subject: [PATCH v4 02/10] platform/raspberrypi: vchiq-mmal: Include missing
 headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vchiq-isp-v4-2-f668c2017b74@ideasonboard.com>
References: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
In-Reply-To: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=tzbg7uK5/shkC8bFSCg25CEDhd18zzycIlQF7Bl7Dm4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqkHqgvdDjcklgk3jIZQUjLEBjvIXkYX0fTRd
 gjpBTV50ZOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqpBwAKCRBD3pH5JJpx
 Ren8D/9bjXqG5BeWKfJIXufmx78vBS+ow+U0YxDBUFAkVJQGOQbjqkWP02v7LwiLZDPLOtnQsln
 Xc2fI2twRQxM5OkHNDtrYNQGiFa2+DPDoLN/MVo2YBKhNNNgjR5scYiOUOcivh7+/WKDIe9VmVh
 8+V+AavPVPHMVGm4nlL4JkzuEm2HGtqvbRUV+GS/noSNaKHOhsVzWc9q2fXlZ6jdV+YuuMyIEF8
 8QyXjOf5q43wF3K+z3nPVie05yE4WaXwAxJJSwzx4qafDC3/8sU1SZ8zyAtsSVMvPgeSvnvU8tt
 Td91so73hYQAqF/ErBPywTA5ZPkm0ShNjXYDgTKvrJts5Wt36ekZjiYwQS5K1hczpWz3SBQrVg8
 Pk9dCu6+gLXU0ELV4MzQXU0oMWSgfcb52/RV1F5SeNxROhfTyVp+kpYW+ZqJxl/N/pwTeyr8mGW
 Ps2AIWN1LLMPwQX/h/NdI17Wk+7ZGJv4pozDNXZeEVWUWV74fxx16T1D44p6UDqv96L5Olp7yoG
 T/mCH6CviQt+hmTOrdXPIEfZksZPtTxOHkp7+wc3ixP20l1GfOnaNez9VBfaqm/wnFYOGiFIpu4
 FUzMAKC5u6mSrOznTXNQUYLH7TrW7eM+M7WSpqZHCNXJMBkKbu+N4+xcktvkvUg0bdMWgh5almC
 V0LfX8NVhStH6wg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The structures defined in mmal-common.h use types related to lists and
videobuf2 framework, but are missing the explicit includes for them.
Include those.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
index 6c5092a68b99..c9976bdd7490 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
@@ -16,6 +16,10 @@
 #ifndef MMAL_COMMON_H
 #define MMAL_COMMON_H
 
+#include <linux/list.h>
+#include <linux/types.h>
+#include <media/videobuf2-v4l2.h>
+
 #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
 #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
 

-- 
2.55.0

