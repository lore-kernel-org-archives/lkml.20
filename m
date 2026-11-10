Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309954;
	b=zIzFVinyMVGJ0Q1ZZcfOd7/9Gzy2Ba133yzGTvm1dSJ4d5oVeGNrN+8aoHzs3zpjoW3n
	 51vzT5rsV4uLiOLk4S98FCRrmld53J6xNbrCTZ0TVWapVeZ6gws+N60QDIooxmfNY3w6g
	 Rq4xDBgm/GtDETuKkIou5fbj0/1CP/yyK2UPxpzWnzbcCMxXo22fvtYKV11vkClhO8Xui
	 nJ03eDKuS43Nc+92/8hTIXS5IZWCpDOrLYS1ViEsf1b1Zc/H0eoH1XX3BzIzqSNrE6Io2
	 yq3NC5XoYAp5og65GhCo4Fu4bhXWvq8fEo/vPPN5NtwsM9zI729jZ6aByptfeBKMDeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309954;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xXtS8nqPI8bMiiZsI5aMJRhf4Xi82nV2lL/o/RcncNM=;
	b=Sue5VZ/aX4AnT6uuVBegYA7wi8IsAo/rywAYslrKIpvuu1dxakD+a3Wqu1dK9Hgvy5Bb
	 7174+nVUNV8x+vnQq0n0mBcAFH5a2or9MkVcJzmyv6ReJ7wo0a61vfEHlgt4Q43HXjWAx
	 ohPr0XUIVZ2rEPWveupyCW9SMTJ5nQQDc1VodpW0n+K6LzI2R3k5ZvERZRHZivnIKlKRN
	 o3tTknjmlXvB2r7ZeaRTsTK1jQvLQfm93epFdMXXoOhzAhG5b73g8E5qeTKCzdqL36Bj2
	 bemPC6S1VzxEWNpS1FvX0G9JnmKY4cgtFJUU2CilO1UcN8NJoANEk+tOWM0oRMSQDIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NgWqlnkR;
	arc=none smtp.remote-ip=91.218.175.224
Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9100E606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9100E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NgWqlnkR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5qs+zHZlkyqRDMqx7SNWEDLyLXIGQ6DciwEgGF1OF3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309951; v=1; x=1794914751;
 b=NgWqlnkRqjCIk49MKFVio9mm9PWHktC4BBp1DK7KyfVUifUVLIxERfcDf17sWV83KCpahdcp
 4c6ilH8eenxZmHvJUJWbSzIiYvPLoT+q5CS3W9XMeTDe0nJRkxt95P/RRs+f71jAjRLScYeNQ2M
 g70EFpXAULqpyxoh8lMGa7dk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0846a03f7f9c0cfe;
	Tue, 10 Nov 2026 11:25:41 +0000
X-Mizu-Trace-ID: 0846a03f7f9c0cfe
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>
Subject: [PATCH v4 9/9] mm/percpu: stop unmapping the CPU that failed to map
Date: Tue, 10 Nov 2026 19:25:46 +0800
Message-Id: <20261110112546.261415-10-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261110112546.261415-1-hao.ge@linux.dev>
References: <20261110112546.261415-1-hao.ge@linux.dev>
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

