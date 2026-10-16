Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DACD4A49A5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154776; cv=none; b=ax5pD4b8t+chcArcplHMi+6pGUjM2UhOxdsCkl+6j3BiahOhKNOzai010RNVjr0GudAb1dFXZjObJyi/mzc3112xgwrWtzmM6fhic0IDR6gRg1AO5aoBZDK/y+FROQNYKA9HPjJsEtXlMFxtcR1qD0qF6+Tmirlsn27gHkXZ0Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154776; c=relaxed/simple;
	bh=g/A2LNTpg/TBBWsof9UO+iJupz/JhBE9bEfYXnOvlvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UqeVtrqZcnkWqtIEKC08nFie9Ym7UTLhqZG2lHzSjhpzBcSjC9jlikKJxjJyVuq7DK9y38PMntX2tcPSvWgBNCOt3Fr5cxSdY3gaHXpvwJJfJDvnvjZYngcgugvb7GT5xEsopEk0nc+g0ZdGkXeR1PlPYr7I/ixQsiFGtijxWBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPiZgMhJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPiZgMhJ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso1260917a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154774; x=1792759574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9uelrnhVgBO69REznhFRhGJ0U4UCFyoo6ufjAB5aFI=;
        b=PPiZgMhJGO1DZn+ni3QL4jrdTbWZx/nfVOzdxu48kKJGgXpa/RfAzumq5L327kOkmU
         UeSGyPU6P99RIl8m8dRxI1m8di3hMMW5WwdKfxG3BPiqa04vbaKHq1ZHNfL+/Xd3m26n
         SNYApLqyflGHFSS/O2fsyjZUmzveV2YORI3s2Il+VGCHfWFE6sCGyRObLpMZr2m7EVU2
         pF3AkINSodeSDJ+nAoTNEbzoQq8jdYju2yHS6cE2Gdnmp7UyvPG1xYGHFp1qTL6Wd2Jt
         oG668bSVPgw9Dn7GIA4aLdp1qXnq6yCzxKFdu9aYYeih3KmKzIAqLAsyFr/Q4X84aEO6
         VVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154774; x=1792759574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9uelrnhVgBO69REznhFRhGJ0U4UCFyoo6ufjAB5aFI=;
        b=JSrK4KEy4MBWiMuF9EPpWUjeRqk1PCskoGTmL6Bp3Vl3N+rtzi7dfWZ1q2/p70n/ND
         GxMMoL38CAzQ9zOqgtiY2EXDFRYd64PuPxA/Yi0L5ak5J+7O3YRC4OcnG3s3KbqCB7V1
         sHZqdyn/C5IDVJuHK/m2/GmutPaT4feacgerBxPdvYTw0fdPNaOY6Q/Gg37J7k6eZ/Wl
         ZKrtm3ud4QVQ/z3Dn8l7B2R04QrO/OaWqAPU1cYl4hd95OoSGYK+p0sCfcg2mJH/yt8+
         aKdF+8Q65IgC2tFmN1c95E7DzbgwG42m3gtNYrUjsm9oqQPO46k4XMZ8ev7rTSoV4mnZ
         y4Ig==
X-Forwarded-Encrypted: i=1; AKwUvBz3G2n6OGKF2wJkwWeck3dd1TqdNuh1q5YNGO9pxdMuoBuRJ8QLwSmH3x10WZbsZ7Tno1TCObfdxGu/rdM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwkSVZw8zT6iLwtj/J1+RiLhwJUDQP6VtMwxF366b8keQlSXup
	d6HrhHs/3sNutxQA2u1Xigpgn9Gr21HQNNSF9gLnA4S+CHO5WagIflz5
X-Gm-Gg: AYBFou2FLuuJezN6olpKkAQtf/HU8rcWjNjsVP4PJJQFAmfmm6XjFMy8LLdVdmkm0PP
	LnNN0oAj0xpvtLsfiQ27pNCeialSEW0ADhBFras1BY1St7rw3nf/Gsd+zc2O0uX1iIR8raDCVwt
	lLiVZK1l8ivkYKwoQxLdG6nnjTGAu3lojb7MQqj1XjkRclIhU4fdUiVwAseKoawjVb/2pMxjP+g
	LjnoylnLnLPlfbf38k3Qn1Ldl1mFrjvua6Fz3CiTNh4433s1CSh9n0uVpfa5IUcShuQI5AiqLmx
	VFqtdL9AL3HdZn9uxuOzrG+IFp7ZTQdPCmB4+geSuSasHNso8AyGvPLOLWSe4dgjHOV10rmhlhV
	oMR4YlfG8yKAViphHAMPeSQ7mfzZ+IvtdyO1NXnyaN9JzO4ofymweN/Oq4K0i0vKC7CQpPCRt9C
	lLUZ9bSqGyliHDLnfR0/AuE3Anh4pSebz5SDFu0WR3nzfZDbAOUDZBPFp98k1LZq1w+qxL39EbY
	RcijgpjbOZjicM/Fdi3Fe+W
X-Received: by 2002:a17:90b:2cce:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3ac8af94f43mr6385936a91.10.1792154773600;
        Fri, 16 Oct 2026 05:46:13 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm1756414a91.1.2026.10.16.05.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:46:13 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org
Cc: alim.akhtar@samsung.com,
	bvanassche@acm.org,
	beanhuo@micron.com,
	stanleyjhu@google.com,
	peter.wang@mediatek.com,
	can.guo@oss.qualcomm.com,
	mani@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] scsi: ufs: core: Fix a deadlock between clock scaling and device commands
Date: Fri, 16 Oct 2026 21:46:08 +0900
Message-ID: <20261016124608.46-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 08b12cda6c44 ("scsi: ufs: core: Switch to
scsi_get_internal_cmd()"), device management commands go through
blk_execute_rq() on the pseudo SCSI device, which shares the tagset
with the logical units, while ufshcd_dev_man_lock() holds
clk_scaling_lock for reading.

ufshcd_clock_scaling_prepare() and ufshcd_pause_command_processing()
quiesce the tagset before taking clk_scaling_lock for writing. A device
management command holding the lock for reading at that point is never
dispatched and never times out, so the writer waits forever with all
logical units quiesced. On a Lenovo Legion Tab Y700 Gen 5 this ended in
a hung task panic.

Take clk_scaling_lock before quiescing the tagset, and in
ufshcd_clock_scaling_prepare() also wb_mutex, which is always taken
before clk_scaling_lock. Release them in the reverse order. Commit
b52d695d0620 ("scsi: ufs: core: Keep internal commands dispatchable
during error handling") fixed the same problem in the error handler.

Fixes: 08b12cda6c44 ("scsi: ufs: core: Switch to scsi_get_internal_cmd()")
Fixes: dc5dcac53278 ("scsi: ufs: core: Add helpers to pause and resume command processing")
Cc: stable@vger.kernel.org
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Reproduced on v7.3-rc4 with out-of-tree board support, using short fio
write bursts and readers of the exception_event_status attribute while
devfreq scales: a deadlock within 10 s without this patch, two clean
600 s runs with it. The pause path was only checked by reading the
code, and the reversed release order only by building it. Sashiko
flagged this lock order in [1] and [2].

[1] https://lore.kernel.org/all/20260723130641.92FD31F000E9@smtp.kernel.org/
[2] https://lore.kernel.org/all/20260813222950.8C1581F00A3E@smtp.kernel.org/

 drivers/ufs/core/ufshcd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index cc75384c6502..87f78ffc8cbd 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1360,13 +1360,13 @@ int ufshcd_pause_command_processing(struct ufs_hba *hba, u64 timeout_us)
 	int ret = 0;
 
 	mutex_lock(&hba->host->scan_mutex);
-	blk_mq_quiesce_tagset(&hba->host->tag_set);
 	down_write(&hba->clk_scaling_lock);
+	blk_mq_quiesce_tagset(&hba->host->tag_set);
 
 	if (ufshcd_wait_for_pending_cmds(hba, timeout_us)) {
 		ret = -EBUSY;
-		up_write(&hba->clk_scaling_lock);
 		blk_mq_unquiesce_tagset(&hba->host->tag_set);
+		up_write(&hba->clk_scaling_lock);
 		mutex_unlock(&hba->host->scan_mutex);
 	}
 
@@ -1383,8 +1383,8 @@ void ufshcd_resume_command_processing(struct ufs_hba *hba)
 	__releases(&hba->clk_scaling_lock)
 	__releases(&hba->host->scan_mutex)
 {
-	up_write(&hba->clk_scaling_lock);
 	blk_mq_unquiesce_tagset(&hba->host->tag_set);
+	up_write(&hba->clk_scaling_lock);
 	mutex_unlock(&hba->host->scan_mutex);
 }
 
@@ -1461,16 +1461,16 @@ static int ufshcd_clock_scaling_prepare(struct ufs_hba *hba, u64 timeout_us)
 	 * clock scaling is in progress
 	 */
 	mutex_lock(&hba->host->scan_mutex);
-	blk_mq_quiesce_tagset(&hba->host->tag_set);
 	mutex_lock(&hba->wb_mutex);
 	down_write(&hba->clk_scaling_lock);
+	blk_mq_quiesce_tagset(&hba->host->tag_set);
 
 	if (!hba->clk_scaling.is_allowed ||
 	    ufshcd_wait_for_pending_cmds(hba, timeout_us)) {
 		ret = -EBUSY;
+		blk_mq_unquiesce_tagset(&hba->host->tag_set);
 		up_write(&hba->clk_scaling_lock);
 		mutex_unlock(&hba->wb_mutex);
-		blk_mq_unquiesce_tagset(&hba->host->tag_set);
 		mutex_unlock(&hba->host->scan_mutex);
 		goto out;
 	}
@@ -1487,9 +1487,9 @@ static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err)
 	__releases(&hba->wb_mutex)
 	__releases(&hba->host->scan_mutex)
 {
+	blk_mq_unquiesce_tagset(&hba->host->tag_set);
 	up_write(&hba->clk_scaling_lock);
 	mutex_unlock(&hba->wb_mutex);
-	blk_mq_unquiesce_tagset(&hba->host->tag_set);
 	mutex_unlock(&hba->host->scan_mutex);
 
 	/* Enable Write Booster if current gear requires it else disable it */
-- 
2.43.0

