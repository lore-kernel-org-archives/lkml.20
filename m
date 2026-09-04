Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2163F1ADB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521642; cv=none; b=eXyEH9mG0NlyMerds/LMt0GcWUyxzsgcOJg9sgX1mki3vVaQUL2c9YXnecp4pu7DEVo13g97eQg4tXV50nLun0gV8BmijwFY8DWbPTjL9U9wvWBeMGUzPP1eXyEn3R6EPGMWO840lI1AEbg10DLDEK+RzQiNUMxQD2wuvPZkRQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521642; c=relaxed/simple;
	bh=UKmVFwPOkSXCsUUIwsHq9OsY0XdkqlVFzgYtTxBOkgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=byxPrLA3bH9CvgEaJe28cjNgQfU/b+UH7pmDsoe/ek6xFsNVE5BkKxhujiSEwnY2MSe2Vdr2SPD3g903DfpF7E00wqXGlsAIBelGmFk0cja0fOF5SgYUHasugFazypnBQ6M7JafU3rrWo94bsR+XNv+2lWt2eQbZJo4IkE+BBfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQY14v+r; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQY14v+r"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso940992a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521639; x=1789126439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gN5RdL79Xjx+ztih2lYDyBxP3rh9rtl/qQBc8nWffK0=;
        b=TQY14v+rLm2yLlvrZAwhnz0RIFVodbyXGExM73S5UleDN72CxBXxTJhlFZEv1KCOk8
         oJCj7PFYA7CT2bq/Eg5FCyjaBpVDdYLj9DGMmZy3fjNWwYTWnZGTvXTilnAXUSzQ4zU5
         I067Rhtxn7IdNIE8xk9VVBmujUH/NFtRofoG9GA+Ar3MDOYR8rTI3JqNB+jLSYFSfZjQ
         B8mgUp0+2noQkJ/Chz8PO6dM651Ny2fiw3dxFCFUGa41C3vlxk7ArqYi1iApHFv5LwhD
         QAUw3BdpYQwvB04aHA4IE6wWXllWGi01gwsk3odsniJtr9ckAjEcVnTblynZISbF0RK8
         8Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521639; x=1789126439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gN5RdL79Xjx+ztih2lYDyBxP3rh9rtl/qQBc8nWffK0=;
        b=Ocn57l+1hife/MzEE5NMl9kQW+2fkhsWz9yj7daPKDIzCSQcMrPpFrt6IsFuUV1IRd
         tNSEYFz//ADHqkl2pW4gdOkiGG5dlLI8XRyqZmLzqgHceN+yvYO9be/2FpRpG7+5+yzT
         cN/IqDwSmgl3JCKPDbU/BmxtaTcJUHLwG5su4E4vXjHm9dnHpE8jMjTdvGostojdjf6K
         40GadPm+1GYMMorFkP7j9YQUl0rDtwZUcLmdzVppm5gzEWQFnr0tKSCNDf2yMAuQ6qAs
         Ew6Utfa23cckvaILyyLMLUWIHhif1LDuE4tmxlouaj5lK1132lTOmGo3RGE1YmKMqvAs
         ssCA==
X-Gm-Message-State: AFuF++m3TavIFI2FnLVWEOru6QgqQo5YB+NBe5fpmfO1eY2Q3s6RA2rJ
	1Uy8cHZTiV99K2C4hP9nOmyUWGT1YoBb6NEhNbNp8vX9XcYAkrp2jR0/9W2HKaaSvTY=
X-Gm-Gg: AYBFou3RyIE+lOnMRAE5V1xQ7rzZoIkcleoYCgJvhjY1Z+Cax4afmZ3yioRhiCfag5z
	ZZ/rghk/j1zXzLjDpDfLOJoedqzdpnDJ94MDcjamSdasoQsgAgHjupr5140E5wKS8Mo5E3xVs/3
	wCQRd2r5Mt07jXUQNFTekJLKODQ2v33setoc89mx7rtaYPu7meE9AmVNjKV/DrGty4KaZm48FWe
	7/4JgGUqqEroTnkV4AqzfI6Jvmkcai95V+nvyO8V0ZK0++gzZ1BkMtEzaGhxRJpWrJxFcGlC4mg
	eOAvtik++txb8j623INku5X47XSS/SAAav94zw0gQTzlryNFD8vyNBfTTnA9b7PFyLs1raYH/1O
	CA80OIb0Bwg75IcMIQuke/+dyY+1rFOfhODCrU74V5Zvkzp2YYnJnrK2ZBWgPYMHwXk9W4+PatU
	w6y6F2LffDTmzSWOr/RSz+EXxvtWG6YfOEgWO0BifFayz9JLes4scklvMPUsqklGeSIp1N3Bymf
	P/UdnI+xA3U6to=
X-Received: by 2002:a4a:e914:0:b0:6b2:69bf:c8d7 with SMTP id 006d021491bc7-6b6fb3df17emr3760660eaf.10.1788521639126;
        Fri, 04 Sep 2026 04:33:59 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm5820708c88.1.2026.09.04.04.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:33:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] microblaze: fix typo "multipler" in comment
Date: Fri,  4 Sep 2026 17:03:54 +0530
Message-ID: <20260904113355.14914-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "multipler" to "multiplier", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/microblaze/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index 02e6be9c5b0d..56a161147606 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -16,7 +16,7 @@ export CPU_VER CPU_MAJOR CPU_MINOR CPU_REV
 # The various CONFIG_XILINX cpu features options are integers 0/1/2...
 # rather than bools y/n
 
-# Work out HW multipler support. This is tricky.
+# Work out HW multiplier support. This is tricky.
 # 1. Spartan2 has no HW multipliers.
 # 2. MicroBlaze v3.x always uses them, except in Spartan 2
 # 3. All other FPGa/CPU ver combos, we can trust the CONFIG_ settings
-- 
2.48.1

