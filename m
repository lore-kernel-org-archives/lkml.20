Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975980;
	b=on+018BkEgFzy8gWQGnH4NuOpp6UShX5+fuoxg4WYsLEM5eRfSOJzxmO0omr0vWDnIhU
	 KAhUoPvRooJL8bg9RUgThWUiy82AhYBq/1tFyXZBXrli2AqcgH8NaTA7PiOgwiUSb2lxM
	 Pr/mCXnXK/de0+Vk7ezys5QSpkaYKLEzNj1CFqQ/px5ZkePk9AfkQtHFYutBxXbeDdkp9
	 mv5/bULHhK4vqq4W9rcBwLtVnu8e0h6BrQb9DHj/REzpYRv7dsO6Z78zrOOvz2equJDdP
	 7bhXsD7C0ycrNL/9ZfBo2y2cb7yP8JaeAS6NEzwgQsd/9u8IIZhQajpQ84SKiBxHTTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uby/azzGeVUPOBj9cIS7TzhQ50RQ5+dHAaKVnGJvY20=;
	b=Eb/SsiYH+PmjO/Az6vcTX3iiU3Ze/pTkn5Yj5KnzozNnLxQ7VpxE3SZBJVuQIOCKxpWm
	 p7m8QOfD4dICnpzfXZ7WgGYxqSWZBs+hjk0W3HNokd3D1jxK1RIhGKjIsazPcy73VdIql
	 JlMwO9AeihgXBrhGz1K36u6Jfr1NH9HlBuPgO/aYY8ofsPtOXPjeDG0ZnaVWR1Vvle/5l
	 OyCEy5Qu+SSIbjCv0qqd07uFPw+euM0QWaLMDJWdbZwjU7bfUhcNYmTDzOq0hrza/ZU/D
	 Xe7d7sMlwmvy6p0NWIv5JEHFZp7v2Lpr0s1K+JfHIMi5+IYFSTAiZaY0rs3hTzivMbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMHM6gXx;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60516606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60516606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZMHM6gXx
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so1320381eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793975979; x=1794580779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uby/azzGeVUPOBj9cIS7TzhQ50RQ5+dHAaKVnGJvY20=;
        b=ZMHM6gXxRODvX0c9H3q8RpqsUMvpaIdJ2sh1WlzcrOw3qSB7vyD7tfmrqNNlv2cbEn
         JUvEUVgo/sIxUwBd0Dvezlq0F0ncY1aHpV03WmLIfm4lbLtI/GWKrU2Swy0c/jkEXnMl
         /fZo70YLyrv73twujbTgNVFTRsmmM1Je3ggjG7bjWc/ZAtCkNh8fG1HrZZ2cWbRKB2Np
         fiKTl9FIyFGf6eIYp6BGSsNZxU/SXosLZgpM6ty1F6EjTH2DZiP+RyZmjLc3zWDqq6O5
         xKL8RdeVKDbUO+HLUcfdMF2PjPM6aE/QOLyWvsuQAaBoU86DRh9YmN81H3rOHHcdOu77
         NhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975979; x=1794580779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uby/azzGeVUPOBj9cIS7TzhQ50RQ5+dHAaKVnGJvY20=;
        b=YsUI150KUGMUcqvcIRWEHNwg5MJC71fQu1dw69FQbXT7GvYpRV3BaluWhPqBq/dMzB
         1korQPfeO/1GG8Ml5eiSdY1VPFCeY6mcpbfN2q5GrJ3fpZG+0Vx54CeaAPOPflSOv96j
         KgDhpopazLJU3PNmeD90g8JntVHPGuf3fTNa1bPFudnk0OAghFgnTAnXtZdN3FhdhD6/
         oKOm+3ik73pc2LovZgy66E3uJtWhWMlvnS+PTvDYVccqICjPgBQX24QaXoq/GLwOa4ml
         WAwGf5Rkhu4NBXpHL5zgW4y4Pv3yyWJxBViHD6WFHxfOZzF8EGqaQlBBgGRbXwGQHkOS
         JaMg==
X-Forwarded-Encrypted: i=1; AL+hErFuex9/XpYTtlgrchMBUzYvTCPWPG+moFyiMxkH69Unfj3dNHoMQEfR2zXxRNK1wHK5VcFJFPmO92DTnpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wDdm38E7ymDcPSCiEfpkNNgywjkCzfm8nbAhWdPojjXRcfEfR
	2yrgPMmMuhNp5TwpzyLHv+ojpSCaRZTtCaxKPGH4eJOmFL2DDWDwUS9z
X-Gm-Gg: AYBFou0Nmn3n0bhvHp3JY30Ebl4jK13UUYYfJyKycZlnP4qLP0dfG0cQh/D3Na7UlIW
	5KpAbX2RQOAxUPxEbeaEcHyiZPN84wR8BrnGSV1O4xKP/pVXflSSnBP+Ks4rmebAXN/uD1fzpEo
	/Nr4F3Rk4t1Ryz7/7cvXpu/bq24eH1oGc4O7t5b22vpARaJSI0juPVcrmQ8CpqrUAALJ3eG3x+X
	ql8SHT+oSdWxY0HW+LTYeYTlKyDzNzkNw2Cql4UjIGBFDnoUdPAo14QB8ofBdzaL6l+HUzY1es/
	x3JyfgqwwmnGy+6IeQ3+eQ8QswGEoeIJ2v8+RmBJMz1/dIKL/nFhXvu6K033lnqZAsVkQplpHO/
	uyjI2VX4lxR1QKAws4QERmzN/d0GFxR4WdGKl3MeU/IoMk1S2JxOlr7F/JTW8n1rlQsatGmsP+H
	McNt55p0/OrdLSHU32Qa9Ea3SGD7qmIUbeacGfpkeDt0riwEsSx9stX+JwJEJfOhgrmbbNox/L4
	cRl18UzINasHF8rVLjBLh3WzfrjNvMadSvLp2kLAaxMX30HYydID2ybPOprgCQKBAZYPi++GuI7
	fLbNPVxMRzr75kWk+7lcEOgbv0VDomROAHxCIZ8=
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id 5a478bee46e88-36f75b1ffd2mr3080840eec.18.1793975978031;
        Fri, 06 Nov 2026 06:39:38 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm7182068eec.26.2026.11.06.06.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:39:36 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 0/5] rcu: Record callback enqueue stacks and add torture tests
Date: Fri,  6 Nov 2026 22:39:08 +0800
Message-ID: <20261106143913.3627722-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds KASAN auxiliary stack recording for RCU Tasks
callbacks, rcutorture coverage for duplicate-callback detection,
and KASAN aux-stack verification tests across RCU and SRCU flavors.

This series is based on [1]. For testing, I also applied Joel
Fernandes' fix for debugobjects tracking of barrier callbacks
[2], which is needed for the barrier tests.

The changes:
- Record the enqueueing stack in call_rcu_tasks_generic().
- Enable duplicate-callback testing for the "tasks" and
  "tasks-tracing" torture types.
- Add a KASAN aux-stack verification test module with a Kconfig
  choice for each supported flavor.
- Add one rcutorture scenario per flavor for the verification
  test.

Tested on x86_64:

- TASKS01, TASKS02, TASKS03, TRACE01, and TRACE02 completed
  3-minute runs successfully.

- With CONFIG_DEBUG_OBJECTS_RCU_HEAD=y and
  rcutorture.object_debug=1, duplicate-callback detection was
  triggered as expected for both torture types.

- TRACE01 was run for 1 minute with
  CONFIG_DEBUG_OBJECTS_RCU_HEAD=y and
  rcutorture.object_debug=1. The test detected both duplicate
  callback heads through the SRCU enqueue path:
[    0.405836] rcutorture: WARN: Duplicate call_tasks-tracing() test starting.
[    0.405852] ODEBUG: activate active (active state 1) object: 0000000020df980d object type: rcu_head hint: 0x0
[    0.734724] rcu: __call_srcu(): Duplicate call_srcu() CB 0000000020df980d->rcu_torture_leak_cb+0x0/0x10()
[    0.734780] ODEBUG: activate active (active state 1) object: 000000006634e8c9 object type: rcu_head hint: 0x0
[    0.776688] rcu: __call_srcu(): Duplicate call_srcu() CB 000000006634e8c9->rcu_torture_leak_cb+0x0/0x10()
[    0.779126] rcutorture: WARN: Duplicate call_tasks-tracing() test complete.
[   65.411342] tasks-tracing-torture:--- End of test: SUCCESS: ...

Both duplicate callback heads (the stack-allocated rh2 and
the kmalloc-allocated rhp) were rejected and neither was invoked.

- With CONFIG_DEBUG_OBJECTS_RCU_HEAD=y,
  object_debug=1, and n_barrier_cbs=4, the TASKS01 barrier
  test completed 630/630 rounds without barrier errors.
  The only debugobjects warnings were the four intentional
  warnings from the duplicate-callback test at startup.

- All five aux-stack scenarios (TASKSKASAN01, TREEKASAN01,
  SRCUKASAN01, TINYKASAN01, and SRCUTINYKASAN01) produced the
  expected KASAN use-after-free reports. Each report's
  "Last potentially related work creation" entry showed the
  expected enqueue helper:

===== TASKSKASAN01 =====
[    1.244567] BUG: KASAN: slab-use-after-free in aux_test_init+0x8d/0xb0
[    1.244707] Last potentially related work creation:
[    1.244716]  aux_test_call_rcu_tasks.constprop.0+0xc/0x20

===== TREEKASAN01 =====
[    0.670399] BUG: KASAN: slab-use-after-free in aux_test_init+0x8d/0xb0
[    0.670561] Last potentially related work creation:
[    0.670571]  aux_test_call_rcu_tree.constprop.0+0xc/0x20

===== SRCUKASAN01 =====
[    0.658679] BUG: KASAN: slab-use-after-free in aux_test_init+0x94/0xc0
[    0.658919] Last potentially related work creation:
[    0.658932]  aux_test_call_srcu.constprop.0+0x16/0x30

===== TINYKASAN01 =====
[    0.951503] BUG: KASAN: slab-use-after-free in aux_test_init+0x8d/0xb0
[    0.951641] Last potentially related work creation:
[    0.951650]  aux_test_call_rcu_tiny.constprop.0+0xc/0x20

===== SRCUTINYKASAN01 =====
[    1.009005] BUG: KASAN: slab-use-after-free in aux_test_init+0x94/0xc0
[    1.009141] Last potentially related work creation:
[    1.009150]  aux_test_call_srcu.constprop.0+0x16/0x30


These reports are intentional and are counted as runtime
errors by rcutorture.

[1] https://lore.kernel.org/all/20261027070923.3054462-1-kunwu.chan@gmail.com/
[2] https://lore.kernel.org/all/20261104153046.965890-1-joelagnelf@nvidia.com/

Kunwu Chan (5):
  rcu-tasks: Record callback enqueue stack
  rcutorture: Test duplicate call_rcu_tasks() callback enqueue
  rcutorture: Test duplicate call_rcu_tasks_trace() callback enqueue
  rcu: Add KASAN aux-stack verification test
  rcutorture: Add KASAN aux-stack verification scenarios

 kernel/rcu/Kconfig.debug                      |  38 +++++++
 kernel/rcu/Makefile                           |   1 +
 kernel/rcu/rcu_kasan_aux_test.c               | 107 ++++++++++++++++++
 kernel/rcu/rcutorture.c                       |   2 +
 kernel/rcu/tasks.h                            |   4 +
 .../rcutorture/configs/rcu/SRCUKASAN01        |   6 +
 .../rcutorture/configs/rcu/SRCUKASAN01.boot   |   2 +
 .../rcutorture/configs/rcu/SRCUTINYKASAN01    |  12 ++
 .../configs/rcu/SRCUTINYKASAN01.boot          |   2 +
 .../rcutorture/configs/rcu/TASKSKASAN01       |  13 +++
 .../rcutorture/configs/rcu/TASKSKASAN01.boot  |   2 +
 .../rcutorture/configs/rcu/TINYKASAN01        |  12 ++
 .../rcutorture/configs/rcu/TINYKASAN01.boot   |   2 +
 .../rcutorture/configs/rcu/TREEKASAN01        |   6 +
 .../rcutorture/configs/rcu/TREEKASAN01.boot   |   2 +
 15 files changed, 211 insertions(+)
 create mode 100644 kernel/rcu/rcu_kasan_aux_test.c
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/SRCUKASAN01.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/SRCUTINYKASAN01.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TASKSKASAN01.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TINYKASAN01.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcu/TREEKASAN01.boot

-- 
2.43.0

