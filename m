Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD837E5DE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763792; cv=none; b=OI9qRLrNyyJwBCDkhPO0jdFuc2Yyfc3E1wk/qgdy2sTxTQpWuMQxqDH1NJJdeWOwUUhbE3j5Ul6yTmc1hOT7FYYZjyq578UGHA/TFeJtZEgDVW80dx/9p0iQqM+2/OesYMdHDMvDgR0nRVoBHdbFt16JS7vomfL3tiA+J5QegKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763792; c=relaxed/simple;
	bh=2766B3eMmFd/OaLBWXRn8QBlE+XKdud9wFfOhEigG4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YUEGbBvZC9zd3qX40CBRuDH+st8NVqF96XdgKcXfQi0KCB/JKhYq9qvT114gbuu9hWxvtaj519Va5p3lzqeZooLQxDK/tPoEkSw0l7hbdUDxr2fW+AddFTlV687ieehK00pwfmsExTF0T736h+c5Yc+gIPkH9mFnn54LZnMSW0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Va9REisD; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Va9REisD"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so2828660a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763791; x=1789368591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbyN7tVnWnxYp0pp4uHeU72ENpo3XFInJUk6Uv6k4kM=;
        b=Va9REisDIHkLARUvuc4c58/+a0xnLZZlUmKfjNnOVeUdYOYmUVIL8Nndnn0yvtP1wP
         ONFjIEBuDhP4IepPC32HlRlh0oI0I4jhTvO/f+QA9UMk2UVQF4lLfLlU33ukS04RCdlO
         0aNFXa2UV0gXdG9wQ8RU+VUncPM+61MLGgjzSTyrjnvrVwv0ext6F2PqsxSEc82uNJA4
         mkwNA5aK/Qn+/dzOL0O03I88mnBAa2iLTp19/ZOuq7VhUZIL3IkPhNMjElC+pG0uGDa9
         FEX9QA18Qb5NrDDK3d15F0DGgF0vw94JIdLqYj4M+qYV9wQo7x0HP4NlT9Tg+mw9DbxM
         nvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763791; x=1789368591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbyN7tVnWnxYp0pp4uHeU72ENpo3XFInJUk6Uv6k4kM=;
        b=LTapF+1gjvoJAo56sbFVcxD3QtAj9rDanjKrZb2MvRVE10jAXBPFRKM7/S3DnhmjXm
         +Led+WYbbZ//0IxrXwe36EiTV7BPz+Ned/iPspVmXw+RrPtpvqx4+cEMYGxxQKWdsEhm
         lMCFNeFHmM+nU/HKQy7UoHAw/Wc+bqlTuSp2kDnLUAsK8gB/H6gxb3XLKAUgTHRY/+Nh
         UG50Om1PJP28Oh+k9qBfot+KYxMR51MVIhIhhJWbC3D9CAVUgeYvgmJl5l+mwI6ElmUH
         w+Fw03T7gWhTV7gb9u+YMccQEggM/qIFXJ6pjXNqu5NkRQaaWYs+Zug8oTbTZjTJs+tJ
         tEBg==
X-Forwarded-Encrypted: i=1; AKwUvBztLq0egG4P+uH+1vYzKYokpaKd/NgAXDm+QCXUo+St4vOqhqou7oMA2YG29VTOE2ufmWV3jMzPVS7Ljxw=@vger.kernel.org
X-Gm-Message-State: AFuF++n1lw89dThULTGr89JpcTYR/jTrFgUgnBO33GyqfHik5gqQBILe
	DPGANgYaCS5JwThyCyMKHAf2cltPVj7R0V2PBaGEXrS9DmSQh/mhmzCl
X-Gm-Gg: AYBFou0oYwBGcmd7qkD3bBppQkfQ/MJheI9MvF+4/r8booN7u6uxzfPlKpEtGCkW+fV
	F1Oux9YQ/rJChtYM6Vu7MwhPIWNy7CimipONaTedGyaX4XXIVB45DajHT1p57XN/IYjpACXqML6
	KToM2KiODM69uZ8KRxqyN8CIZ8HoVFhZupaMKdhMZ1GZlLj5cpWINjsv7qx0bBEDnMqYxSs9Ibr
	CMD73sAm6weDdnX0UyD/uD4iURIgjJFC4pNnW8t0zp3YkvDap1nGOkLvSi5EjGNO5PLK7dVxazP
	QlGAg7jz9JT+KziP7pGPnE6tNBZlCidlwL/Z9SzLxPtgAEeknMrwDWq5CiDpkDjOZiSbtuNjeG7
	4R9PJxefL1kmBJFkCJ/t7QtcgjoiThmBR4wOtx0pNqYLpuquScrdUbvKfKwHYSeCxGQqEHvHPA0
	Ak4PsJ8xxisfc4pPRjpZOwWZPS0PJq09rc9PmjfLJBrShGkmKVuJq33teCewAA9j8M3wES+pHDy
	KsHlEC0a6VnOQ==
X-Received: by 2002:a05:6a21:6110:b0:3d1:3c2:85b6 with SMTP id adf61e73a8af0-3da39b43743mr33286987637.5.1788763790919;
        Sun, 06 Sep 2026 23:49:50 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338778fb926sm465210eec.31.2026.09.06.23.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:49:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 0/2] sched: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 12:19:41 +0530
Message-ID: <20260907064943.25304-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  sched: fix typo "upto" in comments
  tools/sched_ext: fix repeated word 'be' in comment

 kernel/sched/ext/ext.c                   | 4 ++--
 tools/sched_ext/include/scx/common.bpf.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.48.1

