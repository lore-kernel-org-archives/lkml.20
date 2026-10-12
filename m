Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABCB49AA59
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822712; cv=none; b=UVceFCqII/Mc8l3eN/wUv6RFVgc+X6aFuxjAl9+UYTbHgOWu9PSjgvhM7CUFV3LIeVSYzY2nOwYBAHqb4TiQPkeLJtmXas12gwT0X0NLbDcjMRivdPOozD33SzgFnO+X8+nFgRU66isFPFuTkmQYn/H3gYyw0Ot3DnJkOUqtGro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822712; c=relaxed/simple;
	bh=mS1YxiGqsTFH3eCVQRZ5LafzdpFpPZaiEEMIm1jUIJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SaDP4Vas/8jdKZEn11Q3/sQkn/zCy9aTpRsllDuwHKxF60j123LYq1SnM+LQaXrPB96CP79voM/LVjfsX2XNfjm1XfPRAi8mB6/n4KKs/5orr5OCD1lMtFyvGrqJu5slIqPRJsPZBGMFynq63vOTUF1EwWpJQrWX+jDilad7qaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndDmZP/k; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndDmZP/k"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso615403b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791822711; x=1792427511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=27GJZuID13BymXdxFHBspHWoyDbWve6K8GH1xdrFhgI=;
        b=ndDmZP/kV9CvrcjWVBsw6Tbk60BUMBcO6PVBKttymkruJn5lLY0z+u1aScRo8QB4Fv
         QMdcLWtv8yleRuoZzCYwear0vG8G6zPeelk/wIjBhLX6eqVCIS/J9Cn0Q8Qaqb1xkagk
         h/1smEHzwxqapyR4bHQVmaP5qCtBOGNn5SF9zO9TVvjhVPsWcZBGdh3ajXp4K6v+N93k
         cTe7tUJyKgwHh8GhkRm+ggKRyTVfphYhlcIeS1BbcKNkaMKKFLpjNRP2PMVYwr2i+aTr
         Zuf6xbtUoMlYWp77evMdOj8aahyI8RID+rmxwJBvSN5GDjTCqUt7WtxNvZJHw2NIGqpY
         bH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822711; x=1792427511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27GJZuID13BymXdxFHBspHWoyDbWve6K8GH1xdrFhgI=;
        b=L1UM3nL9lCqYKQR7kexVQSicvpH9V5Ia55I4SMzdkDUAQ9igheA2BezemWVvUP+zV+
         qys1seRF6FD6MoFhojgOf/60y1o+7XedPGf7FCTrwPI2L+hrB8N85fVawMXqNOkY/93p
         i5RML7sFSHWweVYllPQ+7tMuoofFprmQCieoqf673UYxfzk8cebrCTBk+BfoPYj3TwnR
         slZQswxx/RHWiIwxKyoTVVz5FrNnGEfF/BWQw9YJ3Z5aCZU5knxa0v/3CV8TEyUtoDrm
         Qp9LNJUlSs+Ppl5rufpDnlbIzk+6u93CyTiQxiebu/OMoNWdgMplXvTSzRNfXGl1Qpix
         VG1Q==
X-Gm-Message-State: AFq9FYJchVGbl4/4xztHoH3/BrF8pJUjVn1MLOCzN2GKp9z+M2Fzyd+G
	vGvw+jcDS/v5xU6avM5oWH13DoDmTBhxVjbal41T5TzipuklND06HGm5
X-Gm-Gg: AYBFou2+/7USgAQyvrJS4UnJsQUEiFa7Rx7uHS8MOSjz9HM43zZf2gg8Oe9R64mgEeb
	O5+pLR3j1D5l3QFTMKQ12aZUsPtpEco6NjH09p+3UbTGYFN2GI4sHMOU0FQp2vGBT6+DDVeiEuP
	FYXZ5vXh4Zje7kqgSWkQ8aAu0B4Z2/CVCkxdReGrXzpelqEgMiCeK7mvQrQBhnrl47O5DIW2aI0
	nA2yBJLPMgyqYK57GeIvkTT722Y/SkaDBogOv9MwrIthW+8W0bmd8wd+AxKR+ocgVaDYCDWB9EC
	519JSiqUBZ3M4zhXuwHf4whSUVZrMUweAYq45SRqUpuc+37uNngyYXQBBOrsndpl/WzV3ieVSaj
	vExj7dfUZ0JrlxJp3QgqtDSWFpvGw+nq2+p85wVoHNa5kRshJvcHMdGi7XlmKt4AwtJnMxyPMW0
	ZI71NflyATc7TKU8yvS5kPz3T/qoxJGdfP6gzCnGtguMQ3IR2eQHnYevbbdQ2eDjvJ9gBTYA==
X-Received: by 2002:aa7:88c9:0:b0:890:cecb:99c6 with SMTP id d2e1a72fcca58-897c78de8e4mr8854215b3a.45.1791822710895;
        Mon, 12 Oct 2026 09:31:50 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7aa0:50::3cf:23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ccf7cdsm4069668b3a.30.2026.10.12.09.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:31:49 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+bffc332f376fdab5cef0@syzkaller.appspotmail.com
Subject: [PATCH] minix: don't re-dirty the superblock buffer after a write failure
Date: Mon, 12 Oct 2026 23:31:44 +0700
Message-ID: <20261012163145.398471-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

minix keeps the superblock buffer head (sbi->s_sbh) pinned for the
lifetime of the mount and modifies it in place. If a write to the
backing device fails, end_buffer_write_sync() clears BH_Uptodate on
that buffer. minix_put_super() and minix_reconfigure() then call
mark_buffer_dirty() on it unconditionally and trip:

  WARNING: fs/buffer.c:991 at mark_buffer_dirty+0x299/0x410
  !buffer_uptodate(bh)
  Call Trace:
   minix_put_super+0x16d/0x460 fs/minix/inode.c:70
   generic_shutdown_super+0x13d/0x2d0 fs/super.c:751
   kill_block_super+0x44/0xa0 fs/super.c:1903
   deactivate_locked_super+0xbe/0x110 fs/super.c:586
   cleanup_mnt+0x204/0x2a0 fs/namespace.c:1392

Reproduced by mounting a minix image on a loop device, making all
writes to it fail with fail_make_request, and unmounting.

Skip the s_state update and the dirtying in minix_put_super() when the
buffer is no longer uptodate, and fail a state-changing remount with
-EIO, the same way hfs handles its MDB buffers.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+bffc332f376fdab5cef0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bffc332f376fdab5cef0
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 fs/minix/inode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/minix/inode.c b/fs/minix/inode.c
index daf83e4ff25c..5c0ad33b85e0 100644
--- a/fs/minix/inode.c
+++ b/fs/minix/inode.c
@@ -64,7 +64,8 @@ static void minix_put_super(struct super_block *sb)
 	int i;
 	struct minix_sb_info *sbi = minix_sb(sb);
 
-	if (!sb_rdonly(sb)) {
+	/* a failed write clears uptodate; don't re-dirty the stale buffer */
+	if (!sb_rdonly(sb) && buffer_uptodate(sbi->s_sbh)) {
 		if (sbi->s_version != MINIX_V3)	 /* s_state is now out from V3 sb */
 			sbi->s_ms->s_state = sbi->s_mount_state;
 		mark_buffer_dirty(sbi->s_sbh);
@@ -146,6 +147,8 @@ static int minix_reconfigure(struct fs_context *fc)
 	ms = sbi->s_ms;
 	if ((bool)(fc->sb_flags & SB_RDONLY) == sb_rdonly(sb))
 		return 0;
+	if (!buffer_uptodate(sbi->s_sbh))
+		return -EIO;
 	if (fc->sb_flags & SB_RDONLY) {
 		if (ms->s_state & MINIX_VALID_FS ||
 		    !(sbi->s_mount_state & MINIX_VALID_FS))
-- 
2.43.0

