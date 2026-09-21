Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5803529992B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956023; cv=none; b=ETDgtL6wQaAvZSK/RVPthSNZcnOeBchhmYMa3xuqshnrATBQKr+/pnz0zUyevyfKvZfb4L0nLz2/I/YY3oAsir4R4MpSOzu60imDwQl4IoSz4PORU37LInC0ONWjPMdEgoay7baIiX6LigpbdZJqOt14s46Q30qH/GQN0FZwGLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956023; c=relaxed/simple;
	bh=A+RJJnYsn8OIpInlPmG+k5uxSqICSok8KjI8Y67ZW7I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dQjAm8k+TtEWO+EQK7rrsxI8WN8JC+ffyLqClMleW7eHmp3gr2BKd/QXC7avbib46hmfk/Zy+jVPyxZi5qCs6dpx3f/hSknPpwRfY6CmuOvhA459QDXQGVKdqu/Ntc7tECOAWWnzby3Ytr7PAkyIi18eOlj/WuYUCOge95UyfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSRuTE9O; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSRuTE9O"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso17689285e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789956020; x=1790560820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dl3X5lIuCDCuxRfR4V0ReBm9Zl+q43AQqD3mJ2yz/dQ=;
        b=TSRuTE9OMBIbeg6cL+ZEbFFWg7CMxWLvGWbogEFYUTnuc9BGGE/y460dOS6Oq0qr9H
         kfPiI9TiVSG9WMrR5rsrAqABJhud+AaqcVNzRk8E1xj4Hubu3k3s970EgA9QPKQqBu6f
         geoz9ErI232YZNTbePQchNtNnH7LjNZ1GSf2XJuPluWRgTvDLsuqfiaZObWBg0nh9VD1
         7EtAuktU8gn8QF7B3kUoec9UxTLRKBzri8PRGP4FjVpGDAlxyzHSJJHzjl5nzwNKXdMD
         tl/4c9dwZVqNYmAwdQW8pLn1bZBiVL3sqEPCTWH73fDWIYfMVvejv/y4BCRnZy913Yhx
         F+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789956020; x=1790560820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dl3X5lIuCDCuxRfR4V0ReBm9Zl+q43AQqD3mJ2yz/dQ=;
        b=fUse6E0/mYcPCJq4LoJJcCdexkVLIi1EvZbVFZw/F6cGiIFSsYZJOMGoqEs1rsYy9l
         /o1/mJYVZlkavqIWGtHBYb8Y3TRi2NuXUDQ+SyIRkFxi0ad/wswgrtuwD8jSK4JnqHJ5
         oMxXqjzJ8GdyoHrsifww+pofHlfH7xug/yNH2dnVCyZY7nUkmyAC+b6ynbuvp29Ay+6u
         ahYgwZHTi0GFoAEvzYTvNagCgWLqC1C066ddyrBymfdGd1c5kRGcEyruRWtEqJfAWGhk
         x2b8ajXWAA2ut/+vkG7A7N3XnDQw58V/BAZ3TUJ7Y9bsupgLdOPRubiGzlSUbAJFWk3F
         7J7A==
X-Forwarded-Encrypted: i=1; AKwUvBxwpF5o/ogwv4aG3afWHO0Hwvu73afnaVaCxhI48RhzzKsiRyDHWsdjFW1A4rEH9rQumGC6aPZfNX8gS40=@vger.kernel.org
X-Gm-Message-State: AFuF++neDJdmh58pMUmNnN7y429Uv0qJCDDEhHA4rtg11VPFpcGm/YCb
	QEmG8TZMmVa1IPw4yK2/YgHnBl5eiLctYubd0dd2tCJxxmvEVnwEgUgp
X-Gm-Gg: AYBFou3ioa2VAtxewizn9fg7KXFnQpQreAOeHwgDDNOpOlrXmrRdrPJzDvHa+cWeZci
	3S47GHiwRXUn1wxsr54VOIeUTMjnS6KOVABFQyJpM86GGbjYudxLR+4K0kb6ZYzhkTXOlFbMmrd
	7ZnTKhJj1wWguXRjoETn6Ds9pfK7OCxYJ8L5RiEcab5ktJbpdnxTAE94aYvzi0lR0ativNvv5ml
	ylsF66yFi5ft9dxfHDMioRfFncXT0PhV9QvXNrgYl20ajMhY/rUtE0Y5CioCcksFx0/+VgV376R
	FrPsSeObFciN/AjfmteIDTCiahTEE0unMBXpAisLM4T0nRR6Tirjleq5uLY8HsZPhfN+8jVzV1d
	T9p6btHQ4HvppNcXIRQd4pnxAEK3DT646FoCH2xLblZpryAxR1tKEJ+wqzND3ScgjE+wiRou5rq
	yZFUfS3lpHywsU+OTx76dvk8fzLEJqw/hQbBiZrwrj4fQt+AfIjVe6vnK5/qV0xrnkxx8DlPGQe
	dS19nXspV2NAgrJh7BytN2EmXWe9WJ6n8Hn3qia4xb/ZucqYgoRPj5w8qLX7TRWqoWZO90gFU0s
	WNxX8UBcwhds1rImWTPUeZ1mxXV1Afp5s2fKh6Hh0qQmQ78rR8VapnwFcWq/OFixWsakeHLiJPo
	a1Q==
X-Received: by 2002:a05:600c:4e50:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49fc5728f5amr118239615e9.17.1789956020203;
        Sun, 20 Sep 2026 19:00:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-2c36-515f-49b6-c492.310.pool.telefonica.de. [2a02:3100:a8e9:c501:2c36:515f:49b6:c492])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm193284995e9.7.2026.09.20.19.00.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 19:00:19 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lian Wang <lianux.mm@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mm/damon: preserve temporal quota state for unmeasured PSI goals
Date: Mon, 21 Sep 2026 04:00:11 +0200
Message-Id: <20260921020013.33105-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PSI quota goal without a previous sample is scored as achieved. This
leaves the consist tuner's input unchanged but sets the temporal quota
to zero. Preserve the temporal tuner's previous goal-achievement state
using its effective quota, as SJ suggested [1], and test the helper with
explicit PSI totals.

All 42 DAMON KUnit tests pass on x86-64 and i386. With the original
scoring retained in the extracted helper, the new test fails on both.
In a live damo test, a goals-only update changes a running 64 KiB quota
to zero for an unmeasured round without the fix. With the fix, the
effective quota stays at 64 KiB. A full damo tune also needs the separate
quota-reset fix [3], so the context update preserves the running quota
used for this decision.

DAMON selftests show no new failures (QEMU TCG guest; the wss_estimation
test misses its accuracy bounds with and without the fix).

Changes since v1 [2]:
 - Use the previous effective quota for the temporal decision, including
   when it is zero. Keep resetting last_psi_total for new and updated
   goals.
 - Move the current-value calculation and last_psi_total update into a
   helper. Test both tuners with explicit samples and check
   last_psi_total after each call.

The series is based on mm-new as of September 20.

[1] https://lore.kernel.org/damon/20260916001311.101024-1-sj@kernel.org/
[2] https://lore.kernel.org/20260915060937.3423-1-kmehltretter@gmail.com/
[3] https://lore.kernel.org/20260921003047.12041-1-kmehltretter@gmail.com/

Karl Mehltretter (2):
  mm/damon/core: keep the temporal tuner quota over an unmeasured PSI
    round
  mm/damon/tests/core-kunit: test PSI goal values with explicit samples

 mm/damon/core.c             | 30 ++++++++++++++++++++------
 mm/damon/tests/core-kunit.h | 43 +++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 7 deletions(-)


base-commit: 185111f116aabf202d12ce440c0f6e9bae073514
-- 
2.53.0

