Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117BA42046F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764088; cv=none; b=cmzYcxAxckL2iXsdaqQGHqelMOtEDwzLEBV8786Tlw5iAPVHEByH0bd/Pg5NileBmMtw72CoblO1bw+zN2SeLM2ITIh8c6WCX6oqjvy1lg2wS677fzVSGcL8z2chqPQSSQVl2wDgJv5tKRLlX/BbXrEv4tMT2S1Ya8k5U4YarPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764088; c=relaxed/simple;
	bh=adQmRDDMdEGHtE5WpnEdo09OXdFUdHwAT/L+LntBHsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHC3SlBLgrpcSTXKpXDugOMp1nzyzQxgSCStZeg/TIQ/weZXKSdUtK/63vTRW7OQYKgi1/OW2byT24GprF8jRRUfuXeRgYdldjxwAGkuftyAGYbgS+Q9HgnWrbhnJdZIT1RhUTh4hAQugtYrcV9jkLZ28YDFU+YENolqEuwMzDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpZyyOmn; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpZyyOmn"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39675172593so980520a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787764074; x=1788368874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZ4cvnua3/lcbY1rMV0XghgCcnC0CL+DamLLaniAE34=;
        b=bpZyyOmnCJmgCgVZBMX3CNnP3aVVc+YYT70KgS+9inyaKNblvSQ6Gwgh128S6y+7Np
         JLs41SiVtaQNTKtoJtAL5yFpbmTNik0O4AAXlkDWhv+1a3agO7uWcws2hVcMlcWBk3un
         syqDlS9QjkMtrdjng6cmqDMGCt2kvOeiKybHw3OqIUVReoiTfDwSKcgZGhkamipE3362
         BoS2A/tEvtaxlhJd55OVg92PEu5gfvuEWdcPiIPimfSZhyaFh0Wk9rCK6KZ34ygcGIzb
         9Sye3Z1CSHriRZkZbk1VNTmihXVwf63vCJt3pw0+d1JkG5NGffvaP1nBPa34JiL5v1sQ
         LSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764074; x=1788368874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZ4cvnua3/lcbY1rMV0XghgCcnC0CL+DamLLaniAE34=;
        b=QoiyCkhV/NugaEC9DcUtjbUnwlAy/0Dy20JgXI+D4aDlep7kv+tWcxy7cd7nqP3V5m
         RpYNTgC1QX2y5Yhn5PzNjbyLXgwtSjJAuWHXCWkPYxK1lu7cLfcFRLHEbrMYHWyQJKr2
         fmNkBqRm9wMh5/7CCCnTjdF0hjMzoVJYMtS9SFS16OQwZ62GP8U4VXrJIy/faLvBdWNS
         yVlZs+ERGuUKFpkRlkzRi9LnbjdIRyal0iap6fJeGS9mGPkJO6xNt4EiidN8YPbqMnOz
         S+FMmhgbcWJMkRFqsEXKHIBNUhnSqAIMLPI5L0CGs9MBTZoW2x3l9DqLDwY8fTDVebeY
         xwJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVbMF2KkiMtUTDd8Pr3llv7HBSofZPf66/Vyh919sy3lpVHuQ+jLI3ugLGotmcGmRNyY6IaRg2wZ9Dmq4=@vger.kernel.org
X-Gm-Message-State: AFuF++nK1KQXaJ/7Fy/8CSZUw91TaiazYGSOFxEc+HuNaUfW+D3NHvXE
	cau7N60ZP9bqMlja5B3qOMOsg+FOOrIOCZ24VlD3wu/h6JLBICoYXnrE
X-Gm-Gg: AR+sD12rnrc1A8Feqj1QSK9Qm36eOUTX+Upx1ysV8OIH0GvsPF3weRYaQ5LYp+5JcP6
	Bd/mK2+kpu7Qlc6yEjqtdCSckK8c32mNLSKN9keG96HblRdg5HuMSRAM9hKeroJKyFWusB/pqAP
	0H6uqNDOz1M4d6WWzq0O788LTwzrBysvW3fTFQS8NmkMWJKHtvwCaopQFhY4/GYjgZh+eEtOOcR
	Zul5J85fi80xbw+Qc+v9FlEPM+pl/fHjQZXOJNFqhm75wMj3TJBY3UFXB5Gjnc5f0CZ74VH/FtD
	v20M+yDxWIMEFiXWzhNXAoTh9oO3OCPO1BGaOFfm83HjQTxb7jL+8/1PVE6GH03v1vicyB7vltu
	F0Vp2y/KU4NS1K8j3ceMLK4RlhoWWLjcZ0u04nlShvBfWiKqZykbMy2AQ8YzY+iSXaDIeCIZ6+6
	8U3IzOCwbf3N5z6K6S3vlHA4412lE635uOAZ7jdmK8GHgUUs7Bv7GfBe+NPUE9qhkRewKBqesFP
	CfcUucOAyFaT9CXhFkLBtTDzj5UNDebywvIochdnIvRPdFTTNuTzljCTo8=
X-Received: by 2002:a17:90b:3c12:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-3966d484268mr19640797a91.15.1787764074277;
        Wed, 26 Aug 2026 10:07:54 -0700 (PDT)
Received: from MSI.localdomain ([157.20.184.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd82sm8945491c88.2.2026.08.26.10.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:07:53 -0700 (PDT)
From: Sanket Sharma <sanketsharmacsec@gmail.com>
To: jarkko@kernel.org
Cc: sudhakar@linux.ibm.com,
	gregkh@linuxfoundation.org,
	James.Bottomley@HansenPartnership.com,
	zohar@linux.ibm.com,
	dhowells@redhat.com,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	w@1wt.eu,
	Sanket Sharma <sanketsharmacsec@gmail.com>
Subject: [PATCH v3 1/2] keys: trusted: tpm1: add bounds check in tpm_seal() before memcpy
Date: Wed, 26 Aug 2026 17:06:59 +0000
Message-ID: <20260826170700.616-1-sanketsharmacsec@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826080405.255083-1-sanketsharmacsec@gmail.com>
References: <20260826080405.255083-1-sanketsharmacsec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpm_seal() computes storedsize from TPM response fields and passes
it directly to memcpy() into a MAX_BLOB_SIZE buffer without bounds
validation. A forged TPM response can set storedsize to 4086,
overflowing the 512-byte blob by 3574 bytes into adjacent slab
objects.

Add a check that storedsize does not exceed MAX_BLOB_SIZE before
the memcpy, returning -EINVAL on oversized responses.

Signed-off-by: Sanket Sharma <sanketsharmacsec@gmail.com>
---
 security/keys/trusted-keys/trusted_tpm1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
index 8f57c6111..d47cb7108 100644
--- a/security/keys/trusted-keys/trusted_tpm1.c
+++ b/security/keys/trusted-keys/trusted_tpm1.c
@@ -531,6 +531,10 @@ static int tpm_seal(struct tpm_buf *tb, uint16_t keytype,
 
 	/* copy the returned blob to caller */
 	if (!ret) {
+		if (storedsize > MAX_BLOB_SIZE) {
+			ret = -EINVAL;
+			goto out;
+		}
 		memcpy(blob, tb->data + TPM_DATA_OFFSET, storedsize);
 		*bloblen = storedsize;
 	}
-- 
2.53.0

