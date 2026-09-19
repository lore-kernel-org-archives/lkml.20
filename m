Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD42E040D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798389; cv=none; b=icAQRrQ7kiRDMq6inmv2DRI+gr0+N/qOyXituBG+yV5RTT7i7Dbi1CTi8dzSz350lNnouQNrF3ft83BqYC68dJAe4zV658WU+BvJRL5NT+0PFKNAzF9kL49bl0xPzgBhHVhR01f2yPQ6Tn1Cl+eACA+flbf7wzlAUwzzuqNqfiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798389; c=relaxed/simple;
	bh=PuRLeK0kxJFu1U0+l/zDyzGHEF3zEbInehgp5gFdOuw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h6itJJJ0jcHBEhIDPeXPIOefGQcXtTsiquVB8ROkRhqgEEKtGnqYOlBighB5afsY/5TFVX6raQ41vWCKQ8DNlGhxxnZj07A8GJu0PgtQoE/g7muGIN+5V4B7bcs7fSQ7BQpH4noIsAJtTnbc5w6l39Fu9BYG2VEVD5hqZ7s70gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJqNs60C; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJqNs60C"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so1044829a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789798388; x=1790403188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKHdeebXXBw0isNjR8wlUSLF2hh2to2En0Awr5oG48c=;
        b=BJqNs60CV3tfjHo4NknUwn+E9JwsuSnYQfWW0nY3fCGM3YqGjZoooyp/QlZ/Z7RQWI
         82Sw/gKjw9HwKmJB/WFV/6kGFX3d/0KzPfXP2XbWNyysubmaHqoj9S7KEKk48vV0PDzr
         tGyhirQJ+fsDSytAKGSIFCgBhM5MQnl6Ve5n/dPJes4wXpNVqheRs+tT6YGuwscZ5iRE
         B3H4X/5hAV179B1VPxMHQzCGkwcDJFxzIevA+I/XtKkFtBBxHcWiAcrdgzGR/VMvEbcl
         lxubkHCsyzFkdICnunTSLTCutG53j+rjf3TA+3eZHjtH1odP2DQiSOkz5R2gZTBu+Te/
         lUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789798388; x=1790403188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKHdeebXXBw0isNjR8wlUSLF2hh2to2En0Awr5oG48c=;
        b=mTk5apL25ffv8+TcugBK8foWru2rKFYRc9bCto4T26mBmdKXBOyxjYgFsNeYpSTYRx
         OLB0uDGJFV7E3kAyT/p0kMi1NVMu9c2xOFLfK3eapNikpFuDzeUaoG7xyd53nxr5A4Yo
         Q8TpZLMJtcCYslvQ1cSm9XyfSARY8QF1NcmEi5BaD9h/fQN8PfoMH4kd9q1bd9xL16gv
         NQGt24MWo3mNvyemKzDsqgUJ61xYHhUlNh72QLhnQxuWAzkLoFATauAO9vvCDpnzIxd4
         niJRJjAuHDcV3OLybekUlj8G2v6JZgsbW+Xzhgl5duVEZBJDo95ZENhq5IJ/9cRVBxzY
         D7Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzs8SgOIiljX+p2Gg9d7X8g7hROM69jBHVzqS9/8KfjXSVSMn/htDwGMf18R2lLfsIWFxb6+asLjV+Aocw=@vger.kernel.org
X-Gm-Message-State: AFuF++kQZxnZc5CanHOSCV5AmcDim9y5zLBxuSC8G4kudo21UKjVU7IP
	FexjiNLtb5vpGUc7+L7OMKS977xbopnkEr4vtjslEZJsKGOxGyTxpzob
X-Gm-Gg: AYBFou1b2kpfriXLz+fcKeEQmx4KftQX+lkgBKw1IIWjfGvW14JPTvLrUmTLvfhA1BF
	My3Rw6uUKLSC3yXNr78Se48v7xmBzQdXQfq8+9tlQI4TjAxQfTeDFiXiOQBqb+JeyFkzh39BjJv
	eCl5O5oO7RPZsWLN0+W2GYssbZpMK0iG1V3zV8cwKDUBbDPghf1EOwLeooL1uQiIuNtX1UAKBGW
	3/0+cu80dpwivOE5JLWuat/ryMKIlKtbbXVo4zDZaIHil7olHQAlMPPGqk/E4DhR/zBG9c4SOns
	wdLyzCABl5snam8yqQ9YtEcsi86Q4otqPh+u+0bpKdc0C4b1/dm0E7XWlY1j4fIC9mX55vjK/vs
	mt+KDX1XwAv+Y49QXvoC837ka7Tzrs1ieEwlI8m0SCOaYhNWnj733PuqqQfA1P7W9Tehmo8ee6U
	SksVxo3ifQeoaQW5bnlz2qGoYKD58xYzbrCQhd4iKxGl/vtAeo78TfZntcGOBjTBnwSMnReNpFK
	LWhRC7q2UIK9zG4nH5DEQ9SwL3ScVLS6XdipSCXbRn/pb51yItRcDaRn2Jmzd01lv4do3rZuWg=
X-Received: by 2002:a17:90b:2d0c:b0:39e:6c6a:208f with SMTP id 98e67ed59e1d1-39e6c6a2272mr2274654a91.48.1789798387875;
        Fri, 18 Sep 2026 23:13:07 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:d11b:773b:fa83:c49a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm5781280c88.15.2026.09.18.23.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:13:07 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v6 0/3] tc: fq_pie: add per-flow class statistics support
Date: Sat, 19 Sep 2026 11:42:51 +0530
Message-Id: <20260919061254.39678-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE exposes no per-flow AQM state in userspace today. This series
adds tc support for printing per-flow statistics via
'tc -s class show', matching the kernel fq_pie class ops series.

The corresponding kernel series can be viewed here:
https://lore.kernel.org/netdev/20260919060125.38063-1-hemendranaik@gmail.com/

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/commits/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats/
---
Changelog:

v6:
- No code changes since v5.
- Rebased over the latest iproute2-next tree and re-submitted patch.

v5: https://lore.kernel.org/netdev/20260902040221.83734-1-hemendranaik@gmail.com/
- Addressed Sashiko review comments (folded into patch 1/3):
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is now a direct
   struct member in the UAPI header.

v4: https://lore.kernel.org/netdev/20260727165028.106817-1-hemendranaik@gmail.com/
- Split into 3 patches: fq_pie class stats, pie avg_dq_rate
  formatting, and tc_pie_xstats comment fixes.

v3: https://lore.kernel.org/netdev/20260630184453.171410-1-hemendranaik@gmail.com/
- Moved print_nl() into each xstats type block to preserve output
  formatting.

v2: https://lore.kernel.org/netdev/20260614130729.10076-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue.

v1: https://lore.kernel.org/netdev/20260531131411.28213-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (3):
  tc: fq_pie: add support for printing per-flow PIE statistics
  tc: pie: print avg_dq_rate in human-readable format
  tc: correct tc_pie_xstats field documentation

 include/uapi/linux/pkt_sched.h | 21 ++++++++++--
 man/man8/tc-fq_pie.8           | 18 +++++++++++
 man/man8/tc-pie.8              |  2 +-
 tc/q_fq_pie.c                  | 59 +++++++++++++++++++++++-----------
 tc/q_pie.c                     |  4 +--
 5 files changed, 80 insertions(+), 24 deletions(-)

-- 
2.34.1

