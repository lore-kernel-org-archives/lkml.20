Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492891;
	b=y0bJGI+PWsP31ATuxL4xBfmBBmgxfSrB/cYGV6eO39MpxM1caGAr/UU8wn2rc9G3WruC
	 vWFEDsoc4ojvZFriUM3prdXHHIytVPOxXVeFTpc2gQLJCrrtn9e3ugjMsbs+XK+CoIzLW
	 Qj3kRNmAggewxz+7RiQFD6odcsghFwwVrnoTXj2com7HmSyp2RSXQ/+xSGFOjW4vLSlL7
	 9ds0fteBRrwnixUcFSxriBKeT0S9I6yt80KJZbSoJx62mKL9mqvAEEuSMdu6E1aOb64qa
	 sP72I0lSGM8c2WgHIksfaFcPjE5qI8sciCDVu/oFZzeh8qIibqTXqsNA7NHhEDiMFEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nUse+twsJnxew4r6zwWfOwbMG43DUEVmCdyLipFzEcQ=;
	b=mxRRNfk5pWNDFA+hO2SdFk2Oo3T9kX/tXSXMIVOIUxqPz4DrKV6j3qoOeYKb/5w7CeZr
	 a9nlBVHctJL4dZLj9aAraN3MedSnU6sFW5aAira3RDBH9/eS/9Rhp8noJw+k4rXmpN777
	 L9SU4Awz1KYjxQNXvQ8k8mXXb8BaHZtEsVE61awfwHc+Eql/YpaxXw563L1rvQHDX+z2K
	 4LeJrtFLwAlvXxZInf9Q4C8QgxAivRMWIhSf/6sGjM3O6VJ2o+SE7JsEzLmyeI9iB+RRG
	 sFVyiNJ3dlmwg2PNL37eh65u4S3YfLcAQG5H9TD5JhQuDg+7JwApghVlFlKjwlkEdnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a9hYkTs5;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3563F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3563F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a9hYkTs5
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4915ba023d4so3126294f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794492889; x=1795097689; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUse+twsJnxew4r6zwWfOwbMG43DUEVmCdyLipFzEcQ=;
        b=a9hYkTs5Id401mmX/DwsMx1Ln1nZfkKQ2lK00AMAqT/GMbaGQ/Tn68UaHa2BSto9lB
         Tuhuk02Nwo8hi7mFjFvNax64TTdXr6HJp+4RSZAuzLnuJIaBeISRu+wdkOapRKWuYnDI
         4Ao8ZUPby2vVR+6Wr6sUr1nRaUkODWxKSPXUTctovN/8rOUI5+IA/qBRVpx9j+84TLj1
         g5Bkx12dIWKDwEleXyHPSbX52zxdgb+l1Np5+RiN+Qra7h0j9rL5vTGQ/ODzTEOYuvMm
         aU8kS7gv2O6Qx8pbdulb2Vft2f1Ye6hOJfAywqhWpzksTMBMhSQrDGnQp5u203MqUVS8
         kd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492889; x=1795097689;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUse+twsJnxew4r6zwWfOwbMG43DUEVmCdyLipFzEcQ=;
        b=hQsDmOvHMYio5qI5M3L2ggCHmYu3eo7jArj7Ej5zua4AqLqTEooi4nyDpO89bf9GiD
         uJKyIso628foKGEIgAY7NssGzs+q2mlaylM6FH7kMsBA+vx+tVXjH3Zm/tyzjKwTv/II
         w8g9o3VoXxjU+O9S+KIMuPGKANLJiuTyhQXh6kuSPlLMY+osF7pLzKN12Zx77uZZ1VTr
         xYFzn+YrZxmqefa7FCJ9WoEq1u0HTEqR/ZZ5uC1W3xY4/b/wq94ooSS7LVtaHj9s6hsr
         F+sYsiRc5grYXF0kI5SYA1qcvxee+IvU5oQ4+BxhFhaYMdQV/epY1WPJuuWIJ20XonRN
         svqA==
X-Forwarded-Encrypted: i=1; AL+hErFjexGw9ogLF6+MXNMYxanRryX9ZNqt3fl5Y4mAs7qi83qkIRlM/M/QMXqe5N0X9rkWtzlEgOKqDzHKLwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++LzNAqq0xk/FNX3lZcMQEZwXD/Iv4uj/4j74zbhxKz7un6+hF
	mXHCT7FaIqPYoIxh4ZBlIwDz3F2REXhkIWQ1lgowf1GnoxIyLtlQx97DGGb4jbzl2DIHSNCidM0
	hluzjIhmX7lNo7DlCByMEgA==
X-Received: from wrvc14.prod.google.com ([2002:a5d:528e:0:b0:48e:5d2f:1d09])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4818:b0:48e:6f76:de9d with SMTP id ffacd0b85a97d-499c6f8c3c2mr9735852f8f.46.1794492889329;
 Thu, 12 Nov 2026 06:14:49 -0800 (PST)
Date: Thu, 12 Nov 2026 14:14:31 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112141440.3050124-1-vdonnefort@google.com>
Subject: [PATCH v1 0/9] ring-buffer: Enable Clang context analysis
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

trace_buffer::subbuf_order has caused several recent resize races from
unguarded reads outside buffer->mutex. To prevent further regressions at
build time, enable Clang context analysis for the ring buffer and guard
subbuf_order with __guarded_by(&mutex).

  - Patches 1-3: Fix cpumask/hotplug races around buffer->buffers and
    trace_rb_cpu_prepare().
  - Patch 4: Fix a trace_marker resize race.
  - Patches 5-7: Remove subbuf_order reads from the write path.
  - Patches 8-9: Enable context analysis on ring_buffer.o and annotate
    subbuf_order with __guarded_by(&mutex).

Note: Patch 5 conflicts with the series removing absolute timestamps
[1], though both are independent on v7.4-rc1.

[1] https://lore.kernel.org/20261105202814.1350312-1-vdonnefort@google.com/

Vincent Donnefort (9):
  ring-buffer: Always read buffer->buffers after testing the cpumask
  ring-buffer: Drop cpus_read_lock() from ring_buffer_poll_remote()
  ring-buffer: Hold buffer->mutex in trace_rb_cpu_prepare()
  tracing: Cache ring_buffer_max_event_size() for trace_marker
  ring-buffer: Validate event length against rb_page_capacity()
  ring-buffer: Introduce rb_start_write() and rb_end_write()
  ring-buffer: Avoid reading buffer::subbuf_order on the write path
  ring-buffer: Enable context analysis
  ring-buffer: Annotate subbuf_order with __guarded_by(&mutex)

 kernel/trace/Makefile      |   2 +
 kernel/trace/ring_buffer.c | 350 ++++++++++++++++++++-----------------
 kernel/trace/trace.c       |   9 +-
 3 files changed, 193 insertions(+), 168 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.567.gdb80ae8cd5-goog

