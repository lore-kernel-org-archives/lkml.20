Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3C646AA9B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520548; cv=none; b=cZjBPXtOyqufWpVcrcGfKu9HBNV2bjZw86J7tCdhjD+46vjyoFO7qFH9bUHy799SswXI/PwjwB59nNPN7n0nYDhCVjKdhvdUA7zQfcmsX9UOXQoUJ41xiym5JUpMKLz+UvFodWtiOiRrgGWakTzB54Q/WAsL9gnXtaougHY7juk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520548; c=relaxed/simple;
	bh=w6ZMdT7jp/J5hNdDHhu2a2I+dIDyI9m9B1BjTQcLOrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=unLOElrtmbqJ9V28O4q0VnWDT7gKyB4InnDSyGdAORxF05R1uOJTpYcXMRLhop6SjFdjaHvXqK4wP4a3RMidQugE+k9YvZ1lkZraoR4dTIQLAXoT4wXOZts9hGb8+mByeI9onTR1TS/oaFpk4yjyG5j1T8EH7JbF1hr4sOIrs6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnL2TKOg; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnL2TKOg"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f4b94d72acso817418a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520546; x=1789125346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I7erNoE+DmTQpi4fiUmvX6flS02tH77/K1w6g5hmDrk=;
        b=rnL2TKOgrL8yh1Huplp0HjrDmvpTqXSMqjlWTkw8igwrmmryjpBHbA+lrb2SlD7vqO
         vA5noWK8dOfU34XJy+NGG9adnsxTzCAHw8L5NppiXq9BOTH4X9HBHcDd1PZ/GaHIv57X
         cPsif/ky23+tSTlDyV4VBZ5zYFoG+luuKL7RVsfK1Xw1kpc7w8v0xg9Bv4cB6cC27oEi
         jEF8aYFWxPAclCdgwIl5X+gJUBq/Jox13tQ/2RK9bJFOgphnJ8VQFgc/AkbUQNoLVVJT
         u+LEoAZqrtwG6Zx3dCNQqzXiEUsdqv+lCzakW0B3bpWA0NW0e4pGtnDbsrslYsXvgadx
         df2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520546; x=1789125346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I7erNoE+DmTQpi4fiUmvX6flS02tH77/K1w6g5hmDrk=;
        b=pMROFD1EzYVXej0XWhvWwDEHbyIM4P2HsiqkHF70+XXtglMKDgFswnCrX5rG9eKtLs
         ezKdvDvifEpIMAnywSZujiTuZ1ByIoj4siSA0VAN0Xy8O/nyqQVBYMfsDjeHmAG/imM6
         N/pSzU3etyxnnmrTgS0RhgURqAt/26arsNvNFYVRivun4yFCDP7oxR9cSoT5MmIFgraq
         c2wAP/Yh7VmGVRNzQyxc04phiIlSqfKoO6hloR+0RnhNe0jxdyG0YYW5GGvW1ILFhrfa
         Hrvc5gKT78DaTBponEqh8tiYL159eT98LswXYQLGkp+vKIpO6/oaC7vQ1FMcp8QuJtD2
         d5MQ==
X-Gm-Message-State: AFuF++nwI2z11O5AB/MiYgatLqIEqOb4e7MNYQAQKluzFA/uDOhNzIBk
	v85vndFqRUrdd1F1Mzm2TWzZxhsHW2/HJNqi4m+n1iGob/sVYmggI2/K
X-Gm-Gg: AYBFou0As3Yon/yu0zUrkgObnNjhyBKOxeViMg3AW8Az3DTmxbQen56yUm++r9cla+x
	KrKw4fNoICud8cA9/pHodpSWm/KcqsJnIJeAmpRFvx7KFInWzqV4jXTsoWmSx/b2EbkxHcj9imb
	x4bOGvxzxWJjIwh1kfDGTqUA3aMpK2Wq/HC5rvll1qPRHYvrrcDVU+bxBgTKaPMR1MLD2Ex1DMQ
	5swclw0Wd6H3LgnfxgC/V8E2yZRseVfffq8dOZx3Ojwl25nyBxhoV8e8O7iO8dEVbB4D/uCZUBF
	jCGrC3pttA/Fp+N4HjFB9fXlzvB8b0sghUd04L+iu0LP5D7ZPpRCSChoWarpAZbgcc3VK7zEB45
	rPz7tVM7F0dTe123/NE5hoZmrsjG/pkwEyO7h4BNwOeJM659USy9FXHgw5/aBFGny6Kxqkk1z9a
	5gx0oQ/5uSuah5YcQ8kcyB5pfkd+/LhNaAWu17M0ZekhrkJzSPNRelyo7GM2td7CjuLd7DRTPkg
	nD4yw4JEQFf/uI=
X-Received: by 2002:a05:6820:1515:b0:6b7:46fc:1d9 with SMTP id 006d021491bc7-6b746fc02damr2191770eaf.56.1788520545764;
        Fri, 04 Sep 2026 04:15:45 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm6286446eec.12.2026.09.04.04.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:15:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] nios2: fix typo "cannnot" in comment
Date: Fri,  4 Sep 2026 16:45:40 +0530
Message-ID: <20260904111541.27932-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "cannnot" to "cannot", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/nios2/include/asm/asm-macros.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/nios2/include/asm/asm-macros.h b/arch/nios2/include/asm/asm-macros.h
index 522e50a176b2..eb8cdbe49420 100644
--- a/arch/nios2/include/asm/asm-macros.h
+++ b/arch/nios2/include/asm/asm-macros.h
@@ -13,7 +13,7 @@
 /*
  * ANDs reg2 with mask and places the result in reg1.
  *
- * You cannnot use the same register for reg1 & reg2.
+ * You cannot use the same register for reg1 & reg2.
  */
 
 .macro ANDI32	reg1, reg2, mask
-- 
2.48.1

