Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685396;
	b=rB3xqT3olvPiBLX0oxVTuEY8q3wQ48pJcY24tb/baJNQCNr7MlEGviJUwI0cj322xJqE
	 bfpavJ9YOhW2XC9BBZPBCp+B5S+gQAVaa0U4oTcaFu5Np7QcT7nwjGbItCwwBOPROxfYb
	 LRYDbDx0+Iz/b4Ssj970FxcSuwjzPK9HhhmGka2L+xB8CAFFBno6zKCe3gop0S4cWQY3R
	 Yt6laGlSf5Ybm63b6DIdoEhJECXm6p1yDKAwO8iBHSIfGsvoxlIOfrhoNAuOdVgzIDxon
	 kIkAVtT1o/vFAp3WeE+s3Q+X5uAZvHeus+OWA7QXNibrwn4fAB8ihQqpVg8j9e8DRSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685396;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uGDPCkxAS1u3+kS0Es3UxEOLMxlM+x02kBSvbeFEyNI=;
	b=i50mDDIOrEuIaY+duuT3gI5Qq92w+X4J5c1gwZW17oOP1Uujs6xuaeLABGzO9hJzyP7A
	 mxvvuFcSjPgdgAgHzEItS3mDTEKQIkNvfPR75luwTiro3M6GyW095tENXEeyTsxKLf3Tn
	 IKiB/Z4UaMu1yFy3D3zfUihJWQgkBAm56dfzrn6UUB3X+qPopU9cKoMKcftFgSXSikiua
	 mwoxGAGe1QK2CZDOAfZS1sLx7jIvbwaG9MMb4lkLwr9tbwNJf0BNksyZtPC5YUEYoBcHR
	 slNzSKImhEDoXOCZ5O+Q6GywLhFKXZNJDzB3TaYMMRZV2Hwf/Ib0Z0gcB5oRznXbv/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jdMfbLep;
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DC606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 365DC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jdMfbLep
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M1YbzTCqAcJAypRi6ERm7NPN8wjVLq6CpFHY8wkKI5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793685393; v=1; x=1794290193;
 b=jdMfbLepF1icIoNlGic7ydudGUVpEhG1ktFMKhiXvtzdW8b+F5xteFyBM6zbjwHJKtmSzI9U
 73glOXavMcIi5NizzKejDNcnUHEBYQDCJsdP80XVnRBLAkPBeHKJKi3/cy16euCkuPNBQAwZNM/
 y0fCFHq1Ul+rwl4b5JYJpLzs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e5d25ea88540c105;
	Tue, 03 Nov 2026 05:56:32 +0000
X-Mizu-Trace-ID: e5d25ea88540c105
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Guillaume Nault <gnault@redhat.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	David Bauer <mail@david-bauer.net>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linkui Xiao <xiaolinkui@126.com>
Subject: [PATCH net-next v2 2/2] l2tp: unexport l2tp_udp_encap_recv()
Date: Tue,  3 Nov 2026 13:56:12 +0800
Message-ID: <20261103055614.3729-2-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103055614.3729-1-qingfang.deng@linux.dev>
References: <20261103055614.3729-1-qingfang.deng@linux.dev>
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

Removing pppol2tp_backlog_recv() eliminated the only caller outside
l2tp_core.c. Make l2tp_udp_encap_recv() static and remove its export
and declaration from l2tp_core.h.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v2: new patch
---
 net/l2tp/l2tp_core.c | 3 +--
 net/l2tp/l2tp_core.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/l2tp/l2tp_core.c b/net/l2tp/l2tp_core.c
index 7e042a3e648c..d575ebb97577 100644
--- a/net/l2tp/l2tp_core.c
+++ b/net/l2tp/l2tp_core.c
@@ -1009,7 +1009,7 @@ static void l2tp_session_queue_purge(struct l2tp_session *session)
 }
 
 /* UDP encapsulation receive handler. See net/ipv4/udp.c for details. */
-int l2tp_udp_encap_recv(struct sock *sk, struct sk_buff *skb)
+static int l2tp_udp_encap_recv(struct sock *sk, struct sk_buff *skb)
 {
 	struct l2tp_session *session = NULL;
 	struct l2tp_tunnel *tunnel = NULL;
@@ -1108,7 +1108,6 @@ int l2tp_udp_encap_recv(struct sock *sk, struct sk_buff *skb)
 
 	return 1;
 }
-EXPORT_SYMBOL_GPL(l2tp_udp_encap_recv);
 
 /* UDP encapsulation receive error handler. See net/ipv4/udp.c for details. */
 static void l2tp_udp_encap_err_recv(struct sock *sk, struct sk_buff *skb, int err,
diff --git a/net/l2tp/l2tp_core.h b/net/l2tp/l2tp_core.h
index 25ae4c25d3ef..371aea239705 100644
--- a/net/l2tp/l2tp_core.h
+++ b/net/l2tp/l2tp_core.h
@@ -254,7 +254,6 @@ void l2tp_session_delete(struct l2tp_session *session);
 void l2tp_recv_common(struct l2tp_session *session, struct sk_buff *skb,
 		      unsigned char *ptr, unsigned char *optr, u16 hdrflags,
 		      int length);
-int l2tp_udp_encap_recv(struct sock *sk, struct sk_buff *skb);
 
 /* Transmit path helpers for sending packets over the tunnel socket. */
 int l2tp_xmit_skb(struct l2tp_session *session, struct sk_buff *skb);
-- 
2.43.0

