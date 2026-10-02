Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF494F55DD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956007; cv=none; b=VYC7Bt8o0Lbr3YTn8mLSYMG8mYGZ+oXCnhTcLeGOqkGMZ5VTi7tMOnv+c/Fd5tidPsZgW1yOa79huoCwfRcGj+cNfSfI3xuHwGCe0KHlZYg6/UGtnlziWwONTxFWzupZvb32bosdg/B0nXFcTc3rDF2TDrSxGTtmpE3rmzz/sw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956007; c=relaxed/simple;
	bh=HPgxxc1rDZtPtdI2GIeQUG6Xgc2SFRsSzek8WGyqvWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c0AS2m6O2c+uPehgES3/iOPQJTb7RMZtqX3/Pad8ymKsUS8iKEAb6zK4+DOVnFT1RAp9c8vfz8zWCEj1Pq8GqOAbLxqqm/n3cOWp+f1gLSkRPvQSFseN71iOyHKOIomcgTZyr9iDxPYRaJU4zLr5/8aC0KVYr8QKoEA9Y1/Jchc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2qfc+lm; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2qfc+lm"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so52170685ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790956005; x=1791560805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v1r+ppuP48XEYHoKXqUHrhBywKk9SUCQYXBCyN84K2k=;
        b=M2qfc+lmKwjqc7jspRfSem3KKBypLUgf0UXE3fZPrkhNTN0U/pWp5yr4vGtNgQ41KT
         IpLCxHm//luJqSdAi51NENoKruuntCvQhRnv4jXjchquT4I1NVclgrIewFc/2ttqn2rt
         5yaI4lHOZiFCcWSoJ0kUs/2Tsip9CaM7qAER470zVJJxRsxbDWSS26tTCgzMcMOIDbcV
         MdL2Ne5qOpysFI9ZEmgUk9YbOIOs0Ip/UHdGBu8S+E1aShBlVNIB2oBhwkWp8Gj5vTsH
         4VaEkvT7UfNLUJDDkN17WcSBuL60daKJx4T+wxTmj0ikzC0ApGCdGDiwoKFyJBKOmM88
         Gk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956005; x=1791560805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1r+ppuP48XEYHoKXqUHrhBywKk9SUCQYXBCyN84K2k=;
        b=FGtf4v4UdO+WmmftgkpIFUncsEjpPChvomjNHrFswExfL/aqrEC1QeLmo8vfLRRYML
         cdYpOYPTMe5mlnk7MuxvKeSjd0PhzAbY1dIHqnii/GBCd9wilTq49MyMxfC+dh53ptmk
         sj5bu8N6ldnTaOxUO/vJJfEJqxjobc1lXL0nyXGpYWZrVR9IRjcNwB6mqiLqNdUTEtwT
         5g/DJWNXLpROUFfGSbMQWoHow9PGtwbnyxnoifemyQW38mmU81IvdyZuZsWfTS3g/Nfr
         6HcGgXHBuifMZ4AeAaJV9NRFFAlxWJlV0tVvlTyuauzrYddadzpClvqbdTooqqCENeHM
         YXvA==
X-Forwarded-Encrypted: i=1; AKwUvBx0aCwv1spjzgy0Opr9ag7Gy+wIAMt1Yr44a0i+mi7A2EXfIHJyULkeuusUHupprTvlazTxo7+FDSRCznQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIefC9ezYmR/BXGXlzB/HncDDvD55hGOvfmKGbpjbcOE2bC21Nr
	z3AOvzOc4839G6/QbWR3dEwlgv5zOu5rWLjcxAIUvbjjZO0SfR/YbXLV
X-Gm-Gg: AYBFou0vQ9ku3n8oDQvwxDO0Zt5vAC3f10gzlnp9uL0IaZLOHMKKFFnSvu0V/vxl/LT
	NhnHxvOgFzdHXl15DmBUjEcJOixLFS3MMkN3P/OL2J8QjfcEik3X92N0WGfN6gG/lUWk7Yrv8Hx
	k+TfJbnk6J9mM+jwFChSKPZ6589hC8h8T2OA974wEBCzIndAB+65aS89VJ5Wq8IQMerTKLOb+pT
	rmsgU4Hi0aVzLDa7yIiQ54TIa80xdEXd3Lz2se6OcH5pMl6g6ntZ6iMP9yg3HEvE8+6WT98UFak
	6mmIH2X7AIcxDZkSvKkKrnA+0OdchrNovDk8CKjlwCkiEg4ReG1cf844/XL8X/FvpI2vLUQ//6U
	ao32ia7X4WdH76RXjVK06SPZxByMv4ETQMN9AW/LTMz3xcsxfnII/kOqs2ZlRC3tsY/2FIXk85K
	AfwrfzBhIg7NOl/vSfKBvcggbZO6WVc04tIO4xLol0vd5lhba4SCpt/yJnG8BJ8JXI2OdL25eGZ
	RWN2OmLpT5S
X-Received: by 2002:a17:902:daca:b0:2df:e95f:70bb with SMTP id d9443c01a7336-2e499f09634mr33608675ad.4.1790956004354;
        Fri, 02 Oct 2026 08:46:44 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6d9a88sm9785075ad.53.2026.10.02.08.46.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 08:46:43 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Tim Chen <tim.c.chen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] sched/fair: Update decision matrix and rename pinned-task group state
Date: Fri,  2 Oct 2026 23:46:31 +0800
Message-ID: <20261002154634.71878-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 updates the group-type decision matrix above
sched_balance_find_src_group(), which was never extended for
group_smt_balance (fee1759e4f04) and group_llc_balance (f38cc2f0d8a3).

Patches 2-3 rename the state that records balancing failures caused by
cpus_ptr-pinned tasks. Since commit 6263322c5e8f ("sched/fair: Rewrite
group_imb trigger") it is an affinity flag, not a load-skew measure,
yet it kept the names group_imbalanced and sgc->imbalance, which
suggest a load skew and are easily confused with env->imbalance. They
become group_pinned_imb and sgc->pinned_imb.

Patch 1 does not depend on patches 2-3. No functional change.

Changes in v2:
 - Patch 1: llc_balance vs. local has_spare is "force", not "nr_idle"
   (Tim Chen); reword the changelog accordingly.
 - Patch 2: Rename to group_pinned_imb instead of group_pinned_task
   (Tim Chen).
 - Patch 3: Rename sgc->pinned_task to sgc->pinned_imb and the reader to
   sg_pinned_imb(), to match.

v1: https://lore.kernel.org/all/20260928042018.10618-1-jemmywong512@gmail.com/

Jemmy Wong (3):
  sched/fair: Add smt_balance and llc_balance to the decision matrix
  sched/fair: Rename group_imbalanced to group_pinned_imb
  sched/fair: Rename sgc->imbalance to sgc->pinned_imb

 kernel/sched/fair.c  | 66 +++++++++++++++++++++++---------------------
 kernel/sched/sched.h |  6 +++-
 2 files changed, 39 insertions(+), 33 deletions(-)

--
2.54.0 (Apple Git-157)

