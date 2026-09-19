Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6CB330307
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818003; cv=none; b=Q1NZkPKnP0BJRKsaA/xTXsdMRKB81+8FEfBdELfsb/AB8UsZvLhjyG9pmPPQbFzcDgiWLmpPtsay94hf0XjLtwV2A2Cjdtcdpu7q1U5j6qEWc8lWNga33Vj2GintG8dfZvzmMFWgUM3JliTsf3UcqjRv9q+Vx/a5jj6K45OlkQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818003; c=relaxed/simple;
	bh=EvOJG+8Pl4ielrPZXBMTsv+Ae+YdDXMfiQGv0B2VxL8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pWXALRZ4XFYtGNQc/cGU+lTHopm8NwrgxRRqyaqc/htpjieLCPMajGhyw7ASJPvpByIrE+6FV7334qIUiXyE17WSNgFXcoCgSq/oEIxZlI7s5X7zFCmWBPd7hCmXBwwvctfBUkcZRAPTFfkOn02Y/WK4dUayvypOK2PeRn2kPOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTWynX0T; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTWynX0T"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so1408880b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789818002; x=1790422802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NPmuBQ9EGkU1scMbe6c8dUYzaaf0Kac0wlnce9t1ryI=;
        b=KTWynX0TPpODpaXm2RCLsjDQ1cOJbcRpOuQGq2AK1rmTImeyLKcV+3//UXDVb62MFY
         IuDN/Fpp4oAUTZklbUDrHqY9ALOASzzwSg5b+VrTqfaCNTIR+FM8rdBcRP5AKsdqk/Z4
         pKLhUx5VylCrhsGoMtxo2jEms5Pa63P9HAqHZ4Ndj0tcp4lzBQHRnH8BXr3SdjitSOHb
         w+9NKMIT4wf73eThwzd+ZIBClrpAM5Sel2bjUrifqvU3Xk4BTqVZv1k0vHcgRk+8znjX
         /La4767KBnLAUdH1+BIBiLdwDaErYqUyN69NaFTtgXM3kyDZlJ3Jq9BSwYQLwe8P7HaZ
         U7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789818002; x=1790422802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPmuBQ9EGkU1scMbe6c8dUYzaaf0Kac0wlnce9t1ryI=;
        b=Wzy0sUyXVFLL3Xn0qmmj1eZMSZ8VhOLx15iP+6tm+u4tS9aGNjnToPlwracOx2aaF8
         TFbkt5WQY/QrqIJp+DHAqCkIfYDRcj6efZCj0vMyCKgek8O93dkMS531nrVInq34ONwL
         c0Q5/+qfr9Ng4FQKrDbctsh48JY7MlT+gEOES0MF2Cc1Ivf4Bx2ce1VDdE27P/M/Mq4W
         Hl7r9MHBO/uI/NEQmshBjYwywzdvtjjP0m8AzBZO7VOyq/vY6UlqGAPZPtP5wONLTgiU
         BOAf0oxayS+pRJU2pADJ+g6UxGrmp6ZcqGqD1leGT+XzuQTSMK0uzDR4G02xTSqBxPfj
         ywHA==
X-Forwarded-Encrypted: i=1; AKwUvBwULDxt4MuDK/Nzu79DMan6006W+PA8QR5Xhh/lmWpBQDVwGDw3xqPPOaVdUy8UzxVECYzbt3oNL8AP4dY=@vger.kernel.org
X-Gm-Message-State: AFuF++k6rJhONIDAqY5N0Ziqlu+RatVRQ1GGhZ9HvtcRlp8LLuEqyM69
	/XMxBnmkTE0p6f816yFIfvCaG2gmAZNR1KD3i+oT2U/Y2rTLT+GwLhP+
X-Gm-Gg: AYBFou202puC42eFoCZFwSxIqbUdL+ICSHmiKh0xUooTHictK1YsNYmV7hKGhWDE+A0
	AAmBM5NU1Otr/FR8vtrd7hGV0bb9ZyYRbnbwMew+Hqx2mFCEvbtFevbkzSV/SoBke+47aDjq2u+
	ssKDeo2mFOK3oqMYmdsZ3lEl25LIflep5ypueKT4vFdhI/RmxifXww7d4aMlal2mVqVwx4aVL1t
	ytoJYd5KBlFjJ73LniKrUoWyO9jbVxyPAoPpzEsbUBxlB9tYBl3FkuREUiA6FabfML1JziRjmnX
	7aPkDWeZl97sUqlGVzlUbe+IbxprWnaNlA09rYGDsc3RL89JdNB7DSpsCjMY+VMHlErrBShmDoU
	jxGYn26w5lUT/iz8YGD/BJOZ2esZmdJl+w08xtxY4BYEzY7i3VKv092b852d4duRTUfSBdt9zYm
	K9lrnMIm3OGPllQe4FKKREs4TYaC8z1L4ve4Ad75IZ5TZxQnDobX+jt2vxcxQkOpwcFvqMB8b70
	1BxeGoJIW8ze9/M35662ui5q+u5Q/O8C0q+
X-Received: by 2002:a05:6a00:1788:b0:878:3811:23a with SMTP id d2e1a72fcca58-878381109aamr1195454b3a.54.1789818001831;
        Sat, 19 Sep 2026 04:40:01 -0700 (PDT)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f4ab3sm968471b3a.23.2026.09.19.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:40:00 -0700 (PDT)
From: Kaixuan Li <kaixuanli0131@gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Baokun Li <libaokun@linux.alibaba.com>,
	Jan Kara <jack@suse.cz>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	Kaixuan Li <kaixuanli0131@gmail.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ext4: stop verify_reserved_gdb() one entry short of the block
Date: Sat, 19 Sep 2026 19:39:40 +0800
Message-Id: <20260919113940.1823559-1-kaixuanli0131@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

verify_reserved_gdb() walks the backup group list, reading one __le32 from
the reserved GDT block per iteration, and bounds the walk after the read:

	if (le32_to_cpu(*p++) !=
	    grp * EXT4_BLOCKS_PER_GROUP(sb) + blk){
		...
		return -EINVAL;
	}
	if (++gdbackups > EXT4_ADDR_PER_BLOCK(sb))
		return -EFBIG;

The block holds exactly EXT4_ADDR_PER_BLOCK(sb) entries, so when gdbackups
reaches that value the test is false, the loop runs once more, and *p++
reads one entry past the block before -EFBIG is returned. The same value is
also the largest gdbackups the function can return, and
reserve_backup_gdb() then uses it as an index into a block of exactly that
many entries:

	data = (__le32 *)primary[i]->b_data;
	data[gdbackups] = cpu_to_le32(blk + primary[i]->b_blocknr);

which writes one entry past. Comparing with >= stops the walk before the
read and caps the return value one lower, which closes both.

The walk enumerates the groups ext4_list_backups() produces -- the powers
of 3, 5 and 7 below the group being added -- so EXT4_ADDR_PER_BLOCK of
them, 256 at a 1K block size and 1024 at 4K, cannot occur within a 32-bit
group number. The entry the old bound went on to read was therefore never a
real backup.

Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>
---
Reproduced on v7.2.4 x86_64 with KASAN enabled, and on v6.12.9 before that.
Three images, one reproducer, the resize target passed on the kernel
command line:

	case                     stock                  patched
	A plain, 8 -> 32 groups  0, 65537 -> 262145     0, 65537 -> 262145
	B group 257 (APB + 1)    0, 2105345 -> 2113537  -EFBIG, no growth
	C ^sparse_super walk     -EINVAL                -EFBIG

	(APB is EXT4_ADDR_PER_BLOCK, 256 at the 1K block size used here.)

B is the write, and the thing to notice is that the resize SUCCEEDS on the
stock kernel -- this is not an operation that aborts after the access:

	BUG: KASAN: slab-use-after-free in ext4_flex_group_add+0x50f0/0x5680

C is the read:

	BUG: KASAN: slab-use-after-free in verify_reserved_gdb.isra.0+0x270/0x290

A is the control that matters for a one-character change: an ordinary
online resize goes through reserve_backup_gdb() -> verify_reserved_gdb()
and is unchanged by the patch, same return value and same resulting block
count.

Building B needs the group being added to be exactly EXT4_ADDR_PER_BLOCK+1:
below that the index is in bounds, above it the read defect trips -EFBIG
first and the call aborts before the write. At a 1K block size that is
group 257, so the image is built with groups 0..256 already present and the
resize adds only 257. sparse_super is cleared with debugfs so the walk runs
end-1 times rather than skipping most groups.

Mounting a crafted image is not a Linux kernel vulnerability
(Documentation/process/threat-model.rst), and I am not reporting it as one.
I have not attached a Fixes: tag: the bound reads the same in v2.6.32, so
it predates the git history I can bisect over.
---
 fs/ext4/resize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/ext4/resize.c
+++ b/fs/ext4/resize.c
@@ -794,11 +794,11 @@ static int verify_reserved_gdb(struct super_block *sb,
 				     grp *
 				     (ext4_fsblk_t)EXT4_BLOCKS_PER_GROUP(sb) +
 				     blk);
 			return -EINVAL;
 		}
-		if (++gdbackups > EXT4_ADDR_PER_BLOCK(sb))
+		if (++gdbackups >= EXT4_ADDR_PER_BLOCK(sb))
 			return -EFBIG;
 	}
 
 	return gdbackups;
 }
