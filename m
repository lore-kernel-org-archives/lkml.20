Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8C4B66F8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495595; cv=none; b=WISbiMJjIV80laCNalowSZJSsCK+X7FqnL97sCLdmipsUgfRSte/tIHE4Cr0fBQBszwWvZDrLwZcbXpaJmopOEUoiVjt5FMz1ThLdPnehoVyhT/pwMsg27HNKcpX4IZSkU/Pf52Ca0RhFqai+FtsV3+qD0QC5IgB9U7SecTqfq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495595; c=relaxed/simple;
	bh=GGJFUxuZiVrXP2+lf6TVqavU/dJ1XV6H6MNOn9ZK/Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lvOv6XAGVPFRqXZMq/fmLXRPVtrb7qlAXMkzCTj1dpN1vL5znfGFYMj5oqWl9obs+QYXCN8m2yN/E/yqJaY3j8yFAoEoIsSo/BRv1217B0qpSb8KjmJEJF8j7WaP0rAcbyOMe+AVJ3G5ul4CU292vwj6I4ZXWy9VVhPj9C3WGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Gd/DRFMY; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xz21qixm; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Gd/DRFMY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xz21qixm"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789495584; bh=/12l+p/INHZp8Awh3Bd07fA
	tjOJdfIctKw5yILZutvA=; b=Gd/DRFMY2XFyTAcX0f1Q+xocdQKlVy8keNXDA9uVFpETWJdk/A
	3Pd5BNbZFM4y10uppaltlJ08eTR9LBdVBSvs2nDSLEgdzwzE4NkB9y+EEcBdGjqOlu2QmDo/3AL
	XEoO5XPxH3k6KB5+MFDtU5sl7SVI8r5TxkjUXTCwicqCyZoTRmdNljGJHuQLOLWqxnIYlH2vNIb
	RBWrTHsB38UdN9L2S2bDGeRwgKucG0TLI7fZh7dTLSjIRiIbnW+vDG5VglANRPwIG+qjRyyFCtA
	7ubD+b8+a3n2k0utMm9WY32/3AvqUGYQxtcG4LLHh3AMnlHumjnIRRA+D8rDyQVw5Hw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789495584; bh=/12l+p/INHZp8Awh3Bd07fA
	tjOJdfIctKw5yILZutvA=; b=xz21qixmfxqo3FUW2ZW8zYVNWwy5PuklKpeKsqb6dv6IsRZAFm
	FetLOT6PYmD387TV18WwywvpSym6wgdLL6Cg==;
From: Bradley Morgan <brads@mainlining.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Balbir Singh <bsingharora@gmail.com>,
	Balbir Singh <balbirs@nvidia.com>,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH] taskstats: drop the unused CPU_DONT_CARE enum member
Date: Tue, 15 Sep 2026 18:06:23 +0000
Message-ID: <20260915180623.22058-1-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPU_DONT_CARE was added by the original listener cpumask code in 2006
(f9fd8914c1ac) and has never had a single user, not even in the
commit that introduced it. It survived every refactor of the listener
path since, including the recent handler folds.

Kill it, twenty years is enough.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/taskstats.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index 598d9cd83250..3997dbb5aead 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -59,8 +59,7 @@ static DEFINE_PER_CPU(struct listener_list, listener_array);
 
 enum actions {
 	REGISTER,
-	DEREGISTER,
-	CPU_DONT_CARE
+	DEREGISTER
 };
 
 static int prepare_reply(struct genl_info *info, u8 cmd, struct sk_buff **skbp,
-- 
2.47.3

