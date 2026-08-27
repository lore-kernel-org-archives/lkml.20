Received: from mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC7E1EFFA1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815153; cv=none; b=FUsIJl5cWhbOhT5kwRgSFsXpCmkJoffbonR5TxSwxKEp5g1WXTk+Mk6YYPy5LrBFUoCxDHCdjQIUSQgh7qxrk7618D9gSA0qzn42TYP6LvlyDxlTfCPQbnIPwhiIyl+rZy7pjfto091nCKsg91ER6PZrPS5JLeG3WJTZ0PQMX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815153; c=relaxed/simple;
	bh=HN+3sbUNbycWz2IO1Ch0ptieDL2g4IBu4VoKtwdN7hM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=REG2Ix98UFVb5e/jmCNmoxTYduXGoeucE1tmyiCh4exP8KEuEAruEYR7ECvnDuKs99vQae7h5KjZM7DbK5hVqFkJljq5mhIMyYH+NAYiw9e2f78PZ1LLyhFCk9+SXHy+zxVsR0J2JI6T998MOWsGIYRUzglbevV5FXDnalEhpHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YVkW448i; arc=none smtp.client-ip=91.218.175.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YVkW448i"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HN+3sbUNbycWz2IO1Ch0ptieDL2g4IBu4VoKtwdN7hM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787815149; v=1; x=1788419949;
 b=YVkW448idKOe+POBziPtzwnC4ioTs+k1elyy3bZse34SLLX9GHZddetXbGMs5gHIICC/q46/
 hWsNvEnZOtCO2F/TV/rQU7cnwVFyRWzjDEpMQjDvyV+K1cbbVTlXvZWV3E5jtLHwHYR0u0pRomM
 UhPA3LC9neOutfr0CkAj/csI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from fedora (117.129.78.49)
	by smtp.migadu.com with ESMTPS id 2886061bcc752116;
	Thu, 27 Aug 2026 07:19:08 +0000
X-Mizu-Trace-ID: 2886061bcc752116
X-Migadu-Flow: FLOW_OUT
From: Hao Li <hao.li@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hao Li <hao.li@linux.dev>
Subject: [PATCH] mm: remove unused anon_vma_trylock_write()
Date: Thu, 27 Aug 2026 15:18:06 +0800
Message-ID: <20260827071845.17636-1-hao.li@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last user of anon_vma_trylock_write() was removed by cc22b9978509,
leaving the helper unused. Remove it.

Signed-off-by: Hao Li <hao.li@linux.dev>
---
 mm/internal.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 68db5abd0a4c..9069013d191f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -298,11 +298,6 @@ static inline void anon_vma_lock_write(struct anon_vma *anon_vma)
 	down_write(&anon_vma->root->rwsem);
 }
 
-static inline int anon_vma_trylock_write(struct anon_vma *anon_vma)
-{
-	return down_write_trylock(&anon_vma->root->rwsem);
-}
-
 static inline void anon_vma_unlock_write(struct anon_vma *anon_vma)
 {
 	up_write(&anon_vma->root->rwsem);
-- 
2.54.0

