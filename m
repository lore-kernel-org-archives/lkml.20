Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617074;
	b=jXECBvw90HyFE8iCHBTkYJT7BBHOtuNsi8bMajOfvg8WWjVqICQMr1teO9sl1NGojnRh
	 Uqn3XKiWWz4M6ikFkZq1hndFqZZZJTLbs6QWV867tsyQMNcknl2uIGPW8KE9cYSLsXBGp
	 RdCjN/C0EQb7E1pqSCLMJV6TKBGuwgH+y393+JMPYNZr31O71Jy6GruA1/xincXoCtOtP
	 eGwXtRllQbaBjEx6qVxo6emGIfCSqrugjvN4bdvw2pdR0MssGJNszHAQyFImrQTGkAJ2N
	 91V6qG2xLqJhOgTSyU+SSlb2o21rzR11H0ha0+YnWjz3NErRz977CGrA/3zYTUhHICA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ye8qF9ArKGBdPFIMK4xZwrbqVNgRvHSV8RgsR2NKKBQ=;
	b=5Vw6G1o448wXLT7VM6fbToMOMGr4ruqXvR1eyd9VxFnOGKWKqW8CI0ztVW+EE15wWkok
	 phmiMagO04COAfeV2/NWAQNPkElohLSMyTo+Pap+YUgLUtdF31iyxO90K4Ms0pl6OjTjX
	 rtfAP4/NpCxM+PIXmdHM1HlGgpRi3MVCCy06/XSCHwOf+CwtYwbhJdg/sOIwZPRWfyz4C
	 VkEzhOz6doU0fZd4SWatKUsiEZMD1TYAxMDhVfoZk+mogc+wxg+RAbGvzEndhN1rI/9Jj
	 RGJ8IFigm+OerJFvv9xLHgSLWK90IwKfUS1sVIBdWgnb9lR85wlG5veour880hTCWHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JyjBtcUC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBC8606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BBC8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JyjBtcUC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so7018515e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617073; x=1793221873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ye8qF9ArKGBdPFIMK4xZwrbqVNgRvHSV8RgsR2NKKBQ=;
        b=JyjBtcUCr7OIwIiBDk7xvtcBAXWav5zNFNuRHSTjnxKTnEgC2KYekgcP9ClWJZZYGW
         ah9vedOrPA8MOPyGmIbDcTjBUC1pM6r41c1Em7QqAAcr686SKI3hXlzolzWzyAHk/cWE
         4cJC7fm9nUxxawMAkLf2VsMd1hfSfBnEiRWkhVn7tHtELX/u1C+luluLYqX9Qbp8nCz3
         gb7XspWHQunkHExE68oOBCU8z7Xqc55iC5qC2I4zUFHfxw+3Y/vjAiRb9q4186Vdg6cX
         /eViSqZBgM4BJ6NFdrMG6I3F7gg4ESctIup9ZuonV7G+nwLjHvWRj8DAcCuuI/ddtW6i
         1Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617073; x=1793221873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ye8qF9ArKGBdPFIMK4xZwrbqVNgRvHSV8RgsR2NKKBQ=;
        b=tDtAjnVFVAN/RJ3r1dSnDm/xjCJpTzRdSHfn9duBRRxPQClxX8nkNaaZ/o2iTE8PmP
         tcVtefLRhqIqsr9XV+MxN0g8GVf8Lh6gllAWiGCVJ5MfewyDU8/fvqKA3YAGfTCTg24N
         LPPIsTwi/fH8azoBoNnN5GF38bQzFbvWMcaqOMN8hiOUW3cin0dDHeS3ZkGypAMAM3PR
         46fV6MO60SXmfeU41yIJ4mTh1ym01+/Dh9WZOeBAofiraF+b1PEIhnzet/U6I7MUFO3p
         vqq6Eyx1FJ9vgm7uIcxa0dZI4io48TOm+JLHIXgzwEiBeOwsMY4pXjF3pViXam9g7cGy
         FlOA==
X-Forwarded-Encrypted: i=1; AKwUvBw3BcZAdqapR3G+MSlhtolIst7R37blOq4a91JPz/qxdEMiaUjGNr+vzLDrOH85K0b+b4hsddKFABrT9AM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLThPfFb82xlFxVJ0ARQNXFpS+ZAE78vyvj9lJTfLD3lp8xnyel
	LlF1gRV+hEo8U2ypWEiPQCE7Q4xNOqo5beyC0/rbu1mA7w9JC7yt4dwe
X-Gm-Gg: AYBFou2PxrE85HGX5uKN5/y6f7HweoTePPkFv18UaUyCyjb6iHZy2gAxEztLQcFkTOm
	VhWLJEsu7UPGPM4wrKf2FJG9Y+R7lTprTm73BfQxFDpWITIhH7I4RcMrl7iCcY/Q3cOw6nv3uL2
	juh0LYFleVHr+AvTJGERk31oOMjfC/IzUG03gXcEpd51fvPIPHNYblNoKo/JAjKIst5zKzXauEC
	64XIBTBp/B4fO8mD2oZ1ZrKA4uCcE+lSPfCTO9JBYjvT5hUHcP1hgnjatuli9BEJUPcX3SkAECp
	ts8UZwEClSIGbN4RTHpa2xxdfG7n9Xq//f4ekmq4gESOIUBv1ywZqYeDRb7WVZZm2mCP1jkng6o
	oKdSc2ZxqrQn8fMMBfxFyqlvAbIDtAIG84PckRhGszy+zJaogQmo4gWXT3c26G7TizfH7hCysLZ
	iLYL0nP/hB5qS/9zbg1JjZ6OLktPrr53dt4gAeQAMqMEvwdGR3DPcxQadXwrdK14g5nKTl6jJr3
	aGd0iHO5fkm+4u1rxTUxS+QYQDjnM8rt7pFuUlQ
X-Received: by 2002:a05:600c:1d0f:b0:4a1:fbd5:26b0 with SMTP id 5b1f17b1804b1-4a1fdd15af8mr71632955e9.12.1792617072910;
        Wed, 21 Oct 2026 14:11:12 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a25fb5sm22891525e9.6.2026.10.21.14.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:11:12 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Changyuan Lyu <changyuanl@google.com>
Cc: Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [RFC PATCH 2/2] memblock: don't allocate reserve_mem regions from KHO bootmem
Date: Wed, 21 Oct 2026 23:10:46 +0200
Message-ID: <20261021211058.83483-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021211058.83483-1-azpijr@gmail.com>
References: <20261021211058.83483-1-azpijr@gmail.com>
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

On a KHO boot, a reserve_mem region that can't be revived is allocated
from KHO_NOPRSRV memory, which includes the bootmem the next kernel
boots out of. With CONFIG_KEXEC_HANDOVER_DEBUG, preserving the region
then fails:

  WARNING: kernel/liveupdate/kexec_handover.c:1245 at kho_preserve_pages+0x168/0x180
  failed to prepare memblock FDT for KHO: -22

Without it, the next kernel puts its memmap on top of the region and
the ramoops records in it are lost.

Use the search that keeps HugeTLB pages out of bootmem, and keep the
mirrored memory fallback of memblock_phys_alloc().

Fixes: f99230780211 ("memblock: add KHO support for reserve_mem")
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/memblock.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index f43659688681..0fa9d6529285 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2761,6 +2761,33 @@ static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
 }
 #endif /* CONFIG_KEXEC_HANDOVER */
 
+/*
+ * The region gets preserved with KHO, so it can't be in KHO bootmem. On a KHO
+ * boot only KHO_NOPRSRV memory is used at this point, and that is more than
+ * just bootmem.
+ */
+static phys_addr_t __init reserve_mem_alloc(phys_addr_t size, phys_addr_t align)
+{
+	enum memblock_flags flags = choose_memblock_flags();
+	phys_addr_t start;
+
+	start = memblock_find_outside_kho_bootmem(size, align, NUMA_NO_NODE,
+						  flags);
+	if (!start && (flags & MEMBLOCK_MIRROR)) {
+		pr_warn("Could not allocate %pap bytes of mirrored memory\n",
+			&size);
+		start = memblock_find_outside_kho_bootmem(size, align,
+							  NUMA_NO_NODE,
+							  flags & ~MEMBLOCK_MIRROR);
+	}
+
+	if (!start || memblock_reserve_kern(start, size))
+		return 0;
+
+	memblock_prep_allocation(start, size, true);
+	return start;
+}
+
 /*
  * Parse reserve_mem=nn:align:name
  */
@@ -2829,8 +2856,7 @@ static int __init reserve_mem(char *p)
 	if (reserve_mem_kho_revive(name, size, align))
 		return 1;
 
-	/* TODO: Allocation must be outside of KHO_NOPRSRV region */
-	start = memblock_phys_alloc(size, align);
+	start = reserve_mem_alloc(size, align);
 	if (!start) {
 		pr_err("reserve_mem: memblock allocation failed\n");
 		return -ENOMEM;
-- 
2.55.0

