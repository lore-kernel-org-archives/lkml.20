Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1772F388878
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655951; cv=none; b=lgxx3Sjw3WGcC2ipBoaXmFd5m9YGmLGot7gaxPCDyrVzO9CZcVgI9aaQ8Ui5l1NBSEfuYnrDJZX2zolAbn8pUmpkICwZIafFmDM4DVITQfaE/Xi4Zi6kMHAVPmZY76HYxDQDaWJXgm5A5ZvlC4NqJ4fLML55tq/RF7iUAVfUoi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655951; c=relaxed/simple;
	bh=JaFCtyi9VkweTcGW28w5rCbbcG6JSGToPKStPEdMDG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XYsnYYh1hTDdmcqzh7aTK/nKJ+89QdqBndJsiIZ9kmMYDk+yTCCOmITb16DsVSnE9nYqivluRVjMLlbWuojKlRxUvZM4o3graXsj5/HzlCk04SKRPTRxdL0/Lrs/u/DBpfrz/+612eF/o1EBsxJGdNE3j/O32tyLkLVszH3njLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CR5jnixh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CR5jnixh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01931F000FF;
	Thu, 17 Sep 2026 14:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789655941;
	bh=lHHjKoaSq2HBbTkAbPc3XRp+rX0Hl+xsP4u5uRKYsz8=;
	h=From:Date:Subject:To:Cc;
	b=CR5jnixhvVW0se6uYO+n+x2GwSIu0n/GIaOJF+mTfqkmcPVcd+rLF69JIu7HY3B18
	 RIVaNvCXQgmOG0Mec4NQByb7wNDy8WcGyn9U1C6RB4VLAQH50tPX+yuz/alyvFQL3+
	 UCB0uy6+zddIOLZxjafgGfSyeRQV4CnMpxeHxIvpQHsTWACfduaM1o8Q7dGLjBFF7n
	 RhyH3WfowaQvA0jpG4gbDQ+fLk24fbkdEBcbtgNqobkOwgUz8IzQeZpBh4izWI2E8X
	 PKvGy/emMi6AjVmthPZVdWB4AByMib+yTQX0eHrPPH+lievwYFGgCO6L+XuPcKZZ8N
	 pTw5py5FOnrhA==
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Date: Thu, 17 Sep 2026 16:38:37 +0200
Subject: [PATCH slab/for-next-fixes] MAINTAINERS: update slab.git URL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-maint-slab-git-v1-1-d21a5210aec9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGz7q2oC/yWMQQqDMBBFryKz7lATidJepbiIcaJT2lgyUQTx7
 sa6fJ/33wZCkUngWWwQaWHhKWRQtwLcaMNAyH1m0KWuy4dq8Gs5JJSP7XDghEYp5ypTV0Z7yKd
 fJM/rP/iC07r7KWKgNeG1t5ckc/cml8407PsB1vpVC4cAAAA=
X-Change-ID: 20260917-maint-slab-git-511cc356352f
To: Harry Yoo <harry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 linux-kernel@vger.kernel.org, Hao Li <hao.li@linux.dev>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085; i=vbabka@kernel.org;
 h=from:subject:message-id; bh=JaFCtyi9VkweTcGW28w5rCbbcG6JSGToPKStPEdMDG4=;
 b=owGbwMvMwMG4+8GG0kuuHbMYT6slMWSt/l2/3vTwzJD1Eo9UVRXqdi50PdXG3xWekujqtfTa+
 QnzTj907mT0Z2Fg5GCwFFNkqd59wlF0prLHNA/fjzCDWJlApkiLNDAAAQsDX25iXqmRjpGeqbah
 niGQoWPEwMUpAFM9TZWDYeL68CqZL8vFD3ioyjx7u8cq9v7rl8pTTL8tOH9QMWj6hG2uT94mThL
 SiwnonjXdP/7dEeuydY9eJtrfNHPqdbo/qeRp3KRDfCwlO3Pe9td/c6/t2VNbw1W1d43I51sPep
 LTb8z+cJOps6rRzaFx8+/NjqqhaXzP+zf3rlR51KHfcE9B5vGnLpnGVbonf2nKbiyNqX6Z+1+o9
 oKetOZZMfctzn8+S1jVTj1sspnzezXrpj37JnvkNorUNe2frRphKiMscHHGasa76ZI+Vyy27O/k
 7koTvJ3xZu75zB+ma+MEep7d3P+av8GicIteh8DVsMVBEwTqlSW0pl3yuHvJ/0P2ip3v9dlO73U
 9GxDJBwA=
X-Developer-Key: i=vbabka@kernel.org; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664

The slab.git tree has been moved to a new URL as part of the mm-next
integration. Reflect this in MAINTAINERS as well. The old URL will stay
around with historical branches and tags.

Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
---
Since Harry as a co-maintainer now also has RW access to the new tree,
we agreed that he would apply this patch to test the access.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..f9c1aa1df9b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25186,7 +25186,7 @@ R:	David Rientjes <rientjes@google.com>
 R:	Roman Gushchin <roman.gushchin@linux.dev>
 L:	linux-mm@kvack.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git
 F:	Documentation/admin-guide/mm/slab.rst
 F:	Documentation/mm/slab.rst
 F:	include/linux/mempool.h

---
base-commit: 4a724bcf5d703e18957397914d79156fa2cf1174
change-id: 20260917-maint-slab-git-511cc356352f

