Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A60525A60
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809211; cv=none; b=fiuyDCMT1iNvnG+ZTXZScgwrGFTrc+M4EDw3DNbmdGVIBZPV2imxETyAVVuBoD91VxbEGUWz8vJWT7tDYhx0VAdw7Lm1iucVIDXp1WVrXLAL2PLHOWehUpM0DsSHKBKpmlGfM7nsgVeToQbL8mhm+7ogLa5V8y34tc3GF8onHZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809211; c=relaxed/simple;
	bh=VV2UYtfj14QiFFoEBe2SgvinoxBkc3CLTdw0RZkYt4A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CwFe5QRQCbPVs4OHU3Hdnyc7nFDeXjBZDI18zXdN7qjFrMwZjkNC3QcGMe3X9ErN/nnl9ObLhR1vfy0n9VRfYglECrSof1FvQ5MvhJBW/xefK+DkfL0brbJW3TLI7c7hkfvzQDzf3rzGNfU8xPSJBYXkLBhRYVMTX9maVHNHL5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JUuUwpRn; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JUuUwpRn"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49ccb223bceso21749375e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788809207; x=1789414007; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOfeCPGjKhu5LNIU7QtSslcaAEx2w8+cq9M/aU9GG/0=;
        b=JUuUwpRnyvtvnhsicXI2LmAs/KYxwYoLDWO7P+B4s1yNxP5yX6GWvTLorTJM7vbgwB
         uVVuWQUjiB1/EgREhCtKRv2k9VVH6HOwB2JsP1TNcxSoNLmQWaq+vvQLaPznDbaHL1R2
         nMQqmwaiAiRCUsgPCPnQyVp7Apx/Eoxd4NEGWB/v1A+O9VYYXKHzIFjUmNFiuTaZQrVF
         ax9vRCAKfsR0IPg7bEqPdlRrbkC73uvsvni+D2M8j+sW1VqVEV7HECIYqwVhGdmgRGcW
         exRbV0VSGDc3NGC4pNNCci8+fY8CK3n4okcRgn/gDeVmdtjpPyVa4uY/m0moWeXEE5UJ
         YgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809207; x=1789414007;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOfeCPGjKhu5LNIU7QtSslcaAEx2w8+cq9M/aU9GG/0=;
        b=VBAvp1VW6HJ2+qQRfc35IHqt6eZzTUxuk1l+DZyw/Z+Q6b9Gl3M2Wl1Qsntv7pdxbU
         DUcLcTLSjlCMblYZcP9tKCgImFvlCE+j1HfTq8vL/2JZHha8o+kCi2czTOyJfVaREzmr
         52bRvs2LlLjKbsMDkUUqZoLX5aCA+eyi9eC3gboWs039XiigYAG6fLsv5hWwkpEYOJmI
         A57blwHwxtn/SoUzDmkHiUpbs1fQEk59I2uPLscY4vXsoMtDWzdRz9rsXivuBVzTobK5
         fKWHXaUdiEibvLQhDQIsZ4D1LWOGgZwhBDVjz1q7qI4hM/kgnyzVn9k/LQonJIdu6dH6
         kPlg==
X-Forwarded-Encrypted: i=1; AKwUvBwRPvrrkQ4u/L7VqbOufkpydZ80/06kmMPLgycdSMDcSt1MRDEKazR1TufJ07pXAQrJSOwe2g4NuZlnne4=@vger.kernel.org
X-Gm-Message-State: AFuF++mwKAXNKZFuJVyDMXsLTxmb2xL4LX2rayttuc6qsNEAFKoHB+kw
	tR+YGdT5kigPk/zFXQa4Rt4MX9702haZbyAJderrdpiSuysVpxky3C1KnIjz8dvMmFxXB6viT8E
	DisQEs9mHy0DT6U4kVhpHTQ==
X-Received: from wmcu4.prod.google.com ([2002:a7b:c044:0:b0:490:b475:af08])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fd6:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49d1754ecbfmr30403525e9.5.1788809206748;
 Mon, 07 Sep 2026 12:26:46 -0700 (PDT)
Date: Mon,  7 Sep 2026 20:26:42 +0100
In-Reply-To: <20260907192643.42513-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907192643.42513-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907192643.42513-2-vdonnefort@google.com>
Subject: [PATCH v1 1/2] tracing/remotes: Account for ring buffer page header
 in size calculation
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

trace_buffer_desc_size() and trace_remote_alloc_buffer undercount the
required pages because every ring buffer page contains a header
(BUF_PAGE_HDR_SIZE). Account for that header to ensure allocated remote
ring buffers aren't smaller than requested by the user.

While at it, ensure those functions catch nr_pages overflow.

Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index afc7daa6ee7d..7a1a92f87650 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -8,6 +8,8 @@
 
 #include <uapi/linux/trace_mmap.h>
 
+#include <linux/ring_buffer_types.h>
+
 struct trace_buffer;
 struct ring_buffer_iter;
 
@@ -281,9 +283,14 @@ static inline struct ring_buffer_desc *__first_ring_buffer_desc(struct trace_buf
 
 static inline size_t trace_buffer_desc_size(size_t buffer_size, unsigned int nr_cpus)
 {
-	unsigned int nr_pages = max(DIV_ROUND_UP(buffer_size, PAGE_SIZE), 2UL) + 1;
+	unsigned long nr_pages =
+		max(DIV_ROUND_UP(buffer_size, PAGE_SIZE - BUF_PAGE_HDR_SIZE), 2UL) + 1;
 	struct ring_buffer_desc *rbdesc;
 
+	/* Capped by ring_buffer_desc::nr_page_va */
+	if (nr_pages > UINT_MAX)
+		return SIZE_MAX;
+
 	return size_add(offsetof(struct trace_buffer_desc, __data),
 			size_mul(nr_cpus, struct_size(rbdesc, page_va, nr_pages)));
 }
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 75fa1ffc4c96..2e0fdbb730b7 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -980,9 +980,12 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
 			      const struct cpumask *cpumask)
 {
 	size_t min_desc_size = trace_buffer_desc_size(buffer_size, cpumask_weight(cpumask));
-	unsigned int nr_pages = max(DIV_ROUND_UP(buffer_size, PAGE_SIZE), 2UL) + 1;
 	struct ring_buffer_desc *rb_desc;
 	int cpu, ret = -ENOMEM;
+	unsigned int nr_pages;
+
+	if (min_desc_size == SIZE_MAX)
+		return -E2BIG;
 
 	if (desc_size < min_desc_size)
 		return -EINVAL;
@@ -991,6 +994,7 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
 	desc->struct_len = min_desc_size;
 
 	rb_desc = __first_ring_buffer_desc(desc);
+	nr_pages = max(DIV_ROUND_UP(buffer_size, PAGE_SIZE - BUF_PAGE_HDR_SIZE), 2UL) + 1;
 
 	for_each_cpu(cpu, cpumask) {
 		unsigned int id;
-- 
2.55.0.979.g7e5102b832-goog

