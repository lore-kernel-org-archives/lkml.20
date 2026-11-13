Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583657;
	b=bpyU+zgjC4tYnn/rEjJ9XMw1d0lwPWa8/y2oMho5VMch3ig3U7qwo/Jl+Gn/NqImiRbE
	 nQjBOcIDzFoM9friRCFhb+A3tk502dYWqrTRw1ZNGsiHc4yZLyupTf6FVf1A+VsSSVNXl
	 JMEqO0f4knN1QzDbr4f4jUEeQuMG2su/NuQUjRkCw9TVM1LmiuA2RCN8Eo1J+YkFSzcYD
	 bS8Cug4Z1CWO8a722DtT9hQIuWNHLTJZjNX7H0IN4wtXPaJZCSbtfcwyZ/E897/vrd0lc
	 bhL20CPTXe8HG31AdclaN+VeF8/R1H7cL1q2zxf4hkEUAZz7kIOn2HEOD10sbR6+Dgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FO88jd7JN6r4cNWqmQOa06AmPT79EvpBEfyhLQB3b0Q=;
	b=REraVbG4kJeTOkE8J/IH50RYLCXuLzQnavO3eANunh4v0zsGwPfT98F2577rVSDCA6MU
	 GrbuEKQrnyR6Dk3k1jQPmjw0no/ihVuv/YqBTMNirrgNc5Et+EOTIStw7HRzNmG9mIFgk
	 vc3PEhfgqrAHHYPrKZ87YE4B8r+SvMKyfL6hFnELynK9iCYH9E0wNdnHFjGj4xZVF+rzR
	 ppDBO4bbPDHhB0hwwkb6Ohdmif1XLOILZWQFw+qfMNuY8qbdKBEgmT6PvjsW0Yyojni9w
	 4HsAeKLgoKhl2l8zXeHOQNGPnApMQpp1UKf2DNh/Z+O623tpWULTqPMBOodzsqjp+EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PcrZlBQu;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61C606A8AF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C61C606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PcrZlBQu
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso1027436f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794583656; x=1795188456; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FO88jd7JN6r4cNWqmQOa06AmPT79EvpBEfyhLQB3b0Q=;
        b=PcrZlBQuxK13YnpNxig77ucJSRNONnlD2i+0hJt+iom3id1f9v5yBLIwZBF4MZQEma
         HWnDtuJZC2DPYUEwRgtmoJBQexndmBrfPwxrG3CVU6RGitWOqToDqK18YzAJ6IxBI5LM
         HGuzo7fdMspDDpKFVrNIZ6d9CThvqA4OVIW/QYLrl+8XtzeaqIm9rsEGGzrb5ErvomJD
         Via6T3f1lDjZ7fzTBP5AFlv/UEOeTOphyFe5jkPaeTO7K/1mwi9+wS+74Unj3+HOicc1
         xDpCTjI5Om44li5IdJHzJLP3EzVj/uK6j5TQ//VnTFEVBbpH8xakS3oXeQHL/vzE59bZ
         CUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583656; x=1795188456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FO88jd7JN6r4cNWqmQOa06AmPT79EvpBEfyhLQB3b0Q=;
        b=fRuuZJuT8n5m3fwk+YT5UEQg/Rxqu+1tV8IDEZa7A0gFYvK9lP8Dg14vEJdjCqDGZn
         AtZ0u8n6oFMC6ADRzbkWScQAFRtEyVsYrm4mTJXQpfhIWufLTUhOCmGdin6TqZ8DXCdN
         V5i9Fz4r5uWyio7oTDlLHY6t4iSRyG/wUNthy8SgmVCRy6JLdmK+Ny/rc+WwMz0NN3Tl
         BSo9ba1/ypSpdUat9iS/FvjXXXP1VN3gERIfeaCa3amQgBZtt2GNMDp0OmNwwizrlVBJ
         yoPb09xV4ND+pertUgidDRgkoY8A0vsBDQTrFv/o9FKZ4Y8g06EFujN3vWeAAOtoiKLt
         KlYA==
X-Forwarded-Encrypted: i=1; AL+hErEI3L9rfTygtyCrmJgOqWtCM+BBYlTAg6YSHWbc7ZiCalQFoYgh5OGSTSjmg+BFX1+Z2ugGtxYTzUh1daM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U+pEErCq9Plu4lwLb6jOXW5DxvAlNcPePuGUFJpLSNCMBcI7U
	oNmHbNj/5/jfg9Sun6ogoDPAIixsD5OCgRrhpimD4dezztdvWM5obu7MJ6j2DAm8BCBBTlZ3guI
	fLJxpLj5uDdh7NX8V4Lg2fA==
X-Received: from wrwc2.prod.google.com ([2002:a5d:63c2:0:b0:48e:a11:b240])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5c05:0:b0:49d:8d2e:40e with SMTP id ffacd0b85a97d-49d8d2e0438mr1425299f8f.16.1794583655709;
 Fri, 13 Nov 2026 07:27:35 -0800 (PST)
Date: Fri, 13 Nov 2026 15:27:13 +0000
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
Message-ID: <20261113152729.837429-5-vdonnefort@google.com>
Subject: [PATCH v1 4/4] ring-buffer: Increment pages_read on remote ring
 buffer page swap
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, bgrzesik@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

__rb_get_reader_page_from_remote() swaps in a new reader page without
incrementing cpu_buffer->pages_read. While this isn't an issue now as
trace remotes do not use buffer_percent, add this missing increment for
consistency.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 6016d16d1566..ae33e64c7daa 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5881,6 +5881,7 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 	cpu_buffer->reader_page->read = 0;
 	cpu_buffer->pages = &new_head->list;
 	cpu_buffer->lost_events = cpu_buffer->meta_page->reader.lost_events;
+	local_inc(&cpu_buffer->pages_read);
 
 	if (!rb_page_size(cpu_buffer->reader_page))
 		return NULL;
-- 
2.56.0.611.g1030f0b940-goog

