Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994976;
	b=Q2cDHHeDVfV7NU65H18svkYkKtEDhkyU9QeLizgjGNwZQVsB/SLivvWf5DBbytVgoM3/
	 kby0d24KhEYbJ/lcxiggUfETXkRBcsskT8VZVQxKxxJKNvkv79YNhzj26RyUdxpt4VmjY
	 ZaSEcBrkbzCdPr/InO3mQoIcKJmYjfEn4p+XPJobO2AXHtp8xUmGRLwAhq9JuZW9qfMIY
	 OdQzmEO8fvJZXu/M51i5+9YiPxqxpL8YG1VBbwFu1GejwovIXSkkZeyW/n2ll0zX6WD5C
	 SLLf5hPrEZe/AsVDAFrSMPIbx6WoBFeF8lw2WFAulhzmGQdIBS2etJqFuUSS7Xh10kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994976;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=LRO5qjnwALlrQa/AL5APisjMR4z2O+zqds9mzHpxSAU=;
	b=m4DNZiG9ZbnHz7uoobEYM5kaYFdEmZrdowlNDMTGeSfyv4Ts6Yi9hdrCqcAcaw87DdvY
	 Ndvb1Lt4o8Oc8GGY8alamGmdsKjheDe3kerimra5O18eYONbWHtL/5eZEpjI8V9GM76sk
	 RMR1EPzN7ENEE0hG81sBRd8eyA2yP8j3OK8mpvM/znjxv37aWyQZNhQj3v8SCEoKrfPSX
	 OUzUDdAoBB6ukf78ojMIIMX7+gXcGYF7EUJCvCn0aH8R7Qh1uWNUsyko9hKf2Df0iaSu1
	 5MsFIbI4meeAJ9P/fgu+DWODDzFe57QJ31YPb4qq/oVZ+YA4aBDF9XIsrEtY52ObMxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="nOLT5lV/";
	arc=none smtp.remote-ip=95.215.58.201
Received: from mta1.migadu.com (out-201.mta1.migadu.com [95.215.58.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DC0606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56DC0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nOLT5lV/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uaY+B1fHFP1ahLgB0T3Rk+kqqo7Xd5Z1Iz1h35K6LdY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792994973; v=1; x=1793599773;
 b=nOLT5lV/D9H6z5XSR8y/VBJHt9xb7rxn1Z396Z4ctj1Qx+3WlSkuu7qB7kprGEaCjpVxG5O0
 g63D+Y6IXTEQ0m6kpw/R4QsWnvFKeGTU1ZKVac/bkMOpFYTxgfPtfVEFNtAjMfxHkBSF8+hJDIN
 tXteDGLbnNHuSJNOb7pJxah0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 530052733c7de91c;
	Mon, 26 Oct 2026 06:09:33 +0000
X-Mizu-Trace-ID: 530052733c7de91c
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Mon, 26 Oct 2026 14:09:23 +0800
Subject: [PATCH 1/2] mm/vmalloc: drop VM_DMA_COHERENT from
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
Message-Id: <20261026-vmalloc_remap-v1-1-b7a907814e90@linux.dev>
References: <20261026-vmalloc_remap-v1-0-b7a907814e90@linux.dev>
In-Reply-To: <20261026-vmalloc_remap-v1-0-b7a907814e90@linux.dev>
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
translation of ARM's VM_ARM_DMA_CONSISTENT. It is also unsafe to keep
since commit 5ea8ec74c57c0 ("mm/vmalloc: free unused pages on
vrealloc() shrink"), which frees tail pages of non-VM_USERMAP areas
(VM_DMA_COHERENT is not in that skip-list): a shrunk-then-mapped area
would hit vmalloc_to_page()==NULL and vm_insert_page() would
dereference it unchecked.

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

