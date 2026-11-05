Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887353;
	b=MnY/+npOlP7cAyuEeVJazOfTLzCcdPmB0QydVyQ8ESjl4M0xKQV/jUSs4BEeSA1hasP+
	 AEnmMTNie7r9tLv9FHemULgCNKcFXhfY+mOcht08j0LEleoy5pUQKGFBP+HmXTdSTWxR8
	 5QcF45KP/TbD0PQbJTdLqOo3/1C37Q6TxqcBnhbCAsJfF4KiD5KwPwXo4AMiSblrhWfCt
	 EkCdxpJz5ftmC4oWnYXXxECDn/L/P0WiZzr8kOlWK17sTcoLPNxXd8D24W+qHZ2szD5b/
	 pCXQf4ZwoPen+1L6ZxoKnnyMYXx0ox282sW06LABH0ACOT0yG8pRl/HbYv1uY8uxoYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CsA47jlziSnaFpmvT7xQoqdEKB3PsFd0BRY4qsHG+7I=;
	b=Z7oFagb6QtV/1hp6bPEaZxLu4JBZdS2/EYeIDJadzfDu08HIjHiCIta7wW/rn9nSbHUZ
	 2M22ov7TQGxFfknW3NULvfqPMAEOg661MJclOcSJ4XZCKtHh5urfQvrP9EMpgIvZOmMtb
	 E2jtK32+vrd/TY0cyPNS/Q3pFFiMGfL1Mx7COh2uLo5uB7IYGGPB1jqTt1p/jhSlw8Kxo
	 +vNTRC5dBnz4JwAhrC2NCT3qJQnjy91H4PZVfvdt7WSsvBbU5Hb9HRMCLrIReiIUpz29t
	 vdXPBSmfVcZwxSj4wbTnQ8wyBRfL8LBW1e6FdnpoeIl63AaiFOJnhFfafmX0PMiE6zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6mgw6v5;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B3C606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B3C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6mgw6v5
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36661f953e4so2640946eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887352; x=1794492152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsA47jlziSnaFpmvT7xQoqdEKB3PsFd0BRY4qsHG+7I=;
        b=H6mgw6v5CH/UL6jnl0LH+IpMHbKEAIG99n5A0BuqDhF/ASRwZ2uvQJYncSiGOC+fIA
         /RBcbRsOTGK+L2ZceiuKoNNkIKqW1fj3itD5dWiXLVyyMNB13+54eUaMrdA8GDvVTYm1
         AfYXMEQs4gG8aRha0p/7CBA+yRlqgXlyB0ESkwYOjmf6SJA1uhdYUeLUXQjFxXjsrvra
         nnCDNZYifiQPD0dNVXR6FxLh/axGxqc6irQzaog9+nJf8V3S7lfaLEJ52/UgxVHIHnVs
         bi6UWwkXFcIpt9szZjlpSC6nmH7P2EeLN7nmvgMo7QVGWvaGTmY9cgu8SWx7D1lCeCLr
         wxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887352; x=1794492152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsA47jlziSnaFpmvT7xQoqdEKB3PsFd0BRY4qsHG+7I=;
        b=vWsbTlyGyL10pddP5HxIn2uNJmToYENopbgg00WZR4kXuOnTnEFMhn0s/CFidvR9Q4
         cYkScTXZMXsm/lgzrCwoFofJwdlmAMY7kavFtk3is5ibV7ny24GMY55JvCRhusYpgrrw
         GY/8jA6TmYrE0MwJ00B8ezM+r0MviwQPFRyAl28jOVXjwQx2n7YshY88YQvskHATohh7
         wUXRbxyX6G2Jw/7+kEd06QN4aS7pcX9GBeDLNk0wMaE67UAyU0GmhZnB6HyBmMmDVxNv
         kKRp6tDL1Ao8g8oIoMZ9NwJuNzrj1r15Js0fcJIdPtjRFIkscd06+MXNxWbpITrRIcQf
         iunQ==
X-Forwarded-Encrypted: i=1; AKwUvByKlWO5Eh6/0OXX7PmdVgIy30WXxYeC+yhnYbgtIZ7Uk1sh5nOen+nyBHUZGybTWBbEY1F9090rVQf09Uw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XhlbVUIFSqK/oN5/lw1e9bKvUp7OXFLqYFgsgn5A78g9E5jFy
	Jm5lkc9ItzxytLBI8UEvuisg++/aEdy8L8PPomFg9okdTQeuWOc0/Sv/
X-Gm-Gg: AYBFou3xO2HkZ/n3ftl0ipbK5UVngYK2emkHF55g6A/f2RZnoPSBGp9HXnIvTEE35r6
	l0w2HPHU2I3+llr19LDL/hDKOJA8Ijd7xqEpvqoX29Axo4H7/3guCalRwefPtf5Xd1YcGsNHJOH
	C25brehurLQ9wABnUuZDxgS/X6pk0W/qv920h1EVFUAD14wn5KT+rvYInZp0y7ury1CMJM6BL82
	Pg+WZ/eraK+EkwLcI16SH87p+3IOHyrqQXobVDqKep7eQyFgY9mIgejzHFGvcihHGoHFo1NlOi5
	//GEa+9XaYtpjQpPiPbeZ/ZbREF5PeD4H4Xgxqk9RCREZ74XfQ1gazqcKAXbVA83poK0BoyhNm9
	yk5xxGSoYbOIvgFm6bniL94kRPSEsVEMBIpLv/z5K2b3suL7Fpsz26V800wEj+t0hb4bE4Ju/uH
	F/RzBmTiPTyVRPUh0Xks7mvZYWP6ImAfFFyF/HwcCBs/RB0jf7GND9X/10eT9jgbpg+n0Qi5dQ0
	6gAx48UCiO7bDxiZH1TxzInAbbnVtQ/tcbDljdvPdFw2SbBheqhVm/CJ0lbAoLk0NJ+eLUyXjur
	UQftfyhGCR/174DbQXmH+vvBRU5LfXogh1lDOTSquhA7b3eW8nJ0XUdK5s+/xWGpWoLUQw==
X-Received: by 2002:a05:7300:cc93:b0:36d:7ec1:f38a with SMTP id 5a478bee46e88-36d7ec1fc14mr4539748eec.8.1793887351058;
        Thu, 05 Nov 2026 06:02:31 -0800 (PST)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm20969616eec.24.2026.11.05.06.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:02:29 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
X-Google-Original-From: Xiang Gao <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH v5 0/4] tracing: add ring-buffer memory usage statistics
Date: Thu,  5 Nov 2026 22:02:17 +0800
Message-Id: <20261105140221.44614-1-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
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

Report the memory consumed by the tracing ring buffers, rather than the
usable data capacity exposed by buffer_size_kb. Android low-memory
diagnostics need this to attribute the memory used by tracing when
calculating lost RAM.

The buffers can be spread across the global trace array, dynamically
created instances, and snapshot buffers. Userspace currently has to
discover and sum every instance, and snapshot memory is not exposed by
the per-instance totals.

This series adds:

  /sys/kernel/tracing/trace_stats/memory_usage_kb

reporting:

  global:
  instances:
  snapshots:
  persistents:
  remotes:
  total_system:
  total_carveout:

global, instances, and snapshots come from the page allocator.
persistents use reserved memory. remotes are not yet reported and are
always zero. total_system is the page-allocator memory, while
total_carveout is reserved memory that was never in the free pool. A
per-CPU view is provided under trace_stats/per_cpu/cpuN/.

The memory source is split into system and carveout only for now. A
finer-grained attribute (host/guest/reserved/device) can be added when
remotes are enumerated, since guest and device memory do not exist in
the current accounting.

Changes since v4:
- Categorize the report by buffer type and memory source.
- Make ring_buffer_memory_size() generic so it returns a size for any
  buffer type instead of zero for remote buffers.
- Skip the backup instance, whose vmalloc memory is already accounted in
  VmallocUsed.
- Rebase on v7.4-rc1.
- Split the documentation into its own patch.

Xiang Gao (4):
  ring-buffer: add ring_buffer_memory_size()
  tracing: add aggregate buffer memory usage statistics
  tracing: add per-CPU buffer memory usage statistics
  Documentation: document trace_stats memory_usage_kb

 Documentation/trace/ftrace.rst |  22 ++++
 include/linux/ring_buffer.h    |   1 +
 kernel/trace/ring_buffer.c     |  37 +++++++
 kernel/trace/trace.c           | 188 +++++++++++++++++++++++++++++++++
 4 files changed, 248 insertions(+)

-- 
2.34.1

