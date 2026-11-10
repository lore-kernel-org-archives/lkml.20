Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312231;
	b=WNdGjYdaH/A37VkSQC6Mr48L5mGfAdv8p/izOza8q151fbD+6Cmcf9it5jKOZ8nq1Esh
	 gh4Eck2H3qan+UkBKGmrArcLir1ProQrgo5Q21GTN3j/CXL/C8oMaZ9UFrUwtGNB0EfR0
	 VnuLyaJTb2A5gFe8bTQh0KoB5jhUVvfbpR70ql3nR8WVe7iN0oDeJHp6p9duM2Q+HeFv1
	 F1t68kMa8QlKK7eLy6vx3w8mwon+TTcdmenziDN4dDOpUAawLxRpyywl7Wa+R+dYrxJoZ
	 Yx/+cmi5FfhhRcNu0DKmBLiifbInoS/clHCHfngJnsSOOqR+wYvIYYZaXldGWtXL6Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1unnli9q1E0mHNtcr8F0RHVI3I4DtNu0vjyeqxGMrD8=;
	b=fAJ+d5JjKYKCEJ94nKJOWT77vA+hipuZAtBsbogBKKmggeu+H5+2ZL2WGrtbXlUdT7j9
	 rxkLBA+UOuujJaqO1h7BqPYGaL26a0S1LLDJH02xSk0/or1POTCszzc1eRuPUDApOSnVk
	 KXml6P1xLF1grdXL+NmNXC7ZcagWqKA+kyNuR+c6mq9BDt4mMKQM6OdfFQQNWulwGuySG
	 4j0PaJ3JjucvEmveigrDFHU/lHp0k8k5jefc4srUQVjZBs26YXmTcujbSSakYy2e23nSR
	 SghNDgyCLRjTI0JMibspxcU2EyosCBxfeIdX9CRS8QzAj5hAPJlt2+fCF2xLLPCY8eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWuBFx2g;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9106606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9106606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWuBFx2g
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1273899a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794312230; x=1794917030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1unnli9q1E0mHNtcr8F0RHVI3I4DtNu0vjyeqxGMrD8=;
        b=DWuBFx2gpkNO/jw5PFJUAGAJB7rJ+Fmpia0qAuoEL01jBrX2mTicsAkJN8M2l5zHPk
         Rvk2E/Fc6jjTdB2DW0N/b3qw1Zpgvb4uhl7Nu0AFAQZ1k6ulRmIHiq7j75kjS1VfwYoU
         axQhiwCC4miwDxdwJCa6ldgjSFzdW+9upbKQaTE2lV79S7U62a2KUm99AdHjlrj/842D
         SQHR7n4e6JBiMxbfm8IRtMlMvTZGyo5X8A8EzLRYSgqLvRBkf1ZNfsIEQqMRuqXlCaiP
         deOWT7FDOfJjepWlwU3lYPQE1Aio7JxYYrBYnAl+cqgSwxfFLQsuS/zxWHMmEtMMP+Nc
         l4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312230; x=1794917030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1unnli9q1E0mHNtcr8F0RHVI3I4DtNu0vjyeqxGMrD8=;
        b=cED33c0c2ZobVgcXY75OsV0ap5Kroc5KMOvpSJRk/4+TF0I5qEVGNGYWEpQVCeRF4P
         X825dWrChd0z3rXE1XVkqg13iHwWDV5JFRryuML+8t8ezNYicrqiDuIlPgdwYFENyy0U
         coMPgkBLxebBResGhxmEiGgGMsoN/3k/pzUuPc51CA3qCIwX6ZRxOyKBPOf4OxdYSKgR
         2JnBXXwM/lgiOJrg35yhTSZIJndT2jSYvXFDPrAHhHvS72Y5lmB1xRG6L0OamGtN4TxJ
         c2XLPvq8sp4FRSNDwVUA8f+v2sVWHZhCKUPTtSW8ytixIxaMR6tXGv+eb5SqsAsrzHoR
         xfYw==
X-Forwarded-Encrypted: i=1; AL+hErG/P+MQVdJM00lTqh+BnZKc0VDhYTJZ5vIB14i4DEseFkha1kCiqRK1oAUa9EAeP1RKT+pa6vioXx3kJdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uf6UiAjbR5UXZz4AedkMtXHQMekC3OKq0MMdxEPGNXkmVGqw9
	dY7Ai7gtE8N8TzokrNYt3m2vEwgupep+GrZuNfs8q+yc00WcgqL4iags
X-Gm-Gg: AYBFou10xgH0YU9O61Ak3emNk7HpI2Wr19ezJsoHj7RZhQmiTz11FP/JPL8XT+zg3Mp
	2qJl9EgJTkMGPBoLOBWmynBrc3rkOvLrhAAlwtN6oJN1wFDaVtiV+wbGQCzTvAR8NV78xfU1dGG
	gnQAWu+X7WmjLmd0PtbUsphUGm8107tea8MW3/HFtR7S5oZxh42Lns5o9B5gt1vmB7fmPvhwWtN
	9ZnxrE6TgD2tsQSF67zY39X2wKi7xtXReXfxwPr3flWvYrbeUOE5Yd6FAXglxbHhh4Ih0qxKglw
	nYggwu7pbrghc0YyoJlRokWlbBfwbEHBZPuyEZ0DvkvxiUrhe0acUT0Ztc+Ic9luH/1frdMrxxq
	z4Ex22vSsUECPR2vBpAx3K3bUGc95HJgpUQLAnI10iYOisSvHxIUN25SYat5KC62xCxIB5SzSIj
	0mAvPUOj5hj/0F4wtbndz1nCi3KhDGJM02XcJHdHowpNBdFudJxXAlgS2NoCp1ne9HM/wRToIYW
	JRByVmmqeGtLqS0IjTHvjV490zonCUU3y+1PpzawEbw1Grrnnr9VALra4taSVEXkPZX/maEUVw5
	m8dEgc+F2mr/+XxHaJpMegYW40osU2hyfP6S2DkmKdlE2tRdihypEmYc3NvbjN0=
X-Received: by 2002:a17:90b:3c06:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3b166cbd7ddmr2437248a91.44.1794312230164;
        Tue, 10 Nov 2026 04:03:50 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16771705asm3693853a91.12.2026.11.10.04.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:03:49 -0800 (PST)
From: liuyong <pkfxxxing@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] sctp: revalidate the association socket in timer callbacks
Date: Tue, 10 Nov 2026 20:02:09 +0800
Message-ID: <20261110120212.1110283-2-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110120212.1110283-1-pkfxxxing@gmail.com>
References: <20261110120212.1110283-1-pkfxxxing@gmail.com>
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

SCTP timer callbacks cache asoc->base.sk before acquiring its BH lock.
An accept or peeloff can move the association to a new socket in between.
The callback can then run the state machine under the old socket lock,
while an abort on the new socket tears down the association's queues.
The timer's transport and association references do not keep those
queues alive. With delays inserted to widen the race, KASAN reported a
slab-use-after-free in sctp_chunk_abandoned() from the T3 retransmit path.

Recheck the association's socket after acquiring its BH lock. Treat a
mismatch like a busy socket and use the existing reference-counted timer
rescheduling path. The next callback reads the current socket again,
preventing state-machine execution under the old socket's lock. Retain
the user-ownership check to handle a migration already in progress.

Apply the check to the T3, association, heartbeat, protocol-unreachable,
reconfiguration and probe timers. Their BH context and the endpoint's
RCU-deferred sock_put() protect the cached socket during the callback.
Pair the socket pointer reads with WRITE_ONCE() in sctp_assoc_migrate(),
taking the new socket reference before updating the pointer.

The issue was discovered and fixed by Qihoo 360's Tulongfeng multi-agent
system.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: liuyong <pkfxxxing@gmail.com>
---
 net/sctp/associola.c     |  4 ++--
 net/sctp/sm_sideeffect.c | 41 ++++++++++++++++++++--------------------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/net/sctp/associola.c b/net/sctp/associola.c
index 4521be3bd8..c5d520c8d7 100644
--- a/net/sctp/associola.c
+++ b/net/sctp/associola.c
@@ -1088,8 +1088,8 @@ void sctp_assoc_migrate(struct sctp_association *assoc, struct sock *newsk)
 	sctp_endpoint_hold(assoc->ep);
 
 	/* Get a reference to the new sock.  */
-	assoc->base.sk = newsk;
-	sock_hold(assoc->base.sk);
+	sock_hold(newsk);
+	WRITE_ONCE(assoc->base.sk, newsk);
 
 	/* Add the association to the new endpoint's list of associations.  */
 	sctp_endpoint_add_asoc(newsp->ep, assoc);
diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index 35f540fb15..bd6b23369f 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -233,15 +233,14 @@ void sctp_generate_t3_rtx_event(struct timer_list *t)
 	struct sctp_transport *transport =
 		timer_container_of(transport, t, T3_rtx_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error;
 
-	/* Check whether a task is in the sock.  */
-
+	/* Defer if the socket is busy or the association has migrated. */
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -271,13 +270,13 @@ void sctp_generate_t3_rtx_event(struct timer_list *t)
 static void sctp_generate_timeout_event(struct sctp_association *asoc,
 					enum sctp_event_timeout timeout_type)
 {
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy: timer %d\n", __func__,
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved: timer %d\n", __func__,
 			 timeout_type);
 
 		/* Try again later.  */
@@ -362,7 +361,7 @@ static void sctp_generate_autoclose_event(struct timer_list *t)
 	sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_AUTOCLOSE);
 }
 
-/* Generate a heart beat event.  If the sock is busy, reschedule.   Make
+/* Generate a heart beat event.  If the sock is busy or moved, reschedule.   Make
  * sure that the transport is still valid.
  */
 void sctp_generate_heartbeat_event(struct timer_list *t)
@@ -370,14 +369,14 @@ void sctp_generate_heartbeat_event(struct timer_list *t)
 	struct sctp_transport *transport = timer_container_of(transport, t,
 							      hb_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	u32 elapsed, timeout;
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -418,12 +417,12 @@ void sctp_generate_proto_unreach_event(struct timer_list *t)
 	struct sctp_transport *transport =
 		timer_container_of(transport, t, proto_unreach_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -454,13 +453,13 @@ void sctp_generate_reconf_event(struct timer_list *t)
 	struct sctp_transport *transport =
 		timer_container_of(transport, t, reconf_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -492,13 +491,13 @@ void sctp_generate_probe_event(struct timer_list *t)
 	struct sctp_transport *transport = timer_container_of(transport, t,
 							      probe_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
-- 
2.43.0

