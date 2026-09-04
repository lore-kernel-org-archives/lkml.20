Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0313BF679
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524691; cv=none; b=fKc8nU+f6sDtx3yuc3BZGUtHGZELrkzD6GDJOmOnpP2dyBYzSXh3ujBh+Gjm3Cuw1LanlhXMV4Ny0vOMUAnFZJa0DqqKxUUqUxnPOFBVL6TjZbCdb2DkJGE0iP/RilUhAFK9JKrjmBbd/q1XVLpQVzNeGW4X18Qc5/EIwZR3xcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524691; c=relaxed/simple;
	bh=iEY94nufOJ+Z8mnidaufyk/WBzf9f09ivGxPicXUlrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cRFsHkQT1b6xuqqsLB+T72cgygxGne+VM5bqcvGeLSRPmP2MbgCdHwag9kvdGC3wQ7LrLituDGyGdQy+5a6oUba4yIq782lkSwhcwxgq/4SEJL4f8zLx/wrYuj4CnmVtFgGNvqsk9v1Zs9dtTvtP8vYcbFVhvnDTAbOmbKE8l/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJeSBlQg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJeSBlQg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso706134a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524689; x=1789129489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZI/0yPTX7MA6+0/52Db/z/x2Vntk4bFzwtz9+K07MYU=;
        b=aJeSBlQgF0TFj6FZ4HeiWUBYyU1A2aQL1Iw2lCZfgquO7I0LmyYq4oWu6GypfgYlH8
         jwUPoEgB+6R+L863Q2AahHTQFkSffAJQ1VlStH9qUri2ymnmFHWZAltZwOkpHjXo4SmA
         THWXvskUrnpH7OJA1qJsrn3+8aEPNtUKlimeM+mRBKbNmWPwfJnsgID3/elsYJV3psjz
         Q9vDw1eAvWY8NZJLPWfJcDscj/DoMeU6U8OzqZjzD0hFtqXIyzGmuD2ji0I+17Q+hhN/
         vlQNmScrc4ojCjqZ0T+uxw54EnThpQKkTworLb10nyOoE8+1pFHFqZ1NSfpMlM/Ropg/
         KnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524689; x=1789129489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZI/0yPTX7MA6+0/52Db/z/x2Vntk4bFzwtz9+K07MYU=;
        b=g6F3RxO9xAakF5BJtQhckX2nqOWsqjMwUL80zb/cIYr7CIUZR2dHsnNdczJ2nWRlbE
         22W7ia9R/nKmmzeWGx2z3Wr5MbdiuRF4b1QCPePud7L4APG8OybrphsBCVJkyfkmKyXc
         8tRlgte/hY14G1idHZCnttGrDQRvXXxPU56+gqK2ERhUNq4of1LLdH+/4QMlImhj8MtS
         +IDc1Inwb7AUMCuTo18r1khBDMBah+N4rhATYDOnXrTMA0iCf9xqxiO9BoegwBKbsJJq
         mDAjh9Nr++IVdLWff47MaS2UDPHOdGYPBTbk+tXJbeaBu8+YRIzyxDKl7rlF6PidN4sx
         m3pA==
X-Gm-Message-State: AFuF++llQ0ah3+QHGtvjNdekIQIgPV5ujkectazifDecAKVzm+bDRcnQ
	h6Lm1egXtTO1uaFxF1pBmqX4CKUqFVoPnpXQwdcRr8JYAxbZey/IeScpKaz60xSA4LI=
X-Gm-Gg: AYBFou2Lso0M0iLPfCsZ7WVUulVySbz3/aAuEfXC83kMlwcfXutcKXQkmBIEr4ckBO9
	LHOvwaUlUiOCw63YjY+VDAX27HEtH134cKqA2SpbYNnKTzahzusH9DZ+Shgi/aF3GTT9OILYih8
	GKqwFPzGYjrppoDvQyD2s8zG2LQp/YRfQ8+2JWhT2ceYVHYfwd+gK7d87swtp0CXPVtNe3+Pwly
	1a7BhkH+gY6wJ3CVzn9zo9Aei7QYkN4Ib0hcK9ZZ1Gt/jiv0aPbJyrpgOoQ8De4cMk4RhCtZ9SN
	6IJxWJSTKD7r0Tj8CtGrG5qlsthrNO5zOTCpgBj9fLgU+M+l6qR6dbPN6gBpYqRM0MsHusjAy8T
	xxgHSSPnMmZFh/nZxNCyynjiuZpyvgp16ySlMAyHxzofuucpLazkdpWph1DrAWBUMNAUsgoB4VT
	HOyvlYtP54XdF8wXiTbfgxPWl+yJUZlR8M+lVQU81hhtQ+BPtjEvQNI+zTzQBHbawXmE0NW36Fn
	zpA9AeV4I0xuhPh+akuZavXQw==
X-Received: by 2002:a17:90a:c10e:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39b2622b3afmr8552716a91.18.1788524689250;
        Fri, 04 Sep 2026 05:24:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5880860eec.23.2026.09.04.05.24.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:24:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:54:39 +0530
Message-ID: <20260904122445.31163-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 3 misspellings and repeated words in comments.  Each is a
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

Hemanth Selam (3):
  arm64: kvm: fix typo "synchonized" in comment
  selftests: kvm: fix typos in comments
  arm64: kvm: fix repeated word 'is' in comment

 arch/arm64/kvm/hyp/entry.S                           | 2 +-
 arch/arm64/kvm/pauth.c                               | 2 +-
 tools/testing/selftests/kvm/arm64/debug-exceptions.c | 2 +-
 tools/testing/selftests/kvm/arm64/hypercalls.c       | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.48.1

