Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297770;
	b=c9wYg48PuRfQdZTSDT0DILhd6GT5HSAdjE0F2E5Qycv5Tvz5OjzavRq0jT5+bjTZdatY
	 qAt5D0pPeRV7CsObWg5ZG+FeOiXvTI19izVatFzW7uRH8jGx9nHvQSXKJ+BVpr98VUCAq
	 fkYv7dRKI0RPMfhN15n33WwHtFowVFuB5haScNYzRAI9A+BfB+VsKfv/lrEokxgtvVoUu
	 xTdWmAnR3iDtAHTqg6lSBNbkYo7dsDYiNIYYFdI+zHlSoa6IjznKNfnQPVrNE/6pvxUos
	 EzelEhn0e1YBuDPgRD/yQVa6WxgzqkBZj0CZ43Ud3Og4um3NbMuApF9VEoITU7VtoVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297770;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nGbV526QYB4VsnB/uA2p0ZO8WxsOlxTrEargwGdR0Ng=;
	b=O8efA3MwjFBEk5T0/T0oSQ/OB00zrTJdnUR9SINVk69mopxTVXvY6JdL3iYs1FXvH6ND
	 b0kw/DmUbOnDbdxBU7HUETLljVUGSGWaEg4LyfcB/LcBBVYNF2WfLU/y7ePvloPkx7MU+
	 6xeV4AfLu/RTipxu/VBsJkeH/EIEZlaFngE8/dH8YUMZh5KIi3fkcVF94S3cdDQ2iXvDp
	 SEoC3cnMQmzguKy1aF4AC0lScYfqKbgIFtJZhs4KEFbNJDfcBJXn+4AkPXCVv5LHz93nI
	 toZUMhkKqNGht7TPyOC6EyX4mSyMefTtHRZVjusOxzoC9dMqQ2qV0newB+FoyMZ4QNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7AW8eAQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UNg8YmR8;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4B1606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4B1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7AW8eAQ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UNg8YmR8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793297769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGbV526QYB4VsnB/uA2p0ZO8WxsOlxTrEargwGdR0Ng=;
	b=L7AW8eAQWCgJHcPqKtpU+xvkG5PwBM0LUSm2BVoGiqQXrq4rgq249/M5CufXZzQ0ha12G0
	weafqP/sojNX8mJzHzcrpRDv/FVqr2yzPuaD1GAMOZBTrH5i5CFn+BXO5wrLhA4MktFpS1
	ZJl+qqRIkYe6VpO/DQYPBIjp2tvi1HU=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-iw7zyRY9MsWjnvyCk-PgJg-1; Thu, 29 Oct 2026 14:16:08 -0400
X-MC-Unique: iw7zyRY9MsWjnvyCk-PgJg-1
X-Mimecast-MFC-AGG-ID: iw7zyRY9MsWjnvyCk-PgJg_1793297767
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3698bd5392cso887354eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793297767; x=1793902567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGbV526QYB4VsnB/uA2p0ZO8WxsOlxTrEargwGdR0Ng=;
        b=UNg8YmR8fN4vqTR1+WKL5qlPS0PeeyAFtBcdEv4I1HDpeftGPaDRnYRyPuF03RKbLv
         5DvyTi8Gl5Ar/KVOOqkg0vNz6clCQgkAi06AoD2mX40uLTZwDMgWt1v23Ob8NZ4Pf4Lx
         0kjlnQbVNCLr4OBiC/IfY0MY/QT1pJRSKDZcKTXT6RUZ2ryveWMfiUllw9hmvUwGcZdY
         sF2/s3r9V5+CU0aBKmtVxDRvzn4WmPZ0nf+BfLqJbLEcjJ+G/4lrT8GF0Jxe+5/wROef
         X7phx27l5K4SBWl503r5GipUSsu7zlNHjpDw6faf9OB02urVVIU8szS7bE2S70wy6VFD
         BikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297767; x=1793902567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGbV526QYB4VsnB/uA2p0ZO8WxsOlxTrEargwGdR0Ng=;
        b=L/HBH3qB78Nd9onavo5GB6i1i+tLEqPjfgAw3jMkwjcc0Vvk2T+BT9580DRQ7EuRK4
         /gW12hBJ4EYJcmlyCklhv0bLNr4aUkbmVdCw4U4l6gKzN+Lhc+6XN/73PlqOwHWVsFzU
         EuNJxbQx4oPBy2/si2nj6Z3vnMgEEVKVFoUT11xFXj+Th5tXp3u7Q/rs3IVJnTJ7Ay4b
         p4o5dlNV/lYjdezr7JwriVmMMoIxyis2buPGTW4kMGnsyTfHzAgSd7jGbuuP4S1EQzY8
         O8tH7pNeC805wJRzICMWpym6lSCagcbBLcSYZkxEzalV3l1qldyQ6n0k3R44nNUYJRnF
         PRRw==
X-Gm-Message-State: AFq9FYJp9vIAMOwNIrjuKpcZGeBZDZGJZurCttMrYJsqbCvZJlelb24L
	Ayzl0fGxZyHkPaauN07nT75easd/t430hM36VZrNkl1K1gzCMAxYm3U+bZgLf8eZiPfNbG2zPLp
	pE9ecYnTu9109u6mTiADi4hKkn1ylfxEpBG2j5637Eoysyge9It6y9FTcZBO80OvQIpJhR+RZJd
	qqt5j8T5+YKfpRYEj4zD8QQjI4gM0I3WU9ikQLM+fekhjkVlGy
X-Gm-Gg: AYBFou3/xOLclYsXx90cFdYdP2k5jUS+aQLEe7MKcWfwO5sy4ejiYWn3DMrheGEgK2X
	k31xvau/VdJhxlC2OBwpZnOqGrFnfaawD95dw59rzPObm/dqv8zvw0Zj9/VkPfRKs6EqD3qNVxa
	xz5V7LCr5t9Z9T4UOcrnAAZOchrC9gacc66BcK60a5dInFlX+6sTsuVyEBsUTsj9L8nKqT8/+kl
	vZWVKI95PSZY1kaaGBoE1jp/t4xP0ytEA3jL9Kbts+ErUagY5tDzikEMIPU9SgvXdzh8MMtnTEv
	2uWJERefGQbK2QoBBHu8bv6HsSCiZzaqA1BMvx5MGWzxTC1e+wtMXKhWIPQcSqg6rDEEhS/12O/
	qc5jm/FWfUuFOu2EPiy4HJn++slb1s4Gi1x4xXXEVFRlYa19/ew5U+05xCf5XQTts1Xl6FcV7Rq
	kGZoRM8CBoBnf1lg==
X-Received: by 2002:a05:7300:7b22:b0:369:f5e0:b801 with SMTP id 5a478bee46e88-36a30052111mr4245383eec.17.1793297766666;
        Thu, 29 Oct 2026 11:16:06 -0700 (PDT)
X-Received: by 2002:a05:7300:7b22:b0:369:f5e0:b801 with SMTP id 5a478bee46e88-36a30052111mr4245317eec.17.1793297765815;
        Thu, 29 Oct 2026 11:16:05 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm259163eec.4.2026.10.29.11.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:16:04 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Huewe <peterhuewe@gmx.de>,
	linux-integrity@vger.kernel.org,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v5 2/7] tpm_crb: Split start method into a separate header
Date: Thu, 29 Oct 2026 23:45:36 +0530
Message-ID: <20261029181541.99505-3-armenon@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029181541.99505-1-armenon@redhat.com>
References: <20261029181541.99505-1-armenon@redhat.com>
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

The current implementation handles different platform start methods
(ACPI, ARM SMC, and ARM FFA) directly within crb_send().
Move this logic into a new helper function, tpm_crb_start(). This is a
pure refactor with no functional changes intended.

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_crb.c | 52 +++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index d76f9e30f036..148ef5c487ce 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -446,6 +446,34 @@ static int tpm_crb_smc_start(struct device *dev, unsigned long func_id)
 }
 #endif
 
+static int tpm_crb_start(struct tpm_chip *chip)
+{
+	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
+	int rc = 0;
+
+	/*
+	 * The reason for the extra quirk is that the PTT in 4th Gen Core CPUs
+	 * report only ACPI start but in practice seems to require both
+	 * CRB start, hence invoking CRB start method if hid == MSFT0101.
+	 */
+	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER ||
+	    priv->sm == ACPI_TPM2_MEMORY_MAPPED ||
+	    !strcmp(priv->hid, "MSFT0101"))
+		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
+	if (priv->sm == ACPI_TPM2_START_METHOD ||
+	    priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD)
+		rc = crb_do_acpi_start(chip);
+	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
+		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
+		rc = tpm_crb_smc_start(&chip->dev, priv->smc_func_id);
+	}
+	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
+		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
+		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, chip->locality);
+	}
+	return rc;
+}
+
 static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
@@ -471,29 +499,7 @@ static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
 	/* Make sure that cmd is populated before issuing start. */
 	wmb();
 
-	/* The reason for the extra quirk is that the PTT in 4th Gen Core CPUs
-	 * report only ACPI start but in practice seems to require both
-	 * CRB start, hence invoking CRB start method if hid == MSFT0101.
-	 */
-	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER ||
-	    priv->sm == ACPI_TPM2_MEMORY_MAPPED ||
-	    !strcmp(priv->hid, "MSFT0101"))
-		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
-
-	if (priv->sm == ACPI_TPM2_START_METHOD ||
-	    priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_START_METHOD)
-		rc = crb_do_acpi_start(chip);
-
-	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_ARM_SMC) {
-		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
-		rc = tpm_crb_smc_start(&chip->dev, priv->smc_func_id);
-	}
-
-	if (priv->sm == ACPI_TPM2_CRB_WITH_ARM_FFA) {
-		iowrite32(CRB_START_INVOKE, &priv->regs_t->ctrl_start);
-		rc = tpm_crb_ffa_start(CRB_FFA_START_TYPE_COMMAND, chip->locality);
-	}
-
+	rc = tpm_crb_start(chip);
 	if (rc)
 		return rc;
 
-- 
2.56.0

