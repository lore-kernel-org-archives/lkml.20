Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75CA31282F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114057; cv=none; b=NMpuvqScu7D71ZBk53l74LEdeDQ/M9I3zzcpSKvwd022aoki8demlJHV1ud0k78o8xiy2SrXE9GWJDFFIyzPeYoLRs6B7JgyppV2GYn1MYJKz1FhTuokm6IxRHlt5TSpRNUE3RCkXPRdlsOIeQrWuFIk8NkK1X1tPsRpxDgihMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114057; c=relaxed/simple;
	bh=fbUQbqmMa/yKOEdmf/O6VB/1EdcFnMXyJDrT6AKyp0U=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=LpLjI/HEKgUq4dinM5qOToykoaJvVptgLrPTMCD8f9JQY/ud0L8aAer3jPFAcLtjTtFdARPH2n/r6udAbFhisbQxoOaVCEYmIEutqNz0iUgKTbuvtzIziPkXfcPgex4vGmILa1pieyQDOiePOaNBdRMQIIlkz2qG+yXmyEQsQSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hh6bT5KV0z8Xrrd;
	Fri, 11 Sep 2026 16:07:33 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 68B87Ng4028463;
	Fri, 11 Sep 2026 16:07:23 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 11 Sep 2026 16:07:25 +0800 (CST)
X-Zmail-TransId: 2af96aa3b6bd609-b95f5
X-Mailer: Zmail v1.0
Message-ID: <20260911160725440VlRXkblhz6f7GJgQfbVv3@zte.com.cn>
In-Reply-To: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
References: 20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn
Date: Fri, 11 Sep 2026 16:07:25 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
        <surenb@google.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDEvNF0gbW0vcGFnZXdhbGs6IGRlbGV0ZSB0aGUgdW51c2VkIG1lbWJlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 68B87Ng4028463
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 11 Sep 2026 16:07:33 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA3B6C5.001/4hh6bT5KV0z8Xrrd

From: Xu Xin (ZTE) <xu.xin@linux.dev>

The member vma has never been used, we should delete it

Fixes: aa39ca6940f1a ("mm/pagewalk: introduce folio_walk_start() + folio_walk_end()")
Signed-off-by: Xu Xin (ZTE) <xu.xin@linux.dev>
---
 include/linux/pagewalk.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index b41d7265c01b..1c397be0d092 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -183,7 +183,6 @@ struct folio_walk {
 		pmd_t pmd;
 	};
 	/* private */
-	struct vm_area_struct *vma;
 	spinlock_t *ptl;
 };

-- 
2.25.1
