Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C151E445;
	Wed, 16 Sep 2026 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569322; cv=none; b=rJcIJBrVfOngdCiElmeY2eVaa4+eOrap4n0AuIdCTKeP1IXlS75IbFFuzOJ6F1l/vB0YuT+iAJJ4ErOSsoLQn9zTPiD3UDveg7rD64+UB0dDXiWiQ4emUCDMaPRen8xCiUoyqY6HKjkspDHAj1Roro2W75Ji5p99CvD2y5ftRkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569322; c=relaxed/simple;
	bh=KSSsHTc9gJYpazA8M0o8Qe2DWIJZPucRqQvEDKeihqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwJ0eleFC7uiDHRVWrXbmVrZ5Yo0kmXrVedbogEXZ0RphiWLu3oXWF5JdQdBB6ac14N5A9xdKE1rYrq18KZeenD1IdCUBWOnzruP/4H61PcxWfmY4bIeWAiBedacLpWpQC94T3Mcs6aKgtm8QSyoAG5IBjgbc7KMTf6oQohUuso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GekojWnI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GekojWnI"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3FEFC42;
	Wed, 16 Sep 2026 16:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789569215;
	bh=KSSsHTc9gJYpazA8M0o8Qe2DWIJZPucRqQvEDKeihqQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GekojWnI+WolWKrWhWPUDsOv8f/y7d8/GgaZzFof5+E9jrz5j2Ay39+uzmtO6TntI
	 fbn3PcQ2U1XLIuJHUp1klMRRbWxIrgZl/ec7Fy7MOiHOxveEVXRS3t95Du0sqimAK6
	 KHhCZbRasgjr5JKLePYbThzR81/UmNceF/eo5q+A=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 20:03:00 +0530
Subject: [PATCH v4 03/10] platform/raspberrypi: vchiq-mmal: Move headers to
 include/linux
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vchiq-isp-v4-3-f668c2017b74@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4969;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=KSSsHTc9gJYpazA8M0o8Qe2DWIJZPucRqQvEDKeihqQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqkIvm6Xh6/9IpN1WWwxqCzrZaPcy976Ast6T
 rgOMr7LmxGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqpCAAKCRBD3pH5JJpx
 RToRD/4+CK1TAXY3qFzDwL3vohDEKltLkhIcxWU5Y0LE0VJi7APobM0NshJtsYoNbkxl9N+rTdI
 hsb3+x63inGRN8fiQSLPWu3xK3/RFz9q3DZ/ACzvPLQhQVKia7S2Aass7zQhwPR+Bfdr9rFAPxT
 /kao5EjBHWph+8MEm/OuWGY8ivp0djtpPzMQmK5aCq3KgDmbS17dfWtegjtmzW+TMoiXPxXfldd
 hA8KxFUdwxyzHOrParnrGew43ixEfE6Vom/utDVbqjDr4e2gv/AIlg/UwqKIg3Zd4jT/DSIwq5G
 JoawdyUp81Cwuz87Y446Xmcm0qpL+rWqW0BRK5JoqQ4nk6eJ1TfewkRb1IemWo3pyL4zekQnSKe
 EHM4Zol4W0sSsD2WPcpt/eXu7XWbcBYvYFOoUEGxrrOed0hGuMZ7HeynVGX0177M6Lo89CBsz7S
 MnVLTDKAIJUqhOZ9CFrxKpI5CoQNg9VB9601IpSVhRcs5l4ysKDr3cUSjZviONDDfeNPTqSqc/E
 XNg9mTn9xdngoAxTB3sTCDCiFdPovu8jpI8Wd+OJT7sNAB04oNqoUq4DLCwnykNB2Vp5DyAiooM
 0/DrA1O7ulbrUI/d3zPsJfuha/76v1o1tSk+fQu7R2QM1Zku4Y/jbdtc7VZMYzgn8U9OTYx1QRE
 cCU4rvbNtnqZB1g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Now that VCHIQ interface is destaged, different drivers (like ISP or
codec) no longer live under the same tree as VCHIQ-MMAL, but in their
relevant trees like media or audio.

Enable access to the MMAL headers for such drivers by moving them under
include/linux/raspberrypi with other VCHIQ headers.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- None
Changes in v3:
- Split missing includes patch
- Update commit message
---
 MAINTAINERS                                                      | 1 +
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9 ++++-----
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-common.h       | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-encodings.h    | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-common.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-format.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-port.h     | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg.h          | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-parameters.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-vchiq.h        | 0
 10 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b887ac593088..0ac9a9d7b215 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5160,6 +5160,7 @@ F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
 F:	drivers/platform/raspberrypi/vchiq-*
 F:	drivers/staging/vc04_services
+F:	include/linux/raspberrypi/mmal*
 F:	include/linux/raspberrypi/vchiq*
 N:	bcm2711
 N:	bcm2712
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index ccd8910c315f..80406e1f4bdc 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -22,17 +22,16 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
+#include <linux/raspberrypi/mmal-common.h>
+#include <linux/raspberrypi/mmal-parameters.h>
+#include <linux/raspberrypi/mmal-vchiq.h>
+#include <linux/raspberrypi/mmal-msg.h>
 #include <linux/raspberrypi/vchiq.h>
 #include <linux/raspberrypi/vchiq_arm.h>
 #include <linux/raspberrypi/vc_sm_knl.h>
 #include <linux/vmalloc.h>
 #include <media/videobuf2-vmalloc.h>
 
-#include "mmal-common.h"
-#include "mmal-parameters.h"
-#include "mmal-vchiq.h"
-#include "mmal-msg.h"
-
 /*
  * maximum number of components supported.
  * This matches the maximum permitted by default on the VPU
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/include/linux/raspberrypi/mmal-common.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
rename to include/linux/raspberrypi/mmal-common.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
rename to include/linux/raspberrypi/mmal-encodings.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h b/include/linux/raspberrypi/mmal-msg-common.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h
rename to include/linux/raspberrypi/mmal-msg-common.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h b/include/linux/raspberrypi/mmal-msg-format.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
rename to include/linux/raspberrypi/mmal-msg-format.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h b/include/linux/raspberrypi/mmal-msg-port.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h
rename to include/linux/raspberrypi/mmal-msg-port.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h b/include/linux/raspberrypi/mmal-msg.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
rename to include/linux/raspberrypi/mmal-msg.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
rename to include/linux/raspberrypi/mmal-parameters.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h b/include/linux/raspberrypi/mmal-vchiq.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
rename to include/linux/raspberrypi/mmal-vchiq.h

-- 
2.55.0

