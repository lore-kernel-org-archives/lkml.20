Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793211482;
	b=E2pKLfGLf3IphuoC6rBRjoN7CF2pWA81V6YA4sxpPtl94ppeXCsztt2galcipJu3edUW
	 VQH5IX43Zm+3rMZcUYGc3TsoqnZyHKab6WNxabDp/gtmfDowGHYFJZVPIexWwpCjf4QhF
	 uu9c5WHiL1QwCRiiqlUWH/teO1IrJTnZybXdIQWI833qkDWXBd7n98wPopvXNt2H8poa4
	 Ista8OWjC8H4GM4kX4KE33DwiLOFdvnvEsIT+9aBPzu9bHuwg5RinlNyrt8SdI34Xcdho
	 6C68JLSvW4vK7mULCHyEqTbDrWmSHCqGmM5Ws1ymHjt9o7g6vjrS7LwacKgM93bjdaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nb1GL7vyuk4wRsFBzPO4BunddjtAlFmqxmKJhxlenVk=;
	b=CWv/ctAmDQa0ziTKqhRXMwOCAKLm+31iqf7hbfmfZpGBu3r338cfI0kdc9NIH1DUFBY9
	 bcJJ61SFmh9qO81XYNk2B5ZF6nwB/IXJaMC7PN38ah9Eem9agjshaFtQh0y5i5YgTPxMv
	 CC/Av27Fu/JnEoKh/ITWNxXome6/+S9EPB2b67sjSGeCTEClsOINlDfcPQleoePIMNcfn
	 yWikFZFgh72AfhoSWIt/ESy658BYIQm9luL00tf3cgeT4RugeMLvEj+iUvaASh308iNx2
	 qG7ofCkoROnTkYoPmtsgs4I6DII9ygjacCk/LmTqwUJL/M2817jmFwdKeDMVKDTFjOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ImiggEzz;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E270606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E270606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ImiggEzz
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so2332966c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211481; x=1793816281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nb1GL7vyuk4wRsFBzPO4BunddjtAlFmqxmKJhxlenVk=;
        b=ImiggEzzD5JTc7iM9iw0b1H1AR46v9uOSW3+27hSXXar4QF0Tu4z5ufm7jLhaJcep0
         XoSxroyZjtoB8mC6lpib7j1vsOnTyZKfjCTOpAJvIwJo0U8SR6KSwD+z0RStxA3PBX+c
         9WnqrtBsyoy3ov57hsdu2z0wydsnjqfMfc6nIknMOnT4eG07mV6lwqUIuhSKoQpJahOU
         HR5TH4eAVXfLc3zUnlaGiJWL+Zbdy0WjbZYY4gHRVLYp8+H5FiA726GY9M/07AcVOQ8U
         h/P3FDOArUMS1lG7yrSSQCEPfj+NIqMvF8MTIjL98QiBW4I6eZMBfy666i9llm60eFh0
         ylZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211481; x=1793816281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nb1GL7vyuk4wRsFBzPO4BunddjtAlFmqxmKJhxlenVk=;
        b=B4FAu1U7GfNgkv8GD5qfZICBAZ/ofL3tUvIoJ8WVZpTJd0vz06valzWqaxA7FOBpj2
         1U/i75HbCBNjIlWu8krh5TnLBBMJp/d8tyMfOEtsBksYbU3uTHdnpmv6TtrfaeVygEjb
         2Ex/H0eRPDnpOrunMsUXyDb4mwceJVR3Nl0bF+MFF3SPhHxYnlrr6OcKjTA3kVOeAGVs
         Ra7k5y/5vpvQqXXsQfqp9SLOqfUUQzYSXELx0tGtym/s3i+80Q4HDztX2kDW8asSyXWR
         LK4CGgT69d8ug7pUaGfCVA4XByQROaT3YU4UkgWwh+Qb3qHVqry9UOle15XuGY7OhuV7
         JKdg==
X-Forwarded-Encrypted: i=1; AKwUvBxgcuzhUnFqH/x/i7v2kWKJ30t0acd9cDc4wt6t1wp0Jj9tCoK1eSoQDadE2DD8kSc3Mk7NNhsHrtXUPL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsIlXvQGj4DjUt0KoUrBc3bauQMg9wXFCwraurJ3YMsj1YSaQ9
	tLw4kt8ACMnGv2tuBaG0dMBUA5lA3ZfiGr9BQ0Ki0JHd9BgPD4VsrZ8O
X-Gm-Gg: AYBFou1LOzSUXUcRlpFdDUK952e7oiFHbQCX1ZXPjYiYq1nxZHOfFI00MwWxJhD5/5P
	p89zcA3b4MVw4zdX8yi7bbf9qmre8nRd/2aJJi7xtRDvI663PHrcRHz/uzKRrye4ep6jm38r/NZ
	/WPidf6I1DowJrasmAcqEP85w8apLNQcLpAxY5YhBO6XY6P2eG26CTlQDjFu64qKc3E+C0KJR4v
	+8blY4BPfENgn2uHY8Y8lRWWx3WNPuhYngIup/zjqJwd0JozgSEktjLe4QHTJ6DuePraYa4lfpy
	+agN2IO6O4HFYEeJTtZVKxuZW0Vtefw3rOBrkzu9w+MQuwBtZt4Q/Q9ncwIH93l+2GHtbVCeKDP
	t/GMla257br4DbtxvC59enTXJgjSyHVZ9BSXw91PRT9LHtfFh4t2lGbuPm/N8Jik/Xg2ZJgUVRY
	h7/KP2U7jwnR3B1e3ZKn/QaPrE0z9Sh52DfAXDK4lvVpkK0jQ/EymvGKlG8gWPmRkGbTP+0Sc1l
	apG24d1tN0OdDwAoVmvIFLk+Edg9O6U1IoUnlAjqS2GE6i6EVAEAZB/z28UvMPfGvLiLnoMNkDR
	XAcaxIY01BKpnpTxH3wBbF9Q7SrVjYwO74icAgskmtCLWpf+XnlVVqSMmZXsWdydv5UJjgTbAxD
	UOMe5KJfiPJBHbGlw
X-Received: by 2002:a05:7022:ed07:b0:144:de98:eec1 with SMTP id a92af1059eb24-1a6cc90e818mr4693122c88.11.1793211481229;
        Wed, 28 Oct 2026 11:18:01 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75fdc1031sm7441623c88.19.2026.10.28.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:18:00 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: dsi: Serialize register writes through the DMA workaround
Date: Wed, 28 Oct 2026 11:17:17 -0700
Message-ID: <20261028181720.3476629-1-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DSI1 on BCM2835/6/7 cannot take register writes from the ARM, so
dsi_dma_workaround_write() stores the value in the single coherent
buffer reg_dma_mem and has the DMA engine copy it to the register.
Nothing serializes these writes. The threaded interrupt handler writes
INT_STAT through the same buffer while process context may be
programming the block (in a transfer, in its timeout path or in the
bridge callbacks), so one write can overwrite the buffer before the DMA
of the other has run, and the wrong value lands in a register.

Take a mutex around the buffer write and the DMA. The writes already
sleep, which is why the handler runs in a thread on this port.

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---
Sashiko pointed this out in its review of my vc4 DSI series [1]. The
race is older than the series and not limited to its timeout path, so
I am sending the fix on its own. It applies to drm-misc-next and on top
of the series.

Compile-tested only (arm64 defconfig, DRM_VC4=m, W=1); I have no
BCM2835/6/7 board with a DSI1 panel to run it on.

[1] https://sashiko.dev/#/patchset/20261028164539.3471833-1-henryzhang62@gmail.com?part=5

 drivers/gpu/drm/vc4/vc4_dsi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 5ed3c35ee..b81b46829 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -25,6 +25,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/io.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -562,6 +563,11 @@ struct vc4_dsi {
 	struct dma_chan *reg_dma_chan;
 	dma_addr_t reg_dma_paddr;
 	u32 *reg_dma_mem;
+	/*
+	 * Serializes the register writes through the DMA workaround, which
+	 * all share the single reg_dma_mem buffer.
+	 */
+	struct mutex reg_dma_lock;
 	dma_addr_t reg_paddr;
 
 	const struct vc4_dsi_variant *variant;
@@ -625,6 +631,8 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
 		return;
 	}
 
+	guard(mutex)(&dsi->reg_dma_lock);
+
 	*dsi->reg_dma_mem = val;
 
 	tx = chan->device->device_prep_dma_memcpy(chan,
@@ -1667,6 +1675,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (dsi->variant->broken_axi_workaround) {
 		dma_cap_mask_t dma_mask;
 
+		ret = devm_mutex_init(dev, &dsi->reg_dma_lock);
+		if (ret)
+			return ret;
+
 		dsi->reg_dma_mem = dma_alloc_coherent(dev, 4,
 						      &dsi->reg_dma_paddr,
 						      GFP_KERNEL);
-- 
2.47.3

