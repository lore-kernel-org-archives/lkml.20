Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757223;
	b=yYDLxsr255UDJkY0xXEDCKemSglsTTCc45D4uEY1hMv71581V2653+zdyFw+XYqOGGyH
	 vXMLH74zwZvBw4fcpHFhjK4MQ/gxSj6u/Wjnyb5T0mpyYjUcSp/n9k0qPE+QpSkb1DrVE
	 X9bOBDSPlfa8427J4rMD04HI6wqgVUlNEjZv5pAvwSvFdX4QdmOQKT7oGTTsQjCpCMmNc
	 hvBja+WYF7sPfpESlCKpR3X3FNrK78Mtx6NZIkpOAcrXeTqk8MpgnFGyABFjV605NwkE9
	 0RFkc2zu0eFUTaiBkfnzGE9PyMl8CKS1MxLxg2v5DpPAaHp7eqoMHUQ1yVPCaylzwuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TRu6zBCgUTdVoLcTgcV1Q05kOpKndyRZJV5KXfV3RlY=;
	b=nW4g2RlTJFO/hGgYbyC25zKzhwCi2D/9UNWW2/euERI2IXjtmlbOtXd27KCo8ZdfgZlJ
	 SA+wq9UllFN7C/em2cTLeBi+Bk0OfwdmfjlOniCW7E2vgTNvfvXNF9naZMZYuSE3/gg6/
	 Uap+TvbKHWiK5KwAnquYQh2deB4dIenhSIwOxgxeejWe7dnJwanQ4Jo5VSQk6NNlT3HRi
	 EnNBUidtSa5EmIsLkxFFjxcLaaxlRkMW26mnDhLRT/nlq44yoBXkX+aqC8HnGKaHrpVm4
	 CN5+WnF+S99/Lz3E2fWBYFm+Obg/5DzBu39SPQibmJeTUxeK8J2+xBMTjj5q3onVmJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XD97NPfO;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75868606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75868606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XD97NPfO
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48ff6bd58b8so226398f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794757221; x=1795362021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TRu6zBCgUTdVoLcTgcV1Q05kOpKndyRZJV5KXfV3RlY=;
        b=XD97NPfO73DrLqkeYK5Ho9u70nn7l4H2NIte6A7HwtHzYq6pkJW4LQw3Vemf47Y2YU
         I0kAjMMFw5XDPOCTWJHyFJlhtdsmjrW4vZeDF1rD+/tf9+Obuu0bn1FEN52y3EVIP7OV
         L7Ve09XoBBFUMlJcMOh3TstMOHUKAd4Hn/uh+AJYgmQT/NfbE2NopEazHXv+1In6ScYw
         TWc4AY2sP2QQTiBxEiKrNFzQNLqWHnsq1Ll2z6SWUh9iPBvyg1fg/o4m3fq7xM2ulKHt
         bCc90E5nFCZkWig3NQLsjRWsKj2JkFd3RURt3uCXf6TkC0lmJrgZsLHzM8c88OGw2PTD
         o5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757221; x=1795362021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRu6zBCgUTdVoLcTgcV1Q05kOpKndyRZJV5KXfV3RlY=;
        b=gk0bcPGkHzFo/v8m0ykyPG16G7UkQYcCPx71Ygbza3gRQCzbGTX72mrZqQLxa733sM
         ieRhUYNnTAVa5/Sw3gP9zr+uSBl6rStio7ISDopakcrU+1UKReADW2wNqGcf32KBkIWX
         uifXdl07min4iyOaSMvXOuFqJt39yrigI19o7gOYg9h0WZ0DR1dlAJutZXDeQmXpVS+S
         +kqccDXwCHqLNZ2I5TSqKuO3UEFR0G2heq21TeoPkdgxW21s2WHCTLo7yrKuEmJHtZ4U
         bG0FQhA+AVWLKeA553+UWKrkKBRddXMmbVlU3HlnogaPKn1Kz8L7JrRVU9s1sbVkpILC
         HzMQ==
X-Forwarded-Encrypted: i=1; AL+hErFfzEGzRgut/mf1bUfq/OUErOoc18A/6wV3RSKF9zFH4yZLHDkFSDE3jucXKAVTyrhS1D31cl8N+oS6bso=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OQEhH6yqhjMfelOjWLWigqErySjWpfgjCkKSA0Ar79rxNJQRO
	xM+AtxzSANYMNkLM3I4Rhg5553Wg1g9+dKqsSigIp8Q6q221PifvGf/uvhiCJE/xCORLGFqiZqK
	5F2Vl5vE=
X-Gm-Gg: AYBFou3+/qZlIEo4DpZEhvICQQs33IRY/O7ZDuIwJDmpQaOBxvQSrs+yQCRrThpPbvw
	QW626YgjgpFdSDWPD/Th7BsLHRv3WRiKAKaQ4o4nACBa/tsNPQ/thp8r1BIayLhAWJdjTjG0V7Y
	NvrvJ+Xd6AyqdjQ9hLWE9hfUW1+QHqgRF+wKu2rwpvhuv9RuERKD/7Wa/1Q6hTZWVkBkGH59J29
	/TJnGmg2a1bqIHEjECYdZbf0bE0qJf3gRDSLi200HiYfvcY2dqkUOC6KQU0ToLOcAHmJBJjgbl3
	z4u1wKDapUnrQ0F6hCgjjq3ID0qKh2WaNgAlIcc5IHdEQO8Qd3QQBs2lPYXjFaIDAuAuP7RPp9r
	tLdZJ85s6jIbnimTK9VmUHITc2buldzMw/qxSkEWLblMjWqarrGheRuqnOHuvLJi27TWImBWqVa
	eRx86OrGLAUlnWEk2Hk2bcipvQwPRrEIEvxXkVvnkkOOBMuaW85UKJqbFGCswFv3rmAGxhuSrpJ
	K8TBNbzE8mEVXom8jWMVQQlhiAq2U1R9e8t8iAcwWsFWm0L39GuJ+7duNja/eg8SZn4XaPaSsNG
	WytKCXKbz5OoHb6rZa1EEMY+g0PxqYBhvpUHkcz6HKR/
X-Received: by 2002:a05:600c:a116:b0:4bb:6c01:de9c with SMTP id 5b1f17b1804b1-4bb6c01e231mr27925495e9.2.1794757220765;
        Sun, 15 Nov 2026 07:40:20 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm25648733eec.12.2026.11.15.07.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:40:19 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v6 0/3] migrate ocfs2 DIO from buffer_head to iomap
Date: Sun, 15 Nov 2026 23:40:08 +0800
Message-ID: <20261115154013.9379-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
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

This patch set migrates ocfs2 Direct I/O (DIO) from buffer_head mode
to iomap mode. And the code base is commit 6628e7d4c6b2 (v7.4-rc1),
and also merge Joseph's code and ideas from [1]:

V5 changelog:

- Support allocating multiple clusters at once in iomap_begin.

- Use iocb as a token to detect the unwritten extent list between
  iomap_begin and end_io.

- Squash patch [3/4] and [4/4] from v5 into a single patch
  (since v5 patch [4/4] consists mostly of code deletions).

[1]:
https://gitee.com/anolis/storage-cloud-kernel/commit/ea3fe75e2060118ba093e90b1cd34fa382914b29

[2]:
https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com

v1 patch set:
https://lore.kernel.org/ocfs2-devel/20260724052559.15409-1-heming.zhao@suse.com/
v2 patch set:
https://lore.kernel.org/ocfs2-devel/20260727061802.18485-1-heming.zhao@suse.com/
v3 patch set:
https://lore.kernel.org/ocfs2-devel/20261018143319.22329-1-heming.zhao@suse.com/
v3 sashiko review:
https://sashiko.dev/#/patchset/20261018143319.22329-1-heming.zhao%40suse.com
v4 patch set:
https://lore.kernel.org/ocfs2-devel/20261103135605.22943-1-heming.zhao@suse.com/
v4 sashiko review:
https://sashiko.dev/#/patchset/20261103135605.22943-1-heming.zhao%40suse.com
v5 patch set:
https://lore.kernel.org/ocfs2-devel/20261105071930.16399-1-heming.zhao@suse.com/
v5 sashiko review:
https://sashiko.dev/#/patchset/20261105071930.16399-1-heming.zhao%40suse.com


--------------
# test report

This patch set has been tested on 7.4-rc1 kernel with the following test cases.

## ltp

runltp -f dio -d /mnt/ocfs2/

The failure test results:
(These failures are all minor issues. I'd like to check Sashiko's review
comments first before fixing them.)

diotest4    3  TFAIL  :  diotest4.c:112: read allows odd count. returns 1: Success
diotest4    4  TFAIL  :  diotest4.c:127: write allows odd count.returns 1: Success
diotest4    5  TFAIL  :  diotest4.c:179: Odd count of read and write

diotest4   16  TFAIL  :  diotest4.c:112: read allows  nonaligned buf. returns 4096: Success
diotest4   17  TFAIL  :  diotest4.c:127: write allows  nonaligned buf.returns 4096: Success
diotest4   18  TFAIL  :  diotest4.c:179: read, write with non-aligned buffer

## xfstests

./check -g quick -T -b -s ocfs2 -e generic/081 \
-e generic/266 -e generic/272 -e generic/281 \
-e generic/338 -e generic/347 -e generic/361 \
-e generic/628 -e generic/629 -e generic/648 -e generic/650 


OCFS2_MKFS_LOCAL_OPT="-b 2K -C 4K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/091 generic/094 generic/177
generic/211 generic/225 generic/263 generic/321 generic/322 generic/329
generic/331 generic/370 generic/376 generic/410 generic/424 generic/448
generic/467 generic/477 generic/481 generic/498 generic/510 generic/512
generic/513 generic/534 generic/537 generic/552 generic/557 generic/563
generic/578 generic/588 generic/607 generic/620 generic/630 generic/755
generic/760 generic/771 generic/777 generic/779 generic/784
Failed 40 of 632 tests

OCFS2_MKFS_LOCAL_OPT="-b 4K -C 4K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/177 generic/211 generic/321
generic/322 generic/329 generic/331 generic/370 generic/376 generic/420
generic/424 generic/448 generic/467 generic/477 generic/481 generic/498
generic/510 generic/512 generic/513 generic/534 generic/537 generic/552
generic/557 generic/563 generic/578 generic/588 generic/607 generic/620
generic/630 generic/755 generic/771 generic/777 generic/779 generic/784
Failed 35 of 632 tests

OCFS2_MKFS_LOCAL_OPT="-b 2K -C 8K --fs-features=local --fs-feature-level=max-features"
Failures: generic/003 generic/056 generic/070 generic/075 generic/076
generic/091 generic/094 generic/112 generic/177 generic/211 generic/225
generic/263 generic/319 generic/321 generic/322 generic/329 generic/331
generic/370 generic/376 generic/409 generic/410 generic/424 generic/448
generic/467 generic/477 generic/481 generic/498 generic/510 generic/512
generic/513 generic/534 generic/537 generic/552 generic/557 generic/563
generic/564 generic/578 generic/588 generic/607 generic/620 generic/630
generic/755 generic/759 generic/760 generic/771 generic/777 generic/779
generic/784 ocfs2/001     
Failed 49 of 632 tests

## fio on single node

The test results are similar to v5.

---------------------
Heming Zhao (3):
  ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
  ocfs2: switch DIO read path from buffer_head to iomap
  ocfs2: switch dio write path from buffer_head to iomap

 fs/ocfs2/Kconfig |    2 +-
 fs/ocfs2/aops.c  | 1532 +++++++++++++++++++++++++++++++++++-----------
 fs/ocfs2/aops.h  |   41 +-
 fs/ocfs2/file.c  |  220 ++++++-
 fs/ocfs2/mmap.c  |    2 +-
 fs/ocfs2/ocfs2.h |   25 +-
 6 files changed, 1404 insertions(+), 418 deletions(-)

-- 
2.55.0

