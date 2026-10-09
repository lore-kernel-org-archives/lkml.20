Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E075649620
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513529; cv=pass; b=uJDNPXzMF1JC9bfkPETkmgsr5ajZO3W3a53xbGCQYDT65F9es1OVf9Ve+5k9TbClA39eN88Y2wcd1X0Gqku98ZAbrE61+k15evJomd0QutYH8AJsT0SF+QMauU7jQ9ZTOKjo6lt7ElOT6ymGBdBQBzwQudUCZcSfSvWCD2D04JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513529; c=relaxed/simple;
	bh=W/6x+sfmQ/0fgDG5YJSZ4IFZY0fLb9DKdHh58bGgu+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFabCrFCyI5rUqvKgvtR2unLNNJiZjG6NGaRsAOq1LhumDmTXdLZ/Uhzd8E3wq/F1hmfA7L76FdlixVqmA0sYF7Srn3rCPHNl305yE1uleOVcBiKbHRcpijKRjVCADTgnJ8iS9gZT8GeplS2lz+jJ24TyQESvMahmxCbHy0dMNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyWU2q73; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nyWU2q73"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bad794b197so4017994e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791513525; cv=none;
        d=google.com; s=arc-20260327;
        b=iaGJzO27uRKuyH6LGT46dfw+UREByhtZElBmN21klg9+yfgKzCCAKLrjosHoYk4w5C
         kdO7eHZv28FJS05Pa/+YJKCJfl62oOvourwTUSJJ+FQg4NuSWGM6YkjsiVQtAuBTtA+k
         Zw7A6I9Hw4F3vv2wPTEBJjiLCdaCEpDW0gcd8Y0xwEd9lBRcWiXuv6cGfLMDRkJze5Oo
         UTSrapPAGMs1AXVCbKF1IXPeENC2faoxEgAUQeijIksFVEs9qiFhWrQRYq9i/Hg/yIbe
         0W2MOHXYLF86DVmrd92AyLNwQLg/906Mxu+K4VzS2fAE5zZjYv355XSLCYrILqKnjvvx
         PdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVsA8Hvf5KOHdFPnE0kMAmmiwcYwWGx+bqV9JyZKklw=;
        fh=8BkLmuQ0C16Cyg7YZbc5JNkdjvTVvYdKEGDOkJycez8=;
        b=FDRynSqXJ5Pm/5ygsxIdbz+FakBGB4ftxvEyjSMjy7RxwZDeX3wwOhjTwr0deVX/RE
         3VWgaE9oOuvYlDVKROSi4RtX0msNyHe70QQpFvkfIYfUp+ZwiREaZsgXRuGqpSfsFGIx
         m57v8A18o9T72D8kKe3+wkLCw5Y+EFodYnmSCGn6ihIERSl/xkUGl/1cSXFfm1AXe0kX
         dJSL5RZd/CUz6A5ctPpTo7yDYfeg/zA3XEbwtMncGngb5BFsdp3x540//MCkkbE69BZX
         hUy41MYK9BS8Ao14lF1kmVD3E3FAuSgXD/jFK5STgY1AHeS+FJSWV28Mbr74OdfTuCFC
         2Buw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791513525; x=1792118325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVsA8Hvf5KOHdFPnE0kMAmmiwcYwWGx+bqV9JyZKklw=;
        b=nyWU2q73Bkb2hqsJuHb7MfBD7IQaod1x4m3fjUSIbK+dPW4zHK1ymiMFYiDHuGjxRC
         6Dk+Y6og4eA9FHnmA/BIF+NbwOm9TVM22BN9a4RcI6dLJOBjAc+LEnFl7eZ9HJ329N9U
         aQ62dGcPtFg2bZIiXJTHWqg61ivp/phpp5W5TwFYoujp9gQxDqc9UBeg3HHmwqvOX8bn
         ACy3FlL9089oCdPCcxv2dwQzQ3CA0+Nf5CTTtN5Xw7Ag7jDg1kxnwflKvYFDDcEfKfBd
         nfwJI2DEPZBY5aE7BfIi5eJjHKu9767i3Y/i49J4QVsHKlIrHLlN+4bgbTbasb2zr8B9
         vEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791513525; x=1792118325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVsA8Hvf5KOHdFPnE0kMAmmiwcYwWGx+bqV9JyZKklw=;
        b=Fha9FUfvfG6hUN0ilNnDkj4zB33TdwAWG0VjY32+JQSSb18JSf7xV1a4yzbG7fOY4W
         ob1xoLms1No2y18Be2myBePiQU3tqQPYsu7TeUZ3vkDf06tJ+IDnpTOtRyMOG/0iogIu
         Evzpj6U0rnHHPewFsUq5sm8PDJgX1w9Kt2BO9guGP4UJG1ln9R0moS8UxGpu9TBG+Zk9
         9btZ+wYCdPvX15GsV0456N9xEqAg11Ovoqw6ComEmIM2C6tWUL5jVQvcp5qUHGl1T8Xe
         lO9Ma0fuvlRBpuug5En37IWjaRjIUeiReC6mRXzAgyH1szOJ6jOHRDygh8XRfvIwV8dG
         2UJA==
X-Forwarded-Encrypted: i=1; AKwUvBwL6ocY/kYdjzu/+X23fnphcphxihpuNVghqQ4xpJug3Gk/JTv6e9HhvpDAM2ztAvQV7x1Ori3KQ7tEVJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKZhJ5ziY0rVZbMBNcw1CqCRWIX1uyiiKQMhCoEny7wKJVT4+w
	VIv+gl9sbbfYOVLtQuTQgmiF8pN/eGV00I+xawAOvdEUY/El11YblU+JwDbXkh1aPJwNUGbyAr+
	C0nOEwwvk17HQXyV9rh6mIaRxLx6SDo6f4ETagFCWqqGZ38g=
X-Gm-Gg: AYBFou2pyyYE5S6+J2aZ4jkAyvwyx3+DutjZI2+uhvaXXs86cK1XwGtyz0mWQfDRnif
	hn/xgimQA3meL/tOx+BiihVgeO5Ip0pQVqd2j9oMfOUMb6aXS4z/ikeg1KMbD+BFA3poSCZWsxg
	4ptvlJJes4a3ZfN6sEQxlwhVO0YI+nPYdPZqNzKs41ybqv7mOQx0XV+x3HJl6sYVhYieQbw9kAC
	udY/330Oe32T53lEZGCxaOSvPNKh3cx5c8Cik6e6B1g44AAGnL5hXMm2Ut6CpeFVrBRF2k31R0B
	oYMpnX3IjC3d21UB7D88WbyQbIsqsynz5ElFTTRTttk/nDhzbzWT1V0flk/b9Qx7GTx0L6W6P/t
	EFotLVF00/5sMdOhTYEA3/aQn001r
X-Received: by 2002:a05:6512:3e1a:b0:5bb:7848:fce4 with SMTP id
 2adb3069b0e04-5bcde35d371mr192241e87.3.1791513524627; Thu, 08 Oct 2026
 19:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929064742.576651-1-liushike123@gmail.com>
 <20260929064742.576651-2-liushike123@gmail.com> <AM7P189MB113766407E77EB2982690B06C6932@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AM7P189MB113766407E77EB2982690B06C6932@AM7P189MB1137.EURP189.PROD.OUTLOOK.COM>
From: shike liu <liushike123@gmail.com>
Date: Fri, 9 Oct 2026 10:38:30 +0800
X-Gm-Features: AclHuK9cDPvFCFMfF2pNWMrOhS7dIuC0DWvpj37snUMWiF97uhY49Jri8g4FolQ
Message-ID: <CAL9mPHtH3Uy51MROGgNC8bpRisodf4_xoAiEqw=oK9Eayc_fPw@mail.gmail.com>
Subject: Re: [RFC net-next 1/2] tipc: abort pending connects when the peer
 node is lost
To: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "jmaloy@redhat.com" <jmaloy@redhat.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "horms@kernel.org" <horms@kernel.org>, 
	"shuah@kernel.org" <shuah@kernel.org>, 
	"tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tung,

> Do retrying calling connect() and setting connection timeout to link
> tolerance (default: 1500 ms) help your use case ?

A shorter connection timeout could mitigate the blocking time. I have
not yet tested the specific 1500 ms timeout-and-retry approach on the
affected application, so I cannot rule it out as a workaround.

The distinction I intended to address is between a connection setup
timeout and a confirmed loss of contact with the peer. A short timeout
also expires when the peer is reachable but acceptance is delayed,
whereas this change reports EHOSTUNREACH once the node-loss path has
determined that no usable link remains.

Also, from the current code, a connection-wait timeout leaves the socket
in TIPC_CONNECTING. Calling blocking connect() again on that socket
continues waiting for the pending handshake rather than starting a
fresh attempt. I will evaluate the timeout-and-retry approach and
clarify the application requirements before arguing that a kernel
change is necessary.

> Traversing the list of thousands of connections look bad.
> Have you tried to measure performance regression when one socket of
> this node is sending/receiving messages and 4000 thousand other
> connections are initiated simultaneously ?

I have not measured that workload. The results reported in the cover
letter are functional tests, not scalability or performance tests.

The new lookup scans conn_sks under the node write lock. Its cost grows
with the number of connections, and contention on that lock could
affect traffic on an established connection. The functional results
do not establish that this overhead is acceptable.

I will compare the unmodified and patched kernels with an established
connection carrying traffic while other connections to the same peer
are initiated concurrently. I will measure data-path throughput and
latency as well as connection setup latency, and investigate avoiding
the new linear scan.

To confirm the test scale, did you mean 4,000 concurrent connection
attempts?

I will follow up with the measurements and the application-level
comparison before posting a revised series.

Regards,
liushike

Tung Quang Nguyen <tung.quang.nguyen@est.tech> =E4=BA=8E2026=E5=B9=B410=E6=
=9C=888=E6=97=A5=E5=91=A8=E5=9B=9B 14:46=E5=86=99=E9=81=93=EF=BC=9A
>
> >Subject: [RFC net-next 1/2] tipc: abort pending connects when the peer n=
ode is
> >lost
> >
> >From: liushike <liushike@ruijie.com.cn>
> >
> >A client can send a SYN and block in connect() while the listening serve=
r has
> >not yet called accept(). If the last usable link to that server is lost,=
 the client may
> >remain asleep until its connection timeout expires.
> >Only established connections are in the peer node's conn_sks list, so
> >node_lost_contact() cannot notify the pending connection.
>
> Do retrying calling connect() and setting connection timeout to link tole=
rance (default: 1500 ms) help your use case ?
>
> >
> >Register an active open before sending SYN and check node availability u=
nder
> >the node write lock. Let the existing node-loss notification abort the p=
ending
> >handshake with EHOSTUNREACH and wake the connect waiter.
> >Losing one link does not abort the connect while another link survives.
> >
> >Update the listening port to the accepted port in place on receipt of AC=
K,
> >preserving the node-loss registration. Reject a late ACK if node loss al=
ready
> >removed the registration, even if the node has recovered.
> >Transfer the registration when a named SYN is rerouted to another node.
> >Avoid registering active opens twice; remove registrations on transmit f=
ailure
> >and terminal rejection, but retain them across overload retries and
> >connection-wait timeouts, which do not cancel the handshake.
> >
> >Signed-off-by: liushike <liushike@ruijie.com.cn>
> >---
> > net/tipc/node.c   | 37 ++++++++++++++++++++++++++++++++++++-
> > net/tipc/node.h   |  1 +
> > net/tipc/socket.c | 38 +++++++++++++++++++++++++++++++++++---
> > 3 files changed, 72 insertions(+), 4 deletions(-)
> >
> >diff --git a/net/tipc/node.c b/net/tipc/node.c index
> >bd91378b7540..31f2ef44ad37 100644
> >--- a/net/tipc/node.c
> >+++ b/net/tipc/node.c
> >@@ -713,13 +713,48 @@ int tipc_node_add_conn(struct net *net, u32 dnode,
> >u32 port, u32 peer_port)
> >       conn->peer_port =3D peer_port;
> >
> >       tipc_node_write_lock(node);
> >-      list_add_tail(&conn->list, &node->conn_sks);
> >+      if (node_is_up(node)) {
> >+              list_add_tail(&conn->list, &node->conn_sks);
> >+      } else {
> >+              err =3D -EHOSTUNREACH;
> >+              kfree(conn);
> >+      }
> >       tipc_node_write_unlock(node);
> > exit:
> >       tipc_node_put(node);
> >       return err;
> > }
> >
> >+/* Replace the listening port with the accepted port without losing the
> >+ * node loss subscription. A missing entry means node_lost_contact()
> >+has
> >+ * already aborted this connection attempt, even if the node is up agai=
n.
> >+ */
> >+int tipc_node_update_conn(struct net *net, u32 dnode, u32 port, u32
> >+peer_port) {
> >+      struct tipc_sock_conn *conn;
> >+      struct tipc_node *node;
> >+      int err =3D -EHOSTUNREACH;
> >+
> >+      if (in_own_node(net, dnode))
> >+              return 0;
> >+
> >+      node =3D tipc_node_find(net, dnode);
> >+      if (!node)
> >+              return err;
> >+
> >+      tipc_node_write_lock(node);
> >+      list_for_each_entry(conn, &node->conn_sks, list) {
>
> Traversing the list of thousands of connections look bad.
> Have you tried to measure performance regression when one socket of this =
node is sending/receiving messages and 4000 thousand other connections are =
initiated simultaneously ?
>
> >+              if (conn->port !=3D port)
> >+                      continue;
> >+              conn->peer_port =3D peer_port;
> >+              err =3D 0;
> >+              break;
> >+      }
> >+      tipc_node_write_unlock(node);
> >+      tipc_node_put(node);
> >+      return err;
> >+}
> >+
> > void tipc_node_remove_conn(struct net *net, u32 dnode, u32 port)  {
> >       struct tipc_node *node;
> >diff --git a/net/tipc/node.h b/net/tipc/node.h index
> >154a5bbb0d29..48693a050aa8 100644
> >--- a/net/tipc/node.h
> >+++ b/net/tipc/node.h
> >@@ -107,6 +107,7 @@ void tipc_node_subscribe(struct net *net, struct
> >list_head *subscr, u32 addr);  void tipc_node_unsubscribe(struct net *ne=
t,
> >struct list_head *subscr, u32 addr);  void tipc_node_broadcast(struct ne=
t *net,
> >struct sk_buff *skb, int rc_dests);  int tipc_node_add_conn(struct net *=
net, u32
> >dnode, u32 port, u32 peer_port);
> >+int tipc_node_update_conn(struct net *net, u32 dnode, u32 port, u32
> >+peer_port);
> > void tipc_node_remove_conn(struct net *net, u32 dnode, u32 port);  int
> >tipc_node_get_mtu(struct net *net, u32 addr, u32 sel, bool connected);  =
bool
> >tipc_node_is_up(struct net *net, u32 addr); diff --git a/net/tipc/socket=
.c
> >b/net/tipc/socket.c index d5d70eb230b5..191579636351 100644
> >--- a/net/tipc/socket.c
> >+++ b/net/tipc/socket.c
> >@@ -1511,6 +1511,16 @@ static int __tipc_sendmsg(struct socket *sock, st=
ruct
> >msghdr *m, size_t dlen)
> >               return -ENOMEM;
> >       }
> >
> >+      /* Subscribe before sending SYN so node loss also aborts pending
> >connects. */
> >+      if (syn) {
> >+              rc =3D tipc_node_add_conn(net, skaddr.node, tsk->portid,
> >skaddr.ref);
> >+              if (rc) {
> >+                      __skb_queue_purge(&pkts);
> >+                      __skb_queue_purge(&sk->sk_write_queue);
> >+                      return rc;
> >+              }
> >+      }
> >+
> >       /* Send message */
> >       trace_tipc_sk_sendmsg(sk, skb_peek(&pkts), TIPC_DUMP_SK_SNDQ, "
> >");
> >       rc =3D tipc_node_xmit(net, &pkts, skaddr.node, tsk->portid); @@ -=
1520,6
> >+1530,11 @@ static int __tipc_sendmsg(struct socket *sock, struct msghdr=
 *m,
> >size_t dlen)
> >               rc =3D 0;
> >       }
> >
> >+      if (unlikely(syn && rc)) {
> >+              tipc_node_remove_conn(net, skaddr.node, tsk->portid);
> >+              __skb_queue_purge(&sk->sk_write_queue);
> >+      }
> >+
> >       if (unlikely(syn && !rc)) {
> >               tipc_set_sk_state(sk, TIPC_CONNECTING);
> >               if (dlen && timeout) {
> >@@ -1674,8 +1689,10 @@ static void tipc_sk_finish_conn(struct tipc_sock
> >*tsk, u32 peer_port,
> >       msg_set_hdr_sz(msg, SHORT_H_SIZE);
> >
> >       sk_reset_timer(sk, &sk->sk_timer, jiffies + CONN_PROBING_INTV);
> >+      /* Active opens already subscribed before sending SYN. */
> >+      if (sk->sk_state !=3D TIPC_CONNECTING)
> >+              tipc_node_add_conn(net, peer_node, tsk->portid, peer_port=
);
> >       tipc_set_sk_state(sk, TIPC_ESTABLISHED);
> >-      tipc_node_add_conn(net, peer_node, tsk->portid, peer_port);
> >       tsk->max_pkt =3D tipc_node_get_mtu(net, peer_node, tsk->portid, t=
rue);
> >       tsk->peer_caps =3D tipc_node_get_capabilities(net, peer_node);
> >       tsk_set_nagle(tsk);
> >@@ -2199,12 +2216,14 @@ static bool tipc_sk_filter_connect(struct tipc_s=
ock
> >*tsk, struct sk_buff *skb,
> >       struct net *net =3D sock_net(sk);
> >       struct tipc_msg *hdr =3D buf_msg(skb);
> >       bool con_msg =3D msg_connected(hdr);
> >+      bool reject_ack =3D false;
> >       u32 pport =3D tsk_peer_port(tsk);
> >       u32 pnode =3D tsk_peer_node(tsk);
> >       u32 oport =3D msg_origport(hdr);
> >       u32 onode =3D msg_orignode(hdr);
> >       int err =3D msg_errcode(hdr);
> >       unsigned long delay;
> >+      int rc;
> >
> >       if (unlikely(msg_mcast(hdr)))
> >               return false;
> >@@ -2216,6 +2235,18 @@ static bool tipc_sk_filter_connect(struct tipc_so=
ck
> >*tsk, struct sk_buff *skb,
> >               if (likely(con_msg)) {
> >                       if (err)
> >                               break;
> >+                      rc =3D tipc_node_update_conn(net, pnode, tsk->por=
tid,
> >oport);
> >+                      /* A named SYN may have been rerouted to another
> >node. */
> >+                      if (!rc && onode !=3D pnode) {
> >+                              tipc_node_remove_conn(net, pnode, tsk-
> >>portid);
> >+                              rc =3D tipc_node_add_conn(net, onode, tsk=
-
> >>portid, oport);
> >+                      }
> >+                      if (rc) {
> >+                              err =3D TIPC_ERR_NO_NODE;
> >+                              /* Return a late ACK to its sender, inclu=
ding any
> >data. */
> >+                              reject_ack =3D true;
> >+                              break;
> >+                      }
> >                       tipc_sk_finish_conn(tsk, oport, onode);
> >                       msg_set_importance(&tsk->phdr,
> >msg_importance(hdr));
> >                       /* ACK+ message with data is added to receive que=
ue
> >*/ @@ -2285,9 +2316,10 @@ static bool tipc_sk_filter_connect(struct
> >tipc_sock *tsk, struct sk_buff *skb,
> >       }
> >       /* Abort connection setup attempt */
> >       tipc_set_sk_state(sk, TIPC_DISCONNECTING);
> >-      sk->sk_err =3D ECONNREFUSED;
> >+      tipc_node_remove_conn(net, pnode, tsk->portid);
> >+      sk->sk_err =3D err =3D=3D TIPC_ERR_NO_NODE ? EHOSTUNREACH :
> >ECONNREFUSED;
> >       sk->sk_state_change(sk);
> >-      return true;
> >+      return !reject_ack;
> > }
> >
> > /**
> >--
> >2.34.1
>
