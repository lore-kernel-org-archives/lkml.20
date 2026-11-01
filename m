Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494670;
	b=Pr+n++7FqCywWPb4aWwao/bVrn9YBgYv3yx8LX8COEjRG2WOMiN+BPoXZh2mp8vPJE/M
	 IFkUsC2zqkWPohrvpMe1vwRpJitR9CvpyVNfuFT7luUf6ACBLTifJ+L2RX/xkxO0j7yuL
	 eEcUMCsNmuRT4NlJkVZlvj0sAihdqw1ywPqaLAJ767+yCM0XZk79fVH4JV8iAVjoxxWnU
	 ciiswjO6vxlerSnW6sB9c26W5TKtlJUtflXetKhAZMdxekfgFrHjFg3i8WP7J2v2XCgUp
	 5FnsZHLVteouT7gmNa/0nEGbQB+iIADX9IfOjchat/huOZe7ZJF9OZtC4TIYPJduGPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494670;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ZuO5RQnjxMUWlRT4ORAz2INADBRbzdUVaUUr5clrJI=;
	b=fN3sSh318j2XNakY4G324AGA8SEJU91huVvdVwEQo+N4eGabMoSQY5tiEqkjDezbeSRo
	 c00GkE+xLvSdvVgGynT5PFemv39etwcUBssgHzTnZbDnW60dkARWnqNNCS3M1YIXbasRx
	 eJIjOpubZQD75zqRTqM581eBUBVCpkMDweE4UYLFuLfxThwt+eRmPXw9QBzJ1jG83Jwnp
	 JJii/zYJMi/ZN1jbNN9F2XwJWrlgt/kdYmc2pPLnX/2T/DTVwBjba7R7Qfcm7vktQU2n2
	 Jn9MjmUk2HTrr42YJwj+E2p8VhWdTeUvIbxhT+RDDqS6AlqTmwWmOj8OIFiAd82Mypg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=OSemu0HU;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b="9XP/Go58";
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB2606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89DB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=OSemu0HU;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=9XP/Go58
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494667; bh=1ZuO5RQnjxMUWlRT4ORAz2I
	NADBRbzdUVaUUr5clrJI=; b=OSemu0HUBoOoq/dmccpHAZqrzrn03oBUrJQpFGV906VPTQYGWh
	2S+1at0Q+Y8Pf9FYTcDjXe7eLiH8x8bpcUWR4w6Dg1QnVU7q1mi0t3zWPY8aA9+6Se/zLO/pmwS
	pHfzd+y2eWON3Jv8FBGuuZAtpWF+IxqUo5ok4IS2QAI1LWzhHV5C5HslPyfrWL8X2ZVkNPsgHvt
	/NmNJqDMCk+taEvAfzZufRKT2+s4wWVChwRDinaPfvLLEU+EGoPTi94jKkwYvC/AZh5e8u0euyD
	1sIs8i/yKcy6mSUgY9tJgJxh+sF57KnkMHNCJbxg293dtDamGXrkVxUGlKtQ4rAJlEQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793494667; bh=1ZuO5RQnjxMUWlRT4ORAz2I
	NADBRbzdUVaUUr5clrJI=; b=9XP/Go58vCZToVnany0kARYCOfFmUzOgGAkyWA/mXbk8qQYZXF
	FmOeYWxzK/C2XE2bcYmbqZ5a87DHr+/Ii+AA==;
From: Bradley Morgan <brads@mainlining.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH 2/4] taskstats: take the inode once in exe_add_tsk()
Date: Sun,  1 Nov 2026 00:57:41 +0000
Message-ID: <20261101005743.3022780-2-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101005743.3022780-1-brads@mainlining.org>
References: <20261101005616.3022705-1-brads@mainlining.org>
 <20261101005743.3022780-1-brads@mainlining.org>
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

exe_add_tsk() walks exe_file->f_inode twice, once for the superblock
device and once for the inode number.  file_inode() is the accessor for
that field, and hoisting the inode out of the two assignments also gets
stats->ac_exe_dev onto one line instead of a split continuation.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/taskstats.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index 37422c43b8caa..35e9fa71526cc 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -159,10 +159,11 @@ static void exe_add_tsk(struct taskstats *stats, struct task_struct *tsk)
 	struct file *exe_file = get_task_exe_file(tsk);
 
 	if (exe_file) {
+		struct inode *inode = file_inode(exe_file);
+
 		/* Following cp_new_stat64() in stat.c . */
-		stats->ac_exe_dev =
-			huge_encode_dev(exe_file->f_inode->i_sb->s_dev);
-		stats->ac_exe_inode = exe_file->f_inode->i_ino;
+		stats->ac_exe_dev = huge_encode_dev(inode->i_sb->s_dev);
+		stats->ac_exe_inode = inode->i_ino;
 		fput(exe_file);
 	} else {
 		stats->ac_exe_dev = 0;
-- 
2.53.0
