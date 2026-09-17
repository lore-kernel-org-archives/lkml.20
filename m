Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504B84E36F4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673919; cv=none; b=r+SPhoP52UcKNfs3nbmGFzGzsfWT09HWctb/HmvSB5WUA7PVGcmPyryKBm+suVFNC3wk2xh6tJ0HTXeH2043oeW+4lc9BbIutSG/+sd2K++LTELIepmhy/GZvXxzLb7zIt0SAB6FzjxhvzzlbaTSULPwcZ4A0UAmCtFNrzHJSrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673919; c=relaxed/simple;
	bh=LCVxHDVLkVrfWGjpRh2U9cCAwKrh9rkmPQLBh2nzJ1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYMKGB7ezqFYw/gcmhm9yaxLRk/G7i4wuCStAXR3q0u6AjG8pWdliZFlzkT7CHT3bv6gmPI96uzr6eLe++alJaQZamcs3+O63QVH5FAOC3YIk0MzxgtykWU+A6M2EpMbDkOZbdkra79yplAsnhwpx3efz+nM811QcrEhhIiDhO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=DNj5ETlk; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="DNj5ETlk"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3dedf3so25861b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789673915; x=1790278715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DB7q2xGiAnPtsBjkJ+5oYrdPscazpDKtw7xgni/idcI=;
        b=DNj5ETlkQL7wJOaf3UtsRMlYxUl/CmmdZUfwmv3y50hOkmmA0rsUK11970E4SRGyMt
         dDz7Rpdb+v3sOt5Ep20BgEvxsja0bEUoFRwYLpxETJu6MU+lgRJg3bxEMteXgxWrSzF7
         DlQydwsSPtEal06JyropgA99hGkchqCOp9t+b5cHajrN2OPItnOnmRVQFkrloRsrtIuN
         zoKi7BMva2FXn7U633HnlbFbWrlAfu+QyvXr8Og3VIMNqRWhQ6HqoDadnz8HdmuIWMMV
         iXWvWBIYAHuf+x5V/+7ylqJGjw0Q4wOJvprOUKLNlI5dD+vIPsd/ox4ydbH/q70xXjlN
         mpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673915; x=1790278715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DB7q2xGiAnPtsBjkJ+5oYrdPscazpDKtw7xgni/idcI=;
        b=WQMF7ICKAyvzy2HmSjA6+qH75ylINzfxuB1FJ+TxXLudsUeluHLT1MSRtCNDvTbE7T
         mb+l5IaWfGXDlBWs2pXWH8t4OmDNmfursm5INyvtU5laGF17o0X51FR669Ptq0K3WVnw
         J71CtmgSfOfPJR3emIbb80a0IrLOTGh7ZA7OL5PUjGi8WVtsn7LZpGSRW0cFAJlyaUDq
         bvM2fUJ8fCTtr1LJiDigXPBIRpPtjiAAz1ekotRTZIdnWDO1iMsy5Jq+IJBLPOJ0H0Mw
         u5ByZGzr3zhpF/agj8pEY7znFZqAKsG5ZU2CiSjb4b0jom7y7vjDhkpT8I+ygFJ9Zdm8
         sAaw==
X-Forwarded-Encrypted: i=1; AKwUvBzmk19icfaA/D9diLXZe2SEaeQ7oEloGp/VtQ9K1sU8oEnjM5BHn0WkBx2OSr1abAHWxe3w0bB3Q98h3dI=@vger.kernel.org
X-Gm-Message-State: AFuF++livx6gzugT2jpCKi9di5XJhjOl7xTS+pW8YTk/r9pOZ5Js9mJm
	96BPaRJgnMGPS+omqWaifgxl+sMAVY3PR2IfVLeJADpr2fBtWgspgakkJV7MzUV/Ic0=
X-Gm-Gg: AYBFou0Zy/bKuZyxiSTOSb6bxZhK9N2lvcH5s8SlAFqlhTixB/J7PI/wTDD1zhLjsHP
	Bh6haMw2Eg92eZfvWMekxKKx44IqTMs1woV1adw4AEyZU8OiS9nWB0Hly3mATOjTX9HkSyDJSYf
	DBV7pGu6uMNJ377Vv+eBA/11hAft8OdlXvSLXZqPzLNc9drM0AQqGbOqeF/6QIng9cMCD3y+dBU
	ebtWzn5fqsUaL50LMcIp6/ki6jHWJV4qsroNGlonmS18oMMSNvMlreaLejFgWyKTRDIwhDuY2aT
	e98+AMqxHpQFvSwBU0f+VWT9IXFHZG4ghfd4+Kgor6561x+Gwfgn62fpz3hGpTiYDh8WipxjakS
	j8GVpSY9X91llmC9N4VmWYVduyu1qrZ6sbiXWj0hZfoVxqzFYF2gCQnSYL4ReJazDO3WG2E0tcK
	hWxlJOKRtdBLPZlh0HiczxsvWff6S44cSwJYKxbYzxMzh6yhPY2L8iLEiJDw4=
X-Received: by 2002:a05:6808:c1e3:b0:4c4:1c0:ca38 with SMTP id 5614622812f47-4ccf9789f55mr257421b6e.34.1789673915107;
        Thu, 17 Sep 2026 12:38:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2632::3ce:23])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4cb6d267495sm3576435b6e.12.2026.09.17.12.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:38:33 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Thu, 17 Sep 2026 14:38:23 -0500
Subject: [PATCH net-next v3 2/3] ipv6: hash uncached routes by device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-hash-bucket-route-lists-v3-2-30493a37b6eb@cloudflare.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789673908; l=5146;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=LCVxHDVLkVrfWGjpRh2U9cCAwKrh9rkmPQLBh2nzJ1Q=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKoxtUisNdCVWi7GjJ/v8b0/ap8IUViZkPPi5uEDQDBw7ewZJbHArKtgiqL/FcMJi4JthhUIQS5
 2tO/uXmihsQM=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

rt6_uncached_list_flush_dev() currently walks every per-CPU uncached route
list for each device being removed. Hash uncached routes by their inet6
device so ordinary device teardown only visits the matching bucket on each
CPU.

ip6_rt_get_dev_rcu() can return loopback or an L3 master while rt6i_idev
still refers to the original interface. Key routes by rt6i_idev->dev when
available and fall back to dst_dev(). Ordinary devices then require one
bucket scan. Because loopback and L3 masters can instead be referenced by
dst_dev(), scan all buckets when one of those devices is removed.

This avoids growing struct rt6_info while filtering most unrelated routes
from ordinary device teardown.

The table has 64 buckets and costs approximately 1.5 KiB per possible CPU
on x86-64.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
 net/ipv6/route.c | 101 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 69 insertions(+), 32 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 7535b09068a0..cda81e91be65 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -40,6 +40,7 @@
 #include <linux/seq_file.h>
 #include <linux/nsproxy.h>
 #include <linux/slab.h>
+#include <linux/hash.h>
 #include <linux/jhash.h>
 #include <linux/siphash.h>
 #include <net/net_namespace.h>
@@ -133,11 +134,23 @@ struct uncached_list {
 	struct list_head	head;
 };
 
-static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
+#define RT6_UNCACHED_HASH_BITS	6
+#define RT6_UNCACHED_HASH_SIZE	BIT(RT6_UNCACHED_HASH_BITS)
+
+struct rt6_uncached_table {
+	struct uncached_list buckets[RT6_UNCACHED_HASH_SIZE];
+};
+
+static DEFINE_PER_CPU_ALIGNED(struct rt6_uncached_table, rt6_uncached_table);
 
 void rt6_uncached_list_add(struct rt6_info *rt)
 {
-	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
+	struct rt6_uncached_table *table = raw_cpu_ptr(&rt6_uncached_table);
+	struct uncached_list *ul;
+	struct net_device *dev;
+
+	dev = rt->rt6i_idev ? rt->rt6i_idev->dev : dst_dev(&rt->dst);
+	ul = &table->buckets[hash_ptr(dev, RT6_UNCACHED_HASH_BITS)];
 
 	rt->dst.rt_uncached_list = ul;
 
@@ -157,40 +170,58 @@ void rt6_uncached_list_del(struct rt6_info *rt)
 	}
 }
 
+static void rt6_uncached_list_flush(struct uncached_list *ul,
+				    struct net_device *dev)
+{
+	struct rt6_info *rt, *safe;
+
+	if (list_empty(&ul->head))
+		return;
+
+	spin_lock_bh(&ul->lock);
+	list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
+		struct net_device *rt_dev = dst_dev(&rt->dst);
+		struct inet6_dev *rt_idev = rt->rt6i_idev;
+		bool handled = false;
+
+		if (rt_idev && rt_idev->dev == dev) {
+			rt->rt6i_idev = in6_dev_get(blackhole_netdev);
+			in6_dev_put(rt_idev);
+			handled = true;
+		}
+
+		if (rt_dev == dev) {
+			rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
+			netdev_ref_replace(rt_dev, blackhole_netdev,
+					   &rt->dst.dev_tracker, GFP_ATOMIC);
+			handled = true;
+		}
+		if (handled)
+			list_del_init(&rt->dst.rt_uncached);
+	}
+	spin_unlock_bh(&ul->lock);
+}
+
 static void rt6_uncached_list_flush_dev(struct net_device *dev)
 {
+	bool scan_all = dev->flags & IFF_LOOPBACK || netif_is_l3_master(dev);
 	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
-		struct rt6_info *rt, *safe;
-
-		if (list_empty(&ul->head))
+		struct rt6_uncached_table *table;
+		struct uncached_list *ul;
+		int bucket;
+
+		table = per_cpu_ptr(&rt6_uncached_table, cpu);
+		if (!scan_all) {
+			ul = &table->buckets[hash_ptr(dev,
+						      RT6_UNCACHED_HASH_BITS)];
+			rt6_uncached_list_flush(ul, dev);
 			continue;
-
-		spin_lock_bh(&ul->lock);
-		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
-			struct inet6_dev *rt_idev = rt->rt6i_idev;
-			struct net_device *rt_dev = rt->dst.dev;
-			bool handled = false;
-
-			if (rt_idev && rt_idev->dev == dev) {
-				rt->rt6i_idev = in6_dev_get(blackhole_netdev);
-				in6_dev_put(rt_idev);
-				handled = true;
-			}
-
-			if (rt_dev == dev) {
-				rt->dst.dev = blackhole_netdev;
-				netdev_ref_replace(rt_dev, blackhole_netdev,
-						   &rt->dst.dev_tracker,
-						   GFP_ATOMIC);
-				handled = true;
-			}
-			if (handled)
-				list_del_init(&rt->dst.rt_uncached);
 		}
-		spin_unlock_bh(&ul->lock);
+
+		for (bucket = 0; bucket < RT6_UNCACHED_HASH_SIZE; bucket++)
+			rt6_uncached_list_flush(&table->buckets[bucket], dev);
 	}
 }
 
@@ -6987,10 +7018,16 @@ int __init ip6_route_init(void)
 #endif
 
 	for_each_possible_cpu(cpu) {
-		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
+		struct rt6_uncached_table *table;
+		int bucket;
+
+		table = per_cpu_ptr(&rt6_uncached_table, cpu);
+		for (bucket = 0; bucket < RT6_UNCACHED_HASH_SIZE; bucket++) {
+			struct uncached_list *ul = &table->buckets[bucket];
 
-		INIT_LIST_HEAD(&ul->head);
-		spin_lock_init(&ul->lock);
+			INIT_LIST_HEAD(&ul->head);
+			spin_lock_init(&ul->lock);
+		}
 	}
 
 out:

-- 
2.43.0

