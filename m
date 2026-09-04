Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22EE499F0E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519757; cv=none; b=uAMcQmVib940SQ2aRTBXOc2j34cEpZEJ0Q0WMDraoFiOmItdr2WBTitBeRgQJaG07mLOVn/zyqQtG2Ru0SMcAXJReUg6cWrvXpZ8zCDsCWtOLBpmK6wR9VnrEF3+zuk3SZFpXWWad+Fslx1lMeP6c3CtyxtCNeGduBw1UgPz08o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519757; c=relaxed/simple;
	bh=Q5H7153DZvl8rqxPkqWHENS8JiVakUKkHgou8BYPu5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HgPZoBvEep6ehVr8LzMC4aze+cwbseWYSBWbxUmPM9nmZXSRiDxKmmxxFFJ+Zfts2Btp3BGfr2eGl2yqGdg/QBfVefHYrk8yjA8wTASUWZqeKvZYvhWccC4PlyPFO1rS3CGE7NZKXNKTRo5eFWSYGf3A9wbr9lzAnSunFU/nZpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbpGlS4d; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbpGlS4d"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f48c750afcso789193a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519755; x=1789124555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tn1NRT/02jYo3csBbQbJVcU6+qLD0RgItADImADyIsY=;
        b=bbpGlS4dUW+rOEJJuZFMnvcOcdyN8pnPPUHMBWaIoC1CyuxwgiWs9QLX8Kr6k+HyUb
         MSohli7Nqv10BAEVUI2Eg4ruzKVIgUtGcgfLV866AbFcYV+6YjaN/lgQXLxeDZY0awWN
         QRj8whoZayO1HP7kegs+IT8vjEiOh6J3CqN+ZORtUGtJriGt7Sc9ArNA/7UV77vkPb0k
         9N0UGVdVSx36yTnvzGt1jCyYkobZ7Req3v18zbTx4vhOfmgBKX0zqYCz9l/FX0wvGyGy
         CejDBPJUwWHysMiOj1i2WXXtmbXC2xtEBlKvS20bF5GQJTyoT+WzTiQShsgMNrJQbh3B
         h7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519755; x=1789124555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tn1NRT/02jYo3csBbQbJVcU6+qLD0RgItADImADyIsY=;
        b=pXkYSPlEEea5k4HEh+xK9aB2MdzfOAjCqfrwaaI6EYfau7eAL0f5yq1Kz+aept5Yh9
         D18dKXStdOZxZ2GOVByW2Fc2g+BRznNO/DFtRJQlWbfI1RV2Amj3gcBGEu+x3dZdECsJ
         kMATK335NAvYfCXTVjBXC2bkb1SQ1D7mco+NJjTYtDKqcdaHcl0iSgyPMNbnq85EzG2w
         CSOdMvuWVumIx+NT6OEorJWW2yRvXIKtcOQpBFvlqGaNftohUOVRSiEbXhm/tTfTbBNO
         xtKSRe9Bf3oqLsiRB/klIgjO9n+6UkRP8NnZMSmi5fjnVu3ibo/TVJSda9nuzaEXHner
         1/GQ==
X-Gm-Message-State: AFuF++m46H6DQUlOdlfPiclQL+VI0Plm1nzIX9YWSUgV+CgscPj7pwCf
	//Lq+2D8U3U11IgLKkwViOPkJa+95CmtNlhQadFGeqEr+qbxcdLnwXCcFLhedbO5Aeg=
X-Gm-Gg: AYBFou1KEuKoUyZCTyWvoSIEa2fAx1hO35YoxmD5JbfBlSq9Pc1uf6gB5GwHvn3qndb
	2JrTc5xPC5/PbipCfrX+DoO/ldQ3XnXwaofhMEz/x5rcRCOEyEyo66ytgvnoyQzqZrpPikUZkfK
	JiSuwsGPio2c10Qw2Y81aPYfvWkYXmfpVWy7ctIPzS1XcmwfVGdYbnNndSIy7q5wgA8M7A6FFm4
	ekl6uzNBFrC9k4SQa9z7UVEGhPYVd3wFuEoQX1n59DJNQQmH1iZEAXktxr4ng+WJyPLEmSjx3nb
	x89upOEbkP5NEdcKJqZyJPv6/OJgA+H9d1TRH4EkJrLyHsv6pVceE5f78sLJGbKifptrMp7N7xD
	nVdv+RVRlPC+8aMIJPLEEB9vou53tfH9F9BZOKMHPBvzwntJgb2iwCEpj5AoFTe2nbu43bpXJws
	IZqJsBGPHoZpUGYiToPslvUiovIEXN66cqqSDTekeHulNiP3DbRm7LLsJMrVAUZ64TXSF3q7heX
	raIULFO66/vVOQ=
X-Received: by 2002:a05:6820:81c5:b0:6b0:ae64:b307 with SMTP id 006d021491bc7-6b6fa3de06cmr3945059eaf.10.1788519728663;
        Fri, 04 Sep 2026 04:02:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf44ffsm5454090eec.28.2026.09.04.04.02.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:02:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] regulator: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:31:59 +0530
Message-ID: <20260904110203.10113-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
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

Hemanth Selam (2):
  regulator: fix typos in comments
  regulator: fix repeated word in log message

 drivers/regulator/ab8500-ext.c         | 2 +-
 drivers/regulator/core.c               | 2 +-
 drivers/regulator/pv88080-regulator.c  | 4 ++--
 drivers/regulator/tps6105x-regulator.c | 2 +-
 include/linux/regulator/driver.h       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.48.1

