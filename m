Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819E435F61E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789452589; cv=none; b=k9770iKnHT14VqEWEmzxaS5LypAWjoE2lA7UQjRufTDCSPKLGG47mG5D+TpJDmBmPESchpS8EIdNil37i5q9iQyOEANmICSXIGRTi6eCktTGubHK3MwYVTKaJFiovaC8M/DlZyAvBemOnvOUCtq8CaHlmKuva40EPVcw8TQfO/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789452589; c=relaxed/simple;
	bh=BopVM12HDLADxYa9oYvGmWcr4H5e+xesHUsEg8nv++U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ocUvi1gDeXwOYNE91tbLWq/hJwBolX/q1jXus9JNcf9gJyDJnm8X/IV9AkOUK9p6dG90Rdyb6mugqOj6nPeduqKm5JMz4doty33wcB6/d6G6pK8Ax21ZJHRHEdErELO3DGeneirPR83mS5Cm7mYIj/ceNPW2fx0f8CDW4NLeIzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyrtRDM2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyrtRDM2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso18752845e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789452586; x=1790057386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SI783VUJkGIZm3nVSym26fZ6VNUHxk9Ukf15drWnbdY=;
        b=SyrtRDM2NXP9oFBle08roxhjjnzhMhEukwMX1ri7Z32ykZTAIyy7NzU7Q/CYuRhL/v
         HSEVcUdJIsm6L8NjT4ekoqptWkXnay3IL5kjgXNXXuDcc+5tv9m71SIEMVP0Ph8GLveb
         MEEcpe3TEMNhJqx+YGQo+W161xPZ2DVBBmta5YL5z4tKHSrRG7GBEo4j8EOG3kVvTv9t
         cH2ZorCzGfMO0quvVIGx3JuZ/oQa3uv0xZw3W5q3QUwAzaKY8L1glvJH4cilh8wjU1fQ
         EPGS/InX+UV9/Y5ErecAV2Xqz0vDokUrAOu/wrJFKq/uSMR8oWe1tvdqKTocn3+WcWsr
         cCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789452586; x=1790057386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI783VUJkGIZm3nVSym26fZ6VNUHxk9Ukf15drWnbdY=;
        b=iclk/vyoiDH3ccddyAEQ6A/sdTUI4Vxa0KCHrEjtdbzbuU+n9RNB4nigWcii4gylvx
         5UDZQaBgdLrNamALcnwRymlUvs+3wKOuNjuPbNgk48o4zTTV9SqeuxJclgGluouV8slC
         jK5u2wpcZ+e6FnOoQx6VTku2ko3WEgTZfH90ZOmJx8Qkrq2GFebjc45Zh9BS8XTF6JCJ
         m34M3JHSjU3bdRvJ2wrWFp9yrGCSHDi1ssXOXUK3+38KOlaWokZQA6m2HxmBdMWCp+gs
         IgPvl4ViTWYR2yUhtdJ1V2mee8a6w5d9ErgHB8pPOZ9Rn7EObX6wqBmJEULLGBc/Fnv9
         5hGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwt5EnSfYYZb11wtbADZawPw4JeH6U8WSsAks9s23A0BZoPeb6fP/JmWobAXOxXtMtFoeqFw2/+ek4RNvI=@vger.kernel.org
X-Gm-Message-State: AFuF++nrKwg6mDbnkBGbP7wfuW5VTSltSwcaS77aKerlDgNicg2XYtl9
	JYgaQH5ENret6PLM7pzkh0E75ByZT//BzGWeVcYI2qjPZWs4SLfiukdN
X-Gm-Gg: AYBFou0XKkm1vrXYzoMKyWamEG3OZafO7cjQt8cRIFppU6A1VwHzdifbNfkSShhSODj
	cfEQoIxGbBhgih2YZ8s9CdjmiSsOmefHo+RjE8JiJBSTS55cXmPK2sAk3G/ucQsrUOWPblN99bh
	lDgg+PydUqIEDolI6oD4YAwy8bImEgVDbCCyq1Y/mstOCNjMh3O9qAg055yaScifU46KT0zNvD2
	HLcD5xPI8Q0LkbfPPxoTLE3tmG0vfJ3Vd1UQCBa5KedKKFwcAgVNnrMykzuhsIwLZxx2H6bE6BP
	pOVyyTBnfy1tI7O9sPX2q2TairWR87AO5CRCMS4FxJgRRmr2Gl+tLOEDeykafviL07qQoUEwr7R
	opuPAaQpiiLRFUzSciEX1+bPUF06y0AUIQ2BiYos2vtt/+WOVyv4FmVSi6ZK2itVLODP2VC7Zqk
	/vemHmxXSpe+1XR4b+BSkLVbbQOZnhq385Ull6zdSy7vtyOLa0QWUE1e7VdE97OvY95H1OQ7eBx
	Z6jB39zxFMqHIAAv4sdMX19v+dPFTyUHpLFe4W9no9oML4mtRCpVXgk6gjJeQOvQ0VTtjGZG1Jn
	eKULZ2JhmFKZg0qIVCi55+9n17eAIREDBtGlCBFraS8/UMLnORIVJlYQEl+SAYt7VSlEXQM+APf
	zKOzqLOi28OGJuyiK
X-Received: by 2002:a05:600c:4e02:b0:49d:272d:74b4 with SMTP id 5b1f17b1804b1-49e7a6387bcmr171632925e9.2.1789452585275;
        Mon, 14 Sep 2026 23:09:45 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-afd5-c801-cc65-9ba1-765b-bff6.310.pool.telefonica.de. [2a02:3100:afd5:c801:cc65:9ba1:765b:bff6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27c88fsm44282905e9.2.2026.09.14.23.09.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 23:09:44 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lian Wang <lianux.mm@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mm/damon: fix zero quota for PSI goals under the temporal tuner
Date: Tue, 15 Sep 2026 08:09:35 +0200
Message-Id: <20260915060937.3423-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PSI quota goal without a previous sample is scored as achieved.
With the temporal tuner, this sets the quota to zero for the first
charge window and the window after each goal commit.

The series is based on next-20260911. It fixes commit a68878f83ae6
("mm/damon/core: handle uninitialized damos_quota_goal->last_psi_total"),
which is in mm-new and tagged for stable. Please carry this fix with
it.

Patch 1 keeps the temporal quota active until a PSI delta is
available. Patch 2 adds a regression test for the first round, the
next measured round, the round after a goal commit, a measured round
that reaches the target, and the consist tuner's unmeasured round.

Reproduced with damo 3.4.0 (b41965a) in a QEMU guest running
next-20260911 (x86_64, CONFIG_DAMON_SYSFS=y, CONFIG_PSI=y):

  damo start --damos_action stat --damos_quota_interval 120000 \
      --damos_quota_space 1048576 \
      --damos_quota_goal some_mem_psi_us 100000000000 \
      --damos_quota_goal_tuner temporal

then reading quotas/effective_bytes after update_schemes_effective_quotas
every 18 seconds. Without patch 1 the effective quota is 0 for the whole
first 120 second window and again for the window after "damo tune" with
the same parameters. With patch 1 it is 1048576 throughout.

The KUnit test in patch 2 fails without patch 1 and passes with it on
x86_64 and i386 (CONFIG_DAMON_KUNIT_TEST=y, built-in KUnit run at boot).

Karl Mehltretter (2):
  mm/damon/core: score an unmeasured PSI goal as not achieved for the
    temporal tuner
  mm/damon/tests/core-kunit: test PSI goal rounds under the temporal
    tuner

 mm/damon/core.c             | 14 +++++---
 mm/damon/tests/core-kunit.h | 69 +++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 4 deletions(-)


base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
-- 
2.53.0

