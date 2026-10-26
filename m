Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986273;
	b=4pme1bPZAGEncuHs42VmdgbS2WpsLh9bB5qDXhvBCPCeN7e0Z5Xnm+MblQYSbddJYZhY
	 3URSeTzxuoo2eMXWJD3ATyAuU1z0AMaSOYBjCAYdNcK2oOKC2jZL/Lfa8Mk7S2iI0Inwm
	 LAGRoGAI2c4X2jeV4M7p7jFj0NdY9L8pGKVHRdoXTxFseuVlD4HpUo50XlQbMffB0GZ6G
	 +FG3jN7xMSo6E2ZCN5JpnDFKmo5q7MrqTlc6b+aW+S+ixYjUGWZDT0n6afcDIljMWzTP6
	 ar2aQm4gkAEEOPz1yeOUlUgszW8GGeFb72HWplSRtWmGl8M1uZ+IeZL6mCUtU04vGug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ty866em+IDE8Kl/ELzTlqPQgUH5LRJQ9LdrJwbbw3HI=;
	b=ZPIPBZpEeStIxpr+85fXo6B5DULBcaCfeLikd6H4/qv/Hot6E6s2w9mi7SAKT4Vm3qFd
	 lXiBeehSl75zuf3CTnBiNZH2qm8qjqLBfobOEHAP1e+FdSiif2BUFuxQMAZA/EsMJiztq
	 S6spYRfDlgmv3E0DPU9MhboA5yaXpAsnbSiZ+ee7ucmaecz2QyB5Z+VoAbptvOODV44XC
	 NjEgoQUOuXMIQ4HPRiZOA4+cWLs8q3ixuW3rNOxTXrfEWQv1+LWYJ3X8JiCy9k0Xmm9i3
	 /rmxk8GQz6A/wvJnsvhnIGtqlH3XtH8JYzt1+TpfWi249fKt7IhKr8PL6iSoxWVWFzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l1RuyX8G;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C5606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56C5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l1RuyX8G
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ab38a051aaso21720637b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986272; x=1793591072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ty866em+IDE8Kl/ELzTlqPQgUH5LRJQ9LdrJwbbw3HI=;
        b=l1RuyX8GEV0bCpa61G+o0ylyJeiVQhqDJkrwn60g4MAqXNaC8bUHPU0dsCBy0qKklh
         28hFqb5NnNjtLAbllRO+alo9IpcNzeku8buXRkYUE+et1wj4iQLxr4V6iSEGw+DCVJ0G
         HYBkCTX7JlZDPUkx011n/TdG08LYCjCOF8lsk5Bn6HL6snPP4Vp4Ar6zRNaqvBmJYvcn
         BuEU2qtncHuBU2/9muusyWQfYWl9YlC0aWMkuVTuo5VePsdZwOpLa+zL3RwjZrGf6wO3
         asi+GMBpTpgXt6Vv97acLBoKJVYoWfr8ZUXdRMYs743HedtQgVt00r4C0krmrrbPD5J5
         HHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986272; x=1793591072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ty866em+IDE8Kl/ELzTlqPQgUH5LRJQ9LdrJwbbw3HI=;
        b=QAay5Z27tW+8yULzbWukiwdJYb9PdkKOGwjrICedl6JdlfEQMYmphr4NW5dvIhSkpI
         IvLt0qy1kGPIWhT/9rYDLMm5utz/uM31hYJg2dSusCHMOz/qaJt7uFa3cFxPvIXDK5Ur
         olZ2YGGRzRUw8O+jy3w5THcRRIssD5POO8kDNijf/0dd9mVmjASHZoTt6mBdclbe18xh
         1m9iDalVj1ds0nE15ZTtG0/vJAH79pcbyJp0OzDKljdN6wl41NGWJvwOYdfc2KLV9HRL
         8Y3RXIUQNfAVZXEfk/6uW3TAi6GUhcAnfwpIkzzy9wZg0F560Yb4JwlTbVlUVlVrNg1T
         Dc/A==
X-Forwarded-Encrypted: i=1; AKwUvBywG60bpZkelExQMV/hM2xG4p+bZ+36YwEtAN2+hC7jAeWZVQtz2g7DRN8wKDJaAlG3QDqPMrnFA37q87E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0RtFohZ+E+BbDgG6GZWwD27FRLeTYOLDjddjkT8Vg7MEj3EKJ
	o5ucDajODkwwVAwfmezovG7yWLxjRXz7Ovcg3Z82uV4cAihQPTIVWlU/JiLmJCjJS8NmDQ==
X-Gm-Gg: AYBFou2q5r6PKl4zfBKGKfCIvLeug6PMYuv7QI22ugkvRiXQtzgwwh3FHwmQdSueclV
	OHvR6YiXAZZp7OxkMmP6TfXXW/IOtLePRrK8YXL9HPbuyv6jMyfEk+vwDxm2fiYYwtg9JRzP32F
	tusS0ohCud2EuKhAdQs1FHiNuJOnbxhcFaByjqn79CcFYI2kvBEMPyp3NZ4AtjhXk0MgsKwrwNv
	g55F/MvueNoOnpg4yeYkZgA9diK1+oO8W4BL8wOGGd3U8NvRAt7vtfYMCh9EWvGGles7cQHDqjB
	1hlx6QuLTQaNC4jWIi/JlEspoBfLUbnvgK/GIA/Z6SOP8dpebkWWD828TB9zIcxLO0sl8gk8gYl
	4o/ovR2ILaN2ZvXl1nSiXqHdGRQhXXLAsktSpNmkW2J/vQ8uTWalcrXj0lB7rlO9WQh9DmjWVJ/
	CIUgGrd7vFkP/s5Zrfdc+ON/9Ay7p1LJtPSUrs6LSFSW4vGOfUGwECp3g/+8Z1pJqfQrPhHiCCr
	xVBTOq/ml/Vwz5vM2PSMmx9j8DzJTYNRbQS8jmcYJ1QIGip4NkpDV4g4pZjS2k6c40BbQDMTnHU
	4YzMexbTNUT4jsIRdM+aaFTM9+BRT2aJECDjus8P7nRC3HW19lERuiAPKEfsF0LT7nIcOolaOk5
	mSE4bweU+k6t7YDGv/uZVvq/o6Q==
X-Received: by 2002:a05:690c:a046:b0:8b0:a28d:6450 with SMTP id 00721157ae682-8b166c2b953mr30228437b3.40.1792986271873;
        Sun, 25 Oct 2026 20:44:31 -0700 (PDT)
Received: from thinkpad.tail772c89.ts.net ([2607:fb91:1921:cd8f:7ac5:9c51:25fa:c9a5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166c5d619sm26623687b3.2.2026.10.25.20.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:31 -0700 (PDT)
From: Erwin Pawliczek <pawliczekerwin@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ignat Korchagin <ignat@linux.win>,
	"David S . Miller" <davem@davemloft.net>,
	Lukas Wunner <lukas@wunner.de>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH] crypto: ecc - Randomize the initial Z in ecc_make_pub_key()
Date: Sun, 25 Oct 2026 22:44:29 -0500
Message-ID: <20261026034429.742489-1-pawliczekerwin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928042641.307683-1-pawliczekerwin@gmail.com>
References: <20260928042641.307683-1-pawliczekerwin@gmail.com>
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

ecc_make_pub_key() calls ecc_point_mult() without an initial Z, so the
final Z, and therefore the input to vli_mod_inv(), is a deterministic
function of the private key. vli_mod_inv() is not constant time, so
key generation leaks information about the private key through its
running time.

crypto_ecdh_shared_secret() already passes a random initial Z, which
blinds the inversion input. Do the same in ecc_make_pub_key().

Key generation is used in the kernel by Bluetooth SMP and TPM2 HMAC
sessions, which generate ephemeral P-256 keys.

crypto_kpp_generate_public_key(), KVM guest on an i7-1165G7 (median
over 4 boots of the best of 9 runs of 300 calls):

    P-256:   744.9 us ->  753.2 us (+1.1%; within noise)
    P-384:  1674.2 us -> 1651.6 us (-1.4%; within noise)

Suggested-by: Ignat Korchagin <ignat@linux.win>
Signed-off-by: Erwin Pawliczek <pawliczekerwin@gmail.com>
---
Replaces "crypto: ecc - Use constant-time modular inversion in ecc_point_mult()":
https://lore.kernel.org/all/20260928042641.307683-1-pawliczekerwin@gmail.com/

 crypto/ecc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/crypto/ecc.c b/crypto/ecc.c
index c7366eb7ce1f..6696bf0d90a6 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -1614,20 +1614,26 @@ int ecc_make_pub_key(unsigned int curve_id, unsigned int ndigits,
 {
 	int ret = 0;
 	struct ecc_point *pk;
+	u64 rand_z[ECC_MAX_DIGITS];
+	unsigned int nbytes;
 	const struct ecc_curve *curve = ecc_get_curve(curve_id);
 
-	if (!private_key) {
+	if (!private_key || ndigits > ARRAY_SIZE(rand_z)) {
 		ret = -EINVAL;
 		goto out;
 	}
 
+	nbytes = ndigits << ECC_DIGITS_TO_BYTES_SHIFT;
+
+	get_random_bytes(rand_z, nbytes);
+
 	pk = ecc_alloc_point(ndigits);
 	if (!pk) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	ecc_point_mult(pk, &curve->g, private_key, NULL, curve, ndigits);
+	ecc_point_mult(pk, &curve->g, private_key, rand_z, curve, ndigits);
 
 	/* SP800-56A rev 3 5.6.2.1.3 key check */
 	if (ecc_is_pubkey_valid_full(curve, pk)) {
@@ -1641,6 +1647,7 @@ int ecc_make_pub_key(unsigned int curve_id, unsigned int ndigits,
 err_free_point:
 	ecc_free_point(pk);
 out:
+	memzero_explicit(rand_z, sizeof(rand_z));
 	return ret;
 }
 EXPORT_SYMBOL(ecc_make_pub_key);
-- 
2.53.0

