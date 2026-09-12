Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078683A5422
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789212877; cv=none; b=E6m0026SW5+eNfMWZpm8DyANP/z9pTxw5NsVdrqMHIVkx/DQ2BlyqiRInhLklqt3XObaCHSfoaS5k4HE3kJsvMQPm1ZLFQzNMhsw+CQYnMIBhPjLazWfoPTxijrkZStWC0QiiseOSmAK9UD8hFJYt1rlRF5B8d78YP4tJAImRYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789212877; c=relaxed/simple;
	bh=cC1YOs027YlAqZAqs9J6yM8CSZ469b20i+ByfNS783s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I15fnr1P7lHmYWQA5U3q0GfpxQ11qc2NVxFiyGC8+8uSkzRmagnnZR8j8W3qjgBmwQshwjsxCu63l+yBO1UF1hOzMzar81wXKIjUpK5UIHI1lCQiN3/d5nPb11rz7lcRQRgmVgobFJSXgDKa1fBY+w61uEskrilm+TXknDH2EU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dO4U2jF+; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dO4U2jF+"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso438841a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789212874; x=1789817674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AX3b+/Rd5JBxR9PSq0SxNQZUrSxVi/vmNM1MS2Zuudo=;
        b=dO4U2jF+uWlD0zxfHqXNtLWuweFU8mwlmiEsl4RAgvLMD72o9K25yAm/sUbCEr4JKu
         hG07vrMLF7lnBIb4dMfF+Ba3XHLPKkVZYLKphaOsih+VkEZJGPppu1/sbxoVrsCW9dPe
         uW40yukbc0JrPxBuL6oP8C3DRbTkv7PZs1dF7rqaJqIdBh9VpZq2kjVRzXcKYkgHAiGX
         pvVpajqzP2woWP683xa5j45OSQAhHOCRLNPgeB9bDAa0wpxWTy3FJw5V7oQjzeJfyjZ2
         P1POKPF737kdsKt9LFBzRZLLFOIenJI6lpxhWz0EHzC2czOhkmlcTqv1lVbqOETUyyzd
         lG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789212874; x=1789817674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AX3b+/Rd5JBxR9PSq0SxNQZUrSxVi/vmNM1MS2Zuudo=;
        b=oquY9NGlyL8ioSHtNWfdgm2WcapkG5q9twcP6MF5Q9hrRm/NZH7G4wWKKZr16d5c3L
         qQ4JL5/Z2vEt35NLFTG2e1i6CNtqRlnjHhCZ5ykCAayO9YyYiwbpesnG3U7t+DLSVwJK
         Y9iyv3/fUlaDu4jxH4kSAUM95Iwg3Z3auyDu2OfWRlg8a6cAx1q14dmF0tErHMSbZt2D
         dc3KEtvkcO+vbEZbDBHo1eqWALOIaKFXoVoUxOau4WgPcCMlebU7QCGNjNKTZgIAiNKp
         XDJO+eKgWBd3D5P8iFHfaUSo3O0CatOEt/wLcBGIptWWA9ZwwW79b1qfOLrGtTOhV7Iz
         SaeA==
X-Forwarded-Encrypted: i=1; AKwUvBx5Whde0ZJQOkRHOKh80MiHakRMYxqqSEcZrGOu4Yf1NEEVetNrLxLC7rB5uwOjT+Ik45tpvcdibvO0xNA=@vger.kernel.org
X-Gm-Message-State: AFuF++ngRjTlSppSLFdIuurQV/uYaH0Qx/2OYjB6fSd0eMhd7JjwDDGY
	3kGNt9/2uSED5u6rD7ZqBH4F7AP0CvrPil6MQrR/gplcUADrB+77+5NQ
X-Gm-Gg: AYBFou3oSeLLgyRs1i5+7l1yPCYNGlsz44YxzDtZoa3ksO0HedhLK/lnZSWrTkNu8cm
	391XSTmc3rLzW7PBRcwsPxzhVsocKD5Q426XRHzpGDdy+4tNg0jSsHVl8ZQ//RlKJv9cL7G3p/W
	JvQIaOdi/tzELm3m8WSbxboLcxu68SeZRdL6aGKrKT+Nppk7JhO2K497UIQSdY3PNjcE927ET3S
	fq2IHZ7rc6vD1TLJMWLxnsP4QXX4gLOZVgzKUV5pOi7sBtQR42YvyI/CrTZ4InKFTrRcBzIxDla
	rfXawb7043MG7gLEzDlceFONK2QLXLttutbvKA7MA57SC1rRWjBvbIQLRMuPj9zm0Q4rnh9DDDj
	H2qonwFES0sthHIELT0lcQjabATN06NQHMym2D6AJAXalfMatjT8cKixixnyTcA8KYzXrrtWlPh
	+W9FUmhiTbj9HXyswayKmXuyMTk8Ga1WhLLeG52wMvBLS0PCqsolCthg==
X-Received: by 2002:a17:90b:1dc9:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39d9c0b79efmr15378795a91.13.1789212874173;
        Sat, 12 Sep 2026 04:34:34 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95752809sm10046220a91.13.2026.09.12.04.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:34:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ACPI: SBS: Fix NULL pointer dereference on allocation failure
Date: Sat, 12 Sep 2026 19:33:55 +0800
Message-ID: <20260912113355.644238-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpi_sbs_probe() jumps to the common error path when kzalloc_obj()
fails, but platform_set_drvdata() is only called after the allocation
succeeds.

The error path calls acpi_sbs_remove(), which retrieves the unset
driver data and dereferences the resulting NULL pointer when locking
sbs->lock, causing a NULL pointer dereference.

Return -ENOMEM directly when the allocation fails, since no resources
have been initialized at that point and there is nothing to clean up.

This issue was found by manual code inspection.

Fixes: 9460eaae2ee42 ("ACPI: SBS: Convert the driver to a platform one")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/acpi/sbs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index 86b7c7975852..4b84b3cd11e3 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -639,10 +639,8 @@ static int acpi_sbs_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	sbs = kzalloc_obj(struct acpi_sbs);
-	if (!sbs) {
-		result = -ENOMEM;
-		goto end;
-	}
+	if (!sbs)
+		return -ENOMEM;
 
 	mutex_init(&sbs->lock);
 
-- 
2.43.0

