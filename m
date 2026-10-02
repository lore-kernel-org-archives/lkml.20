Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A54640DB39
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790923979; cv=none; b=WaOU6ZwRgJBsp5UG3Bv3X9nvyIjeb1ACHtMfBoi7HOUwKJC69MJAzJDlL7PYTQMOqFyoKEUdd48K06IArVC2TQgR5JagGBlvE7yiHgaoeKqpnUZOFq17ney2id1k50hTooSdPDJxC1A63X3cNSKDgKFaYke9qbr+G78jOYrHlP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790923979; c=relaxed/simple;
	bh=U0P6MNmnhiR29aCTI603qoZc2/QBg2U55GuxveIGVUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/R5VJGMQ7WW5uSYcB14CkhWvdINszIT/0fxiAU7Jo2OlxmTQIGHwRgjam5zQwDoN/LwQsgS7x+09y5X8NWxKz77d75ToTjl/DaYVtLfX1ptXg8KspQLlZ+5o4BDasKxKsD31aMDksmUqP0fG6QDf/utDQ6YBD98TE3PPi+/mMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okLkZxCI; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okLkZxCI"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so9300678eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790923977; x=1791528777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adi8qFiLqEh1nUAugSDylELoH/XxWZrE37VsReOSdbY=;
        b=okLkZxCIWlksanRcSYruTorQbSEb/6ZqysHYpo2ZZq9hPAxoiJam+as8HSD5B2/86y
         E8crOpFg61sBebM84Vo9Z3mGu1klv2CPewgKcSDLPvf2InfwCykSQeUaBf+EdaRu8ndl
         oxNHEGtIo0y9CDVJ1IACLiVU7jGZpgHfLvA8+SekBXOO2iED4xT2YMt3tjzZPiAKX60g
         W45nrKKkpzBkn7loe1FRkiTb4jzuOZo+/FibKPtsG6soRTGgLFZgIx8gkvwFeU/x10xx
         /sBR/o6HgrMYB7Xkq3VQ+GUi0BJO153hoZGAuQ9xFv5FUcfcyyL2fQ6mf3h3pfYYutkT
         IGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790923977; x=1791528777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=adi8qFiLqEh1nUAugSDylELoH/XxWZrE37VsReOSdbY=;
        b=qolhTQrb13f4xGxC6AuKCSnYjPLROGAokUrFHP78jH5YA/rMfGJDWh8aVbEJBc/sVC
         sQQe8PySAnybaVjjjitHvCkDtgOQx5XX2KmChWB7jNfCrrf4QjdDG8Ane8vK+xA57Lma
         2YciycDqfXcj5ftnX0Gi61cgdb+HjjPLkT7MCSiIR6sXqUhIfNungdISUXrPXidomEx2
         5mVutkvC6EvtTE+e8oBKvkcsMFbqTwYFTcH2ysaJyVbNwW84IJu8Bu9ncj8hRer0rMv3
         vDVdouqOadss0FdYGLyVrODW9ABkl0zjmv9Tc6USTebC56kwLRs8n6qHs7lLw+yNVIgz
         zrhg==
X-Forwarded-Encrypted: i=1; AKwUvByocX4ytBYBKiFpKQpe3VLD0SPKNNicnOwYCpmV3dqs0xq8l23rzheYCVekb50v/MvYdqWnOVdfT9o8Kf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKds6tJXY57F22O5qnEgflvkUp0brv4ZzNTqKDeSSy+h92AdAz
	AeSJ64K6BcfclB6pSjsRm1/3xt5XHGk2zdzEVtFy1oRnXLFfU573jy+ZxdIm0A==
X-Gm-Gg: AYBFou3rZqihMtma0iW0Jfnrh57u24CNl8VyEIBwJwF18MJn0YZzkInFLn0sEPGjhP1
	okc8wJ3m1eNsV1aXYtoox+n/3+7UpLrNHbOY8Fxu5wgx1nstM5WEYoTDyt+vM2jPqzXCLmIgVt4
	GDS5AHXJuxeb80ivnwKtu2Rxp3OcIHEEUMO76kipYG38hNDZGaHKbZh/1u2ZNoR9aDftCeUGlaw
	SVipzMuB2sVwfRe9bLWCapr7rAhRtI5RsreqFPIEYn6guIcJwzET1FjssRDk/IZVthkKilJ8cwy
	a0ola1COA57Ngn+Eid8ULhh2D14n63ZiWW2I4RqigIOImHkn+JF3nV/2KTS951MHGAjKv+WqMOA
	N1snJV+Hnf8889AhCKKpSONnlbNImxMY2nJwsm+tOV4EfvyiqWKPuqAfcFYZn11+1tGN+qI377K
	r6xLPEpAfsiPnEgRfhK8GnzDieNMl7E9oUe3VpiZja44vJlC1w5OAdkpfroCarfH6QiqfW44YWX
	aj6FDeQ
X-Received: by 2002:a05:7300:d518:b0:34b:dbbc:a72 with SMTP id 5a478bee46e88-34f2185446fmr2605436eec.24.1790923977085;
        Thu, 01 Oct 2026 23:52:57 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f0672c739sm4349453eec.3.2026.10.01.23.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:52:56 -0700 (PDT)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH net 1/1] net: use random salt for netdev name hash to prevent text base leak
Date: Thu,  1 Oct 2026 23:52:46 -0700
Message-Id: <62774f8c6cbad549d1a95f88df99ab7745d7f6b8.1790917676.git.zcliangcn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1790917676.git.zcliangcn@gmail.com>
References: <cover.1790917676.git.zcliangcn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_name_hash() uses the network namespace pointer as the salt for the
network device name hash table. Unprivileged users can use SIOCGIFINDEX
to look up attacker-chosen nonexistent names. Timing these lookups
reveals which names share a bucket with an existing name, allowing the
salt to be recovered. For init_net, recovering the salt reveals the
kernel text base and defeats KASLR.

Use the per-network namespace random value from net_hash_mix() as the
salt instead. The value remains stable for the lifetime of the namespace.
Since all name insertions and lookups use dev_name_hash(), this only
changes bucket placement.

Fixes: 8387ff2577eb ("vfs: make the string hashes salt the hash")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
---
 net/core/dev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 18dc88990510..f3eca7fa2481 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -98,6 +98,7 @@
 #include <linux/bpf.h>
 #include <linux/bpf_trace.h>
 #include <net/net_namespace.h>
+#include <net/netns/hash.h>
 #include <net/sock.h>
 #include <net/busy_poll.h>
 #include <linux/rtnetlink.h>
@@ -193,7 +194,10 @@ static inline void dev_base_seq_inc(struct net *net)
 
 static inline struct hlist_head *dev_name_hash(struct net *net, const char *name)
 {
-	unsigned int hash = full_name_hash(net, name, strnlen(name, IFNAMSIZ));
+	unsigned long salt = net_hash_mix(net);
+	unsigned int hash;
+
+	hash = full_name_hash((void *)salt, name, strnlen(name, IFNAMSIZ));
 
 	return &net->dev_name_head[hash_32(hash, NETDEV_HASHBITS)];
 }
-- 
2.25.1
