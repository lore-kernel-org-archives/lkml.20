Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A17370AE6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792039948; cv=none; b=V9YC64YEr2oWLxNGUMKiLQtXSy8BUG/nv6qAimjyxCeMpHaA8Ko2wz5GiE0IqjKk4JydcgD1JS40pqMcxoU1blM2Ez29/X3EkHxawk9MjvwCTJdzVW1BOnTo3hybuMzPe10CXMnqKVCbwtY+wJhTpSIUqc8+fDcWv6lg886CCq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792039948; c=relaxed/simple;
	bh=WWTcqcrYuK6IbdrjMRhsuwFkgDt4+Cy7tBLo38z8uik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vd4d00sa3nIHQbL4iNE+7GfOawfq66ZwmZKMSYI/58fG7j4AODYnMBgaT+eiFdLS9TsjNe1hLko9taFJQbEL24eapn0cn6yKjcpiq+6r2Rn8ThT6CHT00XgLfr9d26nS7RB79EhRswENVRriFTgJGZQKofmrNpPMv5pFJEC4cys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=BRxle6Tw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="BRxle6Tw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db710396ffso37360935ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792039946; x=1792644746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=BRxle6Twv3EncK43uTlOiMqD9/jSn36UJKU8jSwbU4f8KWEAshuuht+ECpFKtTfOtF
         ClwEeJRZXmweHl9o6lxua/zYJJnxtiaRnySOiTDwnJvYtsKUspQjXRM4UFZnwbf4y2PV
         R64KnozHnYHFGHhCVWfLZcKBLwxdorAaxzemrcPGbYcqBVOD47Blz0szFj8137WEUthZ
         q2ENMrGTyPnOBdOqfs7TH4WbieCbIN3U7LZWWsdhHjb2s5OxpL7MVSIaGC8B1w9xntBw
         9ACtpSn1OCMsbhapCA2xpEgkYhh1yaXsh/oQ1K1MxXFev4n10aBKVUvPMwVhqvNy2Qc4
         gbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792039946; x=1792644746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=xf/lvfoLO8g67SJHUgzhnzRAFNwX14DOlJpBBAntJjMZJuR2QfI0Ds1NzZPkRcgrdJ
         GnJVbHUThZvLTjk2A+q+dxEnDfY+FeUt79+Nu/4Tf/15MERl/lyCPNCrfI4b5AjIEjQE
         N+mChC5ceelYdwTKg4DFckvRIK39J0IM1anhnNp0jpTvOEI1WePJYVZpoIrnUGQIh8Cd
         dN6CjSGjQiOVFANIxHCTjKwGgDFdPIqy8piXdt2FIWCUwfW8OXXMKL0czkFQ6GqhZk/U
         V2RvnLfJ2zmTMrlhUfsywPYheRkd0/A0u6EmvZUefb+KQzQ4ZAE3LlvH4GGhwiPnUZaN
         Ub0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwy4ILcPEOpzjLGoCvckuPNfrU/+2y3dhClUq5w0uWraiQVh4ObVSrlVhj9NwB69bTVraC+1p/9878zcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQww+xXJLsx/80sB47W+iE4fLRrAazWWVYCUaS0AZJ2ZcA0pjr
	K/fj9N6oAo9psibVVqPufxtnk/vGpY4edfze6YnxP7mvwJP+sZR/VH66HH6EhIUQRco=
X-Gm-Gg: AYBFou20zAV581pEoi4HxVv9U+CLlUl9bGbtTphv8CE7RpwbzlXpZgXvNL7gG4rUUX/
	gIPbaRiiIdmt2OaZqj+rfv6/qC3f9lEQR60eVSU48YS6AnfIRIuNfURcA0znT6GviUWipPXSizf
	TCiYvRA4Jy6Z9ImFS0yFaUBG01dgVsGK5t+yai7xANju0IyQjAy/cd6jJtek98k82lqj34pFbp4
	hNt917GuQrMRYK/QxY48Z+R+QWGoR0gzZs8Mwi8GWy0r+c4ocJnOHYaMlftJ6eJhUl5C975gIBo
	2BqUM4F7FIatbSRCsj0nbijCYCHbEn4LR0nX4Q8m72zfsaVTaZe22tePlzbNItnyhoczOSAfkWI
	wtDRsK8bcEAY9BFnMB6xqzwSfucCEb0gEb8lr6JnR9OsZhYDBPwHM/jx4Mxp92r2CMsJMS1sNoz
	v/YT9uWdIid0ciujVSJNbQCUOuyqid18c1+rHYcbhevnC7lvCeDWi/gcHMyI65C6CVJ3meurAmV
	YJg1w==
X-Received: by 2002:a17:903:fa6:b0:2e9:5876:17f1 with SMTP id d9443c01a7336-2e958761a2bmr9322845ad.23.1792039945776;
        Wed, 14 Oct 2026 21:52:25 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e962a4dfbbsm1615915ad.58.2026.10.14.21.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:52:25 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v9 1/9] scsi: mvumi: bound the per-event parameter and sense dumps
Date: Thu, 15 Oct 2026 13:52:05 +0900
Message-ID: <20261015045213.3975845-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015045213.3975845-1-yhlee@isslab.korea.ac.kr>
References: <20261015045213.3975845-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mvumi_show_event() prints param_count u32 words from params[] and
sense_data_length bytes from sense_data[], but both counts come from the
firmware event (struct mvumi_driver_event) and are never checked against
the arrays, which hold four words and 30 bytes.  A firmware that reports
the maximum (255 each) makes the loops read far past the event and past
the 512-byte buffer the event block is allocated in, printing the result
to the kernel log.

Stop each loop at the size of its array.

Fixes: f0c568a478f0 ("[SCSI] mvumi: Add Marvell UMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/mvumi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mvumi.c b/drivers/scsi/mvumi.c
index e70d336b4ab39..38a92f8c25f5b 100644
--- a/drivers/scsi/mvumi.c
+++ b/drivers/scsi/mvumi.c
@@ -1361,7 +1361,8 @@ static void mvumi_show_event(struct mvumi_hba *mhba,
 	if (ptr->param_count) {
 		printk(KERN_WARNING "Event param(len 0x%x): ",
 						ptr->param_count);
-		for (i = 0; i < ptr->param_count; i++)
+		for (i = 0; i < ptr->param_count &&
+		     i < ARRAY_SIZE(ptr->params); i++)
 			printk(KERN_WARNING "0x%x ", ptr->params[i]);
 
 		printk(KERN_WARNING "\n");
@@ -1370,7 +1371,8 @@ static void mvumi_show_event(struct mvumi_hba *mhba,
 	if (ptr->sense_data_length) {
 		printk(KERN_WARNING "Event sense data(len 0x%x): ",
 						ptr->sense_data_length);
-		for (i = 0; i < ptr->sense_data_length; i++)
+		for (i = 0; i < ptr->sense_data_length &&
+		     i < sizeof(ptr->sense_data); i++)
 			printk(KERN_WARNING "0x%x ", ptr->sense_data[i]);
 		printk(KERN_WARNING "\n");
 	}
-- 
2.43.0

