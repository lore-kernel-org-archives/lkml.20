Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316818;
	b=tW3xrkOr6iZSwnQHUfChtVwt73AWEediZuzRRDICCTXiRhVcOrMSEeo4q/67vlGIOv/7
	 16uDmDN3vKeAWt8x8vOb2Ilhjj8ycVRB4wX0+ZVn6q8ERrCUBoMFpQxCc+o1WAOM6/Yp+
	 gePY6YLO0HlR4Geua75vucIumeIEqb5FPwHAjgl0gl30I5f0/gLuVs9c+iNjg/herzVFR
	 PJi9TwVk8SjQ2dg6LKCWt0Wm6XTxeCvX7qkDZI3KA6JfNURtDdF4I0XzGqohJP/44Ty9L
	 D+eXPnrkjAEhCNBm/z/s6D9TtI5D69f1Xm8NyMcmuSazPQn6V7q4BHOJJuuyrer4vUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316818;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=o3j8ZSLUlMW9spzjCj6Lf6ZyTqWduSvktrPcGEoHNnM=;
	b=isIITcCqnqUXvk2GZPg+kPYiZWE7bphHfuk9qRP3uiY61nuwoBU0oMnDF7tBS3NQmhnK
	 UqxtChCPdwMnKTzqSBOU+Gd5i+kpcHI5RCNyayu2adtn8DKqeDTTymeyNqFy+tOCcpJfA
	 dF0/NBEk8GVc3zuAeOxnLnS24LCJqBZHvYNpzhc9hxYiUY5UEOfCB1AglfryhmKRvVixy
	 3D0yl5QLEiaqiK6qR7nI6ZhEsqLRUjsPcwIKLbNI7CWM0Y6jt0Ye3nf0k3HrkfKN9MzPb
	 HSkcbMTLRxg6DD7Fr9N/DDn4eG1EzQyvjf8t4qfW3sOdyEHo9Ca3jd05rRWVx/CnzIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bolY8nWU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i+5XCEtm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A1A60A260D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A1A60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bolY8nWU;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i+5XCEtm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794316817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3j8ZSLUlMW9spzjCj6Lf6ZyTqWduSvktrPcGEoHNnM=;
	b=bolY8nWUSU3xix/y00mMJGQIeehEiXvMWCOMiF+3QHdCT6yTgJL6w1WYMvWeBNoPRjxbBZ
	PsnXEtRfm/2CQYokiRvWZhH6S6/5Wt7mu3keoORqdm7WY2ohMLTzFrmmQAqh37EO/4gktt
	Gh1j4yMkvaZ27WHF/51o57HBLs8GoIo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-Ukbzf4XWNr21H8pSNUO65w-1; Tue, 10 Nov 2026 08:20:15 -0500
X-MC-Unique: Ukbzf4XWNr21H8pSNUO65w-1
X-Mimecast-MFC-AGG-ID: Ukbzf4XWNr21H8pSNUO65w_1794316814
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c505ee61160so14955566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794316814; x=1794921614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3j8ZSLUlMW9spzjCj6Lf6ZyTqWduSvktrPcGEoHNnM=;
        b=i+5XCEtmpFWipFgZNLE/fMc723DK5Ny/xxXGHMwawP8OlJErf09CL2Kd6S1HWtelVY
         0zuny+/muaJNJ88KY68zQHVVG9rHZ+MM5Ol1hIrYV3EbejqvN/SlDmdkKKCkM5sGJZbw
         3Pt4Jh+b8OXbZ6IEOtO62/Q9QIGkkxlrHZEBib1vjauncP8CRsER39qLbpU+PIN27fuH
         cbTyBBpeEz+/4O4bSV3vEmKdMKM4qQNCqAQWTfJFpl1xJUc40dWzRhueU/nCSn4DA/u6
         hju+8l8mYQJsSUTfCExcYwzApOkH09e06ykd90tqOEJ5B3cCyFzjuXIgreztbKVEIIt7
         WZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316814; x=1794921614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o3j8ZSLUlMW9spzjCj6Lf6ZyTqWduSvktrPcGEoHNnM=;
        b=eawZebq8ahZtAomw2UbHnnBvqRWcx4svX0yTJH9uP+FrNiQ5D9oHRZNVc/ABsK8v7F
         n22VLb6WO8rTzyie1XmqRw9fo0LUuI+KNYXoH03lTsc4IlNA/5piwo0D1tgKqt9jitgN
         hVpbleQ71WAVDZvi+yR3dcp++jLFKwiqU6nEK0mhkwFxLi1Qq9Lkvh0tO1PX1VMDV39h
         GNlBAlpcSDTRoOmXnhAuO2DNDkjSNhno5ZoHGtqWCODyHi9YOO2cwWT3rCLiLFYliLPI
         TF3cnZKB7sSWUsnw9UiAF9ddIpcAoeYpkZPE8CwCLAJVY2xyq3Cw50K4u04cSeLY+y2v
         oukQ==
X-Forwarded-Encrypted: i=1; AL+hErHnNMUxUB0NOkOvc+hp4KU7i7BIWkzzwgmvqO/No/jFPZz4b1CkWozduMfkA0woojJT8toCq98AwxsumXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bFpq+MTdMbfUJ77cP4jBs4AA0BXI/neQKx3ukYh4jeh3WVgZ3
	ZQMomPF5C9YbhEHE6uarzo1sAdmngwtAdotee9S8SxzWpCwgvN6y1q2NqZFcY/PhQijLUFITZjk
	dblyaTRZ4eLXzhO0nnjzKts+rvcj90ZDb2z6IKQw8FVP2L6pqqY+ZS6QC4UtFvwZfRw==
X-Gm-Gg: AYBFou3TS9nEzQgWlZB81iWy9WqHoy1ZL1VPXfOsLJRuNDMrnAW9le4JMh3K5vbX9ur
	TmRq/Sfwx1zABHWdRrOIaCarKeDqR5sPv3l2A8kcZAPzdd2v9wLmLwsPpEp7ea8ct6j+R6ZtfP+
	dIlZsD9faOlUFthYJSMwWwSIWZDS1RHCKsaS5rH9/+0QyaoRgrdHdoLnQfPrF/TWiOtMVUwxUzg
	k6Jo99wCCsU2oAuwj/xt0qh4u5RU74zvHDHykSRCplyf1E3T97RrwfYsWVPrHNZ/QnOBiLx0ycc
	Pem2VPUuosQqQXoz8WCrdK64Ys/Wkrk60cWP8iferWuY916KimrEPFxbFd8J1gttch28kle5jVl
	/xOXzaAeVU1YLL8iz8mKhBqAcG154fxy2RzIs9J37Ei+eXSH95v2AIALP8e30Wz+KKisFWeofza
	zmM15zCg62ryLb7pM/dnbnGPs3L6tIO3JO2wR8AkQLAkyWP3vRBFToi3NZpi8c6bvehguJsfNeU
	7zVkgd0Be7jXdfYm1vxyQB/CFnsJgZ1JLw50j6JgkvyCQHFYHbz
X-Received: by 2002:a17:907:d7c9:b0:c2e:2252:6ddb with SMTP id a640c23a62f3a-c50495dfb72mr227137666b.10.1794316814432;
        Tue, 10 Nov 2026 05:20:14 -0800 (PST)
X-Received: by 2002:a17:907:d7c9:b0:c2e:2252:6ddb with SMTP id a640c23a62f3a-c50495dfb72mr227134966b.10.1794316813994;
        Tue, 10 Nov 2026 05:20:13 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5d54bbsm107791166b.48.2026.11.10.05.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:20:13 -0800 (PST)
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
Subject: [RFC PATCH net-next 04/12] io_uring/opaque: add owned-page helpers for dense copies
Date: Tue, 10 Nov 2026 13:19:58 +0000
Message-Id: <20261110132006.3280986-5-amarkuze@redhat.com>
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

Add the accounted destination-page allocator used by CREATE and compaction.
Prefer compound allocations up to 64 KiB, or one base page when larger,
and fall back to smaller orders.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 io_uring/Makefile         |  2 +-
 io_uring/opaque_compact.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 io_uring/opaque_compact.c

diff --git a/io_uring/Makefile b/io_uring/Makefile
index 81710127046c..191316972e04 100644
--- a/io_uring/Makefile
+++ b/io_uring/Makefile
@@ -17,7 +17,7 @@ obj-$(CONFIG_IO_URING)		+= io_uring.o opdef.o kbuf.o rsrc.o notif.o \
 					query.o loop.o
 
 obj-$(CONFIG_IO_URING_ZCRX)	+= zcrx.o
-obj-$(CONFIG_IO_URING_OPAQUE_OBJ)	+= opaque.o
+obj-$(CONFIG_IO_URING_OPAQUE_OBJ)	+= opaque.o opaque_compact.o
 obj-$(CONFIG_IO_WQ)		+= io-wq.o
 obj-$(CONFIG_FUTEX)		+= futex.o
 obj-$(CONFIG_EPOLL)		+= epoll.o
diff --git a/io_uring/opaque_compact.c b/io_uring/opaque_compact.c
new file mode 100644
index 000000000000..b59c7cb95d42
--- /dev/null
+++ b/io_uring/opaque_compact.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Workers copy immutable backing without holding object table locks. */
+#include <linux/highmem.h>
+#include <linux/memcontrol.h>
+#include <linux/mm.h>
+#include <linux/overflow.h>
+#include <linux/sched.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+
+#include "io_uring.h"
+#include "opaque_internal.h"
+
+struct page *io_opaque_owned_page(unsigned int *order)
+{
+	struct page *page;
+
+	for (;;) {
+		page = alloc_pages(GFP_KERNEL_ACCOUNT | __GFP_COMP | __GFP_NORETRY |
+				   __GFP_NOWARN, *order);
+		if (page || !*order)
+			return page;
+		(*order)--;
+	}
+}
+
+/* Destination allocation for dense copies and CREATE. */
+struct page *io_opaque_dest_page(struct io_opaque_store *store, u64 pages_left,
+				 unsigned int *order)
+{
+	*order = min_t(unsigned int, IO_OPAQUE_MAX_ORDER, ilog2(pages_left));
+	return io_opaque_owned_page(order);
+}
-- 
2.34.1

