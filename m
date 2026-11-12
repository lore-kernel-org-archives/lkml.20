Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482352;
	b=b5iFUIqXtfoTG071cSCXg0QifSjIjwDWqG+a2JEBeNMl+j/IaS+sxjko6kXbYhgWyABR
	 7ydHqiKhUhdeTkhEWt34rtjj01I7UeSjLOUJii/L1rnMT22bxJguZU+iZk6r/Rs7Hgup8
	 g8C/KDawTrtpMP6HwA9HYUKAwd5vLjMOPSIYwr2TZU8wl2SHO5uwS4yIqHGnLJ7MPhM/Y
	 Ppo/maU26KC4OFCLWkLH9SJzGBQqn+omDi93iqLWgmuue6+BUK8JUthHjPdd2BiuFFkom
	 +yBtmLfK+RjTmDpvimIriBGB0ycq4KPbjP6JI7gFzVMLv+SXkt15tkrIYNra2f7pdgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482352;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NBXxL4HLWnFskNHlkvwq5/j+VpUcxVKH0nw13yLix1Q=;
	b=DT3jMJMbiRBDWjJj4jNdvP1kqedEHl+HBWXBbOUuFpOsSzmnmAVXRzef0nIG+BZSPlXC
	 6Z7gypKxoOdeNVsDwG3ao25GGH5dMlA4yRTehQs+2nueLhKoxen+jy2yzItCJsWwE0MP1
	 +1rlLISYKOIHAgW4GjCzVQhM2siyM151j5oiwCKk9SYi2LMlpYmE5Pyi/2XI75nmQFcXa
	 YofnmCgSq73XiXPHc/ed4fctjM2HDzTUm3yl7pzINv/4jvI37Ym1X1tZAv0N1RjakBJ/g
	 549MhpRVtITmVmfOR9BoAZi5GAt9/QjKDzrmNt/SMKaE7alWzM3h/Vss4eJ4Mb2xUOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=jCsUeDcM;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579A5606A339;
	Thu, 12 Nov 2026 11:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579A5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=jCsUeDcM
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF82533D;
	Thu, 12 Nov 2026 12:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482207;
	bh=RBHaLzBSJCye4sr8fGkAv5y4Ea6SLLuVOecMFONaZTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jCsUeDcMyb0T9rWznP4vDi6xJJxF+VOHutWVEDyNqAJGQTTrOJ7hj1GdgTf9IKwQV
	 4IxmzTpfRROXVysAkBTV7+TuQAd0fa0wIgxkS50Rz6X871EKqvIY6559Hxp2+OI8KQ
	 1BRrZQ+IsC1f7iyMirqpFAXoa70sYmUjiIBcm4yc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:06 +0530
Subject: [PATCH v5 08/11] platform/raspberrypi: vchiq-mmal: Move headers to
 include/linux
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-vc-sm-cma-v5-8-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
In-Reply-To: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4867;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=RBHaLzBSJCye4sr8fGkAv5y4Ea6SLLuVOecMFONaZTA=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB7N1RNNAQESd9Kf98CzN9/Hct9wzktrQTw8
 3IkrIfIjsGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgewAKCRBD3pH5JJpx
 RTWqD/9ZbqG7yT7A8d7Kh0VA4zPEeDIgWfbE4bT0Qzh47+JNiUuiw+Of6U0d6D6VUHMEz/qPMJX
 iEnkEcI+ClJg+Xpvbc1Uz+/XY7A41k2pWfbunwgqgAm/3Aj1Wuz1Vq5dl5Ca4pNZLTVEpKHzkcM
 2vitwvWqWWr18C0cA3cmONZJ7czcaE1TiyPZJTUlR5Ywe6ReeZQXfI0Z8YIY4OfvpmykhsWcvJk
 F7bvg2b2oK6Xkh+NhLE9YglQcANjlsHshy8B8yrPKzNRA1O6Fx8H7hpCTW4BepQkzqg4RMdVZVE
 86yBDd2kAzxwkWtcd/A71H94t22bYuS1cgocXJGwcxS+Oo5yuR0QYU+8eBbJ10alsWsXJmJrOPq
 ns3cphxiUvQmHfQHbsiXh5rMQtnvhATMGklWxvz/XnKLYJB9z9Adic9fSGH6RTzomEOJhAjJhOa
 t/10i899DyJfDULY2sVIXGCznqLAW1HZ/m6qGlzq0r7imefeacSU2XNOV/yvGPlZmncMZwhnsJw
 U4IVpCil1cOQKq2nufejFDFrFjnVH+UtRcEecmeNHqXQLmK/0OY1rXWOugAV+PbiHdiQNoZ1iie
 5i1Q0VTKnllbhN3qyzfwjFSe8G2vXCXdiMLGLf072r+nouE5/XAvPbrSzwIyp9/Bg4W2YntlN6b
 rh3SmfUjq2uOBLQ==
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
index ca8508dc818b..94740f66baa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5307,6 +5307,7 @@ F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
 F:	drivers/platform/raspberrypi/vchiq-*
 F:	drivers/staging/vc04_services
+F:	include/linux/raspberrypi/mmal*
 F:	include/linux/raspberrypi/vchiq*
 N:	bcm2711
 N:	bcm2712
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 5091bcaddd11..8d765aa7ea12 100644
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
2.56.0

