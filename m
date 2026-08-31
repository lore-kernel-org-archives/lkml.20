Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6212E06EF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155559; cv=none; b=cuDYGHUmEifFsLI5xAvT5ik1jrVGfUVihTTBbWOSzrnJhq5hV/puq4vN/Y3XQHuYkzD7VPvsxs5Bl0uoIWlI8bFL0T/lmNyyMAVpFFO4p7ES7+3jb2EkvTFtVpCLTOqsqbwaTf89Mla54FQWdIu6CSu8+WB/SentxgFb25G/7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155559; c=relaxed/simple;
	bh=0CSdVs2rOpUPtxsvgWi/tqxZ6bmT0NQV2Nxrvkdvo4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AXbpD2PK8P2b50PujJj2NX7ZBscWkjgTotRoKhnWk+jFvkoIcHWwY6oVNxAd+EIBcd9yRuGpGeuTaC8IuTw71DwhRFd+BUgq7ILBhnN+EV0mQC0nTMVE6Zh8ll5cDVgb+5/iXsqUfZiJIcXfoNuTxf8n78HQ7qA1T6BIOQlkjWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XEFxXNgb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XEFxXNgb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YolB1joIO/ebiWqo2umkgIcz9Aspns8acyez4gd6RNI=; b=XEFxXNgbd02kYotn8t4e82ITbw
	5O+ggQIeTX06xE2sYVK1Aurcv68h6Ul3pTMKDo9stMxJdhKcj1b+v5sdege6sENut+0vZX1hFEHb8
	sgmuhPPIcMbDnfEGCWFmL8rGjNUEAYpz8qgi+v/tgVa60AKZ73HAeJIxUefwSoiDfLIT8lhMT3J/B
	fiS9P6bdGkoFB4Vu/+6MNxg5xlp6XxKhrAwBDnV+PP6VRebqc6EU2qnbYr+AUR2ztGHoVp3TvLCfh
	8dcs/W3XHbWBWc4pZlV7yB5sG6y9qBGjtWw1qM3TPrgL4bVb3Dw09Z+DudTzBQqfc0iSwSfdGQ+hC
	6mRUCr4Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0uwe-00000008Zn8-3dYU;
	Mon, 31 Aug 2026 05:52:36 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2] siphash: clean up kernel-doc comments
Date: Sun, 30 Aug 2026 22:52:36 -0700
Message-ID: <20260831055236.3457072-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the correct function parameter names and add function return
value descriptions to avoid kernel-doc warnings:

Warning: include/linux/siphash.h:82 function parameter 'len' not described
 in 'siphash'
Warning: include/linux/siphash.h:82 No description found for return value
 of 'siphash'
Warning: include/linux/siphash.h:132 function parameter 'len' not
 described in 'hsiphash'
Warning: include/linux/siphash.h:132 No description found for return value
 of 'hsiphash'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: rebase & resend

Cc: Jason A. Donenfeld <Jason@zx2c4.com>

 include/linux/siphash.h |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--- linux-next-20260828.orig/include/linux/siphash.h
+++ linux-next-20260828/include/linux/siphash.h
@@ -75,8 +75,10 @@ static inline u64 ___siphash_aligned(con
 /**
  * siphash - compute 64-bit siphash PRF value
  * @data: buffer to hash
- * @size: size of @data
+ * @len: size of @data
  * @key: the siphash key
+ *
+ * Returns: siphash PRF value
  */
 static inline u64 siphash(const void *data, size_t len,
 			  const siphash_key_t *key)
@@ -125,8 +127,10 @@ static inline u32 ___hsiphash_aligned(co
 /**
  * hsiphash - compute 32-bit hsiphash PRF value
  * @data: buffer to hash
- * @size: size of @data
+ * @len: size of @data
  * @key: the hsiphash key
+ *
+ * Returns: hsiphash PRF value
  */
 static inline u32 hsiphash(const void *data, size_t len,
 			   const hsiphash_key_t *key)
