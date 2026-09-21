Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7CB352037
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789964717; cv=none; b=s3m0X6iUrqwNN4oa8zPBjOzcpJLNlM4WMK9AFElwtTfbRnBeCw7251ZiWLwpProelyp0MTr8jqeTwb+2miM8BE2oxvg2otyItzxHENX4b1VbKyA4gv1IL++3QM0E3icBrqA9VBiS8gMH1TYu24JecaHdACDq1rZuIA6qNtIO0Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789964717; c=relaxed/simple;
	bh=v0w383wrJmFjeDOPvuYeCmXagFTbdJS+WWeLDvsxuTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzleNM4rwqnvysWp0Urz5XrnVl4Wz/lt7p4LrNKGet0bHN2jV8WsUg2KFY4csOUAtPy6BqFAqOXlCD2qGk6ac3B03lbq3c4+E1ZZ2XbSiSEcq/kS2wPKhS/JrqFG7x5NGaTje+RuGwujVUXkBp1cickyIU/iDP0BU9vDZhgUUNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OP9mnGGF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OP9mnGGF"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso2481830a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789964714; x=1790569514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA5tXzYbxW4SOaapy7UZIMM3Ax6VWJ+EwXJKAt+JvL0=;
        b=OP9mnGGFeJe/OkNJF75ZHdp9fu6drzzkpsJj8cKhrbV3UMAJLg5dFE6kFBsS2D7Tgt
         GOH/1IrP0yldjm0m3LwVVtAy3CyRN7gjnKXsSR/wsv6VfCvpRMIFDLXiw6cO2+dL7VVf
         TqdlmM82Ir8nS0buL/+JrEM23NPwc87yxGBB6HB9GJ9nIRLZY+DJHrjBraCN3HynzvCC
         ZXJMql20bBHGZi1t7aFFp6sOD6Eq/hb++BD0w/RKf9LqxWcqPMtLh2TEBmZmyKT1YSPE
         a4rZY5C6/YmRuaiZlYlTl7JMCv1jY8ZH+8bKNWEqVxc9WHLpDKagPNWP75oaE9Tjgniz
         Ao5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789964714; x=1790569514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA5tXzYbxW4SOaapy7UZIMM3Ax6VWJ+EwXJKAt+JvL0=;
        b=hrwM4SKewlH1KSyfyN8nWX8akW62z45ugatytd5xA98ELFtEUealsDvm09D39bfTtQ
         zu+wS+l5/WWllOQayRd6bFSuP6a8o8b5tqEabKbf5vUn1ltIDRcL8tvCZf7we/8H8akI
         3YWxYOInmmRYSj+wBcg90yuCKNkr7EqxBbpOyTc31KvT0TyorZXwMcCfzvB3fP+ALn3q
         ncM3gCx9pXVIzTLy3xRebdyL+5nUjhURJkRiCGaAUthkh3A1vFl+xmABRvMl0Ly6FTHl
         uip9eDnseJwKf4NqMiODdmr0VPuCnMqnYP6DjbWwbwK4Q22kplpGrW/759ci80UrSB6h
         EcBQ==
X-Forwarded-Encrypted: i=1; AKwUvBykzzIDLAQFIAjeiIVfScvP1XLxdKyelxZHvRbKOX223KyEbrjQgWCf1Ur5QVK0+Onv7dHpGBL61xk6grE=@vger.kernel.org
X-Gm-Message-State: AFuF++kUSMObFlWON8MQkYJ9Vs9aboplL9Gjtrf617s5Kd3vpYvlN6s+
	yZZwDztxxzeqSkC3igQa7aORecrIbd9PFzfRkaV2nDDgEJQRntir4cBs
X-Gm-Gg: AYBFou3P4oU4xELK1pF/PqCTgOM06HwJQ03qngxYBf060UQ7gWHeYxclMiFw5dnRB2u
	qsQFBiY0Lgz7xh1oY4RH3sXkkriaZwCGke8szkoQONbA4sYh4uZdyZrIMvfm+jsCaGmeg64NtMl
	ClKJSLeNMbqF/tfhKsDqBcpRPP6sz/E1N3jc90/geRz30qZejHU1YAiaavvuHwOte2Cy1MoQtBZ
	GzToXIJIlKbuo+yQmJPho6TiZgUz4eYTYeRJYRFJNEyhMQGD3MPeuxmiB5+oY4tNgAkGMCQmMbo
	IIOfbwBCI/HMj775PjU72fLgRCmj/w0T6mYRCOw5td9itXTi3l3/OZG3lcN5qZuOPp8NLNlrkG3
	aGA9eropgxKeyqhHFeHrqqV9rt1NWOGtRVbbyIbaxQ3KfxJQGBYOdoiQFDLxjuGNSqBlfx5aS0Y
	WTgvorH136c5jYdDvDcLBNho/K1P2WwXNTZ2Vui05t8Bb5EcQLKTyEp6TdlsddTGdV0qII6mrmi
	OVVWklLq+BkmNLW0+CHOn1GPNzuTPv5I6u1ZO62+6C3KDqYulVEHMj5LMz1mCF7EWqoEFGPmd/y
	o9N2ghdFoQ==
X-Received: by 2002:a17:90b:380a:b0:39e:6a7f:1dc7 with SMTP id 98e67ed59e1d1-39e6a7f224bmr9054430a91.35.1789964714219;
        Sun, 20 Sep 2026 21:25:14 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c5b3932sm11742139a91.13.2026.09.20.21.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 21:25:13 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 3/6] qnx6: avoid double brelse() on error path in qnx6_fill_super()
Date: Mon, 21 Sep 2026 04:25:08 +0000
Message-ID: <20260921042511.1473629-3-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260921042511.1473629-1-benquike@gmail.com>
References: <20260919222556.3792829-1-benquike@gmail.com> <f68323da-e90f-46a4-b3ce-70d26de115e6@kernel.org>
 <20260921042511.1473629-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_fill_super(), when selecting the active superblock, the inactive
superblock buffer_head (bh2 when superblock #1 is active, or bh1 when
superblock #2 is active) is released immediately via brelse() without
clearing the local pointer to NULL. If a subsequent mount step fails and
jumps to out, out1, out2, or out3, qnx6_fill_super() unconditionally calls
brelse(bh1) and brelse(bh2), causing a second brelse() on the already
released buffer_head. Because the extra brelse() drops the per-CPU bh_lru
reference to 0, freeing the buffer_head while it remains in bh_lru, this
triggers a KASAN slab-use-after-free and VFS buffer refcount warning:

  qnx6: superblock #1 active
  qnx6: error reading root directory.
  BUG: KASAN: slab-use-after-free in invalidate_bh_lrus_cpu+0x9f/0x120
  Read of size 4 at addr ffff88800151e658 by task kworker/1:1/69
  ...
  VFS: brelse: Trying to free [already] free buffer
  WARNING: fs/buffer.c:1051 at invalidate_bh_lru+0x4c/0x160, CPU#0: init/1

Clear bh2/bh1 to NULL immediately after releasing the inactive buffer_head.

Tested in QEMU against Linux 7.3.0-rc3 by mounting a crafted QNX6 image on
/dev/loop0 that activates superblock #1 and then fails root directory
validation: on the unfixed kernel, mount failure triggers the double-brelse
VFS warning, WARNING at fs/buffer.c:1051, and KASAN slab-use-after-free in
invalidate_bh_lrus_cpu(), whereas on the fixed kernel mount fails cleanly
with 0 warnings or KASAN faults.

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split the qnx6_fill_super() double-brelse fix into its own patch (3/6)
  separate from the mmi_fs sb_buf leak fix (4/6), and remove Markdown
  formatting from the commit message, as requested by Damien Le Moal.

 fs/qnx6/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index 9b624829520e..c4a35d81e67c 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -399,12 +399,14 @@ static int qnx6_fill_super(struct super_block *s, struct fs_context *fc)
 		sbi->sb_buf = bh1;
 		sbi->sb = (struct qnx6_super_block *)bh1->b_data;
 		brelse(bh2);
+		bh2 = NULL;
 		pr_info("superblock #1 active\n");
 	} else {
 		/* superblock #2 active */
 		sbi->sb_buf = bh2;
 		sbi->sb = (struct qnx6_super_block *)bh2->b_data;
 		brelse(bh1);
+		bh1 = NULL;
 		pr_info("superblock #2 active\n");
 	}
 mmi_success:
-- 
2.49.0
