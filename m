Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB9532E121
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621314; cv=none; b=mWCrQKD70y4rNkpqhEOxGh87QXqIDy0w+0tJ5+m9T7On/PAsHJkRlw27f6Qk59x5ATIzPAAJ/Fzf4nzkYsdVKPbLKugOx0Cy7s3kfd73fikeGUcc1KXZsVjBTM1fIqilFS98iHonEyJvXn1QCxkcsfxKGJnUt1tbIaJ12lh+vR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621314; c=relaxed/simple;
	bh=zGTXdvUka6VvGbNqzYW14vdn2gkfCFwLPvPt6mWK5Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mp+rX71IxXNgsXXHS8msU29rbe4o90VJ3yDS4yaXivURLzZZTunxYwDHz9c/88IMyXOxSsA+efVbr8NKME91C/QmL610BQhg6U5bkPaXuP+Dwpgmnv+cMtk53CPckZWMFEzfuhb6KMTB59CLThfUgeyRnt98E2+yaYnsWDgRCBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35829219da8so368673eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621312; x=1792226112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8x4yOZ8tD94FrPHmEsxfPkgylOx+K7J5FAPthoO4fQ=;
        b=j8PEITId+x7NQ7T97URUbKOflEMMkHx/DI1y8gYlXL9KLEbO6aha2m2RZBoruPuUB6
         j1Y2w77YP2k8ZSOY2Cgt9ngEFDYZlbxPauRgCpGClgfNo4yEOT+nPJ8EEN+Cahtmg2eO
         +K/vif0d5qEqTS6MpbflZGQpPA9IoO7FwgB19exqw7CsbdfiCsIBsctEpxukOvU9h06t
         kmf1/m/JfbE4UWGjHiqSTZw6ME17EdDaSv8NMO2MHr3B74bSFE7UnbzVaefH1PnSLMsP
         20zfgXd6MYraDCA/LDu1XTXvnQh3mtK5Cw5K4/1ncnQCxsxFxChtwJmGU65lQ/HEyDD8
         zpnA==
X-Forwarded-Encrypted: i=1; AKwUvBzBMakeRNvjk5ME6twTUSgr3j0Z7ae72ceVrBIUbFvtwGUZJJRG2CN7Q44nlE3dcsdAYHesQH0fLC18Xp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSwXhGS0QMVmWHbhIsDcXfi7xaUzVJiyFPgyNpBPr4VCq6Dw+o
	rioYTZSKAZjZIAhVI5l/JRmvw15hyutChrbkc6jJLHrjiHe2nVgPe2yc
X-Gm-Gg: AYBFou2cDt9yGnRxI7RHCa3cIrthbKA6KpgZ6uDJMeGwSBD2Ow45mt7s7/ntd+BtaOQ
	E6kCHIzZqXJXtHqzGyNywZRTiYqAbVVEK3lObnIm/BUwZb6cvs2PKUGh+9wgb8aLeGm10yXjmxx
	iu+RPF1RrTbAARWE292hz9tzTQcnqQPlTMXinxIZ/+a3WQeW0EiOSasj0CskX7Chn7Ivj9qPWfI
	tKxtxruQJhGKpxXaljt0w0038xasPF3sgZWSPORNiyoKBXvCb/myW0bcTJPNIOGAJxK+Zgd6r/W
	V8Zcjz7/vCBp36fiVWRLWLy3MSd8RL+gmNQxpj/KB4qYA/4sEazYJG2I+t4J7JIY40T04Q7Khz2
	75BUgaG/Rb2gZxX5M58ZWzCSq97cr+rfmeiQdA3tgnOzXP79SqMuQP1yKAlMjjozZWswwpLDh7z
	ZJbOJVEAnYmOgXxduPpABpCqOBMvlEu/w8v5Q49Xoxs8485YLV320uRJPVaz8=
X-Received: by 2002:a05:7300:c00c:10b0:34b:6f6c:2274 with SMTP id 5a478bee46e88-3536c4bde55mr7001287eec.5.1791621312296;
        Sat, 10 Oct 2026 01:35:12 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm12689858eec.4.2026.10.10.01.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:35:11 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: Mark Brown <broonie@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <aayushkmx@gmail.com>
Subject: [PATCH v2 0/3] spi: use kstrtoul() and snprintf()
Date: Sat, 10 Oct 2026 14:05:01 +0530
Message-ID: <20261010083504.26261-1-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aayush Kumar <aayushkmx@gmail.com>

Replace simple_strtoul() with kstrtoul() and sprintf() with snprintf()
in three SPI drivers.

Signed-off-by: Aayush Kumar <aayushkmx@gmail.com>
---
Changes in v2:
- Drop the two strcpy() -> strscpy() patches (David Laight).
---

Aayush Kumar (3):
  spi: tle62x0: Use kstrtoul() instead of simple_strtoul()
  spi: omap2-mcspi: Use snprintf() instead of sprintf()
  spi: s3c64xx: Use snprintf() instead of sprintf()

 drivers/spi/spi-omap2-mcspi.c | 6 ++++--
 drivers/spi/spi-s3c64xx.c     | 3 ++-
 drivers/spi/spi-tle62x0.c     | 6 +++---
 3 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.56.0

