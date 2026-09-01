Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A0B440637
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278094; cv=none; b=gB7/LU4MPZ+tjMtDQ8DJC9ApJldRwM98bw/EWKiDPdZDHuNpMOXFsMfH8839SRcukxI0I/PIG1g/3I9POKx7VIl6cy+rV7r7b7ePlEBeiWA6k1w2JChsHDDSi+mNPT237MjxgBzVXNNf85dbgi40z+FOjf0bJDiyr6artJi5zDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278094; c=relaxed/simple;
	bh=NU66rj7meP2lwUheHCMM6UTvsVHkphOk4z+aTUBJBQU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cA8jmXIbWdXatTs+8IFT0DhuQv6wHrELPkXzVCk0jfoXvUBo539eO/L5uW96GIU66q08OmrbFHMOpHmBWk7MFtEE7YadrgoeDn0xXvqfHYnJX5Qxs9AdQ0/zxCSbDG67kUWHvfWFEv1jX+MxuZ9dzG0eVrLIhMCjXP4swcXJAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fp7ybGeV; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fp7ybGeV"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so38689985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788278091; x=1788882891; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DmazxTkjw29WW7LAJurjmx1r535FKAoFupnRDAtKegs=;
        b=fp7ybGeVpRlUy0N5a4xJDZ3kMrsx6/l7VNFMC3xIfE/1a25TfazbZ54na+rKy/VPGE
         1jM7aj73A9mDaAIDEn+QZb1AVC45kl0ipecKcbIn8uqt5k4bYlqjJrxRcMuVS5GmGGh4
         8/7sPP38KycEsBD5f0bwIxqRiWnFRTa34vYyfeHt2paoAtQMFSqOa2hv3Z/nkrSqXjZt
         x2+ozvxHVgENuApRVpbmStU/lTLZpQPHpVr+HBvtQQaZ5v2ogDxNnIAaaX3Hxq0Q/5ck
         ZmoCvFQv61i9iFjnexmxTVEy8o77t/OrEWtIE4Ow6an+TdWB79LbqvaSv+aFjDzUWCuY
         kGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278091; x=1788882891;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DmazxTkjw29WW7LAJurjmx1r535FKAoFupnRDAtKegs=;
        b=Q8g8U93yYSaSANmQOssEiGsz9wr1VgPHs4jWTAzCaHtiwh5CTNvhBSZLY/nNoJaCy6
         j22N39QMkaVDFyj1QP8jEmzBrbUOjPl88FZC5JmBBpZIoe6UAqTQ+hZkKwIQTN3d18hq
         093/nfdnFVCLwtWTJYMzWE9FCtHSGfjBQ67vmETaYQM0Z0Ht3US4zQiw8vFS6plRGDbo
         P6djIrRdiCyQ/VBnL5TlLWS28Czc5K1ZM7tk0+x5lLY6HQvu4/SYQKmjFF1N4ZJ2W2st
         ql++y0JgTGy5yWiS9bmSWpyxddE6zoklRZW5f2+gn0H8lzNNxoYc21WiuiizDvNmvO7W
         YVhw==
X-Forwarded-Encrypted: i=1; AHgh+RpVL5hR+fclQbLIjgwaafenAViOrqwuFyE+aK+m3mJALL4JvAGMczBO9xYHxQIIUnsYaCDIINkkpbKBhr4=@vger.kernel.org
X-Gm-Message-State: AFuF++kfTiC+MC4YLd9aEvEtdCARW+vNVq2k1d8C6GPhZZxlobVLcNQn
	H85Rli05Hx/TXZwJOCH3sQ1zLxrzUyIXfUNZGG/OemfqVdCno2VJagOke2OYQSvGnyiDBlkF6qa
	UYjzGVVHzyTAg8HCuwiJRVg==
X-Received: from wmqe20.prod.google.com ([2002:a05:600c:4e54:b0:499:b2b5:78e8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f88:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49cdc4546c9mr157815095e9.14.1788278091021;
 Tue, 01 Sep 2026 08:54:51 -0700 (PDT)
Date: Tue,  1 Sep 2026 16:54:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901155445.1475405-1-vdonnefort@google.com>
Subject: [PATCH v9 0/4] ring-buffer: Fixes for subbuf resizing and persistent buffers
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

This series addresses multiple issues discovered with the dynamic ring
buffer resizing.

I have managed to reproduce a ring_buffer_read_page() race with

 $ while true; do for i in 8 16 32; do echo $i > /sys/kernel/tracing/buffer_subbuf_size_kb; sleep 0.1; done; done

Changelog:

v9:

  - Fix splice read loop when buffer size changes at the same time (Steven)
  - Allow splice for all static buffers (via memcpy)
  - Rebase on 7.3-rc1

v8 (https://lore.kernel.org/all/20260826094528.3738023-1-vdonnefort@google.com/):

  - ring_buffer_read_page() handles gracefully read_page/reader_page
    order mismatch (Steven)

v7 (https://lore.kernel.org/linux-trace-kernel/20260817101533.1558223-1-vdonnefort@google.com/):

  - Match the "static" rb limit with bpage::id bitwidth
  - Cover another 32-bit truncation in rb_range_buffer (Sashiko)
  - Fix uninitialized spare_size (Sashiko)

v6 (https://lore.kernel.org/all/20260814154823.755406-1-vdonnefort@google.com/):

  - New prototype for ring_buffer_alloc_read_page() (Steven)
  - ring_buffer_read_page() to return -EAGAIN (Steven)
  - Keep nr_pages "unsigned long" (Steven)
  - Repase on ring-buffer/next (Drop most of the patches)

v5 (https://lore.kernel.org/all/20260813131152.3589632-1-vdonnefort@google.com/):

  - Reset info->spare_read only when data is in the ring-buffer (Sashiko)
  - Use `unsigned long` for subbuf_size declaration to avoid 32-bit
    truncation. (Sashiko)
  - Make cpu_buffer::free_page a buffer_read_data_page
  - Update kerneldoc for ring_buffer_alloc_read_page()

v4 (https://lore.kernel.org/all/20260812153311.2328812-1-vdonnefort@google.com/):

  - Add rb_subbuf_start() helper (Steven)
  - kerneldoc additions
  - Fix races in trace_pipe_raw readers
  - Use rb_subbuf_capacity() in ring_buffer_subbuf_order_set()
  - use rb_page_capacity() in ring_buffer_map_get_reader (Sashiko)
  - Fix 32-bit overflow in ring_buffer_subbuf_order_set() (Sashiko)
  - Hold cpu_buffer::lock when modifying cpu_buffer->free_page in
    ring_buffer_subbuf_order_set (Sashiko)

v3 (https://lore.kernel.org/all/20260810125633.3344684-1-vdonnefort@google.com/):

  - Drop first 3 patches (Rebased on 7.2-rc7)
  - Add a patch to align "nr_pages" to unsigned int
  - Add a patch to remove useless trace_buffer::cpus
  - Add unsigned long cast for rb_subbuf_size()
  - subbuf_order fix for rb_free_cpu_buffer() (Sashiko)
  - Use __always_inline just like the other accessors for the hot-path.

v2 (https://lore.kernel.org/all/20260806211306.3704194-1-vdonnefort@google.com/):

  - Prevent resizing of the persistent ring buffer
  - Add missing bpage::order init
  - Rework subbuf_size/subbuf_order (Sashiko)
  - Remove ring_buffer_per_cpu::mapped
  - Dynamically calculate trace_buffer::max_data_size

v1 (https://lore.kernel.org/all/20260805153225.2096152-1-vdonnefort@google.com/)

Vincent Donnefort (4):
  ring-buffer: Allow splice reads on static buffers
  tracing: Fix subbuf resize races with trace_pipe_raw readers
  ring-buffer: Cap static ring buffer nr_pages
  ring-buffer: Prevent truncation of nr_pages / nr_subbufs

 include/linux/ring_buffer.h          |   5 +-
 kernel/trace/ring_buffer.c           | 224 +++++++++++++++++----------
 kernel/trace/ring_buffer_benchmark.c |   6 +-
 kernel/trace/trace.c                 |  95 +++++-------
 kernel/trace/trace.h                 |   9 +-
 5 files changed, 196 insertions(+), 143 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.897.gb25b4bd76c-goog

