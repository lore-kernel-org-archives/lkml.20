Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078793;
	b=C75Ssv1oPCOMtfzi0rug/nHqjTxzoA0xmOHXAwJdPE/n5UJxC4Vf+mNkr3QNMtoakjvs
	 7Q1kbD4dP+i8cw/Y206xe4EarWp2NDHirjso5cJD02L9Jyp1YVk2349HcQhTScGdjXQD1
	 GkOm7X9loaoZrHOCH0xJE94FL5kjM/wiD/GeeDSgApNnPp97hS5Bb06Z6L5rLdWl19uJN
	 47Fi+bHzirbpeNluTHA/2um0A4IQInY7nlVBNVolYTkia2+3KCR5sxxetGALio0BH2mHJ
	 ETfPv+xvIPeoxLCM09s3SPFuziTgtVOEAhwWdCC6YOXDCRcc+ZvMrIzWc2P9fejUdqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2Z3y/YgIqgW/WpidEBgfx0w8AzIW3YmYo27EBzGRl0g=;
	b=qMxyngDZAYZ7WU+5rcXoXupcoFEnhhCPwseLtFX1zzkqGpGrAJKAS5wgDpztGrAVKgtt
	 CzFEYJFvHMlp4MEbhMmwtkkxCbZa414mP+JontgoCje3dYrKRe2p4cu3f9x6q0WnD69M+
	 y242VTqbRfoC4Rf3jPX1BX6T/weUyZnhuoHs2JTeJ8J+nR+C96PUvAITJiG4JVXfNyP5T
	 6b3sLnLW4wAPp9aFwBe7BuQSPQRk3G7tZxurK0gZ14DI+2BoafIYMnnV1sIbUASW/bn46
	 V4kw5Fxu5uPsqJexkufVUUNAhp3m0O8vWIAJngQ5N/+Ct3icgGwSkWKR1eza7bmtdZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JrICPA59;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD31B606A326
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD31B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JrICPA59
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ea1e7fad99so19468825ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078792; x=1793683592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Z3y/YgIqgW/WpidEBgfx0w8AzIW3YmYo27EBzGRl0g=;
        b=JrICPA59gqLNarvkqoO6weEHrW/zx/EtXlFr41nnZZhTOrquJH+7KlJpdvFvK/0UcH
         Dh5tNFTgPHYmXFKvUFewJIi2XvEK8rLKITKXSbOkrM3tI+SRkVR5oEMTKMAZb+VhmfnA
         rluifilPnZR2HrA4S8rDrLOLFcEIqm24Mc/Mp67k+86FnLlq+Pxfhy0Ov5ayl9ME4LYi
         RxR/iKU2aFqvtDs2/s42VfPtOGh0zFNvFu7m57mUq/IEpvdZT6da1uFfplL4oOx2MdkI
         ip7NjXTlg7qYq5uigXCZ+bFxBy6qDV3BeFpncVkIDluMNLte1MR4h3C8r3vHc0TileXf
         1xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078792; x=1793683592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Z3y/YgIqgW/WpidEBgfx0w8AzIW3YmYo27EBzGRl0g=;
        b=RPXrKuIAQE3VvHmZsNEvlhXWJKVwQJt/XJhBCgAq9q1fnFmg2ib79j1edyqz5E+w/j
         ls/ysSen2onZ3FG72ku9GNQt6d8T1qu6SxJWdnM4QPBgrIeIChYKotY8rbhooZITjULx
         QDn8O5agWgX8QU3YqZfUsSHcXdpI3AAfREjAe+SqWiMsKSBJFtP3dH9tr05TZvNr7GCP
         xJX52byecbY4R4H19MXh7qlaSeBDE9OgvycND1ocHXNCD84pVqdxOODwYrvrkvwjvpFf
         i0aU7hs3Rf5kUKXKpuMsPjgyvnPbdopLqviBQUpH7r9gl9tr7qfRIxbl/pG+33778Rhj
         w+sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt6bwWiY1psbSKdQZSLokwAIUfPd5YnB+NC4M+UK+JoydjHacnKV/ga+wEFJdZxQE1ADcEOQKsPqyuCdc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhyc97J+NRfbNdN4hhhd2lP8YBOTBG+hUc7EORS/eHXGJUFfDO
	+CoL2xj7rmzZwSPfnbMhFr62Qq096xCWO+0QYdG25gqMTulW5zdYMQ7g
X-Gm-Gg: AYBFou0LfHMmCm5pzhAVPaVUQjgw/9OGEeb6k9TnfkZffl2MA3keMpJgic2hM66R/aT
	AzQ8hjCXtpu7zw4KtJEODBgv+dTPGVF3oAWw83Jv4+elS8Pm+9CwWzsxIxK1FZeb2rHrh0Argry
	UBlqW1r15djBQNkuUdK3lHVC9a/QWLlOkkArynOxxO9mRiJlersqY5n88B3gAIjC2uoDR3UWvvI
	F9iNLsO9yKuMO2cNGwYToPj9O1WTRydhDrMR6ZkhQozPtF7ypE08uQHraf4SzSaxqUhlQmuNPrS
	NoCTx7qvvaqO+O+rrXgXPyMBIcrw5NoZ9xpJLG1PWTxwTuoBaujioI25QeuUBSa6Pblt77et35h
	yzhvJ04JiSoR1uf47sN4f8AnjVbPsUFhVYyzClGBXB/nJ8DezLWyP+kxtuWWUsUIryh3HzNu9On
	N6h9mam8B+3x9RpEuu/CswEoTheprUTpV7bxSVnFf3pAQ8JkUApdx/m5BJ5VsgJpmt/KhFH86Ie
	2WHqCrXDzjLwoiUPPqyrfnKNJZrZlfgLsTWkgsJIJieLe/p+XkJw25M34ehZNYyy+N25IawOQ==
X-Received: by 2002:a17:902:dac4:b0:2df:b250:ad9a with SMTP id d9443c01a7336-2ea9c7c46e7mr64891145ad.48.1793078791992;
        Mon, 26 Oct 2026 22:26:31 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:31 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 06/23] X.509: Move certificate length retrieval into new helper
Date: Tue, 27 Oct 2026 15:25:19 +1000
Message-ID: <20261027052536.1722081-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
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

From: Lukas Wunner <lukas@wunner.de>

The upcoming in-kernel SPDM library (Security Protocol and Data Model,
https://www.dmtf.org/dsp/DSP0274) needs to retrieve the length from
ASN.1 DER-encoded X.509 certificates.

Such code already exists in x509_load_certificate_list(), so move it
into a new helper for reuse by SPDM.

Export the helper so that SPDM can be tristate.  (Some upcoming users of
the SPDM libray may be modular, such as SCSI and ATA.)

No functional change intended.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 crypto/asymmetric_keys/x509_loader.c | 38 +++++++++++++++++++---------
 include/keys/asymmetric-type.h       |  2 ++
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_loader.c b/crypto/asymmetric_keys/x509_loader.c
index 0d516c77cc26a..174451b93edad 100644
--- a/crypto/asymmetric_keys/x509_loader.c
+++ b/crypto/asymmetric_keys/x509_loader.c
@@ -4,28 +4,42 @@
 #include <linux/key.h>
 #include <keys/asymmetric-type.h>
 
+ssize_t x509_get_certificate_length(const u8 *p, unsigned long buflen)
+{
+	ssize_t plen;
+
+	/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
+	 * than 256 bytes in size.
+	 */
+	if (buflen < 4)
+		return -EINVAL;
+
+	if (p[0] != 0x30 ||
+	    p[1] != 0x82)
+		return -EINVAL;
+
+	plen = (p[2] << 8) | p[3];
+	plen += 4;
+	if (plen > buflen)
+		return -EINVAL;
+
+	return plen;
+}
+EXPORT_SYMBOL_GPL(x509_get_certificate_length);
+
 int x509_load_certificate_list(const u8 cert_list[],
 			       const unsigned long list_size,
 			       const struct key *keyring)
 {
 	key_ref_t key;
 	const u8 *p, *end;
-	size_t plen;
+	ssize_t plen;
 
 	p = cert_list;
 	end = p + list_size;
 	while (p < end) {
-		/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
-		 * than 256 bytes in size.
-		 */
-		if (end - p < 4)
-			goto dodgy_cert;
-		if (p[0] != 0x30 ||
-		    p[1] != 0x82)
-			goto dodgy_cert;
-		plen = (p[2] << 8) | p[3];
-		plen += 4;
-		if (plen > end - p)
+		plen = x509_get_certificate_length(p, end - p);
+		if (plen < 0)
 			goto dodgy_cert;
 
 		key = key_create_or_update(make_key_ref(keyring, 1),
diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 1b91c8f98688d..301efa952e263 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -84,6 +84,8 @@ extern struct key *find_asymmetric_key(struct key *keyring,
 				       const struct asymmetric_key_id *id_2,
 				       bool partial);
 
+ssize_t x509_get_certificate_length(const u8 *p, unsigned long buflen);
+
 int x509_load_certificate_list(const u8 cert_list[], const unsigned long list_size,
 			       const struct key *keyring);
 
-- 
2.56.0

