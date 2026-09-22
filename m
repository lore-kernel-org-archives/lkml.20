Received: from mail-pz2-f11.google.com (mail-pz2-f11.google.com [74.125.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EBE51AFFB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109861; cv=none; b=l1XmvzKUHodaKZeKkG4laYTZcUqvotbSgK2vOfxoJlcLkf0g/4Ax2ziM7O6IFj+uKXJTsOeDWpaJHoQ1v8vfcKGGXIxO4Sg6FRe1h8PAn0dTb8nP5AbI2FAYyhyzyqRk56YVAJheERAV7Nz2mXzyRi4/5FeRW2mqbPKGS1YMtcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109861; c=relaxed/simple;
	bh=CvPWprNtj2/h7qYd3ZKQiVW+cdulTxr3CaN7at07Ro4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qydcf8T5HOsZyK4+b3TPA/yqBpM0o6QFsBasJ/dIsKoRVpWct8yXp2b3kc5YJhhfaD36zlWNMlRQN9JuolUEXiZGN67LLq1feIF/34+76k635W4JXAtbMX9S485ohPSIHkm52jUjE4OZ0DNSLDJBSM2ZEpZlj9M3gtjAjpJ/82I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAANVfL+; arc=none smtp.client-ip=74.125.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAANVfL+"
Received: by mail-pz2-f11.google.com with SMTP id 41be03b00d2f7-cc1c2963c92so109111a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109830; x=1790714630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMpSTn93NNFEOpIjn813NWg6HwKgpaeEXImngFElSS8=;
        b=bAANVfL+RXtqnSbOnA2QMuo0fAQDAC98/9wUjefyttPpqXsPVWmh7OjlESXRXHbokY
         I8yfmpKqZnzJV7PssTgmWGNkG9LLhYXhfR+eFoGwG62IzdfM0sagVP+Hj39tHQNL1BFQ
         rkG2Eg+cyKQzwzJQQ9HMvdsO5fIV5sDRxz81j8irJgAhwx4fA5QNAfhm2gziWf/MjZlP
         Cz3YNLcFYRjRxKnH2B+Op6WWqZEwpl+6NUD0D5EGd+Mr1VZffwMnYIdSV98APmPoXhyN
         6s4erbfPcI8H4O8/pK4Bcweb6bM9Wf8RJUVQUa1gdi09otXZaH+GwP2UjXNWgd6JDEoA
         2yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109830; x=1790714630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMpSTn93NNFEOpIjn813NWg6HwKgpaeEXImngFElSS8=;
        b=ySMXrIlSa/ruu+Z1sjqSM+5SGn8R+TUqparJrBPTYc4zZ+o7H3okjfd9UjMCvoM7o8
         SQAHcMvQ9mqbAHaxfIAtpyfQgAYLI6U5XUEPOGpV8L7tYALZxr+NrbnKFTrs+YcDaweU
         Du6KUhnzoAbDLQtxC6rTLBVepl2l4CDP7QndHe50ljLRwAU8E98crrrWSPJkM5+dR1SS
         dAJ2UiTZN7e0D/PwfhZcNREWDmDNYyapaxVZtx/oTfb6ydpfR/gxuJkUcTOM4HZkv0sN
         9MYPuioQZ7wkklXICpScx33KaSmfRTS0MrFNRKidFPsesJKdq9vimtLuuwrHh9nlwTOu
         4cgg==
X-Forwarded-Encrypted: i=1; AKwUvBzGQuOP7vP0qjFus8qX1JAcwlJKu+EgFTniv22EdsQ19UVTXNIHYPEmjiwm1LtqgQ9pN487Z1Tc7klE2lw=@vger.kernel.org
X-Gm-Message-State: AFuF++njMi5sS9deEoTjNCHR+PMwskEvnldPow3IVU0eITT+zMaD4Vpg
	Y3jGlvW25W3p8RHAC6pfVih88G7urp1qjRtm+fO9FrrrdVYOZy7qSpLr
X-Gm-Gg: AYBFou17ola7ovcowKZH2vl09m9gVfi7PE2AAWPc9Xw67tDnB2pI3DkJgiXPXSOVvIq
	L3J4NWQoGE/2vSo0eKQkkuX1MEmy1cX5mqnSxDwL6ipFA/ebt9PCLPIcboJDcP3nBfKxSsVpnXW
	Sn5OxtF+wQkjA0E721c/0fQXv7o9PwAvQKG+2Lb1jVl2um98o2lkBb50LKyHA6c1N8ToBbs3a79
	fkBzJrTn2R9ZgMkg6YLr2MED1r+3SgsGbpRowJE0Y6nvC4sMczwfZ7JCxrZLbinfCWSfpnAde0p
	DOOfbcJ5G3tlJkDWP6uCKDxkfupXwRGWQJZiZzf2tFBZsik8BuA8qGPlxXqW70k98gX0SEQ6/WD
	78vTQtNwDUmba4SF9wKxLS+rCXbGpPUHGeEKqBEGaIjGinLsmeFZu8AfuvrhOhXEA1UgyIWWNla
	uKL9xfUqAS/QTEmfmGzNxbNo6nyNMTqn+Yr7YMEWFR2kuP8hUIad+/nlLxTQC7Qss=
X-Received: by 2002:a05:6a00:854:b0:87c:9094:b72f with SMTP id d2e1a72fcca58-87d1a7af70bmr703595b3a.12.1790109829787;
        Tue, 22 Sep 2026 13:43:49 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d4c483asm289145b3a.21.2026.09.22.13.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:43:49 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	hawk@kernel.org,
	ilias.apalodimas@linaro.org,
	asml.silence@gmail.com,
	axboe@kernel.dk,
	sdf@fomichev.me,
	bobbyeshleman@meta.com,
	almasrymina@google.com,
	kaiyuanz@google.com,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org
Subject: [PATCH net-next 0/3] net: consolidate net_iov freelist and DMA handling
Date: Tue, 22 Sep 2026 13:43:45 -0700
Message-ID: <20260922204348.717198-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow up on the recently merged devmem gen_pool removal by consolidating
the remaining net_iov freelist and DMA-address handling.

- move shared freelist state and operations into net_iov_area
- switch devmem to public memory-provider helpers and reject DMA
  addresses that cannot be represented
- decode stored DMA addresses for TX on 32-bit systems with 64-bit
  dma_addr_t

Stanislav Fomichev (3):
  net: netmem: add net_iov_area freelist helpers
  net: devmem: use memory provider helpers for net_iovs
  net: devmem: decode DMA addresses for TX

 include/linux/skbuff.h          |  7 ++-
 include/net/netmem.h            | 55 ++++++++++++++++++++++-
 include/net/page_pool/helpers.h | 10 +----
 io_uring/zcrx.c                 | 25 ++++-------
 io_uring/zcrx.h                 |  4 --
 net/core/devmem.c               | 77 +++++++++++++++------------------
 net/core/devmem.h               |  7 ++-
 net/core/page_pool_priv.h       | 14 +-----
 8 files changed, 108 insertions(+), 91 deletions(-)

-- 
2.53.0-Meta

