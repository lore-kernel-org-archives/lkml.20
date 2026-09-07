Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665AA400996
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762887; cv=none; b=RUBkp1fOuUCjplcX4j/Zv+oVgrC01o9RyzwjKmnFFTgUh6SQmV+KQnmShM7NmRMEZ/1W86IbjBRwXtBKm8UeIePPCfwSW5C4TDRJu3lxWY2JrkJi8cCRgMyIcoLfEcLTW3QgdICmHlxO7fRvZ+jPozIK+O2FDhcdzQjiGP6XEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762887; c=relaxed/simple;
	bh=Ql863CIdFrhai+9amEdxgVMwOZcomyaSzXXOF3BjFUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnPQPsqDibVap0XyzJqpIFBgaAgyrDbJLkcDdNNxXTYJcpN/0MDYh8G+AQLO/Bz5uw9NzonsA1/SCQpQS6dGCTU14NI/+HEFVx6EETdlIUz3zQYEXNvPr1OtUIdwezBgHKhPLXyyHbRs5oX5/9V3QVe0dnmFtUTyy0WEh01Cqag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBcWs4xO; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBcWs4xO"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so1915999a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762886; x=1789367686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGXRzybwUI7C7o2runxizvTUVf4fxrOoRZ8hpY+ozB4=;
        b=oBcWs4xOR3fvKt5fcsgGLMkrvNPTWGRRG3IaF7V0tw7KJuHbho+2xlL76jLqrFIbnG
         Oad3iYR6rDv9r2/JUj8VMLxFg0Ej/W6v8V4vB+PsEvk7NMweMhm5F6yzsgShecfxUIKJ
         c0HdOw8KnmeLx14MBU4rP1YFzCNWklUGbRkAKuChw4wU/b/9hdaeJIzDdE8Yb5OKBFd4
         A5CEh9v1Z0kslVowmkKEKWA+D39y4oZKdL6PmMc/dMShPoJzhcHv60WQWgN8pqgwyZ8G
         rvka1AyRkP9l117FrVhl9Sf7uuynwhE4dG/S2fQa9l59G5exgS2XhUJPQT1dK3jcECnF
         78+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762886; x=1789367686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGXRzybwUI7C7o2runxizvTUVf4fxrOoRZ8hpY+ozB4=;
        b=SuXKwZ0WmEHl59huViDfSVBzazjfba2NEp9iEveLBXXGNSCnFrEC4AIN53DTeRRNrx
         dawIe5DZ002b0uM3Pe72cDZHYdrZjpzlP4oz0ziD9cwVYGAyg7EF3cYHk1V3Cg4Qt501
         cmCe9WamL63R+WVmKUqFz4escXc7x0hsZHYGKiNfiPPN4EZystNiZqZVXQQoJEeQeuAY
         Ghitm0S0tDD0K+NfnPaH9Lbiu07yJEHig9HzgpspTQ6iJ7kUzV2tesBdpx/8NB/qML3D
         lyTOj1LJa1jvGKoXFhTVqFcvepxq6gD4+8shAfQPCgt09fvB5IpFOnZlimuEL7v0sdsH
         Ytsg==
X-Forwarded-Encrypted: i=1; AKwUvBx8DCKX/j7HRHje/IGVg1fuYF4/1GTgGgiQq68E/oxnerYaP+e7AVLK0TBq5ezxdaGBy3+G3X3ZzBLBJ14=@vger.kernel.org
X-Gm-Message-State: AFuF++mOoI913mfsqWJWXHwnZEuowb07rzS/cxZFIgRdMIwEC7iM8u7F
	rDmka+0DUbpnfyNmr15s1prYY8mM4XpKlwFIS0alW0VFJ4MarTJkFcc1
X-Gm-Gg: AYBFou1gTRrIgwoC9wYhr1BO872dZBIGbyFb0xw4QY1daEr1siEpklEU3hpz4/UCpK9
	HhyfXIYy7qxitwYyIL4pub1VLi7bfqqfU129b43M2+rXXIf4re+aZaHugK04RzcDSPt29N6gwB7
	ccSjs5h/RrRamCj3RQazVxeEcCIzmwafcqsb6pbJUJ8FPg6e7z+Ju57WLVZ0CAzvIKi03ir3085
	M17T0TFwM4u7NSa4m1cgNE5iN4xAVwOrvL4MA3yQGUlSddPmLXaa8R2x4CXQv8o593ndxyGR9U9
	NmB3c7bMFFysK64k9l0hztLJhQnigTsGClVN3R0qXAlJP3IPSreWcKo1d+YZtZ3MLpJfQz5XEVE
	F/3kQBNc8u9jv6g7ywJkI9MsgEjEki/GH3TYGYTehOqZai1czM0Fze8NOUhgpii+83XaOAkKryM
	98VXg12nHn+Qt/g4ugxM6qgwV0v8HCsqniEZtKmoSPIgIQk0B/k1WbXPMwDiHeeRWbQSt0ziMe5
	A49QDNYGNjDa5I=
X-Received: by 2002:a17:90b:5243:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39b2614df1emr33143914a91.5.1788762885565;
        Sun, 06 Sep 2026 23:34:45 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm27634416c88.15.2026.09.06.23.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Ira Weiny <iweiny@kernel.org>
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] tools/testing: fix repeated word 'from' in comment
Date: Mon,  7 Sep 2026 12:04:34 +0530
Message-ID: <20260907063434.23060-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907063434.23060-1-hemanth.selam@gmail.com>
References: <20260907063434.23060-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'from', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/nvdimm/test/nfit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/nvdimm/test/nfit.c b/tools/testing/nvdimm/test/nfit.c
index 009fe107b0d7..b1802456fbc4 100644
--- a/tools/testing/nvdimm/test/nfit.c
+++ b/tools/testing/nvdimm/test/nfit.c
@@ -59,7 +59,7 @@
  * *) The first portion of dimm0 and dimm1 are interleaved as REGION0.
  *    A single PMEM namespace "pm0.0" is created using half of the
  *    REGION0 SPA-range.  REGION0 spans dimm0 and dimm1.  PMEM namespace
- *    allocate from from the bottom of a region.  The unallocated
+ *    allocate from the bottom of a region.  The unallocated
  *    portion of REGION0 aliases with REGION2 and REGION3.  That
  *    unallacted capacity is reclaimed as BLK namespaces ("blk2.0" and
  *    "blk3.0") starting at the base of each DIMM to offset (a) in those
-- 
2.48.1

