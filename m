Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316834;
	b=B0BJiZc+Yhdxjj1/hpcpdbybA/tjN7mmwLXg/83IG6mepQ8GOjVCJcIVZ4qUIURS3Zsm
	 zOpv7cWdp99EYD5Q/scfBfaaXmCjw+9BAraBGKgn6mgotz4Bc+x2vl9hWw9SDMpOzO9ke
	 YuOUiIW9s/pS/j0DT1M4BspVMd8eJW7q7TvbFknCin1L3U7YWVibLnd3aoVrCIplVwnG9
	 gvSsynj+9vNlnSLB6wib7JtEhzcrPEYYkusCt9vod9ZygqERQvxE0w9426GONMEJieVZv
	 UNEuz5x5cK8z2j5qkNURmkA36YVlDy6ShAp5KUf9yWS9uirsgEsiPERig9TI7jj8irA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316834;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jmGjkKcjSqmOdXkFwVhu/ZUdaZzfH+DaKIptD+Gmy0Y=;
	b=kISITG0rjX4Mj8+n41QfUZpr78l3W4RXgdnhk0g/QhG0IT56/1F0yN2PeVzj+O4B/JqA
	 1nmMS40GhvyN9yV5FWtrxieS5J93po35dsFbAmBGJRbG32IExWGAu7P1vlfFo0jHr0wXA
	 t4e9T6kX25B+5KIDUbuuHVXkxCoQ2zWegE1bkKM+/mp+X/PlmHnxabUQtpoSmuWuHE9XV
	 dq7iNykOOtmJh1PUWXb6yrinKsSDzxUh/fdDvJDI4nHnMXki16eZ5T22cPfW2HXJ1z+Sn
	 jIJbMC3yhjL5OJVaWiJZrDn8iFEsutNuoPloqi8g3w5k0RTc3ZQ2L4mbcxvVAP6PPaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bbhwH7gd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lYSrv6pH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D6860A6F4C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D6860A6F4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bbhwH7gd;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lYSrv6pH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794316832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmGjkKcjSqmOdXkFwVhu/ZUdaZzfH+DaKIptD+Gmy0Y=;
	b=bbhwH7gdKF50S4ykDldCd44NDCOIYdcE5BV3qh1UFP7gP29K8T13JGmEsXAO3pP1yjtsr1
	/6TNJbwE3AVjhbG9l0SGXHTh0Mghsp4XRwT+H+M2Kcc3pNrpl8stbMUUYhNUfSpAbKPS+j
	fCiOjYyoLX0AaMvfs0zyNDTZV9G1Wew=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-KmvvEOHwMAykOXtz702Cxw-1; Tue, 10 Nov 2026 08:20:30 -0500
X-MC-Unique: KmvvEOHwMAykOXtz702Cxw-1
X-Mimecast-MFC-AGG-ID: KmvvEOHwMAykOXtz702Cxw_1794316829
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c504b52eed3so84391866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794316829; x=1794921629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmGjkKcjSqmOdXkFwVhu/ZUdaZzfH+DaKIptD+Gmy0Y=;
        b=lYSrv6pHwB1qZHkVvDiuhxA+58vaRWORWjwefkcnxPYtBXttcqLae7ls2ilN18GtyK
         HMFry42KotdWge+rbCX5W3iLONdA7Yk+W81aQAH/rTyIbK2D9Xrp4pmUzSNZZLPdfS0w
         kgcdZ/1j9xKfJnlXTF4Iv/u8FX+PExzsl+u+wIcKxrOIUygUPCKFXt/koZOjii0GkVej
         F7MbyornURD+GgM/OMz8/nAYf4b6OYDNXe5FqJkywCgTjZDMiSdmFlgXhMQin8hrNMi5
         QvCMZ9Q48MZy+xNWBTjs7DqKd+3o5OHHbpUJkWXd1SqIsIcO7CJy0edg5tPjBMXe+/zx
         ko4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316829; x=1794921629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmGjkKcjSqmOdXkFwVhu/ZUdaZzfH+DaKIptD+Gmy0Y=;
        b=2DTYJuuwr0SkfCaSCDe7TfwRP39P3HtMNUcBxBoHgD4IMREXraIP2XV4vkxN268nOi
         IMhvGxQIXO/Jiwt93P+UwH9mcMJZjbHzC02TxgcMbNlezGkQ745ttL/15P+bF1EkWlSN
         BopvD4JzSqu3QD1JoYw1MD4PyF3l0rLRxGWIfzd+OXBB4RMBTfXloWI7mIaZDegcgl3l
         D01RfHansrc0WBjMaew4sSjJyjxOfSSz7e86H64SYsyUh/e9M8exLfZOzeaIdomQnkrx
         OZcaLsnaUaXCSTYmmcfhaQlI+RReXkXvD7kpwLtIhT0z5AYGHUC8AYzo1zbCN5wh2sHQ
         0oyA==
X-Forwarded-Encrypted: i=1; AL+hErFil4dUsKJSb3zbPcOktBOL7lIYTQZqrH6PR9tIXIR8brtjsLH3fTXw7N5zexbmnnRjC3wlvQhgyJIDICg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U8OELAXF2/a273ZJMEKJgi13kNvAhOqRoDvDQvb5OwColgLp9
	hiyF2o0Zy3KllT3RWQnlcy6Ch0nBeiLcrMgHyxlL4+qPxDzf1vPrXreqmt4tIw+tE1N/cp9iT86
	+Zetjv5SMhI/3Tff2oIv7V6oWvWqWhEfRtVqyBOmno6e3rrsFe1R0iKr7ol0utvJWCg==
X-Gm-Gg: AYBFou2bH3QJpcYh73ewHn/W3uw8qFmsy0bW09MulAQSJMKN3DAnCabdDnSLlVxFk+a
	01xUUNdzx8nlCydVkJ8eZXxDpK7keUHr9z0ceoQPqgbNMNYfAm8lA/bPM7MnEbblfkxFAXt4AS4
	MLwy+PcaksfP0MnnSTx4xK/Yjq0vs66OUazn2U7fcbC2dJC4CSK5iQ4a/MOWUSxUxdggoR9Phj0
	B1Rx6WloxoisT9aRkZUESk6A4zayTqJu56IPMqmqDGXr0U+dBJ43RAlMje36pTy0IPbdCpBbQ0+
	hRLSYs34vrKEJ2znXf+gypVS0uJQXs8okG3UZ+NygDzL8jalbqDLrGfip/pdUj/6Cs5Zw8vUODa
	4S3qq9AriEmA6umHqfcSmhFd/+TZWXoUv1LqBW48pcYzheWz2S4BbZrsaazTzo/1z5bh7LWofH8
	AeLN1lfnJT/Mwj+zhthuBs19Ku4XKBQzsQIMtzSQTabFj5mGnDFXEzfNPNyJb6TCrUIXt7hJzp0
	3o7GCnx5vrmONQP+cLpC2VC/7b16RdmQbHBrkpHWdMGPIujFVOE
X-Received: by 2002:a17:906:c150:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c50491bd3b6mr211044566b.2.1794316828730;
        Tue, 10 Nov 2026 05:20:28 -0800 (PST)
X-Received: by 2002:a17:906:c150:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c50491bd3b6mr211040266b.2.1794316828268;
        Tue, 10 Nov 2026 05:20:28 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5d54bbsm107791166b.48.2026.11.10.05.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:20:27 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	io-uring@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 12/12] io_uring/opaque: add basic KUnit tests
Date: Tue, 10 Nov 2026 13:20:06 +0000
Message-Id: <20261110132006.3280986-13-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110132006.3280986-1-amarkuze@redhat.com>
References: <20261110132006.3280986-1-amarkuze@redhat.com>
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

Check receive-budget admission and watermark transitions, then build a
page-backed immutable version and check its vector, payload, held version
reference and final backing/reference release.

Use existing internal helpers without adding production test hooks. These
are basic helper checks; the matching liburing example exercises a real
ring and loopback TCP connection.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 io_uring/Kconfig       |  10 ++++
 io_uring/Makefile      |   1 +
 io_uring/opaque_test.c | 128 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 io_uring/opaque_test.c

diff --git a/io_uring/Kconfig b/io_uring/Kconfig
index 5b696cf266f6..db6e3c5a317d 100644
--- a/io_uring/Kconfig
+++ b/io_uring/Kconfig
@@ -30,3 +30,13 @@ config IO_URING_BPF_OPS
 	def_bool y
 	depends on IO_URING
 	depends on BPF_SYSCALL && BPF_JIT && DEBUG_INFO_BTF
+
+config IO_URING_OPAQUE_OBJ_KUNIT_TEST
+	bool "KUnit smoke tests for opaque objects" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y && IO_URING_OPAQUE_OBJ
+	default KUNIT_ALL_TESTS
+	help
+	  Check receive-budget admission and watermark transitions, and the
+	  vector representation and reference lifetime of an immutable version.
+	  The tests call internal helpers without a userspace ring or TCP socket.
+	  They are a small smoke test, not a pressure or concurrency suite.
diff --git a/io_uring/Makefile b/io_uring/Makefile
index 912b1861c0a5..b7fcc2d3c714 100644
--- a/io_uring/Makefile
+++ b/io_uring/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_IO_URING)		+= io_uring.o opdef.o kbuf.o rsrc.o notif.o \
 
 obj-$(CONFIG_IO_URING_ZCRX)	+= zcrx.o
 obj-$(CONFIG_IO_URING_OPAQUE_OBJ)	+= opaque.o opaque_register.o opaque_compact.o
+obj-$(CONFIG_IO_URING_OPAQUE_OBJ_KUNIT_TEST) += opaque_test.o
 obj-$(CONFIG_IO_WQ)		+= io-wq.o
 obj-$(CONFIG_FUTEX)		+= futex.o
 obj-$(CONFIG_EPOLL)		+= epoll.o
diff --git a/io_uring/opaque_test.c b/io_uring/opaque_test.c
new file mode 100644
index 000000000000..cba5829de05f
--- /dev/null
+++ b/io_uring/opaque_test.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <kunit/test.h>
+#include <linux/highmem.h>
+
+#include "opaque_internal.h"
+
+struct opaque_basic {
+	struct io_opaque_store *store;
+	struct io_opaque_data *data;
+	struct page *page;
+};
+
+static void opaque_basic_release(void *arg)
+{
+	struct opaque_basic *c = arg;
+
+	if (!IS_ERR_OR_NULL(c->store)) {
+		io_opaque_data_put(c->store, c->data);
+		/* Also release a budget assertion's unfinished reservation. */
+		if (atomic64_read(&c->store->bytes) > 0)
+			io_opaque_uncharge(c->store, atomic64_read(&c->store->bytes));
+		io_opaque_free(c->store);
+	}
+	if (c->page)
+		put_page(c->page);
+}
+
+static struct opaque_basic *opaque_basic_new(struct kunit *test)
+{
+	struct io_uring_opaque_config config = {
+		.hard_limit = 8 * PAGE_SIZE,
+		.compact_headroom = 2 * PAGE_SIZE,
+		.reply_reserve = PAGE_SIZE,
+		.high_watermark = 4 * PAGE_SIZE,
+		.low_watermark = 2 * PAGE_SIZE,
+		.max_object_size = PAGE_SIZE,
+		.max_objects = 4,
+		.max_streams = 1,
+		.max_extents = 8,
+	};
+	struct opaque_basic *c = kunit_kzalloc(test, sizeof(*c), GFP_KERNEL);
+	struct io_ring_ctx *ctx;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test, opaque_basic_release, c), 0);
+	/* No user/mm accounting in this internal-helper fixture. */
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+	c->store = io_opaque_alloc(ctx, &config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, c->store);
+	return c;
+}
+
+static void opaque_basic_budget(struct kunit *test)
+{
+	struct opaque_basic *c = opaque_basic_new(test);
+	struct io_opaque_store *store = c->store;
+
+	KUNIT_ASSERT_TRUE(test, io_opaque_charge(store, 3 * PAGE_SIZE, true));
+	KUNIT_EXPECT_EQ(test, io_opaque_memory_mode(store), IORING_OPAQUE_MEMORY_NORMAL);
+	KUNIT_ASSERT_TRUE(test, io_opaque_charge(store, PAGE_SIZE, true));
+	KUNIT_EXPECT_EQ(test, io_opaque_memory_mode(store), IORING_OPAQUE_MEMORY_LOWMEM);
+	KUNIT_EXPECT_FALSE(test, io_opaque_charge(store, 2 * PAGE_SIZE, true));
+	KUNIT_EXPECT_EQ(test, atomic64_read(&store->bytes), (s64)(4 * PAGE_SIZE));
+	io_opaque_uncharge(store, 2 * PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, io_opaque_memory_mode(store), IORING_OPAQUE_MEMORY_NORMAL);
+	io_opaque_uncharge(store, 2 * PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, atomic64_read(&store->bytes), 0LL);
+}
+
+static void opaque_basic_version(struct kunit *test)
+{
+	static const char payload[] = "opaque";
+	struct opaque_basic *c = opaque_basic_new(test);
+	struct io_opaque_extent *extent;
+	void *mapped;
+
+	c->data = io_opaque_data_alloc();
+	KUNIT_ASSERT_NOT_NULL(test, c->data);
+	c->page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	KUNIT_ASSERT_NOT_NULL(test, c->page);
+	mapped = kmap_local_page(c->page);
+	memcpy(mapped + 17, payload, sizeof(payload));
+	kunmap_local(mapped);
+	get_page(c->page);
+	extent = io_opaque_extent_new(c->store, c->page, 17, sizeof(payload), 0, false);
+	if (IS_ERR(extent))
+		put_page(c->page);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, extent);
+	list_add_tail(&extent->list, &c->data->extents);
+	c->data->length = sizeof(payload);
+	KUNIT_ASSERT_EQ(test, io_opaque_vector(c->data), 0);
+	KUNIT_ASSERT_EQ(test, c->data->nr, 1U);
+	KUNIT_EXPECT_PTR_EQ(test, c->data->bvec[0].bv_page, c->page);
+	KUNIT_EXPECT_EQ(test, c->data->bvec[0].bv_offset, 17U);
+	KUNIT_EXPECT_EQ(test, c->data->bvec[0].bv_len, (unsigned int)sizeof(payload));
+	KUNIT_EXPECT_EQ(test, c->data->charge, (u64)PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, atomic64_read(&c->store->bytes), (s64)PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, atomic_read(&c->store->extents), 1);
+	refcount_inc(&c->data->refs);
+	io_opaque_data_put(c->store, c->data);
+	KUNIT_EXPECT_EQ(test, refcount_read(&c->data->refs), 1U);
+	KUNIT_EXPECT_EQ(test, page_ref_count(c->page), 2);
+	mapped = kmap_local_page(c->data->bvec[0].bv_page);
+	KUNIT_EXPECT_MEMEQ(test, mapped + c->data->bvec[0].bv_offset, payload, sizeof(payload));
+	kunmap_local(mapped);
+	io_opaque_data_put(c->store, c->data);
+	c->data = NULL;
+	KUNIT_EXPECT_EQ(test, page_ref_count(c->page), 1);
+	KUNIT_EXPECT_EQ(test, atomic64_read(&c->store->bytes), 0LL);
+	KUNIT_EXPECT_EQ(test, atomic_read(&c->store->extents), 0);
+}
+
+static struct kunit_case opaque_basic_cases[] = {
+	KUNIT_CASE(opaque_basic_budget),
+	KUNIT_CASE(opaque_basic_version),
+	{}
+};
+
+static struct kunit_suite opaque_basic_suite = {
+	.name = "io_opaque_basic",
+	.test_cases = opaque_basic_cases,
+};
+
+kunit_test_suite(opaque_basic_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.34.1

