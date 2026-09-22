Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3023047D925
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062196; cv=none; b=Ank87sCz8/leqogcOdwLw61J3aUjXRG9CjylNBG6yN/WbVAt0WhiNV9wgywWxhnP5yDH79oYss8xl+baSbPxq+Ta+l43k9UaW9LqCD6wIQUjxcb3E8ZQT/EJ9BaIyjuSpBiVoBWt9tqCwyt6BDU/siC025WXJK6LuYxAs+tYGpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062196; c=relaxed/simple;
	bh=wBmoW6SlI+DC5Zo7nszZiPh4qcmH88blCnLCKOLq9Ts=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VqmSmQ6JbUQht6hDTGIrYUlWykR0lvde+6aPCIUfSxgCcP6lfoDBxlQv6yVn5tHX6lzNtKus6yY+/ZTEOgwSxhfORoib9KrjN7vjuQdCjU48TG5odKvagHLL8HBx4qqvdxjFTmU2WCilAPk9zXclD+8EA+uQ1ddmzk5rlktOjMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T27D6m2C; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T27D6m2C"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c293bac1764so503075866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790062193; x=1790666993; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/74aIvxNYyyoJvw2o9e9799tBrQw2tGF0+8eTzGM4A=;
        b=T27D6m2CjyhSVbxHZbpuzRzT0ek/8rh9aFF2lyxmRcD8T4Kbep1V3crRDLbM/W7fJG
         MjpzHLyu1GEb0ulQfm1l00K59yIU2LpvdDyilHbTqLYKkIOMswnaSrlO181qVnRO2XR8
         UO9jhpvv1+BRwvuU/5vLIV8vdHIe//wS3oMh/k9q+eWUQEgREVkRFviBnKBZ9e9jfJRf
         yC6ho4d/FFHqvO7eAvTf9+57+b8q6nxd+uAhYSCbCvG5Ai9pJO/Fy1tcK7dY6GF90yu3
         piV2QZAF/diCHrOLXDxpJnGJ6F6kW/XcKUSniL3t+dCUq/ycRuMbyj5eycCtn8vCdmEg
         az8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790062193; x=1790666993;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/74aIvxNYyyoJvw2o9e9799tBrQw2tGF0+8eTzGM4A=;
        b=1YfQG9ourIB08jmTy7AUwHyBGQFE0mK9ccmb4Ce7GX5ZwQRgxnkmt71pcxXTsqR+Fa
         9FW33kPj4+Rgn9m8HZ43pXPXv0rb7rMBoEeGfFpIq0hvl4Qbxbc8XRHo1d8L1uLDyqka
         hJ+AdsG6Xu66ARI+Nu6epNkinh7G5ACjxyntmeT4iivuVqk5tsqZ0Ew2GSDvz80pior+
         RkIQsTG5Ccuuwulw+6L0vsrok7j2AtMsnPWRO48tS7X+LUmctPIIUO9cDS92ZxB+nlWm
         HKYuSkIFqFWaSx1QbMSnGUsOX+P4zoKmVYWKirZV12jRJ75Tr4CAXeA0mfLvV/BAestN
         MQvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHPX94yymL8ZDTLArRg//EeboUra1tAwUD0QU+It3Ln0aDbsbqYaEKwHObfX9pGWjVecs1jYAxwIDxxmg=@vger.kernel.org
X-Gm-Message-State: AFuF++nDqWXxsfVp0yWnBWKhIzEsm29+JeZ8MAT1JruaZBw0qO1bjLDG
	XjY/ggq/3XxhDN60okuQ3ng0Htx6UWRTpI8BlkcMV3lJEJpYwOecRupPL5ONqUa+N9E1WFVIUxW
	TWyaS7i+z/XfspCwP8gkq1w==
X-Received: from edbay21.prod.google.com ([2002:a05:6402:2035:b0:6aa:8682:2b6a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:20d5:20b0:6aa:734a:a095 with SMTP id 4fb4d7f45d1cf-6aa734aa1a0mr4992621a12.44.1790062193331;
 Tue, 22 Sep 2026 00:29:53 -0700 (PDT)
Date: Tue, 22 Sep 2026 08:29:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922072944.1281427-1-vdonnefort@google.com>
Subject: [PATCH 0/4] ring-buffer: Use kvmalloc variants for big allocations
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Several allocations in the ring buffer code scale with buffer capacity or
sub-buffer order and require high-order contiguous physical memory when
using plain kmalloc. Under memory fragmentation or with large buffers,
these allocations can fail unnecessarily.

This series converts those allocations to their kvmalloc equivalents.

Vincent Donnefort (4):
  ring-buffer: Use kvzalloc_objs for user mapping arrays
  ring-buffer: Use kvzalloc_objs for remote buffer subbuf_ids
  ring-buffer: Drop redundant ring_buffer_iter::event_size
  ring-buffer: Use kvmalloc for ring_buffer_iter::event

 kernel/trace/ring_buffer.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0.1082.g2b9226bbc0-goog

