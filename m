Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674828;
	b=igbWv0PrkIsmDOozajf69oA5kFum0CPC4i/7XIgJUmKR4Ca6zdsR7xHsedB8za3ZA4Gf
	 W6OMH24mCQBkMfvr5AGs7pTN+dt+HdJckzK6ivgx2wmd2hyPDO4fgJ7c2mERZgXUq+9aW
	 b46fUmnzV/Xq3Em0BeTrnMhelUGvy+Qu6b4htUsYKZIHVatARbO7E12ZtEbvf8dSED7ye
	 bc+aTzeua1YYSnlD/XcUEarbWniURKlE1o36flsNQtWxPswm/DKEcXQwPsz6R0mQ+3mtM
	 SMewl2xMJ5chHDP4XKjMCUW4n4AmX91irNb69EvXX36mdcuR8G3JZ2tfgmuupTWCEiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=f9lkg5AV718yKRuUDbng7AhiBPUBTF5d9AC5RxltnpU=;
	b=XWaQWVumFMltsi4OH5nv8sdbVwYHY6K0XO7tsB7xYFfhBQCGGA5MS5M5360X+gi3T24T
	 tDbll5r7MvalR5VEW5DV/S38jlrnzH2lRyAG00Nh+qSdG4Mgbay8PgcW43MwfdBGOvoK2
	 eNkcDeDkDBZFcTt7Sn93H5+DtkG3fioiZ+oEw+XLytUcuphD+uF38fHoO0hrlh83FJjFv
	 vZ5MaqDwdErmqUw1jvwTpj09iAWTA0PHuShDhUpHneEDLXHzRVQAT03TUe25ghkdPiQ5h
	 McTghaLvE6XVJtvsXXY92mMF/QmAxXOS23tRERGuufVQ9ykm8HKY8Pk2+4UwaZdeLww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=vhq7gym0;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C047606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C047606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=vhq7gym0
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jRg5P6lqJz5BNRx;
	Sun, 15 Nov 2026 00:47:05 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794674825;
	bh=LS3poxthHIQDOPkfmHKkqMcC+PRkH+aQtxDBHIIAQ6s=;
	h=Date:From:To:Cc:Subject;
	b=vhq7gym0cPm10dacpHkPYLUq47YPLV6jbU27ba1Tv9OpdJBWu/NKpHQWenqVfjzci
	 46lrYsFX9cQXrd1vEp2Whb4JGHW6uBbaR1VEdgAARVmsXIST/nYIQ+besmq5hUlIl0
	 RrI48zBQLHVGgYluriY2SVd1aPjTMetgeeK6s7QsDPw5AmE7nttyHh05ddoT/h8+Ml
	 3RWZL+WarbkOKURce0IAuBlMnv74Jgs3em+IUSyLWROFD0CY/KsQYOmVgapRpV+7cf
	 79Rs4IbDYEGJ2poK2o+LZfvMll++1YE1bxS/JPgB7mcke0hbPncTTRGK1aaSSzzbZE
	 mMYmf0w4i6iaw==
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6AEGktnb089520;
	Sun, 15 Nov 2026 00:46:55 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 15 Nov 2026 00:46:57 +0800 (CST)
X-Zmail-TransId: 2afa6af89081cd3-30ca3
X-Mailer: Zmail v1.0
Message-ID: <20261115004657890Pz8ERDf5nCtE-B6M7KFzu@zte.com.cn>
Date: Sun, 15 Nov 2026 00:46:57 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <akpm@linux-foundation.org>, <david@kernel.org>
Cc: <linux-mm@kvack.org>, <liam@infradead.org>, <vbabka@kernel.org>,
        <rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtbS91dGlsOiBmaXggb2ZmLWJ5LW9uZSB3aGVuIGNoZWNraW5nIGZvbGlvIGluZGV4IGluIHNuYXBzaG90X3BhZ2UoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AEGktnb089520
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 15 Nov 2026 00:47:06 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF89089.002/4jRg5P6lqJz5BNRx

From: Shao Mingyin <shao.mingyin@zte.com.cn>

mm/util: fix off-by-one when checking folio index in snapshot_page()

snapshot_page() computes the page index before copying the folio state.
If the folio changes between those reads, the index can equal the copied
folio's page count. Valid indices are strictly less than that count,
but the current check accepts equality and marks the snapshot faithful.

Use >= so that this inconsistent snapshot is retried, or falls back to
the unfaithful single-page representation. This also avoids reporting an
out-of-range folio index without the corresponding dump_page() warning.

Fixes: d863a12108f2 ("mm/util: introduce snapshot_page()")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Build-tested mm/util.o with W=1 on x86_64. The boundary check was
reviewed statically; the folio-split race has not been reproduced.


 mm/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index a5140b3b70f3305cd78144a54d3b15a794da9609..6e6a8f8640a75ebb0f81f54c9a5085f698320714 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1462,7 +1462,7 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 		set_ps_flags(ps, foliop, page);
 	}
 
-	if (ps->idx > nr_pages) {
+	if (ps->idx >= nr_pages) {
 		if (loops-- > 0)
 			goto again;
 		clear_compound_head(&ps->page_snapshot);

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.43.0
