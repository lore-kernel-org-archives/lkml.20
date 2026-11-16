Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836004;
	b=EOgGNz6tfLfn1AsLz1BEpXCDh26Ik47nyx7e/r6AO8OCsMrCZmjgPVQo/pi1OUg+NqEE
	 TG9vdv3A48Bn/Su+0x4KRlSf4eDBKuZHMDDIe84XtekJcAaYYBbnbez3P2VoZ3W6hIgBv
	 EFPNkqGb3Dseg9GOQsG8vG0w5cFCROQSinv8CsCdbBIspM72zTvbSHm26ZdG+RGn6HOMi
	 DeICAGbXq8Q676FBLwJGy1vyeAVfL5FY2kqCUmJlpv1kZq6nA/QiMgYIHtA1rGRuFHhhd
	 x1JTfmqd6DU3nhRD+zU3qzqQfwpk8cBz0xQDrc5z4ypnwLqVVwnr1aQ2LhTecIy8Ydg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836004;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6hYuKtrbtxvWkisqDSoyhY2yy9+C2j0v54EuJrT4loY=;
	b=KMlZ7E11b/HHAN5lw/73oZXgXxabqobGUEXoU74AJUXCuBnXSHuaMUc4DJMmtX66cQii
	 iBpgUXV74pnVtZi44P3iRu0nFaE98lgyWXPWVgHH2FTWHnmwk1UY+oqTb6afcw7vR20mA
	 5XZVE585w24t/qUIG9Ey8grbe54DvxVrZFDQ9Ir88YeCEv5xwHBPCCM6a139swb9ZfDIx
	 8cYnDVsGVYeGyZJdrnEJbgzBxjPMJA5ay1HpVq7veFTKwZPNoVwAsQ8QrC/vDAo2YZ8v+
	 hdKUTtKHkdKIvtx2TKGlj/QMvKTMLUbJn92IlgvI/3GI6WSZ7rWuS+Kz3XBOgJ9FBww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Km5POFvL;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A333606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A333606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Km5POFvL
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7933063C;
	Mon, 16 Nov 2026 14:30:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794835855;
	bh=YOP6NiAUVG/ojIMjEDwSst5ZI7RjfYBIDhbDs6uAco8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Km5POFvLp8mGWaQPLsuamnV2bq2M4Ei1ilyf4TNzeQfKJ6e4xnRWZaVnHbcHW5K9Z
	 ioGdoPiRRMmA9GV9OiWrVqrKtw3CUkKDPNXqbXckjS0dTQVCLL7YocBlrZ8vhZWvDA
	 ulT4EThCoK3fkdQCDnZQfFPWBkuZUZesw/G282X0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 16 Nov 2026 19:02:53 +0530
Subject: [PATCH 1/2] platform/raspberrypi: vc-sm-cma: Fix get_kernel_id
 check, pass NULL for pointer
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
Message-Id: <20261116-vc-sm-cma-fix-v1-1-2b0f11aa96b9@ideasonboard.com>
References: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
In-Reply-To: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Dom Cobley <popcornmix@gmail.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Juerg Haefliger <juerg.haefliger@canonical.com>, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3078;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=YOP6NiAUVG/ojIMjEDwSst5ZI7RjfYBIDhbDs6uAco8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq+wYUGrdGadCw1ssQA1heQELEXHC9GOdgHdlKx
 XUIXPYVpqWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavsGFAAKCRBD3pH5JJpx
 Rbk2D/4q6j7Acpm3IfLgBAnc71WYXwsXNDvS7O6D7GS8D6AzLbQ51tV5OcFGNUt7vV+LfzoqCO3
 uNMm+F49AKoxDnquXLVeqaX3MbjMwVot/CVqDD1V0ORZkgTQc4U+eEl4/Lwh42lxNKpluTA9ljs
 eOAlXx0HX47l0TvmfNaYBwGzfI23mxxAShvcjBevXauNdvAGEM3lTgEKPCxtLqTWn8zRe8lNqS3
 hdPk/6SJ4LbzM395y32I06moZPyTdZqOulaVGW6gEQINEYBPN49JaT5sXOaGehMaavN/dbzA1Bb
 vh4+s41ufoUDh2r7LBtS0gACU5i/n0awnwDIT2clS4+1d9ZK54TiE074ewD2WzdgV630KfDwzNn
 Yt+x3z3hvRim1OQQB1eyUqQCt3+ymK0WRgHhDhj+UeFZd/AFPcEAllg32xr4KCfo8o3EfewJ4th
 +W5KZiT+fw3ImJXpX/FUmdN6pyKc6yXfrfEup93d+yn6UBWN20dEfU1i2r+krV79+t6Lw2fXgAu
 YhBIKqTwRkScZZ/d82KNh8iPjxhiHj7pw9BUJxMrgA0rLc6Ta3oK6FWk9pJzhg8a1XZFiKOA7H6
 MUzb5qDL5NrLZU0WGwcXZWdegBxWiqaqjpuxAqYykXEHVDS5mK39SR1G82aB/dUmombJcD3s8z3
 hgkb7+v46FNTUYA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Fix a couple of issues reported by sparse on the vc-sm-cma driver.

The first is around the retval of get_kernel_id(), which we check for
negative error codes after assigning it to a u32 value. Fix it by using
a temporary signed integer for the check. While at it, also ensure
during error handling that we call free_kernel_id() only if we got a
valid one earlier.

The second is a minor warning around passing 0 instead of NULL for a
pointer argument.

Fixes: 0d6409fd70af ("platform/raspberrypi: Add VideoCore shared memory support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611141042.Rxt6cuNo-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202611141002.jCrJ06DU-lkp@intel.com/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c          | 11 +++++++----
 drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
index 4dda06fee533..2d9bb5f957a3 100644
--- a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
+++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
@@ -415,6 +415,7 @@ vc_sm_cma_import_dmabuf_internal(struct dma_buf *dma_buf,
 	struct vc_sm_import import = { };
 	struct sg_table *sgt = NULL;
 	dma_addr_t dma_addr;
+	int kernel_id = -1;
 	u32 cache_alias;
 	int ret = 0;
 	int status;
@@ -469,11 +470,12 @@ vc_sm_cma_import_dmabuf_internal(struct dma_buf *dma_buf,
 	}
 	import.size = sg_dma_len(sgt->sgl);
 	import.allocator = current->tgid;
-	import.kernel_id = get_kernel_id(buffer);
-	if (import.kernel_id < 0) {
-		ret = import.kernel_id;
+	kernel_id = get_kernel_id(buffer);
+	if (kernel_id < 0) {
+		ret = kernel_id;
 		goto error;
 	}
+	import.kernel_id = kernel_id;
 
 	memcpy(import.name, VC_SM_RESOURCE_NAME_DEFAULT,
 	       sizeof(VC_SM_RESOURCE_NAME_DEFAULT));
@@ -544,7 +546,8 @@ vc_sm_cma_import_dmabuf_internal(struct dma_buf *dma_buf,
 		vc_sm_cma_vchi_free(sm_state->sm_handle, &free,
 				    &sm_state->int_trans_id);
 	}
-	free_kernel_id(import.kernel_id);
+	if (kernel_id >= 0)
+		free_kernel_id(import.kernel_id);
 	kfree(buffer);
 	if (sgt)
 		dma_buf_unmap_attachment_unlocked(attach, sgt,
diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c
index 098342601895..54d318735575 100644
--- a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c
+++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c
@@ -481,7 +481,7 @@ int vc_sm_cma_vchi_free(struct sm_instance *handle, struct vc_sm_free_t *msg,
 			u32 *cur_trans_id)
 {
 	return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_FREE,
-				   msg, sizeof(*msg), 0, 0, cur_trans_id, 0);
+				   msg, sizeof(*msg), NULL, 0, cur_trans_id, 0);
 }
 
 int vc_sm_cma_vchi_import(struct sm_instance *handle, struct vc_sm_import *msg,

-- 
2.56.0

