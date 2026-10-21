Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792547762;
	b=glqsqY8uiz2lZndGxElf/98pvvencjTHpa2qnB7DbxUMVvEC7FJ81UTZzaSU2k9OlaF5
	 SkqYRmN1mFp35aDs4KFgaJ4KDVoQ9jNKxyoNkzhnPn6+qbWN7h4CTJVjXmAhDJaj0x/Gd
	 4SIaHM+9ckzQ068mxicBJe5rc+4QvPx7pCueh3eglDcaTibJx4w3vbOdfnP3B6YAItcAL
	 UJA9XOf1Nyw+HmAfjdqePO9twegufbNFmWXXQ5IGlDekh4J3SJLqlE7PowBb3cCmu5vMI
	 nxSJz9AN1P9XOyxdE4e9cu2zFi7VHmyWgTt7eXyHqBXNCmnuLLcneRAjxjWVnd1rYLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792547762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4E5HtdtgSOGZPG7fuIdETv1wY4X2gigKvJzRjHwHsBg=;
	b=pJdhwDIUVISRrI9kNooSQ3yhWFxQOwRCJ8Xfa3DHsT3HlMjZ5jmvnEwBd7nych6FsAF+
	 1/1ZYW7bVVm7Nc+mitgheUkXd3shipQdpa0i85TzQ25bP7SbkmX9nJrQtjahfdgD+Yc/S
	 WPGpAIhQ0iC5tEk44wyEIX4IIx3hPd8Yw5do4b/c65lR0xt+dD6uK5Pa50GFjEr79YkUV
	 EtvdyDoeevi8EzO2FuO6Q2j/OD4Vz7tVrkTrvddbuMMD2Pr0+NXTu2gPCb8NS0yNuvAG7
	 8rtRItHGhnY6MY9uXKcqFNqt+9DI7vHxN9LBCwsNftBTY1ibb4iA8nau10EiwscoYng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JbkV1ko0;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1C0606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JbkV1ko0
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so978237eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792547761; x=1793152561; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4E5HtdtgSOGZPG7fuIdETv1wY4X2gigKvJzRjHwHsBg=;
        b=JbkV1ko0FrcP258isdDlk2hoZlL387epD69fG7nbCsqP9LXBR2iG0w6M/03eWC+TEC
         qIwQs1rAqBdvcHZrVfE6osvOoYyvPQ4Nb1MxdCe9OGV4nyeBPENJK04xN1vKjmD/Cj4H
         mrOHrfUbfKFpAzwdnjvX2B83iaFjPR4QJhb3pREjHzfgxXC4Manf6eAQZeaEUa7dyYOu
         PkuGOyEycj7YS0wPK7bYVqutJTQOqEcbS9z/8XXz8xt5Hf3UhviuL4q+154oz5u1hamg
         2NHeDaSIGfePJHoHa+M0ANBefbG32pas1dSgFOM153bzoYvnsJXnj+OcfXjE1S27BhAw
         csJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792547761; x=1793152561;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4E5HtdtgSOGZPG7fuIdETv1wY4X2gigKvJzRjHwHsBg=;
        b=yb18GHGDc8g3ez8dxDgVswFVOG9z1ZSyTtF463Bod/tgaYa01DUMx/9uSigdzOJlIb
         lk4esKbTUZwOfbc2A63EQ/9IFx/KMj50rJuCIsOajLWsA9IFlhISDrqMuP5vC0yhZKgl
         bI2mJlJ4hdY+ggqkOPAbnkfGHJWLssoCtITnXlQGJBAffOlXDtXyVCq7xdxwhjhDCXiN
         c/CBJ930oucr4NlSfEfCeYt5XKUurBXdHD3fnDXsqlnJa3GtkDZqxT1O54cla4I6mqJa
         5zQVuQ+n+DQhrv5Nou2ufFFWtGNcleyVgvG8WXA4KJ60CsPAHJDF3iZSgpeuYeYcluEw
         hP2A==
X-Forwarded-Encrypted: i=1; AKwUvBwt1Hg80sODyv48zrd4tz2Sbc0R5SO03XOpzcXZ5E9LK2WdWX6l7oF7dO+beCh5QcMsMKowSkKXAHu7g50=@vger.kernel.org
X-Gm-Message-State: AFq9FYICgz0XXrMISaXMOG4B5bHQ9iyd4hCz6zqUK5KanR30NHZbhwpu
	i1jBq4pfb9ZRIe1GOnsjr2NJSWxzqG2tCkvVnIN6arIE4P3kLFH9fF6ZHrlBYW5TWPuWwapvi8x
	VL6dPtlO5yo6mDP4vAAfn2rR4Cg==
X-Received: from dlan21-n2.prod.google.com ([2002:a05:7022:eb55:20b0:189:49c0:62ba])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2309:b0:14d:baf5:c415 with SMTP id a92af1059eb24-190a465d2f5mr1170325c88.7.1792547760229;
 Tue, 20 Oct 2026 18:56:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 01:55:57 +0000
In-Reply-To: <20261021015558.4124825-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021015558.4124825-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021015558.4124825-2-almasrymina@google.com>
Subject: [PATCH net-next v1 1/2] netmem: rename get/put_net_iov() to net_iov_inc/dec_ref()
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Ralf Lici <ralf@mandelbit.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Pavel Begunkov <asml.silence@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Willem de Bruijn <willemb@google.com>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

Follow the object_action() naming convention for net_iov non-page_pool
reference helpers by renaming get_net_iov() and put_net_iov() to
net_iov_inc_ref() and net_iov_dec_ref(), and renaming
net_devmem_get_net_iov() and net_devmem_put_net_iov() to
net_devmem_net_iov_inc_ref() and net_devmem_net_iov_dec_ref().

Use *_inc_ref() and *_dec_ref() rather than *_ref() and *_unref() to
pair symmetrically with netmem_inc_ref() and netmem_dec_ref() (since
netmem_ref is already the typedef for the generic network memory
handle).

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/net/netmem.h | 12 ++++++------
 net/core/devmem.c    |  4 ++--
 net/core/devmem.h    | 10 +++++-----
 net/core/net_test.c  | 12 ++++++------
 net/core/skbuff.c    | 20 ++++++++++----------
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/include/net/netmem.h b/include/net/netmem.h
index 193de0d21490f..7f36c734edcd9 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -409,21 +409,21 @@ static inline bool net_is_devmem_iov(const struct net_iov *niov)
 }
 #endif
 
-void get_net_iov(struct net_iov *niov);
-void put_net_iov(struct net_iov *niov);
+void net_iov_inc_ref(struct net_iov *niov);
+void net_iov_dec_ref(struct net_iov *niov);
 
 /**
  * get_netmem - acquire a non-page_pool reference on a netmem
  * @netmem: netmem to reference
  *
  * Acquires a non-pp backing reference (page._refcount via get_page() or
- * binding->ref via get_net_iov()) regardless of page_pool membership.
+ * binding->ref via net_iov_inc_ref()) regardless of page_pool membership.
  * Counterpart to put_netmem().
  */
 static __always_inline void get_netmem(netmem_ref netmem)
 {
 	if (netmem_is_net_iov(netmem))
-		get_net_iov(netmem_to_net_iov(netmem));
+		net_iov_inc_ref(netmem_to_net_iov(netmem));
 	else
 		get_page(netmem_to_page(netmem));
 }
@@ -433,13 +433,13 @@ static __always_inline void get_netmem(netmem_ref netmem)
  * @netmem: netmem to unreference
  *
  * Drops a non-pp backing reference (page._refcount via put_page() or
- * binding->ref via put_net_iov()) regardless of page_pool membership.
+ * binding->ref via net_iov_dec_ref()) regardless of page_pool membership.
  * Counterpart to get_netmem().
  */
 static __always_inline void put_netmem(netmem_ref netmem)
 {
 	if (netmem_is_net_iov(netmem))
-		put_net_iov(netmem_to_net_iov(netmem));
+		net_iov_dec_ref(netmem_to_net_iov(netmem));
 	else
 		put_page(netmem_to_page(netmem));
 }
diff --git a/net/core/devmem.c b/net/core/devmem.c
index fd1b727445644..32fafbfa1359e 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -387,12 +387,12 @@ struct net_devmem_dmabuf_binding *net_devmem_lookup_dmabuf(u32 id)
 	return binding;
 }
 
-void net_devmem_get_net_iov(struct net_iov *niov)
+void net_devmem_net_iov_inc_ref(struct net_iov *niov)
 {
 	net_devmem_dmabuf_binding_get(net_devmem_iov_binding(niov));
 }
 
-void net_devmem_put_net_iov(struct net_iov *niov)
+void net_devmem_net_iov_dec_ref(struct net_iov *niov)
 {
 	net_devmem_dmabuf_binding_put(net_devmem_iov_binding(niov));
 }
diff --git a/net/core/devmem.h b/net/core/devmem.h
index ad24bca20618b..8fa089776610a 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -43,7 +43,7 @@ struct net_devmem_dmabuf_binding {
 	 * those refs are dropped and the binding is no longer desired or in
 	 * use.
 	 *
-	 * net_devmem_get_net_iov() on dmabuf net_iovs will increment this
+	 * net_devmem_net_iov_inc_ref() on dmabuf net_iovs will increment this
 	 * reference, making sure that the binding remains alive until all the
 	 * net_iovs are no longer used. net_iovs allocated from this binding
 	 * that are stuck in the TX path for any reason (such as awaiting
@@ -131,8 +131,8 @@ net_devmem_dmabuf_binding_put(struct net_devmem_dmabuf_binding *binding)
 	percpu_ref_put(&binding->ref);
 }
 
-void net_devmem_get_net_iov(struct net_iov *niov);
-void net_devmem_put_net_iov(struct net_iov *niov);
+void net_devmem_net_iov_inc_ref(struct net_iov *niov);
+void net_devmem_net_iov_dec_ref(struct net_iov *niov);
 
 void net_devmem_free_dmabuf(struct net_iov *ppiov);
 
@@ -151,11 +151,11 @@ net_devmem_dmabuf_binding_put(struct net_devmem_dmabuf_binding *binding)
 {
 }
 
-static inline void net_devmem_get_net_iov(struct net_iov *niov)
+static inline void net_devmem_net_iov_inc_ref(struct net_iov *niov)
 {
 }
 
-static inline void net_devmem_put_net_iov(struct net_iov *niov)
+static inline void net_devmem_net_iov_dec_ref(struct net_iov *niov)
 {
 }
 
diff --git a/net/core/net_test.c b/net/core/net_test.c
index cebd83e596d07..6fdab6a55b4d5 100644
--- a/net/core/net_test.c
+++ b/net/core/net_test.c
@@ -861,11 +861,11 @@ static void netmem_ref_test_net_iov(struct kunit *test)
 	netmem = net_iov_to_netmem(&niov);
 	base_ref = atomic_long_read(&binding.ref.data->count);
 
-	/* Non-PP net_iov: get/put_net_iov & get/put_netmem */
-	get_net_iov(&niov);
+	/* Non-PP net_iov: net_iov_inc/dec_ref & get/put_netmem */
+	net_iov_inc_ref(&niov);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
 			base_ref + 1);
-	put_net_iov(&niov);
+	net_iov_dec_ref(&niov);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
 			base_ref);
 
@@ -886,12 +886,12 @@ static void netmem_ref_test_net_iov(struct kunit *test)
 	netmem_or_pp_magic(netmem, PP_SIGNATURE);
 	atomic_long_set(&niov.desc.pp_ref_count, 2);
 
-	/* Layer 0 & 1: get_net_iov / get_netmem grab non-pp ref even on PP */
-	get_net_iov(&niov);
+	/* Layer 0 & 1: net_iov_inc_ref / get_netmem grab non-pp ref on PP */
+	net_iov_inc_ref(&niov);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
 			base_ref + 1);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&niov.desc.pp_ref_count), 2L);
-	put_net_iov(&niov);
+	net_iov_dec_ref(&niov);
 	KUNIT_EXPECT_EQ(test, atomic_long_read(&binding.ref.data->count),
 			base_ref);
 
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b79d8b702a0b1..a0f2d930ebf5f 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7643,38 +7643,38 @@ bool csum_and_copy_from_iter_full(void *addr, size_t bytes,
 EXPORT_SYMBOL(csum_and_copy_from_iter_full);
 
 /**
- * get_net_iov - acquire a non-page_pool reference on a net_iov
+ * net_iov_inc_ref - acquire a non-page_pool reference on a net_iov
  * @niov: net_iov to reference
  *
  * Acquires a non-pp backing reference (binding->ref) on @niov regardless of
  * page_pool membership, warning if @niov does not support non-pp references.
- * Counterpart to put_net_iov().
+ * Counterpart to net_iov_dec_ref().
  */
-void get_net_iov(struct net_iov *niov)
+void net_iov_inc_ref(struct net_iov *niov)
 {
 	if (net_is_devmem_iov(niov))
-		net_devmem_get_net_iov(niov);
+		net_devmem_net_iov_inc_ref(niov);
 	else
 		DEBUG_NET_WARN_ON_ONCE(true);
 }
-EXPORT_SYMBOL(get_net_iov);
+EXPORT_SYMBOL(net_iov_inc_ref);
 
 /**
- * put_net_iov - release a non-page_pool reference on a net_iov
+ * net_iov_dec_ref - release a non-page_pool reference on a net_iov
  * @niov: net_iov to unreference
  *
  * Drops a non-pp backing reference (binding->ref) on @niov regardless of
  * page_pool membership, warning if @niov does not support non-pp references.
- * Counterpart to get_net_iov().
+ * Counterpart to net_iov_inc_ref().
  */
-void put_net_iov(struct net_iov *niov)
+void net_iov_dec_ref(struct net_iov *niov)
 {
 	if (net_is_devmem_iov(niov))
-		net_devmem_put_net_iov(niov);
+		net_devmem_net_iov_dec_ref(niov);
 	else
 		DEBUG_NET_WARN_ON_ONCE(true);
 }
-EXPORT_SYMBOL(put_net_iov);
+EXPORT_SYMBOL(net_iov_dec_ref);
 
 struct vlan_type_depth __vlan_get_protocol_offset(const struct sk_buff *skb,
 						  __be16 type,
-- 
2.56.0.212.g129ede20d9-goog

