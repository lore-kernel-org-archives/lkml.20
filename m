Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B9E2E92B3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542350; cv=none; b=fo+AyzkSZ377OMigJtXWXJoUbA0b4cTuVS2MaVqauj0IseDdrThOMnaxGSsNw7PR7UKuRM49xxfmTvixiSQJgcKAUVTGZ0cxTXR9M0UQU3UjYRQfagounMz5Sig/wBKEVhSUkgp62g01kVjS51P3jfLSQ+079t2i3INY/J44w64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542350; c=relaxed/simple;
	bh=t6xMn2L9d8s2ZCbQSuTC15GbJiy2EoeNXqPok1pTSm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yv0lujzo0q8G4n7ZibNZIocD3nDwtRXWTFd7iKeGJ1j8q0UXaMBs00DTtn3yfF4YQYi201WejbxWOlvqPzr1qtjjE6wi/VpkGqE3gMLIg7maqk2EixoIjiaObFSXKCc1zwrozo2XZJUgmjkEXVcV8Us04xYoDNcKFeDVNTtM94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZT056UXK; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZT056UXK"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93c5818c4a4so123052485a.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790542348; x=1791147148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnxJD5ci4IByxWX6EfsPiJVcCaBAaDyK9ZZdVOk4Rrc=;
        b=ZT056UXK6hCtnkIHLujja5X/VtVxGv9NcumFDxrZPTw3hHlGcE96x828Dkf9Fzrz3M
         jI7Qarz0VtgGd0Qn5m+ldpEhiOGulCL9PrIwREQrtbQUwYBqMAR+AXkH4SJ8kD9eSAZx
         Mv6t6nxe5oCIeglmxDkaa4sdfUPuLdelvP3usbzEtp9oG8jNW8wqhGKNIMloLSgfWgfx
         qR5Rf09BNVtnrMtnpEmwXS498XJtZDiI/ZpDPGjILj8CM5+SSxsZ49CdkK4722qnmaFh
         p8oEkiDiyEcTPXB9TfnRihcOT5cHibOoFxDSSYxjRcedaKnDSoHY/YPrCsNtpeFtJr/I
         b2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542348; x=1791147148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnxJD5ci4IByxWX6EfsPiJVcCaBAaDyK9ZZdVOk4Rrc=;
        b=NL90TALWZsNjTdPhpyeHIomcm7RT+0UFiGO43cABWbRHf+FWbkGPGABPESKLjhKyLL
         hmUOLHtsL+S1Uh2STzoWxaFj1cYIAUsU8aYsrXW8byVWLkREe+1ACvYSrNgmdWzklfik
         4UJuDiwbZGVJNnbzeLv1HIBHrf1E1p8KWDvXuMu+uCL1OKcGtf4ho3gIenVZfeJRsSes
         u0LYDDRaZzzqjlBpUDpsDHMXgKX9pZ6SeEuNx/5tmzemhWTuDiGloWnLMLQs3mqmBoqp
         NltLREp8b5OQPudhlzFWAdHMpryNYfNPTYABmdToHchtqnKkyaKPx+63/r1W3FCKdpo2
         Dtcg==
X-Forwarded-Encrypted: i=1; AKwUvBwLeC0fb5IeDzYlgKXZQC34AmeU6XVncBGU8i+U+pax2PFBkIvFNZwO+EeacOfBtSam9f0UNSeZKKqdmRM=@vger.kernel.org
X-Gm-Message-State: AFuF++m+wXI+KDysbuB86MM9ppthcikSntS42wUZ6HSwUzA0eeNaMGNk
	YNMcCO2O6jUFZ1ps/mJhWrKGcdJMo0FvMg4vm2oPj5TK2ppF1Q/ZPwXH
X-Gm-Gg: AYBFou0qSDfD2KIkXInejogEIOcoz45h04DlqraAgbQPGmQBG0mILtoDdUORFYxTNI5
	NsFg+vF3e4SzOsmTNqlLfCVcYTD/qiAV9Z4FivfeYfsfrPcgV/gHVaZk2xD8jTTDY1P9cbCKKsp
	VF4Q3gOgzETtmYQgCnuQqfo0xQ8ZUjLZ/8KITPt/MjotYXk4o292Kre8aypDVRnHJdxSwGjpEYB
	988vELX/VWBnC5Jrh3smVn1wp44HNhLsMjts5DwImNX7bivvNGMsolMdHDlEVWTrN8/Joy42VVa
	l5F0/ouuuz31mk1DvT1PTCpYX6rfs4ALkuG+KniVZX4jC1561Y7FOJf3s22IUHptLOdW6jSXKRn
	tjaub+t22yhb+Ystp5j9bO5QHvmsWaC+PFqLbB/kSFVOOwik9BFmrRzeZT6rkH+0vUOo6BO0tn4
	rThMlqV/OuFt1paSgyZCW99CdD5zHkOAYrr48kC8wFIDsrpoFXQ+/x9UXtVknhFe9DRELt8lQJH
	TRMUH2DmsTBehvWwicZqRPFF1s1tBFATYvVVVyjpscsfHbOLCC4vfCh9Idt0gidC2SPuuxVIPGj
	gwrzyBuHt51Xgyjuf+680BZP/g2/KnzMEKDfZM+uwuZFrRRe
X-Received: by 2002:a05:620a:bd4:b0:939:57ca:7e06 with SMTP id af79cd13be357-93c43c306f6mr1758205385a.9.1790542347934;
        Sun, 27 Sep 2026 13:52:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c6a38594esm267970885a.35.2026.09.27.13.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:52:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: use !desc for NULL check
Date: Sun, 27 Sep 2026 13:52:24 -0700
Message-ID: <20260927205224.29640-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<= 0 is flagged by sparse as being used for integer, not pointer
comparison. Fix the warning.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..8e7026682d0a 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -346,7 +346,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
 	}
 
 	desc = fsl_re_chan_alloc_desc(re_chan, flags);
-	if (desc <= 0)
+	if (!desc)
 		return NULL;
 
 	if (scf && (flags & DMA_PREP_CONTINUE)) {
@@ -470,7 +470,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
 		src_cnt += 3;
 
 	desc = fsl_re_chan_alloc_desc(re_chan, flags);
-	if (desc <= 0)
+	if (!desc)
 		return NULL;
 
 	/* Filling GenQQ CDB */
@@ -554,7 +554,7 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_memcpy(
 	}
 
 	desc = fsl_re_chan_alloc_desc(re_chan, flags);
-	if (desc <= 0)
+	if (!desc)
 		return NULL;
 
 	/* Filling move CDB */
-- 
2.55.0

