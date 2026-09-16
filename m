Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7A43CF034
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789540411; cv=none; b=pHwNgJMrc6UBPAxqHPN3K14nxJRou2BZ9i/YRprLfbiiIyk+0CjBkC6ZWpRA5WWjt/fDLGMXv9zrhE5yxU/8JbJsRtnPL9Ezmt8jprwHzDkf4UikrN+vqKmQz7kkPiaDYpJZsldIZJcyzCXgdtWk5Qw93yyI3oWAI7V2J6EEELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789540411; c=relaxed/simple;
	bh=+Ywr8dNeYt04JAexQVPvB6K7SKfbN+RvvMKisuvDrCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GbsiXjaCUlt6QNVg4wyocNmsiMbay2id79J19YA5WAq8ZfwPVCiIrnxGGgWkSG/gZIEyMmd7EPl69741kNAEEvW5zbumlY/3TdZElhRqV3z9+amGlKFDslw0JXC5DPmXQB46G4vewUZ/Ij4aNnat9PWYq0WavOBSYgS0BAyxS7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzCfH7qG; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzCfH7qG"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso385470b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789540409; x=1790145209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zx1l11ls0EXmesHaL//CT+u8UTaRnoRzDQ7z4nlNask=;
        b=rzCfH7qGc5BLL049hAcUKZ3SltYvZAjJYPRF5h8TJvugtQYmrhOh3eicEVSHbi2de7
         MdcQhX2urUYWtlZ6cOnCBbihD2dfRK7cWGL1/0BrbbICAjYoXS2D5lbkLn2gK1FDBmPj
         Jova3zNte/XdkwpWNEQnf/9fHyRKjxVCChnMnLUWlRkAGTEcMxDwXTRv7N1BOwBFsOsa
         ELevlpGeTw3byLd2bvUoXjP8qDVq2lg13uiNhpm5dXoNg97yqTK6DhKj8tM6uRlo8wu9
         oa4MPiV2AvU8kCJC5PhDTeMez/+1w/iIJnMQ6Xd6H6gPaiUwVRbFkoE/G8yKgDBqfgoy
         uJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789540409; x=1790145209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zx1l11ls0EXmesHaL//CT+u8UTaRnoRzDQ7z4nlNask=;
        b=boo2l6EIQAvxu2c9BZ6x70g8nylWlIYn+/md8HsVYvLrh45CWx8NJkxTnrd/uPo3Zb
         dXUVmqrLwmYaPw5Jio7PoHSzTz+b/Al5zKSnD8W2DxtosHNHuG4DfBdag9JEf6Up8Ag3
         75lhR8KqShZtVxvhDs6W6uhYLUkxyEN5SFHQlZRvVYVAdFQfUvNYLdygat3vhPjMF1Hp
         3e/BmfbZYWOEVt/7fHijq+ifaYEL/vvyVFUFzgx+nyQ7ytU9d/jmK5RKUKv0WsTtnKTQ
         s3uPkKRgqECwiPYsxC76pHtt8hXeTqf/rODboaz3jeyT4nxydgRxJk2NXM/RIbQQltvE
         qw4w==
X-Forwarded-Encrypted: i=1; AKwUvBzzdhdEylgXne1scDDq6I0uki1hZy/8JGIVZ6MKbd4MWRUefehaGoUtiuqSC01GkbtncorQW5kdyRMSpwM=@vger.kernel.org
X-Gm-Message-State: AFuF++myZW9bHa+FFiIkZWXICPE1FOiJm7cqTXoLBF4zuuLhTpn36q+1
	6qayEcd2jNGo6GmpxDpDmwXR5XHQH7ApKnqIP7ar0+lR65clKDhdxAVs
X-Gm-Gg: AYBFou1z913ln2TCcKgwfdHZumHMxrSpMhVJ4rLdHdLcCqRrEVlRt9l+P75mAT9res/
	fW00CFgYyZaZfVaWhlRGZMiEJR0sFytzCEe56G4L4K6ZmSZbx9IgF5r3eAYu7qgjsenkUMaalLC
	pjsbTjS25PRlrrgzbmZPaSMwQzWouIIwARXzaAtDHKp8WvDALvP4iBlDHBzY1Xht18qyr/ZExUS
	PykOO6L2w7gV1V5mY248Ry3gi15pp4hgeHSvjCSB3qdCA/A1FNMHbk3bozlDLjbna1cw/t2rsKg
	K+5Ev/0Zo5+rObk83KJiGD17BWqIKbxUlX/7lrdPccuXEa5nV5ni+xMMCUefwnR1/5BITd4AnGP
	/h9nWrOLyPygfluNr+7p5e4T0PNJicmWgiGCEu3KWMDCRqAkaGSi9d3U7ekkIyhiLZhktWZ3vbS
	tljFu49JnxM32KvnKsWuyOLaYs2wb1cEIVl1YSzizKi8xpThS9QocLFW1Ika6Q538dbRPJBIUdj
	MuHJJtUHRbVfd9vZlHhHx+UXexANtlbv+BZ1nj+0Ce97wzj6Q==
X-Received: by 2002:a05:6a20:7d9c:b0:3da:5b4d:a89f with SMTP id adf61e73a8af0-3dd5f7fa951mr3440114637.27.1789540409280;
        Tue, 15 Sep 2026 23:33:29 -0700 (PDT)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50aba87basm1005550a12.23.2026.09.15.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:33:28 -0700 (PDT)
From: Xiang Gao <gxxa03070307@gmail.com>
X-Google-Original-From: Xiang Gao <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH v3 0/2] tracing: add ring-buffer memory usage statistics
Date: Wed, 16 Sep 2026 14:33:20 +0800
Message-Id: <20260916063322.472172-1-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911155017.3377254-1-gaoxiang17@xiaomi.com>
References: <20260911155017.3377254-1-gaoxiang17@xiaomi.com>
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

Changes since v2:
- Account for the bootstrapping temp_buffer (Donggeun Yoo).
- Rebase onto latest mainline; adapt to free_page becoming struct
  buffer_data_read_page.

Tested on arm64 QEMU with global buffer resize, snapshot alloc/free,
instance create/remove, and per-CPU aggregation, all against the
baseline that includes temp_buffer (3 pages per CPU).

Xiang Gao (2):
  tracing: add ring-buffer memory usage statistics in tracefs
  tracing: add per-CPU memory usage statistics in tracefs

 Documentation/trace/ftrace.rst |  15 +++++
 include/linux/ring_buffer.h    |   1 +
 kernel/trace/ring_buffer.c     |  41 ++++++++++++
 kernel/trace/trace.c           | 118 +++++++++++++++++++++++++++++++++
 4 files changed, 175 insertions(+)

-- 
2.34.1

