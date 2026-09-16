Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D652941F;
	Wed, 16 Sep 2026 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568810; cv=none; b=sOGfhXiRyVCvExSuXcGM72F9H61JdpO1eZA/2HWxrhzf7BUkwk1KrpQfgCoUyf7p8g2KKbbsWVU07auQl6Avp90qMNESEOHDqUDAWNpbp/Kw7nw93ppmdMF1C3sqr/ydjkXNBazxIvN+41RbXIn0Cjp5XNfGs5Xnyu6w8xG6Fpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568810; c=relaxed/simple;
	bh=t56PTIEMD6KJ1LpbTqBV68hm2avVCk2Z65Fltr6myFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=karQAponL7/xOzfKdNmGjuFmxors+J3iR0qkaZBvxQXfjaUNkG/UZKSjwEQ7tZbt4UVpcjNRV54HT5tbze2F4fJmtd7V3aCIzUe5sokzF6LluVTTXfOLiYyoCgGvVgL9y66s9+M15Bx1EvGXylmiNMbg5Quj81sYkxJ8ogVkHyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=haPyE1jP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="haPyE1jP"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78E581CD9;
	Wed, 16 Sep 2026 16:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789568702;
	bh=t56PTIEMD6KJ1LpbTqBV68hm2avVCk2Z65Fltr6myFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=haPyE1jPPSVm2TgTDn65y4Ei6N3J5wjJlQtw3d8QPUrfjG/H8G4l1MHtxG2Io/gOH
	 qJFXM0pbzN5x+l+H+2M245FFPssdkIhRrGWOX5oXAmhtyxAlu+jrL/QBf8vUGLiz8J
	 JH35u0C6cwWfbtpxcAmSEpnoNE1KPIeWj2JPD0N4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 19:55:35 +0530
Subject: [PATCH v4 5/6] platform/raspberrypi: vchiq-mmal: Support sending
 data to MMAL ports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vc-sm-cma-v4-5-476d1142b5df@ideasonboard.com>
References: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
In-Reply-To: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=+cbIEbm0BcZYuTwzOPCWWmdPETU+3xPrZDmLWGVQ5PY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqcAveuBypZr7L5cmAB6RNPAV1dne2EbpZQtj
 IvzqxmQ15CJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqnAAAKCRBD3pH5JJpx
 RUMnD/91C7SEXaxDKD7Cqyeh9ameOD563jkxctw2wy1mampgeKfzN4oP5YNJM1UJBGujL8MfmAo
 btIDaWnm6gIUoghADIvaE5+m3Yb9Jq3vNcugX3547rIglEQrhcZaY1XBFPdmVt6CqxS6ht5GYVW
 iNidikd5/Bh2f4OvHoIeajSDA8KYaQjRje4KDoUPNM9qMcaxQVqlDbGf9P7XVjLpZdelsUfvmHf
 BTRXeOoST6PpFsi+ToPR7XGKDg500Aaf/XmN2RddNy0TrHqVAfW22OpuaPIs+zfuMptB4fAKs2y
 1aHEyeWl8habFErrXZ5r2xg+idOKR2wgl1fTEEQohltTHM9gdc2wlYLA2GbTcOCeBH3aSTYW27m
 H8Ug34OPcTnEqVju3EMGnkfbYO9Xg4buXGQEOU65CFLKOykjCeDOxyvHG6kSCviuBXjwYvbJ2hM
 8iKxsLmyQ4Ed/mknU3c4/0bu38BweHdWlCSS6uPBv6waiaGj60Lw/+769sMI887sRShxzFQg4yu
 H2VCrdPsLbMZ8fDs3xpKEqa7eGPwpgbhEIY1ret4nG2IduC/BsX+2bsIvak70k2dyowOWvBjcS3
 tPacf7mqalLYR2XdJfnER9xMsv7jJbB0+GCCBEeRgcQa/SzsJydrtGqkVIesI4chPPwaHVs7Hc4
 HEL4GSmXFpZRKlw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add the ability to send data to ports. This only supports
zero copy mode as the required bulk transfer setup calls
are not done.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index a64b5175e1a9..ccd8910c315f 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -430,11 +430,19 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 			(u32)(unsigned long)buf->buffer;
 
 	m.u.buffer_from_host.buffer_header.alloc_size = buf->buffer_size;
-	m.u.buffer_from_host.buffer_header.length = 0;	/* nothing used yet */
-	m.u.buffer_from_host.buffer_header.offset = 0;	/* no offset */
-	m.u.buffer_from_host.buffer_header.flags = 0;	/* no flags */
-	m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
-	m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	if (port->type == MMAL_PORT_TYPE_OUTPUT) {
+		m.u.buffer_from_host.buffer_header.length = 0;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = 0;
+		m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
+		m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	} else {
+		m.u.buffer_from_host.buffer_header.length = buf->length;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = buf->mmal_flags;
+		m.u.buffer_from_host.buffer_header.pts = buf->pts;
+		m.u.buffer_from_host.buffer_header.dts = buf->dts;
+	}
 
 	/* clear buffer type specific data */
 	memset(&m.u.buffer_from_host.buffer_header_type_specific, 0,

-- 
2.55.0

