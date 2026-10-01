Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CF052BE47
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868841; cv=none; b=e4KDqjHWNR75egMTrPjUyFbeQZ3YqHZi6lcuRdsfQytNucAtuUhM5OwczYP5Q9tCAwKmUjQWgWpzTjkQAPr6UL8FdDA960wxzP5NU/pj+tdHXHVu0ersc/QXs8OwaV2bOTICYJdBVlPyYCnScrWByamivrEoO0TAYahZYYeMWpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868841; c=relaxed/simple;
	bh=vE5rYraDDztxsN+DverCVDxINK++fhi24ILP7gENH+E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ASBjYAR1An6HuaLNlWL2hrTvNukk7gMyavH5ePEqnAZTfMATHipN4F4wh+2LzQ8XfvWEgoDLXyW7gtHU2fIARhphkTir84VK8uCHhMA/2314SjRPbBb9j88Y5bpDCMI4Cb3fpSJ92XtZNKtqYxUIhptS2Hm1DpJIF8XfDptmoNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhydnY3u; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhydnY3u"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14e1fe551c3so737005c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790868838; x=1791473638; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7R/8/9AITUujGUpkgkK/lwuX+Zqo9Tj1z8OfLHWk1D8=;
        b=mhydnY3u53y8s9AHlRQ8h9yODcJxJUofiX6onfTS1D7kKyJxShPKPEXYjYi4XyCA1W
         EpN7B0GP95G6otxJ6gwAOD7tpabWj2szoWb7qWISEULBPuU8tQGQdt2JeJIZztKVjZGk
         /MFWZn+8Cbc9uY8HRf30dWd8oaMxDUDuNCC8ulOKN11L7Sp2I3D0yVADI7gFWrXt8KH+
         WTI0jK2ufNZJxJmJKW1emK2w17SsdytR8cOx7aLSErfMyhvotEQ0kdie+JHCoR6xWSUr
         GY/Nh/XPm1ocs6fVs3sYBUxck1OvVXvQN6pR1XQvy+AuT80FJNIc+Ajs/do17FxY6nJm
         uLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790868838; x=1791473638;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7R/8/9AITUujGUpkgkK/lwuX+Zqo9Tj1z8OfLHWk1D8=;
        b=v+E5FqXsniOH8vOTuekaAqcS+IBtEIC1pTeBc7MCjQeJLK1ansW7M8dbPA/EV2/uvc
         4Y8kgP51NoVc88ViJSttu1trSbVS4Mcgz/mbPbZ3CSNuDzlIFXuErHc7x2toQ2purcEH
         ZoF+4PR8WA1enbn4U9OF40gfgr36v/d0i854RJ2uEtsXcxOUZtr14jOI5DA1qvLeuqlx
         UXjeBOgrB4+/vnOrbtOC9oBoqEnsdV00qdSb7MKfq1cvQtS1kiOV+LQtAr8Dl87Wf9C3
         86JV7KjV1veG5SLV5DYpqpDXHB+fEhj0EKAEjFVyTUVDCAu6iJF8eZ9iM5Y1JbMujexG
         YfdA==
X-Forwarded-Encrypted: i=1; AKwUvBx509+T477IXvhPt/VvOvOf9aS4YtbmgR66L5s/dTAGVdayAKOl6FvGhh1PYHMZbyHBp5wXTxjtuS2Qw2k=@vger.kernel.org
X-Gm-Message-State: AFuF++nIvx2UIXLXJwldRvsrjGApS7QsBbb7v1fqJvFisua7qbCfOaS4
	9uMYmAtkYKXXjwQXoDXy7dUgj32np//FL6/baUFQbn0DE0JsIQN5sRgA0qqMT6by
X-Gm-Gg: AYBFou2/kKcR7rqyFah0LA/zNTm4nspFzZ7kXT1W8TP90VaLX3fegXp2Dk2nQP2CJ6q
	bnBeBN8N5Yw7oYTGS097PsPQgeDCxH2ydWqSSR4gw4MB+Lz3oVlTBZ1tBHGygVKwaIVRV28x3Za
	fMqn4h/pTz1/whEPix+6T2SkPwfSetLQlAZbLFXOFIJ05eImp5XoVvUzSMWhU4EaOFqMx4pcW9o
	KixL/Y7T5h91T+DW6W0mJ/XAX1i3pqG8/JMIxKvqiVH4/SMYdTuq/UJt1BeEXEV7t5w+afk9B43
	24Sm2DW5JIFcPtP4Rkm93dAsg0r3mRWOfcoYZ4BkhYP0pdzB0oB0xvARZMyBtAymBXzcjUMmyOd
	gB98PNcB8s9K432HlyaogAq9fsSSsP5OqFsaubhiWXXNlk+VIyx4ZFg7LbwMQ/lAjVuqoyuOrd2
	Y+6JNG4cUtvGXlfuymPzNyPgZ9/s5rYcny6oCB7eWuYsMkx7apidkFnieF1Ms+zBLc+Q==
X-Received: by 2002:a05:7022:eb57:10b0:143:50a0:56be with SMTP id a92af1059eb24-14d31c6d41fmr5203438c88.14.1790868838309;
        Thu, 01 Oct 2026 08:33:58 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f266d1156sm146683c88.6.2026.10.01.08.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:33:57 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH 0/2] mm/compaction: stop repeating failed async compaction
 on every THP fault
Date: Thu, 01 Oct 2026 23:33:47 +0800
Message-Id: <20261001-bug-mm-thp-async-compact-defer-v1-0-0174c7923430@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFt9vmoC/x3NSQqEMBBA0atIrS3IgNL0VcRFhorWIjEkKjbi3
 Tu4fJv/b6hUmCp8uxsKnVx5Sw2y78CtJi2E7JtBCTVKISTaY8EYcV8zmvpLDt0Ws3E7egpU0H6
 0HqQNVg0eWiQXCny9g2l+nj92WGescAAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

A THP fault on a MADV_HUGEPAGE VMA tries the local node first with a
single round of async direct compaction. A failed async run is never
deferred, so when the local node is fragmented by memory that can't be
migrated, such as long-term RDMA pins, every 2M fault scans the zone
again before falling back to another node.

Patch 1 splits the deferral state by migration mode. Patch 2 defers
async compaction on its own state after it fails, leaving sync
compaction as it is.

Populating a 4 GiB MADV_HUGEPAGE buffer on a node fragmented by pinned
memory, direct compactions drop from 735 to 15 and the time spent in
compaction from 122.7 ms to 3.6 ms. Fewer of the THPs are allocated on
the local node, 1126 instead of 1313; the rest come from the other
node. Details and the movable-memory case are in patch 2.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      mm/compaction: keep compaction deferral state per migration mode
      mm/compaction: defer failed async direct compaction

 include/linux/mmzone.h            |  7 ++--
 include/trace/events/compaction.h | 27 ++++++++------
 mm/compaction.c                   | 77 ++++++++++++++++++++++-----------------
 3 files changed, 63 insertions(+), 48 deletions(-)
---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20261001-bug-mm-thp-async-compact-defer-b83351bfb25d

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

