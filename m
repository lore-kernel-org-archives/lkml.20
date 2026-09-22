Received: from mail-dy2-f15.google.com (mail-dy2-f15.google.com [74.125.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021F3492E2D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110807; cv=none; b=o3RW6S/T4GBy6zNMY6nCA1cwhunLOe5z0aA1zEhWSeaJCpf+KNhOhAcASLW5KkZJXnMunzap/Ap5xAdHehjS1LCPhnVaprWK4QKJqlgCg0QWqgZJiRdF5HmF1rmCaqbfwNtflO+/3hEaPhKHk++xqZbsghCQUZYpbWYRvFHh/jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110807; c=relaxed/simple;
	bh=HfhN83NVgtaQE2H+GN2G/xzYp+SaFQJOfO1TroVBmEY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ht1Bh+Y+pujp/ZinBkc6hlUjPo4g3XihTdsDNoQz2Of+gy2g1t6HIHwEx60qrtd2qQt5I0Z/XZnp00KRb0oXMvJZwoAhXa78TASyQCTqyPY2mxicg1f+AEf92t1SuzbzAXkloQ2xgiy6a3zSLneJpaUGYQtQIL511Jt0daXNi0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHvncLLV; arc=none smtp.client-ip=74.125.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHvncLLV"
Received: by mail-dy2-f15.google.com with SMTP id 5a478bee46e88-32dec843c37so352831eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790110781; x=1790715581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wTN5dzyC0qAZsQ7BP1bHS2J+PZt0xUjiC71KhGCNYoo=;
        b=IHvncLLVucaZnRmuRLzXTVKWzMSIKuRGKlflIOKnX3kswaMl03R4SA/9S+KMCtrBSX
         +osGhlUpVV0MMAa8c5wA/3ty7350ud2VAgnAXC2CH3aadQ6aDP25Wu+yPLhAcyWL9Q+l
         H2ofhmy12CBwtYCORFcnJUXh2fcZSZO9gq10H7YSht21cde6MzO8c3UGJ7ZtXk+YdBON
         3+OUV9yRHZcDPcvUVFDxAuD/ldObr5cIV+NyuyvSqaT+WGorNoLtjklaHgurQYJvVZfV
         BBLJoVlv8215HnZ2hf6gS1AMAksBmyGl6aJDCiqhm+rSJo90Pz/z+/g/X0iOGM3CI7Xv
         yvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110781; x=1790715581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTN5dzyC0qAZsQ7BP1bHS2J+PZt0xUjiC71KhGCNYoo=;
        b=cLfELKSDcaXBRgp+VuOkVk1rkUelOM+l+M8TNRJVMkT1DkqQyCpa2qOlWLdnHrgSuO
         2BkO7l/H7j9MR2okqS102LHldI4bKMwZ5XQ2VEcFSzqv7NxDPSX4R9QqjTShn9Hh9QGu
         aFiFukea9y321NoJmwGCuOrZWm7oZUi/yDUagJcFIt7144N6yzSBU9jhvPazvcrfvZVe
         zdebarlxJtL3FB6n6hZ2F02141c6sZBNxSHNFJzLp+VtGv1L7I51JBugCPzVjMqVHMb9
         s8bTRtNM4+Z3Wf76qI70Ny2jmsUlhch+CwdkfCCr9bJtHc++l8hyATwJxWbs6qhBnMgm
         YKAw==
X-Forwarded-Encrypted: i=1; AKwUvBwydnnCWvnQx7tzxcKThDU/hlKZBxCNSz2yroNoOu6AqlpHXoXB+f1MW0BFpv9rNViRGkw1WHZhpb5K2Ag=@vger.kernel.org
X-Gm-Message-State: AFuF++k4yylIyWBDdNt/v74ZTGNgqwsjStjcOeZXCKNME5lZV7XU50tV
	Y9LlDVOFC8CRHhapkd56SHQQucvxw5Sorpre4JpvP7KmqOkSOB3dUK/0
X-Gm-Gg: AYBFou2bEZcS4+/hmGtr9JPsPpzvyK8xnEGs5CXgD1gLyuD3OPICbchKFSGuG2x6lhG
	Ovy5hjQe1OSlCrmyE6hfVtIqCKh3Egf7vRPuQkzWVFH7MvhZ5i4YYQh1f8z/tci524xoRyddVwO
	nZll+85KSahYUzP04JcxbTDYckFEmucMP6Q7VJNu3lbkImvA77sA++yz5HVXntsKzQyXcg+x7Nh
	nktTxKSo1o5WryhOwg5lenZ5iqBS0jnyJ5BCLV7+Qeb71pMxpiBkRHCYmHWXmreTgT97XFI5oGf
	yXQy9lMB3ONaMDOO7XWMw+FoXqv+pJ3qIRCFbHp0hNioJkr8V0V9UlWo0V15gyNX4MQgJafB2eq
	j1PmllWo2+iPwfPuzVfD6xDBmEWe5kJjOuFx0rHI8U2ka/rK79gPDcRt65dEPsWaCkRSVovbiya
	aZI7SD9fpjYAsf5Zj9wQrxyFSN3JUzqsS9VQCc43gWOKE3LEIpG8z5/7flDUEvVl6nHvV0N/RrO
	T0Cj1r8p0sRcxiAN8esJsepyznPA0zavD7vxe0DqFUKVEo/4DONwNF1vGqEd8xynSOclHnyy+x2
	UVpXeV7ER9LpWGSDvgTV
X-Received: by 2002:a05:7300:4628:b0:33b:dfe3:250d with SMTP id 5a478bee46e88-33e8dbc4687mr514090eec.23.1790110781046;
        Tue, 22 Sep 2026 13:59:41 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm760952eec.25.2026.09.22.13.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:59:40 -0700 (PDT)
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
Subject: [PATCH net-next v8 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Wed, 23 Sep 2026 02:29:21 +0530
Message-Id: <20260922205924.32173-1-hemendranaik@gmail.com>
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
will be posted on net-next as well.

Both the kernel and iproute2 patches can also be found in GitHub:
- https://github.com/H-N41K/linux-net-next/tree/fq_pie_class_stats/
- https://github.com/H-N41K/iproute2-next/tree/fq_pie_class_stats

---
Changelog:
v8:
- No code changes since v7.
- Reword commit message to reflect usage of div_u64().

v7: https://lore.kernel.org/netdev/20260919060125.38063-1-hemendranaik@gmail.com/
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

