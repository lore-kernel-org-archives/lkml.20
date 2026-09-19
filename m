Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB77C361DD5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797707; cv=none; b=TRy8Y5FjUnpodNwYWAAUfiCNRWY8de6DII45MJ7eaRkYZfcTIcMtAO9BWFZ8ByYLhDiL9Py+d1oiImQNjmtkSG+oMhXY3pUzymcBgKOEUG73nDJlGkOUVc3t8XfTm9uLPqym0PRuon4RHngQJidr4bLq3Iks4ugX31yT7S64jZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797707; c=relaxed/simple;
	bh=hUeiMWsfR0bATJZ4paz6Mb39RCA51W43m3tcsCOn5pM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rbEPecVmBzIitO0InYQ/03JIYNVjPQoYOgvizJSwCyry2pi7iRggm79j/GJwk7thRGaGbf2pEWz8LvO2Fq3hbm+N3NKeJ6Hm5UpIU6FU7nolAyCfG4Da99xgSGGxOqzDeUJjTKYGeACdq4A4TI7zurIAAGh0lKIbiI+sd8bhlbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od1H3gSv; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od1H3gSv"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so9681605ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797705; x=1790402505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Yv+Xvj7YTL81QyfNkbhiu6Y+qyJIuCpgzlKFyNsHtY=;
        b=Od1H3gSvRliTw3NzaPiretDlucdWr6i/JkP8dQgbWAUIiRPyUXySSHo1gxsDWheA0h
         qtnhkiqyDcXUAKtrhlc8WdXyJPQ396ETWO6Ernj9s77YsLfIIaPdQ0ZDnW9ZL68x1lDT
         FpVHk2i35cNTtlG4PJPHY5wSBZ4G4QaT6vyl82nF61ciKCgbUNudw+Eo808zx/PDJBWQ
         HdFUV3Uqj39WqYEzrFvEZxKdWT61IvzEd6CH82GpXMFrAl+V7U/iZU59WnkfY86kvx7h
         hWa74eMDJvuOKm6/XPXnfEnPxwqFrol6NfV4KYGskpzYxB+tjPMqbj6L66ZNFdes5oZp
         E2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797705; x=1790402505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Yv+Xvj7YTL81QyfNkbhiu6Y+qyJIuCpgzlKFyNsHtY=;
        b=ie6oI6J5XrnQAHO4t+V71rDsW3X/1HUc3pRccHPjWhosRbxX+MgqG0Ffs0LCG6ONem
         hAsT7A7qljXTrsZVl5YGP0M53IzAnhjqJfUFFeExfbnNZ5TJbKCvMYphvYXB72cRqROk
         E53KeW1nW/756JsPiTSyHe4tckjJYKe+IexF77Ec9e4jbdzfJDsTa92EiFza1VF9khAi
         pqBmVgLxoMJsB9xK65r9BMaFEHef3hFO/cYVIcZcbilKt/Wtb/90Q/ifE1/rXOxGjn67
         X2sx5x5FHK+C5CUS75XrhtlXEhBN18ezbIik12qLbFouCMPROFujPgQgi70/9oAZFMtO
         0BOA==
X-Forwarded-Encrypted: i=1; AKwUvBxiza0N8N/Qf2CW0f9+jT8P0ZURi8e201kGP3b7+FT6GaVRcWZdzc8gyjErUN3nFuDhUdDgIYcHTUtUhaE=@vger.kernel.org
X-Gm-Message-State: AFuF++n+N8ZaonKJWEfuEhfyvrf8lVnoYL/NhuETCXavIT5ejKDoBQir
	cPb4rJ4LSz580GQn/zfP8Hnxy/wwe/0HxKBFB7o3gTKzsqdez5gUgDOm
X-Gm-Gg: AYBFou0mIbBDuB2HGbbS3qfvTnTXrvw25oXZ9eHd9JqjsIY/x1TKDKzOt3LcDinGjdZ
	IxMynJ19xB4EI+MoEA8+k75FKojpnzY+Q6y60B5C0Te+KTy1kyPTThpsvQnx5v97shlJrnHStcC
	MF6S9hMMrhB0utxFKO1tsGYS9ZAzSdon0sA8Wy0viqpuShkyAhDIHxRVW+QXof71P3BuXBAE9i0
	mvP8hF0JBU3GgE1/i8vytgwgH/g4l9xAKSI+PMDNbGmtoaeiw7z0V6sTQ60YHKN8vz8KMwjYaVA
	s7pS+SNLKGX2I0QsLl3wBOczPAnVCScdqFPqrnys0wYGf3o1yVpEHwkIU3eSqlpl0odPUqNb1xf
	G9JAB0tGDBvM36S+KStJ6NMgsaeqVjQKfomYvag40ivKOYyVXDiF8bRA/8gsVCqTScD7VAfWEMc
	nKFvWZWDVMiK2mZH4efU91I/TEC9I6wJOiDqg/7KpnPpr68zVQg9d0gPYjhz3v+fsuSp0Pbl2zi
	YsW+JDacMTmPs1Sog1/H5Fq8XAQ5kJflI+9FQ9d9FdfkUZEFaaxCcdfIxMM8Eb3f4s82g9+UkI=
X-Received: by 2002:a17:903:3246:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2ddb1af3398mr80521885ad.14.1789797705112;
        Fri, 18 Sep 2026 23:01:45 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:d11b:773b:fa83:c49a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33140f7fsm3658321eec.13.2026.09.18.23.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:01:44 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v7 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Sat, 19 Sep 2026 11:31:22 +0530
Message-Id: <20260919060125.38063-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE runs an independent PIE controller per flow but exposes no
per-flow statistics. This series wires up fq_pie_class_ops to expose
per-flow AQM state (prob, delay, deficit, avg_dq_rate) via
'tc -s class show', following a similar pattern as FQ-CoDel.

This patch series is accompanied by a companion iproute2 patch series that
will be posted on net-dev mailing list as well.

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/commits/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats

---
Changelog:
v7:
- No code changes since v6.
- Rebased over the latest net-next tree and re-submitted patch.

v6: https://lore.kernel.org/netdev/20260917204225.275251-1-hemendranaik@gmail.com/
- Address Sashiko review comments:
  - Revert the fq_pie flows range to [1..65536]. 
  - Also drop the accompanying selftest 83be change.
  - Compute the per-flow delay with div_u64() on the full 64-bit
    nanosecond value.
  - Widen avg_dq_rate to u64 before scaling it by PSCHED_TICKS_PER_SEC.
  - Document the 36 to 64 byte xstats growth in the patch 1 commit message.
  - Fix selftest 83c0. The ping payload exceeded the TBF burst so no
    packet ever reached fq_pie, and the missing -W left the run waiting
    out ping's default timeout.

v5: https://lore.kernel.org/netdev/20260902035231.81866-1-hemendranaik@gmail.com/
- Addressed Sashiko review comments:
 - Omitted .tcf_block / .bind_tcf / .unbind_tcf from cl_ops (statistics
   only being exported; filter attach to fq_pie is now disabled).
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is a direct
   struct member.
 - Limited flows to [1..65535] so per-flow class handles fit in a 16-bit
   TC minor.
 - Rewrote selftest 83c0 with TBF + fq_pie, ping traffic, and
   matchCount 1 on per-flow stats output.
 - Updated selftest 83be for the new flows limit.
 - Dropped the tools/include UAPI mirror changes from patch 3/3.

v4: https://lore.kernel.org/netdev/20260727164056.106203-1-hemendranaik@gmail.com/
- Fixed unaligned commit message; moved typo fixes to another patch.

v3: https://lore.kernel.org/netdev/20260630183702.170798-1-hemendranaik@gmail.com/
- No changes since v2.
- Resent after the previous submission was deferred due to the
  net-next tree closing during review.
- Updated corresponding iproute2 patch in response to review comments;
  kernel patches unchanged.

v2: https://lore.kernel.org/netdev/20260614125000.6058-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue for tc_fq_pie_xstats.

v1: https://lore.kernel.org/netdev/20260531125314.22492-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (3):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test
  net/sched: pie: correct tc_pie_xstats field documentation

 include/uapi/linux/pkt_sched.h                | 20 ++++-
 net/sched/sch_fq_pie.c                        | 86 ++++++++++++++++++-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 ++++++
 3 files changed, 130 insertions(+), 3 deletions(-)

-- 
2.34.1

