Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504C33B970
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835851; cv=none; b=ScPnn1yIH87Jl6uez66C6O8dTKtii+wdgktt0wKJjegiBb0SpbQlndqgVku9ucYojsM5U81F5yF+bHVjCCixOja9F4HJSMYR7RjB72EyHSBwN1vYQvMC1HFZmiCXH3rGjKmJV/ZNbZzXoPRCJaYmMSLpOrXztP23813R0dkPu4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835851; c=relaxed/simple;
	bh=8scwP2K9ueQuyM2+SjHi27fyJ+pvMN36j+qLMyAbi9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VRsTy9Q9BX2nBsL+SnkJ5BDUuXw/gbqkQ3TzPKAvvQDytqMczKNImVWB+vX3OxjlUfner9jjMxre1T8MSRAfFopz2D+6184VI1cgtGgw3bk7aOxlLteR25jE2I3X+oMrXl1PMv3yLlo4RcTkkGUS8ymyUOGW+2AuqICGFKWSgQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7po89DX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7po89DX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so9706415e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789835848; x=1790440648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOKiZqPgxxYdzu3lGhozAU5+HVbqGefdej+WIN436I4=;
        b=M7po89DXsIQdpCTpGFKiI9VOQX0n99h5Pl0WtVzBNBJ8kX9gwQML70Fo6ZlZzEhUiY
         De8EyJyZoS7SPtYd2DU3ycGLYNvtgK43JnBKjKoOA/JjJhrQaWuZMP9Lj9BcVfifaXh0
         bYri5UITK8DBtZWf1FY+0uobz/unwDQpYnaNYZQTnWQB/+cW8ljQlIhW++KHSzgkM8Dx
         yvzAMIXQ7UlmZ83Yv7KpgfidUtI8PeXgRc07FW75YlgOWG3cB4Q1xRkRmsqhRolShOQj
         Y0uj6j6RvFRIGoXqV4tWWwmsyYemFHlqJHEWqSRn6DRTUcz+GbpMuFUc8OBwk4U5LNC+
         Oflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835848; x=1790440648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOKiZqPgxxYdzu3lGhozAU5+HVbqGefdej+WIN436I4=;
        b=YG8criu8UyxeMHbCLDaoBQuS8EqvNjiJWhPQnyBXHRvjKhgf0uvEGIZMhaqWcivUpe
         EXmUYtF+/7/CI1wbX7FaRgPgCvgo+gH6CWGTZNvKQc5e8CALYMeeSMSnIoG0cZ1RT/ZZ
         nCSv58AveRyXiTT9vTIOOfYwh22v7hlZl3P3vFeQNe+fdP8Z/m0jLiBjCamRAkvPf5xD
         u2uTCSCPVkCxbWUfTqzonc7vbPYbMtWVifP4UyQgxcwjn1eKHjcnskXJ9I26kqV40MeI
         YXz5wH/hysGc150OCdvSlJNRRVo+Ed1IGw+EBuk2l+UOLzNUMSoeXrkMd1lh5awrhSP/
         GOpg==
X-Forwarded-Encrypted: i=1; AKwUvByoq/p2L7/lSMfW0r+gyrR/uh2u6VrLQ0Y7FIsvHS5mZ8dI9SHqXG89ougpmUlyiH9oHeMFW5vxhB/2ygI=@vger.kernel.org
X-Gm-Message-State: AFuF++kElamZQ4pDcvRxHnggR8xZq1XPuUeGWSD6T/fTFeEYcy1XoX7/
	FqHlkVzvOvy/eHg2OGhjYI1ghfPzf4dNDT4RKSaChoHDqyuFF6Uc1cXN
X-Gm-Gg: AYBFou2YWK01orKQWpFwujE3hb41yyh5Z7NZXkFzFxHClRwlgYL6Ki5QW6DI3R6Gbbl
	kpsdIYGyVKvgDRzRI6cZVPfDddTJQKD78WHma74YMzj/BUI0wf414jxr3as4oqS/X3hwqqJyqcm
	MS3MavsOy8FKIMLpWTG3Die79DBbBAs4gyjv5cFeYGKZx2OkRln0GDluX3h8b1NRgSrGJUVvesJ
	7Zd593zPyn7GeiTFm1k44YM2Kpi9CDXOLPRHWbrN5JY3gSGJU83+TtZzBPRRotPd5VeS2NTf95i
	mC32F6BKdhNom11JXf519sgfKg97Wr+V+ZwQBXYCHTE4aUTRePb7z5cHsY5f/8PSLgoBsYMdwDD
	kzVN2knXMBDPjtmjwxlU9xxKTLSOf+8MUCyXRKL/0SP3Qad4jUIUdZagGgJLPeqVJfDiN0wRmWB
	hybWBCqs6Xqt83I71XF0C5fcQb5CMVtCifbX1yzw2r8twfU8+meCakOEBb99n9wIrfB0m4QxUHY
	UUEA+dFZol1SL0ZnlK+MmMm0yJB4BPy/rYIiDhmeoIz4eXjfPNtOU8SbbsF2cJESPycI1BDrCDF
	fMsiLL2wg+TxcK8b/JoyLOEX7mTWzEeNRiEPFPayGBzE5XyTHQTM9B4gzJFeywg2/ARSCdUSLeF
	4yXKNGcyCEPDbSePfjwqWAofS8A==
X-Received: by 2002:a05:600c:1c01:b0:49c:fc6e:a3d7 with SMTP id 5b1f17b1804b1-49fc5753eb2mr101364825e9.22.1789835847588;
        Sat, 19 Sep 2026 09:37:27 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872442263fsm8155986f8f.1.2026.09.19.09.37.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 09:37:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: ti: k3-ringacc: Correct ring API kernel-doc
Date: Sat, 19 Sep 2026 18:37:20 +0200
Message-Id: <20260919163721.89044-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ring accelerator header labels k3_ring_cfg as an enum, uses
propname instead of property, and gives the DMA reset helper the
ordinary reset helper's name. The DMA reset comment also omits occ,
including the convention that zero requests a hardware occupancy read.

The proxy flag is parsed as a separate parameter, and the pop helpers
describe pushing elements. Proxy access is supported in Message mode;
the listed Credentials and Queue modes are not implemented. The phandle
lookup returns encoded error pointers rather than integer error values.

Match the declarations and document these argument and operation roles.

Fixes: 3277e8aa2504 ("soc: ti: k3: add navss ringacc driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/soc/ti/k3-ringacc.h | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b92598..2de6031b9424 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -57,13 +57,13 @@ struct k3_ringacc;
 struct k3_ring;
 
 /**
- * enum k3_ring_cfg - RA ring configuration structure
+ * struct k3_ring_cfg - RA ring configuration structure
  *
  * @size: Ring size, number of elements
  * @elm_size: Ring element size
  * @mode: Ring operational mode
  * @flags: Ring configuration flags. Possible values:
- *	 @K3_RINGACC_RING_SHARED: when set allows to request the same ring
+ *	 %K3_RINGACC_RING_SHARED: when set allows to request the same ring
  *	 few times. It's usable when the same ring is used as Free Host PD ring
  *	 for different flows, for example.
  *	 Note: Locking should be done by consumer if required
@@ -88,11 +88,10 @@ struct k3_ring_cfg {
 /**
  * of_k3_ringacc_get_by_phandle - find a RA by phandle property
  * @np: device node
- * @propname: property name containing phandle on RA node
+ * @property: property name containing phandle on RA node
  *
- * Returns pointer on the RA - struct k3_ringacc
- * or -ENODEV if not found,
- * or -EPROBE_DEFER if not yet registered
+ * Return: Pointer to the RA, or ERR_PTR(-ENODEV) if the phandle cannot
+ * be resolved, or ERR_PTR(-EPROBE_DEFER) if the RA is not yet registered.
  */
 struct k3_ringacc *of_k3_ringacc_get_by_phandle(struct device_node *np,
 						const char *property);
@@ -103,10 +102,8 @@ struct k3_ringacc *of_k3_ringacc_get_by_phandle(struct device_node *np,
  * k3_ringacc_request_ring - request ring from ringacc
  * @ringacc: pointer on ringacc
  * @id: ring id or K3_RINGACC_RING_ID_ANY for any general purpose ring
- * @flags:
- *	@K3_RINGACC_RING_USE_PROXY: if set - proxy will be allocated and
- *		used to access ring memory. Sopported only for rings in
- *		Message/Credentials/Queue mode.
+ * @flags: Set %K3_RINGACC_RING_USE_PROXY to allocate a proxy for
+ *	accessing ring memory in Message mode.
  *
  * Returns pointer on the Ring - struct k3_ring
  * or NULL in case of failure.
@@ -126,8 +123,9 @@ int k3_ringacc_request_rings_pair(struct k3_ringacc *ringacc,
  */
 void k3_ringacc_ring_reset(struct k3_ring *ring);
 /**
- * k3_ringacc_ring_reset - ring reset for DMA rings
+ * k3_ringacc_ring_reset_dma - ring reset for DMA rings
  * @ring: pointer on Ring
+ * @occ: occupancy used by the DMA reset quirk, or zero to read it from hardware
  *
  * Resets ring internal state ((hw)occ, (hw)idx). Should be used for rings
  * which are read by K3 UDMA, like TX or Free Host PD rings.
@@ -217,8 +215,8 @@ int k3_ringacc_ring_push(struct k3_ring *ring, void *elem);
  * @ring: pointer on ring
  * @elem: pointer on ring element buffer
  *
- * Push one ring element from the ring head. Size of the ring element is
- * determined by ring configuration &struct k3_ring_cfg elm_size..
+ * Pop one ring element from the ring head. Size of the ring element is
+ * determined by ring configuration &struct k3_ring_cfg elm_size.
  *
  * Returns 0 on success, errno otherwise.
  */
@@ -242,7 +240,7 @@ int k3_ringacc_ring_push_head(struct k3_ring *ring, void *elem);
  * @ring: pointer on ring
  * @elem: pointer on ring element buffer
  *
- * Push one ring element from the ring tail. Size of the ring element is
+ * Pop one ring element from the ring tail. Size of the ring element is
  * determined by ring configuration &struct k3_ring_cfg elm_size.
  *
  * Returns 0 on success, errno otherwise.

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)


