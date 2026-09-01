Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2261C486E6A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281603; cv=none; b=TOtltD0+8C6eqD9ylWvT4fpNG0AdCZTxc9Gz7Of63L7PRuvdnwQBytfrOmf2iRPVHBfqdAxyrhmHSgNyKirav9Xn6Xpa+9mlxVrtzpTxW7jjTMWGlH+2gmbX/Wa1CqiwDPOPUGf/EK3iqPjqixmqVUtakpMJOYxV/66hllHq654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281603; c=relaxed/simple;
	bh=wFA6yATKpNNzkBWJPq1alsOQ0NYbDPhJDCgUTrHhOL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMp935WL19Kvsl11NhCyfeZ0pGa7dk+mmDmNr7q/4HgwCqq4TkF7nLhstUXU5V+blHPvJpVLFHeLk2UbICDCRu6NfEh6EZxKcKuHpStlyIsR0OkCe4Klhs7Ki2UrqS+54rpF8v1+dnZlJM/urUtrUWgR3NGNJEHXzlA2HD4otM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qcN8fegl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcN8fegl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d91518a63fso48785ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788281601; x=1788886401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StFN0pa1Zvrg1UiKZ1dKZ3qIfBRxQYisRtQtzyiPhrc=;
        b=qcN8feglUXC4RegotfehL+Q9zl9a9JwdXY1ke0+mcg1Db9PewZAFPuBj9YeQv/6ewD
         LeI+oLTURr2EbCPc4X28OfKg6oUY6ba4Og4ZLUq0eqf/DDeESm+q+lFKAILbQ8WWUFvL
         rUM0V5SOHhyo52R0vKA5p/zTI405F1NmKE2D77j76YHB08dPv8kvT1envVEwtXPeUkpH
         60BBdKwvpSIiCfAwkR0GyvIsJ+WbLsr9XBRvSkz4QQjkLF9uBJu75ylFOcBPgJ+9UddG
         aJ0UIlGWhZsouG4gS59X+QfIdTDY5lyl+21l+9NmC99kH5bTzU8BRpulmXEAxWRypBwf
         AjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281601; x=1788886401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StFN0pa1Zvrg1UiKZ1dKZ3qIfBRxQYisRtQtzyiPhrc=;
        b=ctehrkRjNpSgizM0qzoMz46IDpwUt8/2IhTokIjy2DVHGsqD/tJ9GtHwSIsgCaWEca
         XxM0sj3c1H6j5/1M6Z0VHnObi1inrdP6jhoopFSWJ4VyfVev08HxP/Y/D6tMmEp2rwPt
         x8RszIKEEEYzOztYB2wYMlnRs18E2Znhd1awTDnZr3fw5yaVPRkSraaYZIlzNcvtaBke
         TZR0mnqmPaJg06tVOZhzAaytWz0Xrmaet+/PyG/lFUXX8BG1QLQ5U4AwBqz/YwmzorVP
         xk2qHUQmsgIENtHF4pLveDa9I3IWg8Rsk4R9rRM8baIqtwhwuJ60v+S6grOVpW6dlkLn
         pxTg==
X-Gm-Message-State: AFuF++l/YwquLijqHmF1Z0smKxiDiMv2iwDMoG1mUr/MLJFZWkgww3s8
	L2V8lcGrdfIoJVWFdwF+zoUxa1WKHRrvQ/0SS5SbVp+dHjZYWzUxb1gl
X-Gm-Gg: AYBFou16WMpjK/k0+KWaTTo3QAc7wtmM/ZFfpaRyXygqwppJz+Y6VmqgAnyTXlviDWZ
	JQIVFH9/t2F9m9efctHf9HwlunylP8/+FHuvk2jLRY97SYm9hl6rb88ooOgZhN0iyuVkhgaeVaT
	RhlUtqPsBSrTJIwmgRuSk2iTA2locQdS1tZ8YYfS9JDXJ0amTRQl4tdrGlQPj76nphE6lKCj/oZ
	O0SYXtJ4OsHiMJqNSqu7WPkBpis8y/eLI7CiXSeb7rn+lfKNE6VL2zRC4Rue0hWm6XAC0BN5H7q
	Vybmyje4cZAK+Y8se5xh9wsJucBeSPXgKrW+kHJS7I1SnNpgyK1oRjW8X0ZWeUKdPVIUYeaF0Ag
	G/VZb31Q/w6KzMDd59YWx/tTTfnNbZh5awUIooL9RgSkZPpbnBoZvkHN+0DNy8e1VdzX9sNM0m8
	piAtGkpzIv/F9akmuxhkBwro4LC/C4ATAy8VNKUptuvG2al7IdqjZkLKA=
X-Received: by 2002:a17:902:f68c:b0:2d8:d4cd:dc8f with SMTP id d9443c01a7336-2d8d4cddf3dmr340213455ad.18.1788281601095;
        Tue, 01 Sep 2026 09:53:21 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd357efbsm1762325ad.4.2026.09.01.09.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:53:20 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 1/4] percpu: remove redundant assignments to bits
Date: Wed,  2 Sep 2026 01:53:01 +0900
Message-ID: <20260901165307.1026248-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901165307.1026248-1-ekffu200098@gmail.com>
References: <20260901165307.1026248-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcpu_chunk_refresh_hint() and pcpu_find_block_fit() set bits to 0 and
later call pcpu_next_md_free_region() or pcpu_next_fit_region(), which
unconditionally set *bits to 0. Nothing uses it in between, so the
assignments have no effect.

Remove redundant assignments.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 mm/percpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index a802d72c116f..5700385fe6a4 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -758,7 +758,6 @@ static void pcpu_chunk_refresh_hint(struct pcpu_chunk *chunk, bool full_scan)
 		chunk_md->contig_hint = 0;
 	}
 
-	bits = 0;
 	pcpu_for_each_md_free_region(chunk, bit_off, bits)
 		pcpu_block_update(chunk_md, bit_off, bit_off + bits);
 }
@@ -1122,7 +1121,6 @@ static int pcpu_find_block_fit(struct pcpu_chunk *chunk, int alloc_bits,
 		return -1;
 
 	bit_off = pcpu_next_hint(chunk_md, alloc_bits);
-	bits = 0;
 	pcpu_for_each_fit_region(chunk, alloc_bits, align, bit_off, bits) {
 		if (!pop_only || pcpu_is_populated(chunk, bit_off, bits,
 						   &next_off))
-- 
2.43.0

