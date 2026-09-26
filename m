Received: from mail-dy2-f18.google.com (mail-dy2-f18.google.com [74.125.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E354707C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386019; cv=none; b=dZXLfpQa/+qLAzUEwxCmCV5HMy3xU4RFBrYGcjs5DnAoWa+Cy8+Re/UgnzlCcTdZMWdc/DfVntP5qUepx6xHCKDslnDjRDxZijRngSr0FSZMVd40UUdvyn4yEZyh6yZ7GG8bfROwKCXxBgM6hh5f7GsAF5YQQwZc8D3a7+g2+Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386019; c=relaxed/simple;
	bh=McT+3nU97+uEmwsYTVIAwdYsdN1fAkDCYPr4Ya3XDqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCbxThUHoWExmWaSjVkjkxK9LJ2AiCsct7ZgRiyoHzvLimsQ0D8elbeYkXSxboJt+pYlRyU8r8gLD0EfiQi2r2Y9Wzvlpj5ozq2IrJ530pqhkFSX5RZ9AoCUejAO5YDFb3JgTvP8vAixTb8ck1Nb6l9tuqm5hEX1y9xw+v+qmsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR5e/GCi; arc=none smtp.client-ip=74.125.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR5e/GCi"
Received: by mail-dy2-f18.google.com with SMTP id 5a478bee46e88-342773d94a7so431257eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386017; x=1790990817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cHte4Neu3W8RZcyDmv52kr0y+zD01fxuvsRbU2Mqdec=;
        b=lR5e/GCi1zbEc0fjV3cZjTbDAzSXA7M6HxJNSuM/JmCYtEYBzEWNCKRpjsD6LX0MTz
         RBfHiEntaWSafxzdF8A2BB9SJ85U5j98cEdSm7K+4GDIFs+K35y9xrOuImek8G9mbVeX
         psXDyZyrNwaESkQg7dzEvoYwnWOsXGYohqdovPd101Q2W9nDjpP3QiDrxxOi4UKF0FHQ
         72e3Ft/6nUdpXdLO7CizLsvEUcaIq70AegT4XycRHs4yTk9ZLFxQ/bHXxf1yIJS0+n1m
         teOecWvaKWuKKFeBJmsLbjThDqCUDQXBT8/FisLEVJTgj67FfZwvOLvJWYlx6r1wtYv6
         0zSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386017; x=1790990817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHte4Neu3W8RZcyDmv52kr0y+zD01fxuvsRbU2Mqdec=;
        b=ESm8LfugovTLKocWNA+BDLsgkIMEvlxKKcgN4ZPZmdorNdMxQv1Mq2JwnmaCZq+5gZ
         XTwbOQPRMWPwyfBX01oBnU6ORcyqQ9QY4Yq37xLzDezFrVMjuowR/gw6U1wmShAcfhn3
         Tzl+9Fnu6qja0r4UAiaRUCPuWS3lkBPNFu+84zomDS3ANc8bNRzLT+pmQjeOp47zrN/n
         Zw6WAzVwJYiJEmTw6hsGtAhf4ElRcglzVZRrx+1JOEzuroWCSCZ9gCYAYW3kZYMBkd8H
         /0K5qiNqmZfIdGxEBxY1pWFI09a//mFlq9DfN5yPtkKfwbyOs6WhpWhgUy2/UCHTkWpF
         9K/Q==
X-Forwarded-Encrypted: i=1; AKwUvByrPItoptXdV2VDutQrcjMRBjOCMHdVjLM/liOO5Pbedf2b4UrXPTjNWpfakcP226ASe0Bz2q1atVQRbtk=@vger.kernel.org
X-Gm-Message-State: AFuF++kPb7IBMSCstqHyKhRmyB2FKtpK8VGlVt821brAWJFGngFY4oUt
	wirxYCZ/m4+phyXXPP1qVIuud+YmFmHw6e3Och1XixO+ENoQHNRYuX2NJWj0lWrI
X-Gm-Gg: AYBFou2SCJzhuyu+MK74XXYJ7RdlyYpHFLI3eIxlIk2v9dXhVbmL9pIewWFYp5Yxrnf
	ELb+S3Uy6CvIbdU+KgC7/3bmQwz8mxwLJps9dG8i+9AJICgSKrb3L1Y1Tbh8KSyKt21zzLH/51f
	gCoU0OES6RIdWelew0L+DjRPX62stIMklgEXwWcem2/5jDKI5yxynpdP5l/1VRFtdjvMI7HuYvu
	uVxxgtuY/s3ueRmE5vvlSm/SpEqmnIgNMzMSvuRaRjbdxcy0B1zhvGWRXubCc+pA4CnqivdgeYH
	I3StqD8evvXlp8fxdZRQhUvEkefzJkaI1IelgGtzQB+npmjwd/5nFBsjjkPZuob/oIaffY4YUx5
	KyuYHPGnFBl/NbXy3RPW4MMXbj0y7HjxawNgKaWI84vCeV5nmq6FDWqzPYNoMk81i7XbQQzre/E
	jyKJhWfRtvfgjuXdqWEaqG/fwnciTJTu36hUGDN/+EbdBhwEjjXj4sTFLZBCkw8IgPOAnMlbssh
	6UuYgy7pFljirsV51yWhe274VNfBj2YEgDXfavE7QFrwYcMBOF2j3eiR7TR1AjuwMyosy6cqUQr
	u+Au8hotGTdOXbGdCh2Kc4ptlVqQ9flLoy7Qtu1Lc6ALAlaveunDALKrS/74EIHu4Xzy7tBNmdC
	iZbeOXi/D
X-Received: by 2002:a05:7300:a987:b0:341:bcd4:7b6a with SMTP id 5a478bee46e88-3426f8c1dcfmr2250317eec.4.1790386016524;
        Fri, 25 Sep 2026 18:26:56 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341f2b18cbfsm6746171eec.30.2026.09.25.18.26.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 18:26:55 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] bitmap: fix three parsing bugs in bitmap_parse() and bitmap_parselist()
Date: Sat, 26 Sep 2026 06:56:45 +0530
Message-ID: <20260926012651.15524-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three cases where the bitmap string parsers accept
input they are documented to reject, or produce a different mask than
the one requested.  Each fix is followed by a patch adding the failing
cases to lib/test_bitmap.c.

 1-2: bitmap_parse() treats a non-hex character directly before a chunk
      of exactly eight hex digits as a separator, so "x12345678" and
      "0x0000000f" are accepted while "0xf" is rejected.  This is a
      regression from the bitmap_parse() rework; the old __bitmap_parse()
      rejected all of them.

 3-4: bitmap_parselist() does not check for the end of the region after
      the group size of a "range:used/group" region, so since N and
      all became valid region starts, "0-7:1/2N" or "0-7:1/2all" are
      silently parsed as two regions.

 5-6: bitmap_parselist() walks a "range:used/group" region with an
      unsigned int that wraps around when the group size is close to
      UINT_MAX, setting bits below the requested range.  This needs an
      absurd group size and never writes out of bounds.

With the series applied, test_bitmap reports "all 391544 tests passed"
(UML, x86_64).  The three fixes are independent and can be applied in
any order.

These patches were prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5): the analysis, the Lean models used to find and check the bugs,
the fixes and the tests. I reviewed them and take responsibility for them. The
trailer only says "Assisted-by: LLM", as Documentation/process/coding-assistants.rst
requires since commit 816d9992d9ed ("coding-assistants: simplify attribution").

Changes in v2:
- Resent with my full name, as asked by Yury.
- Stated the tool and model used above.
- No code changes.

v1: https://lore.kernel.org/r/20260925102307.49513-1-jain.sm@gmail.com


smjain (6):
  bitmap: bitmap_parse(): reject non-hex character before 8 digits
  bitmap: test bitmap_parse() with an illegal character before 8 hex
    digits
  bitmap: bitmap_parselist(): reject trailing characters after group
    size
  bitmap: test bitmap_parselist() with text after the group size
  bitmap: bitmap_parselist(): don't wrap around on a huge group size
  bitmap: test bitmap_parselist() with a group size close to UINT_MAX

 lib/bitmap-str.c  | 24 +++++++++++++++++++-----
 lib/test_bitmap.c |  9 +++++++++
 2 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.43.0

