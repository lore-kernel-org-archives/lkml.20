Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6AA2F3632
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180967; cv=none; b=avTxdkoZ7O5ldpXleQ/TYMTB5DK9rTBOrCUhqo1SIvZE1H7sB4jHhA2lf5Xd5VejhrN1CU0edZ9/0UyfJBZwOw+OpMrLK34vCeMJ/CKLwAIzk2GPDA41xR3AQobyxt+2DlOhq0nJq6rvkwhqdaFmlll70ZVp01XCqawvCIFzYH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180967; c=relaxed/simple;
	bh=9f7h9PLAGNr5QREiP4rXwCLceZZ+OvQlKMgj7JBEccA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VeSuuB8+tIsuQfZJH9hsEi3cEK6YBjPcrofACAnslB9dkBhIGl55Lkbuzk6dKiZnrhOEh31Y+Ts7KEOaNRCTGW77N4yFFaLzBCoiaYGN4of4MroDeRX5bJ5DT8Wy5tX05nkHvdOAChAOdYNz1JT/0a9T73+o2bgMfEic+QyZ8ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PklKXUbH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PklKXUbH"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb5so160201a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789180966; x=1789785766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsxAOkX7Z0gktBYPmfGgeg8Ie2GzO8n+hdt9t2tFXNY=;
        b=PklKXUbHrl0mESqR6cCz+z1uSVCL/gU9evRoA+t0HTJ5g2+6IN+gQk6SRzR51PcG84
         4002eTU4pfv3+VCXOFlDjL7Lhu23TUl5pjvlrWc4IzDelmIA+KCiZSI+sZv3udFhC5bZ
         64W7dC9js1bAqW5Q5Trfg6lsqco8XFiofhwDGEp9FYHBdz/3mJ5BPY1eGfJHgdr6JBds
         YBWoVrAdFpAOgcK322tiy7YDkP40ncS9Wjvgd15OHI4TkDoVzOkHfETd1zBIcSl1bDa8
         tYfcfV5bUiDXBG9scdFCWHimShA3Z65iTE/6GK5r1awOxvDDsZ0P3Qk9gHkdlftd2R0K
         RUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789180966; x=1789785766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsxAOkX7Z0gktBYPmfGgeg8Ie2GzO8n+hdt9t2tFXNY=;
        b=YTnlzSvRuxVKHxH2Xmy/93HI65i4JWlxHgx0IC/JlfMrqQJi0HgNSMaOth04LA4pRg
         Eq7c4UU1HEwuuYzBLe/urTLcag/aJTtKgSlD/mb5wn54r4Nu/PaKB8J9L1aIUKbCvYoS
         926yalUnJ1Qon/jwrvO9xFI9M/n9adUQvePCkeZuFEsarVvveeT8YeTVYbCqku2Rdb5l
         HfrOi3PxiP01+eECD12WJRmAYgwkWOct+N5vMub+dFs2M5d8qsrtj49Vgyrg29C1pk1d
         7RIHHbGmMtt0kuhizTeYbI+RWJviXDHPGpCpbft1ZBYxgZU5eMPEKqrw7pFwLOV5fL+8
         YCqQ==
X-Forwarded-Encrypted: i=1; AKwUvByH/Ukr9pQG533OM3U92+YJMuIP3I6yNov7M3zLrgBj3RJi5wxoW+bw+y22JVkng0gP9pdKJ5E71MrAh+M=@vger.kernel.org
X-Gm-Message-State: AFuF++nvd9I96Eowsup3OfAeFnW6a8IPOx7BIsMBvs4RGXIbUedH3qZy
	UV2Tz9imjbSEq4tApGuBmESk9xavCPbg332HSl18B0UAzDeeMvgSq8GA
X-Gm-Gg: AYBFou1XVmbq40Hj2DTGS9CKl3LoEK964vjGoFA/PO/aPoZb2pCuaLnLT4CVwwJ9xb/
	zlHA3NmuPuh+bwQRwsQWvZ0brqWIPYrL+1/7y6due0TYgcKXPKybvCvX7iSqEHVjWKcdtm/GZZw
	AmtYWjGFIIagxA6Me+EeCl9Vm7CMlrBSg8/ctTeJkkbxOKIvdxZlZ1djoOOXi5twwl3X43G1y64
	N144RY3/5Me589OlB9dgzqeiDPhs2Gz1x0+4skoiPNaFxqnm6CrutisTXylXN58Hi8Ocio87usB
	jG6WqzycIwQnSyFKNIaqkJ7mObXZaHybE78TCG1ByWeCefvNJD1yoE4KDebcqu4Z/D9hinsZzE7
	nj/URs3QR6AwizWjYaZ1/PLY6lD4tLdv7LYdfKOtqSj+Ggz40jDBmQ3ZgO01z59sis/6c9VCNMC
	mZxZDq5at8ijYdIbB7euAZ2q1TYLEOH/fzTR2TUxj/OTk/m0AACYyTTBEusz5COHFPeI/shSuLQ
	GB7q2UcveWB02SMDQ==
X-Received: by 2002:a17:90b:2588:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39dbbe87b09mr1694147a91.2.1789180965146;
        Fri, 11 Sep 2026 19:42:45 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d950913a6sm7879099a91.6.2026.09.11.19.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 19:42:44 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	corbet@lwn.net,
	akiyks@gmail.com,
	luc.maranget@inria.fr,
	j.alglave@ucl.ac.uk,
	dhowells@redhat.com,
	npiggin@gmail.com,
	boqun@kernel.org,
	peterz@infradead.org,
	will@kernel.org,
	parri.andrea@gmail.com,
	stern@rowland.harvard.edu
Cc: linux-doc@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v2 0/2] Documentation/litmus-tests: Add SRCU fastpath litmus tests
Date: Sat, 12 Sep 2026 10:42:23 +0800
Message-ID: <20260912024225.2872265-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the SRCU fastpath litmus tests from
tools/memory-model/litmus-tests/ to Documentation/litmus-tests/srcu/,
as suggested by Paul McKenney.

This series splits the two litmus-test patches from the earlier
[PATCH 00/13] srcu: Round out atomic SRCU support series:
https://lore.kernel.org/rcu/20260907075829.2073224-1-kunwu.chan@linux.dev/

The two tests verify the memory ordering required by the reader-free
synchronize_srcu_atomic() fastpath: the grace-period anchor must be
ordered before the per-CPU lock-counter scan.

Patch 1 verifies that the anchor-before-scan ordering forbids a reader
from being missed by the scan, while patch 2 shows that reversing the
ordering permits the problematic outcome.

Changes in v2:
- Use a filter for the P0 scan result, as suggested by Paul McKenney.

Tested with herd7 7.58 using linux-kernel.cfg.

Kunwu Chan (2):
  Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
  Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test

 Documentation/litmus-tests/README             | 21 +++++++
 .../SRCU-fastpath-anchor-before-scan.litmus   | 57 +++++++++++++++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 54 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

-- 
2.43.0

