Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D28D3E49FE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522625; cv=none; b=mFHL9bDrrwQ4e5cU+3fdUiCB6J6dBBTjiO63njRORNXOMwZTltg2p5MRO1JGba1AX3f81mvplAjXTGPssg6DznIRXiD5IhCX/eYPMnVZFzq07SzqKc53aOPteyUUgpyLX/lZRa404+FRVD2E5U9j5BNJ4TkTjiPuZqlL+ZU2yhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522625; c=relaxed/simple;
	bh=N+zSyY4ianzElhj2NeLPGkI7yj9TR75xBmryVaPaPg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fzBEcGl7WaE4CX16VJYM+3ywuMrl0G9wHfVAUxMjl2oJP7l7FcJzvraEWFTM+4jvwZ4Bt+9M0jgxl6xZEN+Noi+vfSzeLj3YLKEsJ86UE6zWj2Tc/u8dfNjpYgLgMZ97jXfRHJ0CtBcQPtuaC0WkndiLrSDUXMDMGGgYhu12MYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+AQ3Jio; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+AQ3Jio"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf452def93so19161485ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522623; x=1789127423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5Ke9geU+rsMUIwLN3UNtP5BqG0ygGXZKdUvC55ONv0=;
        b=O+AQ3JioZcR43ovy+Uq6ZSHiEddab5uoCaQ5rcMHQ3Fa6QO0mp4TLA1PDezTyrYfP4
         HSi2FIWZA6G6/VfE1TfOhsOQCvJz8JIP5gLq4fswirK1wNmqyP6MJx0RmFe7q4ZXbjFp
         ttFPy5X3QZmLA/nuWQiEK0S3B0JGLUePz5xiZkZM3afzGx8NcATk8WLI3i+jg3zT5BSB
         gf8TbHc9N7LyeaHKVdWkPMH8k/BYP12rsl4WDUO+1NORmhkQGjZ9wrfTac4RJIejP1h+
         YKln9PbyNPKyTq32KcByxrhSS4VHA8wMD2cFohJI/Cez6pMo6ZRTgdaM7l5fnCCT6A1e
         ghgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522623; x=1789127423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5Ke9geU+rsMUIwLN3UNtP5BqG0ygGXZKdUvC55ONv0=;
        b=aJ9rCI9A/LBCOg+EntZHTc3jDCx/SIIYZsLIhxYvq4EcY+aV4/KtBlF8m98hVx1hs3
         7Fm7zU7s9by5b2aaTQsGCz1Q2uP8xlLHRINOWYVNFXDNVV1GaJxPRY6CqEuDULyTh//9
         9istjYsF93Kr1ZoU/HubrdM8sCKtzyoQGZwpuLNnIwNjpXhfJLFPaZV6r7P9SfMv3SXc
         9CuBAOx5ihUydSmdIW6SH04/IlHGNb+4qLCXbtrweJxk5d5GeihWAOcq7PiTZRuGcwBp
         TflOAtFGqKu18Zhq/Urcw5FLRiv8h5HdQ90AUnoIC2P3tiuFh23JgGKmmJ/kirg0+0Gl
         zgaA==
X-Gm-Message-State: AFuF++lltPkycb0h5tRp3BefhiUMm/8snmnfgwOCEaGU6sD5ZZKC0CtG
	ZC0h6OQjaRDnsdButzPyhUwfwNCCG4w7yqRIoMbVHCyS4EgdBXSyQnxG
X-Gm-Gg: AYBFou28+017jEwuYnRRZ4iTReu1FbeASeNz+IgR6QmAl0u94XUbe3jBVY3Y5ekbAmi
	jVWQeP+2FwzrLpkgCr0G0trzFB9M9ZbMy9Uxlnyuq8NqKMTwCx2lBHV2Ee+pxAwGA0hx7pE7Iwd
	DowiBYMInbmeaGhxiaghSPlXr2URaiAnbH+qun+V0choQ2EFV3T56DmoTNNqwq6v7PcxOw5Z/+7
	GyHdMu77kUB1Ukw9pmeIstxtB9bDCdWw+F7A1AzbNqv7bul3LHitME5BVGGhGrs9tjnNEYpqhkC
	C78/yYcVQZuOGkZVlkGg1CXQUYFF+gzAfl59fxSMQh1ouvXajcPD97eVbKQ+pD6Ws89sheVjrJq
	OT060oghUROdeek2s10THXOp3vZO/hL6Qlw+ol5QFcwDIGKRZysvvCZqHHhmbwu5nVtMD4DIYE1
	7gjjVt8bX2J4XC6hvfWXcbO5Yx4/iMwpcjYOZDx3xQHc/BTEg9uJoH/kbwfG+h1e6ZEb6wQDx+f
	Q29xwVwqwMwMyc=
X-Received: by 2002:a17:90b:4c4e:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39b07fe9dd8mr14040898a91.8.1788522623220;
        Fri, 04 Sep 2026 04:50:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm5551640eec.9.2026.09.04.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:50:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] misc: fix typo "retrived" in comment
Date: Fri,  4 Sep 2026 17:20:17 +0530
Message-ID: <20260904115018.3397-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrived" to "retrieved", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/misc/xilinx_sdfec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/misc/xilinx_sdfec.h b/include/uapi/misc/xilinx_sdfec.h
index ee1a42ae6f46..d98d4c1c49f8 100644
--- a/include/uapi/misc/xilinx_sdfec.h
+++ b/include/uapi/misc/xilinx_sdfec.h
@@ -234,7 +234,7 @@ struct xsdfec_config {
 };
 
 /**
- * struct xsdfec_stats - Stats retrived by ioctl XSDFEC_GET_STATS. Used
+ * struct xsdfec_stats - Stats retrieved by ioctl XSDFEC_GET_STATS. Used
  *			 to buffer atomic_t variables from struct
  *			 xsdfec_dev. Counts are accumulated until
  *			 the user clears them.
-- 
2.48.1

