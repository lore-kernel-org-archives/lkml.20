Received: from mta1.migadu.com (out-154.mta1.migadu.com [95.215.58.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A137047F77E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388750; cv=none; b=HlnaAx7CjLIGyexxCf7mkmFDuFTyClwbRfRbteOVJf6RvF+QgueGbiBjlwTtxKm9LnVeizz/MEj+5MyF/L1bBwWYMh0CaU+itxHn29ky4UroK4hosUSyaz2fTjy9+Hta7XsJzo/U9jaH+v6BSyOVJi6jwMqJmgcgjpSlb0RUzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388750; c=relaxed/simple;
	bh=5qs+zHZlkyqRDMqx7SNWEDLyLXIGQ6DciwEgGF1OF3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r8FDQZ1EXoMW7kf47h4w5GAOidqSPwWRWa9h2cTcZxPFvNhd17TE+//9Tj7NM2zppiBzwR25q3izjMoIb3G54kKom0E5PwEyRfLaeVLSFexGjQxMWH9VpHKRFvE4ATaMerCmKHr0wDqpEMhLjw/9bRfP7eaB2X0A0T7pLJ8nm5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MtTMn6YA; arc=none smtp.client-ip=95.215.58.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MtTMn6YA"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5qs+zHZlkyqRDMqx7SNWEDLyLXIGQ6DciwEgGF1OF3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792388692; v=1; x=1792993492;
 b=MtTMn6YAgt63PiLZWQZLAYe+1kvKxbYndgDbrEc8qmTLzwmksGIoYCwvfdomqqHf5AdbXPsp
 MTuP30HpnA8fz0bkHTaQW10KP4JWkQkgyDnf1c28sDVJXm5YsgiCcLO0xFkNIwcm3ecF0xQ+ivM
 KRYhZEargjCrayG58dkxtj8c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 48f0776ddb594f90;
	Mon, 19 Oct 2026 05:44:52 +0000
X-Mizu-Trace-ID: 48f0776ddb594f90
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>,
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
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>
Subject: [PATCH v2 5/5] mm/percpu: stop unmapping the CPU that failed to map
Date: Mon, 19 Oct 2026 13:45:30 +0800
Message-Id: <20261019054531.87652-6-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019054531.87652-1-hao.ge@linux.dev>
References: <20261019054531.87652-1-hao.ge@linux.dev>
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

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
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

