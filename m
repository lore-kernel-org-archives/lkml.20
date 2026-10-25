Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959563;
	b=hgGZQ+bwVHlOtKuwyTRPf6EBgkM3t/Ngp/7mVXJcUK9zQ/wWvb4Vd9JpPA90u/L0l3p6
	 qUSkuZjFxR9vRlh5pN20Dn3bqTiATvXgGzk38z0nMLSefTON1Ue1PjakgsIwPhVTD7yyQ
	 WaHRd5X5oOSyoNbUTM5e7sFp26wgl4wMPAWNjGNDKGZ10jG5tj0N4wYzy3q1I2W2M1+9o
	 DUOFf67r9btPZpkovZmPwA0IixgT9VxlkvGk4BQRIQnebJKfSpg6uSI8uPrr+wp1oiBUd
	 o1EygevQkKb6HTl6jvkdWNVwJrB/sGpilzriJGme6n9a3CWZG9pY0+5yQIAQG0QVaHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959563;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZVwblgn8BYaO2Yir+1yQyjgwaD83vNJgvPl88UMx6rY=;
	b=k/kq9d2739ieco9zF1gU0iwgZJBaTsTP/tlzIVHrOUiif1d/7wmuhlzHaTzH1suxSayw
	 o+/iaPE8EE35yep7dpz1euxKBcaYxqjlR8RyRHttMAAcSAZ6oviF7Jg4XShRmLTFihm3r
	 s3vBuaL1i8ViQ3/GZpskAuJQyL6TAvBOfIFkyrClcGpV/qcvaTlHgLCHhkumJbp+1csmC
	 QBXNwuVhu3fzDbnKLcKx0TRXZ2pgO1xhmZUTVtLWYMDlyU8U2TzlcVgmI7naKypyXza5U
	 OrLbEeIqSIOIE7sDcVCOgOaw0E7fhD0mRPQd/C8BAVMefVU8dlzC4NnimDVN9X7SDDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ajaP+944;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jlwOd8Xn;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3459606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3459606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ajaP+944;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jlwOd8Xn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792959561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVwblgn8BYaO2Yir+1yQyjgwaD83vNJgvPl88UMx6rY=;
	b=ajaP+9442p5wCftcxAOJL0D5fsR+vlXcibCkfBXyShwo4eVb5h4bH2XNXXUk6s2OSN690b
	IBg7rC1JvE/29H38PNbKCX5O9W617IqCcFYO+zT5qRzmYGcBBaVeYmVNLQuQoimZ7pJEek
	r1DKlqHEztbYRog4VGy9469pgzyYd90=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-P2tk2Z5yO2q262YvYlb8pg-1; Sun, 25 Oct 2026 16:19:20 -0400
X-MC-Unique: P2tk2Z5yO2q262YvYlb8pg-1
X-Mimecast-MFC-AGG-ID: P2tk2Z5yO2q262YvYlb8pg_1792959560
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-193b5eb133eso3299185c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792959559; x=1793564359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVwblgn8BYaO2Yir+1yQyjgwaD83vNJgvPl88UMx6rY=;
        b=jlwOd8XnuqKh2GG30zzpHkq+EuKbi/rJtT/yRKaQRrxdUHLwev75bLz6lUhjUnLOE5
         aeIM0rmZ4UTsCXlfC7bdBnp1IRGILMEQ3K17QTyM+Bg28clk7atVBphLNT557kpS8qfC
         fwXDUspvymtdmEOKMwfLkE4OKQ/99XfMLNxkkWdSdjGmks2EtO2AMHQ9sIXBCz143+9N
         5vnPjUg0+8+wrvzIypqx3B+70HvZTl6AUiCHvvDenwJxqPnARQHqbVWJSwTMFq/pQsMG
         bylnojweWal+Xw67HjQpOheMesAfHoIew8Ze572dPOWoY3D4ZFNoZTFiDElPXffVbu1f
         e06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792959559; x=1793564359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVwblgn8BYaO2Yir+1yQyjgwaD83vNJgvPl88UMx6rY=;
        b=tzcUNwSPB8Br+YOxwMfApj751KpdPP0NNKqmrrNUG+RrYMpJ5h/M5ACPqCoVW/ZUNt
         G0YNouIdQa14S0WIKKwKy5eku0EOy3swwNsYU/73yC8hAWIgqV/lznoNx7Azqu0SWRgK
         kUHs/7iHEivTdASXKppurXUaojmEAXyv3LCDBSrWd67n5vdHTOcPqu0kN1RVDJFvdcNZ
         H6XZuyC4eQIom7L6NEDZ3WL9V6pkedhsctMxFh5kUkDLnT8fLTTQD/MIBGe6F3AaJnX2
         LrWyhvJ1BU8Dio8hWmob1/v9nOkd2jWmOA4hB300f5PX191Z32m40KBf+8578JBhf1gP
         SC1g==
X-Gm-Message-State: AFq9FYINZ8jKNVgZQQvEasbIgzP3dU485bbF2WOsiNas6pjcON0dyqha
	KHFtQv07C6y6Tpqhwv0fB+KKxJe6jH9CYT/VdxmndgBAH3CmVToaYSPfrXUS2dA9/T97BKCie97
	LjssUr+Nn1LK9zYSWBrmnqczAzUSr/D0ix1L0+/OsImwLUXJYnSOPm6ZyqG7tm/Th8+X0Vhw0QF
	zS4AUcJ45PEhXR6VRBqAXcaC6T+6BW+TA0zF6xtn2DD6ihr2+z
X-Gm-Gg: AYBFou1LI3gELViJsqTZVcFDHZfj+f3I961EdmtBOdrS7i11h4WxM0Knf4wTB7FQmJc
	8Jr6I3h/KN3NQPvjGESb3xHhD4sauvILiFFnSAGlgD9/5CK1NugrX/Nr+hIOPpshAq1WqUYv5PL
	gGr98UuRTwiKVQ80rRjVP837E/9jDMGXp+dZXZo3c33foWj2AJr0U2AEWNRRg+Sqqi04vsUcxOB
	gGJrpGY2i7fI0e58fT+/WZ/n55Vt5WWJghxwotWgeZDioxW8FyJqEujFRbbgtbQQxAyTjgNhQX6
	BrCfvbtJtTS+Cv2o8rITpnhWau+A9PK3nx31Dw2+fdDCKTb461f4q54UcIS6ICBrjrTR9Fu8qLA
	H1IS+/4FL3Fkir7ehZcBbbPWXrKWlwBCv5eXzp3Au
X-Received: by 2002:a05:7022:b057:20b0:19a:ace1:793b with SMTP id a92af1059eb24-19aace17b02mr6777437c88.18.1792959559247;
        Sun, 25 Oct 2026 13:19:19 -0700 (PDT)
X-Received: by 2002:a05:7022:b057:20b0:19a:ace1:793b with SMTP id a92af1059eb24-19aace17b02mr6777387c88.18.1792959558551;
        Sun, 25 Oct 2026 13:19:18 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm17656169c88.3.2026.10.25.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:19:18 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v4 4/6] tpm: tis_i2c: Use local 4KB buffer to limit memory usage
Date: Mon, 26 Oct 2026 01:48:56 +0530
Message-ID: <20261025201859.221991-5-armenon@redhat.com>
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

The global increase of TPM_BUFSIZE to 8KB is necessary to support
Post-Quantum Cryptography (PQC) payloads. However, applying this increase
to the tpm_tis_i2c driver is unnecessary and wasteful due to physical
transport limitations as pointed out in [1]

This commit introduces a local buffer limit that is used in the i2c
driver.

[1] https://sashiko.dev/#/patchset/20260324071803.324774-1-armenon%40redhat.com?patch=8319

Signed-off-by: Arun Menon <armenon@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 drivers/char/tpm/tpm_tis_i2c.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
index cde0b093ed58..4667eef15ff1 100644
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -55,6 +55,8 @@
 #define TPM_INTF_CAPABILITY_ZERO 0x0FFFF000
 #define TPM_I2C_INTERFACE_CAPABILITY_ZERO 0x80000000
 
+#define TPM_I2C_BUFSIZE 4096
+
 struct tpm_tis_i2c_phy {
 	struct tpm_tis_data priv;
 	struct i2c_client *i2c_client;
@@ -233,7 +235,7 @@ static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr, u16 len,
 	int ret;
 	u16 wrote = 0;
 
-	if (len > TPM_BUFSIZE - 1)
+	if (len > TPM_I2C_BUFSIZE - 1)
 		return -EIO;
 
 	phy->io_buf[0] = reg;
@@ -341,7 +343,7 @@ static int tpm_tis_i2c_probe(struct i2c_client *dev)
 	if (!phy)
 		return -ENOMEM;
 
-	phy->io_buf = devm_kzalloc(&dev->dev, TPM_BUFSIZE, GFP_KERNEL);
+	phy->io_buf = devm_kzalloc(&dev->dev, TPM_I2C_BUFSIZE, GFP_KERNEL);
 	if (!phy->io_buf)
 		return -ENOMEM;
 
-- 
2.54.0

