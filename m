Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7EE3CA49D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558421; cv=none; b=sSTAXTAOzGCJ/179cLPQ3ZgDcHZaZwvcTCgu0TIB+euvRL38NeGEBdV1TOozd/oCMquBx+Ugpumj6QyZIXcNcx0DU2g36vwDEFjy1Bu3Dhrzpxp0cH18yRKWr5YF19Z/CLFw/sCdGo3jP+5ZKEoEpM7HlUrnb7BlBvHkOw/3KLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558421; c=relaxed/simple;
	bh=JGFNsQr3mEJyoq70BdQq21Ladsg1Ar1zWZxOGwSVtqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVGQf9iPoBiLkb8nzwyP8dv0Xr5zETvsDqIdeaiBvccYX1+HPNDFyngQBnOTvloN7sYU3ljhZybCqy97qgke/ZHJsUMTZxPMnUl+rIzEfGr4rN3EJAADxdAXMF4rOp7Bl0t658D+X2LMoZ0/coOIChooBd5I+LnkmnpTd/u2HZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1GqeN9h; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1GqeN9h"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca80d708489so1174080a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788558420; x=1789163220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TWKswIufh0VkLHspcYqks3RfUehr7h7HBH00FHiXVBM=;
        b=d1GqeN9hfj3sHhmvXHgANuZXHS38TX86BPivmhm244R0LSTlOv7N5fyjtVaKIYmSyC
         IqCQ6xifKxc0aRbWWF1bKtiTLJKbAVGC9BkUNgAGhofELq+REosksI/UE1fnFdMjuAWE
         ioHqPDXRk8V+2M+ybrBsSnhkWM0FJ9MZbRWnWGFxdjh20HIz7uinz6a940KN3fwDdFZV
         eV5AsdqslePk9AWFmpUfOZRfY58lCJMgJaEHGareAUtz3sIlCw+Iax0f7WJn5yDlpP3J
         Whijg5oR586ST0WK5a0wk9EdBZvOSIa8rlZLyKQqtK4KbWigWXWqLkEmsJJ64hpTtqVe
         3FDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558420; x=1789163220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWKswIufh0VkLHspcYqks3RfUehr7h7HBH00FHiXVBM=;
        b=Q9KFSjhCe5QBkF53JDyQ+zilfCdoYwqlqhqIkhkWODyNaacQjpYMmjtWXPN4dlHr57
         IFtx+QhiVTRhyZAXmVzqu1+5jepxe2KmFFlmmfzAdrWQTcR7f/DuJ1Ht/B12+hA2L6S+
         qmC2fpsx7WJOJ/OqmY6NiDr9NJ1aP9xjzkfeBn/r/hduuf+hThlQxDsHueI3TI8N0DrZ
         VdNmmXe/oQhVCP2i4n3lzyu0OihDWkDDX1ROx24el3rifHjk9kBCOmA+pdKwcQrn2W0V
         n6xiMfoZR0JTaCSIVNGZON4wWWp+hnQo+Z0Im6GjC44eWvjbSuyvWmJLcoVhCUcpG8vV
         jP3g==
X-Forwarded-Encrypted: i=1; AKwUvBwfA+990U2RHnpYlFEf+d9qZpJdGqCSrEV8au4k/eu1DmHa4L6QAID3p67UXDTjCK2Vq+DEViFCgm/B2ds=@vger.kernel.org
X-Gm-Message-State: AFuF++mCIewjIVVxRQweg9+VgbV13YRZjkTEvFuZkFvOU996zVp9EgBj
	bZLbjhL1BozLnkp/btx2htFhbWaJeJCnchIy4I/nQvX4E/xQ0GxNp9wz
X-Gm-Gg: AYBFou2nNkHeEiaOh0ZFdWeAmg6t6b/IlNnS01i8ZMFMHetzqCdrTvemfFYlCfh2n2v
	8TuLBQ7p7nb7VLByHmeZdMqAyrl7M0/81RPQJ2G1qi8RGi1f7Tq3YCd213adIiBYH56/Gk8MS+R
	QopQoJe0fLgj94BUgvDN9L06MZFKHWHPv/o9UNBTkRnIMEb8wBS/EEVEWfknmLuiX9l/beBvXSI
	tf2pae7kXMcLOHQz4eysMir7uQ4YX2wQFGyMZ7ALz8GFfuwAsjl9/QOmHa8GFyCz9bmtbm7NWJ1
	Y3rQty2PeZ6U/vv0qvWnEcms1S8QPmUhfrD0d7KAG6jCJfnQbMQNG52FDEwGgFZyb1oikv38Ztj
	nNA8J5WZoF3hOnZPfJLaTThbCMLSTIzu/KCPVzkSernYdmo3L96Dakiv68o8hi3A9PPVY1xC7RY
	pkiZVVDlB+coCob4FumbNUbX/g6ccWJZzkOoi0pnyGbiU1QuQaIRDIRODJNpK0L14OBM0EP/Cgs
	+IfKZT182fRxl74+oQQRVrx1NlPqwdWoiP45CX85IPaqJMIU9gGyLIDBkwB+HWpR+R4KvM0oddt
	KmawvZVXmnBA6MelcBaRC7HNs4xkTEFF+5YLiA==
X-Received: by 2002:a05:6a20:e613:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3da215a9214mr14327580637.15.1788558419590;
        Fri, 04 Sep 2026 14:46:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45542dbbesm1328301a12.13.2026.09.04.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:46:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND] clk: nuvoton: build with any architecture
Date: Fri,  4 Sep 2026 14:46:57 -0700
Message-ID: <20260904214657.97370-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The directory's Kconfig already has COMPILE_TEST. This allows it to
work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 RESEND: seems the proper people were not CCd
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 69a09b7d0097..dd94163d8de0 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -148,7 +148,7 @@ endif
 obj-y					+= mstar/
 obj-y					+= mvebu/
 obj-$(CONFIG_ARCH_MXS)			+= mxs/
-obj-$(CONFIG_ARCH_MA35)			+= nuvoton/
+obj-y					+= nuvoton/
 obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
 obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
-- 
2.55.0

