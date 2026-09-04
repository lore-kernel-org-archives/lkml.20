Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7124886E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520147; cv=none; b=Jqh+lLEQxrNMHlY9LMB8cMk3zFZGvci9/VmRCowWwoCCodRivI0gzHXdIrdAAihsdV8MOqiIe6wf4RsOTFKr/0zKO43hdIlTV2Vy1O1l2ALbeU+2cVg/RZixFHaMEQAXKqImCocX2I4+ClBrLb2mvMO/beuMIVaH70iFKIJd5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520147; c=relaxed/simple;
	bh=rZrotHt0sx9k0ec/ikIVhF8nwi0LNApnMrjVcbP77oU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fwIn1oqPcgoKahKC6k7R2J0Mvv6c1BHwFkeE0g7unXB2YkeFj37hjNmWREqERZ/23xXlFQC21q04y2kc8ZBq7u6OBNgzbE2o33Qk4JfpKLJMHWZJxQCfU/Q76TvcaTlIGVzoWgCtmVmfLlgOgBFtADeJDI5WXumVEmYEZ7qA+Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvntMis7; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvntMis7"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4ab70b882c5so650865b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520144; x=1789124944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMR9rnHZ2iUfu2YJJ4shXI2egMoKeOyT5OF8fZ1XcbQ=;
        b=GvntMis7CPfBEN23HwuFSWGYLPZAT7baO95DY70L3BfJwXCgMeZdcNHZYPaYtceuSG
         RrUZA6BHIAsjLcR2xKfa87iNc/jz0j1x400h+aXMusRX04aJ/iiBaah2N/eUISmPtUia
         pfB2qG9hOXGoISL3+U9Exc5kGfr/7aICp2icSgCyBbacWCl1g6tBomMkvrTpPia/Ahrc
         +5Sjn6WQbMBHB2DhDpthoi/MH35JJ/2GB2U5RJZV3l4P5cFwk7FMncxq/ifyC4kJO/nB
         y1kfdVFq3tLjW6ODEB+ScDl8Eq+v/l4LOaOMKNCOGL/RKNQA0gAzC5grLShJSTkADcjz
         tbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520144; x=1789124944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMR9rnHZ2iUfu2YJJ4shXI2egMoKeOyT5OF8fZ1XcbQ=;
        b=Llzs6CVORXKfZT1P5/gyahT+xUTr9LkHctEoQ4g2oYasIABCMKuzqZEM2fa4Am2Y8f
         CtSWS2RCoHPBF+ZG1TfawqpZuReQ/8Ev9BS5dHgPG0BuWmaSw7b7D8MRbLLMxyxSa9OD
         VkGxAPMnltrxsGYW3dw9zCaYDSSW5bKJXZxa4quWDBQeF3j9rh8yPjjhQPzvFolxIYfK
         VBj5plBbP+z5zrzUY4c6FTBkvoe/dFUkAoc7dM4K3O9/NTfM/CEtVKcuqq/3qL3gPhBL
         UqnWwULCR/O04oz8nM4C0tmWR2E8nM89QRY8k7M3MIh/OvwVBs0ICeFTrHT7wPmDS45c
         kRHQ==
X-Gm-Message-State: AFuF++kc0ZmVBulgB3/eyyLB/GZOE39T7fgOHpx6G2pUQ3OiA3S5UGau
	GutQ2RTl/yC2SQdAQtUD26ixPX+J3WHJVnv6Mmsz3KGOhfHGPMfhyyQ/e9/BMMuYs/o=
X-Gm-Gg: AYBFou2I2WLKM6VpkUQnPGobsXbVEvybX2dTrpkbPK4+4Us9cAJGSV1M9m+lXqxnKfi
	IP6TJ6G+nJsadbpDBK0uu0JJJkCM7dpRv7LfBO6emG724JnXxt0JWIl+jzHH9y64h4s4rzKCqY8
	xasp58tDQhCIJgiFdMGje44ga2pC4YC03+GmubE+fLqOyoThWczShXlaZN/K+eo5WMWEkGxnimA
	WJhVM5hqZRdmIeg90BELQlSf4V/P/5XB5WsZieFgId+HVGQFS+QUrmZEMjwP/kX/PBceNt8hX5D
	8zFNRZy15mppPstyKgan4D9X9pdU9KSZ7KMG9Gm4n2F6r2D4s1bSiXmQLMjqWGi9z2TxBDj9srE
	VmCKIaV8y1q5mDYB2VkFMt3pDIaKLsROIxC2MhTMM4+9U16Y9aEUXMXUZcXyuclSXCgBNB0Ic77
	rPKpG62tZOgdhZCjVx9kniFfCiHNegWWA97UO+z+86KSiocTaqILRrZr3yDJy8j7qhi/MSPPbIb
	Yet44wY8Jerd9+Eq/QPmxQM5w==
X-Received: by 2002:a05:6820:813:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-6b746fa1a49mr1999768eaf.40.1788520144500;
        Fri, 04 Sep 2026 04:09:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5599656eec.18.2026.09.04.04.09.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:09:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform/chrome: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:38:56 +0530
Message-ID: <20260904110900.20435-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
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

Hemanth Selam (2):
  platform/chrome: fix typos in comments
  platform/chrome: fix repeated word 'from' in comment

 drivers/platform/chrome/cros_ec_ishtp.c     | 2 +-
 drivers/platform/chrome/cros_ec_rpmsg.c     | 2 +-
 drivers/platform/chrome/cros_usbpd_notify.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.48.1

