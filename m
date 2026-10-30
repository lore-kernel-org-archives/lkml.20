Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390829;
	b=pYQ2dgh9Z7iOG9g3T2HyJny2fqdUrVXvFBfdwf58Vp+T2Z7imDOAHNM/Ef2KSCQhmbBS
	 bMoBhjqAD7SacWqMIZiaueAKzSvBuuIfeo7mJIZ8xH9HhgBRcsOc4urK06ddkPKuKzUrG
	 /0RPdSajFWlr4q+X2VDPGAPgqz8R7yb+HWkD4oDLEEd/pSiJn06TvwIWyGS0Zsh/UuSD+
	 i/FVnma5Y0XeJHv3NG/kyD4Y0Krm6E/CT4Yz8WnTLhD1RIQfnAL1vhzqXVl1mg1qYusJL
	 Urs7BpEN4L2W/Iwga3I7JS4XQYayWJBmksiSHTmLWwKhq+9Pekk2hIkklYwwZ2/gEww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390829;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=diYKtmvUk6f9EGCvKIL4rcZkTSpTp+pswHY3Aid0FZI=;
	b=EACx1e1LqmHPk71q4ehTpmiDPW+JQBp1bzTGCKq5PwcHmaVGs5j6gBEUAqBHY4yWvjSM
	 A7Dz+qd671VWejpyex2Ow6E5y2hATgar3QWUkzyaFRQx8dlmyUicsiy2zuyA72ibitFhe
	 ZeDEF8u1tCwZLEs9BzfBunlCJTLNvpVmcjgBRFVlzxSwJd8Vg15d7VPqfwf0rD6KHFOeF
	 PfgMrkjMmJ50POLwkXiiTqFlkT8ExUV+FKK0kyasccS8MfEFlmWrvN6vPUY8mCADJwFar
	 AiCkq4VogTdH3qEgE5Weo5Hr6MCbWIWbVG+OGLjQdIO/1+Srv6nIWN3V+MCARFunPDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="WXD/pDss";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KF+wP1Cy;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF20606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF20606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXD/pDss;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KF+wP1Cy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793390828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=diYKtmvUk6f9EGCvKIL4rcZkTSpTp+pswHY3Aid0FZI=;
	b=WXD/pDssKw+JBRQQQbFQXBI42HGQkl2oxq45RGpmtAZdzg+AepsOvxBbSCyQ79O/IY2ZJl
	rUkjfiqF1/eXUQnuKCiqD8PT+27mOxF8EyHpH4LXZjKpR1k+wMU6CBxw1HbEnOdpJwam+G
	pnppLZ8AKrRQs6JQZ/ildq3Sdzf4MZE=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-1x5bW1arNjKhqRDBEo9Blg-1; Fri, 30 Oct 2026 16:07:06 -0400
X-MC-Unique: 1x5bW1arNjKhqRDBEo9Blg-1
X-Mimecast-MFC-AGG-ID: 1x5bW1arNjKhqRDBEo9Blg_1793390825
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so1834631eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793390824; x=1793995624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=diYKtmvUk6f9EGCvKIL4rcZkTSpTp+pswHY3Aid0FZI=;
        b=KF+wP1CyY+ekATFTzvOVFbPXgD+zSIGY3CPkMz+vxsKmSuJ+ICTZvkN8Lq6W9LU6ya
         rHW/FS/HixbUBIx3cn58oPMyGhI6pf2xTs/ICUQVFS61MRX3Q1Cp6vzndxGGvVCet5qQ
         yV23bIqWN56rRhVpz7I9gDqRIiIoohV0TlD7PwsyO0ftoGRvUrrmeWj3LK+pJ0atY0tm
         3qoMYcPD2IrmGNS+WSZ/ufy1crhR7/p4VzpNOpk93+sN0eryj4s9y95ofDcGUlyOZnZN
         bk30rO927kGGwnF2Mhzx1nPKoPaVFuicYR1+lCIhtOlcWsBPiOn+4tUxFx3M83Oi+4u2
         7Eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390824; x=1793995624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=diYKtmvUk6f9EGCvKIL4rcZkTSpTp+pswHY3Aid0FZI=;
        b=BzlbQhMgrY7BUrl6frvWah3v1r3rwqIOwC+IP6RO7TzXoBINHIstlveELVgjO3vTkw
         tTu0hUF7aQ9e1d/aFAm7ObPd2fUQ1z/ugINXTX8WmoOfD59YxvWHQdqgTyHMN2fR2ubl
         nK/M8Hf6xy14++A8etr5HB6YKkTZPWxqwYMRAqWMF78GZuVMyZlYfg5jE4wmIKmxXcUa
         0I6br47UamLTDu6bXkhqXaD/q+O9/bZXQAHcLPZ0A1I4eF8V5T5RM0UM1EW8I8B142VD
         lQiwyrHQe0TUks331vfRc0me7IS9AoEPPfvuwuPl+CU94DBnBJr+170zBo4cAqJHQx9x
         hqew==
X-Gm-Message-State: AFq9FYL9RjZKYijuaqdW2Q2u5E+VIP2N9QJH5tULHC9SOCoUv5bX0H0Z
	6vaHwVKYBmRvgK++akJGPBFdVxi/hL7w0X/eBNb9SjY8mAPXCW+3Haf1Noj/oC6cLYFwgwYNlwx
	PbDDmPmHqIXupVWQe2o9IqwqRSksR2n5covZ3BtNeP5rmtBMFxdDzR19/GeHmeggZLbmwLuZD49
	bXIjMSwi9YbgSt317/9muKHEURm6enmuxAUpVRcDrcwNSKZGYz
X-Gm-Gg: AYBFou2AukE0epjt0Kog/37H6UWRqZy4b8JtGtOgDdl59Zdhea42yFjoAIe4jjUp5GJ
	UuOPS2WSpJEZUj7pniL//Wxf9fKde8S+SZ15d1PVOMAvdE4qs9cBvsFHFJJWcDi8f8UWBmBz/Ts
	lf1sROPS2zsc64Nhag7mTKhBa5U04DtXNDBzCXy65CNvXnRakVrU+FLmBosPWuLTOe4Q8E8TU1f
	R5KNloGK0AdIRUGQYn5L1fkYD1g/08S2zZwEVdq6Pb45mfGvK3ojVvfKm014M0BJBGyOtbC9Z7k
	bgNR6WPev4q+OfUOolcPhYyiDXMa6ktpnhKWwehUd2MKsLmd8Dozwi/WVFXbqhV9xITFJXe72p0
	/qxXlUjS/38yx1OgAQGp7xQNlch8I5BDGn1OvdlTgZ/0HHpk7+197wBm4CViB+zh0t82fm8e5ia
	Tru//lELWXWLmYaw==
X-Received: by 2002:a05:7301:1886:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-36a4237d9d5mr4756059eec.19.1793390824404;
        Fri, 30 Oct 2026 13:07:04 -0700 (PDT)
X-Received: by 2002:a05:7301:1886:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-36a4237d9d5mr4755998eec.19.1793390823358;
        Fri, 30 Oct 2026 13:07:03 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm10581834eec.29.2026.10.30.13.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:07:02 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v6 2/7] tpm_crb: Split start method into a separate header
Date: Sat, 31 Oct 2026 01:36:44 +0530
Message-ID: <20261030200649.357508-3-armenon@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030200649.357508-1-armenon@redhat.com>
References: <20261030200649.357508-1-armenon@redhat.com>
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
Link: https://lore.kernel.org/r/20261029181541.99505-3-armenon@redhat.com
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
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

