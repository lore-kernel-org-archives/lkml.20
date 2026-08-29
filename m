Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E239B4A2
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788006656; cv=none; b=uMU73zkE+Q96zlQGa6sBKUWk8R960v0rC4D8de79K3OfGKg4Ai2TtsCO1+8/69bE38IXqcP+L8raKqhBxQfMImd3Jotom3O5pViFJDRSJufGYoTA/VMvbqs/7bNHUAJGe2MTNutOFvHpzrBsZ5Ux35nEdI0rC7SX5vHlnDdYlbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788006656; c=relaxed/simple;
	bh=6RjjuNI82tkMK06bJbjyQ8Ok9HORZ6UIOGcYAghL8bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4c879S/wTdQ19rJzBbdzTFhef7K4CnySJ4mm+b7fzERCO6MGr+XAbQRjYk+rCu430hzIXNLRh0vG+8yMYBdUp2OLLuChQ9jPguaws/kvmjc9sCJhZ85r0aCCJ/MoC2QLlhLyVbGJBsP3lHJ2fFBiZNo5HeK9FCN/SNYVXrvO5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQdpWwAO; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQdpWwAO"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1687583a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788006653; x=1788611453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fr4WGpkpz0g/RZv8ki2EXdEf5V5M5mLF4YRCrDVH0E=;
        b=qQdpWwAOXRHS31fgC+659gwIcv/HZBfqTWI4ryxqZlBXDxkEkCkM31EqBIUHfivnVB
         /0JCVMi7c8x4mT8nRlQJmPGosrvsw42EEQrQS0cKO771G2kK4l1s+mYYLscbytnSoPYw
         VY/+Sb3RXUNF0pPy7ATHkzuZRqn/wJlAoD81J2hqBg/THh5hCB+5ZGFwsjy0SX1lm/kq
         UkRmVf2PE8cDvmOC9jTVSxijeNdunsLxwCLnXCBOGwxDI8R//IHkYeJ0s476N341S2ap
         i6ZkBwK5FZmJESceDlI/lH4DFIP2HZ1tMZlohuJ/8AE5zLypjy2kQ34l2Yi6iC7+FNVp
         yvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788006653; x=1788611453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fr4WGpkpz0g/RZv8ki2EXdEf5V5M5mLF4YRCrDVH0E=;
        b=svkeXSQpDp6oJVJodUvxWMKXi/uwgC7toEzNhfCqxlIEd770ZPrHqGo/Yqbi+iwGnr
         IDDHBtg2E7Ewp8s9Dcfcz0aVdQ9PisAkP/nYOd4W+SWg43vC+nWGV1adQyusAJ68PCV3
         rc1tSX+/O2F2ZGX+E51TJBgV8YpuLptbb0nwKfN9Mg2Kg2OFzFSBCZSTIUgeE0SG47PO
         8Y5BHorBEDXMxHGl5gJX2+7p0MyviPwFs5ccHQdZ8WsieZincATm969pRB86Gv9KteF9
         ZvXJaLFhVayPbfVk09MVoniPJUe9If/VqL/t3fEhnO82evHYe/AxMCvu0VkmcXhWEBU+
         4nJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1u8SmyxGvb5J4dOzJJE7DTbaZCg57slUTbftekFBtiZJdh2pj4HJ92Q8/m7tcVYwzfDkCKWcUW48K7fc=@vger.kernel.org
X-Gm-Message-State: AFuF++kYa38A5ZTSGr4TMluKhXp1xzHYxV1fURaUru0JyFRSb+RAC/tE
	do0K5F3Zz1rEC90czLVyTFkiMqCd9gp8ACq9uYxJAuQoN4KcIAdONzwn
X-Gm-Gg: AYBFou2Cy8iLTr+ANk4eNWoMDjDu20mrQt5NsYBMiE2oHHouEQn0wdjFSCr/jcMbP6y
	mqp+k6WNEjJbPz8jSLPgX8nzMuhuChW0czUnnNIX2hdm0diAGlwOZxyztTHkpM/MqOILMrUsLvi
	zJX/xjzLhqpOuAh53aiulvdgRUXG6K8cDNtZrHrxFHuIlOnLFt8O9lB8/72cELEJo1olYppoTpf
	6h+FVz7/Y7l3DZf4lB4pVWe46KxPd2IfDOk503rZQmKbSc2XAVWSDfzz9B5uM+c+J3ELinR0fbL
	zC+1rNAEu51CAXHuRyvOJaer8bfJpGfoCa8IE9bhEkcscTCGh6wEHZ+Q6vTiWSWsn7hQ3xQovUa
	0G9c+h9nzg2ks4/TvAIbyblD45NWrEoy2Z33UNtGwi6TzWv+L9Er//0P27FTUZlmXSWmHOBsskt
	sgvlGhgT+SbVO9HmOhDpX23TnLEpVv08NpV/SbjR/Y+VoGjhYuOR+lKITZNWxOULvzxZH33rqpN
	Gg6ucu6MeAdCkH9zFFsMg==
X-Received: by 2002:a17:90b:50cf:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-396d0ed78e5mr24088912a91.8.1788006652964;
        Sat, 29 Aug 2026 05:30:52 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398b18b4074sm2596059a91.12.2026.08.29.05.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 05:30:52 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
To: willy@infradead.org,
	jack@suse.cz,
	akpm@linux-foundation.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	baohua@kernel.org,
	axboe@kernel.dk,
	trond.myklebust@hammerspace.com,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v2] mm: filemap: retain mapped dropbehind folios
Date: Sat, 29 Aug 2026 20:30:47 +0800
Message-ID: <3fa43eaca792bc0bbde4b82a6c1fcdd3f528b398.1787999152.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820142956.1414337-1-qiwenjie@xiaomi.com>
References: <20260820142956.1414337-1-qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wenjie Qi <qiwenjie@xiaomi.com>

Fault-around can map ready dropbehind folios without going through the
normal page-cache lookup that clears dropbehind. A mapping represents a
competing cached user, so retain the folio instead of forcibly unmapping it
when writeback completes.

Unmapped dropbehind folios continue through the existing invalidation path.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes since v1:
- Retain mapped folios instead of adding a stricter context predicate.
- Remove the private helper and RCU include.

 mm/filemap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 6afec636881f..00fd89cf6f55 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1616,7 +1616,7 @@ static void filemap_end_dropbehind(struct folio *folio)
 		return;
 	if (!folio_test_clear_dropbehind(folio))
 		return;
-	if (mapping)
+	if (mapping && !folio_mapped(folio))
 		folio_unmap_invalidate(mapping, folio, 0);
 }
 
-- 
2.43.0

