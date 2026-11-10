Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284377;
	b=BhVm7koiSaeU3JwRkw6jP46CY6bZ6GkGmCaE1YmouYOD4nfvkW0etU5Pmvn76AX9/47A
	 ovIWYDTW+uC/LACpg8yBg0TyyhlpDpKo7c4iqB8cpNzwrHPdFS55fwg0x1IlA5xWw1sZg
	 SMqFz1pIGjispJYccni8ce89sgtD7wlon8W8n9bRatqBJz+L8xOSQC0QIEqJaP6hl3Sez
	 uBDdbDZw9q8rksmI2se2BBIWmvCvnu2bzkQYwqHU+gY5FKyXgsO2Wka5xm/zy8OY3LdEy
	 X/Cedcwm91bKyv6Wxf6HG0WeLukoRM9t/3NFmzf6GhK7Iu/2GpZRffMtDhH3+7VKPuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=akOgOFZaJ6AkC9My1p+5ZWxqR31Lz10lBBUyVueJ0Ek=;
	b=THunJhMVIjQGdhNLpIlwGjYofpkYagqPLrudSKaWBdL8R88yt7WPudZpSlIBEKTFxAhN
	 3Sy8j4hNB6+0n0sAUO61PeCDBHS/EOivXey6C9YSjzHxV9iE+JSZb9KsvU/6YqlMf2mUA
	 /rEqB2QR+pHqsmggdCOxvZ3HRkGuBvPBZ/zmQwsEc5twt8fALHKqWIPQmLR90FfRdcfg0
	 kCWKrVWL6KuWjGswRUlP/OBbwCwlLUfBROLNvG9hGy0fX646m/b1IOBfbzom7s2vF8Frk
	 aV7QIKlVaTctX2FdgTxo1ItrCx2qtTmUePoa7oe633pnq2RfFLr8YOWTBJgPYEGJc0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYW6ru18;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246260A6F7B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9246260A6F7B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYW6ru18
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-18818daa3e7so405032c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284377; x=1794889177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akOgOFZaJ6AkC9My1p+5ZWxqR31Lz10lBBUyVueJ0Ek=;
        b=BYW6ru18H3XBx3AsTpAR8Xqn7UK+BaL7xpqsLxLhqN2QvvOiWbVZxKkyqDcuQPdzVW
         2+gpsIN6qgJie5m6wTOQRhX+fUPxLjgcxBll/ZY5p5UUbL0d50ye8w6dG9XoY+qrh79S
         vVkCKtAvNEplr6QFFbhPl5rlOHja0HaBtUjHnvmCGW4fMecoJaMuo0sRvS36ezUY3TJn
         rpl5lcuLVLu+51qXKbkEETsCX/Rp45x3aXYPZ5W9ze4MZOYCpD/pPMmfcTFNTa4MM7O4
         pVBCqfOAZdqwjRZmG0VMJWPLnctGlbgb+BcQqD5NJ7ofHiuG6bpYKdyv2tR/xhNzr2NN
         taMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284377; x=1794889177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akOgOFZaJ6AkC9My1p+5ZWxqR31Lz10lBBUyVueJ0Ek=;
        b=sNR2YRlsb0zA20IQLHgjZBDWVImMdZkBpkOVvGIwGoUHzauQJ2nqY+AunTOIG1X2ld
         555/XxDOw7khjLZaZZCH1wcm0WzNc28UTG9DeQURbaf/rk4ajL/03infiEpHIl6TpNlg
         U28O/UW9TJ2c4IPLHbq2UUBgs7Tjsk5oTKNCNgv92watGGh1gP64DbEOApP4jSee+BRR
         3ltqY7t+YTZlxyBja8V00l+34oDPkVvdpAmhxUmlJtucaCpnhKMRkEZ9cjcHRPzKR5O/
         qtxTaZSTwRGQraF675yqYCDmQNJw/BSu3LVgFTxne1JTA7be0DlS8S4+cRTkRpzUxBCl
         ODQg==
X-Forwarded-Encrypted: i=1; AL+hErG/FmHXvy0QIeWrwp+l/6eYJdP/c4vrv/0YTYyefjF12zi0AMfbL6q05/HHjyrPVL+Ks82HtDqbLmpxflI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EnSERDCSVKjv8eC/DhyNxqTapQibyQkzYcGtlkx4Mv3jy7E/H
	/B1YMNrIi2oLj/Aj3DHLj3cro7qgaE9N2IcFYERpBdbAMehvByKlhjjT
X-Gm-Gg: AYBFou0hrV9QgKxnRf3psWj33tioxf41Nd9+vJR6nyhmwzhAhGYHWL3pKDpP1N2bram
	mS8M1ktLRJRfEe8Hd2JzJncvHVwJPiPH3xEUzDVdWBGgaeu/rnr/5H0SiBRoO2ovLkEPM6DiRV+
	7fbaLNAmeIaTDQY7Q6pdnXDi1SZM42X8vEt20isCkAp+p05lmxnfY5sv3nGe5oC5Uu6yjd8Wqtp
	aTFsLpKjdfDH3bnqSW2idSq8LgOl7P5XkurHuZCGHUTVMoFE+XpLzqLNW89LQLLV11pM5MRr1Su
	fDtB1ySafgasQGeN6oB5eqvOSXWMnA1x8baoZ0uoZHWJLNDRfmGBzCGPzAsziqfQikMg1EaNzC5
	wyRoYZtGqWxZaKG5ur2rlTEh7wDXc6Qd1Y9qbN+D1YvDl5KBSXoM2yx1/kb+W0878XgpN6NCBvN
	9jhR8RA/O+bAnF5BWT15y9mOtKt97r2L2B2Oidy9xKhy10rXuRA3A5I6ZUq3EsOaf/D29FU77TW
	pfWRAB5d7nZugHmMmknnTffIfO2oQ+4dw4xug8ZnM3kH4SRmHd+do5NyetY5eJRWtvvcVmbL94n
	FxjpJbaiznJbmhaxRZ+n45oe6Ky94oIcYEulr+buh9N+ubI=
X-Received: by 2002:a05:701b:4502:10b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1b3b5e25dbcmr1978641c88.11.1794284376568;
        Mon, 09 Nov 2026 20:19:36 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:19:35 -0800 (PST)
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
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v6 06/25] X.509: Move certificate length retrieval into new helper
Date: Tue, 10 Nov 2026 14:18:13 +1000
Message-ID: <20261110041832.1730924-7-alistair.francis@wdc.com>
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
Content-Transfer-Encoding: 8bit

From: Lukas Wunner <lukas@wunner.de>

The upcoming in-kernel SPDM library (Security Protocol and Data Model,
https://www.dmtf.org/dsp/DSP0274) needs to retrieve the length from
ASN.1 DER-encoded X.509 certificates.

Such code already exists in x509_load_certificate_list(), so move it
into a new helper for reuse by SPDM.

Export the helper so that SPDM can be tristate.  (Some upcoming users of
the SPDM library may be modular, such as SCSI and ATA.)

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

