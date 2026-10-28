Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189504;
	b=VXl/46bO7tXur2f3APTPbBwrhilrcBukfsAV2PzM1QRrRh7/Lz/7ndEvyNs9OdkxTzft
	 4h/So0jG+uhgNyJVjn83fK59sfTQMmN87DBsR55COlMUzpnN59W8r7U3lNekGvVch4Rob
	 1NymkzL25bM1/KqLXfYUlBV4MgU64/qFAKCSr7i6mJb9qGT745E7UqOD4CCKLhzX1a/xX
	 QBndGcjJu3CTeNC2hLu08h9ZPB1IJpRXU5MtidTe2Mz2bpOJo/t2/llvwfvCAwmdMSfZm
	 xof3dhKFBBWQBywWeyGBONIUMydEGf8C4Piq0UAyRnjgm1mof3i5HUCgLVnLyXa9hZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189504;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1n8Nl6PcS9qe7BAYox6Jdh47tIB1fu4WdM8a6GV3D+Y=;
	b=PVMMqU/c+NRFbApeBcanWuQG2bWOnICnm6Z1re/AVYcY27bhRSfVzQzXIQYmSxvQB26J
	 WQWj/9voa7ECwt1VAgvfsuiJqNnNZgasNVjtIkDMVPVhjsxs2oZ8XoylLoaIGXm4XA0E9
	 lscQ46zbG9LYEj/0RbaXgowtWiE2yOP4hCNnF9YBOCjWAsBu36HCmU7eDUD02gnYzLAUu
	 lklwr6gKF8FC6BlDxFBzOqu0n7EUVSNFsoVZ52qM4N1iLKFa/DXs156Zdv4QlcACwM9wa
	 R9TEdcfefZu/0e6yMZBjhPdV3/AsasymN+nj4cd+dp9Z/vXbOHHN0ynXacHIrvPzRNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HGFXhUzd;
	arc=none smtp.remote-ip=95.215.58.43
Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802D60A2625
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9802D60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HGFXhUzd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VBww6JyZdZNMzXtg5bsJzwRztMR9lQ4fQNuST7CnsK4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793189501; v=1; x=1793794301;
 b=HGFXhUzdmdQulfBCY2M2K+fSCl7Wnx+XIZdGsFytpCZX3JvXb9tx4nd0BlqEmMAjS6Lttajl
 81P0zB7AiHR0GCpkrhnuNhEE+SSi/UQymzub62sZG/ALEWD1tv2/wFNbInbQaOGc+xAYq8blECC
 sj7VwGd3k7QYnVkaeK5QiQuE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e40994bb9d03e662;
	Wed, 28 Oct 2026 12:11:41 +0000
X-Mizu-Trace-ID: e40994bb9d03e662
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH] mm/sparse: simplify the vmemmap alignment check
Date: Wed, 28 Oct 2026 20:11:29 +0800
Message-ID: <20261028121129.39916-1-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

sparse_init() is called only once during boot, and the vmemmap alignment
check is outside any loop, so VM_WARN_ON_ONCE() provides no benefit over
VM_WARN_ON() here.

Use VM_WARN_ON() and fold compound_info_has_mask() into its condition,
preserving short-circuit evaluation.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 mm/sparse.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index 6acb628c8a73..248bee2d39b9 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -277,10 +277,8 @@ static void __init sparse_metadata_init(void)
  */
 void __init sparse_init(void)
 {
-	if (compound_info_has_mask()) {
-		VM_WARN_ON_ONCE(!IS_ALIGNED((unsigned long) pfn_to_page(0),
-				    MAX_FOLIO_VMEMMAP_ALIGN));
-	}
+	VM_WARN_ON(compound_info_has_mask() && !IS_ALIGNED(
+		   (unsigned long)pfn_to_page(0), MAX_FOLIO_VMEMMAP_ALIGN));
 
 	sparse_metadata_init();
 	sparse_init_subsection_map();
-- 
2.53.0

