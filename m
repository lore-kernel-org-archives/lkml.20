Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745208;
	b=hf5T5BVKm1Tm8H/JvbwBBlXtA28DIZWFPP6NwdBYajdWKvuTPoc5QkMUIhY6l6rakw/g
	 fHAG5Htt/pqdeHBifCEScvZO5yYhm1Fk3Vz1M35PDUUm1mAQ40+NWJDAd5Df9H+hEfJS2
	 tLzWjGwk6btUQTwzon1YwXLhaGHZApgEwXJGg4mOF1+U/pnrgh6nOWeqYHepcs2eHwJRI
	 emju6RHl8SiHuOwzm2sfOcpZuMXspSHaiOZYxQCn8VNk6YQwlyYgB6FBZOtavK2Zg5O3T
	 fXbMhf7v2JlXIVuuIBxFhyNqaTYUDRcnfRL5zHWNlMUZ3TgbHQwMoEHCEjp1N0Boi7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wM9X+iy5MCRcwM8plfZFoLTKyrt2bxDseelvnwrZu18=;
	b=pfjRFmapuJlE50gqMnYIsNPlMdjsxtuPor0zevlFNA4CTxB0csg2Rogv7iQPd3Vg7vjb
	 681+TXZ5hHWljGVWY3E8Tqoy0LyZR5bc+Gs+H5AK3/ojwrrSJXRQBh4ArgiuP9BkbwNYs
	 ZIsrAG9dkyAJsL3qWayk9Exf+Kbe4W+pA30KN0VoFDLkmUAEc8Oev2TNN2XTMUkFoNuJN
	 nf+9NVQ4MG2JBCUYWjD8GSVq3p++5vIwaimVJbjCW5fTpnqmKGfcdAXdF6CZ4N9KrCusC
	 eXQ4IRDw6STHSfxALb4GF7UoLig47sU28+VibkWfPBqiJJyCi+StKYD0XSqTj1hoDnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDsEstZO;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E32B606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E32B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cDsEstZO
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1175808a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794745207; x=1795350007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wM9X+iy5MCRcwM8plfZFoLTKyrt2bxDseelvnwrZu18=;
        b=cDsEstZOoe5RaS1REViHKZr2NgVH4fotMK9V+PtupwGYT1fpbaoX1x1RxwOSITj6qj
         fRESDpsU8di1FlyJ2Myd52Umw61gLdmoLDWAKeU+K0+4fQ2MqxlTZkEUJKkgsPirblng
         v5BoDba/fAAMq/XNPW4fJva4Yef6TxU/bWK3fVpUyMpH4ATHts4rLVXAs6MDoct1CN2y
         EzGAyndI3yrXug1nnKPbBfSeGFytlvgIYr/O4y2YZ/VS6Xfh8q+AX6b9hqOfvcbU8bpc
         97PJvjL2kXMun6tbduI02A6Icc1R9k+N4RBc3ArZKwFCO9A1FYVpU8sZc4LgAjYPDBNK
         pIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745207; x=1795350007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wM9X+iy5MCRcwM8plfZFoLTKyrt2bxDseelvnwrZu18=;
        b=CaJov7FhT/ZyQIHnCldSA4PspyMbToQWb622wiRLiWR8XwF6MZgewotnOVWzKG+szH
         yAIX81xsU6PyOTdamKDveZEk1cx57WcUaoLClnTIxGtkVIQqeRuOEoxQXngkqjNnN9cf
         le31XZtq9QJMkO4sl8AuqVsooma5YimjfIx14C5H8eamC0ERxB2oXgduvAbIy+twNxe4
         xUPINSOLMg545sNSRPUQLywwnOJ4ALLR5P1/yQL6+G4HeBR/O0jJ7If4EmMOfckc/D9b
         tX+qkqDsc9AyBCpbDKV8LwEfhzloTmEv9kK//TKApV9ZZEW8h2ST9N+GumddDwjZcSQ+
         K5UA==
X-Forwarded-Encrypted: i=1; AL+hErHkHIxlHDLSuk2ILzrfOA5cIdR59KJi3ujFR1sP7yRRR5GQIiUoxQb3i+dzhLZsFFXEJX9XJe6OHORgKvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QdXMP+n+AdAmgBamGsaMiKw9FpiMoq8aU2PVBu8EUcMFmzRXP
	cplHDhN6cB+N9xEtqMJEwsgvD0v/r+W6Cq1eKXDcGEUVjZTdAMy3fUjD
X-Gm-Gg: AYBFou0px6MfzsdkVWEEPzR9wIC38vilShLNkp8hXyXQiWValZYAdBELzMggsUJzlvB
	IAeZtoCPQSEZK59LKvpO3AcaCBxOoUNjBTDHWEUGaTcF0hiBlHM5R0gCwNCz+h8E7MuRl47Al1e
	WlkLmL0B99erbfatVBPUoIq7QhqclVX97tfx2IbI+aqvD5ITNPlZhjG/G1yrQ76pffuoK6NohM4
	resb8CXnMPlcI0JFprl0D6JE/EYdO7Qi48KYvpGxqAmG5iwrAtp1sBUVPEUsAVEPP+rNZG5M/tn
	ghPJ5/2dhyZ3ATRoYfqfKjtXs/tJswKooqSc93KvfMjlev7YZC11CtnZYMAW3FCFOXg+fsQNRr2
	aH++8MCeV24hczc3bYxPREk4dfgiz8+0vVmSGORrDhEG44uzB5XwGESphbwkOXLRuWlXRQPVByv
	JGLkAATelbi+9hvdrYbfFc2bJoIhVHP+3hK7Zv1ClAr36B6YfpM1SQSTIAvXVaLtX9JIxYznoPE
	ofEEzEI9RY8no3Dq5T16WC5porNstvuZeL5OLyjwvmKJnQ3rPmDL7G63ljigfK/dkd5tX3t0ILu
	2/zQefAWLtriaiH9ONTY6zedVuVCFOITrMXzBaUSyFHAzD46WUcAYHOnybPnelXZqjqlUiMrfqU
	IIMcGDqJ3DX7jc9k1ZsK/6JZD8XCVVvEPzUgKWreTTW47FpyK+hMlfUmK5bki9wkOoDIdzOgXq5
	Ud5wBj4jlsX62CWQ2EQlT2pBHYv3KgAPrCOh95q9z6W7LF3IgoXe+80vVGi7OVU2xD2nW6Ei+u1
	ZUWedW0IMOila18NmF0+zcP6/lJmXKytuCGAvFcCsmnSeXCEZ8dsAAd8MPNkdS+
X-Received: by 2002:a17:90b:5105:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3b1b081ad46mr7535432a91.8.1794745207241;
        Sun, 15 Nov 2026 04:20:07 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm13828101a91.11.2026.11.15.04.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:20:06 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] rxrpc: Fix NULL deref on CHALLENGE to an unsecured client conn
Date: Sun, 15 Nov 2026 22:49:36 +1030
Message-Id: <20261115121936.5523-3-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

The I/O thread publishes a client connection in the local endpoint's ID
table, where incoming packets can find it, while it is still in
RXRPC_CONN_CLIENT_UNSECURED: the security class is set but
conn->security_ix is 0 and no session key is installed.  The key is set
up later by the sending thread, and if that thread is interrupted while
waiting for a channel the connection can stay unsecured indefinitely.

A CHALLENGE carrying securityIndex 0 then passes the check in
rxrpc_input_packet_on_conn(), and nothing before ->respond_to_challenge()
looks at the connection state.  rxkad encrypts the RESPONSE with a NULL
cipher and the work item oopses in fcrypt_pcbc_encrypt(); rxgk
dereferences a NULL transport key in rxgk_rekey() under
conn->security_lock.  An unprivileged local user can do this against
their own socket: the epoch is in every packet the client sends, and the
connection ID and state are in /proc/net/rxrpc/conns.

Discard a CHALLENGE that arrives on a connection still in
RXRPC_CONN_CLIENT_UNSECURED.  A genuine server cannot challenge before it
has seen DATA, and no DATA is sent until security is set up.  Read the
state under conn->state_lock to pair with
rxrpc_init_client_conn_security(), which installs the key before changing
the state under that lock.

Discovered by an AI code review agent, reproduced on unmodified mainline
with KASAN: a CHALLENGE with security index 0 sent to a connection listed
as ClUnsec in /proc/net/rxrpc/conns oopsed the rxrpc worker with "KASAN:
null-ptr-deref" in fcrypt_pcbc_encrypt().  Same on v6.12.117.  With this
patch the CHALLENGE is dropped and secured connections still answer
theirs.

Fixes: 9d35d880e0e4 ("rxrpc: Move client call connection to the I/O thread")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
Tested on mainline b3dfbde62cf1 in a 2-vCPU KVM guest with KASAN and
PROVE_LOCKING, AF_RXRPC and RXKAD built in, as an unprivileged user.
Unmodified, the rxrpc worker took a general protection fault with
"KASAN: null-ptr-deref" in fcrypt_pcbc_encrypt() from
rxkad_respond_to_challenge(), and the test process then did not exit
within 300 s.  With this patch there is no oops: the CHALLENGE to the
unsecured connection goes unanswered, and the secured connection answers
its own as before.  On v6.12.117 without debug options the unmodified
kernel gave "BUG: kernel NULL pointer dereference" in the same place.

Stable: the hunk applies wherever ->validate_challenge() and
rxrpc_post_challenge() exist, v6.16 and later.  6.12.y needs a backport:
there the CHALLENGE is validated and answered in the work item, so the
same locked test goes into the CHALLENGE arm of rxrpc_process_event()
and returns 0, as the RESPONSE arm below it already does.  6.6.y and
6.1.y were not examined.

Not tested: rxgk, the RXRPC_MANAGE_RESPONSE path, interoperation with
AFS servers or clients.

The test program is not included here; it is available on request.

 net/rxrpc/conn_event.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)
diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index 611c790bc6d..da16521cdfb 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -511,6 +511,16 @@ bool rxrpc_input_conn_packet(struct rxrpc_connection *conn, struct sk_buff *skb)
 				rxrpc_send_conn_abort(conn);
 			return true;
 		}
+		/* No genuine peer can challenge before the client has sent
+		 * DATA, and until then there is no session key to respond
+		 * with.  Pairs with rxrpc_init_client_conn_security().
+		 */
+		spin_lock_irq(&conn->state_lock);
+		if (conn->state == RXRPC_CONN_CLIENT_UNSECURED) {
+			spin_unlock_irq(&conn->state_lock);
+			return true;
+		}
+		spin_unlock_irq(&conn->state_lock);
 		if (!conn->security->validate_challenge(conn, skb))
 			return false;
 		return rxrpc_post_challenge(conn, skb);
