Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4D3402BB1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764103; cv=none; b=iZp6uaPWFWvF4z0DjigpVTqIsYvvJ8+3HtjEGXrfCfYlL58R2EqNbWvFJN6SIZoU2JDaLFUWy7uC3E9lAj6C2GktWFkUkDW/2PIc9/MaGjIH3ct8BJcaTEP6U2nDXjRjFQ5+JXz8fRA0IdOEhTAOqyCKJRbNE6Q2mz6UtHfB7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764103; c=relaxed/simple;
	bh=vdAY/faVLh29CfLHLgVsNnTrIBvl2WSvEe0RVJF/UQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7Blm3ohAvN4YBjD7z9VQ7ykVs7CHtDHVTIb8wtaDSKUOFU6CJ4h7i9Fkn4RW4tGeZpwL7XCxMdLDMx9ZcDM7x26AkhfUkYb1tq02/1/RZ+N72/pxzGbEEKumqfx4vj26q+vjN9/K3PPebH544HTuo9D7YuWpVI+hRwSa8lRGxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h97C8WWv; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h97C8WWv"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedf433a99so1042399a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787764081; x=1788368881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7Y3/aUaSMSqtnYOcW/WwHTgglCUuyrDSlF3Z2YzqPY=;
        b=h97C8WWvhPhI4zdzTjeXFsISyzxpH5ZmrXuuRLkyr/KGHENwOJoALsYoLdpzqr7Lv3
         nNZReTVaEJeF3koK850Mpf/t1haMZ5tqHU9auIwo48bU9DvNC8C+m2Cy4kk523tFK/iw
         G27fa+Awe1aEFepd554OOLqZ7KI2JaPb0NIgRq31Vk0oacmnGnx5c6l7N1f8uu6AEs0u
         VFTGEXIjvagyyXflUC+wdNhQIakFpfuEdRiUWNzOZyQ/8/qs2spv795pMTha0KbmX2Ar
         zDVe44XEWqJOEhkEy6F9aJbOQY0uO907+xiXmnqP9/GpNsij8BXuu0aWW0K+RMbsU5hy
         CvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764081; x=1788368881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7Y3/aUaSMSqtnYOcW/WwHTgglCUuyrDSlF3Z2YzqPY=;
        b=nKeDt8jfTtUjApdzxqs+yWEZZP4QJLk8xKbMnFucScH832bM0V6yRBRy/1JrxXAS6r
         opIOse0msW31LPBRBM6VSA7OOph+00tiBhxXh2aj6r5jnilcadhTzSuOutRLLVIzbdhy
         iXU2kqrG0GfH2AS4mWzj2c8nGkYvkO2UL3tkS7SiB4/A9pUFgbRZ/iofozpezzYvJmPy
         gSXj76J1xpwS1tOOxqepul+A4/jvMtq8iGw99MaO7ybaEZLsSC3Mx6fnAjMwOwult1pA
         gQZR48eiYetSgH+DcjEPeWEhyFKE5i2V9VFDubSn8n9bsKI8QJ6KInS4rtMcLQgWUBus
         k9lw==
X-Forwarded-Encrypted: i=1; AHgh+RpTCiL1m2zEL7KL73+tUbGWrrfAR31VDNtjQe1eGi4N9fvFAdaWYJDzwQ6thbzPj5OVgW7PP6KUe//gwTA=@vger.kernel.org
X-Gm-Message-State: AFuF++l+CvMbBZCxqlCS6a9m9oo9ZjEftPGykS18Rtd14HQkuIrW7a/0
	wRfYynklDGjpKqnyn/RRptn8oPBrRq22Hoa5IGe23Sx9SHRWbbbsqiRt
X-Gm-Gg: AR+sD10OysZj0SaDXxUmVKiklTWbiP7RDYknGeJVA7u8/OBGNgKKa4r8Nhd/r83nyKD
	p3FPA6aHsbqER5zxPABk9Rn2HaanlzHA78GUCmTUAx2P6RSKKx2Gbuv+qI2BVvGNaANoqFWhpRD
	q28ez5OwrtXVNJ4S9eJ46kfRXzafK7n5hOQ2noyT3ktQoErjsaocCm8U+CIlnyjzUnMhzq43x/r
	miNn0Us9fw2MVVBu3IzPIUes5Z/jO0LsFTpyH7097W8fngDGKcoPh7p+gp2ILOgPPyJ/tzh5h9e
	V9sdoM0R8SXSfjcBfpcqlYAcBQvJ5cf22ryNHzna0OaaJ1MTD5Yo70GTSc6TU1D7sSXGeUY8NXt
	zJ3rOtc6rRYuzBRyHTYvshi0UwVWA/Notsf9oDkXFr49SIOYU3GaEPd6LKual/bN2hguPZ3ssrq
	ZWp6YF+qFdS5OKF1CCb7YY+EhprM/sPk55fhXk33pgk5KY+yMWhSkJDa9qJyU2wjHhtqpinrWF6
	5P889HpaZM0gnDP/00e5/q6x+R9aOWS2w5eKFw6PLOJ+pPmbSE8iWb3dQc=
X-Received: by 2002:a17:90a:e70f:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-3966d43471cmr18087587a91.8.1787764081008;
        Wed, 26 Aug 2026 10:08:01 -0700 (PDT)
Received: from MSI.localdomain ([157.20.184.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd82sm8945491c88.2.2026.08.26.10.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:08:00 -0700 (PDT)
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
Subject: [PATCH v3 2/2] keys: trusted: tpm1: reject unauthenticated response tag in TSS_checkhmac1/2
Date: Wed, 26 Aug 2026 17:07:00 +0000
Message-ID: <20260826170700.616-2-sanketsharmacsec@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826170700.616-1-sanketsharmacsec@gmail.com>
References: <20260826080405.255083-1-sanketsharmacsec@gmail.com>
 <20260826170700.616-1-sanketsharmacsec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TSS_checkhmac1() and TSS_checkhmac2() silently return success when the
response tag is TPM_TAG_RSP_COMMAND (0x00c4), bypassing HMAC
verification entirely. A forged TPM response with this unauthenticated
tag allows an attacker to skip integrity checks on TPM responses.

Reject TPM_TAG_RSP_COMMAND with -EINVAL in both functions, requiring
all responses to carry a proper authenticated tag.

Signed-off-by: Sanket Sharma <sanketsharmacsec@gmail.com>
---
 security/keys/trusted-keys/trusted_tpm1.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
index d47cb7108..6dbbf4546 100644
--- a/security/keys/trusted-keys/trusted_tpm1.c
+++ b/security/keys/trusted-keys/trusted_tpm1.c
@@ -201,8 +201,6 @@ static int TSS_checkhmac1(unsigned char *buffer,
 	tag = LOAD16(buffer, 0);
 	ordinal = command;
 	result = LOAD32N(buffer, TPM_RETURN_OFFSET);
-	if (tag == TPM_TAG_RSP_COMMAND)
-		return 0;
 	if (tag != TPM_TAG_RSP_AUTH1_COMMAND)
 		return -EINVAL;
 	authdata = buffer + bufsize - SHA1_DIGEST_SIZE;
@@ -269,8 +267,6 @@ static int TSS_checkhmac2(unsigned char *buffer,
 	ordinal = command;
 	result = LOAD32N(buffer, TPM_RETURN_OFFSET);
 
-	if (tag == TPM_TAG_RSP_COMMAND)
-		return 0;
 	if (tag != TPM_TAG_RSP_AUTH2_COMMAND)
 		return -EINVAL;
 	authdata1 = buffer + bufsize - (SHA1_DIGEST_SIZE + 1
-- 
2.53.0

