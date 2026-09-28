Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E3E555
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570057; cv=none; b=W2ASh14gjorMzY92J1TPV5V/XUND1cF6zZPeR/xQ7R12gg0Qs7ud59TXEN2f9WL4A7cssXa9RwaFJ/J1gxLtQ5Q3v8N0qUqSxmKr8CYPnja9K+ghkQGU/7MOf7HbBkQ83MPwP/JIJVG4cVjU8cckx9WpXgOO3E9Lu2yHCEsB+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570057; c=relaxed/simple;
	bh=8URoYWDkdFnc7wu98Aykk7vM00DX6zXxMA+kJkJhync=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pZmJkdbViRHF47wlxp3ogjbwb3anyoZaQosqsvwSGG4JvzfRRLAMpZgdpH9f+W3GSZ4vNYg9iO3m8CPdQT/Nj3/zkJdvDbWHYPrwrRKdxCZITmWGKIpYanG52l4qTUQhoF0t6CH9e9zu3um3f0DSxu2O4nKLPPMIDi5LGNgBWF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUpwwFeL; arc=none smtp.client-ip=74.125.229.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUpwwFeL"
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso2188342c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570055; x=1791174855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qCSCsxfpeFRT3FvC58Mpv9YAqG4Y65eHsvaTh9jj6ec=;
        b=XUpwwFeLVBilXTrVOz1eHaPnG/gIFuUU+7+8S7gWBhpVvpthbNqS/0+fyFJqtlvOnR
         OrxPnCNrHHu+2Gef0u1Ple6xmlwWFXZ7NzePSxNShhSJMpWfuo0e/SQj1NVQlrfmCEby
         sQ4DPBu8g7YvVQCxXiN4MDnDiSFB4Bmn66S5kwsFaHPeloGzvAFZbi1IZ17BpBXCTqhD
         yQByox2TnCUSqCsL5kVKeGB4DJvZ3lIP6BFAVX/ynd8jFk3s6QLW4VD/qJXb7RJvcoDE
         T220LiYQqd+Nb90T48elGQqqXfqgIkkRVnKNFhCpRbBMieUx0XHubTquhHQqgDR6nxbH
         7n+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570055; x=1791174855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCSCsxfpeFRT3FvC58Mpv9YAqG4Y65eHsvaTh9jj6ec=;
        b=CNmhTLew+DcVEpgoBgOUJW2K1dvHccjifVXrZdUL0g7sW+FUQC0L3IUN5rb1pjkfhp
         wkcLXS71hcT/kPd9Lfqd9lOuVa2Pgx4+p9nnZ9wjXiq/xvzp51H10FCvWw6wOvdl4xBB
         QgHTcP6F6Cd14NRKNRPTSHBt9q+E51772TnH4Fx4bwhNFsgC5AaRbo7zTTqcxxIuwuwV
         8Zr/35xQPbfhJnsPTnFlpGE/+Pyd4Mezkv0c1lWO+8m9MWJvwaQPXoeZyW2dANTvjaTQ
         xztjCZtDSuKBUSVHfuZM0ttN8GMcMbQVIjqJExAna4ZpGeeVMB17PlRqeBVBrjFs/GWn
         bNmA==
X-Forwarded-Encrypted: i=1; AKwUvBwD3jCg/sJUR+NzLuDIskV6ka98xxZRe8nY8HlPxYgYmOOJqcD+ZmzOecF/mPJyQkG+a9DpapKsWOyq0Gs=@vger.kernel.org
X-Gm-Message-State: AFuF++l4B1sRGEr3gcrXw0dAcOo7rg0jgCTmvFEYco9VS1kQCeBbYn7r
	mpqUIP9MDse3AkF80wlWBJwMuwZnqUmRLn5EQLB+U4O878Y5n+mqP8ru
X-Gm-Gg: AYBFou0U04tGmHJYv040/uOlAKLEojrIu+kM61q+30H/4H6g54YXe2U7fEx3Umh/zQ2
	k8uXWvjbg14wV9sY5uq2Z7EwTxeMejEkuY3E1kSenp6aP/dEgwHlLMp65ZHV//AzbYVpmbS7ZcD
	es8Yxh6NvAB5/YstvHuAb0Ub9YOyveKCwWpvs3kVsZjbOBKSh8T8LRu4bLSiB1ReZANK4Mky5Gv
	KDjcOrRsx3d7GedF2kYyWY2tRV6fE84fniNqau0iFHVXtx8uG1Vw3x7Wz6n/CgNID1ZJbZJGLSE
	Pjomyw7aj0oKvT9uHZcgh/bzPx7GB+lD+NLZpTuDlHljZ5/t+sPD8r96vJS3w5vWLZPFDphFHyZ
	4x4x85QjpiZVXNdVqkB125/sAQP9o7BUYsMWnq2374ZCl1ayfMp+2D9sUqD3LCRV5jynvUvbPS9
	nEJbRu6JNPJFryhebx4qfyTLm6Hmm0nEl69NcgrnblU5XYdscVLXjE86p8XWKGeRfNXlNfUQXEZ
	gluAITtc6EXUAMC+xSVbfnCaZmL/cwxvF9KcjBxxWqOtS+BLMhZu5wAPOrT/0IFJZUJsnj8UJAg
	yRj+wA4=
X-Received: by 2002:a05:7022:f515:b0:141:b2c3:d878 with SMTP id a92af1059eb24-146cdebd135mr9019464c88.7.1790570054439;
        Sun, 27 Sep 2026 21:34:14 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:571a:2a:d409:bce3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm27921045c88.14.2026.09.27.21.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:34:14 -0700 (PDT)
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
Subject: [PATCH net-next v9 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Mon, 28 Sep 2026 10:03:55 +0530
Message-Id: <20260928043358.6866-1-hemendranaik@gmail.com>
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

v9:
- Add a blank line between structs in commit 1/3.

v8: https://lore.kernel.org/netdev/20260922205924.32173-1-hemendranaik@gmail.com/
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

 include/uapi/linux/pkt_sched.h                | 21 ++++-
 net/sched/sch_fq_pie.c                        | 88 ++++++++++++++++++-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 ++++++
 3 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.34.1

