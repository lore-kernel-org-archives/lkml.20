Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA12C383C88
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018552; cv=none; b=L4FxxZY0M5cpi1Q07xghIDuqHPvK9R2YL7D3647R6nHTHleplhNGol5RFuquhWHoeZjEYhQ0UoM1bGTsxdqCahzm40I+qECvKYRw2L5M1OhGHZ+xauVJER5JmhJ6LVF2AFTn5iX65RMqbwRvwQrwv7jp75SUs0+cSVc9Qntvgjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018552; c=relaxed/simple;
	bh=DK9/H7hX+pru8m1l06zVYRmh9mh18UWQ0oNg5FaI1GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+6uztRfjQ+Oq5kVdr1aXiiJ6Rw/ZSe2zqLzqFLHxUhmsHMWFKFjRjX3iCLINQl1HH682jivezEyJyaJY5YMzbSuhdVbAT0mKa7hguU0GVpHfAlBmbSKVN0mFwr2mABKT1So8HhL6oYH5ZOAEZV6eSCkT6tbZ7U7HAFPXWdFepw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=cY7dNLKA; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="cY7dNLKA"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so496900666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790018547; x=1790623347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HL+2RvScf1wUse1sj5lMjJEzeH15N+fw/R86yhvN+Co=;
        b=cY7dNLKA5C50r1X9n+F3UbZwQWmGwURtSVB/PShA5pMAImKRsyu8dIZh8px7+uiL11
         +HQDz4uSNrfaU0uqTAXlaNq1yzeLpvheo50c6JjOOAfG08J2f7zTlLEMj8hgr+s2KHl2
         x3sTKVmjcI//fjHkbNEBUtsIcbO6N1tinFxVfw608I5VVRQZfaViFRVvTi5uaoneFWRe
         GS4LAJcF5A5/0xlCn8HKS2Kf+hIzv3fRDmO8okpAfbo0ZWde3amcwh1tsBYFJVL7rkRe
         0inJ7RMIWWl6HBIti71qWEo8EtVf5d5IZ5vrkpVkVnLrbwe5cEUMSJ53YonfMq+b77UN
         fAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018547; x=1790623347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HL+2RvScf1wUse1sj5lMjJEzeH15N+fw/R86yhvN+Co=;
        b=hFxD2il3ntrMJ+XDPTqh5bSddBsfWP/cAlcfsmZ24SszQLhlSmG/1tg1WW3gRwUUjq
         86M/BOY+YFRJ6Pi+yxnWIU5mxXXP1rm1h2r6X2WW4SYE83GuDoU4ZI6TFDyXj32Y9OdY
         uT6atVq/PngFXjsZj64V2jsbtS8V3OWFe2p6H2PhmBsa9GKAFlKJzP3LK6hBcKkMd0tE
         mLeN9w+KY+eddoqvvFkAjtZRo2Coj5xCeA72NbBXtPb0NzIjn+wVZm3QLaWQ9NQwyfk4
         R4CTxtba/zqR2dPhF4aUYJ3SyZ64kkqDaucYgNLA+odvg2+7OaEfvyh6WVCfEd5/XTvs
         wbgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLSUjqzcQuStnhTZflKRHGoHtcUoqTgTuejQrcJb5iqPiOCdrUfR8PKgyhHeWM7Hv0wfp8dXzmEWwCz1c=@vger.kernel.org
X-Gm-Message-State: AFuF++kHEcMvoxe0R5YrnJfmuT2XJezcynxdwVGCB21Pm91GErRsPMXY
	G2tCCUxFlVCltchPe74faLkGFSOlJO+oL31CMr9r2dGlIz4m29R7qwohEAI5irS068vw
X-Gm-Gg: AYBFou1+EL+hFeiKMn1Vl/t40w22bxF+xu2RKKHUqDy9H6ANzaN2T/bQoWnJCPapGJH
	5VY3q3U3/jlst3bfw+GNd1mGA6DX1thueG1fSjGzGfS0QRGTdH59ENo0Fdq8E+V5atVU4OfA2wk
	Qg5nd6vxL8+07KHICc1LlFG09PMu3I7Sc4k7zuheyXfZ44RkmVtSeMabVo+Vu4+DjDi+ZjnhOtn
	qT64Hf/L/2QaPPt+6AW2YR4jsxy48COiMDkwNSbT7o08n4GQDiHhVCSUUcP7AU8oxz07XJwNhey
	WG44MGGLT5sFANMzwAQHuV8ATvsUHyTzjlDlApnhLKfEM3TLNJesW7EcsPeq+ChBXEqqcJBBBTz
	dtHfcUQJeOKcn/9TPE3kmjCSykTc/0ZMfZNeKhubK1lXhetEGQpCFcgtd0/EPeFWnk9Sr/u+QjU
	6f9ocv6yL7txDkVfWuhXbPlDaAIr5FYZwehFAD
X-Received: by 2002:a17:906:99c4:b0:c29:f5d8:9c82 with SMTP id a640c23a62f3a-c2a15ad760bmr961056466b.49.1790018547221;
        Mon, 21 Sep 2026 12:22:27 -0700 (PDT)
Received: from cachyos ([151.38.78.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm341089066b.47.2026.09.21.12.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:22:26 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cenzhang@linux.microsoft.com
Subject: [PATCH 3/4] fs/ntfs3: validate on-disk restart tables before use
Date: Mon, 21 Sep 2026 21:21:38 +0200
Message-ID: <20260921192157.102738-4-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921192157.102738-1-giulia@bynar.io>
References: <20260921192157.102738-1-giulia@bynar.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

log_replay() locates restart-table dumps using redo_off and passes the
remaining record length to check_rstbl(). However, check_log_rec() does
not ensure that redo_off leaves room for a complete RESTART_TABLE
header. check_rstbl() reads the header fields before validating the
table size, so a truncated dump or an offset beyond the record can
cause an out-of-bounds read.

Before passing an on-disk restart table to check_rstbl(), require
redo_off to leave enough bytes in the log record for a complete
RESTART_TABLE header. Apply this to the transaction, dirty-page and
open-attribute table dumps.

For the open-attribute table, also require the table entry size to be
at least as large as the expected entry size for the restart-area
version. This ensures that each slot is large enough for the entry
format used when converting and initializing the table.

check_rstbl() also accepts transaction tables whose entry size differs
from sizeof(struct TRANSACTION_ENTRY). check_log_rec() aligns transact_id
to that structure size, not the on-disk entry size. Accessing smaller
entries can read or write past their end. Larger entries can make an
accepted offset point into the middle of a slot and leave too little
space for the transaction fields. Require the entry size to equal
sizeof(struct TRANSACTION_ENTRY) when loading the table. This also
protects accesses to existing transaction entries, which bypass
alloc_rsttbl_from_idx().

This is reachable by mounting the crafted image on an x86-64 KASAN
kernel before this fix:

KASAN: slab-out-of-bounds in log_replay+0x8094/0xe690
    Write of size 8 at addr ffff888101107680 by task mount/67
Call Trace:
 log_replay+0x8094/0xe690
 ntfs_loadlog_and_replay+0x3e0/0x500
 ntfs_fill_super+0x1fd3/0x4510
 ...

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 8dd233ec7d2f..e3b5a19f0e30 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -4274,12 +4274,17 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	}
 
 	t16 = le16_to_cpu(lrh->redo_off);
+	if (t16 > rec_len || rec_len - t16 < sizeof(*rt)) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	rt = Add2Ptr(lrh, t16);
 	t32 = rec_len - t16;
 
 	/* Now check that this is a valid restart table. */
-	if (!check_rstbl(rt, t32)) {
+	if (le16_to_cpu(rt->size) != sizeof(struct TRANSACTION_ENTRY) ||
+	    !check_rstbl(rt, t32)) {
 		err = -EINVAL;
 		goto out;
 	}
@@ -4314,6 +4319,10 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	}
 
 	t16 = le16_to_cpu(lrh->redo_off);
+	if (t16 > rec_len || rec_len - t16 < sizeof(*rt)) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	rt = Add2Ptr(lrh, t16);
 	t32 = rec_len - t16;
@@ -4441,11 +4450,16 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	}
 
 	t16 = le16_to_cpu(lrh->redo_off);
+	if (t16 > rec_len || rec_len - t16 < sizeof(*rt)) {
+		err = -EINVAL;
+		goto out;
+	}
 
 	rt = Add2Ptr(lrh, t16);
 	oatbl_bytes = rec_len - t16;
 
-	if (!check_rstbl(rt, oatbl_bytes)) {
+	if (le16_to_cpu(rt->size) < bytes_per_attr_entry ||
+	    !check_rstbl(rt, oatbl_bytes)) {
 		err = -EINVAL;
 		goto out;
 	}
-- 
2.55.0
