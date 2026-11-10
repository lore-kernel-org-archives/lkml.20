Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284369;
	b=Rlo3FukJeHC4YFXHJhW32ZdLM01g7uaTKyb0UrmN5JgaBt7CTIOwIElXOAfXJ/gK+Ir8
	 Tq0yOLnrZvOBFoxO72qQaaeVWMKUhc10hbksin5Tr4oRbx/wy3RIENKihT5c5GfJkHxgE
	 1Bt5fqSjD5Z7FrjZroS3FULTGnUYEpA09D0kBMnTH3y8tXnB/FjQK5vy7JtLwE2843kVb
	 vI2jk04tCUUnShS/pohjEH4S6vDHVXy5JK0Dmxje1N37hGtdXaLtpY5wYVPupByiqGY44
	 AFG9rhFSrHheOvOWyKpeOr84AwKvedQEarDttZt3B52oybjROQS1eGfUi9va7FvKNFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
	b=c9OUgwBvV7Visn7plrStZzPhC+gJLGEYT7ijl1oaVzeC2SA0GO/ZgdkMkj8LVee2FpCt
	 6b2AWsla2uu9K16klxomc4eoZgjXFyQAc/sUK2S0rDgGsDshWsuwZRDudX56YIORpINHS
	 krs8vrC43Wux7Kd0tGVSWRLp3/yi6xD6uAipI+MeEMWeerQpUxdRb6Vhmf9i5m4oHfzF4
	 btV1pYktcEX7Ey6YE3kb+1rB2pjo8AEqX/SPQtncZoFm7yTBT/KnzWltETM2r+fFPIea5
	 Hwe5pDYr74Fk9jaD8kAUeYNwu/UAGBn3xe9FWjIBHXb8diF2P0IyM95Tdhv8G7sdhjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWXI6nx2;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A840860A5BD3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A840860A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RWXI6nx2
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so2710006c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284368; x=1794889168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=RWXI6nx2GRh58cVQ3eVAqSiKzpFdhkGcuKrUVqZBTguWwL8ORLFBkqpFpvsZzQAr6f
         X/Bv16dT0jJgVH8v9tpsi8ml2u3NKo3LG84JzfyJR+PNTP6Vz4FBCEnh3wE/VrulnPoN
         d45MtlsnuEnECG87c1Lr5YwwY3DTHN2Y60/Z6kamzxkXxCoV5ICJIbfu3b1QLPPJpv0h
         bvDjZJ6ql5VEcKz2loy1jpu1R4doD4KIYOe8o8dMdZTwysoc63QTufoThjEcBPmF2tVA
         h1vkE846+i+TR+k5UutlaqiTFcqY0tjUa52de2g4aTAD4MWmzmbYCS6vyViMR2XhakZb
         4O+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284368; x=1794889168;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DF2GX2Vr9/zlICZewnCnHZ+XwMhrVOLtr9YXmakaBJ8=;
        b=EOKqPxWQvvHpJJuG+odpL1kTIbYhwmj9jVtLKWA7QVQiLMwkBlXuJi75J0q7oUyXO/
         9H3vfdgxzgf5TOWXm86em1oQwRXHEJ8f9i+/buVHodLqH+HT7I6o3iIn6eUSP2DU3h80
         aGwm4uwvWZPy7qknie+Zr/pVERGTuaH2NjOv/gWCDZnwuvWowXbslMbeP4FUco0FH7W8
         +p1Qgdc5Ih6pnz00xCb+jATAoKGu+i/WLf5uT7rMVxsAVy3uWyiRmY2H16BP0z40Na/h
         7Pq/eOfhAhmgPVDtbF7hf+HoeJfjGpTsDH7Ruxy+R48yjWpWClOLEKzXRDpghGnu0QN0
         kQYg==
X-Forwarded-Encrypted: i=1; AL+hErE02eF7n+lmDMgoCRNFPI0f61IbHgL44Bk2TLoVzO9lXutDsv8w2JuPwmbFLWEKl25MCmcgomPa+NRTjiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kiFUUJ8RwEaaYnsQkXxjKxyi2kOFz4og/Qn7y6BCqLdj1toM5
	ObiRngbx9UnLrMtnf7k7pR9VZBoet67mGMa1uEIYR22EztCAb0Hmd7xx
X-Gm-Gg: AYBFou0+8sSsHepfnDDr+pqfyN8d51ynIpKuxeCNlwkebWcfok798hOUOUVhrOnureC
	NTycoRI0nibf30lILbdGiFjlV0GRHPzp8xJfygnVpwJJxGzCUPDiozDYZ7/7xTIWDhYfV4o3dUu
	n+mCbV7mQvcAEUXibM7GQ34pCmHnROZ023+ltGeDVfqEDgKlUHZceKujqENSiSG8CLPe1oPsBkp
	v99YAVRalDBCf+2pfQos9wy0e/6/8tMpUe3qzpHkkyZ3M6V/QtWFBb/7nwFJxiptqu92l/nmwId
	DMU6f2CxaGed20LEFpAo3ObmjdQw6q4yFILUAnXVuLkHL5CP0LDuPicpEckWILkQXpkrJfNTTqb
	n3wkIGjV8V8Ijua6+nNbqnYoMsugAtR2Gm8Em3kNd/YQECucN9uSjO/ipKCJYDOU5SstnD1521c
	jcBCEzC0MDtFm0FuFC29OAI/LwKZynEKbEqTXWjjV6dbngPYAp548ze+DImnwi6icLcwkbDiy2D
	SsYaGnmw+6OdUBlFAjManMKFam8AS+Ov1qGwPzx8LidDmC2PwV0dh6riAhWvCIDI2lHaTEGayWJ
	WExTLk3/DPEacDO5q7PQ8V6rt6tltSkKGcFMd18759SVOVY=
X-Received: by 2002:a05:7022:ea55:10b0:1b2:6cba:7f7c with SMTP id a92af1059eb24-1b3b605183cmr2161968c88.37.1794284367571;
        Mon, 09 Nov 2026 20:19:27 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:27 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v6 05/25] X.509: Parse Subject Alternative Name in certificates
Date: Tue, 10 Nov 2026 14:18:12 +1000
Message-ID: <20261110041832.1730924-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Wunner <lukas@wunner.de>

The upcoming support for PCI device authentication with CMA-SPDM
(PCIe r6.1 sec 6.31) requires validating the Subject Alternative Name
in X.509 certificates.

Store a pointer to the Subject Alternative Name upon parsing for
consumption by CMA-SPDM.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 9 +++++++++
 include/keys/x509-parser.h                | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index bfd10f0195e01..c3ec2846695a5 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -596,6 +596,15 @@ int x509_process_extension(void *context, size_t hdrlen,
 		return 0;
 	}
 
+	if (ctx->last_oid == OID_subjectAltName) {
+		if (ctx->cert->raw_san)
+			return -EBADMSG;
+
+		ctx->cert->raw_san = v;
+		ctx->cert->raw_san_size = vlen;
+		return 0;
+	}
+
 	if (ctx->last_oid == OID_keyUsage) {
 		/*
 		 * Get hold of the keyUsage bit string
diff --git a/include/keys/x509-parser.h b/include/keys/x509-parser.h
index 8b68e720693a6..4e6a05a8c7a66 100644
--- a/include/keys/x509-parser.h
+++ b/include/keys/x509-parser.h
@@ -38,6 +38,8 @@ struct x509_certificate {
 	unsigned	raw_subject_size;
 	unsigned	raw_skid_size;
 	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
+	const void	*raw_san;		/* Raw subjectAltName in ASN.1 */
+	unsigned	raw_san_size;
 	unsigned	index;
 	bool		seen;			/* Infinite recursion prevention */
 	bool		verified;
-- 
2.56.0

