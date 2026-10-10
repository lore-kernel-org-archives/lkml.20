Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F418369D5E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655729; cv=none; b=Yf7VT+XrI8mwau0ZJtwsDUe0BI1R4APYslTFN4wC/CLbQnDD1YZZ+2PJUqDrXA29NICr7lFicp+5QESE/FKCFu8bmm/hvXBUSu2eMpkoL24wyoD5VZDtpwu6yRY4CBL3TUA91Zhd1Dui9xvvrLcBX8a3yyXaAVpybA3nA91JWFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655729; c=relaxed/simple;
	bh=oL1tj+JddJbZs+8aPd84rdl67gDVa6MHL6kZr25xpxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+AM9lrgCDDzQDN8kyBofcGm/wBNJkGDSRD/HYqPvHPoFw31xsOh8+43hXsPie4T64IJ06D9767qR+M/VTHXe1J8vjvhGQJLhaoREaD+V2bYvHiD1UrKIbasRMs9vNpGjfJVBucE+v+l/0lHRtAB2vufSQeCn3o8wOkAmT2FLNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iofdCH/H; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iofdCH/H"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afe75f055so650055f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655727; x=1792260527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcqIx5ZHTyVbwnT9JsODmu7/jC4GQuUPl3/Y3jt0FjA=;
        b=iofdCH/HUMXQnJOxcNISjjRKTHpW29ZGoY7UD54wHkq1QlDyfMr70yeEbUWfghhN1m
         V+OyngEWcXKVSSUa2v//HG4kQ/Il3TqXY0bI1GlHUXm77cA9naglRtneyKQse8aXv82K
         QxhX0XANp58IERFWEtpIHmj+U/rQ7qXriLw4xinNDH81uOak7ed9iItlbFPywc7qt6XW
         4FBgF0c084bQ2HwWmpM/U78ECVdGi9BmVuORQI6JUEiN7dE3Z+3Yes+KPZio9Hsjm0Fw
         XFa9nvEkl0E7d2zlpdqAdpyHfdLP39KPxDVNaYX4mk3LDQGQeosuw4fm3OMBNYqVjAx7
         rC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655727; x=1792260527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcqIx5ZHTyVbwnT9JsODmu7/jC4GQuUPl3/Y3jt0FjA=;
        b=gv2CiIqJA7FX9j7O8RotFZVpGDrYug1xe6y5mvgSbRQCSmtqa2zoT/Ang6A+SrmzuP
         DGHVpzRgKbfnMl5T1mBhqklkiBOXPyO23pl4nDEjhUAVw1EiO+1WsITZfDyeYnKKjuVi
         6tRUiYb/c4lYWhQ9B+agrF19Rcturd+sGmKH3K28nkWkPzJFcOXZRM0FWet7GoXi2MPU
         +T3xgGlhWYmbmWbY+upDSaLoNooDQpy/BKqmkqnAfVSWtMiGrAS0eGgf2s/gmczc/OBE
         ndlru80KMxrWq+OnyiXNxURwLl+jVJyrwpOsINm0oJLbZtZzFXaM6sF/rJ+VX+iKDkVQ
         8igA==
X-Forwarded-Encrypted: i=1; AKwUvBzO8L+lVkteuJFnLCEjClc2Nq0HLA8trqEfMI0AoYIPHOkalV9f7RCwfw+VPBrRyxLhVUFgF70gtm/Fqak=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0IWR6ZaJ2uYnSpf5dhTPXT4RBcanagymEKakGBipbgD0IRcbS
	hqfq9zHfoEySX6+SJvIfFiaOy8N2FBCJ9NYuj59tum3VwUh91YrZDb5w
X-Gm-Gg: AYBFou3ohW/M9s+tUcRuiYhiwI8s5/aMEEjpbzEo2klX/uwHPNBduANPj11tA2wh7AC
	z574Ky/GyJvbXch+hSrvpRVtVfIpgrWuXeu4HTAfKNvPwsXn/ugtov7RWS91T9LIJkLR7HS7NjO
	dXcnuWw/nfojGHr0lETIkbreBRTq7XmfuIiSF4Z6enCgxC8JkUCqrQhrS+FXSULImhkL6aeWMm7
	3MzZwtm8eMQmQXofv43eeQIYlRq+4+wGF6Jq8omfh3dWRhqJEfwc00Lz0LLKZutpRvPqiQVefWw
	742E+mqidXC9AHOBWpdayuF5sTpjSve8lJupn4b0jMnYyLeyN2/2CTTtQpmV5a9VYwLYGF7q25H
	J6z32L8JS98VoUbRfePQ+setPJSZ0XeyL/pYS5m/uBPnLNOpCOjbv4dkY4Nvifa0T0ceDCAUjBw
	opfKQI1WzPq+4iZpxplxnff2Je9JaWO3gnJ+VLxI1GSMAlYZeHV8MOj1T7PYPV49iyNol71wu1W
	cMJv+wZyAEfKc6bwy9aqYX/q1wPCjLjcpGX6MQ105iIByWL8UiFk0oSPJMd1jb0cL5wDzhNcyF0
	ieZtdTQcwIQNGbuE
X-Received: by 2002:a05:6000:46c7:b0:488:7dc6:4e9 with SMTP id ffacd0b85a97d-48dbaadd40bmr6536672f8f.10.1791655726559;
        Sat, 10 Oct 2026 11:08:46 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:45 -0700 (PDT)
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
Subject: [PATCH v2 1/3] mtd: maps: only point() maps read through the simple accessors
Date: Sat, 10 Oct 2026 18:08:38 +0000
Message-ID: <20261010180840.2152492-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010180840.2152492-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
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
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
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

