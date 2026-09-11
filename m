Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F23493657
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141826; cv=none; b=V6DJjOpLd00pQhFAvQcYYJiCQe45uB1cc/ywX+2YDuUQ4AhTn9XrLGutPY9bBrZnOh5X99KPsvzGjxKIm3QM+JdAOMvG4cdaQNpvQm93hOgrzbquKWg3EtKUT4kzjPXuP9O73oPoHBwAFc9AsxMMcQ8ZP2DSHxilkLi9mJ9s2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141826; c=relaxed/simple;
	bh=su1nVbB/LmrwcbgIHEdASzbwPqD+yvkGmESjKpyOAkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K+BxpnOecR0Xr1F8IjUZSsqGyDxsTG2vbvJTTV1YsY4pP/1FG2TjkzqFx5eqwUOF7SyP+6irQDf5L1831VH6UqNKHhMS32BK2RzruxMhypUIvvRn+D12dPQtW3FOMbGbKXFih2NmHISvax6r08MhAQyHHNSD2FmOofiVE+KDbPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZghBkiK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZghBkiK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d91ded8174so10122655ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789141825; x=1789746625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50ghC1gu7q8PYuqZviUTnNaIyk8GwN9m0Bvx8/rbGZI=;
        b=WZghBkiKUuL3rKPB1nmAUPxFHYhVDok4E1qBqh1+VKb9huTtXGNSAIFEkv/OZXrUYv
         RTt2sQ17Sz8LTijork8YXK0FbmOe6wanW73zwJcXGJBpZli1SWnW/8Nv/kF001tUFqOj
         VQFCawVgReB1mvxpTu2bDLq/17kcrN3WuDjk1MKI86r6Mg6ukCXFe19eGKRoUal05K1v
         lZb1HVoVUezGqdiDlz868U4llnftK5OP7KnBnebkVaAHPJoV7+R9zN04lBHCP1zPAOQT
         gIG9ZvnHNz3XdUBnpd5V80S7DYYEntYxoG1ErJYQ5uocg1A15cAXRMcG5oT4k53OShKg
         rdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141825; x=1789746625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=50ghC1gu7q8PYuqZviUTnNaIyk8GwN9m0Bvx8/rbGZI=;
        b=UeIAsY+Uddff3wYQSl4GNOWKMN9qxlNLmuf5SRJepMQOscnPvD25QPLfaC6dMezUz8
         Bp5x8PMDDzCpqMmhnC7CJZBYscjhr7F3fVndC8pHTQAEf1ohqVdvoW4hct6or4zBe0pM
         v++nEkxKoXI0HS/eG3EuE7L2DpUqQk2KRYWaxoH5RLTnUodzgmjQvcqfW9ICISmQuQYT
         w6s8B57iKlFx9YhSf4E2Riw3D6nJje1jIjNFzVTZRjTV4tUen/Ut240go8yt+Q+5EUUe
         O5lt56Gy4dRvRnTMb7ZvguNFk1hWS9atv8XUdiYDtadglE3/yADa+yhbf3T0Pszu+W+v
         CqEw==
X-Forwarded-Encrypted: i=1; AKwUvBytIRoQUFXt6sH0poHjv0hXdEfkfH9b8wjvfLpatTga5Ho5Fl4p7yMWSMC8E12W8tGNV8Skv3gSP3RoIqE=@vger.kernel.org
X-Gm-Message-State: AFuF++laj4UK2QedAYpLgkeg1z1eqYs//hv8Fph97q7HZGhe2u08wN7J
	eFFkDtbM/NmSfjDgSq5gzT/Gw2nhwpaoxgGnWUF+4SLOIA5PMG/8PH9w
X-Gm-Gg: AYBFou2BYgK6Pn52EVETklr6+3Y74l7TdXN0d+3AO/7vDga9BFCkkWYgTI51mx95PT5
	CkcQUdSLpsfMiLCJMAKkNyjWJ20a7qyJ0T2fr1TaB8iQpcOTKPQpkYYZwwL1jaM39PrXHE18i30
	cSYheEia+iIH2PS/1aECYekeylDl19haz7ueOzXAtFIwxBovZmL9H0AGV/3Wf762CjvTKppxxsw
	wcVmzV7Pue/EAbGSPQOm5cEpgugZJ8shTpJuRb4zI3vi/rEXM697+igiYp5ZdQSq0qyD6GKiHll
	erv24SnZiM6FNPoQpPHCXt8zIVnCwduz1UTMfFY+kwbvZxl4fG5zI1P/nzYfWnDfvQRq80cUUUr
	wuRCCqYokB4zuBUl31RHnRlrN358NR5vmS/G8RJ56GUkV3MecHHOR0iVf4kEIgjZHlhsd2VoMSN
	Nn/fxIKrdF9t4JL/yRZFvy8v22YCHOMgwR9WxdNHbOAhcUHJ+mznsTosKi7DOOAPP1eTUgkwphc
	ifJpxsbDA+J9FWbN0j8sp8iCBa6zpVYksdPPU8=
X-Received: by 2002:a17:90b:4a8d:b0:39d:8222:6436 with SMTP id 98e67ed59e1d1-39d9bd8f51cmr8027254a91.7.1789141824694;
        Fri, 11 Sep 2026 08:50:24 -0700 (PDT)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcefb6sm13634895ad.56.2026.09.11.08.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:50:24 -0700 (PDT)
From: Xiang Gao <gxxa03070307@gmail.com>
X-Google-Original-From: Xiang Gao <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vincent Donnefort <vdonnefort@google.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH v2 0/2] tracing: add ring-buffer memory usage statistics
Date: Fri, 11 Sep 2026 23:50:15 +0800
Message-Id: <20260911155017.3377254-1-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260905112732.3705405-1-gaoxiang17@xiaomi.com>
References: <20260905112732.3705405-1-gaoxiang17@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Patch 1 adds:

  /sys/kernel/tracing/trace_stats/memory_usage_kb

reporting:

  buffers: ...
  snapshot_buffers: ...

covering the global trace array and all instances across all CPUs.

Patch 2 adds the per-CPU view under
trace_stats/per_cpu/cpuN/memory_usage_kb.

The values account for the full pages backing the data sub-buffers and
reader page, plus the cached read page and mmap metadata page when
present. Slab-allocated ring-buffer metadata is not included.

Changes since v1:
- Include range buffers in the accounting (Vincent Donnefort).
- Use READ_ONCE() for buffer->subbuf_order (Vincent Donnefort).
- Keep remote buffers excluded.

Xiang Gao (2):
  tracing: add ring-buffer memory usage statistics in tracefs
  tracing: add per-CPU memory usage statistics in tracefs

 Documentation/trace/ftrace.rst |  15 +++++
 include/linux/ring_buffer.h    |   1 +
 kernel/trace/ring_buffer.c     |  41 +++++++++++++
 kernel/trace/trace.c           | 104 +++++++++++++++++++++++++++++++++
 4 files changed, 161 insertions(+)

-- 
2.34.1

