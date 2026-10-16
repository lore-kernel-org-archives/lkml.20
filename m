Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A6E3812DB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183966; cv=none; b=S/DDWoS9AEnYlGJCRQTEvowGUtx3Q6p/rAmcNkClQ4vilD5HUHmWukvbVslPr7mvJhMpZWUdBMXvl87jvwkGE8/ez95hLS3sBtlqS6AcCjlS+6ISEMpCB+D92hXyBKom+80yrh8evtZFWo5cL1EQDnRI9u9iJ/MGbGlIupYcZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183966; c=relaxed/simple;
	bh=FkuzvAMchkaQH44NJto28j+gBNxCgfy/fDlzZOBPlmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQz5op8vryNXtWXtDgeZDZdKXauA1HKFuLaBmaSqfpaAnykUPSOXleQovX8AE8ylzybz4KU3kGo9Gb3yZpoogb6mO0emnLtsoj9KUb56Ij1q8HlvFPcPLhiHLK+mDyLy9/FEcEHqVDC5owOoTVgq7kCCEQYhRjR5DI7ZFu7RJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvaQkHYw; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvaQkHYw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35f1f76ea84so499298eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792183964; x=1792788764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pL4I5GTbfGzy7AcdZoTCof/41Zcw3NVIXltEeJBzdLc=;
        b=JvaQkHYwrvuNgieB+AhPEwVZvEN9ND5J2Cx0Z1Y+0Zn+44K7sLPkKsfwiZxry7oz5A
         Jm/IAQl7/FGVp9mD3UlJmxw14uHeEZfYPr3xJX4n/GJujeIl1OQwYfq9ZP3DLSyt4wI/
         V7F7C/Rgvd0tUMPHLgj6w5vwtQCRMdQqXeRe1L3UK+A2n1Otsd8XKqDUu+q6P0zgW6sQ
         FcTw+Y2/xpWY0YdEqUl2U2oGMxJu10QJX2YdCSpmRSMbzN74XnEXU0jpvdt71TLIuQJL
         z1apYbfCAmJY0FhidvWkp3xWWvl/P0F5l5IlI3WkmT6xMKynZR1mVZRW8EThjeA+CoY5
         7K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792183964; x=1792788764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pL4I5GTbfGzy7AcdZoTCof/41Zcw3NVIXltEeJBzdLc=;
        b=hl2lNkM3mFvvlvJmph++DOnzP9KfcjZK7UL+X6VmKnSn1uM2xxICs8MXvJHvzzPao1
         rAp0TCQRMAFMVTyDZM1sK5dgHSPLAm03FCa/rMOzYBKhErDdngCguncqAVQyjM47cZR+
         F5FAZz2f2AvCVy42l2eRGr52bajKSRAnGZ4/Ia95axEIQ8rAJltvad5kXS9x95pMX889
         CemYibInxaptdDqE4wRASLAWVKr8/Rn87576dplxg3FZNyIvbQ/vTd19/yNSlZLQraR+
         JdjeKWd4gnsY1CAUi5BIjjXhO8Fj0XDjBUVelCn02nTtjf+CpArc+tk07zk6uE9P93ta
         2udw==
X-Forwarded-Encrypted: i=1; AKwUvBz78vK6TBapBxNqMrT1Rcw39pkgSYag3OJKRhHlr2kf2ZgERCeoJpfy6f4xsRbKGP7LquacYz/Y6ZHTLTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHQRJNj8tbbUVj0/ISay+1DTtWhm0Kv3fMt8p6fbkd2oOwtBFP
	dEvD9FULQ0nJ+kFTDCVbxAxFBVLvszQiYkZ/2wX7V+xR8WOWgenHaGJh
X-Gm-Gg: AYBFou0dWhYACX14H56CfWsFv/BC3yS6s/JqnbEKXj5mWCSzrV92/34fRCvuV2eM2He
	fBT/+We5AkBof/i8rbSLajK2X7qqo1CoUk+szn/l9Es0g3lLGWkQhBZXDiFOSZta4ufF3HJ74XH
	k2A8qXVsizgW2o5ZM2kVZtG3CpkSIlhlUmODOAg29CiWq4z6rJEXBc8ILcgEJDfDvgODxCOf39y
	WuxC9jaD/d5S+UTNCFMUleuMxl64K2qt4BP01UTambPVWzOa2AGllUsLHBdg9sOvYJitFS1DWkF
	ONVW4m6wELWzqvkBv97TgIRkayx+ta34P9lKtj9qiZ/ziFO8JwKUQnh2gvkR9yEhG/ODp/iQQ9D
	b+xsWrIqEpgqkxz/DJYXcOYKKTmEo8O0GUE6I3sn+QLvvS5KFqdp330/aZMlNHyCdHeKmLHXZlH
	BU0vX/We/YvY9YYAdkWXaQJcpqn1ODkf0Yh2AlwcUi4sP6Zft6c+V0NjB2a2z5O5Vp5NZRbKiRC
	puBwpsntWHgne3FxZGKLENBdg5dfkWN7FP1Twq2bLSWs5OGmgxkKlj5ldUkdgS1D4+oTvtS/g==
X-Received: by 2002:a05:701b:4546:20b0:16a:8ffd:4977 with SMTP id a92af1059eb24-185136cd2e2mr1206833c88.17.1792183959586;
        Fri, 16 Oct 2026 13:52:39 -0700 (PDT)
Received: from kanishka-Inspiron-15-3530.kiet.edu ([59.145.191.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm8054828c88.15.2026.10.16.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:52:39 -0700 (PDT)
From: Kanishka Solanki <kanishkasolanki456s@gmail.com>
To: akpm@linux-foundation.org,
	vbabka@kernel.org
Cc: Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] mm/page_owner: Use per-CPU temporal storage for saving stack trace
Date: Sat, 17 Oct 2026 02:21:33 +0530
Message-ID: <20261016205134.54436-1-kanishkasolanki456s@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I am looking into resolving the following TODO comment in mm/page_owner.c:

/*
 * TODO: teach PAGE_OWNER_STACK_DEPTH (__dump_page_owner and save_stack)
 * to use off stack temporal storage
 */

Currently, save_stack() allocates a local array on the thread stack to temporarily hold instruction pointers before passing them to Stack Depot:

unsigned long entries[PAGE_OWNER_STACK_DEPTH];

Keeping this array on the kernel thread stack risks stack exhaustion.

To move this scratchpad off the thread stack, I am considering using a per-CPU buffer, similar to how kernel/trace/trace.c manages ftrace_stacks:

struct page_owner_stack {
	unsigned long entries[PAGE_OWNER_STACK_DEPTH];
};
static DEFINE_PER_CPU(struct page_owner_stack, page_owner_stacks);

Is a per-CPU scratchpad the preferred design for this off stack storage in page_owner?

Thanks,
Kanishka
