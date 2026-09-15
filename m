Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171B44E053
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456402; cv=none; b=WGOHGZ9Jn8RmRWEdUvoKJno08ZgOBkHWsyzea0i8ucxYB/3Toj/ymxi9fvQSe9D12K2cQTCssOxUUQgDNxYfuKRnUZBOrPf8JUcb0Sm+1BU/8juc9ddLkEEbF32Fm0erxnRTryMe7MK/d06iKGEfLWDZOSSOQATlHRKOuLkHhtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456402; c=relaxed/simple;
	bh=ltvNuw2JQKtGRg06+7zxL/END/E4taRrfKgA2BRzu4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dt73IbUWN/AnTE7Zgs1jEX+GefP6RXxaC7Y/qLLeKEfzsZ2kOLYTqT0Az1rbKWgBDgeeaMHFpTlnN+f04UWwtoQ428U6cETcvalfXMe0QLg6Smv5fcjrS+HHHpsSRAaWfTsKH4GBGXaevipXzjvPjSrErW1hGZ4YhBwPTX0/U98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoCtYDgb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoCtYDgb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so11832135e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456399; x=1790061199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bq0DehDR+MvFIXUfrqdIEcTleNIxRdiq9kjPObxbiVM=;
        b=CoCtYDgbr5oSeorDraKGpaaW3EOPzcOqTKF2ou6Rk42V7mhjbiE+T5eDTCraQt05PA
         //gLiOczVcHCa65fst8bGRLZu3lDG9Fc8WDJFcDpcnxLoTONrt/MrrI0mB+IifFT0RUv
         FZVuxsqvc+/ldWnSTWRPvjxLPdQnuzQSO4/3JAXm5leiMaR/Bn9Mm74uEapjIs6CEA9c
         2N8mGkQ8TeZ/DnrVh3NJY1fTS0jlIx13cg706Zn4TcDJlvqUSwgpjvXUaPXMetS/d06e
         BG1obFtVY6FyPPh/CbDxyI7a0kmOZisjxK3dTJGNhDymQdzKvRLvgU92PvD00BCmmVGb
         WkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456399; x=1790061199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bq0DehDR+MvFIXUfrqdIEcTleNIxRdiq9kjPObxbiVM=;
        b=pKBpP4rwd02AL+WlhPDMH840awcSx99BtG2Wq1WdErMDIRgeS72LuWI/w339sjpuCq
         dQNU6C5vWXrqO22vsiEQKK1jD3kZPMaJhRdDjUw5WjEeraiorZxqfa7wtMPY5eWuy/d0
         JsblrLP2C1RdqSDSwTg+IW5XOlCGyFnb+cOYCmBHYG+pzKoCJsbjrPKLbD8U3d51Jumw
         ba3dbvEtXO34CBWUVDbN7jXF8mRZ9wa4/s+f1IsmfcHemiM3NGfpUcDaLNouf1VzXmof
         8g51LUkyoNAMHqYtAeIvPgS9NlFRUCMTVcy2ZRE/yW82moXw/9DVJ7wWuRb+1zZsj8J0
         +rZw==
X-Forwarded-Encrypted: i=1; AKwUvBzsoaxcBomOUVfu+ENrtQoMz56fXQEg138Cvewtu16pXsYP1zktYgfoa1t4UkcNVOSwJ5iGxsH7vVyvIKY=@vger.kernel.org
X-Gm-Message-State: AFuF++nIkS2z/7NL1jG4W1GIrYqGQNQv7v9DmDVxE41U+AmRvpppXm/O
	mzj2YNXEwqPglm0agQq6MEEodidOFzhrRP+6R7hCJ2muqX39RHN0he1uqj/kg+aP
X-Gm-Gg: AYBFou3GpkmySsgO3fhX8zWkh8jNd/f/uxzD+GSV03leJjHnIzYq3fUlGrqViybcFGp
	jnBifJ4MPS6qVgpklrtiJR8MtAkmZXkByUPmM6UjRVW0zOxs+H+I5z921yKi4SCPnSzMxzw16QG
	8OGjeoTl7+NttEUWNBbPInR0+NIOvQ1shMMBpXckgZm9yQyamCdyrcBPJYTjOrlXqcOFMlTec/R
	edTNv3rSY0/C8PBVdKMYIYR7L2YKoFApztHzAbBtkC+0drENco3W3A1Y13289JBCG0ws6j3KuHI
	b9QhwA9VA3My5Md1KvFkLUvgfVQ4H5G4tgTo5eqOrs71m/BZDWO9W53M2VwUTxsgXs4fVcJMh+l
	UYT5FfAqIVQKBTw0g+u3y1kQRJRJWNNTgv3UjKHZ1A7xmfvifjA9fN2Ahj/0JqfYIZnMQJXFjrD
	PV28y9ggkOC1ay72YrWQFFU3jbrKdZEWFBQoS2xMSDod0ckGagazdsjyRyZQW2yXHgj36GWR5MJ
	IDV8olp9jvDQqMw4Wt6Al9ooL3ODbBjH8j/sftjn8IsGBhuzv7njbwnlsIQrbO41GnHkX8c04pL
	LjRtSG7FHO/skgIh
X-Received: by 2002:a05:600c:37cd:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49e7a67cdcfmr84025785e9.31.1789456398913;
        Tue, 15 Sep 2026 00:13:18 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm117889265e9.3.2026.09.15.00.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:18 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] MIPS: OCTEON: require the Core-14449 workaround only on CN63XX pass 1
Date: Tue, 15 Sep 2026 07:12:48 +0000
Message-ID: <20260915071306.15006-5-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915071306.15006-1-orgads@gmail.com>
References: <20260915071306.15006-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prom_free_prom_memory() probes the hint field of a compiler-emitted
PREF and panics when it is not 28, which is what -Wa,-mfix-cn63xxp1
(CONFIG_CAVIUM_CN63XXP1) rewrites every prefetch in the kernel to. The
test is gated on OCTEON_IS_MODEL(OCTEON_CN6XXX), so it fires on every
OCTEON II part, including the pass 2 chips that do not need the
workaround:

  Kernel panic - not syncing: OCTEON II DCache prefetch workaround not
  in place (cfa00004).
  Please build kernel with proper options (CONFIG_CAVIUM_CN63XXP1).

on a CN6335-AAP pass 2.2.

Core-14449 is a CN63XX pass 1.x erratum, and the vendor's own runtime
check says so: it errors out only for OCTEON_CN63XX_PASS1_X without the
fix, and otherwise merely warns about lost performance when fixed code
runs on a part that is not a CN63XX. Narrow the check to CN63XX pass
1.x to match.

The alternative - enabling CONFIG_CAVIUM_CN63XXP1 to satisfy the check -
is not free: the assembler flag rewrites every prefetch in the kernel
(77 of them in this build) to pref 0x1c, which is worth avoiding on an
in-order core whose receive path is dominated by memcpy.

uasm_i_pref() keeps its OCTEON_CN6XXX condition: it only touches the
handful of runtime-generated TLB handlers, where the cost does not
matter.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1127,7 +1127,7 @@ EXPORT_SYMBOL(prom_putchar);
 
 void __init prom_free_prom_memory(void)
 {
-	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
+	if (OCTEON_IS_MODEL(OCTEON_CN63XX_PASS1_X)) {
 		/* Check for presence of Core-14449 fix.  */
 		u32 insn;
 		u32 *foo;
-- 
2.47.0
