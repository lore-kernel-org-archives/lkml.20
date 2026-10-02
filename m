Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E94F5E00
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960232; cv=none; b=m4Z0KemaQz37MQzPa5yBA/k5WdZ9kG8HinccujYwrpU1kw0qUO3+08GHuofdWXh4LH4RlUzeszKUnnjknvbkEeznRqqSLXIYeW/NSRe6/eoZ8b82M5V36g/3ebr9gQW0xASIYqLXMaxGdQiJQjz9YlepVeiQls/ey0+CwnOf0SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960232; c=relaxed/simple;
	bh=DxeMUT4oVuqn3Slh/vUwWCSTkV3fjRC+t9YaTQ801b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GczYwPxaC6iJ2XhqM37sLXBbN/8taFJ0TfsrEqRW6M3l1WhArpIbpW7iABrjwn1UZdlBpmRP4Sv2aOMsBrjLzwjGLjIPRVV6fGC9CYiYctSa3DTuUkX7odQmyhgZ+F09kIj3TflJv0n7/KJhdqIh6jMknO/tb20M7lktyXxoQy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVpmtU/G; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVpmtU/G"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48b0a57daf6so10638f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960226; x=1791565026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CSATVIW2jC1GbKLcdornHIOpKYy46zxyEdHFo2jVEFQ=;
        b=dVpmtU/G599dk+AMgvpLHCqwfYHRMinSLBLknGBIMH7CR6wOafA4ybquLowfYxblx8
         AxQLraKIn1EKQSo6iZOUyNWsZFuHE2iacotelZZ/+scltCotjW28E/UgRNRHApFfxIF7
         OL8dP0kXGzYMjydU2hFL+KLuKS8L3uDi96/jeeE8ub0AzK+PIMLaGmliad+lEiK6tipC
         bgKyUn2+YKfFfbufjrciPZxxEPcqT0AURpQU1Rn+3JvKZXfVgFNlc036/BWG+pKNP/q0
         QlVuHM/pX0+YNwazodLg244nifjb62JXlerrbIhqPQ4wH2YbJ8YVy2giu84yIEiJRisE
         Ym/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960226; x=1791565026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSATVIW2jC1GbKLcdornHIOpKYy46zxyEdHFo2jVEFQ=;
        b=E2iKZ7j+MZZMZ+t9nKI56azaDdxMussrhyu1eZpNH6/vRgrAxlgVEBvJY9j0AKoH63
         VSAiX3cwmWI2/A2jKo4lVFI1IHQt7qZ+KZFJVKakrhxHxRPFIscGWYz9C4aSVlvNhe9t
         ONjxd11At5dI+S4RTbFU49bIouYHn3MI29uAAG1BhWrkDcq0kHgU5dV5yUu2QBzXAonS
         2+ZiaFpNef4F8fII1yT8qO8sYfA1TmJJ3q6pSrb4NIxVm67+dEaCHexyTUgiG3KCYmwZ
         0YfEw/MSuR0fwsF2lVVSNXTQikm+TOeGsGn3S2iaoIAHYNFKYBKueX52GiFhi4X39wMO
         afkg==
X-Forwarded-Encrypted: i=1; AKwUvByaW9WQ/1CXdtaem++EdPKdTOHdzzmSIOLIcok9qsj1A9YxyZuLZNvqFuEaQ41DlHtQv9WG0Zpb46LgR08=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfxfaVO65ZZjWq9PfSdMDKOGoeS6BhqQYx87xMdEBPhAvLhktt
	nIYEMpABcTzI3TuKtRTLrNMzUj+AB71DyFvxVvb6TgalUv3nquJxIdHW
X-Gm-Gg: AYBFou06tsWqMcX2oE5rkakT4uFuJAl3zYxjWTf5AQ+zrT0fnpqLsWGeQMd3CE7Joab
	XGVBWbVL7Eg/WTILwF+XpkeR8Bw4HsZPvvUe+Q5InWU3f0pXdG9DngLTjRlKioNWU4Q5VIdIn1b
	NOo02QEXrs4vJwIPcGO+Ak8dAXIManTeBktYHQ0MD970Za7YWeEGC+c34vj7liVwtqb1GjpFXjj
	+vHEPMpPKnAYnbptFs5si2DiNLPHAnDGWDWqvnpDS4J1U9DZF5dnBp2CLnAH7Wt0N5vuK+5dq02
	I3tG8n3/YxYkNlQ+1s0KOFF1tJC1MRNxP6V9J+RDBG/KO94Ufu8G4WZt0NhpLvCBbtAfX8ENp4E
	pgoDQl6x31b/ba2OGf6eBQRMcyaJr8sdNNsoW95Tj/HQFH1PbA9grqgI1cz2NSlxO8EcCU/UQFd
	hn+BlnkIklp4ZUIVImsuOSAySOcpFZA/Bt4Sh4IMsh7lGCUo9xNk498sAaDBH8aV2PtxiRhS0sE
	XVU0Pwko+u0Aow=
X-Received: by 2002:a5d:5e0f:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48b1272892cmr4421980f8f.7.1790960225928;
        Fri, 02 Oct 2026 09:57:05 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.192.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e5bsm6404644f8f.1.2026.10.02.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:57:05 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: djbw@kernel.org
Cc: vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	iweiny@kernel.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] libnvdimm: Handle negative return from nvdimm_clear_poison() in nsio_rw_bytes()
Date: Fri,  2 Oct 2026 19:56:41 +0300
Message-ID: <20261002165641.14479-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When nvdimm_clear_poison() fails, it returns a negative error code.
However, 'cleared' is a signed long while 'size' is size_t.
The comparison 'cleared < size' promotes 'cleared' to an unsigned long.
So the error condition can be bypassed and the function can
incorrectly return success if the subsequent flush succeeds.

Explicitly check for negative error codes before comparing with 'size'.

Fixes: 868f036fee4b ("libnvdimm: fix mishandled nvdimm_clear_poison() return value")
Assisted-by: LLM
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/90d3d353-28e9-4f6d-b141-a9b7157d5514@moroto.mountain/
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/nvdimm/claim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
index 309cd2cddb0e..2725dceaf938 100644
--- a/drivers/nvdimm/claim.c
+++ b/drivers/nvdimm/claim.c
@@ -263,7 +263,7 @@ static int nsio_rw_bytes(struct nd_namespace_common *ndns,
 			might_sleep();
 			cleared = nvdimm_clear_poison(&ndns->dev,
 					nsio->res.start + offset, size);
-			if (cleared < size)
+			if (cleared < 0 || cleared < size)
 				rc = -EIO;
 			if (cleared > 0 && cleared / 512) {
 				cleared /= 512;
-- 
2.53.0

