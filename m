Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0F13D7D69
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512524; cv=none; b=KIk2dc1FNhy8dzViaOMN2lOvi+pNvVtRwtw1ezhq3JmWiA5g7KZF/928fX1KGU6yPhyDHKzv4e7yvRVQkzJWw7cuszDPIssQbCPYSJtSNrI+WrmVnCrMo1ciDERqtaTwkjuOjAwAcLwmnGWdJGPgRSkwXTLRkkC3AVaG/Rw0uOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512524; c=relaxed/simple;
	bh=KNxTAbjbz65LTMqy+kcE/4eGYV5jo/IynxEJxB7kbz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tpqba279p0lUL8eX9wAqA9DdJsWZ3XgLiGJAMj8TdSMOptTUwiO1ZalbG8n2O0omSvwZ2N5fN7bAemQCuNk/5EvuzCBnRNbAotfecGLXIuQ9lzqc5wZ1h1Q5gTwLFm3ZkOpeDC89TyoeQYgqDqFOPMmSWOzwgsUjNhe8ofAM81w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=og0Cve6/; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="og0Cve6/"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48436686a40so237037f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790512518; x=1791117318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypzaeR9JLodexK9fc9meZbbhDdINCQv5rDWFviqAO0s=;
        b=og0Cve6/mOhut+pSSKh0v3/shMQZ1lvoGoQ6pfo+uIzPJjarU14c2TbiVHp3hoXAob
         GL0aDdsI9xxzKu1iZWxPD7L1cdVGvYMZgB+knSMHw3lcU8ZX+XYxBqIezCvjcS9JxJat
         B53x2gvIxbM7MCcimvhjAtQpoVp6piNMts+FovCjGHe0tOzTURA1dOdJTF7yNQILYNSI
         Ghc88HhoyyEYTZvGi51UBugW3DwnEkHNIgd+29Ye8SK/4UPPbMlvl/P+uvIBkp7n5/tS
         4OSLKker5an8133+vSUz7cm6pT4oVSg0tkNdDunC7qPYphMXR+IeD6QQ9KqIMAGtSM6U
         a+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790512518; x=1791117318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypzaeR9JLodexK9fc9meZbbhDdINCQv5rDWFviqAO0s=;
        b=1RtukR9IlbOO4csmRxYp+YVWjP3WwLAS7enz3YA4wMWrHhXAsgGXAuiXYf1ut09CJE
         GN/YSSYvVCf7euDizMZr2zRoT9gupNQUmontigGIwd+QFXYZBTnRqCSWM72ourGYeu9j
         /VtOH308X2VkpIHSPnjsklfcTSGZ6DW5CpdJLwyLnuGs2tIIe1XAUc3DAoMxFSFYKwRr
         MM/r2VXehNaRAGhNTsc2GQe+4YJpgs2WtpQnbuUmzxwifm495RsbRn3FbBFOONoUKpyT
         ethUVGDDbjXxFbB4PTbILG5ykSPGN99jpozTqh65hwoTI9vIyNGJIgX1Aydp6WxXBsqR
         6fqw==
X-Forwarded-Encrypted: i=1; AKwUvBxBWpsFRbAIyqMb1B/NrDqTE3mJ9xiFIdaVMF4KoS5BgR2/NO9jRDLsDxx7slFsZGd+RGsYV3uJqdUYVIo=@vger.kernel.org
X-Gm-Message-State: AFuF++lC4kvpDFc6SoK8pulanuR4kad2D8zitRnT8GqdAN2LJrC0wCKu
	2958+A7cGOoFCqplCEqpQ/ucCJI4zQLsm+QXq+xZE+/PRkHEb8XPE+Pj
X-Gm-Gg: AYBFou2+YspUz0K6Vd3cvsLik8PGbl/QddKMKDkPp4zHS0J/nvmdwZVB21XY0/rcMRj
	uyZokK/0rhBMYGcjOuZUgzTUsj6cLC2moA33bIrQkwb6tK76YBWtvCB9kQ6k2PrnS2RvDDpx2Q9
	Byh9dcR5jc2X3jePOckF6aS/K3SA6NcJUnGZuHWd6wzyE45xuONm6Ursf9XE3xDF0SKGZD4N1Wq
	ASCHKtEGir1Wl4i/DeSmJuFAsWSGnMKMriVpyLQJ5IloUM8+oHHcIQPciEfddvEBTq2xAvXpM3a
	AC3VM9zvGeOk16H7KN6WozTtg3o5CcNRtqGKvPrYmu8oYyy7lL4GyOXJZnjDbmIiLC7JBLiy89J
	2D7iYBCVRHRsTEB15Ue1OOwrmQHKcSss/XBMPO/GT4JNnd6JZhy2joeKVHJV080RFzTJHpOU3fR
	u42gxyqafoCsCCJeBBOZ2bKl7vLGtQLCp8v0MAtrJiOxjL51SMzCuD9hyQb8DRrrIcdq10dhlVW
	J3kV+MgR+X4oP46nxxq
X-Received: by 2002:a05:600c:548e:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fede023d8mr134361005e9.2.1790512517974;
        Sun, 27 Sep 2026 05:35:17 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001771ce3sm58790835e9.7.2026.09.27.05.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:35:17 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Wei Yang <albinwyang@tencent.com>,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH 0/3] sched: Minor comment fixes and cleanups
Date: Sun, 27 Sep 2026 15:35:04 +0300
Message-ID: <20260927123507.39074-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series is about cleanups and minor comment fixes
that I stumbled in sched. I sent some of them earlier, alone.

But I thought getting them on a series would be better. Old ones
already didn't got any responses.

1/3 came out while reviewing Wei's patch, here:
  https://lore.kernel.org/lkml/20260920111535.117996-1-kayracizmeci@gmail.com/

2/3 was posted earlier here:
  https://lore.kernel.org/lkml/20260822135432.327466-1-kayracizmeci@gmail.com/

3/3, it's too old:
  https://lore.kernel.org/lkml/20260726160238.107142-1-kayracizmeci@gmail.com/

Also, there could be minor changes on the patches that was posted
earlier.

NOTE: Because Wei's patch is still developing, if it enters the code
text below the comment needs to be changed as well. (The comment in 1/3)

Kayra Cizmeci (3):
  sched/stats: Fix comment in sched_info_enqueue()
  sched/fair: Fix typo in requeue_delayed_entity() comment
  sched/fair: Remove unused autogroup.h include

 kernel/sched/fair.c  | 3 +--
 kernel/sched/stats.h | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.53.0

