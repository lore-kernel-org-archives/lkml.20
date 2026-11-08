Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794176744;
	b=eqX4Jt+2Ov7yLV3QkkLP/Rt4xrPnK0Wu/lCxYJQNGfgTuk8Il/TXxUVWLvFDLdwXxFg9
	 NZ0vDSToFsziRIubu3BoCPLLkOya7wtxvm5utmerhEVLzUSzH9efsHwrlr8mAXlM1lIWD
	 0fckLlKY0K8vkGijKzzIZdf8OLhByVyKioW+7P1W6BhHMcgWFh/9c/XlX8k2V1Tge4mVO
	 /DgfoSHGyU57n/XMA6f+3qaAmyLQdXB9ACxQHOOF6YqVkkWLbtgcgZfhL2vyuQ5+XZncE
	 Hfqba9Tnrd631PnEa0XpbzbeLY0MGaJpIk4wkOwLSX4/lwFB3P037h1jYfg/diQyyTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794176744;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AaBrpfH0IYUixaU7BA7hLUWArC2gpbyzJoT9RsAM/a8=;
	b=rBmLuh+z80TvMKsV6zgHdo8c2ts4iC9W5PqtKExWgp2zTtZEBxOmzvURRPjD3k1ioQdf
	 UKMBHe/eEtipTQlkskm6fzglJRfh3yTHo2PL9gxjpfN55ncyLjJGrT4mNq9cCU/rXZfL/
	 yY5EPUECch+oiaEEijCDsg2RVbYZ7SdFjtkRQZ7E+Wm9J5u2TssWR2rCBU+SMnDBFVnzI
	 cbNHmvidDvZMcW3La6yPS1cMXhKbyRL3+9zyY7cPjx9fWncH6yWoN5JPgQLwOPub3hzFu
	 Odeo1k3wbUBLMKcF2yOPKYCdxscgAfvnCrM/0gqXH6bR9BRzK0c1dyywL1VbdAjXNug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b="ow/c9rhb";
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C2606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C23C2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ow/c9rhb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794176740; x=1794435940;
	bh=AaBrpfH0IYUixaU7BA7hLUWArC2gpbyzJoT9RsAM/a8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ow/c9rhbSx2K0anrX6/02QCKhiYhpO27FfKm3pRzeryPSqYTS43mbcC5phPVsrJQl
	 RZoUtgrzYW26iQKcYOaJN2yC57JQj/0+AiNxzDMVIv2Un4Cz4QrRDthZLc7s/eqQQ6
	 QO7iFFzDGuaNEClO6FgE0+/8EOpy0FvXj64VJVocZvPNAXnh8VeCvBq5JsF1iFj+JU
	 t4mqVzQKI4RwYr1Px4bNHM030PYZTxZrv5Ni3wzN5T+jhlKoP082OgeA23fvF5g+qc
	 j/a6UYxU53ViCREVAGMo1jueA6kjqB9IdfzXBEjBCHnYCHh4f8k6j3CJWKkhixI0im
	 obW9Dt7K5oDlA==
Date: Sun, 08 Nov 2026 22:25:35 +0000
To: "david@ixit.cz" <david@ixit.cz>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] nfc: llcp: drop socket reference on undelivered UI frames
Message-ID: <-mPkBfqn9vzam8gV7Gbd5HGTPILiECmnRoTWiEESIGtgUyQCeZ3cmL9anfsTEqgkI_OIepj_Pf31PXrps4461AE48xq0Vp0R1dnAuSYk_8I=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 14992636808d9ec8645918bdab1a94ded0610819
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

nfc_llcp_recv_ui() looks up the destination socket with
nfc_llcp_sock_get(), which takes a reference on the match. When the
socket exists but is not SOCK_DGRAM, the function returns at the type
check without calling nfc_llcp_sock_put():

    llcp_sock =3D nfc_llcp_sock_get(local, dsap, LLCP_SAP_SDP);
    if (llcp_sock =3D=3D NULL || llcp_sock->sk.sk_type !=3D SOCK_DGRAM)
            return;

A remote LLCP peer can arrange for non-DGRAM sockets whose (ssap, dsap)
match this lookup (accepted stream sockets take dsap from the peer's
CONNECT ssap; connections by service name use dsap =3D LLCP_SAP_SDP) and
then send any number of UI PDUs addressed to the socket's ssap. Each
frame leaks one socket reference: the socket is pinned forever, even
after close, which is an unbounded kernel memory leak from an RF peer
(memory-exhaustion DoS, rate-limited only by the LLCP link).

All sibling handlers (hdlc, disc, cc, dm) pair the put on every path;
recv_ui is the exception. The patch below puts the reference on all
paths and only delivers to connectionless sockets.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), net/nfc/llcp_core.c:902-936 (nfc_llcp_recv_ui), llc=
p_core.c:218-251 (nfc_llcp_sock_get/put).
Longstanding code.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf817..78f80c4 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -917,9 +917,15 @@ static void nfc_llcp_recv_ui(struct nfc_llcp_local *lo=
cal,
=20
 =09/* We're looking for a bound socket, not a client one */
 =09llcp_sock =3D nfc_llcp_sock_get(local, dsap, LLCP_SAP_SDP);
-=09if (llcp_sock =3D=3D NULL || llcp_sock->sk.sk_type !=3D SOCK_DGRAM)
+=09if (llcp_sock =3D=3D NULL)
 =09=09return;
=20
+=09/* Only connectionless sockets receive UI frames, but the
+=09 * reference taken by nfc_llcp_sock_get() must be dropped on
+=09 * every other path as well.
+=09 */
+=09if (llcp_sock->sk.sk_type =3D=3D SOCK_DGRAM) {
+
 =09/* There is no sequence with UI frames */
 =09skb_pull(skb, LLCP_HEADER_SIZE);
 =09if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
@@ -932,5 +938,6 @@ static void nfc_llcp_recv_ui(struct nfc_llcp_local *loc=
al,
 =09=09pr_err("Receive queue is full\n");
 =09}
=20
+=09}
 =09nfc_llcp_sock_put(llcp_sock);
 }

