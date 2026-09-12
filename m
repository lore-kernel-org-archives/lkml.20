Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47B1A268
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789182271; cv=none; b=rKml2R0hdqix18rSrVbnEESEmRf/lQ5hKkmk8kh3jBpcANVawlScG0JkjiukSvEVub4oj2K6z+BG2y9oGoFbt5Qrh1M/2Pa/j8rvKGnwRn+y1O4mRMBQLvqqcg+SVzZsyDs+W6M2za+RWWdyQepv0OGu14gvxoLEuFA9F02d8+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789182271; c=relaxed/simple;
	bh=1Yw3Z4K9zhpxcw9tg9ZqBShQRhoMo/pkAo1xK/ff5ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=niiB93yKyrt//ND5Ws/QmOQ6+0snayMbo/VfHzZfd1vzIlJU4NQG94wI/qpNgHeN7+DPqordXr1CcltnseBKwlbn1DBrQuyj61V44jx80BREmjrHgMb5/Iv8Skk27RE4UB2jxVuOu1oktbuJJPtFXO+n4RfjhERsRgjL08hvaSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eP2290nX; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eP2290nX"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910399d8b09so1892386d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789182268; x=1789787068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8PXNL3BTwfgQ9sQ47ua6UOJz7+dhY/eFnsGANIW5HtE=;
        b=eP2290nX7d7UYUwwq/VJ97RIUGnVh4dihFbnKH34ka9/gTfbwqF2bGORoIprEI8B0X
         qEzOFNIf0bXJmkVOqFiujRiZx7Iv9hmIrFcw6YZHTBvQprG18Gpgi5QMudlGDflfMy8n
         tdUYWc2oAKitJSaB3tokEpt8JEkCHmA6kjBFd8E5Ne6TApOAlCUN0hfdfTObymKUOVzk
         D/W52MOy86mgLROy6Nmep7vi976zGSIgzh4kivio/GS/6Rw1BX8ZtwpaL7Zx6xdmVBL+
         MbGjvsv+UMc9DCw4PS8wrd+jNEYWN6NuHxTdmlzFggTY3sBQ4tgP69MDEip6AcDAN81C
         qnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789182268; x=1789787068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PXNL3BTwfgQ9sQ47ua6UOJz7+dhY/eFnsGANIW5HtE=;
        b=qQzEF2J2N0N9iHeI+Gph9QW/js0cJMuXGKV10fdp2NdSM7reaOeTzdfqawoWVcT4c3
         iWdDZ7scfLwDhNrpqLTdELCmJHDGeo+Cs5T1CqJooxAGEJtGjP2SAHeLr0Jxg602otSJ
         DMFYeYqkGV6jTsSAJ2RERQjgQFznDTcAZUMpZmKdYCrqSwFOT4k5QvvFwiUKM6Knx+N2
         tCq9JTPeFRBbCpw6B/GvXn/4zViYzgIedz8KiJ+tDraim440B+x6Rq4Ui8O+4ZKQijMu
         0+qDX5H71sRgsllK/FZmlWcnzmrpkCjTJvCLfMr/hA2IGcshJ/MabY0x0UNre2bhZw+l
         0xyQ==
X-Gm-Message-State: AFuF++l2TrScBIyVb5dcRcZSjdyz9VlmSEUX5qp/4Rjk9ySBRPyK1S5N
	1+X32kXXo+5z1+PT9cMiHbUNxFAphqf6yt/TditQ81dq82K1EZKEEVTBe0NRKmrOu/9N80FulHz
	+PY5c
X-Gm-Gg: AYBFou1Og/PGr3vvV4I8d5fxzefSLKRx1bxxwTPw0kr/2xEq2sBOVYjVaQcSLvtY1yU
	NqkNP9FmoeRcJGaK2ARXdnPbsPJoHpdsm1t8B9wTRruVPjAbJaASlMDakVkBJEjm3jYdh+7Bs7p
	HaX6NW3IpU6i0eDKiw35pifqiX/2vTHwnTyGXY8IR3yceQKJAa39uwmKgQzDfzZSsBaQzafv68/
	h/9j54fe0yEyidkC2dh7kvCccLhJCOcfLW7/1aQd4D7bEI0uHTcY45CBsYRc4zvb2c9CqjKI/Jz
	KeR09N/lrDWfbwRPXSwI/EOjfmB1YYTnfxr8cR3pjuHHw/IRMIUJg4zULjH4qepoQnRnVOEkDrl
	HMGhZeHAkB27ljV+oI1Nzy03xcEvVb7Q20Nwjv7jzSt08ZDdVauXraTZtx1aQiSvWQCbLkriSjO
	zbE5oPRLLqutkZgEYPjGfN8PkMrEfLesFNs/J+npKzCFPQXFoTZzPrlhouOuZwgCuDgs/SvS3DD
	5nJtBRqHwVmjEcFjDAVLXokIKQWhx2WEB8YdFJ0VonnC+ydyfuc3jzGtdzc
X-Received: by 2002:a05:6214:d8e:b0:90e:8cae:7fe9 with SMTP id 6a1803df08f44-9121da4d683mr18657526d6.24.1789182268435;
        Fri, 11 Sep 2026 20:04:28 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f202856sm36085296d6.2.2026.09.11.20.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 20:04:28 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com
Subject: [PATCH v2 0/2] mm: refactor zonelist constructors and iterators
Date: Fri, 11 Sep 2026 23:04:22 -0400
Message-ID: <20260912030424.2889731-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_next_best_node() picks the next-closest node when building a
fallback list, and hardcodes N_MEMORY as the set it picks from.

Refactor it into find_next_best_node_in(), which takes the candidate
set explicitly.

This makes the existing behaviour explicit at both mm/memory-tiers.c
call sites - they select demotion targets in fallback order from
N_MEMORY - and lets callers narrow that set.

Then extract the per-node construction loop out of build_zonelists()
into build_node_zonelist(),i parameterised on the candidate nodemask
and destination zonelist index.

Together these allow a zonelist to be built over a candidate set other
than N_MEMORY, into a zonelist other than FALLBACK, and iterated in
fallback order over a caller-defined subset.

These are prerequisites for generating a private node zonelist (nodes
unreachable by default), but are otherwise general improvements to
the existing interfaces so I'm proposing them separately.

No functional change intended - purely refactor commits.

Verified on x86_64:

  - find_next_best_node_in() compiles to the same 319 bytes as
    find_next_best_node().
  - Both mm/memory-tiers.c callers grow a single instruction - the
    added argument.
  - Boot-time fallback orders are identical on a 4-node guest with an
    asymmetric distance matrix.

Gregory Price (2):
  mm: refactor find_next_best_node to find_next_best_node_in
  mm/page_alloc: refactor build_node_zonelist() out of build_zonelists()

 mm/internal.h     |  6 ++--
 mm/memory-tiers.c |  7 +++--
 mm/page_alloc.c   | 74 +++++++++++++++++++----------------------------
 3 files changed, 38 insertions(+), 49 deletions(-)

---

v2: 
- drop extern (Vlastimil)
- move printing into build_node_zonelist() (Vlastimil)
- get rid of node_order array (Vlastimil)
- drop update_load bool (will add back when relevant)

-- 
2.55.0

