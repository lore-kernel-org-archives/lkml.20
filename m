Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265577;
	b=X7x2/fGlSgyWCup3sDFtEdUSEOmweSQY38Rf5wdP9SUn2RleMOm9vmI8YByCsn3sK7FE
	 ZFU6FynZAqkJ0vXyNVL4NccAgif9Qpv1l0NVG2BZczaoK8e+x5BWIfgbJ+mfFjuV045G4
	 C11R8EfKTTXmcmpwJKzW8oAcB6gWL0x547kryCq+sgRwfOp0CerrIsbsqmv0X+z30BsFd
	 S1a11Id6Blbsuse5nAjFYdBYcoCxt95IDPnqjxcjzgX6UV96hFzvAeuODRofwfN7fH8Wq
	 4kMyuP1PdBip8alAUolU0M98UtkWGu49Oco8sFjyTMAZHMbT2XG5rn3kdXocCRbCVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265577;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Y5DqlsJSx2CSlkUE3Z3n+eOvU/xLg1QHNnFKNsbZwxk=;
	b=x/RLsPK/AFvEh4NEeGE21Nl+NVReRbsh7Xmm9NlfRCYF4YZDEpoWqpmQm+wjkmsiDLPr
	 /5O7YAbVWzrjkIlvNJeEOEjWB05E/ZOEiXhStrJ56szw+gkzd1+eRKXjJGFZQeANWrSnM
	 YbiIzXUqrCz/mF79RlJ3wwawOzM6HmjWPa4nbggLmxk1wyli/SPdclYpPrTTn6OC/yyLy
	 q3+cuABDqMrL5Qs0gdkSWcTr3vXF533Uj+60igRohwdue8JgwWzHPalLDHUBVoN+LQXM+
	 uJ3ScgJ+QtNXIE+5hda/IKbglrdF0OOwtC7M4yJtd5vjH8fNjKPfNP8lx69j85fAN/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SAgxGMu6;
	arc=none smtp.remote-ip=95.215.58.22
Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9267C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9267C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SAgxGMu6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=x+a08qcEFqHo1AnX2XXnBe1LfbWeC5gjyBYD6IqL6uA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793265574; v=1; x=1793870374;
 b=SAgxGMu6K35FpvtoFJPfIi1yqhcDA5ylbYtXeldUjoSuZy4yzEg72HQie0vwuFbccfXNSVl1
 LYm2+U4R9uSQCmrE8Thtqh8MUjmf+HzaK2rGbqan4EOVlipx7/RruguDTkCr9rEiFLb/md9sKLq
 WBDBOIFEX8BY8I7a7jQ1/oxc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2165cf4afd9a859f;
	Thu, 29 Oct 2026 09:19:34 +0000
X-Mizu-Trace-ID: 2165cf4afd9a859f
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Thu, 29 Oct 2026 17:19:08 +0800
Subject: [PATCH v2 2/2] mm/vmalloc: reject NULL pages in
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
Message-Id: <20261029-vmalloc_remap-v2-2-c4705cbf26c2@linux.dev>
References: <20261029-vmalloc_remap-v2-0-c4705cbf26c2@linux.dev>
In-Reply-To: <20261029-vmalloc_remap-v2-0-c4705cbf26c2@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: b4 0.17-dev-39d60

From: Ye Liu <liuye@kylinos.cn>

remap_vmalloc_range_partial() passes vmalloc_to_page()'s result to
vm_insert_page() unchecked, oopsing via page_folio() on a NULL page.
The NULL case cannot happen today because VM_USERMAP areas keep every
page mapped, but nothing enforces that invariant. Warn once and fail
the mapping with -EINVAL instead of oopsing if it is ever broken.

Suggested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/vmalloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a888eca016a8..dabef40ea88b 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4906,6 +4906,9 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
 		struct page *page = vmalloc_to_page(kaddr);
 		int ret;
 
+		if (WARN_ON_ONCE(!page))
+			return -EINVAL;
+
 		ret = vm_insert_page(vma, uaddr, page);
 		if (ret)
 			return ret;

-- 
2.43.0

