Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416B2485CE7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525722; cv=none; b=pXw+Ysztc7JXdsEXUZd6+v9hAEM8oeyz6q7I9+1OnM5ADRNwCjktt4GeVateKYrz+nNDMo2UJ+6l3RJfUh40aUMEpAoo5fOp6jj/lLJlDldXB7WNQM3gt1SDuYS3M0JuXSfkYO28Tlkl6qV0E8cskuQBX/30yRxTJch92aPdv48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525722; c=relaxed/simple;
	bh=N68ULOzl2X3etv7/NhTPSrTICdQP3C1PYJ1+iDStQJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WW/IOdWTfqSlEIgtfUJWwBmUIoXik8trf4OHZB0qMxrJLG3JPsOI1wlBdRyDxMi29onrv9yEKxPEdNixCrpnbpCnbySWvSXfdouTLDjwS/DRuUjq4GDSbG1d6FSAiUkIBVdFjF1KaspcZxjdJroKV1ci5PnIaxt9QanQupTwaew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV4uzeg/; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV4uzeg/"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b1c75f0049so729336eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525719; x=1789130519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2zmHWa/vwRNYdXG0uCGwNVdS0KvkDAd/OsBzvucJfY=;
        b=XV4uzeg/uHMx8tdepGFD+4uT9NywBRY8atGxDQr7bJAysqhWiq1UyY4k8MQsmZmWHX
         cCoopNScySjk70RUGUpGFfuAv4LouyeZ9QvW80GiptPkq7Ny9ncuEKJeg3JSuVtMA75D
         Rm+Z+qyfII49gPL9D+ZDcqP2f1MTmKjIdVs8gDqZNWY6+5/XWVmnXN9qE2imHL9lDRkv
         XeNta0tcg+oxUc4NA2isN1yK8rLyPBl1+tBbfz+IKGjGkFyLjOPYeIs4+wbZEbPy7Pip
         wzeDYiXNbhDQBwx4yDE6nxpd/yrqoRFxUcGYAUNZBryPrh1HDGbuJr/sZ5WkywkjG0g2
         7C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525719; x=1789130519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2zmHWa/vwRNYdXG0uCGwNVdS0KvkDAd/OsBzvucJfY=;
        b=XP8VxBEn2zbGf9Sba/RBKsOIRE0KmMWeXYb+sgDjv4iH5nq4gjYrWPDMHbBfcd6QDt
         Pgxy7gppeAEG5mANmk5t7P5Q39Cb3x7Y4fXAHRXqgxQ/Y9noEW6396JUihcuncPAsA1R
         mBV8zjuuMPLliFZggjiPhweOsptQd5MBXg6+TxkqKCQFYQyWvBJhnJ7LKjhZUZ0SL4G0
         QTTLc17U7M5OlrU2TCp9QM5U75NgWSZ1DbWs7nHcwE14W8NnJzyQJwRnm6ijdMD0JyVg
         qz3FM3BqW14Vt0XQnehV8axbhsQ07t2xRNwKqovDJhfGV5sq8iiRNawA3UFEAGFPKyqd
         VeSA==
X-Gm-Message-State: AFuF++lAKcgWtr5aYbDLvjqpkxBNstAuA9gQovs6+81wKWYDy8u5H2SG
	kxsJNKPJZE7yg3deJFDQjN6KU/Gtr0lgqsZ7Pp8i9+eLTTc+iOEsLSYr
X-Gm-Gg: AYBFou20uox4JwINPWj+2uOz0YOond6SoeOl78BDFUznWU0+fVXPIRVL0Hivlqngu6j
	jAp4uj4YOJrbaI+V6upZIwkMA9HjvXWUJjRG7lOWFGO2bZqcOfmOXFlN3ddsz42E5MEr2n58EmL
	INT6ZpaGJQB9vf1sBDWsDcTFR3PmsrkFQM0+Dzx/ZciiojfSH7i20TXmIhZ7eoKGwMnOFweWCID
	z2TeieNN3TKEgeudeVKWtJssU8jdj+nbcMFe9QSwO1Fkx+JaDGZp5EzSSh9g07E6p/XBurbd2yc
	KdBj1XFVfWMs+idvX624GTdW6wkQor0s1mPUxOlv8dqSF4qJ8mBkHTniCF0YF1O24xQlVgnDCUh
	7TK9fFRF6TMcIj+2ZpwMM+meotpivrzWvwPdo9nFLg6TvYT0A7wQ/alTeZTXTiFGQQotw/h/lXY
	JytbWTcYxQpLCKxQTZ6D5U2QVv+CFs6lsL2Hjs4TMUtW06i02h+ysIcC+iOOEVbhm1C2H9Sr3k2
	7yuTbM/USSKtIY=
X-Received: by 2002:a05:6820:4df0:b0:6b7:cdb6:ac13 with SMTP id 006d021491bc7-6b7cdb6afcdmr1076286eaf.27.1788525718608;
        Fri, 04 Sep 2026 05:41:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6389550eec.27.2026.09.04.05.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:41:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-kernel@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 2/2] sh: fix repeated word 'with' in comment
Date: Fri,  4 Sep 2026 18:11:46 +0530
Message-ID: <20260904124148.4575-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124148.4575-1-hemanth.selam@gmail.com>
References: <20260904124148.4575-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'with', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/sh/kernel/head_32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sh/kernel/head_32.S b/arch/sh/kernel/head_32.S
index 0b91bb85d40a..95ca80b760cc 100644
--- a/arch/sh/kernel/head_32.S
+++ b/arch/sh/kernel/head_32.S
@@ -106,7 +106,7 @@ ENTRY(_stext)
  * PMB entries. This clearing also deals with the fact that PMB entries
  * can persist across reboots. The PMB could have been left in any state
  * when the reboot occurred, so to be safe we clear all entries and start
- * with with a clean slate.
+ * with a clean slate.
  *
  * The uncached mapping is constructed using the smallest possible
  * mapping with a single unbufferable page. Only the kernel text needs to
-- 
2.48.1

