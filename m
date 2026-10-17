Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E883D8131
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226699; cv=none; b=kh2JI5kOCkkHHiS2+YCFhxGKc/34SrXQQeAg9n06f2xaUkd1lQCAi5vYZOZ6MFoAw2dFsCI5AIupkL+ZWSK3DHJKIhh03Itbgp5ru6aiy9pibL1NrClVfcc0Y5zzyr6rA/aD+tBKeIbFx5dVcGImc2FBQOIVQ/buWUwS/GtmcuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226699; c=relaxed/simple;
	bh=8uSgPY5J4SRj7MOr1f/0kPNYNpJMtVZt/cJJlSdW0DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVjSDY6OdILpNyegfHlpRdsXzS7BVui2AAWPXN8DTkg3spfoE6hJpTibagvwMUCPuZjbGVYERJH8VXAahmdLmdyrn22VQhcVWriVWgREJ39T0ckFMwCXym5mP1CjvMBzy9Yzdi7Z1Z3CN85Qh3Nv+jfn7/DXGR2M/C8R9ih7x+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNtlsSsz; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNtlsSsz"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35943f55c06so904162eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792226697; x=1792831497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDKDg1qqrPaeFL1JFANvjweHJRgsUSZoEsZ1Bk80NL4=;
        b=SNtlsSszl5pFquyKIzM90j70xU8woUhYlAV9kz8xTo8gL2G5yE1TQMzPDqzo+dT0HH
         Wcm8SacsLfsAt3tBxfo0FEynH2m3rCWKJf8psDt46cyeSE3uefjJIfu+zchfLlI6qB2U
         Zuw5WaL0/nHJ3ZprKWQsn0ThGCQ+ua/aYfvYKnL/j66ueeQ3e05vTDLNsRbbK3akHhQA
         kuYRwXKBC/AuYwQ0/b3lhZrGkNkFwOumizyDxTbGSr+jVQkvDnIkPN5PEpJuid2YEzei
         OOwd4xZmsyR/+NX2X9VURAzrmgBt8aQA4iumXbaIF93sUPrPhWR5jGjPQa6vuyJFo9xU
         ZNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226697; x=1792831497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDKDg1qqrPaeFL1JFANvjweHJRgsUSZoEsZ1Bk80NL4=;
        b=VPYWvg0oLPmKAWD44N4gWTSQll7TxIG8rrU8HuVdQvXDptuvNTQnL5/XIYTtP+WAdL
         jv8y7j1H1dPtzx+FYSV+jwX+wFFfMBpDBZhuCQBpRG+uqSXVDxHUFV+x/eawGsbAcmKo
         b+HrGU4H/adV4iFNHDq0b35dXJVEMJrJPFogdltLmECmrnZjbP/Xw74a+3OmL7lM8HLK
         RsWu6JT/4A7umdWQQmDwD6uVwlX22WNvyIqPGTk5XZ1P2gIUfKPaTArgP26zrqQM1H/w
         U23IWpq4NJDCrY/8DrttcukjeEVToZOjsanQDtqKd4oBKk7o+rFsgZgc8Pbme235iuov
         LbxA==
X-Forwarded-Encrypted: i=1; AKwUvBy8iHT1OGvJg3hNKDtHI2QoUgeVxTAd9phkzvMCRUxDPGxR/7ibZtb5JtUJonKlIM+Rrlu4zA1HW+mxjcQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIoE5DRipFPC99aMsePB6t8g5Mxwk8AY0LNiGEDRlHiqYLZC0F
	IzAgLvnqn9o9DoS/4BnNlHFyDirSvq6nJodSjjkiKnHFGH4yCre8hddC
X-Gm-Gg: AYBFou0kUh1aC2htgRGRRCN6gU/J8CAYF8PAULyglnNE7iuwJl4i6Rxu16znF8A3bdi
	bahDGx3LS7e4lmPybeQH8Xp4wZfca5Up4AAAESx+G7aSm+ZL1D/ZW9D1EhU5MLkR16fyRJ0kW/B
	ntmnFOYgDXzIsrdg0HyFo+o9jtU+HuGFiyjYsogeCKD6jUGxvWU/Zd++lp4CD9wxzY8ec+OJsPu
	AG0b4wC4eXc2x5bn2IyRBiFDvpbdHuIjNqNqRFC01ACJWa5tUk8PsC9OQypQT2O3aMx3UdmzsTD
	3dHABL3Ds008P1SPlUFhnvK8/S0/D9+25zdNVgql7IkGDWFPDd8PWW4bafNPSSEEdZaFBnrS1fF
	/Mm2TAW0+Yy/Yo7bIkDLxKWCH3GuO24WPQI5nM5p8JjkBsN8TJ3PWCV1y2QFvKtoNHGqGLe3FSM
	3maVCqHtaMDCDPyKe394k/bZBfEGlwo5FDPyZ/ZYh77HNiCYK9gJmmR7eLjC1vCvKfs8Cut370I
	t76tFs=
X-Received: by 2002:a05:693c:65c8:b0:34c:6edc:f4d with SMTP id 5a478bee46e88-3619ed15f04mr2742791eec.1.1792226696671;
        Sat, 17 Oct 2026 01:44:56 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:8046:55b6:b0c1:1b0d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm13584872eec.16.2026.10.17.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 01:44:55 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	rmfrfs@gmail.com,
	vireshk@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: [PATCH v2] staging: greybus: Align function arguments
Date: Sat, 17 Oct 2026 14:14:41 +0530
Message-ID: <20261017084441.12123-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Align the function arguments to follow the coding style and
improve readability, addressing the alignment warning reported by
checkpatch.pl

Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v2:
 - Rebased onto staging-next.
v1: https://lore.kernel.org/outreachy/C560A15E-6F28-4FC8-8BE2-277B503340AD@inria.fr/T/#t

 drivers/staging/greybus/loopback.c | 3 ++-
 drivers/staging/greybus/spilib.c   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index fe48a687377a..efc69c10cffe 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -652,7 +652,8 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
 		}
 
 		if (!gb_operation_response_alloc(operation,
-						 len + sizeof(*response), GFP_KERNEL)) {
+						 len + sizeof(*response),
+						 GFP_KERNEL)) {
 			dev_err(dev, "error allocating response\n");
 			return -ENOMEM;
 		}
diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index e4d1ae8308aa..c1982f3fb931 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -160,7 +160,8 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
 
 /* Routines to transfer data */
 static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
-		struct gb_connection *connection, struct spi_message *msg)
+						    struct gb_connection *connection,
+						    struct spi_message *msg)
 {
 	struct gb_spi_transfer_request *request;
 	struct spi_device *dev = msg->spi;
-- 
2.43.0

