Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482369;
	b=yaMXduZdsAIdFk6E1AyW4w9N1QR1FAAU7YqG8f0HWCQC/8M0/ROP7NPBa557b5hGimft
	 +7vOdy46C9GwowAPx5+4drSulUOptuealttCWIHSU0h2Ul1OXTLJsolrvNf8UUb6OYodF
	 FS7zb9SBQJrkIE1zCdS4l3lSyCk53p53x3NJKql64D02hVRsB3RdGx7kYRgtGTX+G2QWF
	 8qzN5FfgXFvIODOdPbupEVvW5ARA21f7QlxXk2FcseDR+fZ6tE/FYaFPL0UJNE/jXAV7H
	 TbK73v/1FRAmBal3//Bpmt84vwWq6QRR+KorT2buTklHdDn0c0awSiQ3D3qqHy9FwVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482369;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=irmL5J+iRGjahND8KKQTrYXMjS6LiiFKcfsqoUbplGk=;
	b=Fu9mH9K27G4KWbJ2xcUKJ4UzdaVEAJ/y3VP4jbxJ9uWf4/OIWMYmewFDEdM5QaSRdYK1
	 o0enI8uOaiIc97bkiKXhQD1npDUWopjw6UHw6N3HeylQXa/GuSWAh6ViQSxWBSWrqGrDi
	 VdBn+o4Ifb4bZsvFB2LIcRt6RMPTVpulGqzw/lGvDVZNhXVhIuiPMOTHqBYyTn3jKOvSP
	 3sfn05bjbfJ57Y0vyXGzulyZhUoEdL6ANTdt43jjdo6zE+1b/MGynzQPbIeXaaDZysZqj
	 ZYldvgoIFLE8GIdGu5+EiOT3mc76da4uYs1ITEN3N3ZeTc3U55/tlTvnSd7w4tTHZ6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=aj++ih2p;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7CC606A323;
	Thu, 12 Nov 2026 11:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7CC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=aj++ih2p
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77E2FD77;
	Thu, 12 Nov 2026 12:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482223;
	bh=Sh/fFkblcim2sBVgut/V8LcfFgwt40wOVutD4SrDAW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aj++ih2pUBMzFCB/ToinGYiKbhnNJvJyJe8PgnCK/fyKKh7MZ1EonpP5WQtbg5jF3
	 hZCLOnGxvY7l/HYTtXV0Ha5WOMjv9XnUyc/bA7VTBX1JjlPakoyFSKco3YBKCdK2m3
	 r/bPtk58t13g/Kwh2OBL/HG4hw1TSDl5uDSulRxk=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:09 +0530
Subject: [PATCH v5 11/11] platform/raspberrypi: vchiq: Add helpers for
 vchiq driver data
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
Message-Id: <20261112-b4-vc-sm-cma-v5-11-d25e3b687e71@ideasonboard.com>
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
 Paul Elder <paul.elder@ideasonboard.com>, Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Sh/fFkblcim2sBVgut/V8LcfFgwt40wOVutD4SrDAW8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB+MGj0mZOm7Frm5eJ+8tYoAivhxuqiSGSzN
 5Fcd9ikDgqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgfgAKCRBD3pH5JJpx
 ReD7EACt6LxaokkuMdW2vtsU4/OSh1GgmjapvL0lbgvzDXXSQ3zt9eozQySyX2X7BDLT9GSp0Ok
 gHhl4J+kc8d6lMTZKMypTx3fyA/IffYokigEMGMRmBDBtOjSIYH6bdesdkPd9uXMmh3bBOrFAsY
 TwV6/1CH2OiLCmDcSsSG1nn2OWJyh7xz7RLyqaSiWQFuxv33r34UccdubfSLqxfeMeGDSwXyuTN
 eKN0kvqUBKYHgXyf9CFcH7895GWdPuyMFLndQu+wdEU9FEOzhigzV0PgCgOORJQ916q2pvO1Iq5
 wGzkFJYZyrW85Aktk1CVIYOHNkPTQLZLmGmHwkN6qxARvbeaQwsa3MZu8MTjOdYrzZdxuotJOHy
 GToCAKsT9CjjAjNIbPJMVOmti5g/25E6/R0c8K0uCf6hL1SdM+Y4dTo6EvkJjSbQ1uPQoa0Kyol
 B69tv7JSiiT5CGvPJXehIKLdn5wFcHDW0KY67htE+sToSMCfXkWR1Ml0mqlbol6OHVFTDsC2zfn
 u/sfIRqMz7oVipLm3pvQJ5UuNuJDzNv+1jFjAcmLld94lbt4Ah5kLDfsPaa/i3j9w3TpGh/nK9K
 o1Ukf+dxeyds+DpDQriAFW1fPAAxOicvNecn4yYblC1WUfZNwMijnT9EA41k7ssDlfitWgeWpmQ
 O3DyGP/h/dO6dIA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
respectively.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/vchiq_bus.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/raspberrypi/vchiq_bus.h b/include/linux/raspberrypi/vchiq_bus.h
index e52291a3b247..513a144bfbe9 100644
--- a/include/linux/raspberrypi/vchiq_bus.h
+++ b/include/linux/raspberrypi/vchiq_bus.h
@@ -37,6 +37,16 @@ static inline struct vchiq_driver *to_vchiq_driver(struct device_driver *d)
 	return container_of(d, struct vchiq_driver, driver);
 }
 
+static inline void *vchiq_get_drvdata(const struct vchiq_device *device)
+{
+	return dev_get_drvdata(&device->dev);
+}
+
+static inline void vchiq_set_drvdata(struct vchiq_device *device, void *data)
+{
+	dev_set_drvdata(&device->dev, data);
+}
+
 extern const struct bus_type vchiq_bus_type;
 
 struct vchiq_device *

-- 
2.56.0

