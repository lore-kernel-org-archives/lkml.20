Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A303E3163
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700153; cv=none; b=k1wg6euWAeXtLuX8bqiRO4QKEGsrpjZEPU3suh/M28y8wuuuKCWAQ9sDoATrcxOVjgFYfQ0ibNV8hGAgyInoOXjb6Z7N+bnypDoesijEiSXb6ShU8CQgbmm9+6k7s+U4va1XZM/Wwx1XFDOruxpdTRVqf0uQFlBCKazK8nE74fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700153; c=relaxed/simple;
	bh=UYl7GG29pVoxbjANdthqYJc7xSCew3lqNnW++pmlefw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uh598z6EaJCGVYk+B6JsQugE4oQoJBiAK1aafPMcWT2XdnXiG9H6F4r4+pfLWyGQlJxbd7c98HHD7d350p37oPV5SnxenPCJ/LVRDoWl3Yr+KhRoHIALy4/fmFCtzmokTTDIyvSRSs9QpxI+01jJEilVBdoSanthkP76M3355S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwvqkccl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwvqkccl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso6383475e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700150; x=1792304950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5wr4Yem6D2zrv5o4x8ilebf1uR28mL2hG9tF4MSATs=;
        b=pwvqkcclTAzCPwiuXeW6VBwKbpT4EcCjWX/dOt+BBUXUO91LXtC3aeGQnaMRo8wFod
         i41WaC6ikbkSQ210zOAn5dlVSeXTv2HRLbHauvohl8matEEXLlCzVeSSmvMX684nNZjl
         CxiaVfKeJ2Z8g/LNKnWZ9TQYA1PLDYuu+x3fh6FJAz8RIakTQN5NYXyCaGUazX8VCUjr
         MzMym/1/AkMh/cp1cbDg0CtYTSmd7Pbi377SSHOmj2S8D8kPpwmRscUz0l7T8fiCaUuZ
         Cd4GA6tiYzBXBKrtpmDrtiaUtTYCOmO9a+GlSE+tKRwIyVHqG6Y5ANh1DI8hspkDyFLB
         jhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700150; x=1792304950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5wr4Yem6D2zrv5o4x8ilebf1uR28mL2hG9tF4MSATs=;
        b=qpH5qW16z1T7plhy5z+s8Vzrw9TyQ1TFfNNj8jOenyMjTO8qMPJo3K2Kt2vi4VCl8M
         ZwyTllkGAgr9JQTtIS0A8I73GpLhQIrTajNXiwOG6Q64iyyLyuzQPS2VZIF8tXLlTmXY
         2Gbq/9L8WIqy+mhhW8qPLHpOGHQmeAjYA095PyFFN4CeAZ+lHKezTXWbxBv4qUi6RvxB
         rdwST1wrIElxnDNhpMHPqbcKN3bUMu9igDLR2V86atQAfWo6KCSz7c1W4okwqWep3pE9
         URmdIK3oGhfPB0NPDoztKh/gXMof60yO+aX9OYrDNG8RgcAzuuhdr+LWnE5QbIbOhI+V
         aCjw==
X-Forwarded-Encrypted: i=1; AKwUvBw9tx3cNR80RZH+ym3NlFZIHIEW+1DhMta8c/1j72CKF7WhlHnmcmlXdOVUj9jHTTkqQ/406bknQ/t1z/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqKWhgfPbGR/SBWMYxY/JjYAgbNNSSxTYcRaEKmvy3EKcB9FJx
	Fw1t8c8b/6wdS83AkYacwGVpNHp3CpY6YfXX6tAXu4g7Z1qyXBzZhBTr
X-Gm-Gg: AYBFou2wPrSTcaDpjodS6GYtig6qL427bgCmHVjxY+63WNLrlkg7X4kaJcWNznm0iJI
	KX4tRaFMJYY3iwfHqBuSzcIrumfGTzd+d7368NshebET1DjE+AenFR98m71kRkyHCUioZTFDQfK
	TQ/jqHUWRku/aAt6xovCI24bxaaFVJvCNrA01Gq+5Cuk5/IngLuUmmrGpcA/v0eI/y9dpH3w/uA
	vS7I7ltzkXumi7LA17FEAUZX3Ppmnhx2lMkUoGPiXhPOCUvdKA2BAnFh0gbLQiQlDJRzgahpA45
	jQ14Mpccl7AeaDAtLk1Ka6sy4MmOPywQr6YRLIh4NgeP3ew/X336GjaHQYavLeRK12Me7PKt9n3
	n16kA0fhquJcF6P5+X9JgPuCo++r3mdlBatNFUHm3V1fI4zII/zjk/YzEjE05UQZ3rWRpaA0Gwu
	2FxNXXhkiKCXRwfcJCsBejo1dbES76CwkgevFoeQ9L2NpY9KGz3M2wdxHBS+JnSqBEu/F+1Qd9r
	mgrjrQMyXHIncHacx4XdKJvtRG+m5ehcMFBCD6WQ4y8Pk/5MwHxHVHQFHwlQLJpSCQEF61z0EQ8
	qTA7JavygaGA4Urj
X-Received: by 2002:a05:600c:34d0:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a18e47aceamr119132065e9.7.1791700150312;
        Sat, 10 Oct 2026 23:29:10 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:10 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/3] mtd: maps: only point() maps read through the simple accessors
Date: Sun, 11 Oct 2026 06:29:06 +0000
Message-ID: <20261011062908.2365879-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011062908.2365879-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261011062908.2365879-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_is_linear() only checks that a map has a physical address. Map
drivers that install their own accessors keep one, and a pointer
bypasses whatever those accessors do:

- physmap's IXP4xx support: the expansion bus only takes 16-bit
  accesses (the reason it cannot use memcpy_fromio()), and on
  little-endian kernels every access also flips address bit 1 and
  swaps bytes;
- physmap's Gemini support enables the flash pins only inside its
  accessors;
- lantiq-flash serializes the external bus against PCI and copies byte
  by byte because the EBU cannot take a prefetching memcpy;
- cobalt-flash reads at an offset inside a PCI BAR while leaving phys 0.

cfi_cmdset_0001 hands such pointers to jffs2 today, and the IXP4xx
boards carry Intel StrataFlash. Add map_is_simple(), true when the map
reads through the simple accessors (always true without
CONFIG_MTD_COMPLEX_MAPPINGS, where the accessors are inline), and
require it before enabling point(). Maps with custom accessors fall
back to copying through them; on big-endian IXP4xx, where pointed reads
happened to work, jffs2 mounts get slower.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Fixes: 2aba2f2a704d ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
v3: Assisted-by in the documented form.
v2: no change.

 drivers/mtd/chips/cfi_cmdset_0001.c |  2 +-
 drivers/mtd/maps/map_funcs.c        | 12 ++++++++++++
 include/linux/mtd/map.h             |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index b73596a..3f3364c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -299,7 +299,7 @@ static void fixup_LH28F640BF(struct mtd_info *mtd)
 static void fixup_use_point(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
-	if (!mtd->_point && map_is_linear(map)) {
+	if (!mtd->_point && map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point   = cfi_intelext_point;
 		mtd->_unpoint = cfi_intelext_unpoint;
 	}
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index 1a4add9..ccf1dbf 100644
--- a/drivers/mtd/maps/map_funcs.c
+++ b/drivers/mtd/maps/map_funcs.c
@@ -41,5 +41,17 @@ void simple_map_init(struct map_info *map)
 }
 
 EXPORT_SYMBOL(simple_map_init);
+
+/*
+ * True when every access goes through the simple accessors, so a reader
+ * may use map->virt directly; a map with its own accessors (byte swaps,
+ * bus locking, address fixups) must not be pointed at.
+ */
+bool map_is_simple(struct map_info *map)
+{
+	return map->read == simple_map_read &&
+	       map->copy_from == simple_map_copy_from;
+}
+EXPORT_SYMBOL(map_is_simple);
 MODULE_DESCRIPTION("Out-of-line map I/O");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 75b0b2a..ebee3fe 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -449,6 +449,7 @@ static inline void inline_map_copy_to(struct map_info *map, unsigned long to, co
 #define map_copy_to(map, to, from, len) (map)->copy_to(map, to, from, len)
 
 extern void simple_map_init(struct map_info *);
+bool map_is_simple(struct map_info *map);
 #define map_is_linear(map) (map->phys != NO_XIP)
 
 #else
@@ -460,6 +461,7 @@ extern void simple_map_init(struct map_info *);
 
 #define simple_map_init(map) BUG_ON(!map_bankwidth_supported((map)->bankwidth))
 #define map_is_linear(map) ({ (void)(map); 1; })
+#define map_is_simple(map) ({ (void)(map); 1; })
 
 #endif /* !CONFIG_MTD_COMPLEX_MAPPINGS */
 
-- 
2.53.0

