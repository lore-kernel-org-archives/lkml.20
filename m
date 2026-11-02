Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655339;
	b=ZSCrcAOWfLT9PH1mGk/rOVO/Ub0DIwPnfSVI8KA2QKi+eLfFX/+JBN0XoyZwEBC8StkV
	 5BcSpHOBg1BIq7G6boy31MCeVFq6ZQmPWA6L3jAuxUSzBnT1dID2tf4inEKddj2FrnSb1
	 wTcqS2ozXhfXqdilJmHF5MHqosJa56J81Eceme+ydR1BOd7rlDLu1R99oAXXZJyDv7D/L
	 ca16siygNV+oiPdwcwYnWdSu826++WrSP9H7ecd2l2QwOiNVwhp0apszf7Rxe7akM/2aJ
	 riHwifrcZMyYx8uXiMgKDaEGhEt1X1UgfOi8YdAU/S6/YPFoqqZkgMqJhheMzdsmv7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Fhq+7i2avgJwOD2uEVl0LVUb5N1uBTvB9X3LCdwJ+G4=;
	b=h4Jnld3QQiMA6Lrqj8Uo/HHjAnX3nkT2bQN4EAYlCETPOUlg5Pj3VtiY82rr6rEYnsID
	 ybZcmbVt3u3wR0CdBDFMlya/0jkdjnkLY6ZPl+a0XQ7LB2ADneNxEuSvbKmZ5Ol2ueFp2
	 XoXh1Yqmj63Ey+IDRYgHZO1N0veKkAR5IQke/K0BBOqTUGVtYA3tk+Fjyp8V9+nc/8zBD
	 jqqif8v0J8PB64J5pRKeWdFSUEVJK3JMDz0hW92K7gycGLESHm20Y2OjRndJjJBUGtT4I
	 J+pjRErzLIum/raeJsY6JpsQsrZi1HYsdMDXVffxRY9H7SzxGYX1p2gzavxR1qpfBUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=1pzn4ehY;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00345606EEB4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00345606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=1pzn4ehY
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3t5MhSz1XLkrq;
	Mon,  2 Nov 2026 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655326; x=1796247327; bh=Fhq+7
	i2avgJwOD2uEVl0LVUb5N1uBTvB9X3LCdwJ+G4=; b=1pzn4ehY+TxwkXFZ+gO6x
	sc8nMEGnVUNx611HWYjhxhBwW5rpcZnDWMVmCSueQGx2BCBflY/JCN5f4DOBpFc/
	uVMyJhgNXxRoG1rUdn6IULD6BHWpy7FbfW36OP+aC3bqMlhGt7mTGAxbWrmOv6Qx
	Y51P0i6ZI+HI6+YxKAettiXyi05PGiu9oBDoj68Tukj7/bmO7A0FrrDCnsNg+7LT
	c3JBm7LwuyazYB3aYmFbjTBjbGepl8c41ePSWkTbp0+oDClYTBYmCNF2NBDcseUr
	+wgLf4fHE8suO75XfWLRNzlM34UmLr9JGgiUBJ5H3+VW1BiFXHHBbSG9lG1Ze6Id
	A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id YcBqy1X1AbwS; Mon,  2 Nov 2026 21:35:26 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3f15bhz1XLkt9;
	Mon,  2 Nov 2026 21:35:26 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 10/14] Bluetooth: Add lock context annotations for connection aliases
Date: Mon,  2 Nov 2026 13:34:40 -0800
Message-ID: <23773cba436672222dfd6153aab8a278858d9e33.1793654853.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <cover.1793654853.git.bvanassche@acm.org>
References: <cover.1793654853.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Replace lockdep_assert_held() with lockdep_assume_ctx_held() where
hdev->lock, an L2CAP connection lock or an L2CAP channel lock is
accessed through a pointer alias.

Currently, lockdep_assert_held() implicitly assumes lock ownership for
Clang context analysis. Prepare for removing the context assumption from
lockdep_assert_held(). In Bluetooth code, functions access members
guarded by hdev->lock (such as l2cap_data) or call functions requiring
hdev->lock through connection pointer aliases (hcon->hdev->lock,
conn->hdev->lock, link->conn->hdev->lock). Similarly, L2CAP functions
call functions that require chan->conn->lock while holding conn->lock,
and l2cap_ecred_rsp_defer() relies on rsp->locked_chan->lock,
rsp->locked_chan->conn->lock, chan->lock and chan->conn->lock being
held.

Replace lockdep_assert_held() with lockdep_assume_ctx_held() at these
alias access points. This informs Clang context analysis that the lock
is held and preserves the runtime lockdep checks.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 net/bluetooth/6lowpan.c    |  2 +-
 net/bluetooth/iso.c        |  8 +++----
 net/bluetooth/l2cap_core.c | 48 +++++++++++++++++++-------------------
 net/bluetooth/mgmt.c       |  2 +-
 net/bluetooth/smp.c        |  2 +-
 5 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
index 8c51c20f6c4b..0a1a067d4870 100644
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@ -1019,7 +1019,7 @@ static int get_l2cap_conn(char *buf, bdaddr_t *addr=
, u8 *addr_type,
 		return -ENOENT;
 	}
=20
-	lockdep_assert_held(&hcon->hdev->lock);
+	lockdep_assume_ctx_held(&hcon->hdev->lock);
=20
 	*conn =3D l2cap_conn_hold_unless_zero(hcon->l2cap_data);
=20
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index c1fdd9846eeb..bedac9b0682e 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -466,7 +466,7 @@ static int iso_connect_bis(struct sock *sk)
 			iso_pi(sk)->bc_sid =3D hcon->sid;
 	}
=20
-	lockdep_assert_held(&hcon->hdev->lock);
+	lockdep_assume_ctx_held(&hcon->hdev->lock);
=20
 	conn =3D iso_conn_add(hcon);
 	if (!conn) {
@@ -572,7 +572,7 @@ static int iso_connect_cis(struct sock *sk)
 		}
 	}
=20
-	lockdep_assert_held(&hcon->hdev->lock);
+	lockdep_assume_ctx_held(&hcon->hdev->lock);
=20
 	/* The socket lock keeps the current attachment and its hcon stable. */
 	if (iso_pi(sk)->conn && iso_pi(sk)->conn->hcon !=3D hcon) {
@@ -1390,7 +1390,7 @@ static int iso_listen_bis(struct sock *sk)
 		goto unlock;
 	}
=20
-	lockdep_assert_held(&hcon->hdev->lock);
+	lockdep_assume_ctx_held(&hcon->hdev->lock);
=20
 	conn =3D iso_conn_add(hcon);
 	if (!conn) {
@@ -2657,7 +2657,7 @@ static void iso_connect_cfm(struct hci_conn *hcon, =
__u8 status)
=20
 			list_for_each_entry_safe(link, t, &hcon->link_list,
 						 list) {
-				lockdep_assert_held(&link->conn->hdev->lock);
+				lockdep_assume_ctx_held(&link->conn->hdev->lock);
 				iso_conn_del(link->conn, bt_to_errno(status));
 			}
=20
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 4dd56e0074fd..6b3381ae574e 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -1657,7 +1657,7 @@ static void l2cap_conn_start(struct l2cap_conn *con=
n)
 	list_for_each_entry_safe(chan, tmp, &conn->chan_l, list) {
 		l2cap_chan_lock(chan);
=20
-		lockdep_assert_held(&chan->conn->lock);
+		lockdep_assume_ctx_held(&chan->conn->lock);
=20
 		if (chan->chan_type !=3D L2CAP_CHAN_CONN_ORIENTED) {
 			l2cap_chan_ready(chan);
@@ -1775,7 +1775,7 @@ static void l2cap_conn_ready(struct l2cap_conn *con=
n)
=20
 		l2cap_chan_lock(chan);
=20
-		lockdep_assert_held(&chan->conn->lock);
+		lockdep_assume_ctx_held(&chan->conn->lock);
=20
 		if (hcon->type =3D=3D LE_LINK) {
 			l2cap_le_start(chan);
@@ -1932,7 +1932,7 @@ static void l2cap_conn_del(struct hci_conn *hcon, i=
nt err)
 		l2cap_chan_hold(chan);
 		l2cap_chan_lock(chan);
=20
-		lockdep_assert_held(&chan->conn->lock);
+		lockdep_assume_ctx_held(&chan->conn->lock);
=20
 		l2cap_chan_del(chan, err);
=20
@@ -4063,8 +4063,8 @@ static void l2cap_ecred_rsp_defer(struct l2cap_chan=
 *chan, void *data)
 	    !test_and_clear_bit(FLAG_DEFER_SETUP, &chan->flags))
 		return;
=20
-	lockdep_assert_held(&rsp->locked_chan->lock);
-	lockdep_assert_held(&rsp->locked_chan->conn->lock);
+	lockdep_assume_ctx_held(&rsp->locked_chan->lock);
+	lockdep_assume_ctx_held(&rsp->locked_chan->conn->lock);
=20
 	l2cap_chan_hold(chan);
=20
@@ -4076,8 +4076,8 @@ static void l2cap_ecred_rsp_defer(struct l2cap_chan=
 *chan, void *data)
 	if (context_unsafe(!locked && chan !=3D rsp->locked_chan))
 		goto done;
=20
-	lockdep_assert_held(&chan->lock);
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	/* Reset ident so only one response is sent */
 	chan->ident =3D 0;
@@ -4275,7 +4275,7 @@ static struct l2cap_chan *l2cap_new_connection(stru=
ct l2cap_conn *conn,
=20
 	__l2cap_chan_add(conn, chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	if (pchan->ops->new_connection &&
 	    pchan->ops->new_connection(pchan, chan) < 0) {
@@ -4478,7 +4478,7 @@ static int l2cap_connect_create_rsp(struct l2cap_co=
nn *conn,
=20
 	l2cap_chan_lock(chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	/* Only accept a response to a connection request we sent and that
 	 * is still outstanding. A channel waiting in BT_CONNECT for security
@@ -4589,7 +4589,7 @@ static inline int l2cap_config_req(struct l2cap_con=
n *conn,
=20
 	l2cap_chan_lock(chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	if (chan->state !=3D BT_CONFIG && chan->state !=3D BT_CONNECT2 &&
 	    chan->state !=3D BT_CONNECTED) {
@@ -4711,7 +4711,7 @@ static inline int l2cap_config_rsp(struct l2cap_con=
n *conn,
=20
 	l2cap_chan_lock(chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	/* Connected channels may also receive reconfiguration responses. */
 	if (chan->state !=3D BT_CONFIG && chan->state !=3D BT_CONNECTED)
@@ -4829,7 +4829,7 @@ static inline int l2cap_disconnect_req(struct l2cap=
_conn *conn,
=20
 	l2cap_chan_lock(chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	rsp.dcid =3D cpu_to_le16(chan->scid);
 	rsp.scid =3D cpu_to_le16(chan->dcid);
@@ -4871,7 +4871,7 @@ static inline int l2cap_disconnect_rsp(struct l2cap=
_conn *conn,
=20
 	l2cap_chan_lock(chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	if (chan->state !=3D BT_DISCONN) {
 		l2cap_chan_unlock(chan);
@@ -5085,7 +5085,7 @@ static int l2cap_le_connect_rsp(struct l2cap_conn *=
conn,
=20
 	l2cap_chan_lock(chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	switch (result) {
 	case L2CAP_CR_LE_SUCCESS:
@@ -5305,7 +5305,7 @@ static int l2cap_le_connect_req(struct l2cap_conn *=
conn,
=20
 	l2cap_chan_lock(chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	bacpy(&chan->src, &conn->hcon->src);
 	bacpy(&chan->dst, &conn->hcon->dst);
@@ -5538,7 +5538,7 @@ static inline int l2cap_ecred_conn_req(struct l2cap=
_conn *conn,
=20
 		l2cap_chan_lock(chan);
=20
-		lockdep_assert_held(&chan->conn->lock);
+		lockdep_assume_ctx_held(&chan->conn->lock);
=20
 		bacpy(&chan->src, &conn->hcon->src);
 		bacpy(&chan->dst, &conn->hcon->dst);
@@ -5629,7 +5629,7 @@ static inline int l2cap_ecred_conn_rsp(struct l2cap=
_conn *conn,
 		l2cap_chan_hold(chan);
 		l2cap_chan_lock(chan);
=20
-		lockdep_assert_held(&chan->conn->lock);
+		lockdep_assume_ctx_held(&chan->conn->lock);
=20
 		/* Check that there is a dcid for each pending channel */
 		if (cmd_len < sizeof(dcid)) {
@@ -5858,7 +5858,7 @@ static inline int l2cap_ecred_reconf_rsp(struct l2c=
ap_conn *conn,
 			continue;
 		l2cap_chan_lock(chan);
=20
-		lockdep_assert_held(&chan->conn->lock);
+		lockdep_assume_ctx_held(&chan->conn->lock);
=20
 		l2cap_chan_del(chan, ECONNRESET);
=20
@@ -5889,7 +5889,7 @@ static inline int l2cap_le_command_rej(struct l2cap=
_conn *conn,
 		goto done;
=20
 	l2cap_chan_lock(chan);
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
 	l2cap_chan_del(chan, ECONNREFUSED);
 	l2cap_chan_unlock(chan);
 	l2cap_chan_put(chan);
@@ -7285,7 +7285,7 @@ static void l2cap_data_channel(struct l2cap_conn *c=
onn, u16 cid,
=20
 	l2cap_chan_lock(chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	BT_DBG("chan %p, len %d", chan, skb->len);
=20
@@ -7665,7 +7665,7 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __l=
e16 psm, u16 cid,
 		goto done;
 	}
=20
-	lockdep_assert_held(&hcon->hdev->lock);
+	lockdep_assume_ctx_held(&hcon->hdev->lock);
=20
 	conn =3D l2cap_conn_add(hcon);
 	if (!conn) {
@@ -7711,7 +7711,7 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __l=
e16 psm, u16 cid,
=20
 	__l2cap_chan_add(conn, chan);
=20
-	lockdep_assert_held(&chan->conn->lock);
+	lockdep_assume_ctx_held(&chan->conn->lock);
=20
 	/* l2cap_chan_add takes its own ref so we can drop this one */
 	hci_conn_drop(hcon);
@@ -7969,7 +7969,7 @@ static void l2cap_security_cfm(struct hci_conn *hco=
n, u8 status, u8 encrypt)
 	list_for_each_entry(chan, &conn->chan_l, list) {
 		l2cap_chan_lock(chan);
=20
-		lockdep_assert_held(&chan->conn->lock);
+		lockdep_assume_ctx_held(&chan->conn->lock);
=20
 		BT_DBG("chan %p scid 0x%4.4x state %s", chan, chan->scid,
 		       state_to_string(chan->state));
@@ -8141,7 +8141,7 @@ int l2cap_recv_acldata(struct hci_dev *hdev, u16 ha=
ndle,
 		return -ENOENT;
 	}
=20
-	lockdep_assert_held(&hcon->hdev->lock);
+	lockdep_assume_ctx_held(&hcon->hdev->lock);
=20
 	hci_conn_enter_active_mode(hcon, BT_POWER_FORCE_ACTIVE_OFF);
=20
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 3b9c82bd2f02..022e7f41a91a 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -3902,7 +3902,7 @@ static int user_pairing_resp(struct sock *sk, struc=
t hci_dev *hdev,
 	}
=20
 	if (addr->type =3D=3D BDADDR_LE_PUBLIC || addr->type =3D=3D BDADDR_LE_R=
ANDOM) {
-		lockdep_assert_held(&conn->hdev->lock);
+		lockdep_assume_ctx_held(&conn->hdev->lock);
=20
 		err =3D smp_user_confirm_reply(conn, mgmt_op, passkey);
 		if (!err)
diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 5dac8b2eae42..21640632368b 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -2446,7 +2446,7 @@ int smp_cancel_and_remove_pairing(struct hci_dev *h=
dev, bdaddr_t *bdaddr,
 	if (!hcon)
 		goto done;
=20
-	lockdep_assert_held(&hcon->hdev->lock);
+	lockdep_assume_ctx_held(&hcon->hdev->lock);
=20
 	conn =3D hcon->l2cap_data;
 	if (!conn)
