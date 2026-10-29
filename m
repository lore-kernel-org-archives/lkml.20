Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265568;
	b=B/6aRM4RCuZi1h+xYrYKX/khOidxbDeULHW3yKaUbetWVA8wzwx5+vofokfstvLI234b
	 H2NNuseUSURHNTkez8/vRmMmU5d+5LzT8CcRqxFZsPsKi5Sz0afQOts+39oAwcW3StDoM
	 2V/ILJssuStiBFdYoabG2PhZpEXfp1eld+UQQqCsAVJA5soxECcVuRS4D/+Xh2xVwU9wk
	 73eqNIqyVA314zTb8vSoez4wXP/GUJIwthoScsnJSKXnzuMka5kSvJxda56R4MQ2XZUH5
	 MRaU0gsi3zLDwbjTvo0HL7W40sbUe3vn9RoLR84/tNsVfujH8ciZYEfl1H194Akt0sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265568;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=wc1cCegTsF419DOZKQ+etFEgEn2COXujDpdlOtNxm70=;
	b=OCKU8APP1UUNlugq0SFjZZksABotjoJoPWtSp1MQbJXFFJ4C6Ep3s/xAdRRnH4eJ7vqs
	 aQavyB/w/L//lmxWntVfS2nQZqTpDqb5UCF21JB+uPpbjswLImObSDTAUZTDDffgjACm6
	 GJSUhZQbkQi53XPoZNEqTKrpNkGfkIsK7KYAcEBw4DRLIOsuJ/XinJjDynpfSonfUCOJo
	 3RvQli7VPSDiHaQRInxgP7swcAQsw8ca581YpK43wGdi1vvcNTsa2iu12c4WwjjAnoxB1
	 l5AV3dJmI6xdnIyj3Xe1DRNtBpQwyhQZIr0j9NO2AF8pcHEaZa2ngETSV/I4wKzlo2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Feb8Y+6Y;
	arc=none smtp.remote-ip=91.218.175.20
Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D696D606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D696D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Feb8Y+6Y
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Afj/DxHItcSs+lti4Qv2oWzmWeorYwqYqELX8olihxw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793265560; v=1; x=1793870360;
 b=Feb8Y+6YWSTPiNXbfR9zgxSHIK2u9HO9kpPPqQ9klyeAYytpYUOSUcuJBW6vMvI3qncwvmCp
 olZchMsQwEAG1taCYCV5pjQgvg/WOp1JApmuduEEG3fVjd4Zgr3Vns/C+77FHIgZiOt2LzPkN0l
 gPKmnynPAXSWWQLM8eYiq+JI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ee0a28769bc6ca81;
	Thu, 29 Oct 2026 09:19:20 +0000
X-Mizu-Trace-ID: ee0a28769bc6ca81
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH v2 0/2] mm/vmalloc: harden remap_vmalloc_range_partial
 against NULL pages
Date: Thu, 29 Oct 2026 17:19:06 +0800
Message-Id: <20261029-vmalloc_remap-v2-0-c4705cbf26c2@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAIoP42oC/3WNQQqDMBREryJ/3ZQkSI1d9R4iJcZv/UWNJBos4
 t2b2HUXs3gw82YHj47Qwz3bwWEgT3aKIC8ZmF5PL2TURgbJ5U3EsDDqYbDm6XDUM+NCmi4Xyki
 tIG5mhx1tp6+qf+zX5o1mSZLU6Mkv1n3OwyBS7587CMZZU+iSF0rkWPLHQNO6XVsMUB/H8QXiG
 qFavAAAAA==
X-Change-ID: 20261026-vmalloc_remap-012cf418c2a8
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Mailer: b4 0.17-dev-39d60

remap_vmalloc_range_partial() passes vmalloc_to_page()'s result to
vm_insert_page() unchecked, oopsing via page_folio() if the page is
NULL. The NULL case never happens today because VM_USERMAP areas keep
every page mapped, but that assumption is nowhere checked.

Patch 1 drops VM_DMA_COHERENT from the allow-list -- a dead entry (no
caller maps a DMA-coherent area through this path).

Patch 2 fails the mapping with -EINVAL instead of oopsing if
vmalloc_to_page() ever returns NULL, with a WARN to mark the broken
invariant.

Patch 1 is a behavior change (no in-tree caller affected)
Patch 2 only changes a failure path that cannot be reached today. 
The two are independent.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
Changes in v2:
- patch 1: drop the vrealloc-shrink justification. 
- patch 2: fail with -EINVAL rather than oopsing.
- Link to v1: https://patch.msgid.link/20261026-vmalloc_remap-v1-0-b7a907814e90@linux.dev

---
Ye Liu (2):
      mm/vmalloc: drop VM_DMA_COHERENT from remap_vmalloc_range_partial
      mm/vmalloc: reject NULL pages in remap_vmalloc_range_partial

 mm/vmalloc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261026-vmalloc_remap-012cf418c2a8

Best regards,
--  
Ye Liu <ye.liu@linux.dev>

