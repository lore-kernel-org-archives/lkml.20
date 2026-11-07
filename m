Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029361;
	b=Z/yH45eFVpGlaqGUCLjFT6+TTh7msDhSWg21ALVUjpqmiW6vaDsPBkhusudJ2QFXHC2n
	 QYn1uii4RIY4aGGYVh0nACHfH3pW0Fri26Zp9gPbxAq+MiYBH490EZ2Q5iPKrZIHgsz3w
	 T9ZlCt2i4a9cvTUHkuJdp22dDOQcxdoGmRF6U9vKQyo+9TtGk6pCbOUIUqMVcaK7Zzf+K
	 kmJGXP6Yhtdc7Z9K84w6OlZAqSNcxru5LzEXeymvJGlqiwd88xJpPniyW93Ohom/1XBhj
	 GNA6wTDD+yF4SBiW+WvN3C6OVEto3Pq1FET1x6sYMKUnAmY41qiM6ijGj2yWoeMyFww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029361;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=KZzYo1mFWqceQp5IL8TZLSTF9E5/7fwB31Ah4Dj4Xt8=;
	b=jqOSZL7JcNs23qHpKoC+mNtTlTF5ryfhR8TP1NDdZap3a0CrGwDzJ16TCiYztKgWH0ZP
	 bvWIO/cHGMrCetx1xxAyelscAVDJ7vLdWPcYFSm/tGlCzD0EqZob0sq356VoUiSOP4gjL
	 mXuz8AnODyCOdiT5ztpTkF+jeZriBhAknvw29iCcmb9xeRulQyVupW6eeIuP9vtCadQJw
	 7r3KVOynZX1MBgGh9/cuirwNAR8mJiJ/wW3l2pbeFdFM61L3aaCAUHNTQ+4m5OcqPq3Zq
	 RstAMkM0U4k7obKRVZaeJkm+e0jB1ollNbJLWcGCNjBt2E/aGXpF8/BUZM9K+VgXqag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=H5JLT0tp;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=aO1U1iJ0;
	arc=none smtp.remote-ip=188.121.53.109
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922BD606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=H5JLT0tp;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=aO1U1iJ0
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzBx4cqP; Sat, 07 Nov 2026 05:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029347;
	bh=KZzYo1mFWqceQp5IL8TZLSTF9E5/7fwB31Ah4Dj4Xt8=;
	h=From:To:Cc:Subject:Date;
	b=H5JLT0tp/cxxngpgWAatStXznUSl8TUzR/DtrTtsU9IN8G70lF9XRrErwE7cXo0YL
	 oo9M0CotTbtgKsPXOsOdTSqM4nnDboLCnabG6rwS6Rm501vjEhfcSlg79zvWAuW7bd
	 eeUJ1w7NanftWT3EomByueeuGjbpJpYydERuXsSwwNOLMhwb1/3GF8KYOX6y6AJr+g
	 6tFASmZTOWtXxbx6lu9FkHAS7jhJ3ez52yGAExitYiHpZ7VjJkynZBm7cIs4RSij/L
	 pkMlaI9dDnT9UecyfBRErU3SyRisXHF2G9r1ZIsfqjaiyWrl8VQCJ0v0e3R0cgnNzA
	 JDJy2e1lUw4ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029347;
	bh=KZzYo1mFWqceQp5IL8TZLSTF9E5/7fwB31Ah4Dj4Xt8=;
	h=From:To:Cc:Subject:Date;
	b=aO1U1iJ0oXBrvV47GM1a+VRxvQIqmBbsLz2yd5IhM9lQ2UJ9KeS0z90/otk048rZU
	 qh7ku7n+ZYLNhf/EbQwvmfuicsxAtChM3fm/Cnf8PwxqJI/ZpWGSG9IJUjjOhqsiUc
	 8Faozi6erNDpqQRELRbNokD/Mz2obc6D8NRaAY77rdfyR43Mvxasn2PGU1OqarJURZ
	 8ja4ycDvSb+vU0q1stCpP8t6iH3O6rQN2pSPhAPOdxYV34ER0vlnCz1LG1e3DFjaFS
	 DF5EHAHsLYGcM0/gcbj2cdCCscF8+LF90C8rpqrHen7GPGKeXk/9SPQSys6EAPQMa3
	 xnUppU20j3Zjg==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb722
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=1KwyjEPoHUs1rspk:21 a=fvG9mbSpok4_JbtLopsA:9
Feedback-ID: 4ccade618684f99169cc894b62e8e5f3:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 00/18] Squashfs: fix a lot of AI issues and AI style issues
Date: Sat,  7 Nov 2026 05:28:25 +0000
Message-ID: <20261107052843.725239-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
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
X-CMAE-Envelope: MS4xfIEOnCnnloP4b7MRiFnZ5KCLNqNWb6bEDvHwEfQOugQAzCzqzUgpokKyQOTvfH1lr6WqRhE5+yQuW8Xgs1H+QLKaaoTn2VFL2728L/Oi82ULrYs4zP+8
 1EnWRahuwPf0dqbrq4KZkJsTZeB7f28ZNfO9+kCBb/tWjGLzOaLcZ+Z5IYdWSehNWlsGw8aI8vaV9rkQKqymx7TLJHpBo5uQ8iICxfZ8SuxU0USRf86CWRsI
 uB9geusZHMHMkC5u6wAK03gAh3ACo39/w0mb8mv5Uz0PqF8qrsP15rmCJtMcYllP

This large patch-set is inspired by the recent spate of AI generated
code reports.  Two of the patches directly fix AI reported issues, and
the rest have been found manually by a read-through and testing of the
code.

In all cases (except the last three) the patches deal with over-sights
relating to variable overflow, arithmetic overflow or just lack of
sanity checking of data read from disk.  These can cause the code to
fail, and which could be used as a potential exploit.  

The last three patches fix potential excessive memory use exploits.  The
code in question was written in the early days when Squashfs filesystems
were small, but with very large filesystems it could try to allocate
memory in excess of 4 MiB, and up to 64 MiB.   

The patches can be broken down as follows:

Patches 1 - 6 are preparatory patches.  They convert old fashioned
#define macros into inline functions.  These being typed make widths and
signedness explicit, and allow additional checking to be added in later
patches.

Patches 7 - 15 fix various issues relating to variable overflow,
arithmetic overflow and add additional sanity checking to prevent these
issues from occurring.

Patches 16 - 18 remove the excessive allocation of memory by introducing
caches, which limit the maximum usage to 4 pages.

All the patches (apart from the preparatory patches) have reproducers
which show how the existing code faults can be exploited, in some cases
which can allow a Squashfs filesystem to be tampered with to make
files readable by unprivileged users.

BTW checkpatch.pl complains about the '#' lines in the BASH script
reproducers. Let me know if that will cause problems.

 fs/squashfs/block.c            |  11 +-
 fs/squashfs/cache.c            |   8 +-
 fs/squashfs/dir.c              |  20 ++-
 fs/squashfs/export.c           | 143 +++++++++++------
 fs/squashfs/file.c             |  73 ++++++---
 fs/squashfs/fragment.c         | 109 ++++++++++---
 fs/squashfs/id.c               |   9 +-
 fs/squashfs/inode.c            |  43 ++---
 fs/squashfs/namei.c            |  21 ++-
 fs/squashfs/squashfs.h         |   6 +-
 fs/squashfs/squashfs_fs.h      | 101 ------------
 fs/squashfs/squashfs_fs_i.h    |   2 +-
 fs/squashfs/squashfs_fs_sb.h   |  25 ++-
 fs/squashfs/squashfs_helpers.h | 350 +++++++++++++++++++++++++++++++++++++++++
 fs/squashfs/super.c            |  96 +++++++----
 fs/squashfs/xattr.c            |  49 ++++--
 fs/squashfs/xattr.h            |  21 ++-
 fs/squashfs/xattr_id.c         | 173 ++++++++++++++------
 18 files changed, 913 insertions(+), 347 deletions(-)

 Phillip
 ---
 Squashfs maintainer and author
