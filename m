Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4077246D2DE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886943; cv=none; b=BDRKRnXYli+cbL76jOUWtXjD8GfuEBCBcPaJfNi3wEG0p/ZCmP8MgdhFcpTpd3eHqjnLVteEgRzM7Ax31GTuILVEquLpGWZ2JyiJTOyFUfmn24xDre7ivEs+Lh+V0FxXcs5Hb0S4de9yljLpFKjqiQ6sDHHoZ2EPg+5LfQvdFow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886943; c=relaxed/simple;
	bh=C8BfjpViw85E/iyEcqJ1wPVATcMLsyFFC6bR2LOaM/c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LEHWoMt4geL1uP4ELS6ChZ2jBt3iQE9oMJHf7XZQRGJO2EgtVOsazXoiLmoThsU1ntTN7wkP9EWd1yj9cB5pN2E/yMmLmY0h2AtvIfMbHtLLu3XefrYxmk0oBep2RZrKiZFK51bMm8vUyOUCXVsloS0JOG6d5ifrLPkk6EzNf5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AMVYmQba; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AMVYmQba"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1ac6663e1so4987615e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791886940; x=1792491740; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yK2XQkQu+EOosMMTSCb3P5XMSqXLDbl63bi1IwkGyn0=;
        b=AMVYmQbaAnqY5Gs54pwiDdAA4QdBCVTan+YaQjSoLcXAdgHKRfOI7jGPLRVAd+wDn9
         es7/4+kWIYmQRrRLAtagRYlQCeT6SzPkh8gwMrhY77vKjL1OyC3mNYt8RSQFUlQDzh62
         wnpZncQzIttYnxjvniZlIPKyd1JtBhWQ5oEdYZgJpG7xhnb4tbXJwdY2g5V/M6IMe3L6
         /l4scyhymUcNTXI3Yq4N/4sGKxJai5YbVlARUtlvpGyN76wqC3DyNTDTyy4s1YvAzLwb
         iFCajR6vIeHbWwF9d5l/8uUImWYj9oyFite5A9omBH1OZmYY07IsJ+GgrS2napU6XbKs
         Ti6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886940; x=1792491740;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yK2XQkQu+EOosMMTSCb3P5XMSqXLDbl63bi1IwkGyn0=;
        b=v5rvdII4tANqT47+Sn8jDcKGjyW/N6MkptFK8BkmI2/JROo1T5r+T0I1gGAE1nfYnS
         ty2EYdZENfv0dYFncXPvdR2zdJ1F6aFnWXhDa6CpPBLKQgj/8HYqWpu1Aa80gwOs1EZx
         QHNl6uFjbi7ny0XeDTdatOuYfRHtzPtwxIcoSUc/StqKc7NCbMwga5shd9uKN8bFpzkl
         zaf43XW6OvfzSs5Y1r59J+MR1T0KGPWClU62e58lhMDB9KSak/Uj1txHkG5gA5vBz3NG
         e6ODyaX3RoHmEBe/ykwfKVTxenuuBp4SCSKZ9cyIyVIT1k86VyKktzckjvCW5+lFk25r
         nDyg==
X-Forwarded-Encrypted: i=1; AKwUvBxywhvoW+g08Jucp9CB/XZxCTyO/+2vAB3YKb+aKkTCBJ8hDbk9qarKyttflbM2PZjZTMIgFrDBgSR7/EQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwK/J0sDt7haTnbmzwE3cyWJWkLZ7pwpVfbxNLmq/DVWE7+v+r
	BWEiFG35f5DbynxC4mR0WuQe+vCNb8ZblpJGsWyNR9ZfN82YNYfgEOLou6Vu7GZGcq8fcxof17L
	woMxOQ4UOeU2TG5twi2IydQ==
X-Received: from wmdd18.prod.google.com ([2002:a05:600c:a212:b0:4a1:96ca:74b0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8105:b0:4a1:775b:5eb2 with SMTP id 5b1f17b1804b1-4a18e48362emr230520975e9.13.1791886940372;
 Tue, 13 Oct 2026 03:22:20 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:20:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013102047.1488347-1-vdonnefort@google.com>
Subject: [PATCH v2 0/2] ring-buffer: Fixes for available memory estimation
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

__rb_allocate_pages() uses si_mem_available() to fail early when there
is not enough memory for a ring buffer allocation. However it wasn't
updated with the introduction of persistent and remote buffers and
subbuf_order.

v2:
  - Add "ring-buffer: Use subbuf_order in available memory estimation"

v1: https://lore.kernel.org/all/20261012163502.687061-1-vdonnefort@google.com/

Vincent Donnefort (2):
  ring-buffer: Skip si_mem_available() for persistent and remote buffers
  ring-buffer: Use subbuf_order in available memory estimation

 kernel/trace/ring_buffer.c | 47 +++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 23 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0.385.gd3acb90ef8-goog

