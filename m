Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813243;
	b=CNfGlY9/2dK9cC+gpaYBuscXAE+oFHjLJyz+Okc+/OGSK9jC22F20PNiLA29VCg6TpFt
	 eOY2sTqlaUfyDziH7lAH1QNeTTFsDMqxXWfqsXTXPql/osSUcabgy/wFX7ZIHx5Nw0T6f
	 lnbuR+9AarmtTv/44yEFt8dMOoSq9ax0JzspNqhkf5P/KF6nq7R2zvfzxrnNgCvskNrc/
	 vGIwO0gKKMI+EmhnBLVrsRegunReRuFjE07N/7uIVs0vItbUHen6B73F6mtFuHJ+9HETc
	 nw9m4H/xn6JTEA/yn7XxIGuyeHJx7/0eiGgsX+9Rwhy7/lfwdgtsBS3JNTZAsoc5rVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813243;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Rz7Bn484kYxpLy98US2ixuVoAUb0FWfN9hJiW5Fifg=;
	b=R6RaidI8+bPD5dFY1X+c6g3Cimje52MhZMiXuqEcGT6BYNKKS7F6MxVGLc82aaEd9TtZ
	 nUWxbaQNkslcmgX00kZyLQ9B1w806v/nbKS1w6i8ACh8CnTJcjsrnh/kmiBaDZRzAhTa4
	 J9DbDfun/6w9ygqAIb/XIyRwq2j3T9x8aVKthZm23z3Qq+qEayiXaynWT+lSeSyjneatv
	 nDmH7RUw0AjeQzFj8EIhT3vj2RQXrHu8W59ytM4T2CXzv9CC5yuuq+yF7w42e9cknzNOA
	 0q6b+eOWB2ST/n7DsMgn8vMds3F5AU1wfMwR/nwZTcbZCr5miNH7wvupqgYnRcEWLPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tCIyRPTC;
	arc=none smtp.remote-ip=95.215.58.250
Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55374606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55374606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tCIyRPTC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4ajKl1LXghEEqa+0NKeoRTLoqb4UzlZy/QlTAAykkoM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813240; v=1; x=1795418040;
 b=tCIyRPTC63xrH+q0QBT8l7u9/woB2jGMhy/+TZBX0fGRcXnQYwaeuZH1c8ifb48wf0bZGmaU
 MUDtWgWpzHC5JTwJj7ig3NMGjBht6n4hRXay1cde0/EUVwo5xjr0e9DRXl5SDFsz70yR5ONPTdp
 fUbc0a2dlWcnFkZeSRP7zYGc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 98d69bef93d5ff80;
	Mon, 16 Nov 2026 07:14:00 +0000
X-Mizu-Trace-ID: 98d69bef93d5ff80
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
	Hao Ge <hao.ge@linux.dev>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 04/11] mm/vmalloc: reject an unaligned range in __vunmap_range_noflush()
Date: Mon, 16 Nov 2026 15:13:18 +0800
Message-Id: <20261116071325.263682-5-hao.ge@linux.dev>
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

The PTE loop stops only at addr == end. An unaligned end is never
reached, so the loop keeps clearing past the range. An unaligned
start clears the page below the range first. Both are caller bugs,
and the damage is hard to attribute afterwards.

vmap only installs page aligned mappings, so an unaligned unmap
request is never a legitimate teardown. Warn and bail out at the
entry of __vunmap_range_noflush(), before any PTE is cleared.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a168f6f20f4f..e2b63cb1592b 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -523,6 +523,9 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end,
 	pgtbl_mod_mask mask = 0;
 
 	BUG_ON(addr >= end);
+	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
+		return;
+
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
-- 
2.25.1

