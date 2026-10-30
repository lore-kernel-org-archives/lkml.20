Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793390846;
	b=1QccE3kIl8auXTs+FHdJ4yw2PJH5vweomxYJgGp6WD9Ig6CUuUhp3qDFTVhD/7dBB8dX
	 StWhBtS5C1LDOwKN8ld+9n4BjsX1VYQ9d/gKcxhhJNy4K2w4NPnretLHatA7XjRXnp56i
	 +6MMPwxRmLNuyFh6dGLSKpurrH7p4WRCVmSTcje/uXF0dPk8NkuW2xRf4DLTqARn1oH+t
	 A46IOTtz3lbhYfO8AR1Vhg1J0+7eojApvSjDciaBJx9U3faSZ8sInb6u6hqQIP2mf5Y/B
	 4bFJKbHag9IMZv2a77WlGykaMDBjbC1QsevIEM1QLfhd2f5pbxKkpwgMI+IvLf2Y5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390846;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FIyfL9uDvA5G877TsSUJf5DkfdA8JI9LDiyEiEfndPA=;
	b=I8Ak4hsZ6tWFnTaxhX8XyMQTp6DZofvKqelfHEBOec1uCkQkgjQVwJoat3gcQJB2LQB7
	 ON4QZxlnjRBQTp5mJauPQHMDA1zpcoJRXFySYU5qGaGvjvici5SLFT1H5yguGL+qJY7vx
	 ROA1U1BUH/w19l5WXQSU1HoP6Zbim1GV831DA5WXZ6XbVkAd+rBN77OqxMbzB10Pn+19F
	 cXpQWiA5EcUHjE3SPWpEipdaeJxYIBMKOh69anbEzclE7Wh5C6NHqCSDRf+a0Xb+zpLLM
	 SABRoMNYXctuLkJYqEl4jZ4K2xHW2dhWSbnAvhQ6kK3IEvOSzK6VR3wTV2nNHGUzxow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AvKRvKB0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h73yL+5U;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A47606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A47606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AvKRvKB0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h73yL+5U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793390845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FIyfL9uDvA5G877TsSUJf5DkfdA8JI9LDiyEiEfndPA=;
	b=AvKRvKB0Frc2x2wseuYGH1KUxvhIqClJMVby1eIv1/OynSTvBzyV+uDWjwf/Ky7JBvCqV6
	zp8+ZsXm0zo4DswT0VchUw/moMoqWFKWYS8ri8oJP/o6BM5EOS0UUx7A4C1GjhHcbvc0go
	svuRxwqSU8Mcxl48tbkMUBeeBl34nrU=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-3Crag1D3My6QJr2wXrGcOA-1; Fri, 30 Oct 2026 16:07:23 -0400
X-MC-Unique: 3Crag1D3My6QJr2wXrGcOA-1
X-Mimecast-MFC-AGG-ID: 3Crag1D3My6QJr2wXrGcOA_1793390842
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so1611720eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793390842; x=1793995642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIyfL9uDvA5G877TsSUJf5DkfdA8JI9LDiyEiEfndPA=;
        b=h73yL+5U76mQsZP2K/+5fJ6sHJQwJdbxg5zD8+M8wAfYl5Mao9OPqwADr0D12sz8I2
         Sbh+OhzsZEylCJSV2hgU76j10exz+KjHUUkXN7z+Z6GPoI2cPvw5E1thAPGketavHCGG
         IO/sRvwkIhZGStg2vneC4JASsf2jnBajvDzRKq5T4vkgMSHabRLDO0+0NKlTLcCOQ3PF
         1bz6FLl3OteUk4ir2IF4Wc4vv3/6B+IQz8QAn77g92Uu0tsLkTOgmFwRta3+mVoViiuG
         yuSMVtdMSy5q90022FjHoj9VOiO1bXtr/raSUX8+qks8MIwo4GPsrLCwEXz86nzDfufv
         rj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390842; x=1793995642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FIyfL9uDvA5G877TsSUJf5DkfdA8JI9LDiyEiEfndPA=;
        b=fijG03MLYtpnC+SxWl/ot9xqVOT2e3QBh60lKcMLpb6b3yTVsZE4sURLZ8VbXjE0uq
         NV/eVFZR6+k3hNHTx6vyfO6C9LNuzKGm+95hS7hT4HcOK9p9oyFp/zPDrVlYMAwMWACs
         c0dao7+Rx/v6teizKxd7AR1Eu3BZNWh7MAyfEOsIz98KUAjiVhXxX2O0MPeXzcCAQFQc
         25sZ+nLV3wR9yRmgquomFESVLBoQ8bH1QYnI+xg3lIdwKUREsJprFgkePl03FliCD4SU
         i27bOOjI34rQ3tCGsCjUET6SckVE1aawA6FdSURhgXVr5PyYaV/AivzOQMAyWwShOLM6
         efaQ==
X-Gm-Message-State: AFq9FYLRDbeiyjCcD5gQHdEm6kg8JZGE8qHyfoPaHnyooHp8m3LAcVlR
	VXtWPf7tknWYAUOdY/6V5uEAun7vFc4rztmMkvXea5f2Nldq/1Ye4ouf48quAE2BxsK5OLgdyWg
	t5bU6NVieMl0zrKyqonLWoNDKV38v2lcNOzwbOjOZB6mpWkadwbnliu1R8xYicUqjFWTfWEJx5i
	sUPx/vEunyysAngQXCNsVIgU5dZfNLHiC866FBa/mpKaqeTqYp
X-Gm-Gg: AYBFou2Lf7AM6h0IE1SWRiTXay4dJw38/t3M5n0KfioE+6wvEkpn2O+JJvEWpIYF1Nd
	D38fkPmMY9rBX8TZGkngcPKkkeNrrajjrwbii44zHxA1WwoQnFTDVZTGt3/JoTFold/al/e4QeT
	q3KvijG2xjxdRRFF9XEkqMhhfcHfpmZuGgT7DNRskLnV/x5qKt29OPXGjfv9urRKpl3Feb5br2t
	rkPNu+XUS41PzemcJLoa2dGZqjERTGeQNUrILHkXSVLh3/SaaQJn1V/pMyz4816x/yB4u7hu0hx
	q1SASu/wUAqJq/e+Epe0lSxxP1bSUSicwgVxU4nWj5alRogah283pENrzFDVA1/bF5Ff1pNvb3n
	wZcCzXCJ9O+fWQZeoWjVGn02KLN99ooO7sLLnY1t1tZeYAYGqEVmoJPH3rpDC985pNwsZDGBpPh
	VpdH7rqdvze5CaJQ==
X-Received: by 2002:a05:693c:87c6:10b0:351:4a80:d94c with SMTP id 5a478bee46e88-36a423e1f4cmr5460216eec.21.1793390842043;
        Fri, 30 Oct 2026 13:07:22 -0700 (PDT)
X-Received: by 2002:a05:693c:87c6:10b0:351:4a80:d94c with SMTP id 5a478bee46e88-36a423e1f4cmr5460147eec.21.1793390841207;
        Fri, 30 Oct 2026 13:07:21 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm10581834eec.29.2026.10.30.13.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:07:20 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v6 7/7] tpm_crb: Implement command and response chunking logic
Date: Sat, 31 Oct 2026 01:36:49 +0530
Message-ID: <20261030200649.357508-8-armenon@redhat.com>
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

TPMs implemented with the CRB address map in the TCG PC-Client
Platform TPM Profile (PTP) for TPM 2.0 are limited to a 3968-byte
command/response buffer (v1.07, March 2026, Table 36 and section
6.5.3.9) in [2]. This is smaller than the 7.7KB ML-DSA-87 TPM2_Load from
the previous patch. PTP 1.07 adds a chunking mode for exactly this case
(sections 6.4.2.2, 6.5.3.9, 6.5.3.10 in [2]), usable by any CRB TPM that
implements it.

Send and receive the command/response split into pieces no larger than
priv->cmd_size/priv->rsp_size. Write CRB_START_NEXT_CHUNK to
ctrl_start after each piece but the last, and wait for the TPM to clear
it before sending the next; use CRB_START_INVOKE on the last piece, same
as the non-chunked path. Read a response back the same way, in reverse.

On top of the previous patch's tpm_crb_send_no_chunks()/
tpm_crb_recv_no_chunks() split, add:
- rsp_size: response-direction counterpart of cmd_size.
- intf_id: interface ID register, read once at probe time.
- CRB_INTF_CAP_CRB_CHUNK: capability bit in intf_id; crb_send()/
  crb_recv() only reject an oversized payload when it is clear.
- tpm_crb_send_chunks()/tpm_crb_recv_chunks(): drive the chunked
  transfer described above.

This corresponds to the backend implementation in QEMU [1], which
reassembles the chunks before handing the command to the TPM emulator.

[1] https://lore.kernel.org/qemu-devel/20260506075813.120781-1-armenon@redhat.com/
[2] https://medias.cdn.trustedcomputinggroup.org/production/PC_Client_Specific_Platform_TPM_Profile_for_TPM_2p0_v1p07_Pub_5643562943.pdf

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://lore.kernel.org/r/20261029181541.99505-8-armenon@redhat.com
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_crb.c | 121 +++++++++++++++++++++++++++++++++++--
 1 file changed, 117 insertions(+), 4 deletions(-)

diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index f0bac9e1f1e8..affca5e95067 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -105,11 +105,13 @@ struct crb_priv {
 	u8 __iomem *cmd;
 	u8 __iomem *rsp;
 	u32 cmd_size;
+	u32 rsp_size;
 	u32 smc_func_id;
 	u32 __iomem *pluton_start_addr;
 	u32 __iomem *pluton_reply_addr;
 	u8 ffa_flags;
 	u8 ffa_attributes;
+	u32 intf_id;
 };
 
 struct tpm2_crb_smc {
@@ -369,6 +371,13 @@ static u8 crb_status(struct tpm_chip *chip)
 	return sts;
 }
 
+/*
+ * tpm_crb_recv_chunks() below needs to drive CRB_START_NEXT_CHUNK through
+ * tpm_crb_start(), which is defined later in this file next to the other
+ * platform-specific start methods it dispatches to.
+ */
+static int tpm_crb_start(struct tpm_chip *chip, u32 start_cmd);
+
 static int tpm_crb_recv_no_chunks(struct tpm_chip *chip, u8 *buf, size_t count)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
@@ -388,12 +397,55 @@ static int tpm_crb_recv_no_chunks(struct tpm_chip *chip, u8 *buf, size_t count)
 	memcpy_fromio(&buf[8], &priv->rsp[8], expected - 8);
 
 	return expected;
+}
+
+static int tpm_crb_recv_chunks(struct tpm_chip *chip, u8 *buf, size_t count,
+				unsigned int expected)
+{
+	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
+	size_t offset = 0;
+	size_t chunk_size;
+	bool expired;
+	int rc;
+
+	if (expected > count || expected < TPM_HEADER_SIZE)
+		return -EIO;
+	/*
+	 * Without this, a bogus zero-sized MMIO window would never make
+	 * forward progress below.
+	 */
+	if (priv->rsp_size == 0)
+		return -EIO;
+
+	while (offset < expected) {
+		chunk_size = min_t(size_t, expected - offset, priv->rsp_size);
+		memcpy_fromio(buf + offset, priv->rsp, chunk_size);
+		offset += chunk_size;
 
+		if (offset == expected)
+			break;
+
+		rc = tpm_crb_start(chip, CRB_START_NEXT_CHUNK);
+		if (rc)
+			return rc;
+
+		expired = !crb_wait_for_reg_32(&priv->regs_t->ctrl_start,
+						CRB_START_NEXT_CHUNK, 0,
+						TPM2_TIMEOUT_C);
+		if (expired) {
+			dev_err(&chip->dev,
+				"Timeout waiting for backend response\n");
+			return -ETIME;
+		}
+	}
+	return expected;
 }
 
 static int crb_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
+	unsigned int expected;
+	u8 header[8];
 
 	/*
 	 * A sanity check that the upper layer wants to get at least the header
@@ -409,7 +461,18 @@ static int crb_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	if (ioread32(&priv->regs_t->ctrl_sts) & CRB_CTRL_STS_ERROR)
 		return -EIO;
 
-	return tpm_crb_recv_no_chunks(chip, buf, count);
+	/* Peek at the first 8 bytes to determine the response size */
+	memcpy_fromio(header, priv->rsp, sizeof(header));
+	expected = be32_to_cpup((__be32 *)&header[2]);
+
+	if (expected <= priv->rsp_size)
+		return tpm_crb_recv_no_chunks(chip, buf, count);
+	if (!(priv->intf_id & CRB_INTF_CAP_CRB_CHUNK)) {
+		dev_err(&chip->dev,
+			"Response larger than MMIO and chunking not supported\n");
+		return -EIO;
+	}
+	return tpm_crb_recv_chunks(chip, buf, count, expected);
 }
 
 static int crb_do_acpi_start(struct tpm_chip *chip)
@@ -502,6 +565,46 @@ static int tpm_crb_send_no_chunks(struct tpm_chip *chip, u8 *buf, size_t len)
 	return crb_try_pluton_doorbell(priv, false);
 }
 
+static int tpm_crb_send_chunks(struct tpm_chip *chip, u8 *buf, size_t len)
+{
+	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
+	size_t chunk_size;
+	size_t offset = 0;
+	int rc;
+	bool expired;
+
+	while (offset < len) {
+		chunk_size = min_t(size_t, len - offset, priv->cmd_size);
+		if (chunk_size == 0)
+			break;
+
+		memcpy_toio(priv->cmd, buf + offset, chunk_size);
+		offset += chunk_size;
+
+		/* Make sure that cmd is populated before issuing start. */
+		wmb();
+
+		if (offset < len) {
+			rc = tpm_crb_start(chip, CRB_START_NEXT_CHUNK);
+			if (rc)
+				return rc;
+			expired = !crb_wait_for_reg_32(&priv->regs_t->ctrl_start,
+							CRB_START_NEXT_CHUNK, 0,
+							TPM2_TIMEOUT_C);
+			if (expired) {
+				dev_err(&chip->dev,
+					"Timeout waiting for backend to consume chunk\n");
+				return -ETIME;
+			}
+		} else {
+			rc = tpm_crb_start(chip, CRB_START_INVOKE);
+			if (rc)
+				return rc;
+		}
+	}
+	return crb_try_pluton_doorbell(priv, false);
+}
+
 static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
@@ -512,7 +615,7 @@ static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
 	 */
 	iowrite32(0, &priv->regs_t->ctrl_cancel);
 
-	if (len > priv->cmd_size) {
+	if (len > priv->cmd_size && !(priv->intf_id & CRB_INTF_CAP_CRB_CHUNK)) {
 		dev_err(&chip->dev, "invalid command count value %zd %d\n",
 			len, priv->cmd_size);
 		return -E2BIG;
@@ -522,7 +625,10 @@ static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
 	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
 		__crb_cmd_ready(&chip->dev, priv, chip->locality);
 
-	return tpm_crb_send_no_chunks(chip, buf, len);
+	if (len <= priv->cmd_size)
+		return tpm_crb_send_no_chunks(chip, buf, len);
+
+	return tpm_crb_send_chunks(chip, buf, len);
 }
 
 static void crb_cancel(struct tpm_chip *chip)
@@ -748,6 +854,11 @@ static int crb_map_io(struct device *dev, struct crb_priv *priv,
 		ret = PTR_ERR(priv->cmd);
 		goto out;
 	}
+	if (priv->regs_h)
+		priv->intf_id = ioread32((u32 __iomem *)&priv->regs_h->intf_id);
+
+	if (priv->intf_id & CRB_INTF_CAP_CRB_CHUNK)
+		dev_info(dev, "CRB Chunking is supported by backend\n");
 
 	memcpy_fromio(&__rsp_pa, &priv->regs_t->ctrl_rsp_pa, 8);
 	rsp_pa = le64_to_cpu(__rsp_pa);
@@ -786,8 +897,10 @@ static int crb_map_io(struct device *dev, struct crb_priv *priv,
 	priv->rsp = priv->cmd;
 
 out:
-	if (!ret)
+	if (!ret) {
 		priv->cmd_size = cmd_size;
+		priv->rsp_size = rsp_size;
+	}
 
 	__crb_go_idle(dev, priv, 0);
 
-- 
2.56.0

