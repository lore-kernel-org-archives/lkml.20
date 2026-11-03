Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758488;
	b=CadtdtSXf3BVCVuowudf/kWVNUVBUP6R74MHh3N3+iOChJeFZPIwEDf6dnU91h6Nftiu
	 d1gfOCBDO0kri2HGzKiaAIEhmYYk9JMBkbfokLsQshG3l1VCSwD3HkBoeBXM1U1NUQ5cV
	 zQA8wlPDAA5avWayG2Kob0lqPGARnKMwnj/tR9fWHUoOEMAXzWfVXsCKPzsV1TjaujUy8
	 aO8EbIM2ZRRjgRKxWzpuomD45LqLrKOHK1XP7Q/pvgNQisxxIi6dyJE2WMwrI1xsi2Q0C
	 PkKcto+0U3E+JZ+OopEeYbonmRQ3UhUB2u50nP7ZSVKqv/4l7WDBkGfQ+V/T39Tz5og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758488;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:X-OQ-MSGID:Date:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=XBfDJz7gRmZu0nchIG89qaHRCgmqXtIjg6YwdCNMrB0=;
	b=ZoHP9FcO2PQ8YbCb/xjKy1fi+I0trNt/oLPFGcIU6nGkcAMlwYOh3vFgvl7Wy0IsNkFC
	 Bw3XJ4C8FSrnnZZueWtRFW7QNW3aJ/pCqr7kPuKn5FQQlCHNGQPah2ObSPYgZAhmCxJ1U
	 ibJDKnqCZ9Bv5H5zZiUKqG3zhZjBSOQkP9GBfooScfAZs52QpRpD445E/H4H3jU7otA/0
	 fP8JG+QYFqhtEd0QBUCg1RjadYpL3GzSs7CdpztVbXXRVT2IwfsztgoQpQNRyS5Rnrfnu
	 qh332Y2HVhI4CoWGpNRuZLuI/zkiF68NOrpt4L+XQntg5csXayWUnPna6FKrdfsQJ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=VXmogLkz;
	arc=none smtp.remote-ip=203.205.221.164
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB9D606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB9D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=VXmogLkz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793758484; bh=XBfDJz7gRmZu0nchIG89qaHRCgmqXtIjg6YwdCNMrB0=;
	h=From:To:Cc:Subject:Date;
	b=VXmogLkzIGclfhHNxBTDQ4LZnVs90i7g9cM8cBEwJOO/w0ydA04Hl3T0asDBbBixz
	 5FItUqEl4M3M+0RZsgPdla8P0yc3gUnYuyXX0urb1JEh3uOn//ErJ3/79UCCLqlZj4
	 f54XbsGB5upQIX+6VOYM87pTBB99aZGoFATh6O2I=
Received: from [172.18.4.77] ([61.136.26.103])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 3AA3AA30; Wed, 04 Nov 2026 10:14:42 +0800
X-QQ-mid: xmsmtpt1793758482t5umfjkl8
Message-ID: <tencent_B30A444DF94444D1A63A7D6F8E2039F1990A@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+TI9SJW93k+F4Nm6gBclOCQ6YEtUfR+kPyYOdsLRR1VC0akUk4P
	 cvyXtL8eG/J5VhHqmsxOoRL+KTnvVXNEVAC+JrkJH0DVMg4rsmsmGpQab17+haxylgstI/eMpsAV
	 YyjZYO/ywG2xwf1+MhXq0wshhSlw1d9VHbf3snqxD/ifdZKxqqZrWZBquireZdj6QBbyXd9sTYHZ
	 Bk2gBRrswfDSDn6Z45blflUgxQt0s9vJsjkuYScHZt81GC9nwVbJkbjcuaP0uBhja7+6xBaMti8J
	 ZZDkWC8MyAkdDXrxt2TZtC7fUl5p421TOYlr+wIREWThvg0HTepbAmw26rft8aFKSTSNIO+/cEBd
	 GP6Vi8SjbSJNEf0YG+Y52pqVqqHee+pEYKQ/s+nEXz4YlmPtnPANAPrvcH+2G1rtMovemBNotqDV
	 PlnzIVRzl2b79ucaYz6YhIYDBW+NwSnz408dXV4Q9tvV6UhUvXPjEHp2MEpdVJInMJW+3AYUyChp
	 PlgNDIxbPzIa7pn5IPlvgHpNXh/padZMlcHwOTxUnxqULbyCjSwu7KqsIAdybqMOhB3V9QPQalIt
	 tdW3jcbmtqJq/FHVclZ6SXFi6XDtekhSB5ujVuZkpYcEEjU6R4NKGUvqNNyi87Vfc94Ar05MB54h
	 HtcM1g1Uxmqag1OGIoEC9BP1P2UAEwpdqGr+Zt5v/2qy5phtwpUHdcV//IIh9c+vvwtxB6Yh37FW
	 Vi5Gv4kuoTYMPX4jO9PscwuB6guVbsHf4VT0/qfdBl9+OcCd0q/Vw7cjvfLNnvB5oB7MDCZMD8Vd
	 aqmzT1BzoU+FNMirUZnqZgWiIY/MrNSJRX4buO77Wrvry6ApdXTLBICXGtXW5trUtXNm2yWkcnqb
	 eZjpO/fGG13V8sX1w4P9jWNLgH1go9f+bDdbyhQ01D99Q5HNqM1PmRpXkNMx2z+syIouf24ZeCpg
	 nQtb56ow0ZGLNykSA1/h2/VADezbqdPjACA8GEInkRijjKu6XH0HgY83v4DoceudkyRnTFw1mHDd
	 hr2N8z71qz4OJIZc7skEXUA5sja7cmyPGAkQc4hDO0mm+qVV0hVH44AWm2kkY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Guikun Yang <yangguikun19@qq.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: f2fs: orphan entry pointing at an inode with no NAT entry triggers
 f2fs_bug_on() in recover_orphan_inode() - kernel BUG at mount with
 CONFIG_F2FS_CHECK_FS
X-OQ-MSGID: <c17-f2fs-orphan-enoent-bug-20261103@qq.com>
Date: Tue, 03 Nov 2026 16:00:00 +0800
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

Mounting a crafted f2fs image ends in a kernel BUG during orphan inode
recovery, before any syscall beyond mount():

  kernel BUG at fs/f2fs/checkpoint.c:988!
  Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
  RIP: 0010:f2fs_recover_orphan_inodes+0xa1c/0xcb0
  Kernel panic - not syncing: Fatal exception

The BUG is in recover_orphan_inode() (fs/f2fs/checkpoint.c):

  inode = f2fs_iget_retry(sbi->sb, ino);
  if (IS_ERR(inode)) {
          /*
           * there should be a bug that we can't find the entry
           * to orphan inode.
           */
          f2fs_bug_on(sbi, PTR_ERR(inode) == -ENOENT);
          return PTR_ERR(inode);
  }

The comment assumes that reaching this branch means a kernel bug, but
the ino values come straight from the on-disk orphan area: the only
validation before the loop is an upper bound on entry_count, and the
ino[] array entries are never checked for existence. f2fs_iget()
resolves the ino through the NAT, and a NAT entry whose blk_addr is
NULL_ADDR makes it return -ENOENT (fs/f2fs/node.c). So an orphan entry
whose ino has no NAT entry - or has one freed to NULL_ADDR - walks
straight into the f2fs_bug_on() with no way for the mount to recover.

## The two configurations behave differently

Under CONFIG_F2FS_CHECK_FS this is BUG_ON, fatal at mount. Without it,
f2fs_bug_on() degrades to WARN_ON(1) + SBI_NEED_FSCK and recovery just
returns the error; the mount continues and the orphan is dropped after
"recover_orphan_inode: orphan failed (ino=%x), run fsck to fix." - the
orphan cleanup silently does not happen. The missing existence check
is the same in both configurations; only the reaction differs, and
neither reaction matches what the on-disk state can legitimately
contain after a crash on a fuzzed or corrupted image.

## Reproducer shape

The clean way to build it is to let f2fs write the orphan state
itself: mount, create a file, unlink() with the fd still open, sync()
to get a checkpoint with CP_ORPHAN_PRESENT_FLAG, then crash (sysrq-c).
That produces a self-consistent checkpoint with a real orphan area
(one block, entry_count 1, ino[0] = the unlinked file's ino). Then
only ino[0] is changed to an ino with no NAT entry, and the checkpoint
version is bumped with both checksums recomputed. Four payload bytes
plus version/checksum maintenance, nothing else.

Forging the orphan area layout by hand instead (e.g. rewriting
cp_pack_start_sum to grow the orphan region over the summary blocks)
breaks SIT/NAT journal lookup and the mount aborts before orphan
recovery - the self-written orphan state is what makes the target
reachable.

The reproducer (image builder, ready-made image, crash log) is
available on request. Tested on 7.3.0 with CONFIG_F2FS_CHECK_FS=y,
deterministic 3/3; the f2fs_bug_on() and the missing existence check
are unchanged in current mainline.

Thanks,
Guikun Yang

