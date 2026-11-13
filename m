Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583657;
	b=yIRg70RXu6yBKKKLJXiyMThzkhY+4f5HMrrIBVCj0HJNGJnAGm65TxFEKf0CkhQtYgRN
	 1YPPr6yN9/15soe0BqFkxB3sg0W0lOXv/jN8U5uyQnmH7d7nRPywE9xDjwhsLqkytBK2/
	 n+Aro1jITNFjjGE8hngX6gu/u3GHZbSIg88IHS7UFrNzuv5ay3s95ucXppIAnGHF/VsaB
	 ZD9h+Z1mP2ZE1XjRLQHwUgWFBEmRXGs8VpjCJYxoI393bnAlUZgdOByyOz1+zK0FTHN9+
	 iPOrZfHsBZ+G8rovJJUGz5+p82vKAwBSxdtKySE6uhDAq2Rd2Sb6g9nr831trx2dVIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FrGK4LQCQBqx0hUtkMsYYjxe3VECT+KAsWnhnUDOZDM=;
	b=QGvPdK1kIHiwtDT/lxOmqOSWOn7O1tb1jBB4ogK3h8Fkxwrtdr3zRjgBNvvN86WsKCDl
	 e3GvcPle28z7ncMIX3bFUIi0p8OPGDeCzSnjQDQrZeAuqZJRjn/D6VgigNilZMb+Y4REd
	 +hIiLz8mGK2RMpVh5KwTDFBvMlOZBwvSztSLVRpyI+FaQgl/XLtkrf6jG5nhKx+lpfo5J
	 Zf+S2ND97eXffZn/48hgWRlpdIDuh6O+iJvpPMrSG7jx7hbvslIU5PF8LFvcAVlvYLFZT
	 vvKsb3EkdjIVgdBQG/w7jM61Y8o8/HtRucQuDoPuptP1CN2wpruBjYJhDhLw7cux6rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lbGQVyka;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6055606A89D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6055606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lbGQVyka
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso6256765e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794583655; x=1795188455; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrGK4LQCQBqx0hUtkMsYYjxe3VECT+KAsWnhnUDOZDM=;
        b=lbGQVykauPq3rzPl+rYk4kEwNYQrN/P4fG033HJrEKxLSymRIV+nR2A0z67u7F+1PW
         vZlF0WX9pVUANdVwBtolDAbdNeaLB2eXYIU8GoZzR3+6lTCUsrJfSwlw5fkkPYQuSGYC
         rrbPKT/ZIFjXQlqQDk9t/UYO62wGzMAiLO3Ej6gTzW7QF9F48hR01asi7RQLjcchiKpW
         mmAzUVBlVgCmRilly/l4ik1UsdOO7SDMtY2ZgUfKfNdYYGyTKFJNa1nFCQL3enIhGXW3
         qVD+YewRBkpy8v0ERnp5zgLq9zhdKwELXSDqwfjkV+sCQz8O5pIAIDIoTdL6f+VCJfgM
         4b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583655; x=1795188455;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrGK4LQCQBqx0hUtkMsYYjxe3VECT+KAsWnhnUDOZDM=;
        b=YS7OMH+aB4RDbwB4QIpIP9eu1aG0KQBWeScDxTNqr6mvKcG9IegkZ+nvKEqp3K+AW/
         1kITUuaH9xH2HcFQZ17x7RZBv24on3JWsE4v7WhxD2noWJ7Xqqpm9XjlDm7PuY23hgFL
         NfHT6PL7B0PQHODLB/aCCRyYpJxAtpYe1PIP6YVwciOwFrR8hPVynb0qoITOA3NoYmDG
         OAyWcZNRv8kUVnZLLuM/9qiyEUhoWm+IEDRQt4u6m3FxR47gHPTsBpVU0BUKt44c9Da0
         3xjF5MCNmTFZsCs9vcaVJZi1K654cpgb1JRQdyZK29+meXMFA0ymcSsOmWH4bEIw6X4H
         19Nw==
X-Forwarded-Encrypted: i=1; AL+hErGDlTgIK2LzMsDv1XakAfiXSs+riCeJG/xrBozLfIu6iYY4l3fK+PV/Px74zoU7xViOaueTV7lEUYND3V0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y5yunJKtYMsW0Hj03mD5NbYVsG9CJqHeVfyoOtTxO0Pm0p2ld
	3sUhst59s+5ITYO3XUQb5nIN+AtQqnSD6p3qG4Tf/7ehMoL2QjKygybwPix/yNqLtlZUD91o2+Y
	k+iFdDGIjNMSMLKUH2NqjEQ==
X-Received: from wmfv1.prod.google.com ([2002:a05:600c:15c1:b0:4a1:fe2c:3323])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c0d:b0:4ba:59f7:9032 with SMTP id 5b1f17b1804b1-4bb55c5f60dmr71390435e9.10.1794583654644;
 Fri, 13 Nov 2026 07:27:34 -0800 (PST)
Date: Fri, 13 Nov 2026 15:27:12 +0000
In-Reply-To: <20261113152729.837429-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113152729.837429-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113152729.837429-4-vdonnefort@google.com>
Subject: [PATCH v1 3/4] ring-buffer: Order remote page commit with data and timestamp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, bgrzesik@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

__rb_get_reader_page_from_remote() uses page::commit to check if more
data is available for consumption. However, it needs to make sure that
data and page::time_stamp are not stale. Enforce page::commit order with
page::data and page::time_stamp, and defer updating read_stamp on page
swap until rb_page_size() confirms committed data is present.

Cc: stable@vger.kernel.org
Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
Fixes: 34e5b958bdad ("tracing: Introduce simple_ring_buffer")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c        | 23 ++++++++++++++++-------
 kernel/trace/simple_ring_buffer.c |  5 +++++
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index f70010e2ede7..6016d16d1566 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5832,11 +5832,8 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 	smp_rmb();
 
 	/* More to read on the reader page */
-	if (cpu_buffer->reader_page->read < rb_page_size(cpu_buffer->reader_page)) {
-		if (!cpu_buffer->reader_page->read)
-			cpu_buffer->read_stamp = cpu_buffer->reader_page->page->time_stamp;
-		return cpu_buffer->reader_page;
-	}
+	if (cpu_buffer->reader_page->read < rb_page_size(cpu_buffer->reader_page))
+		goto out;
 
 	if (!rb_num_of_entries(cpu_buffer))
 		return NULL;
@@ -5883,10 +5880,22 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 	cpu_buffer->reader_page = new_reader;
 	cpu_buffer->reader_page->read = 0;
 	cpu_buffer->pages = &new_head->list;
-	cpu_buffer->read_stamp = new_reader->page->time_stamp;
 	cpu_buffer->lost_events = cpu_buffer->meta_page->reader.lost_events;
 
-	return rb_page_size(cpu_buffer->reader_page) ? cpu_buffer->reader_page : NULL;
+	if (!rb_page_size(cpu_buffer->reader_page))
+		return NULL;
+
+out:
+	/*
+	 * Order page::commit read before page::data and page::time_stamp, most
+	 * likely paired with simple_ring_buffer_commit().
+	 */
+	smp_rmb();
+
+	if (!cpu_buffer->reader_page->read)
+		cpu_buffer->read_stamp = cpu_buffer->reader_page->page->time_stamp;
+
+	return cpu_buffer->reader_page;
 }
 
 static struct buffer_page *
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index 5f14ba152fba..2dddaef638dc 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -307,6 +307,11 @@ EXPORT_SYMBOL_GPL(simple_ring_buffer_reserve);
  */
 void simple_ring_buffer_commit(struct simple_rb_per_cpu *cpu_buffer)
 {
+	/*
+	 * Order page::data and page::time_stamp before page::commit. Paired
+	 * with __rb_get_reader_page_from_remote().
+	 */
+	smp_wmb();
 	local_set(&cpu_buffer->tail_page->page->commit,
 		  cpu_buffer->tail_page->write);
 
-- 
2.56.0.611.g1030f0b940-goog

