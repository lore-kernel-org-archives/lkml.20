Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205538;
	b=5PY4rKD6bVyoKxHAW0vpGP9unFiWFlQ1z8yEZEzWrFIv/elRyyAYLHqyjxqHJoEwcfo7
	 gE8AkuF2/TscjhhJu5ZwbVFT0fNxXrVhp9cLenUQVr9nzZvrLyFtxk8Rwx65RUhbIIXf3
	 MMH/m4zfNr0LdBLLaHS7tZHi9cycG2CqzF10pMnu/fNqIP07meqVqhIC0Auygv6XMOLcG
	 lc0EOGpT2RCyiak+qumSa9qbMJfcpoMgAHOi/YL8nkTE4V2PTHl7UF/76BGBdtZI36kKf
	 b4sLV4DQ5zf3osDclTNHvT3ZbaWn+EoU5oRRs0C9+tgY/krdG8mcZzeQrcm2KcD+kWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205538;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QSKBaiGXHt+4qQH7pG2VnJvANmW2EAlk7ob12Ez8kFM=;
	b=EPFRE51Oq+MRmU/CK3ekxdIfqn1Pk0fw1B5hur80hGPgjYMspPfr2aX1zi/iixQXMNOb
	 H7DAxJ2zFHIzeBcYdyIdkS8D0FFZmCdQb8smDiwJZzte9iY2xZMnj8/t3RGze3U2guciJ
	 kAKEYkZergDwNkpr9UvwsilLs8Dw15eCJ9M9Lu1lzZ+G0EQ1kdbP6lgABBFMHRYOkyYhK
	 RnH92eti8b3Unry+9BgdHwFbF0sbiN1MSdCIe/RrLURhCc58DkY//x6N/pyMmJKWRnOGA
	 qXixVY9nJZf+ZU0P1eaFXQvbed6qGO98LrjZAvn6p7lJthTCSHSiTDyM4Y9RLyv2G3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ulkiOU7o;
	arc=none smtp.remote-ip=91.218.175.91
Received: from mta0.migadu.com (out-91.mta0.migadu.com [91.218.175.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE01160A382D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE01160A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ulkiOU7o
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6ROvPKTlne3UOVvR3mOynIgw9XxCJw9ISos9bJc+n6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205536; v=1; x=1793810336;
 b=ulkiOU7oVorwsy+kIzuGDYmaaiPdxYqslrphFFZmHJeUurS0iPOknzaq5FmXsFjcsYS7BZla
 26LV8X4EjRlFB9aEmfa10Z7semI9S1F/1MY4OIbjBAZrGFlCYf+TlNKNTl0l10OHiww2wjRQNtL
 oBnZuDHquP7C4Sg9ghaqSHlA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f7cad60e308d7741;
	Wed, 28 Oct 2026 16:38:55 +0000
X-Mizu-Trace-ID: f7cad60e308d7741
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 37/39] net: move namespace sysctl context to priv
Date: Thu, 29 Oct 2026 00:35:16 +0800
Message-Id: <b0e2052fd4025708478a800ccc4356b1786ac075.1793204511.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Several per-net handlers store the owning struct net in data and resolve
their real storage elsewhere: the route flush entry, MPLS platform
labels, the VRF strict-mode switch, the RPS default mask and the IPv4
local port range and multipath hash seed.

Point data at backed storage where one exists, otherwise leave it NULL,
and carry the namespace in priv. The duplication paths copy the
namespace into priv instead of offsetting data, so a handler can no
longer mistake an offset for its owner.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 drivers/net/vrf.c          |  4 ++--
 net/core/sysctl_net_core.c | 11 +++++++++--
 net/ipv4/route.c           |  4 ++--
 net/ipv4/sysctl_net_ipv4.c | 13 ++++++++-----
 net/mpls/af_mpls.c         |  9 ++++++---
 5 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/net/vrf.c b/drivers/net/vrf.c
index 993cc2d120fd..fcbb43c72ff7 100644
--- a/drivers/net/vrf.c
+++ b/drivers/net/vrf.c
@@ -1826,7 +1826,7 @@ static int vrf_strict_mode_change(struct vrf_map *vmap, bool new_mode)
 static int vrf_shared_table_handler(const struct ctl_table *table, int write,
 				    void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct net *net = table->data;
+	struct net *net = table->priv;
 	struct vrf_map *vmap = netns_vrf_map(net);
 	int proc_strict_mode = 0;
 	struct ctl_table tmp = *table;
@@ -1865,7 +1865,7 @@ static int vrf_netns_init_sysctl(struct net *net, struct netns_vrf *nn_vrf)
 	if (!table)
 		return -ENOMEM;
 
-	table[0].data = net;
+	table[0].priv = net;
 
 	nn_vrf->ctl_hdr = register_net_sysctl_sz(net, "net/vrf", table,
 						 ARRAY_SIZE(vrf_table));
diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
index 1721e63240c9..16441c83abf9 100644
--- a/net/core/sysctl_net_core.c
+++ b/net/core/sysctl_net_core.c
@@ -98,7 +98,7 @@ DEFINE_MUTEX(rps_default_mask_mutex);
 static int rps_default_mask_sysctl(const struct ctl_table *table, int write,
 				   void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct net *net = (struct net *)table->data;
+	struct net *net = table->priv;
 	struct cpumask *mask;
 	int err = 0;
 
@@ -703,7 +703,8 @@ static const struct ctl_table netns_core_table[] = {
 #if IS_ENABLED(CONFIG_RPS)
 	{
 		.procname	= "rps_default_mask",
-		.data		= &init_net,
+		.data		= NULL,
+		.priv		= &init_net,
 		.mode		= 0644,
 		.proc_handler	= rps_default_mask_sysctl
 	},
@@ -828,6 +829,12 @@ static const struct ctl_table *netns_core_table_dup(struct net *net)
 		if (tbl[i].data == &sysctl_wmem_max)
 			break;
 
+		/* Entries without backing storage carry the namespace in priv. */
+		if (tbl[i].priv) {
+			tbl[i].priv = net;
+			continue;
+		}
+
 		tbl[i].data += (char *)net - (char *)&init_net;
 	}
 	for (; i < table_size; ++i)
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index b4c415f720b2..5a8d0fcf75e3 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -3511,7 +3511,7 @@ static int ip_rt_gc_elasticity __read_mostly	= 8;
 static int ipv4_sysctl_rtcache_flush(const struct ctl_table *__ctl, int write,
 		void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct net *net = __ctl->data;
+	struct net *net = __ctl->priv;
 
 	if (write) {
 		rt_cache_flush(net);
@@ -3670,7 +3670,7 @@ static __net_init int sysctl_route_net_init(struct net *net)
 		for (i = 1; i < table_size; i++)
 			tbl[i].data += (void *)net - (void *)&init_net;
 	}
-	tbl[0].data = net;
+	tbl[0].priv = net;
 
 	net->ipv4.route_hdr = register_net_sysctl_sz(net, "net/ipv4/route",
 						     tbl, table_size);
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index 4226ce923534..e65d67567af9 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -40,7 +40,7 @@ static void set_local_port_range(struct net *net, unsigned int low, unsigned int
 static int ipv4_local_port_range(const struct ctl_table *table, int write,
 				 void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct net *net = table->data;
+	struct net *net = table->priv;
 	int ret;
 	int range[2];
 	struct ctl_table tmp = {
@@ -465,7 +465,7 @@ static int proc_fib_multipath_hash_seed(const struct ctl_table *table, int write
 					loff_t *ppos)
 {
 	struct sysctl_fib_multipath_hash_seed *mphs;
-	struct net *net = table->data;
+	struct net *net = table->priv;
 	struct ctl_table tmp;
 	u32 user_seed;
 	int ret;
@@ -824,7 +824,7 @@ static const struct ctl_table ipv4_net_table[] = {
 	{
 		.procname	= "ip_local_port_range",
 		.maxlen		= 0,
-		.data		= &init_net,
+		.priv		= &init_net,
 		.mode		= 0644,
 		.proc_handler	= ipv4_local_port_range,
 	},
@@ -1213,7 +1213,7 @@ static const struct ctl_table ipv4_net_table[] = {
 	},
 	{
 		.procname	= "fib_multipath_hash_seed",
-		.data		= &init_net,
+		.priv		= &init_net,
 		.maxlen		= sizeof(u32),
 		.mode		= 0644,
 		.proc_handler	= proc_fib_multipath_hash_seed,
@@ -1753,7 +1753,10 @@ static const struct ctl_table *ipv4_net_table_dup(struct net *net)
 		return NULL;
 
 	for (i = 0; i < table_size; i++) {
-		if (table[i].data) {
+		if (table[i].priv) {
+			/* Handler context follows the target namespace. */
+			table[i].priv = net;
+		} else if (table[i].data) {
 			/* Update the variables to point into
 			 * the current struct net
 			 */
diff --git a/net/mpls/af_mpls.c b/net/mpls/af_mpls.c
index b8df02173d7a..16058d584989 100644
--- a/net/mpls/af_mpls.c
+++ b/net/mpls/af_mpls.c
@@ -2679,7 +2679,7 @@ static int resize_platform_label_table(struct net *net, size_t limit)
 static int mpls_platform_labels(const struct ctl_table *table, int write,
 				void *buffer, size_t *lenp, loff_t *ppos)
 {
-	struct net *net = table->data;
+	struct net *net = table->priv;
 	int platform_labels = net->mpls.platform_labels;
 	int ret;
 	struct ctl_table tmp = *table;
@@ -2746,9 +2746,12 @@ static __net_init int mpls_net_init(struct net *net)
 		return -ENOMEM;
 
 	/* Table data contains only offsets relative to the base of
-	 * the mdev at this point, so make them absolute.
+	 * the mdev at this point, so make them absolute. The
+	 * platform_labels entry has no backing storage and carries the
+	 * namespace in priv instead.
 	 */
-	for (i = 0; i < table_size; i++)
+	table[0].priv = net;
+	for (i = 1; i < table_size; i++)
 		table[i].data = (char *)net + (uintptr_t)table[i].data;
 
 	net->mpls.ctl = register_net_sysctl_sz(net, "net/mpls", table,
-- 
2.25.1

