Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907474;
	b=c31KnBy8xreuZVXeP5zYBrMLqf2DmTxFsd9Um/nSvYLWlaQXiz2MM2KQeoK4TiWZ/K80
	 lsxoygINR0b9GVqRVMpIndelP0TY2xfJourLRMYGnWqpDWo9tJkJdDOKMd1iMAJb6NQ3U
	 2WY/z0OXxgwPxsAXDkX8oq+C2x35WLRD3c5QUmIYvaRy3ytqMN8Y9Y+1meKk2M4uIbRyL
	 B26xmSA9sq4YBrKOJX/89r1hiKQCY4IXxnXF9KIjkOcYMOPhDzqw6GqKb6kWZgjq9PrBq
	 PjhG/eyHFdUAas5ASadyvBsl9Yw9Mt/R2KQdhX637j2ZwYTak3X6rdf5HZfAgb9Tl5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907474;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=SXzizJh/I1z751B/WWLKsF4keqjuniSUyB3NsIxFwnE=;
	b=xokBDFMbeLPrQA1so+cLfsbtU622erc+CvOneDarmRdCM8gKVWQr8EUvYI8mo668LJqr
	 AMSWhg9beTDwelDt3rOWGwheGm5b2Q+lQuf2/vNFpbx7LYyhg/T1dQIhImSalr1cQWwn5
	 7lzBN8kyAOl3c9h3c2Thb2SWX3l5NqksAKWdOv9qLRXPJ+3OB7WL6X0AIOFuh3Z8U+wL3
	 EAOwBGIrFKstvj4h2KBJxuAfLSG0z9gFWJA+vgMCtSazzh72t35fMYEQVazafEbQAXt1l
	 1IjudkMOtNZv80pyte1qFGgdM7JTfnTJ6ZDZpTSqMFJlUsEqF1/1RtTEEwm64mMJvqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mdzett+m;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE888606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE888606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mdzett+m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=SX
	zizJh/I1z751B/WWLKsF4keqjuniSUyB3NsIxFwnE=; b=mdzett+mmztmgU3zIg
	ZPISE9LCttyKWPVrwTkKzUOF6+9dggo7GtRt8qzl8oNRJ9iJAONibAulthW1uGEd
	M/U+pPgKA1Zo0oB3aBsEISyQF74G3TADLn2WfcwZtPihuP3IZnBvz13pI14sTynF
	2mzGvQ3MzxZ7B2arvU17HKMhY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3fyIIHfxqgOjrIA--.26565S2;
	Tue, 17 Nov 2026 17:23:22 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: ksinyuk@kernel.org,
	elbaz.koby@gmail.com,
	ogabbay@kernel.org,
	kees+treewide@kernel.org,
	haoxiang_li2024@163.com,
	oshpigelman@habana.ai
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] accel/habanalabs: add missing unmap in map_device_va()
Date: Tue, 17 Nov 2026 17:23:20 +0800
Message-Id: <20261117092320.1267136-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wD3fyIIHfxqgOjrIA--.26565S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWUKFWfJw1fAF15Cw1xZrb_yoW8Zr1xpr
	WFga9rKw47WrZrXFWUJw48Z34rJ39YgrWxCFy7CasI9as3X342vF10yFWjqrW7CFyxC3Zx
	ArWUJw1kWayrAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEJPE7UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7gojkWr8HQqU9gAA31

If MMU cache invalidation or prefetch setup fails after
map_phys_pg_pack() succeeds, map_device_va() returns the VA range
to the free list without removing the device page table entries.

Unmap the page pack and invalidate the MMU cache under mmu_lock
before continuing with the existing cleanup.

Fixes: 8ff5f4fd40df ("habanalabs: handle MMU cache invalidation timeout")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/accel/habanalabs/common/memory.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 2f76776b4039..6269f9371426 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1195,7 +1195,7 @@ static int map_device_va(struct hl_ctx *ctx, struct hl_mem_in *args, u64 *device
 				ctx->asid, ret_vaddr, phys_pg_pack->total_size);
 	mutex_unlock(&hdev->mmu_lock);
 	if (rc)
-		goto map_err;
+		goto range_err;
 
 	/*
 	 * prefetch is done upon user's request. it is performed in WQ as and so can
@@ -1205,7 +1205,7 @@ static int map_device_va(struct hl_ctx *ctx, struct hl_mem_in *args, u64 *device
 		rc = hl_mmu_prefetch_cache_range(ctx, *vm_type, ctx->asid, ret_vaddr,
 							phys_pg_pack->total_size);
 		if (rc)
-			goto map_err;
+			goto range_err;
 	}
 
 	ret_vaddr += phys_pg_pack->offset;
@@ -1225,6 +1225,14 @@ static int map_device_va(struct hl_ctx *ctx, struct hl_mem_in *args, u64 *device
 
 	return rc;
 
+range_err:
+	mutex_lock(&hdev->mmu_lock);
+
+	unmap_phys_pg_pack(ctx, ret_vaddr, phys_pg_pack);
+	hl_mmu_invalidate_cache_range(hdev, true, *vm_type,
+			ctx->asid, ret_vaddr, phys_pg_pack->total_size);
+
+	mutex_unlock(&hdev->mmu_lock);
 map_err:
 	if (add_va_block(hdev, va_range, ret_vaddr,
 				ret_vaddr + phys_pg_pack->total_size - 1))
-- 
2.25.1

