Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345070;
	b=drVk8xcj9M0jWsjAmZi9HiTaq4pJYa20xskNKX3X0gjTEdjtuljdE2w+FQm7i8Gk5vwK
	 HOK5SJRoTrIyCu8bU1W1Qo2p/5aTVd8JI2GWaVMDFDgu9pFSgso78NDmYuYgH1/cncaxE
	 Fk4ON4T9IPoTnAYoiUXUBHsvuGDfd1wEcPjzKqbgo6LD8fhrtgRvioUFjDH9x1rS+VpSo
	 GcsbhYSCHske5zuXCK5RArBkcZ2f0jGofCJeD9owhIhvIVcn4FSV8FBbi64Esyq6PZbfy
	 XTY2lPdACRhqNjq2oh2ZQqdQATiCkrRnWBbm3fkSCb7oE60c45wxaPE9ciVmvUeljIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TC09uNuPonGXjl/unVFttCF+flEGGGYAyLCGtQa6eaw=;
	b=XPdZuHSCYNmpBBzKWf1R7X4kB/9So4Bd7xUD/IF5FqPm22MeYMDRW9EVgz1EsolKC4vg
	 I3FEiJFaJyaNgo9X5mkxB9z1poPi4hSBVAJjyWdVCHu420AgFxeTpmZ3t6gDzfZfb1oR/
	 SpgFeoAv+aDavGRG38qKgYt49b2LoQ7oPMn7QVipeh97Ia/LM9Rg/YYpKbMfhRieSva80
	 8tzvs4UMC+XKo48YciHfdJG67T8F6F8n72uVs1LmfDWm5Q6JuSWLfDlUKCDCWuO+QYY8W
	 t1lghf6EQLkmcx5WRmI2x1/cvuaOxZRbroOgTf2drkbdyfR14ZrUxqq9Q3b7RHATirw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xZ0W2v/m";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AC8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7AC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZ0W2v/m
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a17a332ecso778617eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345069; x=1793949869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TC09uNuPonGXjl/unVFttCF+flEGGGYAyLCGtQa6eaw=;
        b=xZ0W2v/mgNa2gPXp1oXlehPwfMfTmGYGAdJQENx5HTREQCRxXNEX1KHS74Lex/LnKM
         SkK2oL41vipMN9lKXIRb3q/xuj0tNPsFytvo4uH9kb3LTxf8BstDq0RhqzodY+4JpYtf
         qwua2IzMXsOlcVxOxf/oBgRZP5VnYhxEPiKH5Snx31EFauAa6StdvIwfnexfa0AH6r/L
         yJqcX+YCbQDtLD1bIhG4HR4mg0WUV3Ze09SVGHP6GbguA2HUWuvpiMnYT1q7TSmYKtL7
         D7ccfT8y85dLD+hlF2A1zCuQI+BEcLdMSNP//ET2lNi/nx7PEbOUpHs9ZOt5Fp/MwTiD
         R62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345069; x=1793949869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TC09uNuPonGXjl/unVFttCF+flEGGGYAyLCGtQa6eaw=;
        b=C/7o/7mmxQUfkY6YqfmYlsEaXP/24chcj/j914bpWbqapIqfGRXyHEwK72s5aUxy8s
         QiPKTwRxfDLj8u+oS0BxL4QLOrx2pGwBYTjQ/sOYgmYVOb51s74InQ1JIwRY/ytWK/H2
         pOjkOlFBliP4NunsnaUPIHo4dEcFQNBG2XOEa74smfi3E+MhO9gF4rXdg4Hj6KQwXOV5
         Av9zDMECPwSwwt2zJg6TuFcavh3O8EDLKBtCfFsYQPbmdFgI7PM+uJoIVahT8ot5pkZL
         vtqn30Y9c//USUZU9zNDH17U4weGTt/usa98XY+Wvt5plesRg5OCrMRSBU+Xd1nAvaWL
         mj1A==
X-Forwarded-Encrypted: i=1; AKwUvBwGA64mfuUHYJLdo41V8nMnHk7+kCbGfOw7vRzvHqkh2bVMbFY3OQi485n4DkClUz/j4GiYPErAafdnKi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYImoSgaAjgalPoiHPMRK6QuEunqRdg1irKmLrmgbX8rWD5n3cSO
	Eoj5aVY+c7w7T/kfl0kSpYDw4gj6Dv0TYHGHMGprOfom832jup+NCt0b
X-Gm-Gg: AYBFou1lwOYDWluC4fDYNGZskjDHx39IQRPVOe4w2aZJJFIYRmH5jgjELobjx28Q6wR
	HdN1ajj/0xbx96GsUaCmKC8tIaK/oNLwHJRmNXswuPUtGARBzIj0GORov1eyvPqKAwML8U5frfP
	g/JYRIofAa8d4kzUN8LDUA+c7uMXPVv23m1ZtN98zuDN7/RpqbBZeGd4aIxVGDKanQPii5BMopu
	ABp9DCsp+4Fo1T1kayBQVQ/5pJZh0Y/o37XUHKoS1kcWlOm3TuYoWla/gQw0hbwyaQdZby2l5vF
	wLPIuCOofpuMx+czNAQ03uXCxW3zgSPbln6iv1D78WjZWfisR1xBSPg7N5A8GfHw2t6Fyp1UiVq
	AVOE/hcgyv2BX+XayJ1/ORThbZ5m3BNFfvL2H7DkjbOdRQHS/vVylZG498w48v0Xctql0DYMzRc
	mkdtsIv5aVa1NvpckyQZ9ZDDTSgPaaLdNz81hJkTjCvTD8j5KslItmMiCXrO2OH7OfKfxcRzmHE
	UuSKgbedYqbiqH9iEGfK8FM9QNsiiAKOOF20Kzuhw/BVEWah6mrJ9BtDam6ZIHWbMM2rx6KkINY
	Du3VMK9cad+X2K0ihwthkx/0s813oDDZ3T39m0fY/q18VA==
X-Received: by 2002:a05:701b:428b:20b0:1a3:dfb6:e593 with SMTP id a92af1059eb24-1ac5eea3690mr2126468c88.27.1793345068566;
        Fri, 30 Oct 2026 00:24:28 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm4462883c88.8.2026.10.30.00.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:24:28 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: lihongbo22@huawei.com,
	sandeen@redhat.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	syzbot+e818dd42ada3b583bed1@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH 1/2] f2fs: fix use-after-free of quota file names on failed remount
Date: Fri, 30 Oct 2026 15:24:22 +0800
Message-ID: <20261030072423.197883-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

f2fs_show_options() prints the journalled quota file names without any
lock that excludes remount, and a failed remount frees the current names
before restoring the old ones.  Reading /proc/mounts at that moment is a
use-after-free.

Read the names under rcu_read_lock() and free them only after a grace
period.

Fixes: 4b2414d04e99 ("f2fs: support journalled quota")
Reported-by: syzbot+e818dd42ada3b583bed1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e818dd42ada3b583bed1
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
The names are not marked __rcu: every other access holds s_umount,
except is_journalled_quota(), which only tests them for NULL.

 fs/f2fs/super.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1071059f2cc2..510df7998c18 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2325,6 +2325,7 @@ static inline void f2fs_show_quota_options(struct seq_file *seq,
 {
 #ifdef CONFIG_QUOTA
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	char *qf_name;
 
 	if (F2FS_OPTION(sbi).s_jquota_fmt) {
 		char *fmtname = "";
@@ -2343,17 +2344,20 @@ static inline void f2fs_show_quota_options(struct seq_file *seq,
 		seq_printf(seq, ",jqfmt=%s", fmtname);
 	}
 
-	if (F2FS_OPTION(sbi).s_qf_names[USRQUOTA])
-		seq_show_option(seq, "usrjquota",
-			F2FS_OPTION(sbi).s_qf_names[USRQUOTA]);
+	/* Remount frees replaced names only after a grace period */
+	rcu_read_lock();
+	qf_name = READ_ONCE(F2FS_OPTION(sbi).s_qf_names[USRQUOTA]);
+	if (qf_name)
+		seq_show_option(seq, "usrjquota", qf_name);
 
-	if (F2FS_OPTION(sbi).s_qf_names[GRPQUOTA])
-		seq_show_option(seq, "grpjquota",
-			F2FS_OPTION(sbi).s_qf_names[GRPQUOTA]);
+	qf_name = READ_ONCE(F2FS_OPTION(sbi).s_qf_names[GRPQUOTA]);
+	if (qf_name)
+		seq_show_option(seq, "grpjquota", qf_name);
 
-	if (F2FS_OPTION(sbi).s_qf_names[PRJQUOTA])
-		seq_show_option(seq, "prjjquota",
-			F2FS_OPTION(sbi).s_qf_names[PRJQUOTA]);
+	qf_name = READ_ONCE(F2FS_OPTION(sbi).s_qf_names[PRJQUOTA]);
+	if (qf_name)
+		seq_show_option(seq, "prjjquota", qf_name);
+	rcu_read_unlock();
 #endif
 }
 
@@ -3151,8 +3155,12 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 #ifdef CONFIG_QUOTA
 	F2FS_OPTION(sbi).s_jquota_fmt = org_mount_opt.s_jquota_fmt;
 	for (i = 0; i < MAXQUOTAS; i++) {
-		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
-		F2FS_OPTION(sbi).s_qf_names[i] = org_mount_opt.s_qf_names[i];
+		char *qf_name = F2FS_OPTION(sbi).s_qf_names[i];
+
+		/* Pairs with READ_ONCE() in f2fs_show_quota_options() */
+		smp_store_release(&F2FS_OPTION(sbi).s_qf_names[i],
+				  org_mount_opt.s_qf_names[i]);
+		kfree_rcu_mightsleep(qf_name);
 	}
 #endif
 	sbi->mount_opt = org_mount_opt;

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

