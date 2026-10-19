Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448945;
	b=IZ77nLUNZZq5lGYSXWSPI8VULi31evrQt5x7GxPOe9XgfU4efLos5OWS99O4ECfL5IkJ
	 N7e0FHkRKKd5FmovwvP+gkFxM727i+V2r4BWmJiEvUiOKTe9M+xFF0YnQygxF9SmiJa3b
	 cpdigXA0FJoiEhNFdoZqLfmSMr+MaM4Jl94aWN4Z+GrLvnq93bBKOT/NVFjxQ3+yPHSlI
	 eQPsPSRZRqHhHv5tpYPd6+rCBKXWO8karmQPKc6MHhytjgRa+Xe5maCk9TgMKbD1u7ID9
	 Q+hIo4DEAp5dKu3TzFj8/adVW9KENjfSmUm/kll95deQtvwiWhBS6BThOWa6UrxlHKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=grPMzPcjuw5NknkchPGY17WHY+uOk9YxlvMRLz3jlQ8=;
	b=E1BqrKF2XP04Ek84YS1gkHqtHTSkhbMruAT+a3XEjEt/9QapIo9WLeLCLQLDHsnx3s+G
	 4a0MurSy8q5vIInp0bAMRG8r5/I7y7aCx4rNCjQ5equLpuDlOXo569z40KLnhz6zJSLE5
	 4JJ9+QNzQmFF3RcsuvrsQMyei/gcFl6hdSpovVE7EYngsYOzP6AldbLaNK8q56+849xsa
	 8aEer7IvyAUmvQCGJ9OCg9S//ye1kjbUC+/NjeM1bJZSJvlr1nIPqxKnecP62OZuZetO1
	 s9npMGd7x9jfI5dyFJxvkCCfvLJtPMMOL3hikpKc65HgzwLtknkyfv1tKB38zV4JIaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pXYlgfS1;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7183F606A322
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7183F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pXYlgfS1
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1545180f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792448943; x=1793053743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=grPMzPcjuw5NknkchPGY17WHY+uOk9YxlvMRLz3jlQ8=;
        b=pXYlgfS1gr29AG2ETT3tGp8vnAw3OYUwF9u9S1+h14H4z8PaaXwUwYa/x+kMzWr+iq
         L/6gWmUy8KCi6Xf1AeD7LCF7dYBG1BbslumTqj3delnhMmtqach4KBDHoin5bnHKDenD
         tKG8smktnJakoKQnD85begvJwgg4l9Kx+viAPm39Wj13vCiiOWelwE8wqJE9+snWNzSn
         dZ/uiQhXk+8Ng2j3TzBlZ3Cou8gBYsMp09SGwSmu2UBnVr9RSKR2kRHUf01wfisrRNYf
         xJjUuUUi68b0sPiUu2uHFedcSG3zdHG8yq6r2bD6tzeMqf7uOz+g+VJbUgwiQ7pHxlB1
         yMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448943; x=1793053743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grPMzPcjuw5NknkchPGY17WHY+uOk9YxlvMRLz3jlQ8=;
        b=nIaEfg+ODB6Xh4sqLJrgBV4SRmyLSEoGD+jYgZ4p172mrAGomniuLo33F4KUhBPNMJ
         KB3NgUnATYmx6vLyJAHjQ/zeQAKqT/WKczTLZ27zZnJrzIo9ctDTYTerff510V1vHpCb
         Fe4ltRBAopeWEC3rwrta/IQ+zMeeII46jw95ZTOOdE0Qf3ItbuV2HW3TSBshimtdzQw1
         8PbSPBfz9Wm2wcSjqPeQkEMS4FiBPycR2Mugq7pDvd+9Qkl80e0eDJcWfaJgqN+7hSK6
         i1JaRGfyJI6d8LA0LLhnlJgoEznakHOtYyXcCtfjC+z5IY9v5k1rxfNkF2G7w3vuq0MR
         EGXw==
X-Forwarded-Encrypted: i=1; AKwUvBxDrQdhwU16b5TBYudNCX6mm3rX5tEkk2+XIGhVPAgFyErNgqnH2fOeJ3oM8iHZb8khZ7a8mQ5uoA1bDMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQAjAiJQa4WEJzkk+Ul8Pw+KxLmamBO6GhfpKLMqHlo64t3NlZ
	HNVF1Xz7xRwTcuZdk0XI23xGJSH2WmXcoqDsQphqWxAYcQdUCN7qAwWq
X-Gm-Gg: AYBFou0+RD997AtrUl9YLQmn8MmX6sF+MsHUYjW8IG5fKkOSF9cMyZhJbl1SixV/+eW
	enlO6msWqQupv2XPh4c1ZwnsXkH3eeovhz9iJlfyTXQ8foY8Eei1beATowAbFiKKKzQICRrELcd
	q8frQTHHFUrzijfsKBFjriScSHpxl9cKlDBCaAH3SslSOUPG6cGA/6p78PdNQ3TogGTA/aSlDa1
	ePaMFXeW+MvxDEZjhL19Yzbw6ymoJtedZkZLNUlcuKTOIcPMaG/T3P9FMFDhcN8LhFeOjLucoYC
	1chTOSPrZdhWd7s8dZQDkgmGZtShVSCbZtzThZVTduAODkdginwOS6C8udenuXd7Au8Bk9O7Apc
	g+iiz9T5XRkAlgkCpgPQFpKbGIKtPZN2nrs4g2k9PwaRp90pzQj1WRTdfk/P1TwUs4dCsn+m5qs
	LE+VRsR3CxNtHMYFhrYP54zMtonr2fc8EkeoLi7mVDAD1UKdmyNC9NufNAlCQi5uup/o61h5rhL
	K095DcyNzaGgOL09CUgGiHiZnDVoUn8fm/EoPgYJ0NuWAq7MYU=
X-Received: by 2002:a5d:6b4c:0:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e07fb1f63mr12709378f8f.43.1792448942577;
        Mon, 19 Oct 2026 15:29:02 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.102.223.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm1666544f8f.31.2026.10.19.15.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:29:02 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	linux-security-module@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com,
	neganhat@gmail.com,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] lsm: don't call d_path() when current->fs is NULL
Date: Mon, 19 Oct 2026 23:28:58 +0100
Message-ID: <20261019222858.1766-1-drifabdelmalekmohamedsaid@gmail.com>
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

When the last reference to a file is put from exit_task_work(), the task
has already run exit_fs(), so current->fs is NULL.

syzbot reported:

Unable to handle kernel paging request at virtual address dfff800000000002
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]

Call trace:
 kasan_mem_to_shadow include/linux/kasan.h:65 [inline] (P)
 kasan_byte_accessible+0xc/0x1c mm/kasan/generic.c:210 (P)
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0xa4/0x320 kernel/locking/lockdep.c:5916
 seqcount_lockdep_reader_access include/linux/seqlock.h:73 [inline]
 read_seqbegin+0x6c/0x144 include/linux/seqlock.h:838
 get_fs_root_rcu fs/d_path.c:244 [inline]
 d_path+0x224/0x4dc fs/d_path.c:287
 audit_log_d_path+0xdc/0x19c kernel/audit.c:2221
 audit_log_lsm_data+0xe0/0x12d0 security/lsm_audit.c:199
 dump_common_audit_data security/lsm_audit.c:421 [inline]
 common_lsm_audit+0x1d0/0x290 security/lsm_audit.c:451
 smack_log+0x1f4/0x264 security/smack/smack_access.c:400
 smk_tskacc+0x210/0x2ac security/smack/smack_access.c:255
 smack_file_open+0x1d0/0x230 security/smack/smack_lsm.c:2078
 security_file_open+0xec/0x258 security/security.c:2739
 do_dentry_open+0x2a8/0xfbc fs/open.c:973
 vfs_open+0x44/0x2dc fs/open.c:1101
 dentry_open+0x74/0xc0 fs/open.c:1124
 ima_calc_file_hash+0x120/0x5cc security/integrity/ima/ima_crypto.c:269
 ima_collect_measurement+0x420/0x874 security/integrity/ima/ima_api.c:300
 ima_update_xattr+0x160/0x230 security/integrity/ima/ima_appraise.c:617
 ima_check_last_writer security/integrity/ima/ima_main.c:227 [inline]
 ima_file_free+0x40c/0x528 security/integrity/ima/ima_main.c:251
 security_file_release+0x84/0x148 security/security.c:2424
 __fput+0x2c4/0x74c fs/file_table.c:506
 ____fput+0x20/0x30 fs/file_table.c:541
 task_work_run+0x1cc/0x25c kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x58c/0x1a74 kernel/exit.c:986
 do_group_exit+0x198/0x238 kernel/exit.c:1129
 __do_sys_exit_group kernel/exit.c:1140 [inline]
 __se_sys_exit_group kernel/exit.c:1138 [inline]
 pid_child_should_wake+0x0/0x104 kernel/exit.c:1138
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x19c/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:796
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:815
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

d_path() renders a path relative to current->fs->root.  After exit_fs()
there is no such root, and no substitute root is meaningful: the
record's pid/comm describe a task that can no longer name the file, and
the file may have been opened by a different task entirely.  Falling
back to another root would produce a well-formed but misleading path,
so report the field as unknown instead, as exe=(null) and name=(null)
already do.

Handle this in audit_log_lsm_data(), where the meaning of the field is
known, for LSM_AUDIT_DATA_PATH (Smack file_open), LSM_AUDIT_DATA_FILE
(SELinux file_open), LSM_AUDIT_DATA_IOCTL_OP and the AF_UNIX path in
LSM_AUDIT_DATA_NET.

Alternative: omit " path=" as it is done for inode in audit_log_lsm_data.

Fixes: 4a9d4b024a31 ("switch fput to task_work_add")
Reported-by: syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=975ace299d6ba2eb1cea
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 security/lsm_audit.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/security/lsm_audit.c b/security/lsm_audit.c
index 955b2e7b2c8e..5ed505d781bb 100644
--- a/security/lsm_audit.c
+++ b/security/lsm_audit.c
@@ -169,6 +169,15 @@ static inline void print_ipv4_addr(struct audit_buffer *ab, __be32 addr,
 		audit_log_format(ab, " %s=%d", name2, ntohs(port));
 }
 
+static inline void audit_log_lsm_path(struct audit_buffer *ab,
+									const struct path *path)
+{
+	if (current->fs)
+		audit_log_d_path(ab, " path=", path);
+	else
+		audit_log_format(ab, " path=(null)");
+}
+
 /**
  * audit_log_lsm_data - helper to log common LSM audit data
  * @ab : the audit buffer
@@ -196,7 +205,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
 	case LSM_AUDIT_DATA_PATH: {
 		struct inode *inode;
 
-		audit_log_d_path(ab, " path=", &a->u.path);
+		audit_log_lsm_path(ab, &a->u.path);
 
 		inode = d_backing_inode(a->u.path.dentry);
 		if (inode) {
@@ -209,7 +218,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
 	case LSM_AUDIT_DATA_FILE: {
 		struct inode *inode;
 
-		audit_log_d_path(ab, " path=", &a->u.file->f_path);
+		audit_log_lsm_path(ab, &a->u.file->f_path);
 
 		inode = file_inode(a->u.file);
 		if (inode) {
@@ -222,7 +231,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
 	case LSM_AUDIT_DATA_IOCTL_OP: {
 		struct inode *inode;
 
-		audit_log_d_path(ab, " path=", &a->u.op->path);
+		audit_log_lsm_path(ab, &a->u.op->path);
 
 		inode = a->u.op->path.dentry->d_inode;
 		if (inode) {
@@ -321,7 +330,7 @@ void audit_log_lsm_data(struct audit_buffer *ab,
 				if (!addr)
 					break;
 				if (u->path.dentry) {
-					audit_log_d_path(ab, " path=", &u->path);
+					audit_log_lsm_path(ab, &u->path);
 					break;
 				}
 				len = addr->len-sizeof(short);
-- 
2.43.0

