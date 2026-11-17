Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928539;
	b=ZisuDlV9pvdUdlCKJ/Nv2FhIMjgF7khHolDZLGWj+6qXgnsTGLpUpfLtFYizGqokgZu5
	 8+IBuzX+zPXTziBjBP/9El89V6HjYHbF4Hj/iFHHBYceZxBTzmTbevOr34PEH0nJyb5zV
	 AuH205GjZOrQWRYY3zINks03PLuA8U5/beLROS8GWQjynMbrUjJ9Fnm/xraAN1o4Tgbep
	 kM5A8ogmUeLOGr7LmbNJF7VSIs+2B6/tGe9mlhgX0FmALY3p9dAsRGGgusOUFg3zOjcL3
	 cn/NqImmr03AYXiuYrXzrhF9ggTna1Eb4wqDn8N1VIPyVM9e8x+hSqlFlAQAjddkyaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Dvb/uhBRLlieD3DxnBsDgJCSszczVxiDnHK5Gq+WxBM=;
	b=wXCbyRuZDB11d8VJehFTlIxQDbPLqT5pY0xXTIuqtVKhLRs0otv4XD/qQE1jdzLPNuEy
	 AAEp61SPwsaPpZAuqiDG4+Z+McIdb+AxHd0BW2gdswJjbvz+do6IXfpWbknLjGyW8eGR+
	 NIWjltBsYvhtU5dEl0LJosRTUBTxBB5F86DkcwTL6MuCSedbjgC4LX9G/0PAljjG6q1p/
	 2n4CvGyWqmKKPDK2OGPwCtpOug0zXHWp7OBKawzXsJ7rbT8Cifb3OSvxCM9mFVjkHfS9i
	 HPqpCegsT/59AjILuCbb4CdpVD+jMCsG3UjER6K86teFqhEc7KCEamtG3i+WEHOxsbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gZ7LyHkW;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AE0606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2AE0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gZ7LyHkW
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so33219555e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794928537; x=1795533337; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dvb/uhBRLlieD3DxnBsDgJCSszczVxiDnHK5Gq+WxBM=;
        b=gZ7LyHkWCMegg4n/ftFMALR0gv4RAhOwmXgxUt9tftmwLqxIQnVGempw5bAeO3tUbg
         N/ZhvYb6ZjqUSHeM7Vo42L/ICA+zZ7b8DN1K/JdykT+0CajA9cTkavV6jl5HGXREjMZ7
         kLyf9h/Kw2JfKUTkmk0GUM0oaXLY+GjoFrDq9ovSpufU9dnCp0kxjNKM9UcL8ZdLWgYb
         ZDjcVczOeDwTV629wZgZanG1LoEJBdWFgkDIOBTp0qI58SKETNz5DP+3bqnXek6hgFgK
         yCr8DNDln17CfQ+AIqa09HS0BhRPtIuXniEtRbcfnL3KJ1+BxtJUgjYThmnQBzNywpQk
         Opmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928537; x=1795533337;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dvb/uhBRLlieD3DxnBsDgJCSszczVxiDnHK5Gq+WxBM=;
        b=MJvyIUAmiQyst2PIX1FyXKqQsr+8cC7iwcm/sob4UCmCc0EQMD1AaXuVUyFTtGWVy1
         R5wlrR8sdsM4Tho6zUjBEcqtPGUzSWhFiqpLuyNbBXDP7ilsTYkqfwfk3PVyZ98Lx0Xa
         lmJrZdbGI7g4j5QMGl0XhsZRaE69OZzOqJKGBYC54AXJX1zY4GJc+ZYUSoHFqJRB65Gs
         IbCOdwwTYlfeHOcf8cEfsy0lcE0K0IvO9DPDED0/Fmzcv45LwtDRFurMWd0W9uUnT0ch
         ozBpOfbOe9XP43kDHm+Dh+0QnQlLHUIAmKgsFdpwrLqly9S1eiuemleIQ4xtsX3AqdU+
         yXhA==
X-Forwarded-Encrypted: i=1; AL+hErFUH7Vzs2XhtZe+g1EOmCVxBfC6/UnDs8BfALnDvWGMYWxEiCzq00Uj45lTJdB6gXIYKVS9jRgmYqUoD14=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eVTUTkDK5jOl6PB0rIFd37cFtwNJl8SFL4ZGMxb2tFWr1Jugu
	+/hS/baY2NNSVtQtOTYH3ds0ylE4ucGzoGXbwwCM9Munlfn5F82n3+CKs9xjqsDwSPtoiMerV7h
	0F/ZBCP/YAVK8bY9oNZg0rA==
X-Received: from wmox16.prod.google.com ([2002:a05:600c:1790:b0:4a2:11fa:1981])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6097:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb66265d0bmr200655825e9.20.1794928536708;
 Tue, 17 Nov 2026 07:15:36 -0800 (PST)
Date: Tue, 17 Nov 2026 15:15:20 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117151520.3972146-1-vdonnefort@google.com>
Subject: [PATCH] ring-buffer: Add missing cnt increment for remote ring buffers
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ring_buffer_per_cpu::cnt member tracks modifications to the ring
buffer links. It was introduced for rb_check_pages() to avoid locking
the ring buffer for the entire duration of the check. The reader page
swap function for remote ring buffers does not update it. If a
concurrent rb_check_pages() recorded a page as head before dropping the
reader lock, it misses the list update and loops indefinitely. Add the
missing increment.

Fixes: fbd1743ecba1 ("ring-buffer: Add non-consuming read for ring-buffer remotes")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a72e6ee..d386da1414ed 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5878,6 +5878,7 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 	cpu_buffer->pages = &new_head->list;
 	cpu_buffer->read_stamp = new_reader->page->time_stamp;
 	cpu_buffer->lost_events = cpu_buffer->meta_page->reader.lost_events;
+	cpu_buffer->cnt++;
 
 	return rb_page_size(cpu_buffer->reader_page) ? cpu_buffer->reader_page : NULL;
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.1.703.gf848ed807c-goog

