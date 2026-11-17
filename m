Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880696;
	b=UOdVmiT0o5YpmPllNdcxHL6YFTgDZPMwHXvT3DKkyfsWn6bFWLKbEq4OX5IBKrOonViX
	 GLP8PzeSj6HN2TxM+zHnRf4M/1wC/tBxcBhWwCAnUlnLV/TxuJmPvV+H68v1x1kGjF5A/
	 JtE5/+HKazLQl1LDyvlKS7mVEZ2XqwiTi0k7wjaZ6RI8QHRuz8Bqbbz8qZJdPWl2WoLFH
	 v4latZ4P4fIDsXCrM+B4nrSudQnHZVG35WTEv0UEYc8hKqZ0Fume0Uf1WL+/fMjzIfl4u
	 SbBLQjku1qV+JL/05oFt0OmI6UJS7phSb/d/FOPvOhULSP74UcCTr1zxs++cIu7tSSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=f4sQBdM/CZrgle9RyHSRoi5sqRm62abIrkAqarEe7Ko=;
	b=C6sD2RMgcugEnZ/MR6Uja5lJ0khXepuE/i3JVK/YuX70GmMhiGiCv27bf1Fo7kJ5G4j6
	 4khL6P41rY/1fOJUe50YIpkj8J7YU9TFl+ZDJDTJfscqy6tBVuAdZymImDpShpK3pS4aB
	 /xXuZ00GodRi7V/j5G3SzaA491SvaWakVQ+S1NZrXM6Cq6EOiSDg1pvqQEZWgeZpjHzzL
	 eoGwpJLiuDZTanKsUwd/Mc7JzBmGBedyJlCTElb0awbAPSoO1+DWOI8rEbiceaLT2oi4v
	 i7e1L8x3kj6K5qpGIu3SACodA8h5iqBpH74v7gv/v4TlLRl+AVzKgJ58+PRuP0PwKDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=V41oTcyE;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A4D606A323;
	Tue, 17 Nov 2026 01:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A4D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=V41oTcyE
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGNPTKj3667758;
	Mon, 16 Nov 2026 17:58:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=f4sQBdM/C
	Zrgle9RyHSRoi5sqRm62abIrkAqarEe7Ko=; b=V41oTcyEPV6TiMij9wHA4iLLL
	cd5HA/DQIf3jbVgSYMfwnPbe6aB2ifxdVFIX9XyhGYbjuxAX7/RKFRiSXgBy1hi/
	fkcc0c060SB8sSI2rPDhNGDmtE9ZqKnEZ84rQlVxEeULgpKB7H0M8PxKQKIa8ii1
	2qd4pxKN357DglJ4lZBGtCd21CzelPXTGuS4ZV9iZYSu5KpFQVft7y49uJQgxfCU
	fu3dps+hGCpUeSpzd7TWlrfBFVy5iCbGWXtDPVGZsF0nPPo16WyKwNuZtgXn3UXd
	oVxwZw5yYtvYBe6HybAhghUWton5u2NkdZqTRaXbfEW4jlLGPAdaKYK8O30hA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hxmj4ef0y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 16 Nov 2026 17:58:04 -0800 (PST)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 01:58:03 +0000
From: Bobby Eshleman <bobbyeshleman@meta.com>
Date: Mon, 16 Nov 2026 17:57:53 -0800
Subject: [PATCH net] vsock: only undo SS_CONNECTING when connect() fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-vsock-connect-close-v1-1-43fb125973dd@meta.com>
X-B4-Tracking: v=1; b=H4sIAKK0+2oC/x3MQQrCQAwF0KuEv27AFGxhriIuOjFqUDIyKUUov
 bvgO8DbkdbdEoV2dNs8vQUKyUDQ5xIPY7+hEMbTOInIxFs2fbG2CNOV9d3SWKrVWetZbF4wED7
 d7v79rxeErbgexw/9Bu0fagAAAA==
X-Change-ID: 20261116-vsock-connect-close-1beb7cb51e7a
To: Stefano Garzarella <sgarzare@redhat.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>,
        George Zhang <georgezhang@vmware.com>, Andy King
	<acking@vmware.com>,
        Dmitry Torokhov <dtor@vmware.com>
CC: <virtualization@lists.linux.dev>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kyle Zeng <kylebot@openai.com>,
        Michal Luczaj
	<mhal@rbox.co>, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAwNyBTYWx0ZWRfX6JKO73RD8IZe
 LbpK2JSUaNj9/mqn7swXWYjS73f9xt3cDSjEoGHnJYCAkRJaLEa019JQcRAhcQfwL7sZVjS8VIj
 UdKwCv9bCoXbOBA53otYA5u+hhPNaNI=
X-Proofpoint-ORIG-GUID: lRJYsHqhViwVRccWmleBjAaJwTmWwBth
X-Proofpoint-GUID: lRJYsHqhViwVRccWmleBjAaJwTmWwBth
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAwNyBTYWx0ZWRfXw/Z4aIhC9YS+
 wav96e9WI5FaNbJFNRL2kYa0fcCc/gUAdUFzX8WcmGDkgl9Z5lR3jPy9f/1nJxVEGaT+HfGVZq6
 dopUGNGaSqaY8yD+IzsUXCflLXvoEip0bdX7BLY4tlZNqk3rAR/63N+iVjlFGxx0z9zNyH/8axQ
 LKHs1K9u+OMM1dFZh5xVmKxTiigV2b865DUcKWcwzkoAE+wmeWUD6HDHyZb6GLBJ+oiLO+jkpnp
 NQqenKIOZprU0ozD8S8qaWZWWUulz8jkCLTYWhsycXzbhVV2kzs1kpbYULRfQUXICZZJYWtxtPe
 65ZjIds9AQ6tLUX6QyWMb7ptfAVlDoASuzhdcxavXpUtyb/dWMH2pLx/mipzFaAc/sRxa7hVnId
 HK1sZFjmRe30li6blciLuz6Q4HbAjc+tNhufZOUOP6jnuvjqtHLfvfVp1ha7uDgYC7JQFtE00Cp
 0k7OASoO1GyTL1uKLZA==
X-Authority-Analysis: v=2.4 cv=Vp+2kO2n c=1 sm=1 tr=0 ts=6afbb4ac cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22 a=VwQbUJbxAAAA:8
 a=LG5T7v2SAAAA:8 a=VabnemYjAAAA:8 a=8SSc3Ac-GxnkQpnFFP0A:9 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_07,2026-11-16_01,2025-10-01_01

vsock_connect() sleeps with the socket unlocked. Meanwhile the transport
can complete the handshake, setting sock->state to SS_CONNECTED, and then
reset the connection, e.g. in vhost_vsock_reset_orphans(),
virtio_vsock_reset_sock() or vmci_transport_handle_detach(). When
connect() gets the lock back, it finds sk_err set and moves the socket
back to SS_UNCONNECTED. Userspace can then connect() the socket again,
and a connect() to a CID on another transport makes
vsock_assign_transport() release the transport the socket was connected
on.

Only move the socket back to SS_UNCONNECTED if it is still
SS_CONNECTING. A socket that got connected stays SS_CONNECTED, and
another connect() fails with -EISCONN.

Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
Reported-by: Kyle Zeng <kylebot@openai.com>
Link: https://lore.kernel.org/netdev/20260909-vsock-connect-reset-closing-v1-1-50298b9ccfbf@rbox.co/
Suggested-by: Michal Luczaj <mhal@rbox.co>
Reviewed-by: Michal Luczaj <mhal@rbox.co>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 net/vmw_vsock/af_vsock.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 1d7d53542724..6395c6a7b0b1 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -1704,6 +1704,16 @@ static void vsock_connect_timeout(struct work_struct *work)
 	sock_put(sk);
 }
 
+/* Avoid breaking the socket when another thread has changed its sock->state
+ * while we were asleep.
+ */
+static void vsock_connect_close(struct socket *sock)
+{
+	sock->sk->sk_state = TCP_CLOSE;
+	if (sock->state == SS_CONNECTING)
+		sock->state = SS_UNCONNECTED;
+}
+
 static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
 			 int addr_len, int flags)
 {
@@ -1862,8 +1872,7 @@ static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
 			 * sk_state == TCP_SYN_SENT, which hereby we break.
 			 * In such case VIRTIO_VSOCK_OP_RST will follow.
 			 */
-			sk->sk_state = TCP_CLOSE;
-			sock->state = SS_UNCONNECTED;
+			vsock_connect_close(sock);
 
 			/* Try to cancel VIRTIO_VSOCK_OP_REQUEST skb sent out by
 			 * transport->connect().
@@ -1877,10 +1886,8 @@ static int vsock_connect(struct socket *sock, struct sockaddr_unsized *addr,
 	}
 
 	err = sock_error(sk);
-	if (err) {
-		sk->sk_state = TCP_CLOSE;
-		sock->state = SS_UNCONNECTED;
-	}
+	if (err)
+		vsock_connect_close(sock);
 
 out_wait:
 	finish_wait(sk_sleep(sk), &wait);

---
base-commit: 533ec433efdc11196f438da90d683053a57257ff
change-id: 20261116-vsock-connect-close-1beb7cb51e7a

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

