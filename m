Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D17379988
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607662; cv=none; b=Vbul8O+ng9m7FS+wmKOhAwdbyIUoqmsDh3fsXgRbU/ALVI07sS/qcMbJgYMzFjD4gUCk4iNlJS+xT9SyMR88BbG1azAGsUpe6poq8zXFcpTr0xLWe+oHZc8mr7iswnXRx4kxReaDydwqqaIuPUSt46Etx9/XQVHB3D8UIPD5bEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607662; c=relaxed/simple;
	bh=jOzaDBdr3/sMQdwWlV4kXUeidf5trkBy2USmz3olBYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e6oerH1jXxQUTlw8hQYEC2Gk5rG6jH/GGXzR8Db3jMOQmoyf4RfxngAXiIaVwVL8GZnEmLhuSUjh5NILJ1b5EMkfDh9CJH50mVsuyVjGLktliFS1mc605N9DV20DGvie16h+DPtjVyQg8RsAnnamDJjHeRttvcKYNK3YzyhhLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k66+LEjk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k66+LEjk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so1555241a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 04:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788607660; x=1789212460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEEm0xFIfPlvXoOjOJ7kdvGq8eNWj1xsAyDh5PO56Ao=;
        b=k66+LEjkiOmKQJdLd4OrUV9YqG/cfAMahAMGUeDe50MG9XxORFZe9HXk0kNJlz+IGu
         d4eRRZuKDSCt0u6YW1XN3gHiJSVIgOOjd/6KfjqHF02i+do4QPkoltcF67Y1S3DysEXH
         8yOoKJdq7wsSd7w3Tx/jNPER/Lh20COZUyNXKcXht2CWzVvtkTETn3a0Z/hGOVI8nUfe
         vZz5TBOKcdjL6+234fIWru3sbG47w5ABJscXIyf3rgncZZbFAJ1FWpv/l2+aBpq2XkSn
         48y4Vmbm69Aa6wtPe9owAE5837DgV941N/t2rafonKU5bAQpH51C8Vi13Ki+9mozlLWS
         rAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788607660; x=1789212460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEEm0xFIfPlvXoOjOJ7kdvGq8eNWj1xsAyDh5PO56Ao=;
        b=peJClr/QfMe3ohTEFy3EJeVj5QM51Uzp4LG0jUlP4Q7m/ZySbT/me7hL9LsRPEs0gk
         NBi3mAC7yaP5HiKM4wjqS+PAR4+i2lBBsqIvfHh08r68lD54+RXaOfMwov0TPCwMgPwU
         J+aFcqBUmxnGNrUqB+0dAoPPT+iP7Oj6z4Mkg3oiMB6f9qgoh7AmNsCgYZ7KdbnDmsC6
         W/xpxmZdTGo6EIm82HS3zS+wbEOQUt96X4uTea0PedG6F+FyM2KnhXpwjmqewIsmUKSp
         JC+JCOU12rXtTmHMoP3Yfynh7+H00A1OQmGL6/RtuIgSTdeq+3F5cZz5JCWZrys74bJ/
         o9ig==
X-Forwarded-Encrypted: i=1; AKwUvBxfTZvzEyj7cXAM5xRNM4OYfU8ww+EgOz0MJLWGxMieXZ0EJdfJTu/80jtrYIA5UBzKF16d/5aGw1DePHk=@vger.kernel.org
X-Gm-Message-State: AFuF++lTNevy+5ZneXIS1ehro4y8eszpNU5RaC0fdwH3DVq6b6Lx+9Gy
	dKy/zPh2gi0PYyN7S1n42QTgG2szWvoXjmei1a71K64AbTUWIVqxrFSV
X-Gm-Gg: AYBFou1AeqW1HoQGW8fVI5NFw7/YQHYBnmr4wqglk/vPFLVTZohrPEbg5SDXEG0UWej
	cKRAD38zNfuG2N5O67zkHtjH4G9/IooRpmE8OY75kBHP11P5ehnECGoTahRPvyp99vgqPC2VD2/
	zlB1A9273IjyAQOvqw9u5LBBBUbKjwl8OlwD31W0m5wqIp6ZK/UczsAvBGfUdck+3Wb+l3FBgKE
	dQS8VEGUqIHik9vPCCTu8VlDfHyVRtoVf29TTd7yanufwj6n2qOT/BszyEU5mMJvAZAlenrwMHo
	yZ6fZaKOmaV0k6cFd+kAzd7Ij5BnfwSEQCsd8lFmSVVJ4eczCNqX8xK79ANQUxig62XD6C7WSSV
	d2EOxKh1eY1H+sEMtdQdB0jZFb6ToeRnCiWYsihmS7ZzJfIbx9mPR64T2WWjAmtwcE2w3Gg3EMZ
	KkhXaVgJ8XB0TFi7KtP/bMH/rnShMbjBfqTP+GjsuVjGI03S2zzydwvWl418n2LhAQEbzad3PuJ
	L5gOZ+Eu1/xYYx6UPWPPqyLUP7X
X-Received: by 2002:a05:6a00:174b:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-86169578d15mr14988830b3a.7.1788607660096;
        Sat, 05 Sep 2026 04:27:40 -0700 (PDT)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e39a38sm2228779b3a.39.2026.09.05.04.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 04:27:39 -0700 (PDT)
From: Xiang Gao <gxxa03070307@gmail.com>
X-Google-Original-From: Xiang Gao <gaoxiang17@xiaomi.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Gao <gaoxiang17@xiaomi.com>
Subject: [PATCH 0/2] tracing: add ring-buffer memory usage statistics
Date: Sat,  5 Sep 2026 19:27:30 +0800
Message-Id: <20260905112732.3705405-1-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
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

