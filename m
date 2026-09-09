Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD3644C64E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941840; cv=none; b=uSUdxDHjSJ8k+FPLQapm4hkwLUskFgrL5E7QE/+OejVWWFhMAHcBMISmWYLNyDxhPhQV7JXe1S0e64E7DEtc/EryI871rl6Hyj+6NuJkVQNduF/ygy7X5lWvR97/+Bs8XmvFT05+EVrk2xogIE6mahKHy9crfPBv+gG402jVwjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941840; c=relaxed/simple;
	bh=JYUO8pXR1PnHOkY6YjAgcARFrg47TPut/HiP2MoNAoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGQYH9wcfuyuDsaa3d0a6XcRATtzOpgBZYxJKn7GgPT3HkptXvTPKDVb+B+Ndm4zv1Kuw1H1K4gOSaqUQFY4nCKMtyEesoUTGIYrlLb9XqbWzYXcXfkweR+v3D4eI0FmjtKy1x11ycZMideIqoTHekeiBu4ypKfO3X9vdIgYovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IBcCeBCp; arc=none smtp.client-ip=91.218.175.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IBcCeBCp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JYUO8pXR1PnHOkY6YjAgcARFrg47TPut/HiP2MoNAoU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788941835; v=1; x=1789546635;
 b=IBcCeBCpCXo5z+sCTqzv1Rh87sSqjFNDYXuWCZUjT1+hzMlwMYRtT38IYUwvRgP9ayzedB+H
 oTZic/E7tpBizxsIZTjWdKGYr6yG4LLIQ0QyHogOsqqK3rZlyN5ep7ONJHspjcMmuoKJ2tWtbxV
 Zefrtk+CIINpNfZT85yml16Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d56a796d3ee007f6;
	Wed, 09 Sep 2026 08:17:14 +0000
X-Mizu-Trace-ID: d56a796d3ee007f6
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qingfang Deng <qingfang.deng@linux.dev>
Subject: [PATCH nf-next] netfilter: flowtable: check namespace before iterating flows
Date: Wed,  9 Sep 2026 16:17:04 +0800
Message-ID: <20260909081705.1512600-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nf_flow_table_cleanup() walks every registered flow table, checking the
network namespace for each flow in nf_flow_table_do_cleanup(). As a
result, tables in other namespaces are still iterated and their cleanup
work is flushed.

Compare the flow table's namespace with the device's namespace in
nf_flow_table_cleanup() and skip nonmatching tables. This avoids
unnecessary iteration and work flushing, and leaves the per-flow cleanup
callback to check only the interface index.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 net/netfilter/nf_flow_table_core.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 03241d4bfd5e..52cca7a8f141 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -730,14 +730,9 @@ static void nf_flow_table_do_cleanup(struct nf_flowtable *flow_table,
 {
 	struct net_device *dev = data;
 
-	if (!dev) {
-		flow_offload_teardown(flow);
-		return;
-	}
-
-	if (net_eq(nf_ct_net(flow->ct), dev_net(dev)) &&
-	    (flow->tuplehash[0].tuple.iifidx == dev->ifindex ||
-	     flow->tuplehash[1].tuple.iifidx == dev->ifindex))
+	if (!dev ||
+	    flow->tuplehash[0].tuple.iifidx == dev->ifindex ||
+	    flow->tuplehash[1].tuple.iifidx == dev->ifindex)
 		flow_offload_teardown(flow);
 }
 
@@ -754,8 +749,10 @@ void nf_flow_table_cleanup(struct net_device *dev)
 	struct nf_flowtable *flowtable;
 
 	mutex_lock(&flowtable_lock);
-	list_for_each_entry(flowtable, &flowtables, list)
-		nf_flow_table_gc_cleanup(flowtable, dev);
+	list_for_each_entry(flowtable, &flowtables, list) {
+		if (net_eq(read_pnet(&flowtable->net), dev_net(dev)))
+			nf_flow_table_gc_cleanup(flowtable, dev);
+	}
 	mutex_unlock(&flowtable_lock);
 }
 EXPORT_SYMBOL_GPL(nf_flow_table_cleanup);
-- 
2.43.0

