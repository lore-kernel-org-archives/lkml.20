Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A4483BFB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990256; cv=none; b=K+te7B895H6i8fZeIA5jI44hvWFpFwIjeuH9LTBUt3ylJ+IUnKmaqTZwhqkojM7Y2TjcgNWczDGG/3zb21t1auqH251Iv//AAFl1EZkIA9XM+uwwmDJLQmbuEM4rcAJTRnwvafMEYiEw6q2NEukZ8Zt95cvYFgDzmOaGgr6xT9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990256; c=relaxed/simple;
	bh=q/WfhphlCMj5uksPDXAHSWb83jP/AqFyp82piIW5aY0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f158bb5XCspmiMTNON/A59EUN7N/HTXyRJIlaEE9yuNe01fI1ox+inSYzRFRQQmvPhUB8eZFwg9DSaoU0LcmFTILZv20XYBeer9Ipf/kjXQUfdadV8Gix9gqbWpCnq5IZ8MFYt9goJir6bmwWQ8tjhO5xi1MU2bEuLa7vyjn7Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CckTPE7e; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CckTPE7e"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso2540607a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990255; x=1790595055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4McwHcWMLvbv6Ny1SKzttwDu6xFAoJakDC7CkO+B44=;
        b=CckTPE7e5A9rwUCk7piYRwiRF00Lzv/zweZrMo0TMiF8MUVFkghqWOA1C0AS8fFhDH
         KtPXAlMlz/7co0gTZ/sgvC2Za8bYlbV+G45JB7yvHa7cKJhXFNhuyEH3yQo+AiLzCQ9q
         Q8ykl2WF0P9AbKoQv6AIlYZ6vhAyab5ygXJmYv/fMTWrcWYSY6DLvvl1Evc+cDZkf3Oo
         IXDUCN+ertAEnUdOLCA2heFCNplYZomcM1tcWYkDIr2te9TVRJ4sXc2ELlqTYnlp0x3O
         5+lgvzSBnHqsQPNzkMtvVHvpwzga22++E6wNzGAmcCH5esmDRrpmt+usaddYOJsZ14n2
         KdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990255; x=1790595055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q4McwHcWMLvbv6Ny1SKzttwDu6xFAoJakDC7CkO+B44=;
        b=EIINRbsipJyvv984Ji46+GPw1yv90i+74vaigX/8Jhqy049vcwOXQifjKJzwtwLFG0
         QfVuMzcVPmCOY/hYLmDrlUws7yPmtODeMlPnxYiuFunqAdsmajUUCX0NFCBTCesNUSLB
         QbsdkdunlkHVU9RjqbGX7IcrdVrbhbQi32ORvBmCbRpFgDsfjBg6po2ChCfH/65Aleik
         cKsyNd/c08hHTTgKE1mIoQq5bOP72BOyT8GES2YcMQ4CGkASWU38iIaNrrPBx7XjBuKa
         1dziT16RQlMc2+zmWmL/P+LAXGuU4RSSs31oE/VTRdgv3vvsfY+Xd5SdNo5foDj4xQzo
         XVrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzesgnY36FvgdsSBnYUWITwwLYZADBxMetbx1ffXpfdckjTYTcER3knwfOsqpTL80YCvaCi0RD6vpr15No=@vger.kernel.org
X-Gm-Message-State: AFuF++kRuH+N0vqkJy5pcuhLUL4d7tXYAm/EELkrq3BqsGBqPCaHblPT
	NGJ3uT6ey0SWXx26/6+GIjVf97bBJuFfiM+QS2qeW241NhkEl22tqgcS
X-Gm-Gg: AYBFou2ecVH0+O2G+qSlEMIvNY7S3/iiBiyL2egQdBk9LfoZN+VgQN1XNss6k03Wt0v
	vrzx7Rylf7RPPkT/YzFocRL+ql10Il5xwZkyyI+j0DdRZ0PgI3/vfOH3R3vTSW0UVOiY4GGDJ8d
	G8Ltu4VcyPb+ef5NTOpLb3k/ppPKuLSCo3Vt9LC8ibgV0OTL50gq5oNfMPOW/WvL+VcG23GRl42
	inb5CixGT5JbrYmuHbWyjsoqQuG4VpjcUQDeyYSZgk52GPn4UTHj+rHeKE1XBGLs/48cXDOV/ZR
	I0QZgkEyHK7Xj+dTuci8UgHG3fe2kg4TjGvAZ2oHCejR7dK2Ct4o9SEcloAlwk+boziotT/xTXM
	I/z7pkyI3lh4f0jB4z2pZGygp+QCyhLfAZfY0FsC67gsjXZEXR9NzXJWvRYiJPhB7gtyaEloopm
	t0hktL4XrX0Nj8c1hPIO3hHIxyzDOF2DpgaZsXxkLu9PUvIsjzqpmPSV/ixYipD43JueHcNgU3w
	XKco35EKwTbOsQt0wi8WQJAXXscMG1rUXcA+Xc=
X-Received: by 2002:a17:90a:d40e:b0:39e:6c6a:656f with SMTP id 98e67ed59e1d1-39e6c6a6787mr8776523a91.50.1789990254542;
        Mon, 21 Sep 2026 04:30:54 -0700 (PDT)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca86d83sm14003444a91.6.2026.09.21.04.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:30:54 -0700 (PDT)
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
Subject: [PATCH v4 0/2] tracing: add ring-buffer memory usage statistics
Date: Mon, 21 Sep 2026 19:30:44 +0800
Message-Id: <20260921113047.1152602-1-gaoxiang17@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916063322.472172-1-gaoxiang17@xiaomi.com>
References: <20260916063322.472172-1-gaoxiang17@xiaomi.com>
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

Changes since v3:
- Check tracing_disabled on open and during init to avoid a use-after-free
  on temp_buffer/tracing_buffer_mask when tracer_alloc_buffers() fails.
- Use READ_ONCE() for ring-buffer fields that can change concurrently.

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

 Documentation/trace/ftrace.rst |  15 ++++
 include/linux/ring_buffer.h    |   1 +
 kernel/trace/ring_buffer.c     |  41 +++++++++
 kernel/trace/trace.c           | 160 +++++++++++++++++++++++++++++++++
 4 files changed, 217 insertions(+)

-- 
2.34.1

