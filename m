Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200278;
	b=ZCnF0CQV9rdoa1oL4L8ynxU8snD63VouWX+lP5j1ih2O2zFMJfRmoMgm3hV4ze5cAbJE
	 uMjYQOq5uo9quXcG96FzkFxcRF8XG+GesweLBs+Df5i2S1sJS3+CwML/9LOImF5d50yOc
	 Gg72BLZLyeiCzmVXecL4gkkur0tf5+uD3mIZg4d6zfnG22hD/MoCxCMdb7VBzyIc1x66W
	 75nX2W3pn9/YVBtlYcgEKBqj6Nw5VdLHS93l1MlZg/CeziI86XkuW1jFUIEpcZ6znUvyZ
	 UcuhQAPetTCjH6rvgCR8PdWK1rPfLXCBx/PaeOKUXGpLcmPbPa/UgbzWFWH7xMvWKJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200278;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=HLxZXNfPTv47IAoItk9WdBgYZhfyCgUD1in+scYfeQw=;
	b=WA/F50S4M04PHo/VPd7pGsp5nEQF/7p45rFoDGA1virB1oaQpywduSz3JU/3qs8GMlvj
	 bRWQmiiiGRU5hB2OfLB9OepaQ7Jv1tzlI7WUp1JLNoRWMDYAABw7ecE1pRwnszSCo+mO6
	 9a27n5oh0ALtS38u3jxXpsmqlB6ql6hm+wtnWK6pHTG67jyYGdEzqbaECjkIbpJkxzofJ
	 gTVgdoyg392UkEEbDKOAdfV6yjM4Sm3YtXPqL8z0xr06ijIsuYUwfzCFJYjxGgOW4siUW
	 X66Qm3Q3MbiWDCXwsrvJidPwifL60gg+W2/cPwo4/aKJEU5JY0Jc44eTyq2KIjjvlYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=arhbvq5i;
	arc=none smtp.remote-ip=95.215.58.56
Received: from mta1.migadu.com (out-56.mta1.migadu.com [95.215.58.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F26606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=arhbvq5i
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AVMHI6NGvrOTgLavdIBomZBMmUsoL9IwqYMKcULv7RQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794200274; v=1; x=1794805074;
 b=arhbvq5iryzp3wWhcyFthvCCDnJQkU2g2TrAVwdzMS77rvy7uozkomtob29TF/7YseEzgwnu
 yRMUxweHWdJ10tYE7RTlxB50H3jNKHjmzTDzZmk8DgPMDxSdqSgxolgF8DqLh5fMAtEQOqjtRsN
 AdLWydruavuQX19FxmpsYccM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 379fa3da46e5efbb;
	Mon, 09 Nov 2026 04:57:54 +0000
X-Mizu-Trace-ID: 379fa3da46e5efbb
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 12:55:47 +0800
From: Dave Young <ruirui.yang@linux.dev>
To: akpm@linux-foundation.org, baoquan.he@linux.dev
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Remove myself as a kdump reviewer
Message-ID: <avFSU0f0aE-amdls@darkstar>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I do not have enough time to review kernel patches though I still
accasinally scanning the patches. Drop myself from the reviwer list.

Signed-off-by: Dave Young <ruirui.yang@linux.dev>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e9fe9c2a39b..7e18fe93d4f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14145,7 +14145,6 @@ M:	Baoquan He <baoquan.he@linux.dev>
 M:	Mike Rapoport <rppt@kernel.org>
 M:	Pasha Tatashin <pasha.tatashin@soleen.com>
 M:	Pratyush Yadav <pratyush@kernel.org>
-R:	Dave Young <ruirui.yang@linux.dev>
 L:	kexec@lists.infradead.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
-- 
2.51.1

