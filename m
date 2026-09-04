Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC6A438011
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520095; cv=none; b=PSU69sBiYlUUNtXwC8gRI5fKESH5nq8IttvUpjYnUeTFtUhmw7BwG/XebM86GuVOshBzT1tiWPFCMedEh+htxLomDteBaBUUkbCydwW6A9ts55Qaev8fcNxP7pG7Mhvg0LGgyvkyYm2Ht59QFyb9RM4P2IgAWGJ6qG0U6t2ZLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520095; c=relaxed/simple;
	bh=DkzE9Zhj3AmmXoslombEp/LUwxK1tb+nQOXGv18vgVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UVDu0qCPrAA8iVrcEhOcNWLNS44ctcLLf4NgmGFBfN22hLwhQCcJE5QDV9f6YLqc/BQ4Ntvw9J6UIFyCVCswvtLR5zZZbPutFkQug8bLLkwsiCQshoEeZlKvWhOq4LIerSmRwGg2p/RTk8MmWcsbGih+ccpaNy2QV68HkpsxGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXzWmZKK; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXzWmZKK"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so726098eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520093; x=1789124893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tzK12s+ScbQKSnKvOMv3ENEdIPF4yikkwENb01BXx0=;
        b=nXzWmZKKJp8oo29sise/Ig/Mq3LeoryiWE5vGs65/Pk8hGzd+jfJJ5oIxnONgSYtwh
         WSKSArJOq+QbuksKz85xipL7QgO3WaocbvT7TrMhLqRVKVspxQc4fv0YQ4FREe8Oo0Kt
         TuoVKC9Bi1miU2m4TLNdW+b9ERvSP8EckgKSH4DGotqq8aH1XyuqzXVPEPiUgUnjC876
         WCUFHizjGHa8d6Ve3p6J7Wu0uUQphq+MhjgoEB+O5z3Pvf1yfhepaT3RAfaJdDFBYhiB
         voj6LDJvWlqvx9iQksWxYzB8cERM0g2HpT1Fq85KtahZjWQNDJaSWZo+MBP+cIctT7Bq
         3fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520093; x=1789124893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tzK12s+ScbQKSnKvOMv3ENEdIPF4yikkwENb01BXx0=;
        b=RQEXzVNcHzo6yuOiR6LFWJyslcym2cJr8Ir5xeDn9+bAnfDparT2KAKoNBcs+/kZ0c
         /IKHEoHPXCllcKKBSL/Im6VUWEI1hsBdWMA8oKp8mRsYL4KwlHuJ0rEy0ceC6jr38s6y
         fHag670xx/VVaL7GKt/tJrNyCBFMrivpzRV9Y3MpWBMMXzyGk+VZdmyuDPzJTiJttKst
         EzRomtM7m0t8u7DBY0GMJ+XcTo/vTPLXoMWMDr38/UgmNVW0oVl4XDorlvvd5oe2D/4u
         3ep+4OJALT4oy1g/RVz4gR86ToWLGUm7Kuj4wiTNbb/TrLzaSDWwIsnH8MYA3bzQQZt7
         QPwA==
X-Gm-Message-State: AFuF++nJ9pSmnq1ACML9M2IxlKR8n103foFicQhQmYY9a80NrhVgtEY0
	r21XmVThw6tD4wIEahnsGnqoZHPcflGBVPkg+siMVPWT+zGcWcnjVDP9+ruEd3cn7zM=
X-Gm-Gg: AYBFou3hMnPnKjdYgHtBSODMsf4IBuzH5QFVmjBOY7gUdAvNYWDWOuvmfVhNRBzAcaE
	FSalcLLRBNi5ACBnG2H93rHfw8jVFTGdx9e3rRAwqZmMJxxB6QIys9e8BZ6G3dp51JBJxqtf8fk
	Tsz1u8BnowDTTm8GTZlFgmm//FDP+w5znnjiTdxdJwLSlCWYGPVTEnQ9J29yNTBrLKh5Lhi1vvb
	vZ0bevU4Rh3wHuwbtBGtjTgCgRtbkQY//YTPuxYsUAWitBhpIKMNx9E31HAp1pUmx8lFALoocTy
	5XmBVa5cAgKxOd8TdYPe0ee+u5Ke/0W/NauxCMQKJXta+B5w38rsn3B7G6dH7iwc/Ea7sOj/1uL
	jQWWJOQJ8p6TaZhqWO5OV2vQy3xSXgZwzpuXGtRl58lY3zFDsuDaCmSOb/MhYDd9MOdgMT+0L2Y
	nl80W8LhVvbu6JEQSgLrhbYHEdb6aVYQ0oaCjNDlScy45KFB52TSN5BhCV19ScLh17GWccsuzjt
	ffMuZ/0uExPRyI=
X-Received: by 2002:a4a:edce:0:b0:6b1:d123:f7d5 with SMTP id 006d021491bc7-6b6fcbe63bcmr3772432eaf.20.1788520092685;
        Fri, 04 Sep 2026 04:08:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5125566eec.29.2026.09.04.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:08:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH] LoongArch: fix typo "avaliable" in comment
Date: Fri,  4 Sep 2026 16:38:06 +0530
Message-ID: <20260904110807.19508-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "avaliable" to "available", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/loongarch/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/vmlinux.lds.S
index 840d944c2f73..ce097e25881f 100644
--- a/arch/loongarch/kernel/vmlinux.lds.S
+++ b/arch/loongarch/kernel/vmlinux.lds.S
@@ -23,7 +23,7 @@
 #include "image-vars.h"
 
 /*
- * Max avaliable Page Size is 64K, so we set SectionAlignment
+ * Max available Page Size is 64K, so we set SectionAlignment
  * field of EFI application to 64K.
  */
 PECOFF_FILE_ALIGN = 0x200;
-- 
2.48.1

