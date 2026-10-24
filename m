Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837498;
	b=1AR9f9XJWrSRn/eIbxWACDTYxrDglr3O5v0VYJWkoPUty6nsO2uYuDJapFTIqA4dKfx6
	 kxIJyw3RAe+dr0WwXIJYCeFy+98OxT8Ja/IkxgX/wXCMJnsg7RmIRasbDX/QnIhICUO6p
	 XGBmbEtOMT8BbafbNwD3wakCkI/qQCCIx1jZ655aoD0FB+afBcXRlLxNUHXBZncN4hhkN
	 nxXwheyiivjEWqM4SHu1F8rs9l3JxeyRFCigjiLai3fdVBi4fI4jjmKuvyU8lgjZ9STxO
	 ZU5jnGwVftpJI3QIv/Lc1dlJgubaLPtd46F9Th5cklriEkPLFSmTSMqFx75HL1DNUoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837498;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Scanned-By;
	bh=6zOZlRzS//IO0nB1OZeH2iXbM3So8Xu6y3HzW3Rd4M8=;
	b=LU5Ofa75uc3I9dd6VZFSRUKG7O8ZDfrf18sgA/eaM5tdx0ZKpjclcL8beA3EygNevmy9
	 8AuJarxBZ9P+poO6i491Rj5Gj6kmnoSvtiTn1FecQOJHKCR+HC0SA8gMtwGpB6baejmgK
	 bPZRbml2Iqh5FHnYZQ2CWfeml01JlqqczDCgId3WGNbSTVQcQzlYelPuk1Wv/lztlwjNM
	 dLXSfKaRwy7h/nEPuIUzpH+cHbfwS6bcQD9eUd3vPe4ZPttfp184ND0h1Pqy/wKlrczNs
	 06sUy+UylT8tZ2l6kH0iNVZc4jjoOUZBKG/DVs24gXuDqXvXLxljTU6R5eL/8uKvtUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fik+0ETB;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24DA606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A24DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fik+0ETB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792837496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=6zOZlRzS//IO0nB1OZeH2iXbM3So8Xu6y3HzW3Rd4M8=;
	b=fik+0ETBttpdTMQ8OMTCeyvaiurofcPFoBalA/+Z2QNXYpgwHH/ly+BInVL4W7j2YINpno
	1XPiiuVkotHY4MCyBsv9PWTjx9a4URLh6IJvn5eEWNi0WEiWxkA59o5YjB8IJFtAR28gk0
	7mN13HtvGO4eun1NyMYapfxKDEHLT1o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-RSKocTXeMi2UuJUnR8xaVg-1; Sat,
 24 Oct 2026 06:24:55 -0400
X-MC-Unique: RSKocTXeMi2UuJUnR8xaVg-1
X-Mimecast-MFC-AGG-ID: RSKocTXeMi2UuJUnR8xaVg_1792837494
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4AC5C1800593
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:24:54 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A69FB1800345
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:24:53 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sat, 24 Oct 2026 12:24:53 +0200 (CEST)
Date: Sat, 24 Oct 2026 12:24:52 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] net/rds: move the sysctl code under ifdef(SYSCTL)
Message-ID: <atyHdPlxALv0Nnyj@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Not for inclusion yet, conficts with recent fixes, just to get
the review from Sashiko.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>

---
 net/rds/ib_sysctl.c |  31 ++++--
 net/rds/sysctl.c    |  24 ++++-
 net/rds/tcp.c       | 230 +++++++++++++++++++++++---------------------
 net/rds/tcp.h       |   2 +
 4 files changed, 166 insertions(+), 121 deletions(-)

diff --git a/net/rds/ib_sysctl.c b/net/rds/ib_sysctl.c
index 2af678e71e3c..0b336ff03ae9 100644
--- a/net/rds/ib_sysctl.c
+++ b/net/rds/ib_sysctl.c
@@ -36,19 +36,10 @@
 
 #include "ib.h"
 
-static struct ctl_table_header *rds_ib_sysctl_hdr;
-
 unsigned long rds_ib_sysctl_max_send_wr = RDS_IB_DEFAULT_SEND_WR;
 unsigned long rds_ib_sysctl_max_recv_wr = RDS_IB_DEFAULT_RECV_WR;
 unsigned long rds_ib_sysctl_max_recv_allocation = (128 * 1024 * 1024) / RDS_FRAG_SIZE;
-static unsigned long rds_ib_sysctl_max_wr_min = 1;
-/* hardware will fail CQ creation long before this */
-static unsigned long rds_ib_sysctl_max_wr_max = (u32)~0;
-
 unsigned long rds_ib_sysctl_max_unsig_wrs = 16;
-static unsigned long rds_ib_sysctl_max_unsig_wr_min = 1;
-static unsigned long rds_ib_sysctl_max_unsig_wr_max = 64;
-
 /*
  * This sysctl does nothing.
  *
@@ -61,6 +52,14 @@ static unsigned long rds_ib_sysctl_max_unsig_wr_max = 64;
  */
 unsigned int rds_ib_sysctl_flow_control = 0;
 
+#ifdef CONFIG_SYSCTL
+static unsigned long rds_ib_sysctl_max_wr_min = 1;
+/* hardware will fail CQ creation long before this */
+static unsigned long rds_ib_sysctl_max_wr_max = (u32)~0;
+
+static unsigned long rds_ib_sysctl_max_unsig_wr_min = 1;
+static unsigned long rds_ib_sysctl_max_unsig_wr_max = 64;
+
 static struct ctl_table rds_ib_sysctl_table[] = {
 	{
 		.procname       = "max_send_wr",
@@ -105,6 +104,8 @@ static struct ctl_table rds_ib_sysctl_table[] = {
 	},
 };
 
+static struct ctl_table_header *rds_ib_sysctl_hdr;
+
 void rds_ib_sysctl_exit(void)
 {
 	if (rds_ib_sysctl_hdr)
@@ -118,3 +119,15 @@ int rds_ib_sysctl_init(void)
 		return -ENOMEM;
 	return 0;
 }
+
+#else
+
+int rds_ib_sysctl_init(void)
+{
+	return 0;
+}
+
+void rds_ib_sysctl_exit(void)
+{
+}
+#endif
diff --git a/net/rds/sysctl.c b/net/rds/sysctl.c
index 025f518a4349..47e8782b1aa3 100644
--- a/net/rds/sysctl.c
+++ b/net/rds/sysctl.c
@@ -36,11 +36,6 @@
 
 #include "rds.h"
 
-static struct ctl_table_header *rds_sysctl_reg_table;
-
-static unsigned long rds_sysctl_reconnect_min = 1;
-static unsigned long rds_sysctl_reconnect_max = ~0UL;
-
 unsigned long rds_sysctl_reconnect_min_jiffies;
 unsigned long rds_sysctl_reconnect_max_jiffies = HZ;
 
@@ -49,6 +44,10 @@ unsigned int  rds_sysctl_max_unacked_bytes = (16 << 20);
 
 unsigned int rds_sysctl_ping_enable = 1;
 
+#ifdef CONFIG_SYSCTL
+static unsigned long rds_sysctl_reconnect_min = 1;
+static unsigned long rds_sysctl_reconnect_max = ~0UL;
+
 static struct ctl_table rds_sysctl_rds_table[] = {
 	{
 		.procname       = "reconnect_min_delay_ms",
@@ -91,6 +90,8 @@ static struct ctl_table rds_sysctl_rds_table[] = {
 	},
 };
 
+static struct ctl_table_header *rds_sysctl_reg_table;
+
 void rds_sysctl_exit(void)
 {
 	unregister_net_sysctl_table(rds_sysctl_reg_table);
@@ -107,3 +108,16 @@ int rds_sysctl_init(void)
 		return -ENOMEM;
 	return 0;
 }
+
+#else
+
+int rds_sysctl_init(void)
+{
+	rds_sysctl_reconnect_min_jiffies = msecs_to_jiffies(1);
+	return 0;
+}
+
+void rds_sysctl_exit(void)
+{
+}
+#endif
diff --git a/net/rds/tcp.c b/net/rds/tcp.c
index 774a71f88d37..372899a2ec81 100644
--- a/net/rds/tcp.c
+++ b/net/rds/tcp.c
@@ -53,13 +53,71 @@ static atomic_t rds_tcp_unloading = ATOMIC_INIT(0);
 
 static struct kmem_cache *rds_tcp_conn_slab;
 
+#ifdef CONFIG_SYSCTL
+static int rds_tcp_min_sndbuf = SOCK_MIN_SNDBUF;
+static int rds_tcp_min_rcvbuf = SOCK_MIN_RCVBUF;
+
+/* when sysctl is used to modify some kernel socket parameters,this
+ * function  resets the RDS connections in that netns  so that we can
+ * restart with new parameters.  The assumption is that such reset
+ * events are few and far-between.
+ */
+static void rds_tcp_sysctl_reset(struct net *net)
+{
+	struct rds_tcp_connection *tc, *_tc;
+
+	spin_lock_irq(&rds_tcp_conn_lock);
+	list_for_each_entry_safe(tc, _tc, &rds_tcp_conn_list, t_tcp_node) {
+		struct net *c_net = read_pnet(&tc->t_cpath->cp_conn->c_net);
+
+		if (net != c_net || !tc->t_sock)
+			continue;
+
+		/* reconnect with new parameters */
+		rds_conn_path_drop(tc->t_cpath, false);
+	}
+	spin_unlock_irq(&rds_tcp_conn_lock);
+}
+
+static int rds_tcp_skbuf_handler(struct rds_tcp_net *rtn,
+				 const struct ctl_table *ctl, int write,
+				 void *buffer, size_t *lenp, loff_t *fpos)
+{
+	int err;
+
+	err = proc_dointvec_minmax(ctl, write, buffer, lenp, fpos);
+	if (err < 0) {
+		pr_warn("Invalid input. Must be >= %d\n",
+			*(int *)(ctl->extra1));
+		return err;
+	}
+
+	if (write && rtn->rds_tcp_listen_sock && rtn->rds_tcp_listen_sock->sk) {
+		struct net *net = sock_net(rtn->rds_tcp_listen_sock->sk);
+
+		rds_tcp_sysctl_reset(net);
+	}
+
+	return 0;
+}
+
 static int rds_tcp_sndbuf_handler(const struct ctl_table *ctl, int write,
-				  void *buffer, size_t *lenp, loff_t *fpos);
+				  void *buffer, size_t *lenp, loff_t *fpos)
+{
+	struct rds_tcp_net *rtn = container_of(ctl->data, struct rds_tcp_net,
+					       sndbuf_size);
+
+	return rds_tcp_skbuf_handler(rtn, ctl, write, buffer, lenp, fpos);
+}
+
 static int rds_tcp_rcvbuf_handler(const struct ctl_table *ctl, int write,
-				  void *buffer, size_t *lenp, loff_t *fpos);
+				  void *buffer, size_t *lenp, loff_t *fpos)
+{
+	struct rds_tcp_net *rtn = container_of(ctl->data, struct rds_tcp_net,
+					       rcvbuf_size);
 
-static int rds_tcp_min_sndbuf = SOCK_MIN_SNDBUF;
-static int rds_tcp_min_rcvbuf = SOCK_MIN_RCVBUF;
+	return rds_tcp_skbuf_handler(rtn, ctl, write, buffer, lenp, fpos);
+}
 
 static struct ctl_table rds_tcp_sysctl_table[] = {
 #define	RDS_TCP_SNDBUF	0
@@ -82,6 +140,61 @@ static struct ctl_table rds_tcp_sysctl_table[] = {
 	},
 };
 
+static __net_init int rds_tcp_init_net_sysctl(struct net *net)
+{
+	struct rds_tcp_net *rtn = net_generic(net, rds_tcp_netid);
+	struct ctl_table *tbl;
+
+	/* {snd, rcv}buf_size default to 0, which implies we let the
+	 * stack pick the value, and permit auto-tuning of buffer size.
+	 */
+	if (net == &init_net) {
+		tbl = rds_tcp_sysctl_table;
+	} else {
+		tbl = kmemdup(rds_tcp_sysctl_table,
+			      sizeof(rds_tcp_sysctl_table), GFP_KERNEL);
+		if (!tbl) {
+			pr_warn("could not set allocate sysctl table\n");
+			return -ENOMEM;
+		}
+		rtn->ctl_table = tbl;
+	}
+	tbl[RDS_TCP_SNDBUF].data = &rtn->sndbuf_size;
+	tbl[RDS_TCP_RCVBUF].data = &rtn->rcvbuf_size;
+	rtn->rds_tcp_sysctl = register_net_sysctl_sz(net, "net/rds/tcp", tbl,
+						     ARRAY_SIZE(rds_tcp_sysctl_table));
+	if (!rtn->rds_tcp_sysctl) {
+		pr_warn("could not register sysctl\n");
+		if (net != &init_net)
+			kfree(tbl);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void __net_exit rds_tcp_exit_net_sysctl(struct net *net)
+{
+	struct rds_tcp_net *rtn = net_generic(net, rds_tcp_netid);
+
+	if (rtn->rds_tcp_sysctl) {
+		unregister_net_sysctl_table(rtn->rds_tcp_sysctl);
+		rtn->rds_tcp_sysctl = NULL;
+	}
+
+	if (net != &init_net)
+		kfree(rtn->ctl_table);
+}
+#else
+static inline int rds_tcp_init_net_sysctl(struct net *net)
+{
+	return 0;
+}
+static inline void rds_tcp_exit_net_sysctl(struct net *net)
+{
+}
+#endif
+
 u32 rds_tcp_write_seq(struct rds_tcp_connection *tc)
 {
 	/* seq# of the last byte of data in tcp send buffer */
@@ -612,36 +725,15 @@ void rds_tcp_accept_work(struct rds_tcp_net *rtn)
 static __net_init int rds_tcp_init_net(struct net *net)
 {
 	struct rds_tcp_net *rtn = net_generic(net, rds_tcp_netid);
-	struct ctl_table *tbl;
 	int err = 0;
 
 	memset(rtn, 0, sizeof(*rtn));
 
 	mutex_init(&rtn->rds_tcp_accept_lock);
 
-	/* {snd, rcv}buf_size default to 0, which implies we let the
-	 * stack pick the value, and permit auto-tuning of buffer size.
-	 */
-	if (net == &init_net) {
-		tbl = rds_tcp_sysctl_table;
-	} else {
-		tbl = kmemdup(rds_tcp_sysctl_table,
-			      sizeof(rds_tcp_sysctl_table), GFP_KERNEL);
-		if (!tbl) {
-			pr_warn("could not set allocate sysctl table\n");
-			return -ENOMEM;
-		}
-		rtn->ctl_table = tbl;
-	}
-	tbl[RDS_TCP_SNDBUF].data = &rtn->sndbuf_size;
-	tbl[RDS_TCP_RCVBUF].data = &rtn->rcvbuf_size;
-	rtn->rds_tcp_sysctl = register_net_sysctl_sz(net, "net/rds/tcp", tbl,
-						     ARRAY_SIZE(rds_tcp_sysctl_table));
-	if (!rtn->rds_tcp_sysctl) {
-		pr_warn("could not register sysctl\n");
-		err = -ENOMEM;
-		goto fail;
-	}
+	err = rds_tcp_init_net_sysctl(net);
+	if (err)
+		return err;
 
 #if IS_ENABLED(CONFIG_IPV6)
 	rtn->rds_tcp_listen_sock = rds_tcp_listen_init(net, true);
@@ -656,21 +748,14 @@ static __net_init int rds_tcp_init_net(struct net *net)
 		rtn->rds_tcp_listen_sock = rds_tcp_listen_init(net, false);
 		if (!rtn->rds_tcp_listen_sock) {
 #endif
-			unregister_net_sysctl_table(rtn->rds_tcp_sysctl);
-			rtn->rds_tcp_sysctl = NULL;
-			err = -EAFNOSUPPORT;
-			goto fail;
+			rds_tcp_exit_net_sysctl(net);
+			return -EAFNOSUPPORT;
 #if IS_ENABLED(CONFIG_IPV6)
 		}
 #endif
 	}
 	INIT_WORK(&rtn->rds_tcp_accept_w, rds_tcp_accept_worker);
 	return 0;
-
-fail:
-	if (net != &init_net)
-		kfree(tbl);
-	return err;
 }
 
 static void rds_tcp_kill_sock(struct net *net)
@@ -704,14 +789,7 @@ static void rds_tcp_kill_sock(struct net *net)
 
 static void __net_exit rds_tcp_exit_net(struct net *net)
 {
-	struct rds_tcp_net *rtn = net_generic(net, rds_tcp_netid);
-
-	if (rtn->rds_tcp_sysctl)
-		unregister_net_sysctl_table(rtn->rds_tcp_sysctl);
-
-	if (net != &init_net)
-		kfree(rtn->ctl_table);
-
+	rds_tcp_exit_net_sysctl(net);
 	rds_tcp_kill_sock(net);
 }
 
@@ -733,68 +811,6 @@ void *rds_tcp_listen_sock_def_readable(struct net *net)
 	return lsock->sk->sk_user_data;
 }
 
-/* when sysctl is used to modify some kernel socket parameters,this
- * function  resets the RDS connections in that netns  so that we can
- * restart with new parameters.  The assumption is that such reset
- * events are few and far-between.
- */
-static void rds_tcp_sysctl_reset(struct net *net)
-{
-	struct rds_tcp_connection *tc, *_tc;
-
-	spin_lock_irq(&rds_tcp_conn_lock);
-	list_for_each_entry_safe(tc, _tc, &rds_tcp_conn_list, t_tcp_node) {
-		struct net *c_net = read_pnet(&tc->t_cpath->cp_conn->c_net);
-
-		if (net != c_net || !tc->t_sock)
-			continue;
-
-		/* reconnect with new parameters */
-		rds_conn_path_drop(tc->t_cpath, false);
-	}
-	spin_unlock_irq(&rds_tcp_conn_lock);
-}
-
-static int rds_tcp_skbuf_handler(struct rds_tcp_net *rtn,
-				 const struct ctl_table *ctl, int write,
-				 void *buffer, size_t *lenp, loff_t *fpos)
-{
-	int err;
-
-	err = proc_dointvec_minmax(ctl, write, buffer, lenp, fpos);
-	if (err < 0) {
-		pr_warn("Invalid input. Must be >= %d\n",
-			*(int *)(ctl->extra1));
-		return err;
-	}
-
-	if (write && rtn->rds_tcp_listen_sock && rtn->rds_tcp_listen_sock->sk) {
-		struct net *net = sock_net(rtn->rds_tcp_listen_sock->sk);
-
-		rds_tcp_sysctl_reset(net);
-	}
-
-	return 0;
-}
-
-static int rds_tcp_sndbuf_handler(const struct ctl_table *ctl, int write,
-				  void *buffer, size_t *lenp, loff_t *fpos)
-{
-	struct rds_tcp_net *rtn = container_of(ctl->data, struct rds_tcp_net,
-					       sndbuf_size);
-
-	return rds_tcp_skbuf_handler(rtn, ctl, write, buffer, lenp, fpos);
-}
-
-static int rds_tcp_rcvbuf_handler(const struct ctl_table *ctl, int write,
-				  void *buffer, size_t *lenp, loff_t *fpos)
-{
-	struct rds_tcp_net *rtn = container_of(ctl->data, struct rds_tcp_net,
-					       rcvbuf_size);
-
-	return rds_tcp_skbuf_handler(rtn, ctl, write, buffer, lenp, fpos);
-}
-
 static void rds_tcp_exit(void)
 {
 	rds_tcp_set_unloading();
diff --git a/net/rds/tcp.h b/net/rds/tcp.h
index 39c86347188c..12b58d76c089 100644
--- a/net/rds/tcp.h
+++ b/net/rds/tcp.h
@@ -13,8 +13,10 @@ struct rds_tcp_net {
 	struct socket		*rds_tcp_listen_sock;
 	struct socket		*rds_tcp_accepted_sock;
 	struct work_struct	rds_tcp_accept_w;
+#ifdef CONFIG_SYSCTL
 	struct ctl_table_header	*rds_tcp_sysctl;
 	const struct ctl_table	*ctl_table;
+#endif
 	int			sndbuf_size;
 	int			rcvbuf_size;
 };
-- 
2.55.0


