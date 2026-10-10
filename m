Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F404A8418
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637236; cv=none; b=uQ1pUabxF4bln4ZOdHZK7O8qeIx/Ix4yZl/HFdRqa/hwv1hbANzAbfCvY7Mb3PfmStnI+KXNIv0zwdZR/nbak9K5Ja/QC+oMkJ4QKD2d/yB0xmC7IxOamHtruBoLzK4raXtuAdma+ATLkp5xisgbe7FEVE8MyAlIeWGiGiEy1LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637236; c=relaxed/simple;
	bh=QzDIBx2QJ/WoHugMHP+vYhAOaeLSx0YONeE1rWBUfBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRT/XAPIIZMnL2d8GPNkdYGGA10S+548/e1gEMe6xPNQxguB7kheMEspjMVBRRNN/5DOh8ey+tH+BTa1Ntj1Cpy3nVCAw6P+LZm0WM+9pdCoIB9BZZUBVdHR6ORvFdGbigcy4EIYd7Fbp7eOmZ11+6quEszzjKqbNxgJDcDRI20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=By1izmdR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="By1izmdR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so4289095e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637232; x=1792242032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReH6zdN/Scg2OvBXNd4w2aYQz49a0qu9tqAasA+lUVk=;
        b=By1izmdRSRZHkzp4r3xb072pH6WyMR6Mcua7DVFt5koRcCi2Im5eB93Ho+eDuKIjI0
         zA/q+Dp/WHW7OM+Y7yXRrkjKRhrVy6V+elW6a+0Vg2apGXDsYsM0sKGdK1pD9XlwQwLQ
         gafElUjxOtL3zgP7+wFAZ7whBuf2ZBwxi1KIolqlMl5g7Xdwgw2zJXLpj4mYr+AiR2Sf
         B5KPrgwruaHro+gIZ3jfL7TbaMiKoEJEbidA8xZ1rIGbS/+4/rZvxIXoDD6Ojo5BbYLH
         XfzjlpumNGtm6Oi2jczIyo13P+kboFuNKelz5aL5X2H5tE5WrumerJmxFsxo/6lJuOuH
         1Ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637232; x=1792242032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ReH6zdN/Scg2OvBXNd4w2aYQz49a0qu9tqAasA+lUVk=;
        b=SxIMpw2UvH2opDhBOpY21MIUSbnWw93yQFC7PlX01Yzi6fG+IWcn1sqe6ap176BNvn
         fnwSLQeMDdakE7Uf5UHhDQ+oetcTpKImxccCwJ+r+OlrnZSc/PwB2lFoXao1BQZzZEQu
         0Jrt1xjbqY9ARJCVgdPHixqiCUTvq0xUuKw/QUNfCFnxUTbG9zHonDGnOfkt8LkjM4JH
         hhu23jSW5gv1TItu4SGg1xjg2AuBZBrtXLu898FrScUd9En6G4BaFdeuzcYkKzWi+WTx
         StlyQnUwbzJ30NqSRzTLq8mPXtWHLezDHKRMW3MQY2yFBW8DZTWXflbKqoYDhsBFXg3z
         MdUw==
X-Forwarded-Encrypted: i=1; AKwUvBxC7FKkvoRSdDbVJPRA96lJRIdfBlU45pOTBqf6ieRovMn2xD95s9zf7iqi+0aEgVSWY379XV99OGMuynI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcDq+7xkjGOdfCQwncOoFfM79pFz0VZhXRKBm9JCfXDNbnn2Du
	3sqqXGWO6onanePG5fhlVbO5Qhs21O800pURplPH2SMBHU7uckijd0fZ
X-Gm-Gg: AYBFou3gl58js12VXn6+ePI84wUgptfcCu/hYLIvt2XlUg9FxSAyJx4ukrzej+semAn
	8y5XvtI1qlg2UrjrSqigglwS5I1or/w4TUnI92agvGwIYXf/nZlVbRc4b1JYQ4JrcnxfAtWiIxo
	V1ctoaKXZ7LINjsecuGlIF4wIwmcVtSlthucn0QrDSC3uJV6PqeyAyMoo2ft489Ey//WTjCEcZM
	m9RLvz7ebEtaGgSldYbsqt7UKh8c8KwpbuJ8HdEzFuK0TLtGV8BKfWF7PABy/CKEH8TNUO1acYU
	Nny1029WsjGPg8xn/J4uGPf8S7l4oy3yc6kMnnYtb7i37S1xz+0kyegO1iMTcQNjabzUZBSPSbg
	aAaKp5/S3fhOdnd3Ypi3Y3/ilYxwOiBnNd2z8wPAkwhM1KQ65OOWyvDOdGZ5S4nSAFFuJqdf2E8
	dCh9JVaWiMGwOTWA8e3lt/qVUHTXgv2MWUIcZn3lhSYBsPfCRuTqiYs2tymDS3lVXrz3dZCsNcl
	OohpOr8k8lwClYOZdQDHQPg7EJJNDdl9XMz2TJlEC5eN8ISErocMPAFMaAhKVLE0rkwLBgjmJVD
	zvbK4QHUM7/Tul6lhTjWE9JD5JyTlDU8b731Rj044cDGrQ2m7bBARs2HCLejj0z7vmC0TzkO
X-Received: by 2002:a05:600c:19cf:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a18e4a988dmr80690785e9.13.1791637231769;
        Sat, 10 Oct 2026 06:00:31 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:31 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when requested
Date: Sat, 10 Oct 2026 13:59:40 +0100
Message-ID: <20261010130024.177503-3-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide the optional lock used by the tested ZX279128S workaround. Lock-
off experiments hung the board; the proposed API remains subject to
maintainer review.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/include/asm/outercache.h | 22 +++++++++
 arch/arm/mm/Kconfig               | 14 ++++++
 arch/arm/mm/cache-l2x0.c          | 81 +++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)

diff --git a/arch/arm/include/asm/outercache.h b/arch/arm/include/asm/outercache.h
index 3364637755..cf9552aaac 100644
--- a/arch/arm/include/asm/outercache.h
+++ b/arch/arm/include/asm/outercache.h
@@ -117,4 +117,26 @@ static inline void outer_resume(void) { }
 
 #endif
 
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+/**
+ * outer_io_lock - serialize a device read with outer cache maintenance
+ *
+ * On some SoCs a device read that is still outstanding while an outer
+ * cache range or sync operation is issued deadlocks the interconnect.
+ * Drivers for devices behind such a bus take this lock around their
+ * register reads.  It is a no-op unless the platform enabled it.
+ *
+ * Returns the saved interrupt flags to pass to outer_io_unlock().
+ */
+unsigned long outer_io_lock(void);
+void outer_io_unlock(unsigned long flags);
+#else
+static inline unsigned long outer_io_lock(void)
+{
+	return 0;
+}
+
+static inline void outer_io_unlock(unsigned long flags) { }
+#endif
+
 #endif	/* __ASM_OUTERCACHE_H */
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 6574659dfb..871c38b435 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -1015,6 +1015,20 @@ config CACHE_L2X0
 	help
 	  This option enables the L2x0 PrimeCell.
 
+config CACHE_L2X0_IO_LOCK
+	bool "Serialize device reads with L2C-310 maintenance operations"
+	depends on CACHE_L2X0
+	help
+	  On some SoCs, for example the ZTE/Sanechips ZX279128S, issuing an
+	  L2C-310 range or sync operation while a CPU read from a PCIe
+	  endpoint is still outstanding deadlocks the interconnect.  This
+	  option lets the L2C-310 maintenance operations take a spinlock
+	  that drivers also hold around their device reads, through
+	  outer_io_lock()/outer_io_unlock().  It is only active when the
+	  cache controller node has the "zte,l2c-io-read-lock" property.
+
+	  If unsure, say N.
+
 config CACHE_L2X0_PMU
 	bool "L2x0 performance monitor support" if CACHE_L2X0
 	depends on PERF_EVENTS
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 4708671600..35cc2eaf85 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -48,6 +48,7 @@ struct l2x0_regs l2x0_saved_regs;
 
 static bool l2x0_bresp_disable;
 static bool l2x0_flz_disable;
+static bool l2x0_io_lock_enable __initdata;
 
 /*
  * Common code for all cache controllers.
@@ -778,6 +779,81 @@ static const struct l2c_init_data l2c310_init_fns __initconst = {
 	},
 };
 
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+/*
+ * On some SoCs (e.g. the ZTE/Sanechips ZX279128S) a CPU read from a PCIe
+ * endpoint that is still outstanding when an L2C maintenance or sync
+ * operation is issued deadlocks the interconnect: both CPUs stall and only
+ * a watchdog reset recovers.  The vendor kernel avoids this by holding one
+ * spinlock around the L2C operations and around the drivers' device reads.
+ * Do the same when the cache node asks for it.  Drivers take the lock
+ * around their device reads with outer_io_lock()/outer_io_unlock().
+ */
+static DEFINE_RAW_SPINLOCK(l2x0_io_lock);
+static struct outer_cache_fns l2x0_io_fns __ro_after_init;
+static bool l2x0_io_lock_active __ro_after_init;
+
+unsigned long outer_io_lock(void)
+{
+	unsigned long flags = 0;
+
+	if (l2x0_io_lock_active)
+		raw_spin_lock_irqsave(&l2x0_io_lock, flags);
+	return flags;
+}
+EXPORT_SYMBOL_GPL(outer_io_lock);
+
+void outer_io_unlock(unsigned long flags)
+{
+	if (l2x0_io_lock_active)
+		raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);
+}
+EXPORT_SYMBOL_GPL(outer_io_unlock);
+
+#define L2C_IO_LOCKED_RANGE_OP(op)					\
+static void l2c_io_locked_##op(unsigned long start, unsigned long end)	\
+{									\
+	unsigned long flags;						\
+									\
+	raw_spin_lock_irqsave(&l2x0_io_lock, flags);			\
+	l2x0_io_fns.op(start, end);					\
+	raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);		\
+}
+
+L2C_IO_LOCKED_RANGE_OP(inv_range)
+L2C_IO_LOCKED_RANGE_OP(clean_range)
+L2C_IO_LOCKED_RANGE_OP(flush_range)
+
+static void l2c_io_locked_sync(void)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&l2x0_io_lock, flags);
+	l2x0_io_fns.sync();
+	raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);
+}
+
+static void __init l2c_io_lock_install(struct outer_cache_fns *fns)
+{
+	l2x0_io_fns = *fns;
+	if (fns->inv_range)
+		fns->inv_range = l2c_io_locked_inv_range;
+	if (fns->clean_range)
+		fns->clean_range = l2c_io_locked_clean_range;
+	if (fns->flush_range)
+		fns->flush_range = l2c_io_locked_flush_range;
+	if (fns->sync)
+		fns->sync = l2c_io_locked_sync;
+	l2x0_io_lock_active = true;
+	pr_info("L2C: serializing device reads with maintenance operations\n");
+}
+#else
+static void __init l2c_io_lock_install(struct outer_cache_fns *fns)
+{
+	pr_warn("L2C: io read lock requested but CONFIG_CACHE_L2X0_IO_LOCK is disabled\n");
+}
+#endif
+
 static int __init __l2c_init(const struct l2c_init_data *data,
 			     u32 aux_val, u32 aux_mask, u32 cache_id, bool nosync)
 {
@@ -859,6 +935,8 @@ static int __init __l2c_init(const struct l2c_init_data *data,
 		pr_info("L2C: disabling outer sync\n");
 		fns.sync = NULL;
 	}
+	if (l2x0_io_lock_enable)
+		l2c_io_lock_install(&fns);
 
 	/*
 	 * Check if l2x0 controller is already enabled.  If we are booting
@@ -1198,6 +1276,9 @@ static void __init l2c310_of_parse(const struct device_node *np,
 	if (of_property_read_bool(np, "arm,full-line-zero-disable"))
 		l2x0_flz_disable = true;
 
+	if (of_property_read_bool(np, "zte,l2c-io-read-lock"))
+		l2x0_io_lock_enable = true;
+
 	prefetch = l2x0_saved_regs.prefetch_ctrl;
 
 	ret = of_property_read_u32(np, "arm,double-linefill", &val);
-- 
2.55.0

