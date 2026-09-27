Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89333BBFC0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790494337; cv=none; b=CGLrWsaO5o5m70tXaLyl4+AdYmZnznRolFZkuUv24L0+DDI1QrMJfq/UJwl1xznMychi+BhWaVKMlslnaydw7tgjIso06Go9aK1pVykbEbyJY+SS9a3QI9Cj+X1L79XtYfwhJAE9rVC6unecEmA7857kjoC9plVNhVZiWyDwOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790494337; c=relaxed/simple;
	bh=nY8qGs46zgeEK17RWUhh5D/oORqRp0Zwjy2eAU1BJVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOVrNM1/toRfQngHiuQGrV3fupEVNoUjR9B9aXkK04mZ7rWMDKr7dqNWfoQya30wU/xIc+3xgzeIiMwE6fIo26VOF4Z/AAg3Ge5I5pKl18jRIlaP/d48BlMQbFF6V+xjionOYsJEk2TVXyL9xTqdGffg9PbRVUKSQtY2mQWEXo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHv66hE+; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHv66hE+"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343bdca7590so23548eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494332; x=1791099132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCHlGAQUPQqUwMiZODOWYGN6xif3TdPxiD76nVrz+oA=;
        b=AHv66hE+453a1o7CCAhJdKZZzPPjIciAqAg0DNN9j5vvISW63i8NiBAdyleUetCeF0
         EWN0bO5YGoTsQlT+cWBlPqy1J4qcxIL9ClgcpRRL6k/uowZ72xM/Q7MYg90ZYbX74A2t
         pJWKQ6/+1ZKnbQMQNzRpnprnEfzGvN4F3hLNQHUJW0+l5/Ua/PbDDy1JqPdOx/A6t7V9
         xYeb5wKsNzcrGjdTShWBNirv0AMsR8oqjKpKa6xyG7rvg+GyEB/VWKru4nIJK53QP4yG
         fkRE1JUSqpcyUXgNNL0JMAKBlqm9qirduMLe/x5i7NszncNakSLS6ucuejuz474lZliu
         As4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494332; x=1791099132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCHlGAQUPQqUwMiZODOWYGN6xif3TdPxiD76nVrz+oA=;
        b=qdP3GZuQ6bF/Rq7HmgaVmMuADEKt+h3BhgBlSJ1vCyjNlk9pTjzJaphIJsEKv8USl7
         0s2B88LZY2jefkFM3luyXdxKDgDPQBB+CFpB+rEhBJhRJZAsqQvp8gMP42ouQmcNxiX/
         yT676af4e9WKQK+HIZrrX2h0R3AVq63025RoDMshjxR498aJRIn+Ucf1juE7pf/C9Rz6
         zxFu7h4p2kj/ax3aVD1io41P9ghLWjhh3HmVHN7OKv0ewQftqK8kwdUXo63DeCtiHITK
         PC015hQPJG/Npsdb3Ksz51KNfCG0XzDVKnN+OcpNbnC4q2LIWH08N/TKQ9OZNurjGnCy
         u0eA==
X-Forwarded-Encrypted: i=1; AKwUvBwMn5butBqG2vZYA5EkpzShzpeXrdoiKPj9Cfucb2B6xMBnu4+7D7O2L9YR2yx+qg8izYHbluhXM6cTmog=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGCJdpGJTA8jHNmlHit1YmhTpCs6M2YgPwtfwAru8WFx3Dj79D
	z3BPLOVMdqWoxf1GgvjDdUZovaGhbkttCIxv8VAfX9ZLJ2D8TFdLibQ3
X-Gm-Gg: AYBFou3cJvM0R1odaMfiN8mj2eKtsd8IZC2I3VuY+we18lEkLYDLzQC5gSfP8piikuY
	u4fIyRcaa1/2xp67jMKpjkI0Y852KO3/Nh6V1fkrgDDYxNM7O1DxBaZJDDLXaVqQUs5QSdyN7XM
	lFAoEum50R3hhrQ0mdOryvDJALJoAUOXhxlPAkUjMdSC87OORUV1U/Di3+MbfsjPezbTeNam633
	Ca78T4JFfsfaa4j0yF+KdwxmZQKekTDTxr2CRSbzfJYZZ88o+GIkqdQ8hz6HffQiBpqJz7lFxXz
	h/QvR0iqfkgSl2ANJwVieoHAynuHpG3fPJEyjn2BvIKc4Nt39eSvaESeO5s9zuFh/g5Ck/qdeGI
	oh/9BHEp0sW8x4LGp8p/t0vZQ4dH8eNpW8BJNA2alTaDLMCz7F2XwXxHiZlSJ+bcFoFejwqY1cg
	qdRKhC9ol264ywYqFoNdtbbsj9IPsxeYNhgWY4Ee0oNZbIJDTX0hypIxFnMUZoyDHfDecfyL2ji
	B43k7X+kIBcgndSgnqbIEIZ1gVz95O1XqkammL1HW2XbYmtorj/DsVuLTEonZFowpY7gg==
X-Received: by 2002:a05:7301:b0e:b0:33f:3750:4e22 with SMTP id 5a478bee46e88-3426cce6521mr7959749eec.0.1790494331059;
        Sun, 27 Sep 2026 00:32:11 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3433628f5basm10705821eec.18.2026.09.27.00.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:32:10 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Wenjia Zhang <wenjia@linux.ibm.com>
Cc: linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] net/smc: serialize sndbuf descriptor release with diagnostic dumps
Date: Sun, 27 Sep 2026 15:32:03 +0800
Message-ID: <20260927073203.3694279-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An SMC-D connection can remain in the socket hash while smc_conn_kill()
tears it down. For devices supporting DMB nocopy, smcd_buf_detach() frees
the send buffer descriptor without taking the hash lock held by the
diagnostic reader.

__smc_diag_dump() can load a non-NULL conn->sndbuf_desc, then a concurrent
smc_conn_kill() can clear the pointer and free the descriptor before the
dump reads its len field. The socket lock held by the teardown path does
not exclude the dump, and clearing the pointer before freeing it does
not protect a reader that has already loaded it.

KASAN reported:

  BUG: KASAN: slab-use-after-free in __smc_diag_dump.constprop.0+0x2477/0x2b10
  Call Trace:
   __smc_diag_dump.constprop.0+0x2477/0x2b10
   smc_diag_dump_proto+0x266/0x390
   smc_diag_dump+0x20/0x70
   netlink_dump+0x489/0x1140
  Allocated by task 70:
   smcd_buf_attach+0x11b/0x310
   smc_listen_work+0x2a62/0x4cf0
  Freed by task 98:
   kfree+0x131/0x3c0
   smcd_buf_detach+0x120/0x280
   smc_conn_kill+0x487/0x720
   __smc_lgr_terminate.part.0+0x231/0x430
   smc_smcd_terminate_all+0x2cf/0x610

Take the hash write lock when removing the descriptor from the
connection. This waits for dumps holding the old pointer and prevents
new dumps from seeing it. Free the descriptor after dropping the lock.

Fixes: ae2be35cbed2 ("net/smc: {at|de}tach sndbuf to peer DMB if supported")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/smc/smc_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index 9974149659c2..f32fc1bd5bc8 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -1207,6 +1207,8 @@ static void smcr_buf_unuse(struct smc_buf_desc *buf_desc, bool is_rmb,
 
 static void smcd_buf_detach(struct smc_connection *conn)
 {
+	struct smc_sock *smc = container_of(conn, struct smc_sock, conn);
+	struct smc_hashinfo *h = smc->sk.sk_prot->h.smc_hash;
 	struct smcd_dev *smcd = conn->lgr->smcd;
 	u64 peer_token = conn->peer_token;
 	struct smc_buf_desc *buf_desc;
@@ -1216,8 +1218,10 @@ static void smcd_buf_detach(struct smc_connection *conn)
 
 	smc_ism_detach_dmb(smcd, peer_token);
 
+	write_lock_bh(&h->lock);
 	buf_desc = conn->sndbuf_desc;
 	conn->sndbuf_desc = NULL;
+	write_unlock_bh(&h->lock);
 	kfree(buf_desc);
 }
 
-- 
2.43.0

