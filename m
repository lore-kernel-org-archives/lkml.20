Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918868;
	b=l0IHe2XpmAYpBYV+Le041a/PojpH6SwZBgfLwXMIGcYS6zBXaCAeAuDTPwnV9lSramFQ
	 g6xwFNahuWID3HVhkid/iPJnW7ZbSPzcd0hIsgn8uf0pR5BvV3okt2c297nGYtql4lfQ/
	 ahNqh77rY5JMu8jioDfw5Oq+M2gryWNiuy7UT0h4IHg7U/MCkeCVE/0sjzuGBEZQi8kTS
	 0i6V3DbLu0wYFOJQNDUyhP1gZbkwvWc2PoXCXbnVLSlJtT2j4N6U1hIjh5x3SnM5Lh3xZ
	 h3Hpw8BmyHOetsKSQYUrZREGx52UiIGSk2hkQvo6bJTEnevwcUf8SCCPJQlOOJ2o/jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oiVExxVVT0Fz3JK6FuEmAOW2fg9n/93PZDcOE5EMutw=;
	b=GhEfkao4GChn46VvByIq3Dr91ViuKgTEM///NJOm6ln5saY65Xs9fkGQ3YLX3TkX04p9
	 mQeoZfrZ/OhXELwxHYtuVQ7GVOGLpTFIjr1e3b1IB3suMVZrwws/HAHD7X6gr7E0+GqqD
	 wUYThtIw3JKS9goGm6jI7lQLp6TE8jfGftrjgukF1LjNrbRKedmbg4HQpl+Xlllrnh5f8
	 RRXa7oxS/Gd3Mrpyg9wF3ZK/5nepmKc/NeXXMcnx3dRD8025Bx5FYfUKIPuaBWRcA6Hf4
	 M4r7dD3Zj5uDpTmDIMVjKT+zPHkcB7e8+Hnt39pBVjHJ4ssE+iVXVWFvmXYV2Kp92Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aQ5GeF9g;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E35606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E35606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aQ5GeF9g
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e4831c028so431448f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792918867; x=1793523667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiVExxVVT0Fz3JK6FuEmAOW2fg9n/93PZDcOE5EMutw=;
        b=aQ5GeF9gCBFKm0UYAPYKMdx7hfFid6OaDUdtoasgVOKCs/6unUo0B0xi8amcmgZ4rf
         9DwnU+BjhtwH1xZpyhZmH9rHh8oYju+8AQEPhwzUtQ2RJh3ymk8kSf1TtB4EOOPj5RxY
         pQinIr73sQZW7mPENFNph5wEuq+YeFyzEzFaMxTTKkRtmoFSCtlEQnEfYwDX8pO0G3y4
         Oud4aRvniY3WbWroBPRl3AxuHhMX1gYs+moMaofdZ0kbs5002w+Ig+PneeT1c+w9/mpt
         kpTKpFK3X9cNWxfbYC/dDMwNgBfcQRfwOPnvbUFDATI+RRgf+/gwxScUe2ybg1pDuBF3
         HkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918867; x=1793523667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oiVExxVVT0Fz3JK6FuEmAOW2fg9n/93PZDcOE5EMutw=;
        b=uA+9mz0PAPNnW08b+r0U1xPuNSsgO9T7ivAX1vxh/5rMlHscFcZ+b1sVpvL2yFNFGi
         /vE6s365TsJyH2PGTf12ffpeSev7SyR/GB3fqPnzXtWmhWLAyjvH/W1JhYk7XUwyy5nS
         Bh/INl6OITfE3/5eM7OOsCfgL/wJyEVSgzx+5joT5vlqwMyIHYDdkFTT++eAtW6NoqSc
         7KWEbYIJidD+fOP7U3vGMYh2zAPIAjVmnzMvEs6ZpTAs6SCZ2yRsZERURtjC6d5UTzBc
         ncufoJNYis0rLPKDjkSPGbzfHCTJ330ePYt5dYZwP5hLs3G4yvnj9qpi9hQS7KVddrJu
         8bLw==
X-Forwarded-Encrypted: i=1; AKwUvBz6hOPKPef6gr1MgLZoZUe+yIrODrfgc2ONUgQfOoBe8MXS0jt3yYYjJXhfN2Jx04wXHOcTKLs1SGLD++8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKn767FTUcWo3utBUlVlxKkrSfy5zcmiUIlNppLQ2VYqrr9eJ/2
	7vMiBPmXYnUm77f2ZNAbRzw3ZbU8lLEyJIPxYbzn170tmDPUGgfq7ul8
X-Gm-Gg: AYBFou1IOdKiH1DQw1+IAstOjF9D53KkRVWyAk7eq8Rp2+xGdrRE6VU4g7UsynfuiL/
	gMnPJJroyZAGZ3fOrziqunadi7LuVdsLLh/nPGJZyGdA+Cpk1gCBXA+iRHhsRDubTHHpQCp+tkc
	ctHxjgSxmzz2odR3Fw/RKscKmkR9BnKjTAUng4szQqac/qkJhe2xEZY5HUdjnVyoZo0a8uUojPR
	SwrlQ3BS7JEX+kc1QKUZ9xBamOVz78x0xy6d5cp5AcJ/MXqLHrlFKTn94Bk9AVYEoQJ2WKRIJfh
	uon6tZRkme1sTGuLb/Y4JmqbGSDJB5kiXaxpQKvFjyUv5EzMIckXsLJYIh8OCkTxrG6g3ruQ+ik
	Rcx7MibYpX7iYerwX4B8y82dUp/4rylM9xRvNYCG5UFZl4LC5oRSa0j5vqSdmV+sJLl1fGFFDAn
	VMbKESgXVqXYbq+kZ9NKH8j8RB2d2wfMzwIS8zndfowbV6MmEW8sQOxGC3yV0dqTlqfzzHHnYKL
	2fj3Iawu+rCRMJ0Nz07mAteLx+ql7m7IioXh1tXNV/efMgb/xOXJ2QEtxMTT9rVQc4uO9ciidM=
X-Received: by 2002:a05:600c:474a:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a35ace28e0mr65815995e9.32.1792918866454;
        Sun, 25 Oct 2026 02:01:06 -0700 (PDT)
Received: from zheweiy-mac ([2a01:4b00:b60b:cb00:c67:3956:189c:b7c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm111588615e9.11.2026.10.25.02.01.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 02:01:06 -0700 (PDT)
From: Zhewei Yuan <yzwlhm@gmail.com>
To: netdev@vger.kernel.org
Cc: Zhewei Yuan <yzwlhm@gmail.com>,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net 2/2] tcp: Add KUnit tests for bind fastreuse caches
Date: Sun, 25 Oct 2026 09:00:48 +0000
Message-ID: <20261025090048.27870-3-yzwlhm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025090048.27870-1-yzwlhm@gmail.com>
References: <20261025090048.27870-1-yzwlhm@gmail.com>
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

Add eight KUnit cases using real TCP binds in isolated network namespaces.
Six check the tb/tb2 reuse caches for SO_REUSEADDR, SO_REUSEPORT and both,
with explicit or automatic ports. Two guard against reinitialization
when an owner or another address bucket already exists.

The six first-bind cases fail before the fix and all eight pass after
it, using matching tests/configs; both conflict guards pass before and
after.

Run with:

  ./tools/testing/kunit/kunit.py run --arch=x86_64 \
    --kunitconfig=net/ipv4/.kunitconfig --jobs=8 --timeout=120 \
    inet_csk_fastreuse

Codex assisted with test development and review, following requests for
real binds, cache inspection, automatic ports and conflict preservation.

Signed-off-by: Zhewei Yuan <yzwlhm@gmail.com>
---
 net/ipv4/.kunitconfig                |   8 +
 net/ipv4/Kconfig                     |  14 ++
 net/ipv4/Makefile                    |   1 +
 net/ipv4/inet_connection_sock_test.c | 303 +++++++++++++++++++++++++++
 4 files changed, 326 insertions(+)
 create mode 100644 net/ipv4/.kunitconfig
 create mode 100644 net/ipv4/inet_connection_sock_test.c

diff --git a/net/ipv4/.kunitconfig b/net/ipv4/.kunitconfig
new file mode 100644
index 00000000000..11ba2dd7bea
--- /dev/null
+++ b/net/ipv4/.kunitconfig
@@ -0,0 +1,8 @@
+CONFIG_KUNIT=y
+# CONFIG_KUNIT_ALL_TESTS is not set
+CONFIG_MULTIUSER=y
+CONFIG_NAMESPACES=y
+CONFIG_NET=y
+CONFIG_NET_NS=y
+CONFIG_INET=y
+CONFIG_INET_CONNECTION_SOCK_KUNIT_TEST=y
diff --git a/net/ipv4/Kconfig b/net/ipv4/Kconfig
index 3545fb0a045..913bf9a6f43 100644
--- a/net/ipv4/Kconfig
+++ b/net/ipv4/Kconfig
@@ -778,3 +778,17 @@ config TCP_MD5SIG
 	  on the Internet.
 
 	  If unsure, say N.
+
+config INET_CONNECTION_SOCK_KUNIT_TEST
+	bool "KUnit tests for INET connection sockets" if !KUNIT_ALL_TESTS
+	depends on INET && NET_NS && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  Test initialization and updates of the INET reuse caches through
+	  real TCP socket bind operations in isolated network namespaces.
+	  Exercise SO_REUSEADDR, SO_REUSEPORT and their combination, checking
+	  the fast reuse flags in both the port and address binding buckets.
+	  Cover both explicit and automatically allocated local ports.
+	  Verify that cache updates preserve conflicts with existing sockets.
+
+	  If unsure, say N.
diff --git a/net/ipv4/Makefile b/net/ipv4/Makefile
index 69e4baaed12..2194bf2a3a4 100644
--- a/net/ipv4/Makefile
+++ b/net/ipv4/Makefile
@@ -16,6 +16,7 @@ obj-y     := route.o inetpeer.o protocol.o \
 	     inet_fragment.o ping.o ip_tunnel_core.o gre_offload.o \
 	     metrics.o netlink.o nexthop.o udp_tunnel_stub.o
 
+obj-$(CONFIG_INET_CONNECTION_SOCK_KUNIT_TEST) += inet_connection_sock_test.o
 obj-$(CONFIG_NET_IP_TUNNEL) += ip_tunnel.o
 obj-$(CONFIG_SYSCTL) += sysctl_net_ipv4.o
 obj-$(CONFIG_PROC_FS) += proc.o
diff --git a/net/ipv4/inet_connection_sock_test.c b/net/ipv4/inet_connection_sock_test.c
new file mode 100644
index 00000000000..7b210859de6
--- /dev/null
+++ b/net/ipv4/inet_connection_sock_test.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <kunit/test.h>
+#include <linux/in.h>
+#include <linux/module.h>
+#include <linux/net.h>
+#include <linux/netdevice.h>
+#include <linux/rtnetlink.h>
+#include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/user_namespace.h>
+#include <net/inet_connection_sock.h>
+#include <net/inet_hashtables.h>
+#include <net/net_namespace.h>
+
+struct inet_csk_fastreuse_param {
+	const char *name;
+	bool reuseaddr;
+	bool reuseport;
+	u16 port;
+	int fastreuse;
+	int fastreuseport;
+};
+
+struct inet_csk_fastreuse_cache {
+	int tb_fastreuse;
+	int tb_fastreuseport;
+	int tb2_fastreuse;
+	int tb2_fastreuseport;
+};
+
+static const struct inet_csk_fastreuse_param inet_csk_fastreuse_params[] = {
+	{
+		.name = "reuseaddr_only",
+		.reuseaddr = true,
+		.reuseport = false,
+		.port = 40000,
+		.fastreuse = 1,
+		.fastreuseport = 0,
+	},
+	{
+		.name = "reuseport_only",
+		.reuseaddr = false,
+		.reuseport = true,
+		.port = 40000,
+		.fastreuse = 0,
+		.fastreuseport = FASTREUSEPORT_ANY,
+	},
+	{
+		.name = "reuseaddr_and_reuseport",
+		.reuseaddr = true,
+		.reuseport = true,
+		.port = 40000,
+		.fastreuse = 1,
+		.fastreuseport = FASTREUSEPORT_ANY,
+	},
+	{
+		.name = "reuseaddr_only_port_zero",
+		.reuseaddr = true,
+		.reuseport = false,
+		.port = 0,
+		.fastreuse = 1,
+		.fastreuseport = 0,
+	},
+	{
+		.name = "reuseport_only_port_zero",
+		.reuseaddr = false,
+		.reuseport = true,
+		.port = 0,
+		.fastreuse = 0,
+		.fastreuseport = FASTREUSEPORT_ANY,
+	},
+	{
+		.name = "reuseaddr_and_reuseport_port_zero",
+		.reuseaddr = true,
+		.reuseport = true,
+		.port = 0,
+		.fastreuse = 1,
+		.fastreuseport = FASTREUSEPORT_ANY,
+	},
+};
+
+static void
+inet_csk_fastreuse_get_desc(const struct inet_csk_fastreuse_param *param,
+			    char *desc)
+{
+	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(inet_csk_fastreuse, inet_csk_fastreuse_params,
+		  inet_csk_fastreuse_get_desc);
+
+static void inet_csk_test_put_net(void *data)
+{
+	put_net(data);
+}
+
+static void inet_csk_test_release_socket(void *data)
+{
+	sock_release(data);
+}
+
+static struct net *inet_csk_test_create_net(struct kunit *test)
+{
+	struct net *net;
+	int ret;
+
+	net = copy_net_ns(CLONE_NEWNET, &init_user_ns, &init_net);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, net);
+
+	ret = kunit_add_action_or_reset(test, inet_csk_test_put_net, net);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	return net;
+}
+
+static struct socket *
+inet_csk_test_create_socket(struct kunit *test, struct net *net)
+{
+	struct socket *sock;
+	int ret;
+
+	ret = sock_create_kern(net, AF_INET, SOCK_STREAM, IPPROTO_TCP, &sock);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* Close all sockets before the namespace cleanup action runs. */
+	ret = kunit_add_action_or_reset(test, inet_csk_test_release_socket,
+					sock);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	return sock;
+}
+
+static int inet_csk_test_bind(struct socket *sock, u32 address, u16 port)
+{
+	struct sockaddr_in addr = {
+		.sin_family = AF_INET,
+		.sin_addr.s_addr = htonl(address),
+		.sin_port = htons(port),
+	};
+
+	return kernel_bind(sock, (struct sockaddr_unsized *)&addr, sizeof(addr));
+}
+
+static struct inet_csk_fastreuse_cache
+inet_csk_test_read_cache(struct kunit *test, struct sock *sk)
+{
+	struct inet_bind_hashbucket *head, *head2;
+	struct inet_csk_fastreuse_cache cache;
+	struct inet_bind2_bucket *tb2;
+	struct inet_bind_bucket *tb;
+	struct inet_hashinfo *hinfo;
+	struct net *net = sock_net(sk);
+
+	tb = inet_csk(sk)->icsk_bind_hash;
+	tb2 = inet_csk(sk)->icsk_bind2_hash;
+	KUNIT_ASSERT_NOT_NULL(test, tb);
+	KUNIT_ASSERT_NOT_NULL(test, tb2);
+
+	hinfo = tcp_get_hashinfo(sk);
+	head = &hinfo->bhash[inet_bhashfn(net, inet_sk(sk)->inet_num,
+					  hinfo->bhash_size)];
+	head2 = inet_bhashfn_portaddr(hinfo, sk, net, inet_sk(sk)->inet_num);
+	spin_lock_bh(&head->lock);
+	spin_lock(&head2->lock);
+	cache.tb_fastreuse = tb->fastreuse;
+	cache.tb_fastreuseport = tb->fastreuseport;
+	cache.tb2_fastreuse = tb2->fastreuse;
+	cache.tb2_fastreuseport = tb2->fastreuseport;
+	spin_unlock(&head2->lock);
+	spin_unlock_bh(&head->lock);
+
+	return cache;
+}
+
+static void inet_csk_fastreuse_first_bind(struct kunit *test)
+{
+	const struct inet_csk_fastreuse_param *param = test->param_value;
+	struct inet_csk_fastreuse_cache cache;
+	struct sockaddr_in bound = {};
+	struct socket *sock;
+	struct net *net;
+	int ret;
+
+	net = inet_csk_test_create_net(test);
+	sock = inet_csk_test_create_socket(test, net);
+	if (param->reuseaddr)
+		sock_set_reuseaddr(sock->sk);
+	if (param->reuseport)
+		sock_set_reuseport(sock->sk);
+
+	ret = inet_csk_test_bind(sock, INADDR_ANY, param->port);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kernel_getsockname(sock, (struct sockaddr *)&bound);
+	KUNIT_ASSERT_EQ(test, ret, (int)sizeof(bound));
+	if (param->port)
+		KUNIT_EXPECT_EQ(test, ntohs(bound.sin_port), param->port);
+	else
+		KUNIT_EXPECT_NE(test, ntohs(bound.sin_port), 0);
+
+	cache = inet_csk_test_read_cache(test, sock->sk);
+	KUNIT_EXPECT_EQ(test, cache.tb_fastreuse, param->fastreuse);
+	KUNIT_EXPECT_EQ(test, cache.tb_fastreuseport, param->fastreuseport);
+	KUNIT_EXPECT_EQ(test, cache.tb2_fastreuse, param->fastreuse);
+	KUNIT_EXPECT_EQ(test, cache.tb2_fastreuseport, param->fastreuseport);
+}
+
+static void inet_csk_fastreuse_existing_owner(struct kunit *test)
+{
+	struct inet_csk_fastreuse_cache cache;
+	struct socket *sock_a, *sock_b, *sock_c;
+	struct net *net;
+	int ret;
+
+	net = inet_csk_test_create_net(test);
+	sock_a = inet_csk_test_create_socket(test, net);
+	sock_set_reuseport(sock_a->sk);
+	ret = inet_csk_test_bind(sock_a, INADDR_ANY, 40000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sock_b = inet_csk_test_create_socket(test, net);
+	sock_set_reuseaddr(sock_b->sk);
+	sock_set_reuseport(sock_b->sk);
+	ret = inet_csk_test_bind(sock_b, INADDR_ANY, 40000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_PTR_EQ(test, inet_csk(sock_a->sk)->icsk_bind_hash,
+			    inet_csk(sock_b->sk)->icsk_bind_hash);
+	KUNIT_ASSERT_PTR_EQ(test, inet_csk(sock_a->sk)->icsk_bind2_hash,
+			    inet_csk(sock_b->sk)->icsk_bind2_hash);
+
+	/* The sole address bucket already owns A, which has no SO_REUSEADDR. */
+	cache = inet_csk_test_read_cache(test, sock_b->sk);
+	KUNIT_EXPECT_EQ(test, cache.tb_fastreuse, 0);
+	KUNIT_EXPECT_EQ(test, cache.tb2_fastreuse, 0);
+
+	/* An incorrect reset to fastreuse=1 would bypass the conflict with A. */
+	sock_c = inet_csk_test_create_socket(test, net);
+	sock_set_reuseaddr(sock_c->sk);
+	ret = inet_csk_test_bind(sock_c, INADDR_ANY, 40000);
+	KUNIT_EXPECT_EQ(test, ret, -EADDRINUSE);
+}
+
+static void inet_csk_fastreuse_new_address(struct kunit *test)
+{
+	struct inet_csk_fastreuse_cache cache;
+	struct socket *sock_a, *sock_b, *sock_c;
+	struct net *net;
+	int ret;
+
+	net = inet_csk_test_create_net(test);
+	/* Make both 127.0.0.1 and 127.0.0.2 local to this test namespace. */
+	rtnl_lock();
+	ret = dev_open(net->loopback_dev, NULL);
+	rtnl_unlock();
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sock_a = inet_csk_test_create_socket(test, net);
+	ret = inet_csk_test_bind(sock_a, INADDR_LOOPBACK, 40000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	sock_b = inet_csk_test_create_socket(test, net);
+	sock_set_reuseport(sock_b->sk);
+	ret = inet_csk_test_bind(sock_b, INADDR_LOOPBACK + 1, 40000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_ASSERT_PTR_EQ(test, inet_csk(sock_a->sk)->icsk_bind_hash,
+			    inet_csk(sock_b->sk)->icsk_bind_hash);
+	KUNIT_ASSERT_PTR_NE(test, inet_csk(sock_a->sk)->icsk_bind2_hash,
+			    inet_csk(sock_b->sk)->icsk_bind2_hash);
+
+	/* B creates an empty address bucket, but A still owns the port. */
+	cache = inet_csk_test_read_cache(test, sock_b->sk);
+	KUNIT_EXPECT_EQ(test, cache.tb_fastreuse, 0);
+	KUNIT_EXPECT_EQ(test, cache.tb_fastreuseport, FASTREUSEPORT_STRICT);
+	KUNIT_EXPECT_EQ(test, cache.tb2_fastreuse, 0);
+	KUNIT_EXPECT_EQ(test, cache.tb2_fastreuseport, FASTREUSEPORT_STRICT);
+
+	/* ANY would wrongly admit C despite A not having SO_REUSEPORT. */
+	sock_c = inet_csk_test_create_socket(test, net);
+	sock_set_reuseport(sock_c->sk);
+	ret = inet_csk_test_bind(sock_c, INADDR_LOOPBACK, 40000);
+	KUNIT_EXPECT_EQ(test, ret, -EADDRINUSE);
+}
+
+static struct kunit_case inet_csk_fastreuse_cases[] = {
+	KUNIT_CASE_PARAM(inet_csk_fastreuse_first_bind,
+			 inet_csk_fastreuse_gen_params),
+	KUNIT_CASE(inet_csk_fastreuse_existing_owner),
+	KUNIT_CASE(inet_csk_fastreuse_new_address),
+	{}
+};
+
+static struct kunit_suite inet_csk_fastreuse_suite = {
+	.name = "inet_csk_fastreuse",
+	.test_cases = inet_csk_fastreuse_cases,
+};
+
+kunit_test_suite(inet_csk_fastreuse_suite);
+
+MODULE_DESCRIPTION("KUnit tests for INET bind reuse caching");
+MODULE_LICENSE("GPL");
-- 
2.52.0

