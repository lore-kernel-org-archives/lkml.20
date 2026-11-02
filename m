Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587019;
	b=SPzP9WeJRG2qdQydvmJa2k2Ut5CrSwe5GAaQLyw4lfSbdjwUCMEiG5BCn4CD1F/sxkFn
	 AxDQyCh6cQaIBDCt5gFZRtvSxJOIb9LMUVT5pbEZsjlzV7pP2Y63LSRBbwl7/8StHZciD
	 qbi/PziogwfYCFhyr7LU3UUslHir5gZy2tT8Q9vWTRumHfsxlGJov7ERoYsSoMVs9d3Su
	 Oml8uUlksvIihuA/snaJnYPTd/CnYZKT+eOnLp857lEPEg4aewDnhyDajvVUJHAYkFr+H
	 bgHDTGyfsHFoMZfLVZqPc9BFhrV7OiwXEy+cX4Utu/OAczAubbmS1reWo06V+twjSTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HEEAk/Q46YxnwTmxNKxdH+qih83wDE1j0UFvCl3PWms=;
	b=0l7fNVMjAqj6bpRV2x07KtTkMJvESMzN1rTuW+Ln7Skx6fzEsYvoGfYpscI2h9ikNOAO
	 9ralsaB/D1zS3/SIqL0NUirYKQdMqxVBGDFk+J8DCmh39ZTYC92zDoUvCq1R4WX8wEMu2
	 APij1ycJC40kMb8mOAR4dd3fT7Fwkf2pGnnOpnv4/RzEVGSfti27w31z1o7lzesKLJ2zK
	 6vtvbDpSGJC9hLGj7MRhBWLxMnBv3cypNz3zAMFhLIT4F2HwpB3/73YV+CVjGSxA5KcQc
	 z0uEWhZ2w6n/rVuVaBBN1au/iMllCO6IPMNTyK9dq1fCLveslb90P+5o1NVIZxj9BQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVIFoIit;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8C7606A336
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8C7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BVIFoIit
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-89f639ba307so820569b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793587014; x=1794191814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HEEAk/Q46YxnwTmxNKxdH+qih83wDE1j0UFvCl3PWms=;
        b=BVIFoIitQxf9mhi4w8vrQpbXZKLwAd4TnrCcOEkYIa3lik/Jk4Z5ea2i+TKFO/T12t
         0utblloiZfXy6iRaVTrldCQ1Nt4/a3PCsmkry2w6kysci6qpii8eMQ0JCN8SnH4/ZDO6
         gZLx2HY87uwnXbhhr34gqSt1aGLliQj59Z95zE8vReH0Zo0vSqURawMU2P98ISreAGYd
         Xg9OFbFlbOuhORaY6sw99zjHgH5Yujtp6qwS5pa6Yqz2MjafCR5yGVhT10OEfFo4OHiY
         TShD3yMTZE1+0LJ+5BdPSqvmB5ezU4187XNnBykOx7NJ/66e7+suY99aVBpOtMabs2Td
         MGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587014; x=1794191814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEEAk/Q46YxnwTmxNKxdH+qih83wDE1j0UFvCl3PWms=;
        b=ydSj7+7QaFkh98lt13F/WhGEpm3+NANTLPTVJu2XlfHXR0VGaJ8qwahT26OWIKYsop
         r21HoUXZ3hod6clX9dZJCQeDfiq8KLO7DL7GyrYRTg0b+RMUce8pVPS7HAhSYMJ1dBal
         TyaHdMSn0Et18xtYARPcQpnVGzE8/ipjG/zZT3IZdJ52fm+MmzUa+KQvqQL0VKC2dRCF
         q8+wN1PhYJvUvENyln3W5K9LZKPOgVjY8vzmh8zJq6gdZoElHWZmtQqUOrRjCFmx/3iC
         Z8R5pae3IsgNyVqnabdBSFI+4V7+Kg0xl9bGyUbRaHVp8/nTr7k0Zz1j/G0zZQu2RgQl
         rsow==
X-Forwarded-Encrypted: i=1; AKwUvBx+MdGYX5w3TeVahBzoUY9O5wLJ5mwRJYZjGNyzFTl706smJULhi/Vfta0GRjDpW3ynVlCAGInuJw2LVBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r1nlwC+CUY9G0IzxqADeD8LGJQ+6nVKXai2/Jx6t4mvkeW//t
	6zoCu0h6zIFoIfnggUB8snSN6bG8YjBM8vDMdtqv05EfNVOQKdX3ZMqe
X-Gm-Gg: AYBFou3YeE60knHgW+t0ZAFPAPPWJ//aUN3tNcVASICpmd5TeM+lozKzWSOlb3ML+d6
	rdnFG2xpputLPowjQ8GVATlFObF9R4v1smIl+8V9wXUTLAwHW9tYOfy2AcCLmO2f9pv6IKXEI/N
	1+hP+WFQ5DYcK25qwyTESKue2NA42UO0uiWsiEaaG4O08Ykux4iWnlTcE293uEKVK3RJCtSwq4a
	nGqyIbrMpkCMwPVnS82pKZvlsEqvU9KjVmR7ssFpnOHIZxneSYNz7sI1jI1n2MrZ0dC9nSf5bwN
	UsM+cj5WKuCqvc347P/tm8rgetUCHCMHRPcS0oJCrri7pdBIeLZx/4ulYGso9iiD3TV9BSsQ15w
	zvc/7BbIit95pQQ5OGxlIGuiFvZ+rFPV+tLIt9T+4wnibBjV2Bjzvjrc0Rj5LhajPRdC3pzqWH3
	u8Xpt/tRUYMPd48JEQURv0WzH1QRCQoohPRD9m2gKH866Sr6AT4jhz00aH2FnullLXIU8QJ2216
	EYbW+mKV+6JY2JCj1H+yaoxh0NveSym5K7vZbMS7uUl3qtCL1tw0/isAS+3bgXp1fZTZpeke/3Z
	55j8MgqxCndNDSCqMU7r5RnF7OJugAkr79wLOGRcSXPjEw==
X-Received: by 2002:a05:6a00:2389:b0:880:74b9:dcfc with SMTP id d2e1a72fcca58-8a9bddc4237mr7323388b3a.16.1793587013513;
        Sun, 01 Nov 2026 18:36:53 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8addc705868sm167812b3a.35.2026.11.01.18.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:36:53 -0800 (PST)
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
Subject: [PATCH v2 1/2] f2fs: fix use-after-free of quota file names on failed remount
Date: Mon,  2 Nov 2026 10:36:46 +0800
Message-ID: <20261102023647.1084979-1-zhanxusheng1024@gmail.com>
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
Reviewed-by: Chao Yu <chao@kernel.org>
---
v2: Added Chao's Reviewed-by.

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

