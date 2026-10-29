Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297787;
	b=IPjSBxZCViCiodlZLDbkmnwmDZjDyLw7neVUTw3PxDk1i9DpeSm+E3ep/zkZLuuzPV32
	 i7Z6bQNi8pB9X2kDhdjtE6dXZ5OWDR1AXu15P0QiHEd+bnxTYsXx2GGYpoOau3ZVS0i7s
	 du7MMerAOf984o4FmzF8PZcBSAWqmWS2Y8AxtqLGZl2cCpCsLa5pFDTPUqg3MuVniwL6v
	 KAWgLnr3DO8W8SBSLUdWLiUNjUVrjtjlUsGU8q67GSqTFPYk4JMKVO056wrT/jYRiCEDE
	 EpzSnMQjjHkLQWmkL1GtpuwNK2tUSLw7Y4FVqNvbxpUmvkIBA8WgcRKnPdZX2X5cknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297787;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+i6F46/tXcylsBNxFPdwtmDz3b/c8K1JJTOkI+5K2yM=;
	b=2Rld1Dehpz8+n4crPUhdAC67dJtMc/RrKviVMqctJwaGbEDVyWsBRbd7tddSHVGHdHfm
	 ZGDSQkPVT3bfa+vGURJojfPskSPZRWks/0L0YF44v3RpUOjXZTg7WjWGyn9u618EfXA+3
	 nMMLXBo25Kh9KuFhU8AfqW//xDaMQQx6zS2r9XhkFEuZ6mAujTMeuqPWNU8AgCdNFw3Rb
	 5rLybNH0GEbmSPN7Hq3oge5eeAARdP9dWOjLPOXbobTqqFnBZAvVERC0R6iCGfaKVAH36
	 KAckJU8kW/aqSHJdKfd22BiI6nxjfT1adirV/5KElynRF6U6AfjpHuk1QTZS+TewzFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a4kjX6Hd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XHcpRs4v;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33BB60A2618
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E33BB60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a4kjX6Hd;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XHcpRs4v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793297786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+i6F46/tXcylsBNxFPdwtmDz3b/c8K1JJTOkI+5K2yM=;
	b=a4kjX6HdafL8Q/bPg2kOymi863GuCiGRKJ6xWJwtYRYQzSLXjtX0vRao9O2qovWYKe2w4r
	7XcA56d3KDgwGLe8wMOM0vCD5XFvpOuGply5cKfUOXqhYodRaRXL/Qo6traaqI5DJWnD8I
	OW52nn5q0/pBHG5CZrZqM1ERvtvqGHw=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-XWTOAT1uOsqkMhzhc-WJOQ-1; Thu, 29 Oct 2026 14:16:18 -0400
X-MC-Unique: XWTOAT1uOsqkMhzhc-WJOQ-1
X-Mimecast-MFC-AGG-ID: XWTOAT1uOsqkMhzhc-WJOQ_1793297776
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a190c53a3so1408713eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793297776; x=1793902576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i6F46/tXcylsBNxFPdwtmDz3b/c8K1JJTOkI+5K2yM=;
        b=XHcpRs4v9e6IKkcg6yPQuamvVd/wXUkndgLdANzw9E3bm2a6nd6YIhzQLmpTlFh1zP
         rTdXmw9Vkhu4CTiKtv67rrh9VezQGgD1J9KagbhfsrWrDKnERbqlugSObI8I1xIgA/IJ
         0x5Lzk3H4zSheH39PE+eVupp/XmJT6kjey10ln9NKUpA1WQxIhbjyTDRJvBOyMxf4MPK
         AxmwgFF30WVoICjLJBsRNXin9e3+buNAZl/HPVGeYUzxvGfQRxj2go52C+H/bjVVLxFf
         0hsher/8gzcxCuzdTUFlxg4c4tD7W7OWRa8ehXGl8ddAIEki7frvTmiaFQZLorBImmDs
         hS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297776; x=1793902576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+i6F46/tXcylsBNxFPdwtmDz3b/c8K1JJTOkI+5K2yM=;
        b=z5N+RdYLhjumYhTC7uN0adAEV3H6v8nkGfEltp2AfD5PcycB/+GyI453ekMzuszUhB
         +4WBp9rf1rtqrA9N/V1c8WzDoLSvAJ2DvFeec5c+sCh41Svz/YIEvXWS96uZkdQQrOl+
         cqiim4+xir6XDUK8Exw/MCXMRFS2L6t87a+/PQ//DQj48X6eFlTGsGq7ndVkJkqLZsEF
         lPCHGoR/7p85e/EeRTkfwRqaE6qc6uCNcLzFD9e0bK/6da37RcCkAMWA57KM0FCxODmL
         cXlCCl4L/v4+2E8Q26MiLHXADTympclXaiSuSfA/Lqlptuk1WcFLz1++y5hmRU0HywGg
         VXQA==
X-Gm-Message-State: AFq9FYLsX22rb+8NbNEIQj3jLw+g5WPshKXAR+9CfgpqSnRqxi4zAukr
	bKudGI4KP4O5Vqvb83UX2jonmlMCJaC7J6H70ldlziXJVR9+eK5LMIJXYB1rS2QLrLDxwdCPscn
	4mvps/c/LPadrBxjkhLLz4RboLhP8eyZDTmrHPqASAAWJmkVW7bAIvH8k0aBayvZQDDxaZsuSpN
	LRG0gEyk1tHTaNkPUh/9ALf8jC1D9YyRZf0mPEKuMc0za+i6jb
X-Gm-Gg: AYBFou3vd/zlFoYUaU9sJoz43ioc69hgdh2JyQETAF0mZbJf7rm19CVoUpCqVTzlTdY
	qJDtdeLQhP6X4U8JHjW29yKlUUZzZFPE3xJmxJ2V6hDq5zdcMjqj8xPzpsHFQ47GUDNe48moH0l
	og3oVgg0tqKLO3MVBcx1G4YxxCAOlMOekDHSe3ViX9hUecKA+AFxmToihCqXjtLkLi5E2QD1fyK
	xKa13Zxgv89/bk7/cia0RBkv018IwXHIfUZZ9qYscqWugUd3/jN+dwONEirpQmFNaofzwuVD+du
	V5PWmuVJkrGC/hKmNEDSRf24BIhdnRubxrWnHNgA5IcLS2pk9jPlwnxJNQMnYhoqtwi3/tevjz9
	IE5bMWxulyw4AnzW7MyvAdpPBhTfpcg5Rg0jb4nSP2fAwbUynpHxRtZaG5dxCd2iJ5SRSNE0LZw
	rb9tJZvjU2TQRoyQ==
X-Received: by 2002:a05:7301:301c:b0:367:a092:3c73 with SMTP id 5a478bee46e88-36a3002ed72mr4310898eec.12.1793297776124;
        Thu, 29 Oct 2026 11:16:16 -0700 (PDT)
X-Received: by 2002:a05:7301:301c:b0:367:a092:3c73 with SMTP id 5a478bee46e88-36a3002ed72mr4310858eec.12.1793297775404;
        Thu, 29 Oct 2026 11:16:15 -0700 (PDT)
Received: from fedora.armenon-thinkpadp16vgen1.bengluru.csb ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm259163eec.4.2026.10.29.11.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:16:14 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Huewe <peterhuewe@gmx.de>,
	linux-integrity@vger.kernel.org,
	Arun Menon <armenon@redhat.com>
Subject: [PATCH v5 5/7] tpm: Increase TPM_BUFSIZE to 8KB for chunking support
Date: Thu, 29 Oct 2026 23:45:39 +0530
Message-ID: <20261029181541.99505-6-armenon@redhat.com>
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

TPM_BUFSIZE limits the TPM2 command the kernel builds before handing
it to a chip driver's send() callback. TPM 2.0 Library Part 3:
Commands v185 adds ML-DSA key objects and the ML-KEM
TPM2_Encapsulate()/TPM2_Decapsulate() commands (sections 14.10,
14.11) [1]. NIST FIPS 204, Table 2, gives the largest ML-DSA
parameter set, ML-DSA-87, a 4896-byte private key and a 2592-byte
public key [2].
Loading such a key pair with TPM2_Load, plus header, handle and session,
comes to roughly 7.7KB - more than the current 4096-byte TPM_BUFSIZE.

Raise TPM_BUFSIZE to 8192 bytes. It covers this command with
headroom, and keeps every kzalloc(TPM_BUFSIZE, ...) call in the TPM
stack at an order-1 page allocation rather than a higher order.

This matches the largest parameter set defined today. NIST has already
published PQC families with larger keys and signatures than ML-DSA
(e.g. FIPS 205/SLH-DSA), so a future algorithm could exceed 8192 bytes.
CRB chunking, added later in this series, does not change that; it only
lets an already-built command cross a smaller MMIO window in pieces,
it does not change how large a command the generic stack can build.

[1] https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_3_Commands_Version_185_pub_87a5c10230.pdf
[2] https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.204.pdf

Signed-off-by: Arun Menon <armenon@redhat.com>
---
 include/linux/tpm_command.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/tpm_command.h b/include/linux/tpm_command.h
index fc446a1282e2..4ad11068b090 100644
--- a/include/linux/tpm_command.h
+++ b/include/linux/tpm_command.h
@@ -434,7 +434,7 @@ struct tpm2_context {
  */
 
 #define TPM_DIGEST_SIZE		20	/* Max TPM v1.2 PCR size */
-#define TPM_BUFSIZE		4096
+#define TPM_BUFSIZE		8192
 
 /*
  * SHA-512 is, as of today, the largest digest in the TCG algorithm repository.
-- 
2.56.0

