Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793169084;
	b=hFIB5TuBa9gnstgWHjutFZeYCWvwGQ3UU3rU0N5IMSvda4EYXvCtJkaDFqH9P7jPmbn2
	 Ocfeq5ce71ngKvj07kqAs05WcQtdHpUGkNFZ8eEamPzLBVHr4HenyVZUZ3/r+uhXk1IKv
	 CHTajWi68n7/efq2V35fechpZEq+uxcl3cj9VKh5pjT6FGoYyBybiCf472Nbg9lEpIO/U
	 P9c++OuX8PafV98xqfTzCQe+zw5GPFRb/hEEkK2mUujl63uFjKwPSuM04LFwb/7xSKmNU
	 kFzoK3f6xzeAJh/h7MzKP9zv6FsRlx8+KmZ98iH8pwiSEBFRtBZp6boG0KZai0qJ+RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3dFp6dAOAu7Xg/ts0JYrW0yPrRy8M8WoTAB19r+Hv4=;
	b=QqtZlh1tJDF97IbeBMF5YN53crKJF5w+S/bnnv0H3dh2uKrTMP5doHAphSlxxvtf+yWo
	 s+Q07cuVbVGFiKdQSUyDMx+32x8jp8HsFUu2FZ07s4ELjQUjuiMVYazSeg48oGB/gcPKN
	 Oo3OFGrm2pR+oO+VNiSJH9C8dn/wm4nj/DDt7WCiNutKV2zp2qF7PoXHu2OAK2QgIyXQj
	 WDvuecA4BDl6rYVzqJCTfetLAWBjxkaBTmGgejuUE65U0Tp9rGpRuYugIqeqFA40nF0as
	 rLDzt12RqWhWLfGgbQusYCRRoyVgIQ8lX1JuNqbxPs6KHS+ojgv7Pr5l3ZzVpe0RKUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RBvZHbhp;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RBvZHbhp
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9ae391a05so4012365ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793169083; x=1793773883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3dFp6dAOAu7Xg/ts0JYrW0yPrRy8M8WoTAB19r+Hv4=;
        b=RBvZHbhpglz1zfGWofuFOYIC/vyGHcP+TQKBU5Icx67wWlI81srvJL5AwOVT+w1hP9
         NR13P0gQPRJ7SlJUsGPnF0BX7u6+35bE0K8P1ZsZb6Rp6yiwVUwbMKld8k98PNXAWDdu
         w9VILIM+SEZQJT2XEwm0tTsP64Vz7nEk5/QfqBzaDGUFSozsl67J9x66wsiaG3TlQG6a
         5VUGYFQwAB6RT9YhjwUA90ygxE/3cMWAmpkOZM3ki5uCWCC7wpdy4rYdP0XecSLtFiqZ
         C0WoG7DYZ0nFKBPxucVBXrWGuEPE8q09ZG1Z525EMKAbivWC5n+IXNpU4pT750psxGma
         sXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793169083; x=1793773883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3dFp6dAOAu7Xg/ts0JYrW0yPrRy8M8WoTAB19r+Hv4=;
        b=S+sjlLaxO3U77BCJMW9iE0GzIdL8QKcQQmn6YKMmXwYFEeDyoTii/7Q+EV/Yy2uDaD
         qSYH77Fb2+edfBWYxhNTG6nsn8XsBVi5/8SeIdaXrVzYLufo2DyPkp9e8TWHxcLehZJX
         hkxHEpn1P6xtbCKFd0Th5HDFZUfoqDz7BsZilMHH4VeD92XD02/0r03yxEuUXfCQCwvF
         5AJGumSQbC5VpRS9/ZOplgN7ZTccmYvSGYvlljzomYgBaJLAS+p2Y3xO144X69e+URTy
         cjyiG/ePcpHMN2eIoUpQSCFbwBKAnxcP7mJRiozIh7GGUstpuF+hd9Vp28ovn5dj/hRz
         0oAg==
X-Forwarded-Encrypted: i=1; AKwUvByDGU0WucidT+PmPfWLLD4v59/zmrVK+QolhvxxEtTJEqxJhxCmz6uGAMLJq6AUjSWrvmaTYVT5H8Nvq7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+lkxS4nMdfWoaWpFz1FogxSGGQ4IRZt9gBE0lmpWCcE7EHSqj
	wGXKESkrmeZs5PO0aHQFncmKbDLHFHduJdFXuEQpqd3ewQgvrDhug/nb
X-Gm-Gg: AYBFou2OipE1xVMrux3yjcbySPol+2MzoD9Thw7bB3uZn5pqu6AtRJ8psdC0zx1Gbn6
	+6BjeSjp7lotZADvgGbMT85FOHe3bGnkjGjiV3oyL3XjUVp17k2FThIRRwD79X5sTzyR1bnWLYQ
	tBkxyooyg+PVQAgFQIU5oWq53mT67RKv3vgMpreB3gVB14M5jLUhTGe683o7SdvSw/uu0Ld/kj+
	QPLhOD2SzfG7JQ0SCGbl1XiJTVaLu9Otvmpn1AMajnjSfCfNpWuQP8OPb6efPMQ/nRI/9MaB4lx
	28dd+SVaj4pgT/EB/lkdkGUHhBgZ15QstcrqPS/Xy6a6yWhOYiaSeJIZeMe/o7jUgtZ/J8D5+9a
	7Z2Ay2wjCk+Pptp+y2xD1j3Um/EO+sx+ksrMJZh4QVzOzN0GKf+Yg1LXXsGDp6ds9AQljvBB7nB
	nnOgxRsycmOnGpNE/zA4V2+sJp+bEFm6VXGIvTiEC5AQmHiYn34W/sQP+Lpgasm7+xF6FiMEzfP
	MbELvp7x6GhNE58C6TLVqEtcJ3GwF5nz1hWN0TbYNmBm3Z1kAu+zItq9PPm4dyzkAGPO1Sr8p0h
	5MeC1dLA/fHZC99/040U3AAC8AhDxEsYVsqxNmz3lKHRfVtD6xbvY+5OrtGVO3FVTmuzjmMgSc1
	ZSh0alpFECXw+wkIHVQj1qjjCkfRbuXUlaiVIbCnnzbfvB7qZ5v/m4Qv8bLgWwNw3rZujWO9Peo
	AXqA==
X-Received: by 2002:a17:902:d987:b0:2df:375f:b7ee with SMTP id d9443c01a7336-2eb07437f02mr2842875ad.18.1793169083083;
        Tue, 27 Oct 2026 23:31:23 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be1d0esm17208265ad.40.2026.10.27.23.31.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 23:31:22 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH v2] nvmem: core: balance the layout module ref in nvmem_cell_get_from_lookup()
Date: Wed, 28 Oct 2026 16:31:05 +1000
Message-ID: <20261028063105.11742-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026125709.73500-1-yuz08559@gmail.com>
References: <20261026125709.73500-1-yuz08559@gmail.com>
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

nvmem_cell_put() unconditionally calls nvmem_layout_module_put(), which
does module_put() on the layout driver module when nvmem->layout is set.
of_nvmem_cell_get() balances that with nvmem_layout_module_get_optional(),
but nvmem_cell_get_from_lookup() - the non-DT lookup-table path - does
not take the reference.

A consumer that resolves a cell of a layout-backed nvmem device through a
cell lookup table therefore drops a layout-module reference it never
took. That underflows the layout driver's module refcount and can let the
module be unloaded while still referenced.

Take the layout module reference on the lookup path as well, releasing it
on the error paths, mirroring of_nvmem_cell_get().

Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
v2: nvmem_layout_module_get_optional() was defined inside the
    CONFIG_OF block, but the new call site in
    nvmem_cell_get_from_lookup() is compiled unconditionally, so v1
    broke the build on CONFIG_OF=n ("used but never defined",
    reported by the kernel test robot). Move the helper out of the
    CONFIG_OF block, next to its already-unconditional sibling
    nvmem_layout_module_put(); it references no OF-specific symbols.
    The v1 fix itself is unchanged.
    Closes: https://lore.kernel.org/oe-kbuild-all/202610271703.wiO2VfuK-lkp@intel.com/
    Closes: https://lore.kernel.org/oe-kbuild-all/202610271602.GRxskiKw-lkp@intel.com/

 drivers/nvmem/core.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8..fc26e2c 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1324,6 +1324,9 @@ static struct nvmem_cell *nvmem_create_cell(struct nvmem_cell_entry *entry,
 	return cell;
 }
 
+static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem);
+static void nvmem_layout_module_put(struct nvmem_device *nvmem);
+
 static struct nvmem_cell *
 nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 {
@@ -1350,15 +1353,24 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 				/* Provider may not be registered yet. */
 				return ERR_CAST(nvmem);
 
+			if (nvmem_layout_module_get_optional(nvmem)) {
+				nvmem_device_put(nvmem);
+				cell = ERR_PTR(-EPROBE_DEFER);
+				break;
+			}
+
 			cell_entry = nvmem_find_cell_entry_by_name(nvmem,
 								   lookup->cell_name);
 			if (!cell_entry) {
+				nvmem_layout_module_put(nvmem);
 				nvmem_device_put(nvmem);
 				cell = ERR_PTR(-ENOENT);
 			} else {
 				cell = nvmem_create_cell(cell_entry, con_id, 0);
-				if (IS_ERR(cell))
+				if (IS_ERR(cell)) {
+					nvmem_layout_module_put(nvmem);
 					nvmem_device_put(nvmem);
+				}
 			}
 			break;
 		}
@@ -1373,6 +1385,18 @@ static void nvmem_layout_module_put(struct nvmem_device *nvmem)
 		module_put(nvmem->layout->dev.driver->owner);
 }
 
+static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem)
+{
+	if (!nvmem->layout)
+		return 0;
+
+	if (!nvmem->layout->dev.driver ||
+	    !try_module_get(nvmem->layout->dev.driver->owner))
+		return -EPROBE_DEFER;
+
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_OF)
 static struct nvmem_cell_entry *
 nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np)
@@ -1389,18 +1413,6 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
 	return NULL;
 }
 
-static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem)
-{
-	if (!nvmem->layout)
-		return 0;
-
-	if (!nvmem->layout->dev.driver ||
-	    !try_module_get(nvmem->layout->dev.driver->owner))
-		return -EPROBE_DEFER;
-
-	return 0;
-}
-
 /**
  * of_nvmem_cell_get() - Get a nvmem cell from given device node and cell id
  *
-- 
2.55.0

