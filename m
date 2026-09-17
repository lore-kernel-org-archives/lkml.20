Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B03A453A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673915; cv=none; b=A61zovDOJagTzgWzl1sI8MYKjkNBK9HV8fxDaquYYc1p62BOaNtDwuwyEY4LGYum58mjTDWuLQNFTOTZlfKsxeO3wbAtYXP0R/E6eiFumtAK6DQmG2OlBR5z/4fLgR8X3CJRvKMi9qgOj3vGQKeaYJK/O1/lopJaL9G1yCK95HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673915; c=relaxed/simple;
	bh=VpMMQFtE0irAVVja4em612tK+k3J5NR1F8chlumvxas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6+v2qMfCFnGoz5SqR3LiVTiFofDeTMnZcNknhLVIaHNZfWUIuQIrXNhFD2lUw2sd6pTs+WTt7k2dL1K4XGI1zWdP7QyW+00cIOK34W8lmDbAH/sqew2oAceJ4HntTf3ATZtkjTr09yyfmE/M+srgzRkks+2kcSlZbmbODjsxGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UvA100iB; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UvA100iB"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3dedf3so25837b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789673912; x=1790278712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zDN4PsZdWLOQV5bbiD9QzTK6IwoPKXQKegMYDTNvdY=;
        b=UvA100iBYWDObnB8518MeQusvO83Gr0JyUyb/yR81zyibi4zILk6e0ia2LDaN85TH3
         iYpz/z0YtQZx45+1KMQD3+7hdGzNb1XrG193ZeHApFLJk4VP/ObpSFcW2D9bVtNFKn6N
         rfP+3FzZmZHldGg8GBu3MNUMwE7th328OVmfJtCRZMyhOQF7KXMOzLNbwoXhppF+xUnw
         fYUCt8o6yKY3BCFBujQ4FyOL3QYND2jWu4+wvJMBPN6rC0BPILQTuGCvPZVLAVo8TTYD
         NrvuIotrdUgSePNuKDplfACFeZ0IGZphPCf5Bw4S0E65E8/79/DlX2hMzKxiDfw/0AQf
         qCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673912; x=1790278712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zDN4PsZdWLOQV5bbiD9QzTK6IwoPKXQKegMYDTNvdY=;
        b=zGvqwe4EdtVt2BKBEsthY2ugrLpEbtzCwSu4TCqid74iIB8+Y3/DfYZHumZT1JT3lB
         QwW3VllTV6nbBqElzcZAAF+h03nXHxTV0iPUd0iXLghuAwV/4fxJbc73BWasSxy9NRRQ
         mt8wRapRW/i9CRVxPNM+pzHWinuoGyStQrrY7e0XyFD7hT30H3u2rBg69ELZnHgYDofN
         lKccTH4kJu6xr1oVXhAX65lRDxAqHFPTH0HzyXB+IEARD6DlU0YEyf5ljHSTLOJNFjMw
         ToaVsPMXGypPCjBlKiwLWG3erDTAwdmgcHamPMKdInilbjih0QqAkW2uTdpkH5DCwqT6
         0GhA==
X-Forwarded-Encrypted: i=1; AKwUvBw5Unor606bTZr47mxmpK7vvGh+giFV3v20LT8pjOp2CsrVehDBjB6WiLYS+5j+Vc5BYVF/a/yjILho7rg=@vger.kernel.org
X-Gm-Message-State: AFuF++nXCHBfdJHS3Xx/k/LYv0z9TawhyhPdmaWqg/8U/1hLVd7FBAgU
	EMcoCsYNpF5FzFDLr2fMb7bnzLzWUWLaTXpAe/vprK3kuOhpBu5/XyVgqM8T/EoZ5Z0=
X-Gm-Gg: AYBFou22H5TrNjiBxFpjapqqp8BLIcn45y1afGsR6Ox6wsPrmWv16YU+QwVficADbj+
	XlU6gzlt3/5wkdz+5NjIRYUHT5L6pMy9ZtLh5YulgpoLLCM7aJv7xqco71Yx9HgRZ/oI3jfUTwH
	F3L0mAAdqameceCcEyhHkNY8Sdu+yMgFlBZNANEqIiDDlIyX89KFYyGDv91aGFIn9vZmg8AG8Kk
	aTzKxY2z6z2aMioAv24Xcak5rxORxgllWDnHzJtuKDtKCg2MwuK+ceq3meazGthiMa7cXUUAiIN
	g4Vr6rK4XifWWjV5FKFBFsoBviRu92RTnK8AYreo+UcZY3kONfscCQOM1zH7kbyabwideLnsAY/
	znKlkisg19/WS+CNwXe5p6knwyyaPEMFMfhd9pcbs/LZgxyXUs2sxDXDr4M6FRo+n3ec9zQDh67
	/U0QbuShbPJvmOzfeiygBK+M0CvqNr/j6L7DdmGWk0EFr8BL6NkT5xA0Rr8OM=
X-Received: by 2002:a05:6808:508e:b0:4c1:3047:9d23 with SMTP id 5614622812f47-4ccf8c496ccmr270320b6e.23.1789673912503;
        Thu, 17 Sep 2026 12:38:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2632::3ce:23])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d267495sm3576435b6e.12.2026.09.17.12.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:38:31 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Thu, 17 Sep 2026 14:38:22 -0500
Subject: [PATCH net-next v3 1/3] ipv4: hash uncached routes by device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-hash-bucket-route-lists-v3-1-30493a37b6eb@cloudflare.com>
References: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
In-Reply-To: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789673908; l=3315;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=VpMMQFtE0irAVVja4em612tK+k3J5NR1F8chlumvxas=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLL4JZ1UCIcP9np2SFBYtXutgzYaWKx6FR3rXAgvEIAC5fRPVrK+nhDB49SIEqYqEkjGfR+A3rn
 h3c3NWCw8+Ag=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

rt_flush_dev() currently walks every per-CPU uncached route list for each
device being removed. This repeatedly examines unrelated routes and makes
teardown increasingly expensive as the number of devices grows.

Replace each per-CPU list with a hash table keyed by the route's netdevice.
Keep the owning-list pointer in dst_entry so route removal remains
unchanged, while device teardown only walks the matching bucket on each
CPU. Hash collisions are filtered by the existing device comparison.

The table has 64 buckets and costs approximately 1.5 KiB per possible CPU
on x86-64.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
 net/ipv4/route.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d7da2f1acbb5..e5539eda4307 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -74,6 +74,7 @@
 #include <linux/init.h>
 #include <linux/skbuff.h>
 #include <linux/inetdevice.h>
+#include <linux/hash.h>
 #include <linux/igmp.h>
 #include <linux/pkt_sched.h>
 #include <linux/mroute.h>
@@ -1552,11 +1553,22 @@ struct uncached_list {
 	struct list_head	head;
 };
 
-static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt_uncached_list);
+#define RT_UNCACHED_HASH_BITS	6
+#define RT_UNCACHED_HASH_SIZE	BIT(RT_UNCACHED_HASH_BITS)
+
+struct uncached_table {
+	struct uncached_list buckets[RT_UNCACHED_HASH_SIZE];
+};
+
+static DEFINE_PER_CPU_ALIGNED(struct uncached_table, rt_uncached_table);
 
 void rt_add_uncached_list(struct rtable *rt)
 {
-	struct uncached_list *ul = raw_cpu_ptr(&rt_uncached_list);
+	struct uncached_table *table = raw_cpu_ptr(&rt_uncached_table);
+	struct uncached_list *ul;
+
+	ul = &table->buckets[hash_ptr(dst_dev(&rt->dst),
+				      RT_UNCACHED_HASH_BITS)];
 
 	rt->dst.rt_uncached_list = ul;
 
@@ -1588,14 +1600,18 @@ void rt_flush_dev(struct net_device *dev)
 	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		struct uncached_list *ul = &per_cpu(rt_uncached_list, cpu);
+		struct uncached_table *table;
+		struct uncached_list *ul;
+
+		table = per_cpu_ptr(&rt_uncached_table, cpu);
+		ul = &table->buckets[hash_ptr(dev, RT_UNCACHED_HASH_BITS)];
 
 		if (list_empty(&ul->head))
 			continue;
 
 		spin_lock_bh(&ul->lock);
 		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
-			if (rt->dst.dev != dev)
+			if (dst_dev(&rt->dst) != dev)
 				continue;
 			rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
 			netdev_ref_replace(dev, blackhole_netdev,
@@ -3771,10 +3787,16 @@ int __init ip_rt_init(void)
 	ip_tstamps = idents_hash + (ip_idents_mask + 1) * sizeof(*ip_idents);
 
 	for_each_possible_cpu(cpu) {
-		struct uncached_list *ul = &per_cpu(rt_uncached_list, cpu);
+		struct uncached_table *table;
+		int bucket;
+
+		table = per_cpu_ptr(&rt_uncached_table, cpu);
+		for (bucket = 0; bucket < RT_UNCACHED_HASH_SIZE; bucket++) {
+			struct uncached_list *ul = &table->buckets[bucket];
 
-		INIT_LIST_HEAD(&ul->head);
-		spin_lock_init(&ul->lock);
+			INIT_LIST_HEAD(&ul->head);
+			spin_lock_init(&ul->lock);
+		}
 	}
 #ifdef CONFIG_IP_ROUTE_CLASSID
 	ip_rt_acct = __alloc_percpu(256 * sizeof(struct ip_rt_acct), __alignof__(struct ip_rt_acct));

-- 
2.43.0

