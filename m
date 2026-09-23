Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7928F53B322
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188822; cv=none; b=qCZovypkAaahwu/v/VKG3pYQPYGmROGJY1E4I1I/P9doL5bu6KxRL9JITq0gNADWIH96H1sIRya0LxHfHM75JFCBWxHP8EdRg+w2/1y2YiHIEhS7NYeiGhQoL8JaTJZNoLFW+yrsnaGF2gcK9dwjoIlcL5Q+1nQT5Asdu9S7hbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188822; c=relaxed/simple;
	bh=EvUQuL+9sEfu/yTDDsYynyczprpLsvtenWv1NJgsNFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lx27+Ng+ETzlkutbJCWcRAbvxNL76anwuKUdSIWlPelchVmIiTftZWOFyEpysDEERUt2hKMN27+Z/53KqurTxFCWEDzsCL4ojQbes1+nI5Lj3Xa394ZkdZKO50VNv1IgPWykuQZVCxhYgOnchAjtCMkmOmpdW2B4u9J5Ef0M7Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXU0bD/a; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXU0bD/a"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so217702666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188812; x=1790793612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlVZpnAHAmHOvMabqqtARGu8SxbZU7qizTP5GLSJRM8=;
        b=SXU0bD/aaPLax4TXYMVFvLchdTACOZD3WoXSwdY7ltH24VEYxKen7mvixOWF0jzSJX
         9P7aV6FJ9wOw4bt5pc338ZuTxUVw3avSvyEtaffVlW9Ahlsfmpp7wQWijsteVO7Nge+p
         DeWPfHA2Vh+Ev9tPZZOVtMEfVZ7niW+U4PfxU41tO3dECif6Mcw+iDLMhrZIwSgQdfKd
         zQZ9szqf8hKcX5MW5afpWAH+bUen2gnUc/NuUupTSyVM7nxBw9dCB+RfhzDMw8v+ecjX
         Q2iWHbDq67Nn0CJOkgg7UXz3ckGIsUVtaQSmD2HBWV+PW7aOTZ30KmWnN0RBcwhkHcqH
         h92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188812; x=1790793612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlVZpnAHAmHOvMabqqtARGu8SxbZU7qizTP5GLSJRM8=;
        b=UqcIYe0xVuoJ+vXyeCZDHBtw+Pns4iT0s8/E4pOyRuET6jkCUFd3UkCUe+4m0uja5a
         HfsySyS+sMCqLbPtX3W/X+uFg4vuumSaBoZqw4aZIUkXCUdQ8pZ3h0wqwZ9swEWwr+DM
         a9mTnILKh3mVmzD03QQ/j/JkJguhmHwxHts9+NHQTdjiH3zJXNYho6xsftm2KMRl/BwF
         iFP8lspVURzsZLRqRjmSjHXPEiW8j8lTKsNSW1MZsaWF/xBKz42UuY9o5JAhHikM0RBu
         XJqewWCMFdo+tAGwZhDwXGNuBI6U2T4UhzQ6eTiu9hZNcSfwGgDtxSJ0fUZ0uImnksfS
         BoCw==
X-Forwarded-Encrypted: i=1; AKwUvByxHrNS+W3B04QBy4j1d5q6c10L4lrRljdA+tGW+ykmrJFKuzVPuxRRMK1UnM7ejy4EeIxb+kfKwFYxMbw=@vger.kernel.org
X-Gm-Message-State: AFuF++mi0Z+EF10n4bqKegl5OyC5x9CwdvQeteiVVAneOqQHnjEua4FJ
	akU2uGcnSpo8xRZyTUq9E9bxcOxwFLjB8uHhTqj2VZrsHqqmfIlvoEiJ
X-Gm-Gg: AYBFou2XQ2lvxb+06x86GllqxVJBqPOkkMmOfP7azfg4sL9ffTVQRsUfV35qd7HcOvu
	C8HA6SWyLlChHymNrD7GxbOs6HiG9UZ2eriauEzIvFrIQxpp0E2zkQs0e/+R7bp47r6+5HUXYlc
	bHQekkBpiI3Zo9cIBrlR9rgoTKS4Ph3b4fQMOjzmcd5zz5r+RfIjFz/xIbPEW5Augmm5tJ3nRsm
	RmA3AJe6ZAXUlDXK0Jc6Oj++OatrQVaFAiQyA9J6kpZluYHAdMBVUQkW5fCkQwLWbfNhskJyKlc
	L7NESuyprUdtyj/8ezL4gjMqaB2sW/REWpk99B/KWn19OF1RRVOZiov9DQUEe0pA4esKEt/ub+k
	A5qOiIeqz+ibexXYn8hdI0ZIxF1JyAIkW4PQvodQLxbZ/XSWA43HP9Ex1oEvhYBzCHerEk/UnJi
	UCDSpxdGlMYgPRzR8lOBUzFCruyGIGF7K6e7rjRbUjZpXD+ptJ5u0hAlpjZhA/k6boWxtruCbhD
	CdofVHUyPMmKrxL2U+HGksC0sElaNSVmQnhcDUrb6mte8zW2HK/ZDQZefI=
X-Received: by 2002:a17:907:c71b:b0:c29:53eb:9913 with SMTP id a640c23a62f3a-c2ac2531dafmr836366b.38.1790188812262;
        Wed, 23 Sep 2026 11:40:12 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33faf4sm173417566b.3.2026.09.23.11.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:40:11 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	bobbyeshleman@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH net-next v2 1/2] vsock: report pending receive data to io_uring
Date: Wed, 23 Sep 2026 19:40:07 +0100
Message-ID: <20260923184008.153541-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923184008.153541-1-devnexen@gmail.com>
References: <20260923184008.153541-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AF_VSOCK stream receives never fill msghdr.msg_inq, so io_uring cannot set
IORING_CQE_F_SOCK_NONEMPTY and retries a multishot receive even after the
queue has been drained.

Fill the hint at the common receive exit using the transport callback that
SIOCINQ already uses, and report 1 once the connection is finished so the
caller performs the receive which observes EOF, as TCP does after a FIN.

A vsock loopback ping-pong with io_uring multishot receive drops entries
into __vsock_connectible_recvmsg from 1.97 to 1.00 per delivered message,
and receiver CPU time by about 3% (25 runs of 50000 messages, p=0.006).

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 net/vmw_vsock/af_vsock.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index f840498b58af..20d6f9ca6a96 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2543,6 +2543,35 @@ static int __vsock_seqpacket_recvmsg(struct sock *sk, struct msghdr *msg,
 	return err;
 }
 
+/* Bytes a following receive can consume, 1 if it would only see EOF, or -1
+ * if the transport cannot tell.
+ *
+ * Called under the socket lock after a nonnegative stream receive, so a NULL
+ * transport implies SOCK_DONE.
+ */
+static int vsock_stream_inq_hint(struct sock *sk)
+{
+	struct vsock_sock *vsk = vsock_sk(sk);
+	s64 data;
+
+	if ((sk->sk_shutdown & RCV_SHUTDOWN) || !vsk->transport ||
+	    (sock_flag(sk, SOCK_DONE) && sk->sk_state != TCP_ESTABLISHED))
+		return 1;
+
+	data = vsock_stream_has_data(vsk);
+	if (data < 0)
+		return -1;
+	if (data > 0)
+		return min_t(s64, data, INT_MAX);
+
+	/* Empty but finished: keep the caller reading so it sees EOF. */
+	if (sock_flag(sk, SOCK_DONE) ||
+	    (READ_ONCE(vsk->peer_shutdown) & SEND_SHUTDOWN))
+		return 1;
+
+	return 0;
+}
+
 int
 __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 			    int flags)
@@ -2606,6 +2635,12 @@ __vsock_connectible_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 		err = __vsock_seqpacket_recvmsg(sk, msg, len, flags);
 
 out:
+	/* Seqpacket has_data counts messages, while io_uring treats msg_inq as
+	 * a byte length when sizing retries, so only streams report a hint.
+	 */
+	if (msg->msg_get_inq && err >= 0 && sk->sk_type == SOCK_STREAM)
+		msg->msg_inq = vsock_stream_inq_hint(sk);
+
 	release_sock(sk);
 	return err;
 }
-- 
2.55.0

