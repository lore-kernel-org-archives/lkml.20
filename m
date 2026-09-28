Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D849C4AD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592294; cv=none; b=KGPLVC0UdDFq62iP1kKVyMU9aVF0ezWruNUT8z5qSlQWTwhB4lfKx7kMx0+Fn6NU/ZYksDlXHKPnLow/ITdvbcvw+zbMbpqFVnbzq1htpXAy5tXWB2iMZzk36/zYCUsTzm6b0An6MeupHJmfunjSAUnZ41QoyiU2bA84HHcDkto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592294; c=relaxed/simple;
	bh=t/g5ZNwwhR38vsnl+hAwOcP2jYgk7UUiMML0bMIpldU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aR1Wm9ZRYPqgHv9p7KsJZrj/ejcsbEMZTXXf/CTPieZF9xc5vlpEKjbjui9uxmCfFGUdRf44bkv/NAcT86CDY+mKQ7R1V2KJ6+xx2VcE+HrZuTLwTH26vW28MQap29aAfqd5s7Rwc5gBwDkO8joZOCnt8OGCVtd15MzzJrQLjVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mun5xPKH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mun5xPKH"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1848684a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790592291; x=1791197091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w3u++Y/y+jB+aifVfMts5mY66Lv7aHX/LkoLWAAVmgQ=;
        b=Mun5xPKH0E8MhDjEg7d7AFMEaX8+7fvu3WEEo0Fq0PUNECLPPfnrF/5cm7CaDPYeQX
         t8KXuiIQFhVjvmIDepe8oXDQ2HPnds3+KOGKFRF/XQ8JoetGHc1U6ukIbQxoG/f1/86d
         QvctANPfDGa5/gw8QDjJv2shhJcS90KkDliHCgn+ubMSe3HAXEypNIw+5BroVmDMOgTL
         HRaHr858dA2YwDbJNgUvpbzTRU2Jd0ovf870L6pfRnsFRusGO4WBdysAzwyZxzrH+ecZ
         vDdk7T77WY43h10LAxMoO7SugeI6XJpyNiWP5e7pnwp4Toog90LBVTfX7YczzrwSmylb
         2DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592291; x=1791197091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w3u++Y/y+jB+aifVfMts5mY66Lv7aHX/LkoLWAAVmgQ=;
        b=g+FU9Dis8Ii+Itb8+3IdvISViBN5aTyLNBHky5ZXNLRf5+FAvNEA6REMsWXKz+/2BR
         tezBwcg6BnFuMm5f8okMqrrKZDyy+r/TmUr+0aTxGTi8ZsHljXtjR1rEk0zj1SQe3P8c
         8CCNxVCXK8kTjkDhzHFS4eUx1N4dopGPVmHuSY38fuze/+G+W7tCminUmTVo5t1NW2dj
         7an+sVG9GF3IegNEZ+/nwW2ups4a9R3PkSBvh8rF3hRGcqjfQU1O3WbUE4xfo4E7p6an
         harWAf+yg9QZccUYjgjfo+Avs7dogoDlNH16ABGFOMPfKg7FnSM7BHEFodbqhArlVM+E
         6HoA==
X-Forwarded-Encrypted: i=1; AKwUvBz934Ip3TJV6DH1tSX0uta9Eso4RWNNcm5HyfGl4n5gZhXiR5Etnoneiz2s9h5itoKQGFMYA9CoCCdMOIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhPNjAmoT0j3abjqBCR1pMXXVZDEO79rVWAxwGewjXbAvnlQKQ
	mbQ6M7x7IEKl/zZxwY/NkzuLc9wevD3/bNK9Uv6bsdxImIQKgW3Qkthy
X-Gm-Gg: AYBFou0FukQdL083kX0vIQll3m/MACfJP1bZGz/eox2epIL2WXbP42gvPXZaEFHGQNC
	XTOIIYM0IvmRQfP+DQkWKYTtd6Ps0oz/UGBc2MDNTg1ojcuI0xHl9SEvDVPzFB6HoYrQSo2b9Ne
	sjC2H/V0rIvYdh6bls4k50P8G/lWHk1KKfNl4Lyncc3gYsdUEZKqPY1rPO2OmLCi/PGJELcUgUx
	ibKaC0BlkrwQCNf6hOk6SnXEk7bLt2NLPVK44kOHYVQR8QVlmPXMNiU726cDHvV97Fy69QvPo1z
	PUwaNNTdyqUI3LAikdea3uo5V9v59b3v4lYV6ycmIz5NJlpfZFqsbfnesxf8lCTx2GlEfKYAK4b
	C9ghthlI+8Sp6ifpy4TqD6riN8fsS6EJIoIAAQxi+TB+tc2RBRiiUJ+rjd6RFOasUjbKw740uPd
	7op3danDqjSzD/X/iXxBFBkgXuBGG/KHB3tp9ORNkVHfd7SBjRWH/O60wMjNVp8D6Ae6iY+KRkS
	nz83BZenwbQZZlNzm8qCsxNdh3ALchRN4uIUymBjSpL3UMuSS2uye+wSaUjlJxjF9YIG/A=
X-Received: by 2002:a17:90b:224e:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3a0cbe2a16cmr6640422a91.63.1790592291593;
        Mon, 28 Sep 2026 03:44:51 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm27071975a91.12.2026.09.28.03.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:44:50 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 0/6] powerpc/mm: Enable clang context analysis
Date: Mon, 28 Sep 2026 16:14:30 +0530
Message-Id: <cover.1790590014.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lock acquire and release checking used to be done with Sparse. That support was
removed [1] and replaced with Clang context analysis [2].

Note that enabling this caught a real locking rcu bug in arch/powerpc/mm
(Patch-1). Note, more invasive checkers to check what each lock protects
is deferred for later enablement.

This is based on top of previous powerpc/powernv,pseries Clang context analysis
enablement series [3].

The series was build tested with LLVM/Clang 23.x

[1] 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse support")
[2] 3269701cb256 ("compiler-context-analysis: Add infrastructure for Context Analysis with Clang")
[3]: https://lore.kernel.org/linuxppc-dev/cover.1790517984.git.ritesh.list@gmail.com/

Ritesh Harjani (IBM) (6):
  powerpc/mm/book3s64: unlock RCU before returning from mm_iommu_is_devmem()
  powerpc/mm/book3s64: Rework tlbie() to remove conditional locking
  powerpc/mm/book3s64: Rework native_flush_hash_range() to remove conditional locking
  powerpc/mm/book3s64: Annotate the subpage-protection PTE lock
  powerpc/mm: Rework nohash TLB broadcast locking
  powerpc/mm: Enable context analysis

 arch/powerpc/mm/Makefile                |   2 +
 arch/powerpc/mm/book3s32/Makefile       |   2 +
 arch/powerpc/mm/book3s64/Makefile       |   2 +
 arch/powerpc/mm/book3s64/hash_native.c  | 122 +++++++++++++++---------
 arch/powerpc/mm/book3s64/iommu_api.c    |   6 +-
 arch/powerpc/mm/book3s64/subpage_prot.c |   2 +
 arch/powerpc/mm/nohash/Makefile         |   2 +
 arch/powerpc/mm/nohash/mmu_context.c    |   1 +
 arch/powerpc/mm/nohash/tlb.c            |   8 +-
 9 files changed, 98 insertions(+), 49 deletions(-)

--
2.39.5

