Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCA0397933
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525947; cv=none; b=qzIkWHYh2o6a/l6Fil01uEKW8ZD3GRvn2ZnT/LzVNU0atJ8q0dIKbBV4QKPc8M35E1DpaOLu1WqdZPQrtGaX9/uY7z8iJ1vxigNEhMMHo8dQai7ENndl2X3nhruPzmFHeROZL4hcqrVhIUeHORrPpeCh+93mYoAWvOIGTEW29aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525947; c=relaxed/simple;
	bh=JsRRwSlNiqv4IXD/QI8rYmUOsCYo1uGGXOpdJuGeWz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8MyqyA2Y31WI+f/BmPXdDOfNgD9pgi9nGaY2lVeAQtaSifp+cYcIIoMCD+7bvjCo+fQ+OXOpXbk9Lu5iIL3rR6LX1+OI4a4aFxJkNRRwXLCdhcioGflAUqfozblWqtV2e0c8ullsMtfarlhkXb1K26LwXmGBKxaIWLL0xBSkyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCJrFWgw; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCJrFWgw"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so1299247a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525945; x=1789130745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lkgv/aabiJLYo7a8HITqJAk0AcGMc8Bodgv/8vkpuHw=;
        b=rCJrFWgwUhysHJW2MtNjDVo66D7D7G4pLug++T9TVNy6vL8yctcwLi4zY4nLg0FEto
         N9s01SL6sJ/riY01djv+S79f4N+1KMy3FiaZCQUzGsTsUgnGTDodGdLbPkXUocuJm4h0
         K58Homkb3UabYtRTRgno3uW/0iQ/0n8sRzzjjyFqYSaYh1255p1raN0zoNmM5lYdVpFr
         iRSS7NpimKUnW3NlKPsphkLKgRoooJ/B4PxSxLQ9Ki0HLxGKv7G/irLJtHNhksnyHaRO
         WNfzCcRGFexQ4OuuD1/9pwPC1KqSoe3gwr+duHT9yRMWofjzjsV0XI0MLuQKBgiLnFWW
         +hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525945; x=1789130745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lkgv/aabiJLYo7a8HITqJAk0AcGMc8Bodgv/8vkpuHw=;
        b=r6GT3mYHQyLCoZlayvzNie4Isn49iYlWvySKkmFiKE7KgYUOlK1Cy3HQxWaA6w4xBz
         uv8PCmHtD0zyqjnO7uwOpDfMdpy9b20hnozhSb8yZFgPmy4UjNzB60xslrFZXh19qJt9
         dOCxqruhJHKyAFWAe/lbg0BAUgSeEFEP3fNJk2TKX/xYKvmKoE3WNo1BZ4KXv+DSEZHo
         fsSGWmclSMQoeu08mENq7Nx8VrF35uLInY1HXRWsfY2PaV2A3xlPt7uPWPNdTou4yz9T
         Jlv29pSRXAzBI+IB0xlVg1g0z1CMlmKybY/BgJULeUygddx2aqloq4/wuOctlU/CfRhA
         khaQ==
X-Gm-Message-State: AFuF++kqMqFpmDIXJ/ibQ8NdRlMmb2MUfo9PnWMmGOnu1G368KQ4zvJN
	oZbpKDyeCJUq/024ZhBSi4ohAHMfevkRzC3Kvt0mAAHB2rgjJEuO5ryK37BGw6TZ8xk=
X-Gm-Gg: AYBFou0Z5dyVPsR/zHo7q0ZtD9Z8jdvaIz6L4u20q8WP93QdPKlkp4UzRrHJuRx7fZm
	HX1z2tz6tjSpFyM3V9fIho33KUeDz/ScdhupoKO3475iEFZixOPFc/GDSBFkoG1kdGgYXELftL3
	NOncPUWINaCVbXWLdlak2DUDLFgkXpR11NC4Mw1YW6ZTnJsldxs3/xYrF33t5TU5W42Za5CT96B
	xI3eDvJPDj7zXGXN1GR6jFEVUa4in7AOyrhoL3vzXINyvC0PTJ+8yx0+BLx+b+JcY7OY1YsF/SK
	bZKMiIrOjx5L8+BGzHEvULqAsmJiQAUye9HPNbEHiepaeheBpTmPquXSDAK6fWKpyA6/WNwnf6Y
	YWt9ROWfD8df0fLl9/FyL6lM2YYrZzubS0fmK3mQkz1YD7hU5eMB+hS3IQ7vk+GAbVAcKmpElfm
	7qCDF3viqqrNb4rqQJxGdJmFaJn7LdysMbOgDdPujwCTERrHPRQ01oqOlCQ95MEPfIQJImV+LnF
	xVR9SRd9q1pvnA=
X-Received: by 2002:a17:90b:586c:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-39b2623ef65mr10310318a91.24.1788525944749;
        Fri, 04 Sep 2026 05:45:44 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm6477419c88.13.2026.09.04.05.45.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:45:44 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] macintosh: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 18:15:34 +0530
Message-ID: <20260904124540.7652-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 3 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (3):
  macintosh: fix typos in comments
  bus: fsl-mc: fix repeated word 'for' in comment
  macintosh: fix repeated word 'up' in comment

 drivers/bus/fsl-mc/fsl-mc-msi.c          | 2 +-
 drivers/macintosh/adbhid.c               | 4 ++--
 drivers/macintosh/macio_asic.c           | 2 +-
 drivers/macintosh/mediabay.c             | 2 +-
 drivers/macintosh/via-pmu.c              | 6 +++---
 drivers/macintosh/windfarm_lm75_sensor.c | 2 +-
 drivers/macintosh/windfarm_pm81.c        | 2 +-
 drivers/macintosh/windfarm_pm91.c        | 2 +-
 drivers/soc/fsl/qbman/qman_portal.c      | 2 +-
 9 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.48.1

