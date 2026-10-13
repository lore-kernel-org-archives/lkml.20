Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E287B51C04E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905416; cv=none; b=MN0MUe7tj1I6+BGN8KmRC6gtgelwgJxjQpxgXrINR1kV2pj808+WXkkSN5EWwNrCE27plAjCDTnazqmAqFp1Z/AxPD64rw3qsQqMJicnjWUhHE4mTIDja9nosbahAZopUcXYQ+HlHA1Ymlpp3qEePfnGFeh5litvvI/nGpDhN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905416; c=relaxed/simple;
	bh=sKk3oN5cFHzkAN91yHmBdxQ58VbKE/Uu1eh9rgcoHak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lz26eJwFwwmU4ljE0lwtkkQSkifrVRdlEBZ1CgibBYqhLOTonMnLX+dfl4ToYYX4li+D+rWLPomj/EHOUqp6iQhGJdSW47JX3uZD4CnLxAVAaiZpU+rtZVVo+2NHB7ASoIaViyhG5AcIHmmC1Elj8UJNyTOJIL1BuuWschJrm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQSOSKTY; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQSOSKTY"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1059958a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791905414; x=1792510214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JkzKGFG3myHoVz2H3BeUHaZ9CQAbPKe7kFhV45l+XFM=;
        b=VQSOSKTYM6undaRs5oy9pBldbCcIFTMbvC3dzEjUWbH/pgeUb1YSGW+VVfNRaW2xCH
         aI919D+DZo5prhxzTg80jv1PM8j3FBdW1nOAnYCiOIrLgayXXp/7A4RplGo8D551xGrA
         nSHWYXgweymCG2i4eXI25ZPFc5xCJSHVct3bwWMjcuhgh7LRh6m/HKcOfv4w8TUhXOT/
         fwn1rzFLLlkwBM0Z1l/XgNrUAqqMAmz3u7zbTvYNRmcU6XWTPljAAFxZlMyPjsIvz7vh
         BQJqhTgB8t/aS0foCVGunaR4nhAlqoySi0Y6hUxFTSEmrJa/j/uu8AiJ2k0H/DKyPkNB
         1HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791905414; x=1792510214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JkzKGFG3myHoVz2H3BeUHaZ9CQAbPKe7kFhV45l+XFM=;
        b=pEEAEGJ5Gogn0Ye3wZiAJTfPsciPj33zT+/i2d0PRL5QxG5g+kx/8pJkyZgQ55PCKs
         gWlKuv1OyEa7jerjenQ4wNAjpgjt00e/3+biaGRjubWQ7amUy1Lo4pvJmnTulGrUolyO
         oNMATpRqGyCtpqAbMce5NX/FJmkg7vIWE06fMCSBiQZuwrFHnOhKNA9eqoSIP9lodILn
         oldWsZn2MVMBgNzUzbOTXNhiShzUiuDEIuXhJbEgdFNAhMG4kWNbakHVf5XO0CzAemv0
         jiifIh5AayNyfH2g8OSp9Dxgf+j59N4oIyrOcGxMJcuVVY3J8zSnutMc9sf9vNlzJe4c
         bTrg==
X-Gm-Message-State: AFq9FYI7tyzc2dp8D3sH7VSYGSyztZuvc9OSpvuwjYv+2lNI/XFWUjvv
	KV8KaWPMdyUBZYOUyLrT/u1c0/cotBwsiZI8rd7ODUAe1ergfKX2vIdT1u6gbw==
X-Gm-Gg: AYBFou3qrexMQXS0d9XBFhjm+i13gf+7D+XJApasWsTY0qZ0/gw1cxxYNl7MYYTv1pP
	lFRbzNlZBoNXFxuYvrqPx1MiTBAn4YfAFsS4QM5zzgcmzvqtZ93UtCDbdm4Crg9ui7yAnN195Ze
	fbg+Fg/MvP51tnh+mZh527MKsyFoWbXSyBOjM7XusioVKpemdZeysTIdr/76gyV0uHtY9IAwv8Z
	RdY2PSrLHEmpNxY3VgwIEfXzuPFjFmi8jOEeBF0z2ic0TGZTYmNv80RMfpDlDvo+sxrsRRFJto6
	ja3laiaP+b+9x/4OtF0eT7LYJHxsZh6EJ0JjHKLvLqw2IiJqAIcAXB5pJ/JLZzi/QKUk0ynN6/c
	8UyQNgWrB8WDTF6tgKY6dxak7SWNbhNuXJLDJJFnJmMBkhXZgqzCRksGOMQEETBZtAt9jOtDhMv
	WfPckvr2ZfM4v5xjIlPWH26epO1/HTcTne/1N/KoLAw3swDYKwTUJKsIbsi8R7jpPx9qGYCWXBi
	JDDFRyhnX6WIk3OOvN4j8Ue5DRvHI8FSrJWrouJKcGbehxzGM+9P10uvS9Px5n4rDAytzTcdoHu
	ydAWlJoKmrERn9BE
X-Received: by 2002:a05:6a21:1bc2:b0:3e0:afe9:ba4e with SMTP id adf61e73a8af0-3e16bf4c1bemr10960689637.67.1791905413906;
        Tue, 13 Oct 2026 08:30:13 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804e8586sm16590b3a.42.2026.10.13.08.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:30:12 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] fsck.f2fs: do not roll forward a checkpoint-disabled image
Date: Tue, 13 Oct 2026 15:30:06 +0000
Message-ID: <20261013153006.1200086-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

With checkpoint=disable, the kernel does not write a checkpoint at
umount. The last checkpoint is the one written when checkpoint was
disabled, with CP_DISABLED_FLAG set and without CP_UMOUNT_FLAG. The
kernel never rolls forward such an image: f2fs_fill_super() skips the
recovery when CP_DISABLED_FLAG is set, and drops all writes after the
checkpoint.

fsck decides to record fsync data only by CP_UMOUNT_FLAG, so it walks
the warm node chain of an image that the kernel will not recover. While
checkpoint is disabled, SSR reuses blocks written and invalidated after
the checkpoint, so the chain can point back to a block written earlier
in the same session with the same cp_ver. fsck then reports "detect
looped node chain" and fails. xfstests generic/320 and generic/642 hit
this almost every time with checkpoint=disable.

Skip recording fsync data when CP_DISABLED_FLAG is set, as the kernel
does.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/mount.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 8479ed1..98d797e 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -4096,6 +4096,10 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
 	if (!need_fsync_data_record(sbi))
 		return 0;
 
+	/* the kernel does not roll forward a checkpoint-disabled image */
+	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_DISABLED_FLAG))
+		return 0;
+
 	ret = f2fs_find_fsync_inode(sbi, &inode_list);
 	if (ret)
 		goto out;
-- 
2.56.0.385.gd3acb90ef8-goog

