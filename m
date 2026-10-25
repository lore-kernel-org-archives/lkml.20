Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959560;
	b=KDizZXacNqb+RVb92LK6QLXV7ogqZgI7xLUz9z1JUTls6LDxvUExUGCw8+FPBRVQI/sl
	 ggmq5Nnny2ga2vHzk9hiikcVuDxoaq8a96hR4qrYOKKHAIeZKgRkiTwGLtIzEazhlJ+jT
	 g/QFw2a/0OjpVpPhMY/AjCqlnG3Tz9btVqka99GhQGck3snABWxg0eLefzoz/FxeVLjwR
	 zRKPbUUCvybzz5cf0XSlguMiDGLiX3Y6/B5AkYsnF4bV4EvPnDqrJn7izf6/NdzGukQOI
	 ccJsv25W/dOissjn5Es4rPPfIyt+gr3uEZvK9n9xcRpDDG4DyFXS+Te2iDRbmxEO9Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959560;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CDCto1XEIuD8+bFpZYgUHlrlM57aJmVNdz64GvF6tOs=;
	b=XRYbmuhVGzXFeGGcLSWmkwoTMmG4MSBZ2Yt5Q+vfUi22sBwmT+ITFUECnaWAM+Cfgbul
	 4PC9/txL/SDVTD0HXYj1ps8+0MWRhM/IQvPJhcGfZ4CLlvcuRVjNBpLswyVsDGaJV10ti
	 dMF/Jb4rEh2TYF8Mhj0efTqphkdYxAG32Pex0Mrr6XBsa4U5kL74R4KMWGV7x3AfJ1gG0
	 TPkIk3ibSsTgTei0KBtdXssOM/SRl2r7GFkjkTM+0Aay3Hu1YWYXdLa7JrbDJSgebb+v7
	 5aCi9Et+mGnGl3WyX+OzlS3woZYLRHyBLtSSmtxgd2JW485mYpns6X9F2BH9SxvgI5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IUKEZdcE;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H0gdhLMm;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13963606A324
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13963606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IUKEZdcE;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=H0gdhLMm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792959559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDCto1XEIuD8+bFpZYgUHlrlM57aJmVNdz64GvF6tOs=;
	b=IUKEZdcEHvZRc6wMK9lK9Dl6czKa2d1RHiMARgqwWycTWdWeOGV5RAHhV311+vudIPBN1g
	coSiZx2e2jBE+bZQdBWqZbBcUz8eQAefmsTnRm1bT4nwpRgM2KecTgunfvYNQeaycWBvzC
	U7bto9R0lvSjXNe0vCkLUR22vU6aGSI=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-kW0YbJXhPxOhTPqg38jenQ-1; Sun, 25 Oct 2026 16:19:17 -0400
X-MC-Unique: kW0YbJXhPxOhTPqg38jenQ-1
X-Mimecast-MFC-AGG-ID: kW0YbJXhPxOhTPqg38jenQ_1792959556
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so6895219eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792959556; x=1793564356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDCto1XEIuD8+bFpZYgUHlrlM57aJmVNdz64GvF6tOs=;
        b=H0gdhLMmQBOr9uDMuExHMnwT+vi0N83BMRjp0D4COfCXkrZs9ZTJWr5AL3r2fh/Uf3
         cgSmZnPsN8lAt8ENPwmn9HmCYzQ1vkuJzNw1PcDhhMm9B0xHv+PRlB2WoZ5lk+TEcywB
         HHKI+02TEMir7vOQf06nSWKoy8rzCtvDJ/bS5wkv0qSTV46GDEi22u/xCZmn11k86MAh
         Fj2lZLGfkrtmX//ypTj4TEjwfPE9w7xPTkh6eVBJ+r/zFSZ1uQqTUzGjWBtJ0nDcO9tA
         OLzw8R8BAx/3+xxq2HgCBDG3Po1m9UlkPRo7BFXUICqHXHzdCWvzTaXN0IaqF+Hrtfeg
         887A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792959556; x=1793564356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDCto1XEIuD8+bFpZYgUHlrlM57aJmVNdz64GvF6tOs=;
        b=LRki3J14BUZe0K9KZnOq7qq8b7iCMxY0wcjUQ2vlKeJWCEhlVd8jZfKvXHcEu6iftc
         GWXo41jnP0/xfCgLc+nG5xLrJiU0YZTGu56yMZCGg337+s/13cebeieaEe+ICU49qvP0
         Cy6q+DUyx84f8kweeBT+jKAZvCdRrwIDHglnEnjwfoumiLBXqF0Ac+8ZiXiyqvDLra+J
         eZtnm+rgSnL2CDGEJwC16lJq9N0fAQKEnSZSAbp9oqybO575jzmQGyMUVdCWPmI3xiYX
         JfJuQobzXZLgJPxuYTXcCvVdRg6cjDUrxBdIZ5IA1AKDXg9t8+SE4ZXqcWJF7J0SvdTq
         kgnw==
X-Gm-Message-State: AFq9FYIwFoqA6lNsM98xx5fuoPlhnhPw1erS3EsC//fC7PCX7ocxA1CR
	Y0sNsDaBab6igvu3n2lV2Rq+I8/7GBULcFDD2tRi+W0v7T9lEmx/O5q1TEiXAUBQtU9L4E37xU2
	Stilp1fcrfruzUuIM4lF7zb/hgpASMTqlayQRxtpT1GoURRxGEXfvJnN5Egan/Z30/dAvH1NiZw
	Jyq8/dPrtq4ygekh27EXJDQkDlQ0yAFqXMGnAFfjopVtqhtOWz
X-Gm-Gg: AYBFou3oFZeI7qOjhw9aFZXpPg28MWc4ex7X+3cV2DYEeBEhMDLYo4N5xxFayykVq7k
	rY2NHx8ZLSgUs8us6Bhhoj7evsHfpxda3vzK57iTL8fqfYMQp0m06Xayjv8updh75LxET3VEn1s
	7e1ko52aYjXp2kqIP+BO2O8ktqCiNX3d3HikbSdJdD4B3GYtQfmvIwrwPk0lmDltZyIR/XSR3Uu
	xGL9lVRq+ZbfDBnYlORK1vsOJ66CI+6SzJ72P8P+mDxxABn9KExjZhT/+vE7mmNBYoa9MwGdBmf
	YGRfAcJAawiLE34/VWmR3VOK+rR5LP2dt3d1RQyjbQ6ZjmYo6ykEM/dZfZ4BiIRpBRDVu+QB8hD
	8MFzucwAPr1Fz2EPwlbF46hEp+/xIQTr8yGIcX68L
X-Received: by 2002:a05:701b:42c5:20b0:143:4450:e1e6 with SMTP id a92af1059eb24-19935fcae7cmr7287965c88.35.1792959556225;
        Sun, 25 Oct 2026 13:19:16 -0700 (PDT)
X-Received: by 2002:a05:701b:42c5:20b0:143:4450:e1e6 with SMTP id a92af1059eb24-19935fcae7cmr7287925c88.35.1792959555500;
        Sun, 25 Oct 2026 13:19:15 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm17656169c88.3.2026.10.25.13.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:19:14 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v4 3/6] tpm_crb: Add start_cmd parameter to tpm_crb_start wrapper
Date: Mon, 26 Oct 2026 01:48:55 +0530
Message-ID: <20261025201859.221991-4-armenon@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025201859.221991-1-armenon@redhat.com>
References: <20261025201859.221991-1-armenon@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arun Menon <armenon@redhat.com>

The current implementation of tpm_crb_start() is limited to triggering
the CRB_START_INVOKE bit. To support command and response chunking, the
driver must be able to send other control bits, like
CRB_START_NEXT_CHUNK, using the same platform-specific paths.

This commit adds the start_cmd parameter to tpm_crb_start() so the
caller can specify which command to send.

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_crb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index 9a2f512b4ae3..31f530744e90 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -446,7 +446,7 @@ static int tpm_crb_smc_start(struct device *dev, unsigned long func_id)
 }
 #endif
 
-static int tpm_crb_start(struct tpm_chip *chip)
+static int tpm_crb_start(struct tpm_chip *chip, u32 start_cmd)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
 	int rc = 0;
@@ -457,16 +457,16 @@ static int tpm_crb_start(struct tpm_chip *chip)
 	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER ||
 	    priv->sm == ACPI_TPM2_MEMORY_MAPPED ||
 	    !strcmp(priv->hid, "MSFT0101"))
-		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
+		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
 	if (priv->sm == ACPI_TPM2_START_METHOD ||
 	    priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD)
 		rc = crb_do_acpi_start(chip);
 	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
-		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
+		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
 		rc = tpm_crb_smc_start(&chip->dev, priv->smc_func_id);
 	}
 	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
-		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
+		iowrite32(start_cmd, &priv->regs_t->ctrl_start);
 		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, chip->locality);
 	}
 	return rc;
@@ -497,7 +497,7 @@ static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
 	/* Make sure that cmd is populated before issuing start. */
 	wmb();
 
-	rc = tpm_crb_start(chip);
+	rc = tpm_crb_start(chip, CRB_START_INVOKE);
 	if (rc)
 		return rc;
 
-- 
2.54.0

