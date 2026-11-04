Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787811;
	b=b7NgFqsAybMgVxxFr0CkYRJBk1LOFzLVxL6DXf/VUXpJoo4veMGx+g5FjGbgX+jvTOTG
	 CWb9LvfwnnS5UrfXhyX0cBzlxJZUppW7UZ3ygaP1gop1U+D429S1/91bJ2mVyZzX17AlK
	 4yUKkDXO1qcPcphWXnL9pj6rIqAp94t9fnEEdeUP7dI/RGqZnDwN16SwuOmVOeQTr/opV
	 P4oCFdJhL3WezzBkRd73LvSnblsG0JConRplTIib9VjZ2nF53yjEf8dBGJP8XhLMP+mvz
	 ORr9Xqq8qY6HWbdcqJUbmlfmV5GpoRjqiQFFgd7oOiSYzwO3QDagQtKKzJIJYPQ+BuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=acEy7VuYeDIhb7gSnuNa7TFwjfE7RVQLbBXoX6cSqcM=;
	b=S2Je4kRmUS6JSK2piCZy6QApK6+dipxpNvIxrPAz3aKJJywEugPprM5QsiljIjOVu0a6
	 WtGpeo9EgHyf0RiGDlE0VEA7suycrJHGAMCjqtR+sOThiSt3rI3wnmzcpGgaxuKtreSqZ
	 K2edtho+F0A2/s1PYm4MTY+D5cj+fD1RnbUUSwgn6TKQYTCbpfnt3fC21S9caWSnwCNeM
	 yDye1Cv6c7obaNwqZRnzwwLaWsZstAATR3Z0qVULCM639qdVSmuoSq3yKmfzXWy8HiR7O
	 E1urtfG81wA6Ewxg2S83qoaRn/ZxIZDI5dZmcJ65hFJXWRO/NevcI5LdDF+D+Dd9Owg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=LdrZ6f43;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1F606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A1F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=LdrZ6f43
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so1045548eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793787809; x=1794392609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=acEy7VuYeDIhb7gSnuNa7TFwjfE7RVQLbBXoX6cSqcM=;
        b=LdrZ6f434Y7pAnuag7QVLGn1cgp6UhyBf7/WFkjhMLKZABuk4jyPgytBF+1kVmPDSC
         ImcfaUVx5tO9pjE3p299SNdicSSqujd+Z1GvZuEVKQ1PAsmGjl01RMaoKm8ExSsQPppq
         TnVbiDpMhbD3frbExfnOwbYYkcua4NBpKoLy73ScevVqSVLqzpYlZkVck52n0RYmACWU
         /Orgntc1CUTCo1gyizly70SgkBQ/Rc9S4B6RzOJBTlEVrsQIQOBLX53Pv02rHsIfJhq4
         JRumfJtwcdPxWFKcN5Br2oQI7ZECknnaoSEjtq8X44e3RSk2U/61DFvg0Dj7PxbGhB3+
         1q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787809; x=1794392609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acEy7VuYeDIhb7gSnuNa7TFwjfE7RVQLbBXoX6cSqcM=;
        b=gZXduMv35OJ6tY1hxdghn81yvg3ne9FU7kG8MJXK9sXzyNeQAw5Z8Ljg/gEXdXVUKD
         fNvRN2lZTIun1rX6OFTpI1iZ8ZJPJAR3wfC+ms1jdCSkmDEONOtx8yS9PywUX3K73R5t
         9x3jQOTMkTCa2nRLM2I1SknF44N2cY2ixYb1TSQOnyepxLTwGBrn2jAsDboK1cdIQGR6
         BggDpG8MSwfSXSdJBHIHkOhgJuR/FA6XHDx7TJEC4O1MMloMilyHHpObmXNV9Q5IjHED
         B3Vdf6QztW1NWku90Xc7A9dqYZfOUjKtYJwVuMn72vNo14MFkZHtjd6k1i7sScnIL+pY
         1ACQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbI/NpORGi8FEAKe7/FTu+Ias+wYuZdhTORLN/T53oicmR6T9y7KY54PNOUELdLlNDubPSAuWU7Jun0SE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8ty+dD1OMvToAKsIJ8wMHMOBA2KpAaDtXY7rRzOAemouisfXi
	+dgNxm7f2kTHdcII3yoIvFZTbOmbAPKYFj0Jci3+88GtDWYNxdRFRdHFtHW0NS8gbw==
X-Gm-Gg: AYBFou0sKBHSLT+Z91sLTeVp3suQTMSqrjHE7BxuPV23uhhbMiwosI4tyDfaour373T
	UD5/akjxD3LxFwHrc18QJvJv2cIJ0KyEIlZHItPttAzQLiPBCoOKsBFBPLiEPhFCsQdeaacKJxk
	/pSUD1L89+an7MvSm75z9mKt62wjXSazrJQov3a3nx51rRjn2+T5XX1kXQD6aaaViPUDBKSV6P/
	lxmt4GOIox4nJ7UswpSc6aDwb8NoJ4JmC4OKo5LsAMSLPCISdZm9JEA6NBRB5ANNFZMCgeIL63J
	RBLSBwAKGwoRwnUC/ldOXnMxwbIt4vHE+QdQ4ONkMGzjJn8yz67qk24eKlJrRBraGcM+UEeXETw
	7aEXT61Plxp5RJninykAev+xKN565FvLorUxhJf7mZgLa8k+D/hUb5761ngE1ANCh854BbNiojd
	upILMX69qmnYH3EYclZ9rbSK2PKFf0a+7Lw5nKNEsDo2+eWAcSAeREDmEjxZxJLV2MIzICGqL1A
	ie/NdRadSE2MniP3m3DN0fSW0UPSPzdchHC+aa0NBJHgwdj4ugj45PNu8zQHVTWBMJ+5WYSjj/Q
	secT26Zxmaxr4M5EV9Jw+KPGpLvZoYB65q3Foenwsg==
X-Received: by 2002:a05:693c:41c6:20b0:368:c6b9:d3c0 with SMTP id 5a478bee46e88-36a423cfcd3mr24401465eec.28.1793787809167;
        Wed, 04 Nov 2026 02:23:29 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:ff01:97fc:f9e5:d7e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm5749086eec.9.2026.11.04.02.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:23:28 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: dsterba@suse.com
Cc: wqu@suse.com,
	boris@bur.io,
	josef@toxicpanda.com,
	fdmanana@suse.com,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>
Subject: [PATCH 0/5] btrfs: owner refs and tree blocks
Date: Wed,  4 Nov 2026 03:23:18 -0700
Message-ID: <20261104102323.4090290-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
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

Simple quotas store the owner of a data extent in an inline owner ref.
Tree blocks never get one: their owner is in the tree block header.

Patch 1 fixes btrfs_get_extent_owner_root(), which also looks for an
owner ref on tree blocks. On a filesystem without skinny-metadata it
reads the btrfs_tree_block_info as an inline ref and warns on subvolume
deletion, snapshot writes and balance. The filesystem is valid.

Patches 2 and 3 are hardening. The tree-checker rejects refs whose type
does not match the extent type: inline refs in patch 2 (for example an
owner ref on a tree block), and keyed refs in the same leaf as their
extent item in patch 3.

Patches 4 and 5 are for btrfs-progs (devel 3737c260) and have the same
cause: a tree block without skinny-metadata is taken for data. mkfs and
btrfs check do not count such tree blocks in simple quotas, and
btrfstune --remove-simple-quota can corrupt their extent items.

Found by fuzzing. An AI tool helped with the analysis and the patches.

Tested on btrfs for-next df5b88a7914e, KASAN and non-debug kernels:
- Patch 1: no warning on subvolume deletion, snapshot writes and
  metadata balance without skinny-metadata; same qgroup numbers.
- Patches 2 and 3: crafted images with an owner ref on a tree block,
  and with a keyed tree block ref on a data extent, are refused at
  read time instead of aborting a transaction later. No valid
  filesystem was rejected: skinny and non-skinny, 4K nodes, mixed block
  groups, no quota, qgroups and simple quotas, with reflinks, snapshots,
  balance and scrub, and filesystems from btrfs-convert, mkfs --rootdir
  and btrfstune -x.
- fstests btrfs/quick, and the qgroup, balance, snapshot and subvol
  groups with -O ^skinny-metadata: no new failure.
- Patches 4 and 5: mkfs -O squota,^skinny-metadata writes the right
  qgroup counts; btrfstune --remove-simple-quota leaves the tree blocks
  intact and btrfs check is clean (before: "backpointer mismatch").

The crafted images are available on request.

Siddharth Mishra (5):
  btrfs: skip tree blocks in btrfs_get_extent_owner_root()
  btrfs: tree-checker: reject inline refs not matching the extent type
  btrfs: tree-checker: reject keyed refs not matching the extent type
  btrfs-progs: check: count non-skinny tree blocks in simple quotas
  btrfs-progs: tune: do not remove owner refs from tree blocks

 fs/btrfs/extent-tree.c  |  3 +++
 fs/btrfs/tree-checker.c | 56 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

 check/qgroup-verify.c | 5 +++--
 tune/quota.c          | 4 +++-
 2 files changed, 6 insertions(+), 3 deletions(-)


base-commit: df5b88a7914e18488908ddf13e14e31ab39f954c
-- 
2.54.0

