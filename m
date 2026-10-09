Received: from mta1.migadu.com (out-165.mta1.migadu.com [95.215.58.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079AD44F561
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527791; cv=none; b=YCMkD8RJlKOaifDPvmOOFR/JCHlBwOh2G/mGFj22Tf+djeot5p7wzllwTfG+5aXiuW3BMQXtunLotGaYcWPx1kTjpeuqFEZ753siwvy3ZCwOgp1DsqA+6C1t8A4lfMKMKoh9iiOiLCEzuZJNRMqkHVPKBxB3+KC6LeZFYLDniHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527791; c=relaxed/simple;
	bh=XX490udm4Ta6ALheN6Xuua3sT0ZXTpdEDmRJNuiAJBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eg7ajLDIulNGY+5U7Gr5D+L/PHCpRKjjuKptkdOEUCFpjG68DiuJAZyYympBgD5PuIdEVQftLOxMlqj+nsRADvmth1GybkTTPoYf98whG6yCeIkEiBWz1ZHpRbXUAKYPaQJIADTt87mRU0hA3yiadodGid8vph5T24QBxOmihmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Tq5jaOpF; arc=none smtp.client-ip=95.215.58.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Tq5jaOpF"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XX490udm4Ta6ALheN6Xuua3sT0ZXTpdEDmRJNuiAJBs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791527782; v=1; x=1792132582;
 b=Tq5jaOpF3DaN/KjM1sTJ9Kt+qtUR74OOFPzsUK5mu/rJy7iP8nwLZ/U5qbYT1NJrDtUpI0m4
 Pr3i264mbDoSlhbZEgkdKDC4I4tpufbBOvXapzekMxm/smgT4vG8u5GvDFPRUlx8gN8+xMFt9tz
 I0h43YIcNzUzCi+1GNSf+5t4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a2f462b3a15301f0;
	Fri, 09 Oct 2026 06:36:22 +0000
X-Mizu-Trace-ID: a2f462b3a15301f0
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: Hao Ge <hao.ge@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [RFC PATCH 4/4] mm/percpu: stop unmapping the CPU that failed to map
Date: Fri,  9 Oct 2026 14:36:19 +0800
Message-Id: <20261009063619.112313-5-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261009063619.112313-1-hao.ge@linux.dev>
References: <20261009063619.112313-1-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__pcpu_map_pages() clears the PTEs it installed when it fails, so
pcpu_map_pages() only has to tear down the CPUs it mapped before
the failing one.

Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/percpu-vm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
index 509d8901835c..59d3a336a6bd 100644
--- a/mm/percpu-vm.c
+++ b/mm/percpu-vm.c
@@ -252,10 +252,11 @@ static int pcpu_map_pages(struct pcpu_chunk *chunk, struct page **pages,
 	return 0;
 err:
 	for_each_possible_cpu(tcpu) {
-		__pcpu_unmap_pages(pcpu_chunk_addr(chunk, tcpu, page_start),
-				   page_end - page_start);
+		/* The failing CPU's partial mapping undoes itself */
 		if (tcpu == cpu)
 			break;
+		__pcpu_unmap_pages(pcpu_chunk_addr(chunk, tcpu, page_start),
+				   page_end - page_start);
 	}
 	pcpu_post_unmap_tlb_flush(chunk, page_start, page_end);
 	return err;
-- 
2.25.1

