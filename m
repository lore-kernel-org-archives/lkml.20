Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7684B5CD4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864237; cv=none; b=Z5EoesX9rbpPsCYlZTmsYNvCflHf++AtYH6EQ+t/imRt6VGRqxFxb0AiY7ucPyFfAG06A0BPRGPMlTIe3jvmFzAK5BDCEpC6NxOOZ482whQgglyJ6UxZENf6LThvwy1bSCLa8Evwo4cZvmcx2Xat73Fb0xbTCHMYlQz0IrtjNFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864237; c=relaxed/simple;
	bh=wJF87hAqw1DfV/G2Y8256aPe3GJWUQeIGK+xITMgWVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sppkbQ80hA428OWex/1RDn8eXYDuvEh9qzQITloD+t3Te+XMu6z+vQ7ZS27ia53yK/2jEYT8N9uenFJBw9eQjoI6EaekcJaaqAFCSofrQJTpVgtSHBNFkIqFHCrjZuH4Z/Jz2fR/xkUjLSItLsX5owZWe78aa8MyH1OzS8GLcaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIT9i5/k; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIT9i5/k"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-382ef647e20so4558454a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788864235; x=1789469035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qCqQB19M3/bVXTywLYLz0qY+EnHLX+YyNCe+Rh8rNHM=;
        b=YIT9i5/kw5N5auLfv5NH0nf/MDl5T/DQ1ZBzuCJpf2bB7yImQBzh2v6Omb5Pjw0W5X
         bKTahI3dT6FuLd7XYXWOsrtAlJoJqL5CdiR319B+V7CLatq2+tU2B6b7YgykCpl45ogT
         Fw4ZYtkQ6wqqn2p4pVpuVe38DW7d7YpE0DD1NOYyounronK+XoajP5I42IM0q44grwH6
         kpmeGiaRylvu5himvEl2VIxx5OPC/CVD2hcfvuRxcPJHrmnZIoxYkpNjsdhK67T5xhxN
         j8l0UCKHLZHljeugKM5KCLZeMfVjtb2JvLXZ+YPJ4UAZLwek1/IRFHahcxciuvbjWDyr
         4eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788864235; x=1789469035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCqQB19M3/bVXTywLYLz0qY+EnHLX+YyNCe+Rh8rNHM=;
        b=KKTNKbArFqTfGn439SgxyE5oBf2+FCLpp3d/AkWWg4pmgN9xiaxvoVbhmiQSNQor2o
         moGHKglrBlZOQTIWkZBg/39JHvAqRviWr1ii1OyAKH6pIrAPB9Gnf3qS3QZ+txV9dU1j
         zSyhWVGShpn2K5+Ilu9BBQ+WNNmYIgNdRs+Pqhbi6+vZHF6s3BLmQCCJwpeBdNjpiikx
         o1GLHwkiFvz0TuXjAW75UXRafTzydQnOfPKoC4KZjRNlWJ/QtdCry0LEq4rko0zH5GrD
         m15XRHfZBkX5roAwTLxUBdNAfvrU1nSFGlBXWDtzkiAXTuVUyWI1StDdTIhMiV8MyffI
         QIcA==
X-Forwarded-Encrypted: i=1; AKwUvBwySMGyf/L7Lprm+HEJA9qP7qlFM4kXZgyq7nax3qMti5JYJPz9gLIdk9yWrZDcZfpKn2rFcAlDjFNamuI=@vger.kernel.org
X-Gm-Message-State: AFuF++knQzYFSUMEs92uzh1MnLuO+t9A+UVEpjEQkGDUl+GnHFcFWIlL
	+Xk+Wy5n1b4G99f/6GrN86KvkZQ/lftACzQcOYBJms9GYecEYgDvSKkL
X-Gm-Gg: AYBFou3sEgNKS6idSBjXPwIWAtlWDoeBWgrijYoxTXleUXwox1/j1MgpXByFQp3jiQN
	vijrfBiD+aE4YNsUrFbR+/J4f6ChlIFTjMZud7YQhoCOVSzqCzFNhU4ll+OpHcSsNuOMs6E+KhG
	aR2UWwnkk606YsuGIsHCOwlJR40azoILjcHlFrhuKsGGiE7QMcvG1i5KO85E+8yLLCPxrwIAomj
	rPW6QxSxj2jUObc4DLTWj5x9HwHX/7tf0u1Yetfl8sfmzv1Wd1hgLHxZvKnWz9yZOMBvA0hiwWA
	nCIN/qtpM3Mx9w2vQ8AHSzw4jNsVvW+0AZtPOXZubsJWuw6EXu8ybZpMeykqcVBKxC2cy3cDAk7
	jwkiOXSJceafBqHTl+GJ8ujpBmr3XxN9wA769nFacZQI5vRGN/7VTm6fTEDBRhHog4JuJApH997
	ONaHec/9O1A1Q9kScGaVmIekU3L6yPX+1djta4NyS44vVo0HDvSEzTiKCcNNATwh1fE6uZWNbCv
	ClonCCuFS2c
X-Received: by 2002:a17:90a:d646:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39b26214798mr46686051a91.20.1788864234965;
        Tue, 08 Sep 2026 03:43:54 -0700 (PDT)
Received: from adminex-ThinkPad-E14-Gen-7.. ([14.97.7.198])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm3595604eec.29.2026.09.08.03.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:43:54 -0700 (PDT)
From: Mahantesh <mahantesh9789@gmail.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahantesh <mahantesh9789@gmail.com>
Subject: [PATCH] scsi: isci: Fix duplicate word in comment
Date: Tue,  8 Sep 2026 16:13:42 +0530
Message-ID: <20260908104342.30297-1-mahantesh9789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the duplicate word "the" in a comment in task.c.

Signed-off-by: Mahantesh <mahantesh9789@gmail.com>
---
 drivers/scsi/isci/task.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/isci/task.c b/drivers/scsi/isci/task.c
index 3a25b1a2c52d..aeb2cda92465 100644
--- a/drivers/scsi/isci/task.c
+++ b/drivers/scsi/isci/task.c
@@ -67,7 +67,7 @@
 /**
 * isci_task_refuse() - complete the request to the upper layer driver in
 *     the case where an I/O needs to be completed back in the submit path.
-* @ihost: host on which the the request was queued
+* @ihost: host on which the request was queued
 * @task: request to complete
 * @response: response code for the completed task.
 * @status: status code for the completed task.
-- 
2.43.0

