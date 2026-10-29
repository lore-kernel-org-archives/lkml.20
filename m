Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265570;
	b=zskMixa8aBtqLJl/CdDFNwEuZ0Q9eHBEfKauca7d1j3s3XcOok/ASHWfOm9dAicvyJ2E
	 5isHuZeTZXE5/FFu2F8foc6mbeGrOg1plJqXFyUscCL6LCq1RcxdbdTnf4Lkxf8+lBrGp
	 8UbXJmdvGrEUQSD1ttcApN4RqY+A2wuVvq62MotsllyiONr4qfymtZTxD2v9mvnFUnn6H
	 i+25FWR1QmlM0jP1ta7SvZEenOrlX+05Og9Fs9BoFWQ5FZ845bUgo/mEm8F45dPvfj+Cg
	 LHQIO/FSSkgozPB3rK3Edn+lgi1fZVuN+oB0HlFuG1prY/DN01qhE1Gdkk8vgsa/x0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265570;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=B1+HNg4GxAnYIKh4c9wgbbtWDKA59dTO5M6YtuRoSCM=;
	b=YIlLlWWM0wjZ8J5EqjmjAWdR7XTAIOoumx1OCmE/SHZFWqG/AMs+9p7jkxKtk9W0OMb9
	 vIXan6VELnV9xugtG1KxQaNXpULjH9fxe8nL5qgswrug0amjlaBUIraVZK8132FuqaO17
	 3m3/9l/dHrHWnIiGE25JIzJELMpak0IDn1pOLk69O5MssPp7XAUQIAuQM49gztm9DKlM2
	 jSwiaV1q6PwqPT+V1VH6S8UIfNXv/BSwDAkRtITfBXvE9OrblP4rPCWlUvjKDYqdsgWt1
	 WddqEEoYyuHv3ZRi4CpF9+KcKsM4qUzhKeTtOTga+javZTvsYKmag2r2hGEnUkngK+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TIJj5UHr;
	arc=none smtp.remote-ip=95.215.58.13
Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5047F606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5047F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TIJj5UHr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=f9G3wbBJcJEnE9ab3Vc7C6KZ4odr0LAbZB5DXG/9MZg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793265567; v=1; x=1793870367;
 b=TIJj5UHr50AuOCWtV9yYJmlh4vTn6S2QrFOeZzf1tSW9N4+pmgHLntBoIfb+0W4XIrPjm72y
 hNDY/1Db44uOE7TYgrvnrFks8dXzWdST9bHz4uyIuRBdNVf9IrljVBysVGnTbKLei5Kfl9L1pSR
 /bd7bbvYDD2rZLD0puVlXS0s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 80beaf41a08f849a;
	Thu, 29 Oct 2026 09:19:27 +0000
X-Mizu-Trace-ID: 80beaf41a08f849a
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Thu, 29 Oct 2026 17:19:07 +0800
Subject: [PATCH v2 1/2] mm/vmalloc: drop VM_DMA_COHERENT from
 remap_vmalloc_range_partial
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-vmalloc_remap-v2-1-c4705cbf26c2@linux.dev>
References: <20261029-vmalloc_remap-v2-0-c4705cbf26c2@linux.dev>
In-Reply-To: <20261029-vmalloc_remap-v2-0-c4705cbf26c2@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.17-dev-39d60

From: Ye Liu <liuye@kylinos.cn>

No caller maps a VM_DMA_COHERENT area through this path: such areas
come from dma_alloc_coherent() internals and are freed via vunmap(),
never through remap_vmalloc_range[_partial](); all 13 callers pass
vmalloc_user()/vmalloc()-backed addresses.

The flag was added in commit fe9041c245196 ("vmalloc: lift the arm
flag for coherent mappings to common code") as a mechanical
translation of ARM's VM_ARM_DMA_CONSISTENT.

Drop it so DMA-coherent areas can never enter the path.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index db669103dc66..a888eca016a8 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4894,7 +4894,7 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
 	if (!area)
 		return -EINVAL;
 
-	if (!(area->flags & (VM_USERMAP | VM_DMA_COHERENT)))
+	if (!(area->flags & VM_USERMAP))
 		return -EINVAL;
 
 	if (check_add_overflow(size, off, &end_index) ||

-- 
2.43.0

