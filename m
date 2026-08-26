Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F5A48425C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775621; cv=none; b=A5fwuRqQ5ck018mp52EGY8UZ31BqDR0I5ioPuFqQASWHo3yN+zMmky7FouvirqtIuELthX0Tni9qMQHJUoBw9zRfN9N0De7LRaV8OYR6nuglePxjFrFKRCyYsE1m5Lnu1tovpnzpaLuwh+lRj/xeosDJeNK4cXhac2ZnNBlXuwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775621; c=relaxed/simple;
	bh=Ycvuca/qp3Jv+cw0T4z1WMw/vrj1a9F1QllZFmg6U5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RG1JKTF3YZHcnDmmcJco5/MB5BV3b2Yd6Nndej1thaI6SMAgJ/XfbQ03CoyTXQ4UrWS+gX2hZiP5UCJIhElNk4G5acM47Pz8RYiL61FZCMExogIDr9U3KMv1cY875e6mANGgS6W+xWD2GTPSj39p7S8G7NR7lIzySb39eIxCS1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=cNzrwwVD; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="cNzrwwVD"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f18c0e03e3so1061116a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1787775619; x=1788380419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/AoKIWVfZg9PcVSVrRIUhVB2ooggyxSF0Nn+JpI7Mo=;
        b=cNzrwwVDw+NQH4WpqHsArK9bysKTe4z9cA3rN6QPGozhsXbkB5weWwd4L0R/zvQSjo
         dCtRNpS2nIbTA6zO7kSkRYbwy1YkQg9wmY7INaQc8aBRfa9koZFqLxIvX3cLCHe04X2r
         JyNdbpHEMytERiKikue447ZqqLoHaTyARWhKINBEzZaQ8hqp25YNZ4TjHRP8hW+A5JvQ
         2MvYAkwr13DQ2RwlLZMwazx/RPs4webXy1Imv9qiynau1O4mmIetOUYOw104Z2LaQ9eC
         1MgS7uvA/U5D4H4CUpw6A0EsLaVv2+jhptw32ZDvYbSFvZeXjwM0jwRznStuelpQmU39
         u3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775619; x=1788380419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/AoKIWVfZg9PcVSVrRIUhVB2ooggyxSF0Nn+JpI7Mo=;
        b=WgdPYctqmvTFDwizy1lzXkAkB6ubiySApFUIQPfDyQUMp3UwyS71XI3E//40EsLPDb
         7Iqrr6WRl3MjPa6jc5+8oQZ+Q3Sx/AD1DknQMUXXTGG91iXr3Wd+BCIogaxhYv2ad5zH
         geu8PzctygmCuEEgtwOu4AVBhph32qgqLFzg+inXeIb8EbNXrEhZxUvUZ4Zq9qFGhz+/
         Zqp3S1VtJNt0qk5sE+A+CQRgGNau87M0px9iEaxlfS7ZMTp2bMutRIMUSjA70Cn1W4T2
         fEzmAoV0QLnYquiE90tORPPZ5920xyN5jhy3giwL06SLFD08cCG/YYhm3sDOUer2TgfI
         ZTXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRT6C7jRJ4rH47Qsiu6bLYhlTQ6EBheL7j7f5XXgXqhMCKOcbuXFaybKyY39+v56urf/6HAsFJ5T2ZR40=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ5uxw4vFhHSwgVAmZ0pIYSaxnbGVzHVMSX4ov6uFKwnCeOzI9
	IE329C1XvwBAQ9dGYCDufLozW2XiTjODZCOKstPeulA/lWGoSm+6b06RgRqn6kh5xBk=
X-Gm-Gg: AR+sD119kyx/4NPd0D/sUqCKbD6ALLmFXutazQEj4XRV9PFA0qJqGd0FkpmsNe89/7h
	7Rh3nGBxmEoMffrBqRdr+S7v4gByqfddcb0jgSQ6pE5cwBBbYyKkhVFAqCG/MrCtT3URvHmDbkU
	GV4Rz4+MHR5wx3y6ZHPdg6EeUZC4W/Ri9pxXHs8Mtd01UYr4RiMe4xfXp3t+vV8gjMOM1rNmC2o
	yGof9NTSz8ftRAlWO2pWsAezsfOuaOeaMzNSp+NHeju3d2suLaOF1jtwoVuPoL3Tfz8EGeo3cjK
	s+T6Du8SC0CuyC3tVN6Z7aXPTAc5iKHPcIGodMZ+nztv3LoRFPRCobeqjqfDhMDpPcaCJzG/erh
	5sJpxvTb28vZ9QHBjQYVn+INuxEweXn1o6C3Iz8jOCpzRJS2u0VFWXg7hsX8z30ltEWN5Bez3/K
	U3xV1N0E6hEkVATfqftMtM+1m6VnbgL5pUC6gzfP7x88FLeamAqQ==
X-Received: by 2002:a05:6830:3111:b0:7f3:7686:3f7 with SMTP id 46e09a7af769-7f4c5244732mr9914547a34.13.1787775618689;
        Wed, 26 Aug 2026 13:20:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2e46::49c:30])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c83d09d1sm2474928a34.14.2026.08.26.13.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 13:20:17 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Date: Wed, 26 Aug 2026 15:20:08 -0500
Subject: [PATCH RFC net-next 2/3] ipv6: hash uncached routes by device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-hash-bucket-route-lists-v1-2-fa9b9f30eb74@cloudflare.com>
References: <20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com>
In-Reply-To: <20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1787775612; l=4996;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=Ycvuca/qp3Jv+cw0T4z1WMw/vrj1a9F1QllZFmg6U5U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QF34rvo7rUcHSQNt2dHD8bfcs7GM0mf/XWPc6V5F34eGF1EzGBVZExS241sVdibDonYOVBzgAtX
 Np7nYj2tguwc=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

rt6_uncached_list_flush_dev() currently walks every per-CPU uncached route
list for each device being removed. Hash uncached routes by their inet6
device so ordinary device teardown only visits the matching bucket on each
CPU.

ip6_rt_get_dev_rcu() can return loopback or an L3 master while rt6i_idev
still refers to the original interface, so such a route must be reachable
from either device. Place those routes on a separate per-CPU list that is
always visited in addition to the keyed bucket.

This avoids growing struct rt6_info while filtering most unrelated routes
from ordinary device teardown.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
 net/ipv6/route.c | 102 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 69 insertions(+), 33 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 16dfac54a259..860530074027 100644
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
@@ -133,11 +134,28 @@ struct uncached_list {
 	struct list_head	head;
 };
 
-static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
+#define RT6_UNCACHED_HASH_BITS	6
+#define RT6_UNCACHED_HASH_SIZE	BIT(RT6_UNCACHED_HASH_BITS)
+
+struct rt6_uncached_table {
+	struct uncached_list buckets[RT6_UNCACHED_HASH_SIZE];
+	/* Routes that must be discoverable through two different devices. */
+	struct uncached_list mismatch;
+};
+
+static DEFINE_PER_CPU_ALIGNED(struct rt6_uncached_table, rt6_uncached_table);
 
 void rt6_uncached_list_add(struct rt6_info *rt)
 {
-	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
+	struct rt6_uncached_table *table = raw_cpu_ptr(&rt6_uncached_table);
+	struct net_device *rt_dev = dst_dev(&rt->dst);
+	struct uncached_list *ul;
+
+	if (rt->rt6i_idev && rt->rt6i_idev->dev != rt_dev)
+		ul = &table->mismatch;
+	else
+		ul = &table->buckets[hash_ptr(rt_dev,
+					      RT6_UNCACHED_HASH_BITS)];
 
 	rt->dst.rt_uncached_list = ul;
 
@@ -157,40 +175,50 @@ void rt6_uncached_list_del(struct rt6_info *rt)
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
+		struct inet6_dev *rt_idev = rt->rt6i_idev;
+		struct net_device *rt_dev = dst_dev(&rt->dst);
+		bool handled = false;
+
+		if (rt_idev && rt_idev->dev == dev) {
+			rt->rt6i_idev = in6_dev_get(blackhole_netdev);
+			in6_dev_put(rt_idev);
+			handled = true;
+		}
+
+		if (rt_dev == dev) {
+			rt->dst.dev = blackhole_netdev;
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
 	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
-		struct rt6_info *rt, *safe;
+		struct rt6_uncached_table *table;
+		struct uncached_list *ul;
 
-		if (list_empty(&ul->head))
-			continue;
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
-		}
-		spin_unlock_bh(&ul->lock);
+		table = per_cpu_ptr(&rt6_uncached_table, cpu);
+		ul = &table->buckets[hash_ptr(dev, RT6_UNCACHED_HASH_BITS)];
+		rt6_uncached_list_flush(ul, dev);
+		rt6_uncached_list_flush(&table->mismatch, dev);
 	}
 }
 
@@ -6982,10 +7010,18 @@ int __init ip6_route_init(void)
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
+		INIT_LIST_HEAD(&table->mismatch.head);
+		spin_lock_init(&table->mismatch.lock);
 	}
 
 out:

-- 
2.43.0

