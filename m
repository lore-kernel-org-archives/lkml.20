Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0390E39DBF8;
	Tue, 22 Sep 2026 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066532; cv=none; b=QWrS4p5sOGFUjzSwaRc/nikO+xBwuCdp8pWDd2gbK0fATEiqskcZh6Ol9/JndV1UssB2OrEvDJkAcWy2C8n9JY+kIX0I4FLGVAt1wB2E07FsMINsV06kShtn3MxnvDOWWN2XNCnM9IAPqfZbX/HBQhL81qSsqgYvXO3y3Yslt3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066532; c=relaxed/simple;
	bh=Q06rEZksQ/QYcwWQB0z4uWIYFX5YEKZsuNWlZsD5nAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pWFPbp4z1EDBDtrcnlxCOzBPv92B4Nnq4PyZNl9GtKpnyqTy4h/7VnD9onWRQVLu2Q3H5DTqP9b9VHOJKbyi0zCLQ2r+76KROG14j9egyV5nkKNcBjyY2j4HbANngiONVyT6JdpwubJ7nqe6+OvPdXluY9BskiZ3ogTnO9DzNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGpMmy4r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGpMmy4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DE91F000FF;
	Tue, 22 Sep 2026 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066529;
	bh=Ix94TQkc1PsYYXc9dWzxtuEJzmNN0Pcbgl1PBm3xmqo=;
	h=Date:From:To:Cc:Subject;
	b=HGpMmy4rs/s+P18cKXky9zWnclFRe+XORe4BnxLxhYXT38lfUFkY6S/1HgDNwdG0Q
	 11mZahQQn5ifleVebwjExW3YJL1KpiO2OKfADCC+pvm70wsjqHbnWDkylrfgkZfWrq
	 G1M8FjnyKWHNYmCfagFIyikU3roWc3zhH+ux69nuGW6ycF+oRQPDljVe08pyYcn9OZ
	 7qTraJbw3zhIRMugTKe/hu/zrCEG+eQjXwc3zSAIPnxjVorp/K0puI9iD4lImk603J
	 EmmxuKx5oaId7zKPjcJrx1nJCQLGt7HkQsl6eoPQxTlulFL/CDYplGlX/O1UjxtFw7
	 002ACDPFbzEJA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 22A7E1AC56BF; Tue, 22 Sep 2026 09:42:06 +0100 (BST)
Date: Tue, 22 Sep 2026 10:42:06 +0200
From: Mark Brown <broonie@kernel.org>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Anna Schumaker <anna.schumaker@hammerspace.com>,
	Chuck Lever <cel@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the nfsd tree with the nfs-anna tree
Message-ID: <arI_XvccOKuOsjzo@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dKmPKN0c6g9MSCIb"
Content-Disposition: inline


--dKmPKN0c6g9MSCIb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nfsd tree got a conflict in:

  net/sunrpc/svcsock.c

between commits:

  2ecf0d2af5da8 ("SUNRPC: resume receiving after a TLS control record")
  1a485d8e93a92 ("SUNRPC: treat every TLS error alert as fatal")
  d3b4fb1d30749 ("SUNRPC: reject a TLS alert record that is not two octets")
  f547743e6b51f ("SUNRPC: do not credit control-record octets to the RPC st=
ream")

=66rom the nfs-anna tree and commits:

  a76d52a01792f ("SUNRPC: Do not credit control-record octets to the RPC st=
ream")
  e263b5d674fcf ("SUNRPC: Reject a TLS alert record that is not two octets")
  ebcbe4a9a7779 ("SUNRPC: Treat every TLS error alert as fatal")
  8f765d820c590 ("SUNRPC: Resume receiving after a TLS control record")
  7f757c41a8beb ("SUNRPC: Reject a socket that already has an svc_sock atta=
ched")
  35ab7140c7bfa ("SUNRPC: Separate the TLS control-record receive from its =
policy")
  9a4ef884d00cd ("SUNRPC: Close the transport on an unhandled TLS record ty=
pe")
  eaef7075c6a48 ("SUNRPC: Flush a received record's pages once it is comple=
te")
  1517c61f247f3 ("SUNRPC: Receive RPC records with ->read_sock")
  23bec0f9631c2 ("SUNRPC: Bypass sock_recvmsg() for the TLS control-record =
receive")
  0fce57f554fa6 ("SUNRPC: Skip xpt_reserved accounting for non-UDP transpor=
ts")

=66rom the nfsd tree.  This looks like different versions of patches being
applied with extra stuff then stacked on top.  I've taken the nfsd
version but it's possible that's gone wrong, I'm not *super* confident
in this.  It feels like there's a coordination issue here.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined net/sunrpc/svcsock.c
index 6fee54f4290c4,e5459d504b6a9..0000000000000
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@@ -8,15 -8,6 +8,6 @@@
   * evenly when servicing a single client. May need to modify the
   * svc_xprt_enqueue procedure...
   *
-  * TCP support is largely untested and may be a little slow. The problem
-  * is that we currently do two separate recvfrom's, one for the 4-byte
-  * record length, and the second for the actual record. This could possib=
ly
-  * be improved by always reading a minimum size of around 100 bytes and
-  * tucking any superfluous bytes away in a temporary store. Still, that
-  * leaves write requests out in the rain. An alternative may be to peek at
-  * the first skb in the queue, and if it matches the next TCP sequence
-  * number, to extract the record marker. Yuck.
-  *
   * Copyright (C) 1995, 1996 Olaf Kirch <okir@monad.swb.de>
   */
 =20
@@@ -239,209 -230,107 +230,107 @@@ static int svc_one_sock_name(struct svc
  }
 =20
  /*
-  * kTLS delivers a record only up to the caller's buffer and keeps
-  * the remainder on its receive list, where no further data_ready
-  * announces it. Consume the whole record.
+  * The ->read_sock data path invokes neither security_socket_recvmsg()
+  * nor the sock:sock_recv_length tracepoint. Dispatch ->recvmsg
+  * directly so the whole receive path behaves one way.
   */
- static void
- svc_tcp_sock_drain_record(struct socket *sock)
+ static int svc_tcp_recv_cmsg(struct socket *sock, int flags,
+ 			     struct kvec *payload, u8 *type,
+ 			     unsigned int *msg_flags)
  {
+ 	const struct proto_ops *ops =3D READ_ONCE(sock->ops);
  	union {
  		struct cmsghdr	cmsg;
  		u8		buf[CMSG_SPACE(sizeof(u8))];
- 	} u;
- 	u8 discard[64];
- 	struct kvec discard_kvec =3D {
- 		.iov_base =3D discard,
- 		.iov_len =3D sizeof(discard),
- 	};
-=20
- 	for (;;) {
- 		struct msghdr msg =3D {
- 			.msg_control =3D &u,
- 			.msg_controllen =3D sizeof(u),
- 		};
-=20
- 		iov_iter_kvec(&msg.msg_iter, ITER_DEST, &discard_kvec, 1,
- 			      discard_kvec.iov_len);
- 		if (sock_recvmsg(sock, &msg, MSG_DONTWAIT) <=3D 0)
- 			break;
- 		if (msg.msg_flags & MSG_EOR)
- 			break;
- 	}
- }
-=20
- static int
- svc_tcp_sock_process_cmsg(struct socket *sock, struct msghdr *msg,
- 			  struct cmsghdr *cmsg, int ret)
- {
- 	u8 content_type =3D tls_get_record_type(sock->sk, cmsg);
- 	u8 level, description;
-=20
- 	switch (content_type) {
- 	case 0:
- 		break;
- 	case TLS_RECORD_TYPE_DATA:
- 		/* TLS sets EOR at the end of each application data
- 		 * record, even though there might be more frames
- 		 * waiting to be decrypted.
- 		 */
- 		msg->msg_flags &=3D ~MSG_EOR;
- 		break;
- 	case TLS_RECORD_TYPE_ALERT:
- 		tls_alert_recv(sock->sk, msg, &level, &description);
- 		/* RFC 8446 Section 6: every alert but a closure alert is
- 		 * an error alert, whatever the legacy AlertLevel octet
- 		 * says.
- 		 */
- 		switch (description) {
- 		case TLS_ALERT_DESC_CLOSE_NOTIFY:
- 		case TLS_ALERT_DESC_USER_CANCELED:
- 			ret =3D -EAGAIN;
- 			break;
- 		default:
- 			ret =3D -ENOTCONN;
- 		}
- 		break;
- 	default:
- 		/* discard this record type */
- 		ret =3D -EAGAIN;
- 	}
- 	return ret;
- }
-=20
- static int
- svc_tcp_sock_recv_cmsg(struct socket *sock, unsigned int *msg_flags)
- {
- 	union {
- 		struct cmsghdr	cmsg;
- 		u8		buf[CMSG_SPACE(sizeof(u8))];
- 	} u;
- 	u8 alert[2];
- 	struct kvec alert_kvec =3D {
- 		.iov_base =3D alert,
- 		.iov_len =3D sizeof(alert),
- 	};
+ 	} u =3D {};
  	struct msghdr msg =3D {
- 		.msg_flags =3D *msg_flags,
- 		.msg_control =3D &u,
- 		.msg_controllen =3D sizeof(u),
+ 		.msg_control	=3D &u,
+ 		.msg_controllen	=3D sizeof(u),
  	};
  	int ret;
 =20
- 	iov_iter_kvec(&msg.msg_iter, ITER_DEST, &alert_kvec, 1,
- 		      alert_kvec.iov_len);
- 	ret =3D sock_recvmsg(sock, &msg, MSG_DONTWAIT);
- 	/* put_cmsg() shrinks msg_controllen, so a short one means
- 	 * kTLS filled in u.cmsg.
- 	 */
- 	if (ret >=3D 0 && msg.msg_controllen < sizeof(u)) {
- 		u8 content_type =3D tls_get_record_type(sock->sk, &u.cmsg);
-=20
- 		/* Returning the count would credit the RPC stream with
- 		 * octets that never reached the caller's buffer.
- 		 */
- 		if (content_type !=3D TLS_RECORD_TYPE_ALERT) {
- 			/* Draining an application data record would
- 			 * discard the RPC stream.
- 			 */
- 			if (content_type !=3D TLS_RECORD_TYPE_DATA &&
- 			    !(msg.msg_flags & MSG_EOR))
- 				svc_tcp_sock_drain_record(sock);
- 			return -EAGAIN;
- 		}
- 		/* An Alert record carries exactly one two-octet message
- 		 * (RFC 8446 Section 5.1). alert_kvec caps the receive at two,
- 		 * so a longer record produces the same count. MSG_EOR appears
- 		 * only once kTLS has drained the whole record.
- 		 */
- 		if (ret !=3D sizeof(alert) || !(msg.msg_flags & MSG_EOR))
- 			return -EBADMSG;
- 		iov_iter_revert(&msg.msg_iter, ret);
- 		ret =3D svc_tcp_sock_process_cmsg(sock, &msg, &u.cmsg, -EAGAIN);
- 	}
+ 	iov_iter_kvec(&msg.msg_iter, ITER_DEST, payload, 1, payload->iov_len);
+ 	ret =3D ops->recvmsg(sock, &msg, msg_data_left(&msg), flags);
+ 	if (ret < 0)
+ 		return ret;
+ 	*msg_flags =3D msg.msg_flags;
+ 	*type =3D tls_get_record_type(sock->sk, &u.cmsg);
+ 	if (!*type && ret)
+ 		return -EBADMSG;
  	return ret;
  }
 =20
- static int
- svc_tcp_sock_recvmsg(struct svc_sock *svsk, struct msghdr *msg)
+ static int svc_tcp_recv_ctrl_record(struct svc_sock *svsk)
  {
- 	int ret;
+ 	u8 alert[2], type, level, description;
  	struct socket *sock =3D svsk->sk_sock;
-=20
- 	ret =3D sock_recvmsg(sock, msg, MSG_DONTWAIT);
- 	if (msg->msg_flags & MSG_CTRUNC) {
- 		msg->msg_flags &=3D ~(MSG_CTRUNC | MSG_EOR);
- 		if (ret =3D=3D 0 || ret =3D=3D -EIO) {
- 			ret =3D svc_tcp_sock_recv_cmsg(sock, &msg->msg_flags);
- 			/* A control record delivers nothing to the caller,
- 			 * and kTLS announces no data_ready for records it
- 			 * already holds. Mark the transport ready so that
- 			 * the records behind this one can be received.
- 			 */
- 			if (ret =3D=3D -EAGAIN)
- 				set_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
- 		}
- 	}
- 	return ret;
- }
-=20
- #if ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
- static void svc_flush_bvec(const struct bio_vec *bvec, size_t size, size_=
t seek)
- {
- 	struct bvec_iter bi =3D {
- 		.bi_size	=3D size + seek,
+ 	struct kvec recv_kvec =3D {
+ 		.iov_base	=3D alert,
+ 		.iov_len	=3D sizeof(alert),
  	};
- 	struct bio_vec bv;
+ 	unsigned int msg_flags;
+ 	struct msghdr msg =3D {};
+ 	int ret;
 =20
- 	bvec_iter_advance(bvec, &bi, seek & PAGE_MASK);
- 	for_each_bvec(bv, bvec, bi, bi)
- 		flush_dcache_page(bv.bv_page);
- }
- #else
- static inline void svc_flush_bvec(const struct bio_vec *bvec, size_t size,
- 				  size_t seek)
- {
- }
- #endif
+ 	if (!test_bit(XPT_TLS_SESSION, &svsk->sk_xprt.xpt_flags))
+ 		return 0;
 =20
- /*
-  * Read from @rqstp's transport socket. The incoming message fills whole
-  * pages in @rqstp's rq_pages array until the last page of the message
-  * has been received into a partial page.
-  */
- static ssize_t svc_tcp_read_msg(struct svc_rqst *rqstp, size_t buflen,
- 				size_t seek)
- {
- 	struct svc_sock *svsk =3D
- 		container_of(rqstp->rq_xprt, struct svc_sock, sk_xprt);
- 	struct bio_vec *bvec =3D rqstp->rq_bvec;
- 	struct msghdr msg =3D { NULL };
- 	unsigned int i;
- 	ssize_t len;
- 	size_t t;
-=20
- 	clear_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
-=20
- 	for (i =3D 0, t =3D 0; t < buflen; i++, t +=3D PAGE_SIZE)
- 		bvec_set_page(&bvec[i], rqstp->rq_pages[i], PAGE_SIZE, 0);
-=20
- 	iov_iter_bvec(&msg.msg_iter, ITER_DEST, bvec, i, buflen);
- 	if (seek) {
- 		iov_iter_advance(&msg.msg_iter, seek);
- 		buflen -=3D seek;
- 	}
- 	len =3D svc_tcp_sock_recvmsg(svsk, &msg);
- 	if (len > 0)
- 		svc_flush_bvec(bvec, len, seek);
-=20
- 	/* If we read a full record, then assume there may be more
- 	 * data to read (stream based sockets only!)
+ 	/* A data record can become ready between ->read_sock returning
+ 	 * and this probe. A plain receive would take two octets of it
+ 	 * as RPC payload, so peek.
  	 */
- 	if (len =3D=3D buflen)
+ 	ret =3D svc_tcp_recv_cmsg(sock, MSG_DONTWAIT | MSG_PEEK,
+ 				&recv_kvec, &type, &msg_flags);
+ 	if (ret =3D=3D -EAGAIN || (!ret && !type))
+ 		return 0;
+ 	if (ret < 0)
+ 		return ret;
+ 	if (type =3D=3D TLS_RECORD_TYPE_DATA) {
+ 		/* The peek parks the decrypted record on ctx->rx_list,
+ 		 * where it draws no further data_ready. Re-arm or the
+ 		 * RPC hangs until the client times out.
+ 		 */
  		set_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
+ 		return 0;
+ 	}
+ 	if (type !=3D TLS_RECORD_TYPE_ALERT)
+ 		return -EPROTO;
 =20
- 	return len;
+ 	ret =3D svc_tcp_recv_cmsg(sock, MSG_DONTWAIT, &recv_kvec, &type,
+ 				&msg_flags);
+ 	/* The peek found a record at the head, so an -EAGAIN here is
+ 	 * spurious. Propagating it strands the record with no later
+ 	 * announcement, so return -EBADMSG, which closes the transport.
+ 	 */
+ 	if (ret =3D=3D -EAGAIN)
+ 		return -EBADMSG;
+ 	if (ret < 0)
+ 		return ret;
+=20
+ 	/* An Alert record carries exactly one two-octet message (RFC
+ 	 * 8446 Section 5.1). recv_kvec caps the receive at two, so a
+ 	 * longer record produces the same count. MSG_EOR appears only
+ 	 * once kTLS has drained the whole record.
+ 	 */
+ 	if (ret !=3D sizeof(alert) || !(msg_flags & MSG_EOR))
+ 		return -EBADMSG;
+=20
+ 	iov_iter_kvec(&msg.msg_iter, ITER_DEST, &recv_kvec, 1,
+ 		      recv_kvec.iov_len);
+ 	tls_alert_recv(sock->sk, &msg, &level, &description);
+=20
+ 	/* RFC 8446 Section 6: every alert but a closure alert is
+ 	 * an error alert. kTLS raises no data_ready for records it
+ 	 * already holds, so re-arm for what sits behind the alert.
+ 	 */
+ 	switch (description) {
+ 	case TLS_ALERT_DESC_CLOSE_NOTIFY:
+ 	case TLS_ALERT_DESC_USER_CANCELED:
+ 		set_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
+ 		return -EAGAIN;
+ 	default:
+ 		return -ENOTCONN;
+ 	}
  }
 =20
  /*
@@@ -911,6 -800,7 +800,7 @@@ static struct svc_xprt_class svc_udp_cl
  	.xcl_ops =3D &svc_udp_ops,
  	.xcl_max_payload =3D RPCSVC_MAXPAYLOAD_UDP,
  	.xcl_ident =3D XPRT_TRANSPORT_UDP,
+ 	.xcl_flags =3D SVC_XPRT_FLAG_WSPACE_RESERVE,
  };
 =20
  static void svc_udp_init(struct svc_sock *svsk, struct svc_serv *serv)
@@@ -1066,14 -956,14 +956,14 @@@ failed
  	return NULL;
  }
 =20
- static size_t svc_tcp_restore_pages(struct svc_sock *svsk,
- 				    struct svc_rqst *rqstp)
+ static void svc_tcp_restore_pages(struct svc_sock *svsk,
+ 				  struct svc_rqst *rqstp)
  {
  	size_t len =3D svsk->sk_datalen;
  	unsigned int i, npages;
 =20
  	if (!len)
- 		return 0;
+ 		return;
  	npages =3D (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
  	for (i =3D 0; i < npages; i++) {
  		if (rqstp->rq_pages[i] !=3D NULL)
@@@ -1083,7 -973,6 +973,6 @@@
  		svsk->sk_pages[i] =3D NULL;
  	}
  	rqstp->rq_arg.head[0].iov_base =3D page_address(rqstp->rq_pages[0]);
- 	return len;
  }
 =20
  static void svc_tcp_save_pages(struct svc_sock *svsk, struct svc_rqst *rq=
stp)
@@@ -1122,50 -1011,6 +1011,6 @@@ out
  	svsk->sk_datalen =3D 0;
  }
 =20
- /*
-  * Receive fragment record header into sk_marker.
-  */
- static ssize_t svc_tcp_read_marker(struct svc_sock *svsk,
- 				   struct svc_rqst *rqstp)
- {
- 	ssize_t want, len;
-=20
- 	/* If we haven't gotten the record length yet,
- 	 * get the next four bytes.
- 	 */
- 	if (svsk->sk_tcplen < sizeof(rpc_fraghdr)) {
- 		struct msghdr	msg =3D { NULL };
- 		struct kvec	iov;
-=20
- 		want =3D sizeof(rpc_fraghdr) - svsk->sk_tcplen;
- 		iov.iov_base =3D ((char *)&svsk->sk_marker) + svsk->sk_tcplen;
- 		iov.iov_len  =3D want;
- 		iov_iter_kvec(&msg.msg_iter, ITER_DEST, &iov, 1, want);
- 		len =3D svc_tcp_sock_recvmsg(svsk, &msg);
- 		if (len < 0)
- 			return len;
- 		svsk->sk_tcplen +=3D len;
- 		if (len < want) {
- 			/* call again to read the remaining bytes */
- 			goto err_short;
- 		}
- 		trace_svcsock_marker(&svsk->sk_xprt, svsk->sk_marker);
- 		if (svc_sock_reclen(svsk) + svsk->sk_datalen >
- 		    svsk->sk_xprt.xpt_server->sv_max_mesg)
- 			goto err_too_large;
- 	}
- 	return svc_sock_reclen(svsk);
-=20
- err_too_large:
- 	net_notice_ratelimited("svc: %s oversized RPC fragment (%u octets) from =
%pISpc\n",
- 			       svsk->sk_xprt.xpt_server->sv_name,
- 			       svc_sock_reclen(svsk),
- 			       (struct sockaddr *)&svsk->sk_xprt.xpt_remote);
- 	svc_xprt_deferred_close(&svsk->sk_xprt);
- err_short:
- 	return -EAGAIN;
- }
-=20
  static int receive_cb_reply(struct svc_sock *svsk, struct svc_rqst *rqstp)
  {
  	struct rpc_xprt *bc_xprt =3D svsk->sk_xprt.xpt_bc_xprt;
@@@ -1203,20 -1048,162 +1048,162 @@@ unlock_eagain
 =20
  static void svc_tcp_fragment_received(struct svc_sock *svsk)
  {
- 	/* If we have more data, signal svc_xprt_enqueue() to try again */
  	svsk->sk_tcplen =3D 0;
  	svsk->sk_marker =3D xdr_zero;
  }
 =20
+ /*
+  * A non-final fragment carries four octets of marker and may carry
+  * no payload at all. sk_datalen advances only by the payload, so a
+  * run of tiny fragments exhausts ->read_sock's byte budget before
+  * the sv_max_mesg check trips, and a run of empty ones never trips
+  * it. Cap the fragments per socket-lock hold. The cap leaves the
+  * record incomplete, and svc_tcp_recvfrom() resumes it on the next
+  * call.
+  */
+ #define SVC_TCP_MAX_FRAGS		256
+=20
+ struct svc_tcp_recv_ctx {
+ 	struct svc_rqst		*rqstp;
+ 	unsigned int		frags;
+ 	bool			complete;
+ };
+=20
+ /*
+  * Nothing reads the message body before the message is complete, and
+  * partial receives refill the same pages. Flush once here, after the
+  * socket lock is released, rather than once per copy in the actor.
+  */
+ static void svc_tcp_flush_pages(struct svc_sock *svsk,
+ 				struct svc_rqst *rqstp)
+ {
+ 	unsigned int pg, pages =3D DIV_ROUND_UP(svsk->sk_datalen, PAGE_SIZE);
+=20
+ 	for (pg =3D 0; pg < pages; pg++)
+ 		flush_dcache_page(rqstp->rq_pages[pg]);
+ }
+=20
+ /*
+  * Mapping the message's unfilled remainder would re-map untouched
+  * pages on every call, at a cost that grows with the message rather
+  * than with the octets copied.
+  */
+ static void svc_tcp_recv_iter_init(struct svc_rqst *rqstp,
+ 				   struct iov_iter *iter, size_t body_off,
+ 				   size_t len)
+ {
+ 	unsigned int first =3D body_off >> PAGE_SHIFT;
+ 	size_t seek =3D offset_in_page(body_off);
+ 	unsigned int i, pages =3D DIV_ROUND_UP(seek + len, PAGE_SIZE);
+=20
+ 	for (i =3D 0; i < pages; i++)
+ 		bvec_set_page(&rqstp->rq_bvec[i], rqstp->rq_pages[first + i],
+ 			      PAGE_SIZE, 0);
+=20
+ 	iov_iter_bvec(iter, ITER_DEST, rqstp->rq_bvec, pages, seek + len);
+ 	iov_iter_advance(iter, seek);
+ }
+=20
+ /*
+  * ->read_sock actor, called under the socket lock. sk_datalen is both
+  * the count of body octets received so far and their write offset into
+  * rq_pages.
+  */
+ static int svc_tcp_recv_actor(read_descriptor_t *desc, struct sk_buff *sk=
b,
+ 			      unsigned int offset, size_t len)
+ {
+ 	struct svc_tcp_recv_ctx *ctx =3D desc->arg.data;
+ 	struct svc_rqst *rqstp =3D ctx->rqstp;
+ 	struct svc_sock *svsk =3D
+ 		container_of(rqstp->rq_xprt, struct svc_sock, sk_xprt);
+ 	size_t reclen, received, want, take, n;
+ 	size_t consumed =3D 0;
+=20
+ 	if (!desc->count)
+ 		return 0;
+=20
+ 	len =3D min(len, desc->count);
+=20
+ 	if (svsk->sk_tcplen < sizeof(rpc_fraghdr)) {
+ 		want =3D sizeof(rpc_fraghdr) - svsk->sk_tcplen;
+ 		n =3D min(want, len);
+=20
+ 		if (skb_copy_bits(skb, offset,
+ 				  (char *)&svsk->sk_marker + svsk->sk_tcplen,
+ 				  n))
+ 			goto fault;
+ 		svsk->sk_tcplen +=3D n;
+ 		offset +=3D n;
+ 		len -=3D n;
+ 		consumed +=3D n;
+ 		desc->count -=3D n;
+=20
+ 		if (svsk->sk_tcplen < sizeof(rpc_fraghdr))
+ 			return consumed;
+=20
+ 		trace_svcsock_marker(&svsk->sk_xprt, svsk->sk_marker);
+ 		if (svc_sock_reclen(svsk) + svsk->sk_datalen >
+ 		    svsk->sk_xprt.xpt_server->sv_max_mesg) {
+ 			net_notice_ratelimited("svc: %s oversized RPC fragment (%u octets) fro=
m %pISpc\n",
+ 					       svsk->sk_xprt.xpt_server->sv_name,
+ 					       svc_sock_reclen(svsk),
+ 					       (struct sockaddr *)&svsk->sk_xprt.xpt_remote);
+ 			desc->error =3D -EMSGSIZE;
+ 			desc->count =3D 0;
+ 			return consumed;
+ 		}
+ 	}
+=20
+ 	reclen =3D svc_sock_reclen(svsk);
+ 	received =3D svsk->sk_tcplen - sizeof(rpc_fraghdr);
+ 	want =3D reclen - received;
+ 	take =3D min(want, len);
+=20
+ 	if (take) {
+ 		struct iov_iter iter;
+=20
+ 		svc_tcp_recv_iter_init(rqstp, &iter, svsk->sk_datalen, take);
+ 		if (skb_copy_datagram_iter(skb, offset, &iter, take))
+ 			goto fault;
+ 		svsk->sk_datalen +=3D take;
+ 		svsk->sk_tcplen +=3D take;
+ 		consumed +=3D take;
+ 		desc->count -=3D take;
+ 	}
+=20
+ 	if (take =3D=3D want) {
+ 		if (svc_sock_final_rec(svsk)) {
+ 			ctx->complete =3D true;
+ 			desc->count =3D 0;
+ 		} else {
+ 			svc_tcp_fragment_received(svsk);
+ 			if (++ctx->frags >=3D SVC_TCP_MAX_FRAGS)
+ 				desc->count =3D 0;
+ 		}
+ 	}
+=20
+ 	return consumed;
+=20
+ fault:
+ 	desc->error =3D -EFAULT;
+ 	desc->count =3D 0;
+ 	return consumed;
+ }
+=20
+ static bool svc_tcp_at_urg_mark(struct sock *sk)
+ {
+ 	const struct tcp_sock *tp =3D tcp_sk(sk);
+=20
+ 	return tp->urg_data && tp->urg_seq =3D=3D tp->copied_seq;
+ }
+=20
  /**
   * svc_tcp_recvfrom - Receive data from a TCP socket
   * @rqstp: request structure into which to receive an RPC Call
   *
   * Called in a loop when XPT_DATA has been set.
   *
-  * Read the 4-byte stream record marker, then use the record length
-  * in that marker to set up exactly the resources needed to receive
-  * the next RPC message into @rqstp.
+  * Context: Process context. Takes and releases the socket lock.
   *
   * Returns:
   *   On success, the number of bytes in a received RPC Call, or
@@@ -1231,29 -1218,69 +1218,69 @@@ static int svc_tcp_recvfrom(struct svc_
  	struct svc_sock	*svsk =3D
  		container_of(rqstp->rq_xprt, struct svc_sock, sk_xprt);
  	struct svc_serv	*serv =3D svsk->sk_xprt.xpt_server;
- 	size_t want, base;
+ 	struct svc_tcp_recv_ctx ctx =3D {
+ 		.rqstp		=3D rqstp,
+ 	};
+ 	read_descriptor_t desc =3D {
+ 		.arg.data	=3D &ctx,
+ 		.count		=3D serv->sv_max_mesg + sizeof(rpc_fraghdr),
+ 	};
+ 	struct socket *sock =3D svsk->sk_sock;
  	ssize_t len;
  	__be32 *p;
  	__be32 calldir;
 =20
  	clear_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
- 	len =3D svc_tcp_read_marker(svsk, rqstp);
- 	if (len < 0)
- 		goto error;
+ 	svc_tcp_restore_pages(svsk, rqstp);
 =20
- 	base =3D svc_tcp_restore_pages(svsk, rqstp);
- 	want =3D len - (svsk->sk_tcplen - sizeof(rpc_fraghdr));
- 	len =3D svc_tcp_read_msg(rqstp, base + want, base);
- 	if (len >=3D 0) {
- 		trace_svcsock_tcp_recv(&svsk->sk_xprt, len);
- 		svsk->sk_tcplen +=3D len;
- 		svsk->sk_datalen +=3D len;
+ 	lock_sock(sock->sk);
+ 	len =3D sock->ops->read_sock(sock->sk, &desc, svc_tcp_recv_actor);
+ 	/* ->read_sock stops at urgent data and consumes none of it.
+ 	 * Only recvmsg() clears the condition, and this path calls
+ 	 * none, so every later read stops at the same octet. An RPC
+ 	 * stream carries no urgent data, so close the connection.
+ 	 *
+ 	 * The read that first reaches the mark consumes the octets
+ 	 * ahead of it, so the stop does not show up as a zero len. A
+ 	 * record completed ahead of the mark is returned first. The
+ 	 * XPT_DATA set below brings the next call back here with
+ 	 * nothing left to consume.
+ 	 */
+ 	if (!ctx.complete && svc_tcp_at_urg_mark(sock->sk))
+ 		desc.error =3D -EPROTO;
+ 	release_sock(sock->sk);
+=20
+ 	/* ->read_sock returns the octets consumed before an actor
+ 	 * failure, so a positive len can accompany desc.error.
+ 	 */
+ 	if (desc.error < 0) {
+ 		len =3D desc.error;
+ 		goto err_nuts;
  	}
- 	if (len !=3D want || !svc_sock_final_rec(svsk))
+ 	if (len >=3D 0)
+ 		trace_svcsock_tcp_recv(&svsk->sk_xprt, len);
+=20
+ 	if (!ctx.complete) {
+ 		if (!desc.count) {
+ 			set_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
+ 			goto err_incomplete;
+ 		}
+ 		/* A zero return leaves no record at the head to classify.
+ 		 * -EINVAL means a control record sits there. Screen the
+ 		 * other errors out first, because a probe calls
+ 		 * sock_error(), whose xchg clears sk->sk_err as it reads.
+ 		 */
+ 		if (len <=3D 0 && len !=3D -EINVAL)
+ 			goto err_incomplete;
+=20
+ 		len =3D svc_tcp_recv_ctrl_record(svsk);
  		goto err_incomplete;
+ 	}
  	if (svsk->sk_datalen < 8)
  		goto err_nuts;
 =20
+ 	svc_tcp_flush_pages(svsk, rqstp);
+=20
  	rqstp->rq_arg.len =3D svsk->sk_datalen;
  	rqstp->rq_arg.page_base =3D 0;
  	if (rqstp->rq_arg.len <=3D rqstp->rq_arg.head[0].iov_len) {
@@@ -1269,6 -1296,12 +1296,12 @@@
  	else
  		clear_bit(RQ_LOCAL, &rqstp->rq_flags);
 =20
+ 	/* Completing one message stops ->read_sock with whatever
+ 	 * follows still queued, and no path from here re-arms XPT_DATA.
+ 	 * The queued message would wait for unrelated traffic.
+ 	 */
+ 	set_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
+=20
  	p =3D (__be32 *)rqstp->rq_arg.head[0].iov_base;
  	calldir =3D p[1];
  	if (calldir)
@@@ -1293,19 -1326,21 +1326,21 @@@ err_incomplete
  	svc_tcp_save_pages(svsk, rqstp);
  	if (len < 0 && len !=3D -EAGAIN)
  		goto err_delete;
- 	if (len =3D=3D want)
- 		svc_tcp_fragment_received(svsk);
- 	else
+ 	if (svsk->sk_tcplen >=3D sizeof(rpc_fraghdr))
  		trace_svcsock_tcp_recv_short(&svsk->sk_xprt,
  				svc_sock_reclen(svsk),
  				svsk->sk_tcplen - sizeof(rpc_fraghdr));
+ 	else
+ 		trace_svcsock_tcp_recv_eagain(&svsk->sk_xprt, 0);
  	goto err_noclose;
  error:
- 	if (len !=3D -EAGAIN)
- 		goto err_delete;
  	trace_svcsock_tcp_recv_eagain(&svsk->sk_xprt, 0);
  	goto err_noclose;
  err_nuts:
+ 	/* svc_tcp_save_pages() has not run, so svsk->sk_pages[] is
+ 	 * empty. A non-zero sk_datalen makes the teardown-time
+ 	 * svc_tcp_clear_pages() walk empty slots and WARN.
+ 	 */
  	svsk->sk_datalen =3D 0;
  err_delete:
  	trace_svcsock_tcp_recv_err(&svsk->sk_xprt, len);
@@@ -1615,6 -1650,9 +1650,9 @@@ int svc_addsock(struct svc_serv *serv,=20
  	err =3D -EISCONN;
  	if (so->state > SS_UNCONNECTED)
  		goto out;
+ 	err =3D -EBUSY;
+ 	if (so->sk->sk_user_data)
+ 		goto out;
  	err =3D -ENOENT;
  	if (!try_module_get(THIS_MODULE))
  		goto out;

--dKmPKN0c6g9MSCIb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyP10ACgkQJNaLcl1U
h9Ay8Af9F/kxjH1KSXczC86fNIZJmtdWKuRsEsCoJ3yKTQGOXxiEV/0nGiH7UcLR
qgbzmTqFz8gDtGjZb9NMYRGrA7iOkoB3zVOIcCMy8yCuPeeesJ+vD8DYr8f2rpDI
6ieV0m9siI7TXfhNdiFwjQqs6XDVswrUXcpnmcpBkW0nRcabJZk2jIhgS/VRNY1G
nl4xxpEtt0DNVRMLboYvBNBMC3JvqSW5IPMW+pz384Kxb9oYVebJKdQPd0pyVZXT
B/CpX0CGaV2/s5Ls0ZDKz9Vv2V5Imehsr9N7aTI7Q6OY1zvjtucfOloamAxtEPy2
wpV4yqNsAZjsp8YwIj8/zo9GSkhb8w==
=fk2K
-----END PGP SIGNATURE-----

--dKmPKN0c6g9MSCIb--
