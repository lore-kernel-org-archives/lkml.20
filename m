Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5EE3A873D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518941; cv=none; b=cxOo53vUAwHt0/ddeXImUGRVUMA+i0Ne+mNimuC7+KI97AfZM6SMXhIcMERx32hlW4yVMWLPSl15w6CeOKoDQZDR5KNOPJoc+ujxI3e8XB3W4rekEonXKILQg8QGTsZsaIB9NHVSJsozzK7R8hHddR9EBhGKMqIr9nFTITsjvuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518941; c=relaxed/simple;
	bh=ATMZJFGb5ERJbSHOppq/ZCSghx8JjVtVQx57qewU6Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bnSTT1Zr5ILHl51ZWR8U3a7zdOGAcA0sGvY/xARgo+ypE9l+HcgmsUxsBKWkP4kqnZc+UmG8ls4kbFwT5Cg/gzhhVNXmIve04f5iTfxLw13KJwPucDA7J0oRNccJm4DUKgizB3FUefU6xdyhFC5y5WN3pKysO6dVwxx1jXBB2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZOgxg13; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZOgxg13"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d9201076b3so10712825ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518939; x=1789123739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=REmdRHWoxQ2dVqjHU016OpmJaejwQCwqIB/tmYXM8VE=;
        b=VZOgxg13yUm3/TBVUOCNmJNUjSgK5j7zn4dATP97E0vuxIlJ0+Vo1HdnLzULJ+qFYi
         VXvaEOwQFv9Ct/69/xJ3ogtgpLnjJOdguv1JpyuPv8W0165lJD2RYj7ZkNRZkLv2LzGL
         XCjsAQSVmkeUQ+lQNW08B6Hx8rlIqApdgkaz1MKkPoc5SkBoXi2s3Izklouah83LC3lf
         SEtk8vcqr5rZ7Ux6eChvSBlqUbLsoQHqRoZvAlk6V7gh+GM+Mk0qPN8+T7xeiB9PaCXt
         jkgr7Nryv+h7VY1vTG/KN82R2KW6Q7nmdC9HaCiQBLbh5EUpVFjNC0oAPd94EfGFHgbS
         pKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518939; x=1789123739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REmdRHWoxQ2dVqjHU016OpmJaejwQCwqIB/tmYXM8VE=;
        b=KFL9oQf6z3JrNsHF8RIuw2W3YLclpFllkZHifp2QjKJqAeKOFT6rd97vQJUPmkWLHc
         8QssdWZsfgJeZ+FfZxZVZdSHI/da3e/FDxaurLvf14MQv0zGAUzrBZ6+Vyw8s+baLj9t
         VBEE1vStxzIp9y4L7QBLIY6LofjHbi/go2D+OSLRO9+KvfjvAWYspWeQxibx2O/rKBOq
         AYGZrJrVcPqQmWHTbj1h9taTDJ+hdvPEA6RagzPtuXyaYJjAYqFQC+XQX3ov+iZ1K63W
         oA+hMrqbIWGt6ZcP/zu2humBwKrEBP5yHBR3mUklkqf1W0Z2CqEMx9Ar0tiYzpoqb4iu
         U6hw==
X-Gm-Message-State: AFuF++lKmVYj+LhP2tc1ot38x48GDPJgZQNJGN9XQuGQ5JtFDQcwNDUR
	sKdWZReUTi3u/LN1nw06QPiYKjSLtQ0nNXS5ED6wbqNTE9cfrCnu+wg/oVt6eMnNg1Y=
X-Gm-Gg: AYBFou1Rxgy4zZm1gTtSqpqRbcRLrsqNK9ISOrr43RSgcqUkbUa0Q9y1hkNbV54Yoln
	zZqmAKMR1ZBzPdS1PR8Q4zXqRTI090J5HXgC02EHCRqd1Nk+fFX1fVXJBWgpjSBUIy1H0wLhf6t
	6bseJDDbcEVQqS4PHo1nRYbiNEEt8xJ6bDHD8h3xvwkLWk3dctJC93yTKTdCiGw0Gw8mI00St18
	QnotDp+lKb2Pii/1uKJYScH4OitRAdXm7+YeanChu/CA6HODqzPiZMH3VbNNs6FBPJpKOBlVQ+d
	RTbkgBNpI5phVl+zBfUlPd5INjfnFSuhS1I1GyTbEPpWKOZiyzEOyhQp+9CaYWMDSkJArc4ka3M
	9tM0wSu0ny8BdhYAOLs2diDcRkmFUnfjHprQXNjbSqEBJpP/AZsHbUQtTxhDY+9wd9ZbXsejdlU
	V+TerdU5ZsmUqJjdB5BqRBV+YXLnGQmC5KILa6Xiysai4jQMfoG/cV9jD4927WFpZB86Y72t2Jp
	n7lyLuXs2syTTQ=
X-Received: by 2002:a17:90b:5845:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-39b2620547amr7743577a91.16.1788518939254;
        Fri, 04 Sep 2026 03:48:59 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm8583927eec.16.2026.09.04.03.48.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:48:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] asm-generic: fix typos in comments
Date: Fri,  4 Sep 2026 16:18:45 +0530
Message-ID: <20260904104854.25272-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 5 misspellings in comments.  Each is a separate patch so
that any one of them can be dropped without touching the rest.

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

Hemanth Selam (5):
  asm-generic: fix typo "explicity" in comment
  char: fix typo "funcion" in comment
  lib: fix typos in comments
  mm: fix typo "mergable" in comment
  tools/testing: fix typo "mergable" in comment

 drivers/char/mem.c                     | 2 +-
 include/linux/mm.h                     | 2 +-
 include/uapi/asm-generic/mman-common.h | 2 +-
 lib/flex_proportions.c                 | 2 +-
 lib/rcuref.c                           | 4 ++--
 lib/textsearch.c                       | 2 +-
 tools/testing/vma/include/dup.h        | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.48.1

