Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813290;
	b=W1NaDuL9a58htt2B0KgUAqOUZ6/cYs/E8XIG+W6F5x4tw26BfnWvumwXluVn+jngXAqe
	 Ali7YmWX5UN236LHANLB1dOFdSa7+Q6BcYSRl+eTq/x+xH6UZlyyeyYOnNLaCMOIyrUNY
	 TqzZlaYakwI1T8kmV+E8ZL/MeYOM333RBStqvIB2G6z6Mo3KZ08UT54UZoMo/0MGYv4OO
	 t6xpD2NrzJd+bXcqYTNBCQ/gCExYTpB/qsAkPBbHx0qwl+DDt3HLeqlz3k+P4H4plKOTq
	 so6C/mHQozWS3rrSUa3BUAl8pR/f+BPDmMb9gpkRd2dYjHjCCmyFvoTJk3A+Nilg+FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813290;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xXtS8nqPI8bMiiZsI5aMJRhf4Xi82nV2lL/o/RcncNM=;
	b=HysJvXezfOq2bLni6vSsbYeIt2r2Gn/sr4GouYdvEk35cIEn+FHq3E1aKN8s08KIvE2G
	 szok2ECEx/PPalFHlj3l3R9gkR9bQsFn2x6atZVG5MVssXAglD5JHsQocwC0LoLVqX46t
	 Llc/isDlxBVV9SZXrXSaXRLbVClDH8iDnRTcbJKF14WiKyiox2G3bPfmQDCt5WmFnaaKw
	 RTFG8EPsKTwjbtdPxNP7brphSTGdieYDRlBQxhDkYakZhXSiDuCXfLRib+mYoZeorr191
	 WvsJOdxWV7MluNOqPFCXudfpSKuXcDiFUQamHwUXS6RtFEkjWVYGZNoZYy9EbWtwISQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hwW9YhVo;
	arc=none smtp.remote-ip=91.218.175.251
Received: from mta0.migadu.com (out-251.mta0.migadu.com [91.218.175.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540A4606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540A4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hwW9YhVo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5qs+zHZlkyqRDMqx7SNWEDLyLXIGQ6DciwEgGF1OF3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813287; v=1; x=1795418087;
 b=hwW9YhVodGXQJ1SMJ5tKIVZJv+KYSxSceP42gqINXso1YdzeZOzoS2c40U1gZ5n9WTR6mpmi
 ChJMcf4AMP59hs1b8XuGJ/ouZsWslrs4xAfKddroMXyez2vs92fd2aBSySV0bXFVUbj16QE6IRt
 Hgpl1RWjbZEYXUnPam2X1Vvo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4fd46d42d037db8b;
	Mon, 16 Nov 2026 07:14:47 +0000
X-Mizu-Trace-ID: 4fd46d42d037db8b
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
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
Subject: [PATCH v5 11/11] mm/percpu: stop unmapping the CPU that failed to map
Date: Mon, 16 Nov 2026 15:13:25 +0800
Message-Id: <20261116071325.263682-12-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116071325.263682-1-hao.ge@linux.dev>
References: <20261116071325.263682-1-hao.ge@linux.dev>
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

