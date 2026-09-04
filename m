Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B944908C2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526007; cv=none; b=CTePh02lgqozPVi/N+mwnMVU7PcPfbbsNTakQ2HNRkmNjr3H+7Vc2AIEDLLzKy4gcm07N4bI2HQeP3nwuViJ5CnWxA4rzOBQTrG5pD2VQkprA+Mn1MobsYyjxgNBa682od6UuOBiSU9cy2CAA4HugPxYNaSBf+8UlQmi8asXZ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526007; c=relaxed/simple;
	bh=smwEGE+TiTM0Dg63KTeaBviDZgWGl5dBwPErBoZj0VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fb77CcFS1h9mrxMWQTF+8e7qQA2eCcBRwmyPVB4AHbDTrmFwA9XyrGZBjRzaoRLi/ugZTkRBaXabmtOBhJ8cvSCCeSi04ol21JIcrUlFxkFgG5Jn2Ny4yFXv+z6FFijK6J12f7DLTDvKxSdyS4hr4zhYCiucxrCn6br4I5TadNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaaLUpvJ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaaLUpvJ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso814996a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526005; x=1789130805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mPysdNFOGxWHx11Q38LlLOMTh52vfJDcOpDzOKVOtw=;
        b=BaaLUpvJcVUFFntnNIiD4BsuUNn/5VZQ0VPFZP/x6lV2uvZ+Awyu+cmqRXij7BaEa/
         oWCaC0B+6E+SC7OTyfdzLqdfc4pDuK/vIbiFTsplZG37dQJAK1bO7wTprxZkS+vOYtJS
         5nPCFtUeOYBhcolXtqfdVjADbNgmQtFxAE9wtO7Ccg2eA+/uV2i68x44hWUfl5lyTs1+
         ykQWrY/sQ8OMlMrpPNbozYJBFt5ZaseiAd40CD6Szd98con/4lJOZSREEpmYV+xtTUnD
         pxitZnBTi13jJAPt5c0sraRY2TRXFjtKkYgwxLEMXBdXtt+tiwWjrAsK+YaHZhKy5UTE
         7MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526005; x=1789130805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mPysdNFOGxWHx11Q38LlLOMTh52vfJDcOpDzOKVOtw=;
        b=OzRELldpV+B3RtOPvH/VyTibdt3uXRwg7Vo1jq6QE1BRHibJw6mOGgznwq+KOnHC6z
         Jzmmil8OU+tQIXjL8z44iV3K81jicGQFKkXl9nWKP3aclX1E65DAN+d2S3gR58HjeBuk
         KMWM0QXNWqQht3+NJ02VFqa47Rza8kfy795cy/6cH67AMvHf2i4Siwg8pci5Zk/ejTcB
         fFa7xHioDiC4xYzhFiMIr7oje++orK5vmdCrm6419Qv5anfoldLXyCuStaxgkJMC2JOh
         0lRtkOLpc7HV6oIC+9PAom+g7axvSyJ02GYZpxqbJcI1jLdAS7RCXbEFIASO3/XCLn5C
         3/tg==
X-Gm-Message-State: AFuF++n14/lRGyKLyj8DoPuwrdI1x0O3objIjYLzy7OKZSmAhkIp/Qct
	KjNAkokGjeU3rXkjmPNOR+3tYSjGGDqqMT5v7/860xJXiBRe/kRhU3Mel48tdEhKGro=
X-Gm-Gg: AYBFou05s8BtL5OBKxToeP4VP9QYhKI9JcW7YdlX6ThOaAlbMgvUvcdmHg3Mzr7X6TL
	KIVzKZSUEVK4Sw0QFeG1qS+6eAn0oBmWy8H/VjfRhqPIjhYPXUoK3X6oAAS27oo+xlH6bnbnBNK
	TKe8VPZpI4COF5qbs03yfIIrsdIb/9+Sp4s1gMZchJvIwzLA6it6aUwxsFJGbG2e/9kT7Rxi9z2
	idH32Xq1Bg5cs3q13beg0lM7DxRToL/P68Vx5EfLW1nfoS01M/TFhzIrK0khZvQOC6PARh09EFE
	sKwxw4CkQ4u5GZ17FXsMs+zSecHMNTVFCQES3DZNCyTjRV9WtXUdS9kRs4w2embpsCenxDBRPOX
	wTxJ+ZMJ0l7/d3CvujVgW1jHAbzKwJutu4r8dgZ5NLav8JbvGXdKu8Rpi7yMrKGPmUXyX38Na3D
	kR9xFge5cqXp/4/9J4HDLu+/gcbPloDfq1P+tMcc+p2gRkxMQJ31sGaOV0Lpw6IHafaIcfNzorX
	nPxcA9rp3K0pjE879dGuNf9ZQ==
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr10146661a91.16.1788526005076;
        Fri, 04 Sep 2026 05:46:45 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm7310856eec.30.2026.09.04.05.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:46:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] befs: fix typo "funtions" in comment
Date: Fri,  4 Sep 2026 18:16:39 +0530
Message-ID: <20260904124640.8433-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "funtions" to "functions", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/befs/endian.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/befs/endian.h b/fs/befs/endian.h
index bb55a54c24c0..3108af3dbcb8 100644
--- a/fs/befs/endian.h
+++ b/fs/befs/endian.h
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2001 Will Dyson <will_dyson@pobox.com>
  *
- * Partially based on similar funtions in the sysv driver.
+ * Partially based on similar functions in the sysv driver.
  */
 
 #ifndef LINUX_BEFS_ENDIAN
-- 
2.48.1

