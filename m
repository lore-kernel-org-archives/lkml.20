Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701087;
	b=NQzusBrDNi6jPwxuwXtCjlru1LEwjjwK5NApZw3g/ZKN/svQ2TkGWq+S8SEGr2VsX0BA
	 /4KCiE7dOiRFxZx1cVKdpvgmEZ+sp1Ed3O3wCa5R4k9lCf7S3mmw/dDAmwIcwvPRSpCEE
	 8YFumm080S56SfwR4iktqiPJI96UTQwCK8RRNY4/JqjYWYSlctxX/Twl3vb+nPPHsq9a8
	 HvloNfz8IVBQatAyXDNoSPfkkyuktoaO7ILKvqqix1242LJOLir5T1aHvA+/F/D6Q+YBQ
	 PJianQitzpWzntQ3ESpwx+MxTz7MN+DTnnNa/cLtjsuEcwfOMkiT+LHBUhc58dcHsNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H9wZERoTK73TzMKQ9KwUyuGxqQabGqZnw2K4sCikbaQ=;
	b=UC08PKpgXn4QPr9U2bhHo+rA6INQ74B4FZV7rO1MgUaOHZJJo5IW9B8n5sPPbGrTCtaM
	 Nqffob9ZlnbZvSvsw4LNVNQfTSNWyQAuj0Jq0IYZhMdCMprgPaGuaSvrSwQ0Yj2BG6SNq
	 0sUTMKoJzqsKizQyWzKau/18WGo0dL5L864cYYSRK/5uBDtiWIBAePv+j40WE9ASvJoag
	 nyispuUkUEGHlMW7VXk25YlTCt9a4c4G257Xy2lzJ0DRIUDAQuVKBuQrX7gm4hKcdg/KK
	 WH9TCBWAiWrGEjGdGAY7Gt6MaETqMPUydjRO5DYBV7NHGXmpYRfRghj1ByytCiB2Gpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AypDUUpw;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FC3606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FC3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AypDUUpw
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36661f953e4so6081946eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701086; x=1794305886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9wZERoTK73TzMKQ9KwUyuGxqQabGqZnw2K4sCikbaQ=;
        b=AypDUUpwQbjWdtbAfM5eadOVWmbrcaw04pmeDD/OePhOoP/1LBhb6MjH7dGAwfRCJ0
         lY5iGddFqG6ZlnxxGNe4IvbGcaPax0Jlf4LpGVFKQgBelASjRzp9pLi5BTScRBL4ulYX
         DRMAbwtgjr3vU0OlH8ijWe9c+1j8sxthfnsHeuWqgyJB29RdamUucUxtdsz2CUEMlWOz
         7feIFuJPAOOJYcBkbDi8dPV0TvEgbd1uPQQgJsudzOTm8F2HqtpYQ7zqdQjNXZsm+1kT
         5c+xdlX7GcDpMBoOe5c3JkqRJKn9YfBzQdDFYQJ1aPuZwdunx9FUrUro9+XLP0ze+dRb
         zSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701086; x=1794305886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H9wZERoTK73TzMKQ9KwUyuGxqQabGqZnw2K4sCikbaQ=;
        b=VTrAW9PG0zAxgIK0qR1rc3Kq5vbaWd7NDQl0pJdOuJ4JthmMIhQ+xnlm7sAh9qxVlt
         K3ucckQbVDD9QWi8lhDdfZ8OdgQycvgpZa5kMyIFdWZ9QQBDfaDb6MemiaA3AcuYdpxR
         Ki8XXpnvO7jQPNcWfJE+7164mjONYA8Paf96KILEcOJ9JMT7Qux0+QsLzRSMkxi65WdF
         XKgOrLMia0cbnuqL8dxa/3FRBUgYM6Vy8GdHUbfTDZVxATgnFLtgY8JMUM24s99TPogG
         FEWOWJiG29iFoGpzAja0YExQ7ScMqiYn04QVmfb9zFQtYWMEboE5kvMqIEYhhRSvjH9U
         mqNg==
X-Forwarded-Encrypted: i=1; AKwUvBwspe46PR2nLKIjy7vylXTI+LyN3vPDPqEVJMpFtgFzB6CPFG4Z4G4pGLAAndXmPJ40yRvrYLD8zyaGezg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/XDN+j1TNywxdL00qYIAwvEsB2Pc37pXM9ckggyuFTUS0pTKo
	GZWcF0wMZAwir/CHnabARJr+Mqw9Pc+u9r+9uGyCAs9bZNgVoefFFGzZ
X-Gm-Gg: AYBFou2vQimYH/XZ6uq0o4P5gSnCbph4vuSZBiYpBEypfEFv0lfZ4hXZ7Wr8Rsxe7Ds
	lHoSg5Y1ietcZ51pi5ThipFTGV1tpdbzyDqOLroot1FnhngrD1ln8pho17uAwkt/GE4LlI8+oep
	bvwrHqQne8rhpQ+8sjxWpj7t2ljyHGgw/nNDt2RALyVbXEAbyhu9gKutq2G9sKWRBhblBoK4ziL
	/E3/Mqha6Nhh+WghuYuRSZ7oMs1/FWjMggQypSJy9+0d+3N7BmxZvsIKnSH129XOT2LATHlbcHA
	XKq57kTbE/6HCzETIuTlxN6bLYJTOuRhd1LqIyO5GkGnZjjjWzmBgc4TpRjTmAAXxMQ/sHolRlu
	+mSWYKLtLfdE42+hao1z40kZrkIga+pnV1xBvPxUWJ1SzYjK0L9Ko+N/ze6fCeH1O2X5ojLjxFs
	8VL9BBMbVH5hxKafs77l8T0C6O1gMUNVc05zcw6XJbO0ZGGQCDPHcNOLSWKk6rfjx+Qj9ZPALMB
	p8rCfgbcplNKx069iHI/zw2dPDu+zOKB6aEiPlU2C+vUgA4jDVlqSxBQppFKXQUZ+wIZDjXAXAv
	p44wOVph6nIkDrI0eTdO5C2gTueASX9Zq1JBQZzXe1WUeT/fJIw=
X-Received: by 2002:a05:7300:c019:20b0:36b:f09f:924a with SMTP id 5a478bee46e88-36bf09fa41emr1925693eec.14.1793701086055;
        Tue, 03 Nov 2026 02:18:06 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:18:05 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v11 08/10] mm/vmalloc: extract vm_shift() to consolidate mapping shift selection
Date: Tue,  3 Nov 2026 18:16:56 +0800
Message-Id: <20261103101658.766905-9-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
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

From: Wen Jiang <jiangwen6@xiaomi.com>

Extract the vmalloc mapping shift selection from
__vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
vmap batching path.

No functional change.

Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 61f2b6fbbcd9..ee2c1ec4ff1f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3605,6 +3605,14 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
+{
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
+		return PMD_SHIFT;
+
+	return arch_vmap_pte_supported_shift(size);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -4124,11 +4132,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 		 * supporting them.
 		 */
 
-		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
-			shift = PMD_SHIFT;
-		else
-			shift = arch_vmap_pte_supported_shift(size);
-
+		shift = vm_shift(prot, size);
 		align = max(original_align, 1UL << shift);
 	}
 
-- 
2.34.1

