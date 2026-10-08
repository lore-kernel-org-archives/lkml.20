Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457833905E4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452376; cv=none; b=JH7/VdXlBJTq+25Sl8wLeQSpJ7FApmgtmeZq3oMccHa4dbzvGhODuBypTucbsg2FLmNf+TQGDsdIZAqvWMnWZ89OZH9fpjagM3dwa+g3zHzCwty/82yRkTo0KyZIudbIs/moC7NQLA7hrl+9OnZR12FUQ13Ac+gt+m+sraX8zyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452376; c=relaxed/simple;
	bh=RpBjgiffJgjT8J793CRvE5FL33Vuz5Sd/avIdqGZclY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VtRjka8V/DZ7pF7itefTXgU/fj9WMosWeIDS/v8R44P2+QJnL5uyoFvirJ/UeQ4T2l0cHoSG+s1WZuD7/+fpK2zbRqmC37dbzLWl7OEtohuVQQ/3EkATN/wkPK51T7nn4+PcDd6u2z2P2byFO5hqT1WQMnQxpa25wVlVtob87eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCyk4vH3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCyk4vH3"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1467286a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791452375; x=1792057175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9Vukk6N1YBRmizRaHPB1EZVWo8i9kMuh2xPWHg64/0=;
        b=hCyk4vH30FvijmTqjWrQJUSYqEihFoF2poqnwxWylexdXR5L7UENl65e0fceGKkXfI
         U5Frj7zNrttAynd2wjOIyTxCCi8SwKMYoviJ/GAy68GquoUoENLMInu/EKBz/OS5JGL5
         mTYiB6Bj3AHbZbCqmgjXHZEx0YHNIyYYVh5zKe6UYKui97Ux9oNd+ZAaIqYB5M+g+Czg
         mLloh2iWAXMbeNQDOP8zR9vGOYyR4YXe0c3XgsHpEdRfwzMeDHisQrFDnb6IpZgLT7uh
         0x6mU8Ev9DP07khiXMfJMxyoR27hwX5f89J4H2cYge5+ixDCLSSAGq8Fpq6vCiy0o1Vn
         zXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452375; x=1792057175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9Vukk6N1YBRmizRaHPB1EZVWo8i9kMuh2xPWHg64/0=;
        b=W6ZdoCKIwgPv+5kYkuvTI7+5QKj/1Mi4LQase/llThKDf/eac6kj8Im7ksWxsuJ2XF
         QFs8WnJeICO1nxmJJXkOadeBZtK8TbH17zE4RWBwjlZf8ZgYuWqYE5gUqId0OyQLxHvi
         F8BNlLMzf213c9su0XHRsRlYqSNkc3ujm9YVZaf0KytZXQXatjLp004jgzaRATJO/uiE
         RTZT/4DG9dNUtvEGg7xLN82FpRTi32PcwzBZUQHu01SEjc8MttgrA6hzMuwfTQW7Ns7V
         thCzJlGSHlnR4SrD/guigbEFhlhc5VIn1OM+YsQ8dVNzkC7b0nxU3LcpWn7J/fIg/R1j
         sDIw==
X-Forwarded-Encrypted: i=1; AKwUvBxMWqFWzXbeRqr/FH5KVJjHVWlDn85cT6sCxh0Kbnsbm/ZrV47FwNtJs47dugZSmNu6K77Dax1urrKTGUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUv2RAL2/4E3eH54cYpq+1k3pK0CyY/tj+I95/BsdlbexPxuQF
	WRAsHWH/xpSnKRZK+oLAIDX13Qi/lBqkbyZl+NugQwco08NRxpaL6Xx8
X-Gm-Gg: AYBFou2FxUZMUn984XgzRCNTaTE2XoJflPNIPfDyRrr+NxAAg1KEI50dSvmSldQZsdM
	sVbHaat3hMISGayIatmwWRQ86DjbialQcNHWtcBXVF/lTaRNdN+THc6JC6NFds6d36SeSZTytQT
	L1QzYltDaV2V89er2y63TuoSAqH6mlFS1eGEPqEkowA3qy0bbazmsF12NbBZVzHjCoQnGZvREHw
	QEfp598svWaOUsAxXLXi+yQW/WKw35eIetoTJJlOK6p2vJlh8sMDmq+uGQOktUGKubbSMplPNcg
	QmoFVriW9t8Lqamm5w9WH5atpYlBP0hfmclcRrnEXo523u2NCja/g8OZNlm95ugu93DH0Ntj2ow
	CSRiuUvVGV6oRzbOjZuZhf3b6OBYBEJriXvUvxUa93purFNQYG4vTJaWvxmMZlxg2owijT0ZJpj
	bS6BW3d0Zi/n95syNG7B7fUnS0tp19CJ3S/fu/UDPlDmxTZOEfukkVVdkqjcJnr1Fw7qjxYWHjw
	9eV0rOmLrH4PW5ElCVynjgyzOF3OqBsGJY=
X-Received: by 2002:a17:90b:4d88:b0:3a4:6ff5:778 with SMTP id 98e67ed59e1d1-3a8a117520cmr3439584a91.44.1791452374691;
        Thu, 08 Oct 2026 02:39:34 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a7e9e4sm3564410a91.7.2026.10.08.02.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:39:33 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: bvanassche@acm.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH] f2fs: use submitted bio size for completion offload
Date: Thu,  8 Oct 2026 17:39:21 +0800
Message-ID: <20261008093921.2748828-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blk_update_request() advances bio->bi_iter before completing a bio.
As a result, f2fs_write_end_io() may see bi_size == 0 and fail to
offload large write bios according to max_atc_write_bio_size.

Save the submitted bio size and use it for the completion offload check.

Fixes: 3de6b8094115 ("f2fs: Run f2fs_write_end_io() asynchronously")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Based on f2fs/dev-test at ce439a2b0690. This includes the entry-count
threshold change; its condition is preserved by this patch.

 fs/f2fs/data.c | 7 +++++--
 fs/f2fs/f2fs.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2613e8821af6d..a5c11cbfda813 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -398,8 +398,9 @@ static void f2fs_write_end_io(struct bio *bio)
 
 	sbi = bio->bi_private;
 
-	if (in_atomic() && (bio->bi_iter.bi_size > sbi->max_atc_write_bio_size ||
-			F2FS_BIO(bio)->entry_cnt > sbi->max_atc_write_bio_entry_cnt)) {
+	if (in_atomic() &&
+	    (F2FS_BIO(bio)->submitted_size > sbi->max_atc_write_bio_size ||
+	     F2FS_BIO(bio)->entry_cnt > sbi->max_atc_write_bio_entry_cnt)) {
 		struct work_struct *w;
 
 		w = &container_of(bio, struct f2fs_bio, bio)->work;
@@ -614,6 +615,8 @@ static void f2fs_submit_write_bio(struct f2fs_sb_info *sbi, struct bio *bio,
 {
 	WARN_ON_ONCE(is_read_io(bio_op(bio)));
 	trace_f2fs_submit_write_bio(sbi->sb, type, bio);
+	/* bi_iter may be advanced by the block layer before end_io. */
+	F2FS_BIO(bio)->submitted_size = bio->bi_iter.bi_size;
 	iostat_update_submit_ctx(bio, type);
 	blk_crypto_submit_bio(bio);
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0acbc4d299af1..1b2390f39a68e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1779,6 +1779,7 @@ struct f2fs_bio {
 	struct work_struct work;
 	struct f2fs_cached_block *entry;
 	unsigned int entry_cnt;
+	unsigned int submitted_size;
 	struct bio bio;
 };
 
-- 
2.43.0
