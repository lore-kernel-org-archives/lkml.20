Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C5D4B1CE0
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403985; cv=none; b=chwAy/8MP8bKeqSsJ2LB0eUgo94rGQ6K8KK3KHdpnsmLM21ZhhjQtTe2FX4tX035W4JZ4amki/Uq1726rjh/LSPi9azPZ6CkRN33l6caDguyK21GXDLwsjcwq+8w0PA4Q+028LXQ8ui71nHtLfPpPnJu+eScRLoGDguil+v3L1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403985; c=relaxed/simple;
	bh=6bNcxzUVlmQvjet7ksUI2Ld7TTjqmjQ//XfC+z0s0z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0eGP2glFD7UBw8nvVJzyDV/k8p4Rii2nvI7fEodQCnOUa2GvsBRTC05q0j0FAFzdShQNyzaER+xp9+5yPJuThOKjGrzF10jDAXhJbo7avaraV5A1f57HMDafXg1ATRnv7eSPU6VAfynDSH8klxNWWoq9s4HnoaKsAty1NZpZro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcGG5T6D; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcGG5T6D"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db80fcdf8bso10326755ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403984; x=1793008784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EGOLZT0g0vS6HQl4RNLoJTQMf+l+IbI+5Jp/8hOXDLs=;
        b=JcGG5T6DMSW0yCslPPmZMiWSE30yIYwQnkBWvriZ/vZPzRWHTpW95a7uGT3nGZdrTT
         TXbPmk+beKg6ulF4VDwjin0mmmR5QI86OBrTV0zXbSgzfUvzhP7OgMAUp/uLYnhjynIc
         AsJBubu26kIubSjUGzN12qRRwxmWv0Pvof/MzmeHZbJRP7ZmxMZzri9zoqBcDIQ48oTu
         nZVLgv7GZ3TjeMfU0R7od424vQ01oKbrEfpMre7u2nBCG5K/oygsVzUFJmztviLps00X
         gOxI5vuo5jn7sGYdZh8WypjT07Np7rvfP8NsDlQWhFkbof768CNPR9JQSgD8b07VYInN
         M/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403984; x=1793008784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGOLZT0g0vS6HQl4RNLoJTQMf+l+IbI+5Jp/8hOXDLs=;
        b=LtmmoBXIenTCTaFal+rczYTKI1U6nK8Sfa3pAcK0EQKKP/Jfup00g691RdEPdEkjKZ
         HtoUbD/AkcIKQ6KI69rhNhgCGrsGwUVR2vtvtYTK6rE1kGpvn87/x0+gmxmOBmWf0cGe
         lexxWmH9BS07q0harYClMPYYZIAYGEsu8ZfcUFyy381Uc9Mi+/PywOVwzfqx4N7h4A/1
         VBO5NzsSiMwpe9W6eK/yogWXxWIm/eCOGtBxH4F+xFo3LYfV7jKicbnSfVr0t5iN5Hhm
         2cqu8CXoAzP0cK3rImQNMRM4P2l3ieD8KZptTQyrmel4KA9zmpia7G+ylMBoe0BkdZ25
         yI6g==
X-Forwarded-Encrypted: i=1; AKwUvBzYzcCX9NJ2PCMlwxUD/WH6jP+gHvi8biJdp0PFcPRam1ufIL+auwGGNasa2f6jfv09BsqJDn9ccc9xtbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtYIs/EznhXtt7qyKDpxkuyY5iNGPtwUiY+jG/fpO8Dn6gi+2s
	4FVw2dG2ifG67d315Ug7Txh4Z3LKkW6HGqEGLmHApM3WeogL+L9FvntJ
X-Gm-Gg: AYBFou2prAnAUROvJX6To2KDd1as8MswCdYviqbf5J5bKstt9At7USi8qh5hB80hKzH
	jzP7filk03xVIzY9wz4bL2Yucp7hK8HvV09kk6+mu4il2Yo8o5S6bljvWaMeceW8LilIaeGppEm
	2OnOziJYytIZssHlwERdECxuEg2Am9goFqbblFkcFT/yoGbtaS2FOAFD8jOUmleK7N55WXZo/NQ
	2J3w+VqFuy9fmuL6iv7aaDa7oRWj6VD1Mgq6TXplfFPbaAy+/A8wkqtGszzaavPPsiiLpcQluC+
	lM9bQv3nGpdWDyra9d4osgPvCZm4pw1cokE+kpb5YFoyZWl9tTZUbgPe5UiDNru8JXWoS4m23RB
	PX7xduRa2KByYzw82tNXcxuOM0y1Y1nUANzaXRgCGTr10nkgwtvA2Cj1F3W2equSU5gwO5vw//3
	odRun2Zf/UtBqCynbt2z/KxWga3S3pZ+gD2aLEd2758Dw7ugfSX6+DkjgS4qK+TMzSZVDi4irVn
	qoHF/ulwBfGaa5P+7xoqBJ3T0PRwXI2PmNkpPGlOVpHjfrzohjsAmDeHpKkkMxZjshOXjYAGRjI
	/p/3Yao=
X-Received: by 2002:a17:902:f603:b0:2e5:70cd:b606 with SMTP id d9443c01a7336-2e9a705c7c9mr54901255ad.56.1792403983748;
        Mon, 19 Oct 2026 02:59:43 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e834029sm36631725ad.31.2026.10.19.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:59:43 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev
Subject: [PATCH] iio: osf: avoid a large stack frame in osf_core_init
Date: Mon, 19 Oct 2026 18:58:49 +0900
Message-ID: <fc593496353a60a15fd5ef1a2786d41dd9bdff3a.1792403576.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202610191514.fRYyu0HX-lkp@intel.com>
References: <202610191514.fRYyu0HX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Clang reports a 1344-byte stack frame in osf_core_init() for
hexagon-allmodconfig, exceeding CONFIG_FRAME_WARN=1280.

The aggregate assignment materializes a temporary struct osf_device on
the stack and copies it to the destination. With the mutex and caches
added by the IIO support, this structure is 1328 bytes in the reported
configuration.

Clear the destination directly, then set dev and initialize latest_lock
as before. This preserves zero initialization of all other fields,
including when the core is reinitialized for a new session, without the
large temporary object.

With the reported Clang 24.0.0git compiler and Hexagon configuration, the
frame decreases from 1344 to 8 bytes and the warning disappears.

Fixes: 7329986669f2 ("iio: osf: add IIO devices from capability reports")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610191514.fRYyu0HX-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/sensorhubs/osf/osf_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/sensorhubs/osf/osf_core.c b/drivers/iio/sensorhubs/osf/osf_core.c
index 4f73ff5e9572..62b086f67e6f 100644
--- a/drivers/iio/sensorhubs/osf/osf_core.c
+++ b/drivers/iio/sensorhubs/osf/osf_core.c
@@ -16,9 +16,8 @@
 
 void osf_core_init(struct osf_device *osf, struct device *dev)
 {
-	*osf = (struct osf_device) {
-		.dev = dev,
-	};
+	memset(osf, 0, sizeof(*osf));
+	osf->dev = dev;
 	mutex_init(&osf->latest_lock);
 }
 

base-commit: 43ffda3c7f8456bbe641ae8249a077a361b97880
-- 
2.43.0

