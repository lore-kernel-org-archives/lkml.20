Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6170D343D85
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789849257; cv=none; b=dugsMx4vu+QfFzp6raTXtX2UmsWA/xtXsjYFJh46xN7EpW1qaODn/uFTPP/yhYX1YXJvUQFqYPYdi3K3diZOvyNivlsYi47fi//AwSiA1GKPcb9GKbZD22dceU9R7gGIhX+cQXPB3IR2uTdax2MRLHrVBzWEeQ6QjChL8PzFtKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789849257; c=relaxed/simple;
	bh=9tXgFRdGNbY568yh3mm8gcBNUYcrFVVuPwDtoorSm9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p3W0ii8jY444cVnmxNUSf/2EW0OKo1Tw34pYgRIoqAvIXJ6dpnpE4Hsd0T1YkzTKuXOlPFTvmPHK/5KVRhzZr0aslv/SvCWHc1nbROcgqnAoxc6BB9uuNEO7pZkmdgQMER5mJ8Zce0tz8KRoMYaVArVrm/dgAgD+o1yOtyokJik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpVjX1iA; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpVjX1iA"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so1263264a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789849256; x=1790454056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpJqRoGvSP4j/JMvJGn7hs5Aen0UlxRTT14Hmtdeid4=;
        b=bpVjX1iA1TilQ/IdUW+eBOQRd3z+YhAKGfUPCUKhVc169eseE3z4XlrUDyVwzFR8mO
         eCD+RQ8jCSmuyN6It8q5YPNJ4ub+vzKvBsEmk/X52qyqLWdrpq4dQjGniKDK8AWgBTAC
         b+LqvdKVcNsHpVpiEmHzlNnAYpQAxoe56PFwBFOwlHwSWM9tiMiYLBr7OE+6SUU0mzwv
         AVyPNxn2/x0QsXRrWeT9ab/SCtmIagVL9Cvc/ErCIYm+gvAQsSta3dH+m3RVAALHBnMc
         66YyZ9ipVtJiYWF9YgIq0MPHwn1rqe8jpwn2ttFPgJ+Pqe30bbR2J99TFkztssH4Jpjv
         C7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789849256; x=1790454056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpJqRoGvSP4j/JMvJGn7hs5Aen0UlxRTT14Hmtdeid4=;
        b=2HBwS4xs/KhV59KAXUR3EQSywlcEJmQU8ZsjDrH0Wto1jBnqDd3XL0DO3iJXyZIVfo
         +UHCLIwATuMot6qVE6I6oMEVIC5rmj+O1WRnBEkzJlgtj1QfJaDPSWbtzpOqkiMTqmg0
         SDwvYbMPWQo9V+d0gL3KtyQGKRRwn+XjX37t3DWNi7NqQbOm7lzz7BxJJmPNFjgQkRX1
         36pEL7A2MvseXJKsPIO/fvWU7USuMsjKs2zZEXJr+5SF5tutyFTodPa0pfOPpRnL1IH2
         eQ0xCvypdPWShUYODpOcPjqylHOGN5uyyuY4Q+wv5dRyJiUs47dEl/zgg7zqcN3/G/3m
         FcKg==
X-Forwarded-Encrypted: i=1; AKwUvByoBKxr5MNurXVS8e1MasrVHBjxLp0ofsFn/wPGYmpQPrS9F7NgE1sI/8z5kscXcFjVf4BwSTrMgJsMaow=@vger.kernel.org
X-Gm-Message-State: AFuF++nmc68zZgGAfRyYMYoKFMFp+cSJ8IvLqel9o923UumbGmLWUR2M
	cHIAqu/o5vQBtejIiL9uMBOoWDQNoq3uCxhXcLMa92OwaOsyBGBkdjkDjINCwvTk
X-Gm-Gg: AYBFou1kOVPQ90aEUUlauFO74WOd5HB5PjlPms+LHGjJUFODn5g71fHXYCNFISxy3+M
	7ud1R/TKMiI8xSf3FEHSwIP0iDOYjqtf1MiE/jBzgdqXApngKWZf50HxfLqy4hRTwTMunxF/6Uq
	GN9gZ3XF9J2Hvbi5a8rPpHjmy5KvpRvmMeLEtCpcyBdNIZ7X4HxqJ1qFBzRtl9RHRu2pOhG/6pJ
	tI2ls/6KBygsuKOWP86/UrEq6NN2eJxTUWlf/rGkKCcTDu2jfRngfLXq6H0C6h6e8WhulC1EQ2t
	ml03w7VNg2stvb820FOzoSYTA42muBxvcxbV+hB9RmERkPSHYEvsQMdh9bKKmJe8pevE6LJ3qSj
	ixDIIJH51qeziYfc+3TmfCrwTX8U6eg+mD/LEsJguhXFhyUAokmybhPnYEMAqgsMPsxa7NNkP4p
	bgvw11wB26Mgit+Csvg5seVFyrwa2JMg2EeLEl8FObzVlda8nAevUUnXvuU8XnmXsSTV6ZgC8a7
	14fYs0b0HGRbsgrNOVAXFzQbJcyC/VDgGh2Qr/EfG7HksCwdp2tAqt8hBNxyKVE10tdAryU/ELz
	ZW2hPXJq2Q==
X-Received: by 2002:a17:90b:586f:b0:39e:6a81:f34d with SMTP id 98e67ed59e1d1-39e6a81fcedmr5281928a91.39.1789849255516;
        Sat, 19 Sep 2026 13:20:55 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm5950593a91.17.2026.09.19.13.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:20:54 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Bob Copeland <me@bobcopeland.com>
Cc: linux-karma-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] omfs: fix inverted check and use-after-brelse in omfs_dir_is_empty()
Date: Sat, 19 Sep 2026 20:20:53 +0000
Message-ID: <20260919202053.2435593-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omfs_dir_is_empty() scans the directory's hash bucket table for an
occupied slot (~0 marks an empty bucket) and then returns:

        for (i = 0; i < nbuckets; i++, ptr++)
                if (*ptr != ~0)
                        break;

        brelse(bh);
        return *ptr != ~0;

That return statement has three bugs at once:

  1. The sense is backwards. Its only caller is omfs_remove():

         if (S_ISDIR(inode->i_mode) &&
             !omfs_dir_is_empty(inode))
                 return -ENOTEMPTY;

     When the directory is NOT empty the loop breaks on the first
     occupied bucket, so *ptr != ~0 is true, omfs_dir_is_empty() returns
     1 ("empty"), -ENOTEMPTY is skipped, and rmdir unlinks the directory
     while leaving its children allocated and unreachable.

  2. When the directory IS empty the loop runs to i == nbuckets, leaving
     ptr one u64 past the end of the bucket array - which for a standard
     block size is one u64 past the end of bh->b_data itself. Both the
     out-of-bounds read and the emptiness verdict then depend on whatever
     sits in memory after the buffer.

  3. Either way, ptr points into bh->b_data and is dereferenced after
     brelse(bh) has dropped the buffer reference.

With KASAN enabled, rmdir of an empty directory reports:

 ==================================================================
 BUG: KASAN: use-after-free in omfs_remove+0x265/0x270
 Read of size 8 at addr ffff88811a145000 by task init/1

 CPU: 1 UID: 0 PID: 1 Comm: init Tainted: G    B D  7.3.0-rc3 #1
 Call Trace:
  <TASK>
  dump_stack_lvl+0x70/0xa0
  print_report+0x153/0x4c6
  kasan_report+0xf1/0x120
  omfs_remove+0x265/0x270
  vfs_rmdir+0x2e6/0x810
  filename_rmdir+0x3bf/0x530
  __x64_sys_rmdir+0x4b/0x70
  do_syscall_64+0xda/0x4b0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>
 ==================================================================

All the information needed is already in the loop counter: the directory
is empty iff the scan reached nbuckets without breaking. Return
`i == nbuckets`, which neither touches the buffer after brelse() nor
reads past the end of the array, and gives omfs_remove() the polarity it
expects.

Fixes: a3ab7155ea21 ("omfs: add directory routines")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Note that nbuckets itself is bounded: omfs_iget() sets inode->i_size to
sbi->s_sys_blocksize for OMFS_DIR inodes (not from the on-disk i_size),
and omfs_fill_super() rejects s_sys_blocksize < OMFS_DIR_START, so the
loop always stays within the single block read by omfs_bread().

Because bug (1) causes rmdir on a normal, non-corrupted filesystem to
delete a non-empty directory rather than return -ENOTEMPTY, this may be
worth a stable backport even though I originally hit it via a KASAN image
test. Left Cc: stable off for you to judge.

diff --git a/fs/omfs/dir.c b/fs/omfs/dir.c
--- a/fs/omfs/dir.c
+++ b/fs/omfs/dir.c
@@ -232,7 +232,7 @@
 			break;
 
 	brelse(bh);
-	return *ptr != ~0;
+	return i == nbuckets;
 }
 
 static int omfs_remove(struct inode *dir, struct dentry *dentry)
-- 
2.43.0
