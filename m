Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B72260565
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790497134; cv=none; b=F7/yV4Tlb8eAgx5zITvwpQH1gEWbp7WmLOtkhFmZwoyO78aP8bcs/34J/PoNFLRLBkA+nqC4pDtmb4fMHGkD1jBpdsr0/aNQpGJOJJ//Ga2ShxceavbBovaKS1ZJG1X+OrKRZv9GjpNnS4PMLw8+moX3YEkX/q1zfY/DGzuwJog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790497134; c=relaxed/simple;
	bh=tnuxZHiMDP7NlbhxQnE94F7KWiJbmmUqD0qtt4RN/nY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WI+1RgzhXhugKgRMiw9sQGojDE/8dHhIx+JceaSBe6WFEzNqapLtp5tLNcldzNKXxt1v89p+CpDFWTIviifFvfMVb2LmnSewtVAIc3Iepvva+eaBSVlOPGoluxZiqOiCbP18W6SEONiWR+9sRVUp/ND7D81LuMn6UWOrWc2ZJGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/sIZyTX; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/sIZyTX"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3427977d677so147273eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790497133; x=1791101933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d22dLlUUYyImrNJb1bwxtlpRx+qcfWK6QMtWMrfJRas=;
        b=C/sIZyTXbWFlry9svumX8/IQXAreIq4EgfkG0uoZCfgcN5cpjjdjhuE3LcV3LFiV4/
         dpvMkqD7iB2R8H6k2pBXteI1DhIMeAReDqJqEF8iq68dnIT1EwE865etPvGVKbhyiUtG
         GnlkKCiJQ0DWzZiIvmaOCV2Q6DgaQIiaqKgRjGtQv5HfipBC9fDD06YTgmFF1LmRTw/c
         mNYuui0eEkfRu0g80P1/b69KMTlaNhKKxF6Pny3CkCi/I0wlGhqCWeVZpPEocfUHXhKY
         yWUQ79ecVesBMynHk8Jq2e8grTwTu1VSvaI46V36kL17K/SucNE1qfrByvJ/NY1D/dKt
         Nglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790497133; x=1791101933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d22dLlUUYyImrNJb1bwxtlpRx+qcfWK6QMtWMrfJRas=;
        b=NK/7WBZ8lXABKnFIXn4FAZVMnkFVZx+GsgQjUYVUscsooesYgSEamTkOPm3YDdQMhv
         /EWRkj1fLPCQh6UNDb0wKSUh+RJgALF2rzIQNAx5dJOwQbjW6YfLP84+cwnLkN65dd2n
         tTgs+2MMv1MWKdg5/eMJIOhfeJJdiqoIah2nfMPIsOjreNyyRSSd72vxLM4m+R/9GQez
         uY3cUHFzwHi+BQ/pm7K03mrx2MKgRYWxywoJkVns3TLb6wQpQoF2YMS4Z1JXzMefiylf
         fAmGEiLfDbibLGZ33vUwbw0DD5dqUp/Hv0D7ciJd+2nrNSKX1st4Ju1oc3gr9qhJTfT5
         oIXw==
X-Forwarded-Encrypted: i=1; AKwUvBwI5zh9efj9xHiyRrZFxRggYd0SXL24zwUdHrYnZKPUzBZ1h0hgPxXjQ6/qEcT8laysJdpY2sSy27Dcq1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVYG+tCK9kO8NwIrhbZ/cA4EIaE8mUCDACDxnJlmhAHC6x9FMF
	X6VsVwtE8DpK6vMU2fJtO/Zjt+u+Y5EgTDuQlrMGFjgLvnvBxusprYZD
X-Gm-Gg: AYBFou0XO8aN8KYVYDFnMw8JfiHK1xd5qJOjcZTdJGLRV3x+fOuB8/9S7CEwnvpBrsK
	1NsSZiljNaFSQPbH6YXS4tCRTmudyLtgS3HyihmLVYdpyr/mA1E81lZ2irrAkkIZSevD8wC5ulW
	suFoyrQ2CIPiG3rfyvSv4tKi/f8mjoHG+kH4xeYjUvtz6V0CfWOiPiwwOL/15UWZRYwSMlA9pNo
	hfgWPZ1XbmoERsENhRTaAmgUtJsUhLpQjoeNUjAp4J0pYnfy7IVr32jcnPHp0i9M4ysYdgHU9XU
	B+IZzLHwla9yPhEkDrH5+RW3SpGde64qPI50X1Gsg4rcrHrhj4zSUdGSjvb0M3ZqgKRxP5pUOrA
	7AIwawsmEeDFN8QzLEwxP45kD4E3xGga37Pk+Vhhf34E6Rnn3ShZH1nWd6uiMC14yJrCmj8KCKA
	CyH1ZuxA3gckDcGkDtaospMMahxf7v0EY9zKg2jnTHKdMi8YZfHr0Wt4YIRNIzl7IaUSQ/IgLhF
	1bYIjKh5wZsRI103b4Ekg8YbHCpq+I6+BJAw9MLpJB1xKjYLwntJ/oFQqtvOJCGURL1Bgj6HvXU
	6+zD
X-Received: by 2002:a05:7301:dd97:b0:33e:6a79:5a81 with SMTP id 5a478bee46e88-3427179721dmr7985570eec.1.1790497132522;
        Sun, 27 Sep 2026 01:18:52 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm31192132eec.9.2026.09.27.01.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:18:51 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] rxrpc: Serialize client connection IDR updates
Date: Sun, 27 Sep 2026 16:18:45 +0800
Message-ID: <20260927081845.3696101-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Client connection allocation runs in the local endpoint's I/O thread,
but the final connection reference can be dropped by another thread.
Connection cleanup then calls rxrpc_put_client_connection_id() directly
or from a workqueue, without synchronizing with the I/O thread.

The I/O thread can be traversing or updating local->conn_ids in
idr_alloc_cyclic() while a cleanup worker calls idr_remove() on the same
IDR. The removal can change or retire a radix-tree node still being used
by the allocator. Concurrent removals are also possible. These
unsynchronized updates can corrupt the IDR and crash the kernel.

KCSAN reported:

  BUG: KCSAN: data-race in node_tag_clear / radix_tree_delete_item

  read (marked) to 0xffff9d03804b9fd0 of 8 bytes by task 109 on cpu 1:
   radix_tree_delete_item+0x132/0x160
   idr_remove+0x32/0x50
   rxrpc_put_client_connection_id+0x53/0xe0
   rxrpc_kill_client_conn+0x7d/0x190
   rxrpc_clean_up_connection+0x193/0x370
   rxrpc_put_connection+0x3d9/0x3e0
   rxrpc_destroy_call+0x192/0x2e0
   process_one_work+0x325/0x710
   worker_thread+0x31d/0x5c0

  write to 0xffff9d03804b9fd0 of 8 bytes by task 97 on cpu 0:
   node_tag_clear+0x7a/0x110
   radix_tree_iter_tag_clear+0x47/0x60
   idr_alloc_u32+0x13e/0x1a0
   idr_alloc_cyclic+0x7a/0xf0
   rxrpc_connect_client_calls+0x375/0xa40
   rxrpc_io_thread+0x79c/0xe20

Serialize allocation and removal with the IDR's existing lock. Both
paths run in process context and allocation already uses GFP_ATOMIC,
so no additional lock or allocation changes are needed. RCU-protected
lookups remain unchanged.

Fixes: 9d35d880e0e4 ("rxrpc: Move client call connection to the I/O thread")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/rxrpc/conn_client.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/rxrpc/conn_client.c b/net/rxrpc/conn_client.c
index 48519f0de185..93e08a13a236 100644
--- a/net/rxrpc/conn_client.c
+++ b/net/rxrpc/conn_client.c
@@ -45,7 +45,9 @@ static void rxrpc_activate_bundle(struct rxrpc_bundle *bundle)
 static void rxrpc_put_client_connection_id(struct rxrpc_local *local,
 					   struct rxrpc_connection *conn)
 {
+	idr_lock(&local->conn_ids);
 	idr_remove(&local->conn_ids, conn->proto.cid >> RXRPC_CIDSHIFT);
+	idr_unlock(&local->conn_ids);
 }
 
 /*
@@ -162,8 +164,10 @@ rxrpc_alloc_client_connection(struct rxrpc_bundle *bundle)
 	if (!conn)
 		return ERR_PTR(-ENOMEM);
 
+	idr_lock(&local->conn_ids);
 	id = idr_alloc_cyclic(&local->conn_ids, conn, 1, 0x40000000,
 			      GFP_ATOMIC | __GFP_NOWARN);
+	idr_unlock(&local->conn_ids);
 	if (id < 0) {
 		kfree(conn);
 		return ERR_PTR(id);
-- 
2.43.0

