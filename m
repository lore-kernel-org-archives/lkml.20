Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482347;
	b=Oe7PVvA1gMMSERdYggoAZqH/HD9nu/08/h3tqdvPIMPPLuXLfL0H2pbaorgwKuGGqqeL
	 /jiaFKUo1WR8sZ4dlimfIMovGa8ibBZ5bxMB3RZ7FUbLB4u6PP/ueKW7b6cuCQlKfFTJH
	 5mCrL14eg9SceXiiAG6sIDQJxJWtitan/q0OIaHC8EKktYjTR/PkWVQkI2LV/OUsFa7Sj
	 laVno6A6aN4oHMW44+HNvvydvftgjeMX80ysxweMZwsdqIAI5vp7MVitmAhxBdBmCZNGL
	 yOCwKt61F5OUS6geD3iubytvSGWXru77y6sPrXQDLxrtnw7ls+pNRhfysw2pzBHAkTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482347;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pZt9hvWBdMeEBrkpt//n9ESeZbnkVdCvqzoNQxDnniw=;
	b=o4G/pPky/7FFi2cvFErNysO8KsFVX3fhwLrgf8DI6fMj7DnaL+xHpcb9PyUomoEmM8f0
	 j2jEF91GiV5uezmfmJ0yl1DyfDJ3OYD1GyrTy1leXankODP+2yABtJG03gr4pVORIc/uJ
	 v4B4k6kO2XZakvluLhBnbUG6GWEsIaByGcynOT3PMg7Z/G/+9AGI9dIFkgfOyQwVJfLIi
	 D+GVQyuQqx8gs/swHs5m+SDoOjXeYohDp6SgGj/cMIXN/P1zmSuYukZqqS73ireIsG717
	 OTsi3T1pOM/41FWBbrFRdVqC3rNpSFyoYO+y91I1ZcXCDyi91caePj4TlWnXngT/sMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=h4G+V6IK;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CE8606A331;
	Thu, 12 Nov 2026 11:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CE8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=h4G+V6IK
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61814802;
	Thu, 12 Nov 2026 12:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482201;
	bh=VNxGEP2sK9V1GZwt5ANA2WUrpwBvB9qwok8jWl9aNFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h4G+V6IK38S2NjnHkY28BssLT+JnZxtGfX6MdDm4zzUUA87WEhnFIdexUd0s+Pt7F
	 AXUCiGqOZX9JjnkYs9kNqTU+GToIHddPfpWKJCJVU4tXRHhLQ6II4VlhX/YC74sBrc
	 wxwUXdexf+R7ReZwPfKEBY5dX5PcPGlqICw+DZc0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:05 +0530
Subject: [PATCH v5 07/11] platform/raspberrypi: vchiq-mmal: Include missing
 headers
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
Message-Id: <20261112-b4-vc-sm-cma-v5-7-d25e3b687e71@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=VNxGEP2sK9V1GZwt5ANA2WUrpwBvB9qwok8jWl9aNFY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB6Jfv3cNo08PUAnoKItFaP20sQasELEVc1Y
 w6xhee9maOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgegAKCRBD3pH5JJpx
 RTE0D/9kyjOxl/OKFzY8AkVCWbW6N3gSbKrIxZpfRwT8jiK6jby+yVjt3rCMIia94QS3Op3NUUe
 f+ioMTbUek8a2sc2Vk/S24qLVtb2TxVq7Wd1G+ecHlO5UpTpInofCjT4+4ATCn0RHmaxUl0W/m3
 ARmIjnbdphFTmR37E2DVDXR3Hhc/bgLVBOKwpPG5CYHXbgiPSPjNKhvIG4eKzlWQX8AYcBBXqn5
 3Iar3Bbj4/oQj4Sey5R7icH52LrTKjN9QD+Yx1h5/HgKqie8YBrAO4HGS/ZhKhk33xoAeumRrkW
 8EI47Gxa3QotI1F4Dgru60UMwFsobbXWZYkxocQ7kdiDRqN//jUCtelD+fBZssLZmIa9ufnEJkg
 8lqUD8aJ8khFStcZtmFrtQC958uWrEQkTiUfqhrXiSM2VMDG203RxuzpY3HjIHeTr5rrgE5o0Ac
 yVntnKDB0ZMTmxIzuZdtBScsywrR8gG4ZCVsgbK8+3fXxKO0GNrZinkFs+9hBLGAHCWGyeDi02+
 RIqmojZ+VS5GO+yJKtsDTSzkbzyD1c6yUsVdNkDa/D5uKcFQEgrt/LxO4Fa4jExU1603bUdeq5N
 cvf5C3al+2o//TyB+j+S9hAfB7OaidDovQKVZ5Ie1YsmzMLiB+BQuHNr155ociw8y+c6yXEUVN2
 itgp8GXxBx0Z0dg==
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
2.56.0

