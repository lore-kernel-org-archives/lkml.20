Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4043F488764
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912720; cv=none; b=tPPdTNb7W8AfQsfS8fNpH+wwewXY1vlq0OWzt1JF+3bLj9Rymc94CaxymzHeA/gLmj3AFqWbtCEvTZPInzyDcv2gTpI2v1TjqGcNvEmmP4t58wTSbf5xAhYRSMr5My8XcxkRN4sDH0uxQkX4/VXRJjz9NxLH+69ZCUy5k8NDMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912720; c=relaxed/simple;
	bh=WWTcqcrYuK6IbdrjMRhsuwFkgDt4+Cy7tBLo38z8uik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GOcNhnOaUhSBORuupR46IdAqTTyktE1YBq56WhGMJoE6fZMFdmd6nRK1H0q9yMicp+AZOtIKiQs6NnKf0+e/aGThGzDvX/S87DtMjGDBmJqDTz3Dxmsx4sU/OtzgbGlMM5FBDma9RvdVsCpx2HCyG2DlNh3oOQWYf+vxqdGsadQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=PznwGQJd; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="PznwGQJd"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1775496a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791912717; x=1792517517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=PznwGQJd+Zg5hqt+wtLBHz8nIdnKFSN04lKF/evhNefGtdkydtLpWcgj4Py1zvg1AQ
         MYQbFhhY9q3zRp29YjbzF6VrseL81TI+aL3b6RDlQNSUP2BGrx06giXuBCDBVvzWi633
         ZCNJOqydrS1yzISgoTIWkc72z7XKcwH5xsaOF4VYy4Qq9hjVE8MiVcEiTEVai7S2mLbQ
         9jtb+0K2NB53HFS7RtmthGDKtqgKIEIQ30MSNWw+yEHGpRnbnv72Wb27rikdr0Biusnj
         pDVE6B2IaOhZS7VSyyH8WpSteWHxdrXQH5aGkOmWdQATQauFSuQQSRK0EY+wSmazYn2P
         99ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912717; x=1792517517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmaZjOlL7Z4YX68oXGeP0K0pl8aIA8E2Yu5c3A96tCc=;
        b=AEXrnrWmgYFtGYNj2fRigF173IdrLioy5yLY0/neI21lZyaBZeU3hwMh3t/n6MGfoJ
         qP9pR3rQr69UVJeC8t3E/MXBWe8pLLonyg+g6KdbofMglZlct1SyCMR70qWrqo/ILWil
         je265HmD3w1lOqhIWGTFHJ2r22XR7Pm3VBfxP2bqkQFfU4plKMag0zLCNOjFSZ396D+Y
         4DpQMGCrh35VBsl+sFahobBmIKj591o7yEzUZ+tJAsBS3/tt9Eb6t491AeoOiT1Y9ORP
         +BEpaLP+JTyFDdzOmmijzHBek10KsOpeQaIJ833M/HqF2vLMx61fNalUnrRBy5Xnywhu
         Nxng==
X-Forwarded-Encrypted: i=1; AKwUvByyk76TK4dwotZMZNYtUpko6t3rWj9slbKuueo08Ku+RTyP1cajVReNJyynaJ9r4lR/hZ59eHxKCB1b9wA=@vger.kernel.org
X-Gm-Message-State: AFq9FYImIQ26IvSdKEBELiVjTcWSEtsbt50pGvQrCOi6UN8TrPMk4Wt2
	qqaEq+AU67zga6l525YZb6qzWfeULkSme1Gw8oo8DIoPPWbALRFc4057+X6NQYMHafs=
X-Gm-Gg: AYBFou2oXt2WABHWEzfTecOEZ3gng9kSLRzofBTZAIJVTDSACHPWstlkpk1p2yRmNnW
	VDgr5E5YuHPHIusX1KaqmOchAdsMqKiaro3LKQ+6BUANEq3C37s03ctrhOlE4bjt6IMySOu5KYQ
	14f1NFOoiepgvWQF/AcyF9t93RpRb6GM6wacbgk4tIEw76cZI/FfB2eglAn8dfqB0WHId32v34n
	WQgoafh1AriArIB67M1FWFuzuia2XrtVFSVcks5l9Ahv/UUMk16qb72ggk2ecfQP9sQCNAuyY90
	AYeXgpcCXL/UnpPQUcI/Lamt2entyRXIZAOVBOaUzE6f3XSe44Dex+H+wvYIb1zP0deDVM4LEzq
	djnDO1gpofIEVqkRzidlJN8Fq5C5jUMQmqc0wSh4vlXB07MRlpPgqCx0GjOwToBBlplB/VBSsar
	2uIsNd2nJYGTMgXMYWYNeuTZhD36KqNDfK0NCVTKCGrX2DSRw9KThQm8pOyZ7We9cw2/iCtNdDX
	0TvfUxSfwSyYIMz+4wb
X-Received: by 2002:a17:90a:d2c7:b0:3ab:1b19:78f0 with SMTP id 98e67ed59e1d1-3ab3a8e1d1bmr11092955a91.41.1791912717265;
        Tue, 13 Oct 2026 10:31:57 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6019ca59sm607396a91.9.2026.10.13.10.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:31:56 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: [PATCH v2 1/2] scsi: mvumi: bound the per-event parameter and sense dumps
Date: Wed, 14 Oct 2026 02:31:44 +0900
Message-ID: <20261013173145.3412863-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013173145.3412863-1-yhlee@isslab.korea.ac.kr>
References: <20261013173145.3412863-1-yhlee@isslab.korea.ac.kr>
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

