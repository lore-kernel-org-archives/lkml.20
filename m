Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297816;
	b=Z3OtAtSOF8GV+KL1F4t/p2usOPZNclt/cMAP4OUlbcreA7pKEixjqNottJ3q2d3Pb8dC
	 1bVcBLqKi1pOG2o0zvHHYxvvaNhkoUPuKir9AJQlg0FS4KnyIp0BMkoczHsZC70GWoq34
	 Lm3ks1OKbnRyQs5ifCJn5WQJ58Vokh4KSPW4tVl1LpURkwYsz27SfaJiE/MY6tX0OCiIS
	 pvclKHt7qrlI0V+WTK3jajx/hUpRxeOFzPar7yv1uPJJ077ZGY450Xawy1Rw3b3ryVVs7
	 tghm0f2/tj22eRDGwImVyq7HsKfNp9+RoHVXe5rslXUcr9eMPD8jpY5j7fZlGXXZBcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297816;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SbGRSkF9pUn2CydJkzRh5tNHBjPKK+0FwPmwEY8AU7g=;
	b=bIvcpbrIeX8NR/tevWSK0JXe83hog/vfZ6txFkOK4Sa4l5E3NQGs4gp6ANuYeiHh33P6
	 U9oMuBI3I1PZDs22+2HTAF7xeGC6dWkwmiN475gsmeI63VGiUJ1ot9pTSxjbuFfG/v0B+
	 UE1R9E8c8y5vTmT69VR5VloQN6RGkiHtDLcrbifS6M5xveVHYBDZTuQB+YJhLolEZrROn
	 s1DpQ0CUUg9hb/4QBLgiK9xc5C+l8zwzp6U3jOJxqcnlW7wZro8gxLV73Ppihaocw/ENP
	 3eeGgZb2DE3feZ3FHTx9igW2/fFo/v+S7enxNcnXl76qlEJwQXeCGlQow1VcdWotkjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Nfuy/y0G";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tjPXf4c4;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF76606A329
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF76606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nfuy/y0G;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tjPXf4c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793297803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbGRSkF9pUn2CydJkzRh5tNHBjPKK+0FwPmwEY8AU7g=;
	b=Nfuy/y0GUiqd1SUTqkrG3nDAwn1rDG2V0mI+NQ84DAPlOxwCqKLxYKFORd434+4AMt0+jo
	tFs22qUtTSxZ97UVHNFIsnEcBG8nzAmCkJMuOq3xWxLnphT9X3Dh1CxspHQAEtaldJ5j0/
	0lOYnjQxL1nJTas8OPQCmfx3HXXPuIk=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-IlZicZ5oM7KJdbjVgmxgEQ-1; Thu, 29 Oct 2026 14:16:25 -0400
X-MC-Unique: IlZicZ5oM7KJdbjVgmxgEQ-1
X-Mimecast-MFC-AGG-ID: IlZicZ5oM7KJdbjVgmxgEQ_1793297773
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so3402720eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793297773; x=1793902573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbGRSkF9pUn2CydJkzRh5tNHBjPKK+0FwPmwEY8AU7g=;
        b=tjPXf4c4E/N0wwi7tZzaSxj6KmCN2cQIVeWEZuY8sd4bIDaAKBaki+KGcCiRMlDyLM
         gC3nvrtDW8KuT9Pxjv/UvCbvfT3+Tn3RG7CF9BUpJ1kCR8Llhe3p38q7evPtP3KZr09C
         fmIRQehjQajeg4ZA66V54248exrpSOtHpNGK4jqDLvqrQIc2U3IdMfS4HfPYWX64Jq5i
         QB8UpPVbPaYf78rM6oa9C5v41540NVLHIVsDW2xrWtzkUoymwkAsB41U2WYB08/FCLg1
         iqe0pvrUHuvUfHCzXbufA48g5EtD63fjEhLh0TJRSx1dgk5TaTyqS+KjQNAoN4+tEiKD
         M9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297773; x=1793902573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SbGRSkF9pUn2CydJkzRh5tNHBjPKK+0FwPmwEY8AU7g=;
        b=Za6hDz82ClVr032rbLnoaDsUI7FdUrZSwoTnf5n2U2B+U7QhZF0JQYxLohJENq3UOc
         g6bOsRHypIdygupNIfgzaYF4nSO1Sna9shv+CdJXF+weR8EGVNatsRLdD30unLTbBwQk
         BSNARxGpppTqaa8tFfM6eD41ZpMX8NWB/59lZIU3nVdM7H5TPvbma60Jd6GO7DcXnSvk
         tbfNZVtWvIBNeo6Pv/0UENCzA8yCFXqZTTQTR0CcUomFw/tfYCl7xEBCi9H1HF2zb1bQ
         J7n14voWvTpQ55s1VZYb1yY1ADkgukO715HoX1yj51nXzZNBbC8PcOHe6jCAiLPJBOWd
         hY8A==
X-Gm-Message-State: AFq9FYKrUSa90ffcCOqt30w8Cguwr9bvSvimIAq58rOFNoEkZBusPSjw
	8LsL0uHL16GyIxPOvqdXQcIJJsMhQDN+nL4ihvwSibg6bgFt7XvrnJ4zVMGrlxuPEMy18xROdjm
	KRpYEAyCc73bBuRpPIlq5IdHOVaEuBDlLvwDe57nKQV3WYJ0muHLe/5zG9IPUi0DC1ewtls0zSH
	hOnPaKVlSMIONMhH8nGqng6CG8u8rJGxfs6okNvjVbEcmfq3EL
X-Gm-Gg: AYBFou3Mra5d4lkMJvg8Qr4BENCF0iKu3U6ALG6KAUHX6tqv5ui6Ae5bhqL8dgIAp7H
	8Rdfnkp/+WS6En4o+C9NPNAZaIuVrHNTz3BMKAvlPftMbbe0GWeKspEBqNS4mLuvYNoKH8BDpzs
	dCbHE76HwF2mXh5KLEg0CNhmFGoSeUdyc7VPd9mEq/9u4g/pCFusFJGf1MSp6Jp6do+YlEaaGNX
	s9DAFaKPYC34VeNmHH+xB6n14Mv0j87meZUg/gJXlm5PhLagoCu7r3V79YP2xdCX+KUnIrfnHrP
	WAPak1TsB8XusABs3oqfSK11hGHJ5WjVd1HOlVJxVQhjzkftADqqFnGj0diJPbDc0kixAU6SOpG
	wBkDs/uwLOnJC96VObELfA5RdtYNsn4/MaOrBeRVffrGn9Qay0qeT2cGqrrbCOBnDw+3weBn8yE
	HcfpAr50oJomu7Pg==
X-Received: by 2002:a05:7301:716:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36a42453282mr173707eec.38.1793297773087;
        Thu, 29 Oct 2026 11:16:13 -0700 (PDT)
X-Received: by 2002:a05:7301:716:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-36a42453282mr173659eec.38.1793297772238;
        Thu, 29 Oct 2026 11:16:12 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm259163eec.4.2026.10.29.11.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:16:11 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Huewe <peterhuewe@gmx.de>,
	linux-integrity@vger.kernel.org,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v5 4/7] tpm: tis_i2c: Use local 4KB buffer to limit memory usage
Date: Thu, 29 Oct 2026 23:45:38 +0530
Message-ID: <20261029181541.99505-5-armenon@redhat.com>
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
2.56.0

