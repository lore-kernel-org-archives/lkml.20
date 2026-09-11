Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FA339CD1D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119192; cv=none; b=JIEFM3Pj2/6pQFZWaAHLemKvGILR+0Mp6tug3QxfIPFzxJtp2MuhxxyTSAMqeuxin/NF4ntnuqeS/p6crSD3Jv8A0Eo/wVUpJQ37vpFIo/+tvM8qQBtl87+0D4vgEdA5W2T54SI0tlWv7JY4Q2ZhibTockxRIgNHpu0QwIw9zZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119192; c=relaxed/simple;
	bh=6rBjPK/I7X3vwpA6qZcH1Ev3QIQZLeRynwWrmlMQvbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adbhHWDlMiY1ig3VjwuJKuXCUTr4kOxtCBK+jkXNIHXmZyXF/A1qa6qHsYNNH9ZQYHn+EJaj0EA2xkFPrh7KmuEcMeTOGFikU6rOv3fcnubfRtpUS/wKOPe8NUYb7oszcn3pVGs1cqKrLmINJlT43eLdYulvLP3IIQ5V4TzLr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8NfKtpI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8NfKtpI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dd05e8b98cso6427555ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789119190; x=1789723990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAcmOIW8HA+7kl8XVa6QZ4uq4EOd1NfVDauZVHSY2CM=;
        b=W8NfKtpIfFQvUVFvc9gePhZkfBYPL0FARiFDMj3/qc/KC0nM//4jFMF3J0D7CNLVkQ
         4H+CmbxOY99XbS9PmLT3g4SpOLM960luCfToqqB6xKDGz21j84suC8IKAp/UGwmKHOmW
         Ep74BBTfpTmizrYQ5TMlYMsOK5hnqZbui8W7kr1bXrUfPv9wn5C7mnWg3EBglQjYxavR
         UjpH/k7i0hr864gic0pYySRMS0iIdy1daKSJ7NdLDfsQx61e5AzcgTWUK2xFQDKbVY+v
         tc0qh9ZoXR/s2EaXizmeHaf5acycZomJJ6vcFEAKhuEMiOqyC+AHMkzlJTGSF6XGY+ge
         eK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789119190; x=1789723990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAcmOIW8HA+7kl8XVa6QZ4uq4EOd1NfVDauZVHSY2CM=;
        b=rU2V0zy7U+KZvBytzVioGMYe7MBeX2BuF8hQhBwysfEiXLyhSz0OSA8W/HGVRVLgjs
         1we0Ca62E16XDeWco3KzElZY9XYiBcp/ot5WWqxEcmd58m2k5DDszM5Jm3x+zVxcsRxF
         E0pilfVzEpCbbFqAXfyqR39X2fEapKGv8OldyLDsl/Hx4MtxUHi6DZzP/o2WRE3wItpa
         f/rOCcPogW6KNJTDT/ZVNIlKszCKIU0WiL1JkJG4ns7d1+UOGVejB2+9BQRSUcULIB8Z
         9i/U2FTjEUvFYL3Up7Yq0BpRcq4/yUc5OMcwkScu/Y34JlFqebD+z2JQeUuFpI4sazSM
         zRpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlQPeU+DCzMFMZ5avAG+y7+sV+dV70toVakIXHrkmHfhmDqLWpmYCaTUy+kqG7mNU6ZmlwaFyCxbczW78=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ/Zh1sjj4ByuqynBp2YBbxp+rIvNZ3M/1FiKh6SJUWhH/zQrQ
	GM982+NJFRSUuLq0CtMhkDYZguSF5iYJgSR4OIBOhbd4DDg9ZEwdfTD3
X-Gm-Gg: AYBFou3bducvvIHPBqWYXrQE0v0zUb3t0+c+4eYLy7JjheUp3SqW560ZwCJgIcrVLJI
	NcYikIRxUNeSOWa3g8YpokJM8di84AZhWDv5aUHXlohI1Yr/0K6BxylbhMTo87NL/wBA2/tNBSN
	bb7bAXU1xTyV/vld9gaRz1Lyb6rdaT1919W5QXPcwy/t7+6Alj+UzjB9x1MBG5bcXbUM7iJ0zOX
	XEqL7MhVc0G6+708r/G5J47QFxOAHgKvePYg4O9eV/89pKDEbw7HlNv0rB39ghskvXJ+cchqTNw
	lbyD9Kc7XoU+meTzs4dejL3O3uxFozgfbGxU8dPUmpZTr2yl6Iq4Wuamotpk7WEd1D3JIaNH/lN
	xYjj8zCoZIAsRD8aI6NvJJ+E62V9nBx7jKxJSQ2rI98NQqZ8F0BZhct3ZgBOCkJwM/lXgIs+dG3
	atDDFJ0GfaE3ZL4kAqHzZAOklYlAXGIHWxtw8aCAhTHWgoxhVjgj4PPCPg/1dJPXO/Fkwp6tCCJ
	jS1
X-Received: by 2002:a17:902:ce0f:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2dd2a332876mr79572945ad.14.1789119189892;
        Fri, 11 Sep 2026 02:33:09 -0700 (PDT)
Received: from celestia ([2402:1980:885b:4183:b098:c1b9:7033:be8a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcefb6sm8530975ad.56.2026.09.11.02.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:33:09 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: 
Cc: Liew Rui Yan <aethernet65535@gmail.com>,
	SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Docs/mm/damon/design: fix typos in temporal auto-tuning algorithm section
Date: Fri, 11 Sep 2026 17:32:58 +0800
Message-ID: <20260911093314.156875-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct incorrect references of "quota" to "goal" in the temporal
auto-tuning algorithm description and fix the square bracket formatting.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 Documentation/mm/damon/design.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index aac84de261aa..9e027d56258c 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -693,8 +693,8 @@ There are two such tuning algorithms that users can select as they need.
   This is the default selection.  If unsure, use this.
 - ``temporal``: More straightforward algorithm.  Tries to achieve the goal as
   fast as possible, using maximum allowed quota, but only for a temporal short
-  time.  When the quota is under-achieved, this algorithm keeps tuning quota to
-  a maximum allowed one.  Once the quota is [over]-achieved, this sets the
+  time.  When the goal is under-achieved, this algorithm keeps tuning quota to
+  a maximum allowed one.  Once the goal is [over-]achieved, this sets the
   quota zero.  Useful for deterministic control required environments.
 
 The goal can be specified with five parameters, namely ``target_metric``,
-- 
2.55.0

