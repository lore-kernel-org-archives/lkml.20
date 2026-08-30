Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE98A25B0AA
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788060317; cv=none; b=OVEzrXhw8r7OXT5QOAiGuqL/BO2DALlOMH7mQPxsQUDtOrX3yYZjKJ6BT7d9pIj8/FZouLqNJU+JjcdQY3+eFPIXCTfXTnGluE4oihypWujuAFR86yElqjIIqcBiEomUp6mmD2AJG3Dt/sYwOhUOtwVpmAr6i3LXpQGhmjKSvM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788060317; c=relaxed/simple;
	bh=oe/9wWP6utxMk7WnCPufzgIWh5looHlb0fzLwf+Jqis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ex3DyHZKnPemiUYN4SQYi5JT5jbVMTFE4Va+O0kBwBwRD9xVqeR/7Uc1P+xwHxvWh477kBKhci3Gx9FSNACkOT2nfay+krzxDdxaALiuT9YeUEbRFlhMD8kdYPBew2XasGW+lYcymTEscfhthgay7F00t/1rbQ91b5j6ZraxXug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cf7E4nWv; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cf7E4nWv"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1546195a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788060315; x=1788665115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xA51xnVuOwWqj9zN/LsUIC3tuEtKTMPy7bHuw6GJDJg=;
        b=Cf7E4nWv0844cOd7PWo5JkyV6IL/W20e3QnI4V0k74UUsJ7rZyawFdwh+AFYUezhNU
         ZKt9TF26WfA8ByNp/9dZDd+6hbSZAZXaw1O5CnODCZTK2Mjy4kG5cR3IBnlqAro3XAsO
         KxSJZn6JS37an5c+qvqfc1nQXmWjce46/5YgKqdVrnyyD/rSVkH68Iwt5qxbDHtjJCLA
         Ft2p+gad5+9N82UPykgc4X37MCDOGhDRLz0FeLVPLRArju5R26Qv61jIAPA7TOU2+sMq
         ldC1rUEBVoMWKJRN+36a76hNQBIEg3v4VlrxgAkIOo/m1OHr6rnI91PeEqgowWtKdheY
         HN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788060315; x=1788665115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xA51xnVuOwWqj9zN/LsUIC3tuEtKTMPy7bHuw6GJDJg=;
        b=ITB3s4br7llCYktshxmyQUZD2nns/pKGDRAkHkRmLyuF8oL0/49nkSioPz/OCO0DOx
         NOF57PQwSUX79T4/VUZJyI6UZKOkaR6hx7mMca/8oHcNAq65jZlDUjLMD3Ue7UIRlY0/
         ZYH1K1J9zSZU6DVyTiyP692tmiMceKpRkfXNbSvpm/daT9Zm2k6tNBPxsGuGrhrbnmK6
         Dn6p3ILP8LB6sIZR4eGWjHfBtEMQMGYdoMdtTbmy0EJBRRfdtN1LfOUov3vuhW0Ny7p8
         IJQR02Bw6t3bj+S2pskzWo9Lnb5tXaGj/QPuX/rL6B0rQjSgzUrLFphEenwoMC1k6Iy5
         dtRw==
X-Forwarded-Encrypted: i=1; AHgh+RoAh0E6imfoZvShvZds+Y5xU8uUrPXgJ6Gv77IA/g6iZOUMSf0JVa8qSLlBKMLrfTDkD829Jg1LRJVbFw8=@vger.kernel.org
X-Gm-Message-State: AFuF++m5HFLP8el8XF8gs/uZkIHhBuPOwrjjnNDmz1nIzIAJDhZE/Isz
	yshzTWsXiHHjzMA6fUViV8/m6F/4vPy9wxrOQF3GW9vR5OzeMNzX0wlncY7jFind
X-Gm-Gg: AR+sD11ALdGM4imMenGTKPhCyFujAMRgq+eHMoD/YnSBrtfZSGqE0QSN/HEb0by3HI1
	Lx1+wuLbyeiuVhHKJwgWm2xa3VTlmndZozxFCbHVT5R5s2ezUtl8rMV9w2pRSW9ciaFYfkJ6yzl
	SaFHanW2CKLrms1vh+jjmDOQu3OpTxCxu5MJy2g2Uzf1p5jIUt8yWrgwHbRSNv/YW2RwqOvwNPh
	I+PRKCQp2u42idiZi4mkUO/wUGyMcvCzfiwzBakxkpkGCOEwKNccAa/7ykABhFZD5b60Ql9kPXp
	vsSYUaqpvvlhl9SdUE7V3RKBNb/Q5ySNMcfwIkszlLAorqaaGKM1z9MoPMEuhVNKEwu5C+Eg/5h
	M8x3w5l07ZN7CTaZW13UVL3IN9Y+4XGDPN/KSOGzGn15mrv73k871K3e9lgQEPFosNHBC5ddfKp
	YEDidzJqw/KFLQGo5JyrUIOZP6h8u564OSmTjUtyY7tckJl40Y5P86L2iDNoySGAQ8AGprrWrUa
	D850qqTLwXW9NyiPA5xhw==
X-Received: by 2002:a05:6a00:1c8a:b0:851:8394:1696 with SMTP id d2e1a72fcca58-8562b49995emr32076993b3a.12.1788060315139;
        Sat, 29 Aug 2026 20:25:15 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312146sm2287261a12.8.2026.08.29.20.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:25:14 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
To: willy@infradead.org,
	jack@suse.cz,
	akpm@linux-foundation.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baohua@kernel.org,
	axboe@kernel.dk,
	trond.myklebust@hammerspace.com,
	tz2294@columbia.edu,
	jaegeuk@kernel.org,
	chao@kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v4] mm: filemap: retain mapped dropbehind folios
Date: Sun, 30 Aug 2026 11:25:07 +0800
Message-ID: <ef160933595c365f2c47597b260bc7ecd98ed7ce.1788029516.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829111621.41ed2bc9a0e99e3367eb96c3@linux-foundation.org>
References: <20260820142956.1414337-1-qiwenjie@xiaomi.com> <3fa43eaca792bc0bbde4b82a6c1fcdd3f528b398.1787999152.git.qiwenjie@xiaomi.com> <4aba05e1a2c3b61cb337d373eb9b7a8db4ddd822.1788024049.git.qiwenjie@xiaomi.com> <20260829111621.41ed2bc9a0e99e3367eb96c3@linux-foundation.org>
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
competing cached user, but writeback completion can currently unmap that
folio. A later mmap access must then fault it back in.

Retain mapped folios instead. For a mapped folio,
folio_unmap_invalidate() can call unmap_mapping_folio(), which takes
i_mmap_rwsem and may sleep. Retaining the folio also avoids this path when
folio_end_dropbehind() runs in non-preemptible task context.

Unmapped dropbehind folios continue through the existing invalidation path.

Fixes: fb7d3bc41493 ("mm/filemap: drop streaming/uncached pages when writeback completes")
Cc: stable@vger.kernel.org
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Tal Zussman <tz2294@columbia.edu>
---
The mapped-plus-dropbehind state was reproduced in QEMU. The patched
kernel retained the mapped folio and continued to evict the unmapped
dontcache folio. I did not reproduce the sleeping-in-atomic warning and
am not aware of an existing report.

Changes since v3:
- Describe the forced-unmap/refault runtime effect.
- Record the reproduction boundary and add Cc: stable@vger.kernel.org.

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
