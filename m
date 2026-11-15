Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739623;
	b=EUWiPXnbRVxOPdXjMsNZaObXrqrNp+//STADXQnzplUlZkzlGHt777E3eCQxUz25TdTZ
	 ftfTcKpUX4EAaS4s5HJBY4G77UOcJMclyh+eS5n3IlB6id2pSz2IAMR8Dv4e4WjF5vM9f
	 ZF/3IjKsrA0ATBLgq/5hAZ7UPUditrfkXOba2iZ6XYd1nB5lG0PgpNCgr2PcbfLqHDzk4
	 bfFSEgLRhHUVgIHrDBCZZYWAmMRNNQ02P5djJR6TNj5tmKq7Ist/iw9BLitN2eFJMBHvT
	 J24F6nUVw9oxahcLqMDq1bY0OBapawswrQjiHSCy3UoYwYu3NfRXTSgUfNd5rco9FpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rZeatOF2xnBGrPevhx5lyGz8NiH/abT6xKA3mZc4/us=;
	b=3atzUzEluFiLksAFluGR+E8n8M7kdXD2rhkL2bx7OKEFHRMP54j5RgUeexLRccuVPXBN
	 2XCPuWWAJbVDm32l/xcmxSBOU96+3dAVptqdY2L3sFABcAM19XJzoxvHWQ9mDN65HqN0W
	 oExZCwJ9DPRT6HyuaBT5lPcxVYt19uEMXsU2rinqyIbQH0pbtJuz8Z0uPIAyMcPs6oItV
	 b+89TCiHRN/IR7pWnMuaOTJsEapHbfouja94p85AnZOQc9FdVKzfN8Cm1o/hZt3Lu1rWp
	 94iCfq94k/4M8zHtjkxMMTfgKy2eOrYoAzIUFFqHZxsWSzmYyHhDsRDh5rMv6xyKEJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+Fh1lIi;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F54606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F54606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+Fh1lIi
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a315ed211so2419697eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739622; x=1795344422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZeatOF2xnBGrPevhx5lyGz8NiH/abT6xKA3mZc4/us=;
        b=b+Fh1lIiJOeuP+FzEz/fs5/DLFSb/0YLDl503K4fy9l7hFTqXmsQ8Nx1nH9M8QKkex
         g0M26MyAZP/XLSSuOa+f/s4HSGgOoDxSXakdWRX7/EwvMVfVinKBAeiqkZY2rAWHtZOU
         77osrZlitnZnVH1huKaXxrduYqVCImaYM/I4oB9gfvSbHKI6al65Wii39TKZm2i0eekD
         7srmxL38IgbwuE4IED5RbnTkKFB2+1DU0ltxwL64WwJ71NRpEzaUqvItnlcbXFw6gLOv
         4ZumhCHKc4UUiF8h+G0m98kdsfGEgZp25MnF4f4KK9Rumw+Z/cpqH8b5xIzfv5q2g1FB
         9wXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739622; x=1795344422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZeatOF2xnBGrPevhx5lyGz8NiH/abT6xKA3mZc4/us=;
        b=lJTvbf04DncVkGQkxLzntAb7d5xKe7u2x2lcPDJud4+/akHVAk3J5QtS9XqWL1e9DB
         MZZaip8LsS3NWXZEcW+ytd5fNb/tjmwWbw4lGrwfQTL++OFZbXrMnve/bHMArufgIDzq
         jze73E9qH16hQJkyL8kvqRpG7KPisjF6NW0C2BU1aUTFTc4IGoKnVbSceiFQSRBN7Nfq
         sPk51/4N66XbOXY+KOnh122cFv/UAlgJDPx9y1BazqcZKnwEXxSrOfyxE8jwwDuEvOdN
         zAhqoYAjUd0CyQxVzcBGDF02cY1IRHMkwMS4litOEJZDiEuLi6kIx1ok3yPLDeao+eBl
         uwBA==
X-Forwarded-Encrypted: i=1; AL+hErHMQqn/UllLBEcR2dynBfrFRm534Bu2VhuwVZq7uferQypLRyRoI+gsA/ci2O+rhaaH5kPnJSdEOBdTx2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dRQjgmRoCH2ECQxE5bXuTfr96W0yLvxCtK2Knz+aMXl5gFBlr
	dgX7kYdc9IchbC28Zqsb0rxA1nTGvnHne6MgnjkyFeKski5g6SV2unxT
X-Gm-Gg: AYBFou16WigQ3ZcKR24sMq4McNXSdnvtcHU7sUdqU08G1C1VcC116yMJqByd1+tRK+F
	ffoo7SA3qmwuV7i7r3ShDqSbSsvmOZ1e+/TqPsIudlidemy/8lDhTmTYOKUpzHZbBpe9bxYjw26
	qU/OFDxwQK6h4udJdxtgNk8I3FD5LyJpqYNRjBcQspV0VHcktrZL7ShyvVbjolJLa5ccrqpGMgS
	tg9OqlC8w/75ZmXaxcni3Iim+0pnatk7q8gR5sWbd/pCXsnC7DOj8rBqRfny7Ob32cxL0sxKVKv
	7dg6T8iommme71kK1yrijsgz3MR+8Lw3Xb4aUUunKfCA5S38vUlcnD3X7kLUWGl5Iy9/RpLSpTr
	CAl42aP4Wtx0wPIi0KL6+7tvAlen+PytLdIWSl3jV7byIYipai18pRbaVqrVatCj5p+svOzcCwq
	GLOt5TAl/tjmHmVoXiiCJ3IAI1noVC0vbv6PFaDfuPU/EvV1allYNeTIr1gGzAxAAB4U/XTtzs/
	qQwMFPFo5f9P9dOAicBsp+WO6A17qSm5h4hpXLzdvKwPF87w7pPZCSAmijlEA7U1a1Ssw/THRMg
	tuWrwPcei5ucGoC24a9zwAH2Qes01Ed7tFoWYjg1pRDJdP40mw==
X-Received: by 2002:a05:693c:87d4:10b0:371:197b:5ade with SMTP id 5a478bee46e88-377e1016802mr10069978eec.11.1794739621412;
        Sun, 15 Nov 2026 02:47:01 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac5:d45c:e6::17:34a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm24543858eec.11.2026.11.15.02.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:47:00 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Heming Zhao <heming.zhao@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+3f66416993279938e957@syzkaller.appspotmail.com
Subject: [PATCH] ocfs2: don't reuse SINGLE_DEPTH_NESTING for unpublished inode ip_alloc_sem
Date: Sun, 15 Nov 2026 17:46:56 +0700
Message-ID: <20261115104656.210945-1-ngocthang2710.1999@gmail.com>
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

Commit c204bf5ac3ee ("ocfs2: fix deadlock in inline-data truncate
transactions") made ocfs2_xattr_set_handle() take ip_alloc_sem of a
not-yet-published inode inside the create transaction, under subclass
OCFS2_IP_ALLOC_SEM_UNPUBLISHED = 1, so lockdep records:

  sb_internal -> j_trans_barrier -> ip_alloc_sem/1

But subclass 1 is SINGLE_DEPTH_NESTING, which ocfs2_remap_file_range()
already uses for the destination inode, and the remap then starts a
transaction in ocfs2_duplicate_inline_data():

  ip_alloc_sem/1 -> sb_internal

Lockdep merges the two and reports a circular dependency.  It cannot
deadlock, since the unpublished inode is unreachable by anyone else,
but the warning hides real reports.

Give the unpublished subclass its own value past SINGLE_DEPTH_NESTING.

Fixes: c204bf5ac3ee ("ocfs2: fix deadlock in inline-data truncate transactions")
Reported-by: syzbot+3f66416993279938e957@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3f66416993279938e957
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU (x86_64, syzbot config with lockdep) using the syzbot C
reproducer on top of 23c62304dde2:
  - before: "possible circular locking dependency" after ~8s
  - after:  no lockdep report in 3 x 180s runs, debug_locks stays 1;
            /proc/lockdep shows both ip_alloc_sem/2 (create) and
            ip_alloc_sem/1 (remap) exercised.

 fs/ocfs2/xattr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index 71e5986bafaa..9f2d5797e4d6 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -3867,10 +3867,11 @@ static int __ocfs2_xattr_set_handle(struct inode *inode,
  * ip_alloc_sem there adds a transaction -> ip_alloc_sem order that would
  * form a lockdep cycle with the ip_alloc_sem -> transaction order used
  * elsewhere, if not for this separate subclass.  The inode is unpublished
- * so the acquisition can never contend.
+ * so the acquisition can never contend.  It must not collide with the
+ * SINGLE_DEPTH_NESTING subclass ocfs2_remap_file_range() uses.
  */
 enum {
-	OCFS2_IP_ALLOC_SEM_UNPUBLISHED = 1,
+	OCFS2_IP_ALLOC_SEM_UNPUBLISHED = SINGLE_DEPTH_NESTING + 1,
 };
 
 /*
-- 
2.43.0

