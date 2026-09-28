Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FC356A38
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557946; cv=none; b=hd1tLYZjO3lduvs1pR/TjVIxKsPFn7rN/B4XkpOyxsobUuhBeCXO65ZakBy+rvXP02BxjNvVIa9qkRuljJYSuB+mrA9Kpu+qYxTNluIpSy49D7DS2Gkgj/2uzlfRL9DEIByejkpGTzc8Izazy+NqG9+/T1jxfCo6lLJXkGv+cV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557946; c=relaxed/simple;
	bh=ka5L0T+crJoJEiz3RZq9V1G0Q0j+3Njce27Rj8beaoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoTacEqUgln1LNLHIWf6oF8CioqnhmWlfnUF+vDcugSKGdJ7ORR2z1vJ31LFOTQMDoJtfS+HKR/lUs3bokLIsjlqxljD/v14w263/MY99H76VXIb1cpJhTYVaQaITJqFQJmmX/GfDgFBb0K4IuIzcMZtQRx80kG6+tJQ4IoFWpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNommUsr; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNommUsr"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1373285a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557944; x=1791162744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGgjKe37C8O7WXzR8vYD3Gt2KMUFwTc1B/YEqcfdSWU=;
        b=gNommUsrjxTH8d0z06ys1uhlm9hHoVdmO54W1aQZ+dlYyyECev0UofiJb3DLV5d2f2
         /tvNFkrDNOcSMfCtR0MUCoyjB/oTxdD/zwDWU1sGmMT9j498PVL1aDKnVnvx0cE7YwDY
         BfW9KBKCZep8o1X1LubQVyJizVfUFpWKL99dSsmbRBAZefBjEpWllrLzwY0yFuIKTZrX
         IgNU/985fEDfEIlY8cqNATRwH4vI8sJU977Aod6PIwsh1eoamyZa7h/3F4uCZL6Rd6xk
         AepArh2FQHaOV/4OPU+NjQ72Nfy6al+g4FBoitzAUFsavhaOCH2h7tKfQRcDpL3L4MRo
         lwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557944; x=1791162744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGgjKe37C8O7WXzR8vYD3Gt2KMUFwTc1B/YEqcfdSWU=;
        b=ArhzD6mybRge6Rt8yoeAkkUnAWOGZ79iTWQO/+cOvkwdCfmaU/EDbZxy3DXvHYWToK
         iGhoDP7A2mMDpe7fpconjYL24GdoT0IT4+pHlS0KBwYWry83fS5i9o83+NgJdAU2P6ku
         zttLS9wbGJdOccWUwU5N1XSYHK74oWVYj8b4I225IfCn6MoM9SGAWz4llXrbUjfQvyj1
         M4Z4uOyYf0HFQ6tMgAOvor78hTj3p7vq7qyPl1i5wIvyA0gKOInMLHD7O9m2jSWRF3Bw
         BPaUWM1d6WEPm2m7osYVRgbk2zE2vTGoA2AV2RJ9ZMPksobISlYXGAx0DiYrFMIn8taE
         xeNg==
X-Forwarded-Encrypted: i=1; AKwUvByV3i/KM6p16DHHnVpY+abfQwBj6o0B1rLjiIK9h48nmvfwAMehckldEfpeODeZHl8lI0qO9bj4OdlAIvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk3TKWXVi0Emzo7ioFPKEygW/2snYzLVkGS4TUTtPer6ItBQTk
	AQaWOJFRCpvcynd4vJMRN+q29a2q9zWzoZAaPJxWidf/1usfdwm7tovH
X-Gm-Gg: AYBFou3Mm+xGybG76ZeKq5m6MbT7JJYcsAU0YzGrf9YnLnZFA/6aw9vDRRWzOXnbDFB
	jp/hLFUujfkjl6fVBp8PGCM+XgQg4CiPsVSVZqpDODJgA/JtSLnUfiNP/1yvuuXdEVf1CN41Gz5
	VZZrxssPPsXimWlxZJLqUZ5c3fullR+GhBl+1R7rqDDPFxWPqyQvZS7mbNKk2B5w0b9PdKSKcZo
	mDT0bv49fnoUb9bhX4bskEWCWUU2xWpMZAZn8GeJNHAEupWyMYSHOa1G3cT1kQq6oUfr5yWcloy
	qipo6uA9e2rp2/OTmqOy3vZyOqEf1ji4GW7dzNxZD79zhZWrjBcCrJ7pMHUZHpddwkgOkn6I7ag
	pFkRgdACzxUkHKEn58Hgx1vy06Y6V1bbRPjZcbS/xILrbMWH6CzNzkTVOL9312rpR5hQYUC5mCD
	leSyGBA7CSXZY9bCaX4WaUUJLZ6Y9p+jd11d8mT4O+xJCGbWW9W3iKtmeS0G+pG8echyCFA+F3y
	CjDgg2g4cu5vl14
X-Received: by 2002:a17:90b:4c82:b0:39e:6c68:1552 with SMTP id 98e67ed59e1d1-3a09896ee0fmr8267708a91.26.1790557944459;
        Sun, 27 Sep 2026 18:12:24 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm10425773a91.13.2026.09.27.18.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:12:23 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: lukas@wunner.de,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	Jonathan.Cameron@huawei.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	alistair@alistair23.me,
	djbw@kernel.org,
	linux-pci@vger.kernel.org
Cc: wilfred.mallawa@wdc.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	alex.gaynor@gmail.com,
	alistair23@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	gary@garyguo.net,
	ojeda@kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 07/22] X.509: Move certificate length retrieval into new helper
Date: Mon, 28 Sep 2026 11:11:08 +1000
Message-ID: <20260928011123.450800-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928011123.450800-1-alistair.francis@wdc.com>
References: <20260928011123.450800-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
---
 crypto/asymmetric_keys/x509_loader.c | 38 +++++++++++++++++++---------
 include/keys/asymmetric-type.h       |  2 ++
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_loader.c b/crypto/asymmetric_keys/x509_loader.c
index 0d516c77cc26..174451b93eda 100644
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
index 1b91c8f98688..301efa952e26 100644
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
2.55.0

