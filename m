Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A5A48033C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396802; cv=none; b=PpbriAx815PEdTYzN9RmnNxWBxa4CZGhZ0txFhDEciRrdO8/owX85A77pQ1XRbFDOCZKJxlpe5G+wTirwZrZabcgR+jBZUACikvST2QiYgjGA/V0pvXPn1QQ9vblmYD7gxdi8fGYINHx4hyxTk5sDN1ZfxR4hpD5FDYZ5qViZ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396802; c=relaxed/simple;
	bh=k5pbw3gWXkD+2lSDgyawLTDWIcAys0OeL71nHG/+9K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u9kj/7lZJo4/RsrMHGtjuChvDs+677XuaNw6Q9cwkxsHm2oKXCWC3PEmFZdb60XukjKiVBHBFStesUU+1kkkI5tTKr34fu6i7tJt3SPF1lXvTfrfVl+Iabzc14/Dy8rlZh8SMEeoG4olps31NzgQzWKkAdwtUwBQIs/ADfK2/qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4667YEZ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4667YEZ"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so2823101b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789396798; x=1790001598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7je+QGWbrv106IbpMWADgcAusdkekcf43RbJ56qmHI=;
        b=e4667YEZxcRS9doRa/bZ3tm6gfoQOg9hsnYwQfQlgc1bAHPbTID3GJEWtblQKpadSs
         ytMMOsmjDNSvr2xlYNOyRtBrHeoNAsK77VB/WNH8gaoa/NynfsrnOxE2ZkmrYnWgWI5D
         oBXgtfYqw15EtjIE+FE9I0jdbt0mkHPdDgy6TTIIhMJZrFhNz/VePPuKbJE2kdVM4HvP
         ajy62iQlY3k3DgjC0F5RWNgiHwxJA6UozoKpzP3sp7e8I9aFt/BqANvgyxbeCSxsphR6
         +V2zqvvjek6vhIX9ux4bwgkrN1dmhrBEUWrGQctlxQs4gteXOneufNRPxyfw4Y7NJN5X
         OTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396798; x=1790001598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7je+QGWbrv106IbpMWADgcAusdkekcf43RbJ56qmHI=;
        b=R0YqkfZubJyydV8Re9bbGoj9pOoDtifsHdv3uZ2+7b6rgwy6Rlho2wialOOZ0ehwWe
         nZ/rGxAw6jw0tVVVs3M7LNul5/GpSOgndJLEUCpK/h92Q0JY6xy7UbJIYfKDq9QtWsh/
         Dnbpc2PYEq3pWfmpI6lPO4KEzShIy7yC+3yRZhmPpFCR4kOZRonYaVaT7Wvgu/wTA4YJ
         kJzJJnSZgla2IUiLYUaSGPl334BFshWQO16bBupRY0s5fenTgGB0UJuN8bCYI8VFR1T5
         MiGAxU9Z2JKFzu5rBp/p79Tv+R/51vPnUp8JeGODvwgROxHubLvBJWQ/+8YSC4HGCYjZ
         yl1A==
X-Forwarded-Encrypted: i=1; AKwUvByVPW+GxcgLfVdf+taU0Q+I/Z/l/eAlGaZa9F/8zv3P/QE2ggruZC8h+qF0akla1nLLRIQX0NrCpsz2dz4=@vger.kernel.org
X-Gm-Message-State: AFuF++mMzIEK5O5SCAAmrV7mysRYYFzGe/Loe03NvrmxBl0eQoed1Yod
	gukhsiT65jGD+r7OrjL6AVfRUgNJQbctQsdkm+jWGsASg9F0334hlRBW
X-Gm-Gg: AYBFou2IWF+xukx27PSnarD47B/xhEnRt/MNvPHbMIjZ8XrgxQeDY2c7h5uskr5tecc
	qViJVMDqcAvhJLhftB5VAzrXBAItCcDn/ColEw4PhipPpRj98nbyswgcgOKyMjTR4xyTUbm1H5i
	egHksxS9vYTgjmI+iFWPV3dB8DJMTpCfGJygdK1s/HOkzSvuyVEdnqmUCFwhO96rrCStL34BQFJ
	akZM5D4e2Ko4iO7Bs2TyrAIsXMitDF1k5stQQNDPp/QE2xfyV1uShFLljKhuvbx4SI9V7jIZutH
	Wu8XX81Ajds2JwtAv0fgS1Q6s4WGzo/UPP/VbLKE4EuUoXdApiiYUXITsrEvYNp2tbPXe4yMWsF
	RZuaU/VATCigsiMIu/KZi6+2IJlu6Z4rcD1A61Kbqfh7Yh4ZTZ+9VRRKfxyOtZreQV1LHhJjt8g
	y8l8KeAJp5n00XD0e9+adr0lar5ua8ks51lFZbqLrJrLm/atI7STPykHLen4YYx4cjJ6T4Ns2TR
	X6tMzrt/0xmudJnew==
X-Received: by 2002:a05:6a21:3383:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3db40733007mr7430953637.24.1789396798408;
        Mon, 14 Sep 2026 07:39:58 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6572ecasm5149444a12.22.2026.09.14.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:39:57 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Documentation/litmus-tests: Add SRCU fastpath litmus tests
Date: Mon, 14 Sep 2026 22:39:40 +0800
Message-ID: <20260914143943.1503066-1-kunwu.chan@gmail.com>
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

Changes in v3:
- Add a critical-section write after the smp_mb() in P1 of both
  litmus tests, so the barrier properly models the lock-increment
  to critical-section ordering in __srcu_read_lock().  The smp_mb()
  was previously vacuous because P1 had no subsequent memory access.
  Suggested by Akira Yokosawa.
- Adjust indentation of the SRCU entries in litmus-tests/README.
-v2: https://lore.kernel.org/all/20260912024225.2872265-1-kunwu.chan@gmail.com/

Changes in v2:
- Use a filter for the P0 scan result, as suggested by Paul McKenney.

Tested with herd7 7.58 using linux-kernel.cfg.
 
Kunwu Chan (2):
  Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
  Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test

 Documentation/litmus-tests/README             | 21 +++++++
 .../SRCU-fastpath-anchor-before-scan.litmus   | 58 +++++++++++++++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 56 ++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

-- 
2.43.0

