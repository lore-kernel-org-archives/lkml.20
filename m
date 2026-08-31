Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01030649C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181614; cv=none; b=DSiJ293L6vJViNcLA9PAnI9mM0F/40ah6cKLUVwtb5FFBMrUbVNO4HieCUSnL12dc0W2fNR0NPPaz30kTZSXo6r2oFOTOFxtk0wbZhgFR7fkuvY8HTyEyRueoHiEbDj+twAYHLJVx4jmNZd0bzJ2LknziAnKBvAFFvBbCT3UyyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181614; c=relaxed/simple;
	bh=gy+M6bfDLyvt2lfUFYqSi5byfUiCbOs3B5y6UxPpdoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZWh4CPxctuyOPWmGQ93LeYzSVQ7G1hwUQxehIAcFWi8aMrF50phOR+wC8296ZXdvkuFDZTLtPpGdadGib4BqR2Rt/zAnPbwi3Kh5mPdA3jWgPaK24tjJMr5SFYroPO8uRmCMTIDzZr77KkobMBJKeH26bbpRPVLIxvk6mKbsbRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNunKREH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNunKREH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6e954afbdso23294445ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181612; x=1788786412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqSWJ7B8C23FQTjYdEqlYLga5GlnyX9z3S1zAHLJRuc=;
        b=PNunKREHc7GlMlbWc6tqHVsmnhKDZJZvdw3WRci+cVkvQXuOrRGeqpdNxaxl7JQxrS
         fDFZ1RDg1FnVIML11LlvN0Al+GawaTPCqfucUQPK5GrK3EZIBCX1pZKptbsqP/BwCz9K
         7elZgWur/XuAYpmLLYQoqNcwwaEsXSJXZmHa9EcYwTnFqVgMiNvP0+qvGyClhE6/1OWU
         fDmCb/qP7CvwK3XDjk0HuWd2pofk9kNQuz2oWvZizfNfEFk0m+Ca0eEx5ghJ4lIWHPmF
         26lZiE0U2xWhhaSc4aUNndv2CsHusZbkIGbiB0b9l0UymjOtdlyNvAoroIUWKI9ElHgQ
         u+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181612; x=1788786412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqSWJ7B8C23FQTjYdEqlYLga5GlnyX9z3S1zAHLJRuc=;
        b=M3JzBEX9PZhhhN+nG/wQBEtyzye6BdZ45qPBvBau68KowHNke/hpXyAbqdAm2jNYdZ
         eKPrOMwoOubrm1SKLwYfmmnCBxmgUYDfTHvHFBapfFfpEyC5hHLXI3X3cIZCLrh3d5xf
         1juRHERetHVMJfwruqti/5Crd7QgZsUgZzZ6nQQz5WRfKAafb09QKrDwOMGX2TD6dMaU
         dOoqd75t2WAyyRAUD+elMHywkPG+gjIywNEfVWJu87ZTM5MKygc9RX8fbSF55ACVpc4/
         Me0cNoSp4qedcnvftbbBxc+V8Mn5RWp3YqTGbsDEwKbQoUTWCr8bPAPtB/9rx697jeEO
         CTRA==
X-Gm-Message-State: AFuF++lokLY407/teOyja+ysDbwkw6ZqPZdEQ7MgS7C+LSXU+r4NtgWP
	Ea2GejbVUY7i2RQ3In4rcbvzTM8lvd4Q5/NFqfufVRgdr8YrfRbCQWeE2VgwEE/C
X-Gm-Gg: AYBFou1ipYJ9xvZuDyU21tHx5hscitjKgCFZ6aJnlisQu79ghmd0UvJY0xP+XqpPR0r
	GJz2SF73OqHqFlgDj6m55r0ZywOjQaAzcFYq46m9Ol2MJdxLg4lpPTMDrGlrHm90w3CNs0rBTCI
	SYtKFlDSevqTH91oj1eQIQ+iGHfl10/IyuHFWv0eOvjpKibux+Uf3LiPlO2H2snyzG4kPAV4if9
	Matv9nwf+iC11xC+gh0JDLr2lqyWq2A48vp+nl7fGJskVutn8/NlrqLqvE++gE2h7Q6LEKaRKRq
	TM7We0ckkiKUnWg0IxovXpDuT+Jb4RSorIUxSIvNpGNYmunpTiSAPAWmO4N0yJbxjtUroMKxLvd
	jLk1vqgy/lyFdYi2sL9dUYdFuurvpZls7A0ACIKkUrKg7OdeurqP3p1+frXWTLtGBtzo3+M4AXE
	FuG0zfq+RcH1mNW2jcVPmF3/mF1FRyrHpCNiY0TbgV0LywK/1hmDnYQn2p9iR7vCmamrZGEFBu
X-Received: by 2002:a17:902:d988:b0:2cf:afa5:b19a with SMTP id d9443c01a7336-2d74e0cb133mr481609655ad.11.1788181611558;
        Mon, 31 Aug 2026 06:06:51 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([123.124.147.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75986aea3sm35368325ad.52.2026.08.31.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:06:51 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
	gfs2@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com,
	Jiaming Zhang <r772577952@gmail.com>
Subject: [PATCH RESEND] gfs2: stop logd and quotad before kill_sb log flush
Date: Mon, 31 Aug 2026 21:06:43 +0800
Message-ID: <20260831130643.780514-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gfs2_kill_sb() issues a synchronous log flush before stopping the gfs2_logd and
gfs2_quotad kthreads. Given a corrupted filesystem image, that flush can spend a
long time while holding sd_log_flush_lock. Since the background threads are
still alive at that point, gfs2_logd can be woken and block on sd_log_flush_lock
in gfs2_logd(), and gfs2_quotad can block on the same lock through
gfs2_statfs_sync() -> __gfs2_trans_begin(). The threads can then remain in
uninterruptible sleep long enough to trigger the hung task.

Stop the background threads before the kill_sb log flush. gfs2_destroy_threads()
waits for both kthreads to exit via kthread_stop_put(), so after it returns
there is no live logd or quotad thread that can wait behind sd_log_flush_lock.

Closes: https://lore.kernel.org/lkml/CANypQFasb8voDrg=O9xJikYHdRFeupb5VP2VeJaZ_wFNMoGr2Q@mail.gmail.com/
Assisted-by: Codex:gpt-5.5-xhigh
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
 fs/gfs2/ops_fstype.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 718e0da7dfce..65c536fffefd 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1777,6 +1777,8 @@ static void gfs2_kill_sb(struct super_block *sb)
 		return;
 	}
 
+	gfs2_destroy_threads(sdp);
+
 	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_SYNC | GFS2_LFC_KILL_SB);
 	dput(sdp->sd_root_dir);
 	dput(sdp->sd_master_dir);
-- 
2.43.0

