Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390843;
	b=tDs5sMyAEJkWH8zJzRDyKZhDR9ihgK/xW6SGMNUc5XtQUTWbuXwGHm7GHUAxciSyxj/4
	 nc2El6dQ11MJFnGbJB/1Pkf7Z1Rmfw5SFltT4K5zWudvPs88Gqc+ZQdqUux5Nn/XrACO2
	 EUu1dqYtppm1xK4fzch18aZLQgdF/U/FyBjHU9dfGTdd1OhsTviM36ujXYt0tAYJ478Z7
	 2vaqsP/GES59D29Sr+T7Xu3s5mBxqESJECiYs1L2HwUfEGNn211TiMcyzUMWxdwHiTS4T
	 WK4biB+rnxtsUnlQqSe3RCUoIxddYtNm4BrZLYlJI4v0IXf3Kr8MNTdfNaW2fPQDMHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390843;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h0iJNfxOXpvZ7j0zVb3aEpT99gOMiKrRT29/xX7pPg4=;
	b=IUw6EJ8TzFNbvbU3LhwTWOtJY3eDXn65+dw5/cvmuv9ofU8nQry3mSV0dLCHHEGLFkRa
	 X5s2eHmVo3asPOCZgZFN3rARvmlE7Pb60FpyMvjSiKOspbFWNPAoAUPtiogDPwmdYHDtY
	 BYiOzwh44Ue0LWe5g2COacY4VFElMTXUKtDy0a3gcDwwh7q20iN1iyulqitysqZrEo/KF
	 QjOFqn2bO4hQmzWHZvhlPpJJ/Qt4/ticHCoD5mTj8DyrZ13LsvDiGq8FFrxTtGSLBTeVw
	 vvT/T0tYV0YbfpFmNfss5qVpEiMG2A0SgQpHbc7eV1tjgWsn/TUTakqsclye3vThq2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GMnRijvq;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PSTO1TQZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCE7606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCE7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GMnRijvq;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PSTO1TQZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793390842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0iJNfxOXpvZ7j0zVb3aEpT99gOMiKrRT29/xX7pPg4=;
	b=GMnRijvqERlur9sWHQ+jQrBrnkxfbhUoVMRigZQvHAKBNoPvjJYKsCSxaMLEa76W7jBKIP
	TUvEHuEvNOXMfgxh2676eCdDzsyKKpAeuFIJgoUBBGfPn/dfCJWUfwchUVbBtTs3t6IGGQ
	e3yoWFoaccNF2HYxLu8whKRatdlnjDU=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-fDKLn4fePHy6RNxEyWTk0A-1; Fri, 30 Oct 2026 16:07:19 -0400
X-MC-Unique: fDKLn4fePHy6RNxEyWTk0A-1
X-Mimecast-MFC-AGG-ID: fDKLn4fePHy6RNxEyWTk0A_1793390839
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a190c53a3so1423959eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793390838; x=1793995638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0iJNfxOXpvZ7j0zVb3aEpT99gOMiKrRT29/xX7pPg4=;
        b=PSTO1TQZo3V9zgZX/8U7xYw6W9VZV+swDKhSG3l1n9dOfZ8W0xEC24lgPL5yIDfotB
         FqYfB8oK+Nn7EbC1dVHUcLaCKoNyJ5Arv1b4PMthiLswoy/hph5cLtViDBPPZ4Dmkmmj
         E7y5lrc01sYzDHuTm/I5l2NfcxdfSZDKju0EPAToGY1+L3RyN/44GRKU07wRsh5P95bT
         AR67fb6ctC/7unrk0EUsXZ0nTl55TIBrvWUmVKmt9gIc3uO8FGulyzExo5Ne7poPcg8Q
         TH56n4WCFo/OFNWjCEUPQQQp3n7EV5xves2YFTks/mof7zICzYB287QDJ/t2UKNra7QC
         moAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390838; x=1793995638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0iJNfxOXpvZ7j0zVb3aEpT99gOMiKrRT29/xX7pPg4=;
        b=o3lBbIc/Yzh08mfLYWdkktNn6tbDdkikCquu3i3MuXqlCxvDLy4av0PSqGzVBHBN8C
         Wcg8uN+yL0VX3eiBrplDmzyA1peYSf8mBpr3wGs2Ds2q16a2NxwJ1zEQgLyAEsvALDg7
         +PvF4FKSqsNnTpVm+VqlRU33/ywSxacj//P6vfiq+s2odY1IsLooDdOWWBV9Ey9CMxYd
         sVsbBFYhRBfUB3zRb+omG05VgXcnYfvTKONP4CI7flFu/ZOng/DUBGVEefeyn7jGHTul
         K571rXeBc+G1qHrPBNepc3QWOU43VzIBiJTaZ7h3KMRRtM4H8Fdh4WWhPQ1v0xSeFc26
         lBxQ==
X-Gm-Message-State: AFq9FYLZlGf6lHS+BkiG+PzTwAHmuruk+7YL9psMYnS1kF/8o3IGkoNK
	C1SiUkpOkOJ5TTbYAN675AVxWuAJLmq+iF3osVLfkQFGYrnT4Yk18enAjdZG87hIpnoTZLB9v+B
	tr4gbpHcY3qf/Al2zW94xsLvjzmtse582Ct2MZaJp0UIgP5szw+vvQpuc6wx/0A3KwKxthzvqgK
	9zmbTvNJNbr11dpKHxp8ongUcinzwak+jBxvej7Is2CPWrJTJu
X-Gm-Gg: AYBFou282XzN5gZMvwjduHX6OV4sLCu5zqyWSHfysD4RZK+z5D4uG8aWXbeGFx1M7/1
	B/fy4mdd1DxwfBx6WxU8hgpich2Z5v76mNMYp/o+nqPFyDotnLY4xr3oxGeDG67aV1qeE3Nprqs
	JQOt25fI2YDmStfkJ7lOgBBytAsewY/DW0OikGtLRQWeOifCwdLXzykZgFpOVF4f9wgoaWoK56L
	MYgvN2i9XkogSbfijBvfP9vdyxIaRCl5NXMtDrj3ZD7OZ+pkoWHXqJ5gFltkDFxvvieP/hwTqfs
	mr5x4/7UrYvSt+KjGMIAZHNe4acS1u2Uz7bbueR3gBoN8RdBWSkVVFF6AqL9lEi3GT6ju2yLul/
	yWAWo/IMUKK7qMncCONdkympjIOc6qEhVuanK7s9zFalG70Jx3aSaImFJw8xGUBvNaMiEaUD7M1
	93e3RgourQdqt8kw==
X-Received: by 2002:a05:7300:f587:b0:35a:3b98:b428 with SMTP id 5a478bee46e88-36a424011f5mr3925850eec.12.1793390838080;
        Fri, 30 Oct 2026 13:07:18 -0700 (PDT)
X-Received: by 2002:a05:7300:f587:b0:35a:3b98:b428 with SMTP id 5a478bee46e88-36a424011f5mr3925802eec.12.1793390837265;
        Fri, 30 Oct 2026 13:07:17 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm10581834eec.29.2026.10.30.13.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:07:16 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v6 6/7] tpm_crb: Factor crb_send()/crb_recv() bodies into helpers
Date: Sat, 31 Oct 2026 01:36:48 +0530
Message-ID: <20261030200649.357508-7-armenon@redhat.com>
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

A later patch adds CRB chunking, which needs its own send/receive
loops alongside the existing single-shot transfer. Move the body of
crb_send() into tpm_crb_send_no_chunks() and the body of crb_recv()
into tpm_crb_recv_no_chunks().

Pure code motion, no behavior change. Also fix the block comment to the
kernel's preferred multi-line style.

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/r/20261029181541.99505-7-armenon@redhat.com
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_crb.c | 71 ++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index 30ca8192d3a8..f0bac9e1f1e8 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -369,24 +369,13 @@ static u8 crb_status(struct tpm_chip *chip)
 	return sts;
 }
 
-static int crb_recv(struct tpm_chip *chip, u8 *buf, size_t count)
+static int tpm_crb_recv_no_chunks(struct tpm_chip *chip, u8 *buf, size_t count)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
 	unsigned int expected;
 
-	/* A sanity check that the upper layer wants to get at least the header
-	 * as that is the minimum size for any TPM response.
-	 */
-	if (count < TPM_HEADER_SIZE)
-		return -EIO;
-
-	/* If this bit is set, according to the spec, the TPM is in
-	 * unrecoverable condition.
-	 */
-	if (ioread32(&priv->regs_t->ctrl_sts) & CRB_CTRL_STS_ERROR)
-		return -EIO;
-
-	/* Read the first 8 bytes in order to get the length of the response.
+	/*
+	 * Read the first 8 bytes in order to get the length of the response.
 	 * We read exactly a quad word in order to make sure that the remaining
 	 * reads will be aligned.
 	 */
@@ -399,6 +388,28 @@ static int crb_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	memcpy_fromio(&buf[8], &priv->rsp[8], expected - 8);
 
 	return expected;
+
+}
+
+static int crb_recv(struct tpm_chip *chip, u8 *buf, size_t count)
+{
+	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
+
+	/*
+	 * A sanity check that the upper layer wants to get at least the header
+	 * as that is the minimum size for any TPM response.
+	 */
+	if (count < TPM_HEADER_SIZE)
+		return -EIO;
+
+	/*
+	 * If this bit is set, according to the spec, the TPM is in
+	 * unrecoverable condition.
+	 */
+	if (ioread32(&priv->regs_t->ctrl_sts) & CRB_CTRL_STS_ERROR)
+		return -EIO;
+
+	return tpm_crb_recv_no_chunks(chip, buf, count);
 }
 
 static int crb_do_acpi_start(struct tpm_chip *chip)
@@ -474,12 +485,29 @@ static int tpm_crb_start(struct tpm_chip *chip, u32 start_cmd)
 	return rc;
 }
 
-static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
+static int tpm_crb_send_no_chunks(struct tpm_chip *chip, u8 *buf, size_t len)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
 	int rc = 0;
 
-	/* Zero the cancel register so that the next command will not get
+	memcpy_toio(priv->cmd, buf, len);
+
+	/* Make sure that cmd is populated before issuing start. */
+	wmb();
+
+	rc = tpm_crb_start(chip, CRB_START_INVOKE);
+	if (rc)
+		return rc;
+
+	return crb_try_pluton_doorbell(priv, false);
+}
+
+static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
+{
+	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
+
+	/*
+	 * Zero the cancel register so that the next command will not get
 	 * canceled.
 	 */
 	iowrite32(0, &priv->regs_t->ctrl_cancel);
@@ -494,16 +522,7 @@ static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
 	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
 		__crb_cmd_ready(&chip->dev, priv, chip->locality);
 
-	memcpy_toio(priv->cmd, buf, len);
-
-	/* Make sure that cmd is populated before issuing start. */
-	wmb();
-
-	rc = tpm_crb_start(chip, CRB_START_INVOKE);
-	if (rc)
-		return rc;
-
-	return crb_try_pluton_doorbell(priv, false);
+	return tpm_crb_send_no_chunks(chip, buf, len);
 }
 
 static void crb_cancel(struct tpm_chip *chip)
-- 
2.56.0

