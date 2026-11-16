Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802181;
	b=4V+h2wfKqDUWAQ+ubx+RoSdL4CI0o1KqhFc2yjlUtVUM/PhVYh3FDY5CwnmEOUMWjDei
	 Si29EeodNvY+XklLCRUZyvDUHzMrA0p5M6xy/uRbto3XV7Dpq9LWGXWCgw5RgVcBJUotf
	 XSTlbWcAmc8+fN0pMMjvLGly9WRDjLmIrj2YmDE65t6ctuJLIbXI0nxYkG6mzoD8gbkrM
	 6rT2B/LH8KMEejiUrK2nLxeqUny0SamL2Pm/lc1UzHN3iyRAgIzlqNV4nKIF2anHcQfGi
	 E07u5G0MEQKLRlseLHVyKn5KE3jXOZ+hGvQxjxzFv744C5dQ42RFDCX07qZCCKslspg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oHMCTpM5FOw3/cBC9wgKrj6AogBZVAMTRb9RMaIUNTs=;
	b=DRF9St0Px0h7BuofaUHPORSIuvFh7ElIJd4tMSTkKsN7DP41MYY5QOL9qSPfSQAtPenl
	 JbJSuv0wqnn+AIi+9xx9T9+MUPR5SbJUnqzb/pMT56b30tTLC1Qybs8JtBQvt2cSuSNvj
	 ck0DD0CNygWR9Ha+wIY+aRD37YGnZjR9/rztRMtag2MqcfAUJ1KKPKIgrZq/Rkyh20DfB
	 pF/VxGhCVtTwFTqddUSrs9opT1Uu/8vNnnJyn+dUX6xAdu5qbNCM45FliIDjWMJcuFWUr
	 X/2tSP+4d/BSBl45zmODz0TrJHHa5BKriu0W/LbmXaxfeA2Uq14NFkvbropArizuSWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm1YHkNv;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B7606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2B7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pm1YHkNv
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1491291b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802180; x=1795406980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHMCTpM5FOw3/cBC9wgKrj6AogBZVAMTRb9RMaIUNTs=;
        b=pm1YHkNvo/qKz/C6QPzcvorF4LbMhWM5Pa4nffpIaiXLEqKtRZ0PR7I/QLHNPXt8CR
         84ZdJPyZ7hPC2tnfBaSaIRnwvd8oB4bOLtz/jKLUEWR4f5mRZTZoSvzdLo9a0MsGzQJp
         D2XifZQ9vow//kyliKop9cEiQgqwXkZYL4zK+54Kcbac7XMt46HDVum+nxkF4IRgAEzi
         HjeSbbROEW2LCimFRLRS9g43dCrrD2FxatfBapfvG7RtxRO7VxLJxibRW/pXLHfzc752
         vJSwh8EsHZHj18VL2l0r2rrUENRTOaHXtR1G5vZEJomdO0ja9FKCeCeZutQ6I95UDjp5
         CAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802180; x=1795406980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHMCTpM5FOw3/cBC9wgKrj6AogBZVAMTRb9RMaIUNTs=;
        b=YcOhBZZfoMZQ8XHxYGPfV74Nth/psZbV0CYa1bB3u+S+Ujz3SP5c/jEX750eHyPnHz
         v/0kn9UZ0skGANjPqkcAuU1tTMH1kTOyGHum6+vM5d6fjNHDybVGWrUynId4luUvJpfr
         aH4tOhIJGSARHrt2vPVkJBd1Yi4x4hrmfqY6gbXtgyfu+yYOASzxTFjhxj2DxscxAP0n
         mp7hxbqVtELMRY/bSy87cTL8a7vDgn0+s8QtdptlMT2PrHtOT90Bq2cj6EWD44ymUyhL
         /SumMPKiFpmjlC2vOERr//0a+6vv0Rr3z+0rhbAVh5Z7cb2+Z1zi6KvyzDyStPpFNgJe
         EhFQ==
X-Gm-Message-State: APuU4Z91cKlDgiSHMhk2WqEojfybYwl0BptuQk5R/EyXca0eOaJzxwy4
	mMB5FqK/TJTQbHHMQqvrUza1eV7NDY7jpu2f6EbiZQAEQvgeiEm6bCYIe3ynVA==
X-Gm-Gg: AYBFou3kGLJajQ8puirXD1HfxDEpjvGHGj0fbSFDmh/QrWBfAItm0tGkYhFT8TH8dLv
	W2rwl/Xc2+Jfj+QoQBsrDIKXjCwVStGaXQertyQ11k0oUoMpcPVFU2e3Ct4FiLYwRAM2IGcfQ6C
	GSrN8qp4qmxKphVbViYcUSOIxXNC6iMkLLp8kKoOyhz4Cz1yRRK8SXxXB00MerEq6DyJplXGkfu
	gr2PrJcdAib6oSPDepYR0bo/0K+bX07ckNIY6jCNoGE1ZfcCfk+9N4uO3vdNb/M6UKlZ2Wy4Acg
	nwQSEgXVvE07wuc7QcHISjtZIS2QZPVK/yX05LMuYe9LJNZCztdC/LnKeWY419dHPAizpx0l8Pv
	wXgohIMk41w82h1N5riq5c2PoSEDqjo5uFgDlYJpLQYSz/fid/cAbbBF2GaViPUDPg14iuxbTWj
	5+N+Z4mdiOjyqng2E7FbLC2ZigZEhHm9ZjTclKmHFUQS6Sd4HbZ3bL1/7v38pkkD/CbgPE7ddgW
	5cMR8KRUV8PBblv6qji3C12l3EIwtoVh5+rwPxEIdVyYyIur7ZjhsETwrjFBnxPCNxhdSfliXOI
	KXMdarvaIqlW1V01vX5sA3Bbj9J4b2IKupu/vmWQ7h+2J30BQKwS6ivJqFG0bZMuvuo581AdFe8
	IuBC1N9+GsNLVX47PRCtp2CGqRNBngotfRXMbpvkp35JJonQ=
X-Received: by 2002:a17:90b:2b87:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b1b07e9026mr7927230a91.6.1794802180411;
        Sun, 15 Nov 2026 20:09:40 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:39 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 20/20] f2fs: enable subpage block size support
Date: Sun, 15 Nov 2026 20:08:51 -0800
Message-ID: <20261116040851.2849696-21-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

All paths now handle filesystem blocks smaller than PAGE_SIZE, so stop
rejecting a superblock whose log_blocksize is below PAGE_SHIFT.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/super.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ac024c089710..2f9ef2abfba8 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4173,13 +4173,6 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
-	/* Subpage block size is enabled after all paths support it. */
-	if (le32_to_cpu(raw_super->log_blocksize) != PAGE_SHIFT) {
-		f2fs_info(sbi, "Subpage block size (%u) is not supported yet",
-			  le32_to_cpu(raw_super->log_blocksize));
-		return -EOPNOTSUPP;
-	}
-
 	/* check log blocks per segment */
 	if (le32_to_cpu(raw_super->log_blocks_per_seg) != 9) {
 		f2fs_info(sbi, "Invalid log blocks per segment (%u)",
-- 
2.56.0.611.g1030f0b940-goog

