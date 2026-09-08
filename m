Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D20565113
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889954; cv=none; b=ZQN45eB/rxAKrxJwpFzWrGTibg3op70dGXvF8morffXb4tOYmpCgeqLiIwc4s8z/TBCbwKejADnVVk3K3PKv8xtAKi4E3Qi1PMXxMQHJBhjYoLrW+A3UUNGk19h0sezs8Vl/u190mlzcl+hjDZT3rnMtOXtGWoybK5NlMyCCulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889954; c=relaxed/simple;
	bh=KLjeMvdxyqc6SnotIiFUKvLtc/Zy+nfps2KNDr3g1+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d9QVsNOuPQpzhE0KeEIAXqddzai1LaimjlJ6xi6Z4RvfmK4i+nYvN8HkofmBYmNHCscqeScbIKAHNEbtr9rKzK043Kxg/dSBFRvE3EVp22e8OrCEc9rUtDf+4ghi4P+wEFnA/OkO8WlVURJsWnN8LvBb4yojH7H+FxN8Y9pEMwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Le7bFbcB; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Le7bFbcB"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso3290813a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889951; x=1789494751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yuf7kW9a8gMm8dZPCPYh7BVn/yZWMPnrvgi9MavGUdA=;
        b=Le7bFbcBN7fW7k+Kv4zvNee4tu0BhOdi1XuAx6vYxqNJFa3f0dHwurTzPctMuU3Bnw
         UGnHQfY0QxrjSj33IsicOXTQFIO9Dn3cDvlYDJ/FL9BxZj/cw54a2OjcBLFsf8cKL+A8
         eHC7ZTRlPutWNzb+80uHE3DXK+T76Q52M8R+A88/b1lBePUTNEVeZU8CohGEJLoKnywF
         Spx56465lDDuCybX51HCdKMtFWo6rpnFmt+BtLDCPkdWjOzKPIeIad0fMx/9GjeEWL1+
         VXSWf7CKAWbTZuEHsDsUfe7Tj/8xRe7YjS78oZX7Gj8cEhKRWo78QcCoDGhLt0pz1kLs
         PU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889951; x=1789494751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuf7kW9a8gMm8dZPCPYh7BVn/yZWMPnrvgi9MavGUdA=;
        b=hl7QcWRL7OSOHK1Jx6U5Jsel4/7L7g+QUF4Fa6/Oksc+JgboCsFIm3f8B7kQgZ5sS3
         GwulCVpDaAQS7vVHX1e4/wd/HWMjfPHRlyfXvLoanAjAWTXTR+gzpmYAP/PBYYZQXHdb
         fC+cvucNgsywrj2SUy7MLEplE/lqM8GywB3kCgzx6uyq7v2mcE0GZnBWG9aBxoRcL1OY
         mg1aUGZSh6gI/0/JKLaaBRBHRwGvDTidoiHhY7CpHz0fmxfC9VbmKNW+4EmD60HmQ34M
         hthvJ5d96+faNXbUm58Z7IzgZe+sKcKqiaQNtwT8ISlN/x7g5LbIXEBinYZ7rYzzGEVk
         i1HA==
X-Forwarded-Encrypted: i=1; AKwUvBz0gRe8ginOzVcBfYmmwzL5En+ktTgdYUJmgWj/hG8nUG15TQfvduSsXLPvpcQv7Yq82Qfjz8hEXnIKFso=@vger.kernel.org
X-Gm-Message-State: AFuF++kom0TRkabvXtedHXcAgfbhv3bNWkT8cCmw1seoKMWTsezxz0T3
	huy4cjXiJL3U+gvADsBcp/oBKklRRFoxoFPxmO/ABVxabTWxPzDx4OqM
X-Gm-Gg: AYBFou0EZrnVKy9OMpI+oUiLO3RJZxEk0TvC1d4YKNpCbkhakfq7uoL4llMu/NNl41E
	e/wYuaG3QhBBgtTYF9s0yAsfIZO2FXDx+WR/8BU1BK0mOISVKBEWvnuOvtkedFTYY0J861ixBxJ
	JglNB7LlYLnAmk5i91RcA2qe7k2KIew6rPsW4gO3kdACkL6PDbAUMxNAbADVSp0TavolUJVvbmT
	Hcn+GhQ8+OqSs6BQPFWhUSvKL/wLxCtW9HMWSosBiUNKStC5rh1pwsNOLIJLsmDgCo7tHXRCVB7
	AgDj0S5Mi2vh3uWkuNXJubkryk+NcuMMkRbwXVKDavElvkz+jZ+bvUzVACUOyFcmrZPoTdUzcSA
	ue0k64BPbanxTJumUtAE0tGOdK9BQU05Nlq250rygsZWhHcBJCezQQx9XpB6pG9JRaBDF5dtPV2
	LXJZYYiIJyoc+d7l3kuIEMqaUEZbauIzepB6+ayfEzBTAbJvhtnVdv3vPt221tpAxhNjcJxZGjh
	oTyQJavYv1dPJr2zQ==
X-Received: by 2002:a05:6a21:d82:b0:3d3:af86:fb94 with SMTP id adf61e73a8af0-3da3a246eb2mr48825562637.26.1788889951323;
        Tue, 08 Sep 2026 10:52:31 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:885b:4183:b098:c1b9:7033:be8a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45a6abaa2sm5384356a12.23.2026.09.08.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:52:30 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: 
Cc: Liew Rui Yan <aethernet65535@gmail.com>,
	SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] Docs/mm/damon/design: clarify when qt_exceeds increases
Date: Wed,  9 Sep 2026 01:50:23 +0800
Message-ID: <20260908175105.42558-2-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qt_exceeds counts how many times the quota of a scheme has exceeded.

The value can confuse users when the effective size quota is zero,
because a zero effective size quota does not always mean the quotas are
unset.

If the quotas are unset, that is, both ms and bytes are zero and no
quota goal is set, qt_exceeds never increases.  But if the user uses
the temporal auto-tuning algorithm, the effective size quota becomes
zero once the goal is [over-]achieved.  In that case the quotas are
still set, so qt_exceeds keeps increasing once per quota reset
interval while the goal stays achieved.

Clarify this on the design document.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

By the way, I found a thing in the design document that confused me.

    temporal: More straightforward algorithm. Tries to achieve the goal
    as fast as possible, using maximum allowed quota, but only for a
    temporal short time. ---> When the quota is under-achieved, this
    algorithm keeps tuning quota to a maximum allowed one. Once the
    quota is [over]-achieved <---, this sets the quota zero. Useful for
    deterministic control required environments.

I'm not sure if "goal" was accidentally written as "quota" here.  Would
this be better?

    When the goal is under-achieved, this algorithm keeps tuning quota
    to a maximum allowed one. Once the goal is [over-]achieved, [...]

---
 Documentation/mm/damon/design.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index d036340dae8a..e083b74d618b 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -863,6 +863,16 @@ scheme's execution.
   completely tried to be applied.
 - ``max_nr_snapshots``: Upper limit of ``nr_snapshots``.
 
+``qt_exceeds`` is increased for schemes with set quotas when the quota is found
+full at a quota reset interval boundary.  While the quotas are unset,
+``qt_exceeds`` never increased.  However, a zero effective size quota does not
+always mean the quotas are unset, if the ``temporal`` :ref:`auto-tuning
+algorithm <damon_design_damos_quotas_auto_tuning>` is used, the effective size
+quota is set to zero once the goal is [over-]achieved.  Since a set quota of
+zero effective size is always considered full, ``qt_exceeds`` keeps being
+increased once per quota reset interval in that case, until the goal is
+under-achieved again.
+
 "A scheme is tried to be applied to a region" means DAMOS core logic determined
 the region is eligible to apply the scheme's :ref:`action
 <damon_design_damos_action>`.  The :ref:`access pattern
-- 
2.55.0

